Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD233B1120
	for <lists+linux-alpha@lfdr.de>; Wed, 23 Jun 2021 02:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhFWAuQ (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 22 Jun 2021 20:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbhFWAuQ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 22 Jun 2021 20:50:16 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C3BC061574
        for <linux-alpha@vger.kernel.org>; Tue, 22 Jun 2021 17:47:58 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id s22so624178ljg.5
        for <linux-alpha@vger.kernel.org>; Tue, 22 Jun 2021 17:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1pJi6stLtza5ZFdImIffUNgdJoHKsMjc09flZZ4qiAI=;
        b=SFcCe3m1FiAXHxPsSVxKjvrdNckQVrxdff+U4unr4V4zJzTMYaBEpSK9jjYtU7tMd6
         D6+UsvBUdCLcIdv0JgGtdHlWRGtgBWAILphbvJEUZilovxO8PsYLDfvqyyYAEF0oFQuI
         Rb1F4OutZ2mQyaIxFkh4FOdwyNm9Ixhuqq2qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1pJi6stLtza5ZFdImIffUNgdJoHKsMjc09flZZ4qiAI=;
        b=uQLWz6WIMbT35GXLt5B7qy6UpF4pnuE3nr0FvOqfR/F6J+sQrEtik8TLVAcN/NZPqC
         KTU37uWxluuSDourHa/eQd+19rg601Jh97lFZGpyMnh5Y7bVUj8E/gBceMFScP2vVT0k
         LdficqC3QJmE98uBzrP9a7YPJADhou4Y8ivyhWHjimz6gt8648qxWU//7mVTsFJCHjcv
         T4yNZlk2hIr3WN6vIw8QqeoPPEH9lfThwbc8MO6nA9Kic5QuvuW279wnNXKPWI1g5RiF
         Cp2pXCPnMbR+f1P26CNpYau4ODalvE4r27PieHydrmDN2xCh05Gq5xU8G4/U/sqywpn6
         EuPA==
X-Gm-Message-State: AOAM532fOxLeg2y5D4DNPOzBne9d44gJQnD9DRkaMnzzJqtow+N13It1
        2LzyP3crOfOoOJSvWNaFhMYY0AKxaFEzDrKT
X-Google-Smtp-Source: ABdhPJymh/EC7bLk5RmyuxobMbgKiLf+2kFoZQgDQCvBosPlTcf9npw/VV+OfPgTPvkMjcSrIMmVPQ==
X-Received: by 2002:a2e:6c12:: with SMTP id h18mr5638948ljc.125.1624409276692;
        Tue, 22 Jun 2021 17:47:56 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id c30sm1241225lfv.196.2021.06.22.17.47.56
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 17:47:56 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id t17so1303411lfq.0
        for <linux-alpha@vger.kernel.org>; Tue, 22 Jun 2021 17:47:56 -0700 (PDT)
X-Received: by 2002:a05:6512:15a2:: with SMTP id bp34mr4693530lfb.40.1624408926925;
 Tue, 22 Jun 2021 17:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133> <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133>
In-Reply-To: <87tulpbp19.fsf@disp2133>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 22 Jun 2021 17:41:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
Message-ID: <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
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
        Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, Jun 22, 2021 at 1:53 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Playing with it some more I think I have everything working working
> except for PTRACE_EVENT_SECCOMP (which can stay ptrace_event) and
> group_exit(2).
>
> Basically in exit sending yourself a signal and then calling do_exit
> from the signal handler is not unreasonable, as exit is an ordinary
> system call.

Ok, this is a bit odd, but I do like the concept of just making
ptrace_event just post a signal, and have all ptrace things always be
handled at signal time (or the special system call entry/exit, which
is fine too).

> For purposes of discussion this is my current draft implementation.

I didn't check what is so different about exit_group() that you left
that as an exercise for the reader, but if that ends up then removing
the whole "wait synchromously for ptrace" cases for good I don't
_hate_ this. It's a bit odd, but it would be really nice to limit
where ptrace picks up data.

We do end up doing that stuff in "get_signal()", and that means that
we have the interaction with io_uring calling it directly, but it's at
least not a new thing.

               Linus
