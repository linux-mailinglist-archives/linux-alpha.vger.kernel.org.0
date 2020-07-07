Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5110B217B72
	for <lists+linux-alpha@lfdr.de>; Wed,  8 Jul 2020 01:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728511AbgGGXBm (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 7 Jul 2020 19:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728210AbgGGXBm (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Tue, 7 Jul 2020 19:01:42 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CADA7C08C5DC
        for <linux-alpha@vger.kernel.org>; Tue,  7 Jul 2020 16:01:41 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id q17so2927443pls.9
        for <linux-alpha@vger.kernel.org>; Tue, 07 Jul 2020 16:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Eir+/5D/9eAWW8HAsQF0UHQBLwiWBu8OPWiNvlXrgfo=;
        b=q9nHFQUGJSQa6+kpaDcgq/H1Me1dz6qWOflJ5qyN8UvbG2KFHaOFsiG0yh3griaGPL
         zpnFvEKrEBU6SBmCmwnkaiFfGBgE0BfLwr0eTl2JCp/Po7z+8CEmwFIoMC+7xoDrOrRF
         Peb0k+dE/YvzErpB5rct6JRCG3QiM6DuLuM2j5pxxlqqHQl5MlKR6lNvdR/reBAj+1Be
         S5+7mSAGbM84lAoSQaE6ExV4twhGu0RrHpWOQdKgGC3bTAmqkuoiThYE+owAp8819Png
         2ZtcJDPTpIxlBOEhEyIzU8C7I4ASBxyJ4z2jd+jwdkycWq9tZVcYQ5iQ21gf4m6zXiEC
         4ENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eir+/5D/9eAWW8HAsQF0UHQBLwiWBu8OPWiNvlXrgfo=;
        b=mJdwoNMZVcEzOd92V95shwAuul9fWqbrh6ib7p6utPREgS6HIP03ExiPLCxdOhc4oO
         p8CDcj3ubC1xrGvUyJQY8f0zZmxlAwskWRVmBnO8fhZnWHIgfTN6MXaoJMR8In3G6ZPZ
         eTx2IrBI5Weu6uuEpkSa0eYfm2b+C18Ytp/gof4K/PeiC0ibMQ9T7poarG6pDGnoMkd2
         mBALSc0kXW1Hrn3Sy7wq/1g3NWrt3KkEwafufKOW7dy7Ba/gbgvF1n7/Tb8MUkbur97s
         +Sjy5al/MEnA/lKO48ewqylxP+YXr14dVN5ZcMveadZXoiRpR4y8JB8y/bbWlImFXVxo
         begw==
X-Gm-Message-State: AOAM5310Ko5zusXDNhGZqOUzxYNLxS0QUR0Z1406VINvBwLyK+lVKEpU
        ggHZyZonW6I3XwG7ujaCKuFNRvAqJ45KnMTgSvS0ag==
X-Google-Smtp-Source: ABdhPJwBfW8b+5wb0y3A65hpMEhCu/FpkdAhiiZU0fRVHBXtqfSUAse8Mqe3LAWxXGm5JXrx3EH2RrhSOLaypQu9ewE=
X-Received: by 2002:a17:902:a50c:: with SMTP id s12mr33346815plq.119.1594162900874;
 Tue, 07 Jul 2020 16:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200630173734.14057-1-will@kernel.org> <20200630173734.14057-19-will@kernel.org>
 <20200701170722.4rte5ssnmrn2uqzg@bakewell.cambridge.arm.com>
 <20200702072301.GA15963@willie-the-truck> <20200706160023.GB10992@arm.com>
 <20200706163455.GV9247@paulmck-ThinkPad-P72> <20200706170556.GE10992@arm.com>
 <20200706173628.GZ9247@paulmck-ThinkPad-P72> <20200707102915.GI10992@arm.com> <20200707225122.GJ9247@paulmck-ThinkPad-P72>
In-Reply-To: <20200707225122.GJ9247@paulmck-ThinkPad-P72>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 7 Jul 2020 16:01:28 -0700
Message-ID: <CAKwvOdkW__H21m8vqqk1-n6-KK67HBk=YbA+MkUS7igxfjV1iw@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: lto: Strengthen READ_ONCE() to acquire when CLANG_LTO=y
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Dave Martin <Dave.Martin@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Marco Elver <elver@google.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization@lists.linux-foundation.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Matt Turner <mattst88@gmail.com>,
        kernel-team <kernel-team@android.com>,
        Kees Cook <keescook@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Richard Henderson <rth@twiddle.net>,
        LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

I'm trying to put together a Micro Conference for Linux Plumbers
conference focused on "make LLVM slightly less shitty."  Do you all
plan on attending the conference? Would it be worthwhile to hold a
session focused on discussing this (LTO and memory models) be
worthwhile?


On Tue, Jul 7, 2020 at 3:51 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Tue, Jul 07, 2020 at 11:29:15AM +0100, Dave Martin wrote:
> > On Mon, Jul 06, 2020 at 10:36:28AM -0700, Paul E. McKenney wrote:
> > > On Mon, Jul 06, 2020 at 06:05:57PM +0100, Dave Martin wrote:
>
> [ . . . ]
>
> > > > The underlying problem here seems to be that the necessary ordering
> > > > rule is not part of what passes for the C memory model prior to C11.
> > > > If we want to control the data flow, don't we have to wrap the entire
> > > > dereference in a macro?
> > >
> > > Yes, exactly.  Because we are relying on things that are not guaranteed
> > > by the C memory model, we need to pay attention to the implementations.
> > > As I have said elsewhere, the price of control dependencies is eternal
> > > vigilance.
> > >
> > > And this also applies, to a lesser extent, to address and data
> > > dependencies, which are also not well supported by the C standard.
> > >
> > > There is one important case in which the C memory model -does- support
> > > control dependencies, and that is when the dependent write is a normal
> > > C-language write that is not involved in a data race.  In that case,
> > > if the compiler broke the control dependency, it might have introduced
> > > a data race, which it is forbidden to do.  However, this rule can also
> > > be broken when the compiler knows too much, as it might be able to prove
> > > that breaking the dependency won't introduce a data race.  In that case,
> > > according to the standard, it is free to break the dependency.
> >
> > Which only matters because the C abstract machine may not match reality.
> >
> > LTO has no bearing on the abstract machine though.
> >
> > If specific compiler options etc. can be added to inhibit the
> > problematic optimisations, that would be ideal.  I guess that can't
> > happen overnight though.
>
> Sadly, I must agree.
>
> > > > > > > We likely won't realise if/when this goes wrong, other than impossible to
> > > > > > > debug, subtle breakage that crops up seemingly randomly. Ideally, we'd be
> > > > > > > able to detect this sort of thing happening at build time, and perhaps
> > > > > > > even prevent it with compiler options or annotations, but none of that is
> > > > > > > close to being available and I'm keen to progress the LTO patches in the
> > > > > > > meantime because they are a requirement for CFI.
> > > > > >
> > > > > > My concern was not so much why LTO makes things dangerous, as why !LTO
> > > > > > makes things safe...
> > > > >
> > > > > Because ignorant compilers are safe compilers!  ;-)
> > > >
> > > > AFAICT ignorance is no gurantee of ordering in general -- the compiler
> > > > is free to speculatively invent knowledge any place that the language
> > > > spec allows it to.  !LTO doesn't stop this happening.
> > >
> > > Agreed, according to the standard, the compiler has great freedom.
> > >
> > > We have two choices: (1) Restrict ourselves to live within the confines of
> > > the standard or (2) Pay continued close attention to the implementation.
> > > We have made different choices at different times, but for many ordering
> > > situations we have gone with door #2.
> > >
> > > Me, I have been working to get the standard to better support our
> > > use case.  This is at best slow going.  But don't take my word for it,
> > > ask Will.
> >
> > I can believe it.  They want to enable optimisations rather than prevent
> > them...
>
> Right in one!  ;-)
>
> > > > Hopefully some of the knowledge I invented in my reply is valid...
> > >
> > > It is.  It is just that there are multiple valid strategies, and the
> > > Linux kernel is currently taking a mixed-strategy approach.
> >
> > Ack.  The hope that there is a correct way to fix everything dies
> > hard ;)
>
> Either that, or one slowly degrades ones definition of "correct".  :-/
>
> > Life was cosier before I started trying to reason about language specs.
>
> Same here!
>
>                                                         Thanx, Paul



-- 
Thanks,
~Nick Desaulniers
