Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7EC26AC59
	for <lists+linux-alpha@lfdr.de>; Tue, 15 Sep 2020 20:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbgIOSnm (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 15 Sep 2020 14:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbgIORfm (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 15 Sep 2020 13:35:42 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20422C061788
        for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2020 10:35:39 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id b22so3937404lfs.13
        for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2020 10:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0nYcbfWZAApGs9MKHeuMMDYKDYJP/KjXcIMY7yTiRjk=;
        b=hFeX95/TT9jtwZAL/DonKpuMHGRk/7SCmZequDM1VaRmacKDQZY4lc39NgOcx0VujL
         ul3l8yb5Ugprhwk3dogs1JqCkfr90spWSTqKGkSLsF9w3lXrIygeRUDRxh1yw1QSoeb3
         vUCYW8AmUQyz6zbxknLrsvz9nPCTdNe9Dcd+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0nYcbfWZAApGs9MKHeuMMDYKDYJP/KjXcIMY7yTiRjk=;
        b=ED2MHMpTCXwaonHfC7bOyNOxkPGYIuJ9gP9HaXciNJxykge9FakZQvvGof2U9nyakM
         NXo/iiVVwqc6jCqyc1jxQuR0XySg5g9uV7tk7UKTz/YtgL8lrqSppK3DjkMbTqXN0ZI3
         5tdrmRRs1T/4rg2zuNNrQPRpClY+6Halo8K/ZGUuZg2nTXQaMsSgtGaXPbWcQoXwui6P
         plr5+9/kNyIjO6DKgU1/Dblm3HfT9eWCDN/fjMGcDWTAlSnUttBdxh7KWOY6GlHTsrZn
         Yr58ziDvH5z/x9f3vsJgXbbraC5RrfNaJFHWy8JhnLc7o8Nzrq7AVAZCLCqDNuomBiOK
         t+Vw==
X-Gm-Message-State: AOAM531XUM3I3Wg92wJJ+OSZLxbfdO5lUM6X6MoW1vIBWqku5LrCAjiN
        zXNA47HpSyeP3UD64CfiOKyaEKKTxW8q8Q==
X-Google-Smtp-Source: ABdhPJykCjR75d8SNmdGV+tUCJJb3OXyGepgjaYGJ/tWwiaVQr+0zKoYgm6kGHPB8tl/8whUZE/0gg==
X-Received: by 2002:a19:5e4a:: with SMTP id z10mr5586459lfi.380.1600191337582;
        Tue, 15 Sep 2020 10:35:37 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id a25sm4146531lfi.267.2020.09.15.10.35.36
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 10:35:37 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id w11so4025516lfn.2
        for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2020 10:35:36 -0700 (PDT)
X-Received: by 2002:ac2:5594:: with SMTP id v20mr6798322lfg.344.1600191336149;
 Tue, 15 Sep 2020 10:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200914204209.256266093@linutronix.de> <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
 <871rj4owfn.fsf@nanos.tec.linutronix.de> <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
 <87bli75t7v.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87bli75t7v.fsf@nanos.tec.linutronix.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 15 Sep 2020 10:35:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wht7kAeyR5xEW2ORj7m0hibVxZ3t+2ie8vNHLQfdbN2_g@mail.gmail.com>
Message-ID: <CAHk-=wht7kAeyR5xEW2ORj7m0hibVxZ3t+2ie8vNHLQfdbN2_g@mail.gmail.com>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um <linux-um@lists.infradead.org>,
        Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Will Deacon <will@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>, Ingo Molnar <mingo@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Shuah Khan <shuah@kernel.org>, rcu@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, Sep 15, 2020 at 1:39 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> OTOH, having a working 'preemptible()' or maybe better named
> 'can_schedule()' check makes tons of sense to make decisions about
> allocation modes or other things.

No. I think that those kinds of decisions about actual behavior are
always simply fundamentally wrong.

Note that this is very different from having warnings about invalid
use. THAT is correct. It may not warn in all configurations, but that
doesn't matter: what matters is that it warns in common enough
configurations that developers will catch it.

So having a warning in "might_sleep()" that doesn't always trigger,
because you have a limited configuration that can't even detect the
situation, that's fine and dandy and intentional.

But having code like

       if (can_schedule())
           .. do something different ..

is fundamentally complete and utter garbage.

It's one thing if you test for "am I in hardware interrupt context".
Those tests aren't great either, but at least they make sense.

But a driver - or some library routine - making a difference based on
some nebulous "can I schedule" is fundamentally and basically WRONG.

If some code changes behavior, it needs to be explicit to the *caller*
of that code.

So this is why GFP_ATOMIC is fine, but "if (!can_schedule())
do_something_atomic()" is pure shite.

And I am not IN THE LEAST interested in trying to help people doing
pure shite. We need to fix them. Like the crypto code is getting
fixed.

                   Linus
