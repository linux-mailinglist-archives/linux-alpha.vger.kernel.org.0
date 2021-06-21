Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 980323AF986
	for <lists+linux-alpha@lfdr.de>; Tue, 22 Jun 2021 01:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbhFUXjK (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 21 Jun 2021 19:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbhFUXjI (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 21 Jun 2021 19:39:08 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 397A5C06175F
        for <linux-alpha@vger.kernel.org>; Mon, 21 Jun 2021 16:36:52 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id k8so4506606ljk.7
        for <linux-alpha@vger.kernel.org>; Mon, 21 Jun 2021 16:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fqBMFMkh+3vsj4PE2zy4sOG9Di6zkfuPgmZeKyRMggk=;
        b=FwTzGNcpDtlrI1kY0RIGO3zETGbXVETw5XVSJFPsLGj6Xz/SJV56ObDVCGf2pDuQ1Z
         igDUi27LyzA/lOjip7sVylirPYT+bZ/hF+sKh406iS7GyB+Vq1L8K8GDXIUSy1RHLXYZ
         859pKuXlceGLPjaK41xP26kUTIY685CWI4qnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fqBMFMkh+3vsj4PE2zy4sOG9Di6zkfuPgmZeKyRMggk=;
        b=pwvl7TmkVyHL7k5o+aS+pEoKf/YRdxDYYvPEanE7WRlAMtb4Nb6ZOWKjqkzbhu40qE
         JhJCVUK3ZZJktVnFdDnMp0Lmj9a+cDK2iNJwLmYTo5IIAe/l5HLYIsvFvuSup1u/7AGc
         N5VbjA15QSroYarwGJnmdR1Sopc8m9IXkWarxw1vOStS7a1i7LsPrCwk1X4SXLPOVNcs
         YAdbAYWQd6ZpOSl94D+1xbiadM/T0hRC6m9iqa8obbC9jHbn30zoQ6PruQNXhPW7LmHM
         vgjXGtZpMvh9w8shdk4j4kTNvyNIA4rM61F67Mkkiy5yENTmRLXu+HtuRTw7HB2ppZYd
         5uvg==
X-Gm-Message-State: AOAM530cO75XNZy9YGnLzNcDBl/Jdi7AzJcPd/RMZP0PhBUdxjhMkRy5
        c9vOSCGYxXG5yDzPJ2/KdMKn7GVPvxJ2g6YGR34=
X-Google-Smtp-Source: ABdhPJyvP/TMMUXC5cZOlQZOO+YOuc/SHqQ5wlal4htCgFY65hGBWxRwUNJqKi7Vxl0PgtE0Op0zbQ==
X-Received: by 2002:a2e:7d0f:: with SMTP id y15mr569911ljc.388.1624318610473;
        Mon, 21 Jun 2021 16:36:50 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id p15sm1483262ljg.28.2021.06.21.16.36.49
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 16:36:49 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id z22so27514598ljh.8
        for <linux-alpha@vger.kernel.org>; Mon, 21 Jun 2021 16:36:49 -0700 (PDT)
X-Received: by 2002:a2e:22c4:: with SMTP id i187mr544552lji.251.1624318609289;
 Mon, 21 Jun 2021 16:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <YNDsYk6kbisbNy3I@zeniv-ca.linux.org.uk> <CAHk-=wh82uJ5Poqby3brn-D7xWbCMnGv-JnwfO0tuRfCvsVgXA@mail.gmail.com>
 <YNEfXhi80e/VXgc9@zeniv-ca.linux.org.uk>
In-Reply-To: <YNEfXhi80e/VXgc9@zeniv-ca.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Jun 2021 16:36:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjtagi3g5thA-T8ooM8AXcy3brdHzugCPU0itdbpDYH_A@mail.gmail.com>
Message-ID: <CAHk-=wjtagi3g5thA-T8ooM8AXcy3brdHzugCPU0itdbpDYH_A@mail.gmail.com>
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

On Mon, Jun 21, 2021 at 4:23 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>         How would it help e.g. oopsen on the way out of timer interrupts?
> IMO we simply shouldn't allow ptrace access if the tracee is in that kind
> of state, on any architecture...

Yeah no, we can't do the "wait for ptrace" when the exit is due to an
oops. Although honestly, we have other cases like that where do_exit()
isn't 100% robust if you kill something in an interrupt. Like all the
locks it leaves locked etc.

So do_exit() from a timer interrupt is going to cause problems
regardless. I agree it's probably a good idea to try to avoid causing
even more with the odd ptrace thing, but I don't think ptrace_event is
some really "fundamental" problem at that point - it's just one detail
among many many.

So I was more thinking of the debug patch for m68k to catch all the
_regular_ cases, and all the other random cases of ptrace_event() or
ptrace_notify().

Although maybe we've really caught them all. The exit case was clearly
missing, and the thread fork case was scrogged. There are patches for
the known problems. The patches I really don't like are the
verification ones to find any unknown ones..

            Linus
