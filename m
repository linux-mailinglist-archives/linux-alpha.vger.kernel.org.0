Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C120B3AF935
	for <lists+linux-alpha@lfdr.de>; Tue, 22 Jun 2021 01:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbhFUXXU (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 21 Jun 2021 19:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbhFUXXT (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 21 Jun 2021 19:23:19 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C278BC061574
        for <linux-alpha@vger.kernel.org>; Mon, 21 Jun 2021 16:21:03 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id t3so21181916edc.7
        for <linux-alpha@vger.kernel.org>; Mon, 21 Jun 2021 16:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cSpCTvtqwlFJ06T40MsJFhKBN6aTybvqDQph3piqU3c=;
        b=ej8PSbPXAb0zIPa9apzD7OWAABcayKzztY2Gl8qbjCjYcakYI2cbU1Xi2FhqAdGS23
         7NquMnu4HBnT8zfyZ8CSmagToFSLIKrWjMMs8/+Ru7rfccWvgOKMc4CMWM1hXZDx2u2Y
         vd34mqkS+oueuqgdEbosrH2qeR1zCtN6Gblvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cSpCTvtqwlFJ06T40MsJFhKBN6aTybvqDQph3piqU3c=;
        b=eEkzVEOwzxsZkImYDKWJ0+ELIt/UIkj2ujeaCnBEm0TVqRGVSSiDXkNIMcD+bn2IVn
         x8OSDlJT4VEWcLEtMmNID+SKW6jEiZDP3CB9wgVngSD+OmZQl7rXZyG3tEoTpR7/cknS
         ryJDJrHajrov52elBxqqJXNdjmcj8yyvtFpH1comR+7RGgYENClDKLVZBDtwh5aRIgEq
         Oo2GU0Ahhr1dEVDPQf8RHl5Nk2gUD1Y/VlVmqtnQhSEDtAizEkchvcLh7JlvMIg4c7B6
         E7ZiGjGSQKfKFVye9Y07h4XfkBtJEhbtIqqYSQx7GPLNbTOEWAXKS5SD3gjyRL60U6Xy
         y3zg==
X-Gm-Message-State: AOAM5330LG/RK+8eQVtY/l2ICwbIZCkn95qXzLN2DCr0Tgh6lk0iIl6N
        1zx+oXiFiDvQ1BHJjclPQha8mQRDmI6lb2iqvaQ=
X-Google-Smtp-Source: ABdhPJxK96YKp/2BqnZMvalO0syXvz6yO4SPWzsdTF2TWaRslRE8sijY2Plr7svF8Pru6WLW2sjOTQ==
X-Received: by 2002:a05:6402:34cc:: with SMTP id w12mr950460edc.195.1624317662314;
        Mon, 21 Jun 2021 16:21:02 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id j19sm1937111ejo.3.2021.06.21.16.21.02
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 16:21:02 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id gn32so4025373ejc.2
        for <linux-alpha@vger.kernel.org>; Mon, 21 Jun 2021 16:21:02 -0700 (PDT)
X-Received: by 2002:a05:6512:374b:: with SMTP id a11mr470683lfs.377.1624317291959;
 Mon, 21 Jun 2021 16:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com> <YNDsYk6kbisbNy3I@zeniv-ca.linux.org.uk>
In-Reply-To: <YNDsYk6kbisbNy3I@zeniv-ca.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Jun 2021 16:14:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh82uJ5Poqby3brn-D7xWbCMnGv-JnwfO0tuRfCvsVgXA@mail.gmail.com>
Message-ID: <CAHk-=wh82uJ5Poqby3brn-D7xWbCMnGv-JnwfO0tuRfCvsVgXA@mail.gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     "Eric W. Biederman" <ebiederm@xmission.com>,
        Michael Schmitz <schmitzmic@gmail.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Mon, Jun 21, 2021 at 12:45 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > Looks like sys_exit() and do_group_exit() would be the two places to
> > do it (do_group_exit() would handle the signal case and
> > sys_group_exit()).
>
> Maybe...  I'm digging through that pile right now, will follow up when
> I get a reasonably complete picture

We might have another possible way to solve this:

 (a) make it the rule that everybody always saves the full (integer)
register set in pt_regs

 (b) make m68k just always create that switch-stack for all system
calls (it's really not that big, I think it's like six words or
something)

 (c) admit that alpha is broken, but nobody really cares

> In the meanwhile, do kernel/kthread.c uses look even remotely sane?
> Intentional - sure, but it really looks wrong to use thread exit code
> as communication channel there...

I really doubt that it is even "intentional".

I think it's "use some errno as a random exit code" and nobody ever
really thought about it, or thought about how that doesn't really
work. People are used to the error numbers, not thinking about how
do_exit() doesn't take an error number, but a signal number (and an
8-bit positive error code in bits 8-15).

Because no, it's not even remotely sane.

I think the do_exit(-EINTR) could be do_exit(SIGINT) and it would make
more sense. And the -ENOMEM might be SIGBUS, perhaps.

It does look like the usermode-helper code does save the exit code
with things like

                kernel_wait(pid, &sub_info->retval);

and I see call_usermodehelper_exec() doing

        retval = sub_info->retval;

and treating it as an error code. But I think those have never been
tested with that (bogus) exit code thing from kernel_wait(), because
it wouldn't have worked.  It has only ever been tested with the (real)
exit code things like

                if (pid < 0) {
                        sub_info->retval = pid;

which does actually assign a negative error code to it.

So I think that

                kernel_wait(pid, &sub_info->retval);

line is buggy, and should be something like

                int wstatus;
                kernel_wait(pid, &wstatus);
                sub_info->retval = WEXITSTATUS(wstatus) ? -EINVAL : 0;

or something.

            Linus
