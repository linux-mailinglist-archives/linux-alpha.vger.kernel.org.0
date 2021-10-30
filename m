Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B5A440C15
	for <lists+linux-alpha@lfdr.de>; Sun, 31 Oct 2021 00:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbhJ3WPl (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 30 Oct 2021 18:15:41 -0400
Received: from zeniv-ca.linux.org.uk ([142.44.231.140]:33374 "EHLO
        zeniv-ca.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbhJ3WPk (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 30 Oct 2021 18:15:40 -0400
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mgwb6-00GsY3-7C; Sat, 30 Oct 2021 22:13:08 +0000
Date:   Sat, 30 Oct 2021 22:13:08 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        alpha <linux-alpha@vger.kernel.org>
Subject: Re: [PATCH 7/7] alpha: lazy FPU switching
Message-ID: <YX3DdBbNkTeUoGit@zeniv-ca.linux.org.uk>
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk>
 <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
 <20210925025548.1694143-7-viro@zeniv.linux.org.uk>
 <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com>
 <YU+J1b2jA8ZZZpv/@zeniv-ca.linux.org.uk>
 <YX2vJiUDHkMqHK4m@zeniv-ca.linux.org.uk>
 <alpine.DEB.2.21.2110302215080.61663@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2110302215080.61663@angie.orcam.me.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sat, Oct 30, 2021 at 10:25:34PM +0100, Maciej W. Rozycki wrote:
> On Sat, 30 Oct 2021, Al Viro wrote:
> 
> > 1) lazy FPU part has a braino in it; __save_fpu() in alpha_fork() et.al. should
> > be called *after* do_switch_stack(), not before it.  Another (minor) problem is
> > that use of jsr for calls for functions in the same object file is stupid -
> > should be bsr instead.  Not a bug, per se, but it's clearly suboptimal.  Both
> > fixes folded.
> 
>  The linker is supposed to relax any eligible JSR to BSR (same with JMP vs 
> BR) so it shouldn't really matter, and writing it down as JSR is surely 
> more flexible as you don't have to track which caller/callee is where.

All within arch/alpha/kernel/entry.S.  If that ever grows past 1M insns, we
have much worse problems...  Other callers are from C, so they all end up
with jsr, obviously.
