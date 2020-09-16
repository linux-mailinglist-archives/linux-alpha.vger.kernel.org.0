Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A641B26BE3C
	for <lists+linux-alpha@lfdr.de>; Wed, 16 Sep 2020 09:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgIPHhh (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 16 Sep 2020 03:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgIPHhc (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 16 Sep 2020 03:37:32 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9735CC06178A
        for <linux-alpha@vger.kernel.org>; Wed, 16 Sep 2020 00:37:30 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id n61so5766734ota.10
        for <linux-alpha@vger.kernel.org>; Wed, 16 Sep 2020 00:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ir83kA7yZmatKHQpy7nyYwdfudWOyhH141WksSrpLpI=;
        b=Wbmy2wm4Y3Z7IHj2WQgnSxJHvWaqiIYxvJrRLzN5yosJdstiBZVZo9gvc44pSE/nA1
         P9hDpmjXczq2zLOkqvx/WHir/QasP1J2aBD5X+7FKjnP91s5nxsyqJv2jhU8PZzNRGRF
         pjrrhaFUmLe21mq1kggp9iTxwlhfZdVWViCcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ir83kA7yZmatKHQpy7nyYwdfudWOyhH141WksSrpLpI=;
        b=iCyJXOkqMqnGaLH0GV3KWjODiwTp5LR3abgg6zJBV9EoI1Moy4wYyPx2CuTYc/kGIw
         JSaF/cf5PdXFiyOU16o2bovhEol8PCi2RwzrnePrFNYj1GdemmEwbTlU6RYlJ5kajp2d
         JXCCpBOP4OMdKBZ2iW1ZhVeVz6I/0H3SNC2DqtYR0/BvUbv3rNA0tY/vHecu2Pb75tZD
         fxsp3DEhQIDHTrlOmlSnESAiz1nJkXI5brGvE9JK8XZOS34YzOpyG7BSsxbaF0GAVksQ
         dQ4O11Q+scG1NPmv7T2Uwf0uDuha9n+aGmg4hXx28Ilb2R0nQvwoMc3QfDUMzbdHsxwb
         MCFA==
X-Gm-Message-State: AOAM530OFjqeMScVNIsMZrLPMfXVYkRFdPK6YF9TAaKRtQMkJMnGqlvB
        4u8609MUXTLx4xv80kTF5rxHSF5Cz5XLLjKlblC7iA==
X-Google-Smtp-Source: ABdhPJwGl0rb2zlMJB/+T8+6pHD/ce/ZZx4zrU0sObZFxXtLXBpNIcPMMRDqJU2JyoR0WPCWkLBmcTGbfcRbBMPy77o=
X-Received: by 2002:a05:6830:14d9:: with SMTP id t25mr16390529otq.188.1600241849077;
 Wed, 16 Sep 2020 00:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200914204209.256266093@linutronix.de> <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
 <871rj4owfn.fsf@nanos.tec.linutronix.de> <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
 <87bli75t7v.fsf@nanos.tec.linutronix.de> <CAHk-=wht7kAeyR5xEW2ORj7m0hibVxZ3t+2ie8vNHLQfdbN2_g@mail.gmail.com>
In-Reply-To: <CAHk-=wht7kAeyR5xEW2ORj7m0hibVxZ3t+2ie8vNHLQfdbN2_g@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 16 Sep 2020 09:37:17 +0200
Message-ID: <CAKMK7uHAk9-Vy2cof0ws=DrcD52GHiCDiyHbjLd19CgpBU2rKQ@mail.gmail.com>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ard Biesheuvel <ardb@kernel.org>,
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

On Tue, Sep 15, 2020 at 7:35 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 15, 2020 at 1:39 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > OTOH, having a working 'preemptible()' or maybe better named
> > 'can_schedule()' check makes tons of sense to make decisions about
> > allocation modes or other things.
>
> No. I think that those kinds of decisions about actual behavior are
> always simply fundamentally wrong.
>
> Note that this is very different from having warnings about invalid
> use. THAT is correct. It may not warn in all configurations, but that
> doesn't matter: what matters is that it warns in common enough
> configurations that developers will catch it.
>
> So having a warning in "might_sleep()" that doesn't always trigger,
> because you have a limited configuration that can't even detect the
> situation, that's fine and dandy and intentional.
>
> But having code like
>
>        if (can_schedule())
>            .. do something different ..
>
> is fundamentally complete and utter garbage.
>
> It's one thing if you test for "am I in hardware interrupt context".
> Those tests aren't great either, but at least they make sense.
>
> But a driver - or some library routine - making a difference based on
> some nebulous "can I schedule" is fundamentally and basically WRONG.
>
> If some code changes behavior, it needs to be explicit to the *caller*
> of that code.
>
> So this is why GFP_ATOMIC is fine, but "if (!can_schedule())
> do_something_atomic()" is pure shite.
>
> And I am not IN THE LEAST interested in trying to help people doing
> pure shite. We need to fix them. Like the crypto code is getting
> fixed.

Just figured I'll throw my +1 in from reading too many (gpu) drivers.
Code that tries to cleverly adjust its behaviour depending upon the
context it's running in is harder to understand and blows up in more
interesting ways. We still have drm_can_sleep() and it's mostly just
used for debug code, and I've largely ended up just deleting
everything that used it because when you're driver is blowing up the
last thing you want is to realize your debug code and output can't be
relied upon. Or worse, that the only Oops you have is the one in the
debug code, because the real one scrolled away - the original idea
behind drm_can_sleep was to make all the modeset code work
automagically both in normal ioctl/kworker context and in the panic
handlers or kgdb callbacks. Wishful thinking at best.

Also at least for me that extends to everything, e.g. I much prefer
explicit spin_lock and spin_lock_irq vs magic spin_lock_irqsave for
locks shared with interrupt handlers, since the former two gives me
clear information from which contexts such function can be called.
Other end is the memalloc_no*_save/restore functions, where I recently
made a real big fool of myself because I didn't realize how much that
impacts everything that's run within - suddenly "GFP_KERNEL for small
stuff never fails" is wrong everywhere.

It's all great for debugging and sanity checks (and we run with all
that stuff enabled in our CI), but really semantic changes depending
upon magic context checks freak my out :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
