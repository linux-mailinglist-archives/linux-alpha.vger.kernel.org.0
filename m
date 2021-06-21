Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D811D3AE1E7
	for <lists+linux-alpha@lfdr.de>; Mon, 21 Jun 2021 05:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbhFUDj5 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 20 Jun 2021 23:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbhFUDjz (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sun, 20 Jun 2021 23:39:55 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6183C061756
        for <linux-alpha@vger.kernel.org>; Sun, 20 Jun 2021 20:37:41 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i13so27656504lfc.7
        for <linux-alpha@vger.kernel.org>; Sun, 20 Jun 2021 20:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1+HtUJLugMh1gE/Pq8w2A+iKsdZnPrpQbbhzWMAu6G8=;
        b=CguqVrwfLz3sZcjWNSP9u4srUE9fQXJpZYNDvur7BjH1Wa9iE+6JLPbb6gu1bHRbzP
         lhuXpf4aJ6FAM06cgPcFG8165A9ru2Rghgmk3cWS8VmtaMrnFl6vfe5YF+lxxVFXRiLZ
         rAtq4O0Gb8NYZTtOP3OEjIKCqz0zBbzRqM0Fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1+HtUJLugMh1gE/Pq8w2A+iKsdZnPrpQbbhzWMAu6G8=;
        b=pSw1/M46sBqeHY5UaoOj215Rs1l5F0mp+3c21LeBMUfiSx+fsE0sGOEGfJ4dU1i+38
         VLGNeKGSE7KanDNw6RoiYwkbidzjcfAGafqxTtKqOaTckBdR6b6KPg4xZuHYqhZScdau
         oJkhJ0LnjUEyy4yiR/zjGn398BBWAxQMTiMtlJS+UcqOxxkSaAOTC2p3lQhQiKCs3v+C
         /SacwFCT7h7AfOTQyVAu8kQR0GzgshZlhQ8sfu/W+bZ+9z3UEwXQWuQH5n+OIhbMIea+
         V7GtfX8al+V1mboprtjfFxlAqYYfzvLbhGsbk9d48otZBlz/YY0Pz+xY1z1cWi7542Y8
         inxg==
X-Gm-Message-State: AOAM531VA1UOIeLHbG//keWoXRMNo8w0VsRKiRqlDvPKc8niKV5mqZ+5
        +VCV2YNEA4SPQDsI7ZbZnSt9o0wbUtn55/pi
X-Google-Smtp-Source: ABdhPJyaEuqM002sbgTP61suPmR75p/6wmt3ol7KRolP9jktWx1b3tLGGtVWybUBL1uJysSbL3r3BA==
X-Received: by 2002:a19:e213:: with SMTP id z19mr11257718lfg.259.1624246659909;
        Sun, 20 Jun 2021 20:37:39 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id j9sm1877005lfm.70.2021.06.20.20.37.38
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jun 2021 20:37:39 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id q23so12612751ljh.0
        for <linux-alpha@vger.kernel.org>; Sun, 20 Jun 2021 20:37:38 -0700 (PDT)
X-Received: by 2002:a2e:9ad5:: with SMTP id p21mr20479953ljj.220.1624246658595;
 Sun, 20 Jun 2021 20:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <87sg1p30a1.fsf@disp2133> <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133> <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <87zgvqor7d.fsf_-_@disp2133> <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
 <87mtrpg47k.fsf@disp2133> <87pmwlek8d.fsf_-_@disp2133> <87k0mtek4n.fsf_-_@disp2133>
 <393c37de-5edf-effc-3d06-d7e63f34a317@gmail.com> <CAHk-=wip8KgrNUcU68wsLZqbWV+3NWg9kqqQwygHGAA8-xOwMA@mail.gmail.com>
 <60c0fe00-b966-6385-d348-f6dd45277113@gmail.com>
In-Reply-To: <60c0fe00-b966-6385-d348-f6dd45277113@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 20 Jun 2021 20:37:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgTGW0Q0BzpSJcLhseui1fH7Gbasvsz81Z89CMSAHE-Bw@mail.gmail.com>
Message-ID: <CAHk-=wgTGW0Q0BzpSJcLhseui1fH7Gbasvsz81Z89CMSAHE-Bw@mail.gmail.com>
Subject: Re: [PATCH 1/2] alpha/ptrace: Record and handle the absence of switch_stack
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-arch <linux-arch@vger.kernel.org>,
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
        Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sun, Jun 20, 2021 at 8:18 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> I hope that makes more sense?

So the problem is in your debug patch: you don't set that
TIS_SWITCH_STACK in nearly enough places.

In this particular example, I think it's that you don't set it in
do_trace_exit, so when you strace the process, the system call exit -
which is where the return value will be picked up - gets that warning.

You did set TIS_SWITCH_STACK on trace_entry, but then it's cleared
again during the system call, and not set at the trace_exit path.
Oddly, your debug patch also _clears_ it on the exit path, but it
doesn't set it when do_trace_exit does the SAVE_SWITCH_STACK.

You oddly also set it for __sys_exit, but not all the other special
system calls that also do that SAVE_SWITCH_STACK.

Really, pretty much every single case of SAVE_SWITCH_STACK would need
to set it. Not just do_trace_enter/exit

It's why I didn't like Eric's debug patch either. It's quite expensive
to do, partly because you look up that curptr thing. All very nasty.

It would be *much* better to make the flag be part of the stack frame,
but sadly at least on alpha we had exported the format of that stack
frame to user space.

Anyway, I think these debug patches are not just expensive but the
m68k one most definitely is also very incomplete.

             Linus
