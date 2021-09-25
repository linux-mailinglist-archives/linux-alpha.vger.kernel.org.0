Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B143341847A
	for <lists+linux-alpha@lfdr.de>; Sat, 25 Sep 2021 22:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhIYUoj (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 25 Sep 2021 16:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbhIYUoi (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 25 Sep 2021 16:44:38 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7535C061570
        for <linux-alpha@vger.kernel.org>; Sat, 25 Sep 2021 13:43:03 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mUEVh-007KRZ-SC; Sat, 25 Sep 2021 20:43:01 +0000
Date:   Sat, 25 Sep 2021 20:43:01 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     alpha <linux-alpha@vger.kernel.org>
Subject: Re: [PATCH 7/7] alpha: lazy FPU switching
Message-ID: <YU+J1b2jA8ZZZpv/@zeniv-ca.linux.org.uk>
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk>
 <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
 <20210925025548.1694143-7-viro@zeniv.linux.org.uk>
 <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sat, Sep 25, 2021 at 12:07:17PM -0700, Linus Torvalds wrote:
> On Fri, Sep 24, 2021 at 7:55 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> >         On each context switch we save the FPU registers on stack
> > of old process and restore FPU registers from the stack of new one.
> > That allows us to avoid doing that each time we enter/leave the
> > kernel mode; however, that can get suboptimal in some cases.
> 
> Do you actually have a system or virtual image to test this all out on?
> 
> I'm not saying this doesn't look like an improvement, I'm more
> questioning whether it's worth it...

Umm...  Bootable AS200 (EV45), bootable DS10 (EV6), theoretically
resurrectable UP1000 (EV67, fans on CPU module are in horrible state
and southbridge is unreliable, so the life is more interesting than
it's worth), working qemu-system-alpha (EV67).  No SMP boxen and
I've no idea if qemu can do SMP alpha these days...

Whether it's worth it... beginning of the series or this one?  If it's about
the former, the stuff in the series is pretty straightforward bug fixes and
equally straightforward cleanups.  If it's the latter... hell knows;
it would be tempting to see if we could
	* make FPU saves/restores lazy, evicting that stuff from switch_stack
	* add r9..r15 to pt_regs, saving on each kernel entry and restoring
if we have a flag set (note that entMM() and entUnaUser() already save/restore
those - unconditionally).  That would've killed the need to play with
switch_stack in straced syscalls/do_signal/etc.  switch_stack (trimmed down
to r9..r15,r26 - the callee-saved registers) would be used by switch_to(),
but that would be it.
	* take the entire ret_from_syscall et.al. out into C side of things.

This patch is basically "let's see how awful FPU-related part would be"
experiment.
