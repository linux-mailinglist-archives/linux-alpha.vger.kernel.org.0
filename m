Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3113C3AF606
	for <lists+linux-alpha@lfdr.de>; Mon, 21 Jun 2021 21:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbhFUTYn (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 21 Jun 2021 15:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbhFUTYm (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 21 Jun 2021 15:24:42 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04226C06175F
        for <linux-alpha@vger.kernel.org>; Mon, 21 Jun 2021 12:22:26 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id a21so1641530ljj.1
        for <linux-alpha@vger.kernel.org>; Mon, 21 Jun 2021 12:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UWwkKMPjf9VHxhA/g9kybS/n5fjzQ1lCr96tYKbsWb4=;
        b=OWY9B/m6/Mxc4KE4rlqUmS8up4KOodyzZabkrCDG8PZQO7BOG22XJGJUOTvpEvWYz8
         5PgA6ftqBTHNUdu8z3XpFvF/2p6ZVtR21Nv8hDF/pcwb1wKzuer3Yr3ZrfLh8V5mdy+M
         eKJPw1pfo8vN7QoUHB7TWIVl4z9STd1R+XvlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UWwkKMPjf9VHxhA/g9kybS/n5fjzQ1lCr96tYKbsWb4=;
        b=GdyAGqv5XhNaMWA8TVR1MxV3Uqq2hi4noJmNWfo3ser71p9kBC5W1YFGzQFUnqbimo
         uN/+/8OO9o6Z968LsVH+jTJVWU8sUIreNqeVkfI53E6EGzCkeJWUNdPZ0P0Yi05NS43W
         uVZKhEFOVwapw909k2/3serN1Np6tMPou0l2rc7+Ac//ibh5ape53BKnUMZJM2Pvs1j7
         Ler8mA2Rf6na0D0Sq93VmPHyKk+Dapj1cHTN54vbjO/fS8/S95hchI+XjQbwAfmjxizZ
         xCyQE/L2Bld0IqONdVJGcic2B2Apuu5lizkBjFVkv+A6Ps2cy4MLuhF4RCk8CmCZRKun
         Ut4g==
X-Gm-Message-State: AOAM532OBr2qCgRX6ugHQW8uot+e4ouDeJ4zI/z7BdKhWTljsPHPSY2t
        ar4o9viPDfbjMTsRQUSGDkjptfWCTCqMEHCz14g=
X-Google-Smtp-Source: ABdhPJxB5lDctW4NxAtogAXrfTsbIBV8u0gX+vm0zofNOL6FpsxzUCKg4GrZP2nVRYHuCmXwykSIaA==
X-Received: by 2002:a2e:9297:: with SMTP id d23mr12301131ljh.160.1624303344133;
        Mon, 21 Jun 2021 12:22:24 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id o7sm5166ljg.37.2021.06.21.12.22.22
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 12:22:22 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id q23so16338052ljh.0
        for <linux-alpha@vger.kernel.org>; Mon, 21 Jun 2021 12:22:22 -0700 (PDT)
X-Received: by 2002:a2e:9644:: with SMTP id z4mr23025776ljh.507.1624303342282;
 Mon, 21 Jun 2021 12:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
In-Reply-To: <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Jun 2021 12:22:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
Message-ID: <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
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
        Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Mon, Jun 21, 2021 at 11:59 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>         There's a large mess around do_exit() - we have a bunch of
> callers all over arch/*; if nothing else, I very much doubt that really
> want to let tracer play with a thread in the middle of die_if_kernel()
> or similar.

Right you are.

I'm really beginning to hate ptrace_{event,notify}() and those
PTRACE_EVENT_xyz things.

I don't even know what uses them, honestly. How very annoying.

I guess it's easy enough (famous last words) to move the
ptrace_event() call out of do_exit() and into the actual
exit/exit_group system calls, and the signal handling path. The paths
that actually have proper pt_regs.

Looks like sys_exit() and do_group_exit() would be the two places to
do it (do_group_exit() would handle the signal case and
sys_group_exit()).

               Linus
