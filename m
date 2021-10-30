Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F114440BB2
	for <lists+linux-alpha@lfdr.de>; Sat, 30 Oct 2021 23:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbhJ3V2H (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 30 Oct 2021 17:28:07 -0400
Received: from angie.orcam.me.uk ([78.133.224.34]:36056 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbhJ3V2H (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 30 Oct 2021 17:28:07 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 4CDC99200B4; Sat, 30 Oct 2021 23:25:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 3EB4A92009E;
        Sat, 30 Oct 2021 22:25:34 +0100 (BST)
Date:   Sat, 30 Oct 2021 22:25:34 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Al Viro <viro@zeniv.linux.org.uk>
cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        alpha <linux-alpha@vger.kernel.org>
Subject: Re: [PATCH 7/7] alpha: lazy FPU switching
In-Reply-To: <YX2vJiUDHkMqHK4m@zeniv-ca.linux.org.uk>
Message-ID: <alpine.DEB.2.21.2110302215080.61663@angie.orcam.me.uk>
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk> <20210925025548.1694143-1-viro@zeniv.linux.org.uk> <20210925025548.1694143-7-viro@zeniv.linux.org.uk> <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com> <YU+J1b2jA8ZZZpv/@zeniv-ca.linux.org.uk>
 <YX2vJiUDHkMqHK4m@zeniv-ca.linux.org.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sat, 30 Oct 2021, Al Viro wrote:

> 1) lazy FPU part has a braino in it; __save_fpu() in alpha_fork() et.al. should
> be called *after* do_switch_stack(), not before it.  Another (minor) problem is
> that use of jsr for calls for functions in the same object file is stupid -
> should be bsr instead.  Not a bug, per se, but it's clearly suboptimal.  Both
> fixes folded.

 The linker is supposed to relax any eligible JSR to BSR (same with JMP vs 
BR) so it shouldn't really matter, and writing it down as JSR is surely 
more flexible as you don't have to track which caller/callee is where.

  Maciej
