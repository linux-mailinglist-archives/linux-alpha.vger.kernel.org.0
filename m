Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4703A4B42
	for <lists+linux-alpha@lfdr.de>; Sat, 12 Jun 2021 01:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbhFKXgJ (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 11 Jun 2021 19:36:09 -0400
Received: from mail-ej1-f46.google.com ([209.85.218.46]:38902 "EHLO
        mail-ej1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbhFKXgJ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 11 Jun 2021 19:36:09 -0400
Received: by mail-ej1-f46.google.com with SMTP id og14so6843538ejc.5
        for <linux-alpha@vger.kernel.org>; Fri, 11 Jun 2021 16:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PjZY9q5pSOU4tsgru1uTR+wDm1WCLCTCsFGKWC33b5o=;
        b=G5WJlyCtSQu+o5/QRI8qnFIELrvDb45CAhskrbVgrzcYLYuHHDQdhlPtDQnjDxRS+A
         1cd1dxgNaKxrrJoRkaCJTbgm4hRbgjod1SkMHXo7Wds6qMbKupMu+TRzye2sUNov6zhz
         jINjgUtpRgOy3dID6uQIw+6o31xe/IeTgZv3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PjZY9q5pSOU4tsgru1uTR+wDm1WCLCTCsFGKWC33b5o=;
        b=sUuNWYdzU2ln9EHZdmXSMfa80HXvgNnavsH9woIl6WhstrXOt/00hLBfmtcOFy4/Fy
         +ch/Y7XO0dqjyQVrz1v2F2krpNxXCvKpETuAqqjThKwtvUz+SvqBz/TpviKMqcRUCdpt
         U0Pt2uussUlTn82eKGytawYQO5aWzXwxvFN+ZnTiRIJK9MYwUVp2gA3Pk7PuPcwKKvFy
         HuuG15T10GKTVpRwmT2X14WXSyd1cOH8HOE0OZuwZv7TB+084XVzJFCEimSFv/9rL3mq
         l3PX0gnuNW7TEBBS5684ZVuOViGaQlK74Mdvv786B33frldOjOSyhPnG41YHRTRlEfB8
         NbAw==
X-Gm-Message-State: AOAM531LoL2iHRAgq130Kd9r2/3iHRj5Iw6KMHRIupdxLiV/vt98HEHc
        pYdYnJ/RjyO3Qc9Rp7E7wtooXvhHf/AYKKzEG+w=
X-Google-Smtp-Source: ABdhPJy3C6pejIHpEOukRctBKR9+HecYtM/eDR+FLyeZ2810oFq8JZnkft/t/J/N48PGhsM9mLHvEw==
X-Received: by 2002:a17:906:6d95:: with SMTP id h21mr5728600ejt.260.1623454376812;
        Fri, 11 Jun 2021 16:32:56 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id cx7sm3089870edb.65.2021.06.11.16.32.56
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jun 2021 16:32:56 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id a11so7615543wrt.13
        for <linux-alpha@vger.kernel.org>; Fri, 11 Jun 2021 16:32:56 -0700 (PDT)
X-Received: by 2002:a05:6512:3d13:: with SMTP id d19mr4085256lfv.41.1623453997580;
 Fri, 11 Jun 2021 16:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <87sg1p30a1.fsf@disp2133> <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133>
In-Reply-To: <87pmwsytb3.fsf@disp2133>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 11 Jun 2021 16:26:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
Message-ID: <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     linux-arch <linux-arch@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Tejun Heo <tj@kernel.org>,
        Daniel Jacobowitz <drow@nevyn.them.org>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Fri, Jun 11, 2021 at 2:40 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Looking at copy_thread it looks like at least on alpha we are dealing
> with a structure that defines all of the registers in copy_thread.

On the target side, yes.

On the _source_ side, the code does

        struct pt_regs *regs = current_pt_regs();

and that's the part that means that fork() and related functions need
to have done that DO_SWITCH_STACK(), so that they have the full
register set to be copied.

Otherwise it would copy random contents from the source stack.

But that

        if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {

ends up protecting us, and the code never uses that set of source
registers for the io worker threads.

So io_uring looks fine on alpha. I didn't check m68k and friends, but
I think they have the same thing going.

> It looks like we just need something like this to cover the userspace
> side of exit.

Looks correct to me. Except I think you could just use "fork_like()"
instead of creating a new (and identical) "exit_like()" macro.

> > But I really wish we had some way to test and trigger this so that we
> > wouldn't get caught on this before. Something in task_pt_regs() that
> > catches "this doesn't actually work" and does a WARN_ON_ONCE() on the
> > affected architectures?
>
> I think that would require pushing an extra magic value in SWITCH_STACK
> and not just popping it but deliberately changing that value in
> UNDO_SWITCH_STACK.  Basically stack canaries.
>
> I don't see how we could do it in an arch independent way though.

No, I think you're right. There's no obvious generic solution to it,
and once we look at arch-specific ones we're vback to "just alpha,
m68k and nios needs this or cares" and tonce you're there you might as
well just fix it.

ia64 has soem "fast system call" model with limited registers too, but
I think that's limited to just a few very special system calls (ie it
does the reverse of what alpha does: alpha does the fast case by
default, and then marks fork/vfork/clone as special).

             Linus
