Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95CC215F46
	for <lists+linux-alpha@lfdr.de>; Mon,  6 Jul 2020 21:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgGFTXj (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 6 Jul 2020 15:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgGFTXj (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Mon, 6 Jul 2020 15:23:39 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C516EC061794
        for <linux-alpha@vger.kernel.org>; Mon,  6 Jul 2020 12:23:38 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id t4so15088096oij.9
        for <linux-alpha@vger.kernel.org>; Mon, 06 Jul 2020 12:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7rVviAD5LzlDObQk5Wo1OIPXX0O0i14V8Y9kck3sGsA=;
        b=kktLS6II7R90NPohUeMToqXFTW9/KTTxKsvR9z6CQOtuYiA+UR1ubootJAzBto7yuJ
         AbRvCe66+Tt8q+e7CaqjBO/+BqOggtYUZd94QOOMy3P6tdZbgMFUX2kKcMpO2rBMAiQV
         5P3zf0HiGPY4b0db3+VWxD2tkv5CY7XEZlXVtx3qjIKDMVpq9AFvxZ2W+5yyNFj3mHWq
         KzP6T0h5FK7Z0GIwe04akbYFIG6ZBAT1RiOTM/kh1P3VhD+BMpi4H6OFelIwdriMLqyW
         CZAxAVAwkoGHY7q2qlbqV+rOUxl6ESs/jNfXniEGzfMGnS5htYM2u2lyMprNvZeKvtN3
         U91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7rVviAD5LzlDObQk5Wo1OIPXX0O0i14V8Y9kck3sGsA=;
        b=TLWfT8vXdlx5TMTxWqSik1wxPTKAqwzHocAyYEe+cfrcs1b2I/zTbMOU3f2jr1nsEo
         ABKqf2B5viDzL0CevoDC243469tCsEcs/f4MQXwfigfNZuAyLQhGnXY+oRurjL8EWXUP
         /usT87Ka47MdS2G7BXaJYbvWXisXRjzX+rCB9XYeqfQf7zziQVvcZ4LL0FvVXOXrL0J3
         lBm4tYgUP4MlxkSSUQtpv9XFkiPNprjEFFJN7OM41GhHkk22thWoZL9HJ9mmQ4G51+vf
         zOCXEwdGS6/JxypPQ7UH21KPEDBolXx+leiZm56IFpa52pdtuILXViqLvT0qgV54medQ
         TLtw==
X-Gm-Message-State: AOAM531iBy1CY/pbfrsup4E1yj5s2BaykVxTlEFnlu79y7QNTSSyWZAl
        +SZEkHtBYVog0d547IcMnXuk5Rf1XblEIq+WFJNdHg==
X-Google-Smtp-Source: ABdhPJzDA9ukIWYEyzFrrnOq5gnL5jJJGkB5l/SHZwqTzTGYEqqNcILaV0tH8QfdlHzy2n6eGpcpSpiSxjL7cUQQYHg=
X-Received: by 2002:aca:5007:: with SMTP id e7mr682320oib.70.1594063417791;
 Mon, 06 Jul 2020 12:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200630173734.14057-1-will@kernel.org> <20200630173734.14057-19-will@kernel.org>
 <20200701170722.4rte5ssnmrn2uqzg@bakewell.cambridge.arm.com>
 <20200702072301.GA15963@willie-the-truck> <20200706160023.GB10992@arm.com> <20200706183542.GB23766@willie-the-truck>
In-Reply-To: <20200706183542.GB23766@willie-the-truck>
From:   Marco Elver <elver@google.com>
Date:   Mon, 6 Jul 2020 21:23:26 +0200
Message-ID: <CANpmjNP9pb4_2S8sf+Ty2ZqtMxWSrBEosDx2wuL2OQnA9YFt9A@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: lto: Strengthen READ_ONCE() to acquire when CLANG_LTO=y
To:     Will Deacon <will@kernel.org>
Cc:     Dave Martin <Dave.Martin@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization@lists.linux-foundation.org,
        Arnd Bergmann <arnd@arndb.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Sami Tolvanen <samitolvanen@google.com>,
        Matt Turner <mattst88@gmail.com>,
        Android Kernel Team <kernel-team@android.com>,
        Kees Cook <keescook@chromium.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Richard Henderson <rth@twiddle.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Mon, 6 Jul 2020 at 20:35, Will Deacon <will@kernel.org> wrote:
> On Mon, Jul 06, 2020 at 05:00:23PM +0100, Dave Martin wrote:
> > On Thu, Jul 02, 2020 at 08:23:02AM +0100, Will Deacon wrote:
> > > On Wed, Jul 01, 2020 at 06:07:25PM +0100, Dave P Martin wrote:
> > > > Also, can you illustrate code that can only be unsafe with Clang LTO?
> > >
> > > I don't have a concrete example, but it's an ongoing concern over on the LTO
> > > thread [1], so I cooked this to show one way we could deal with it. The main
> > > concern is that the whole-program optimisations enabled by LTO may allow the
> > > compiler to enumerate possible values for a pointer at link time and replace
> > > an address dependency between two loads with a control dependency instead,
> > > defeating the dependency ordering within the CPU.
> >
> > Why can't that happen without LTO?
>
> It could, but I'd argue that it's considerably less likely because there
> is less information available to the compiler to perform these sorts of
> optimisations. It also doesn't appear to be happening in practice.
>
> The current state of affairs is that, if/when we catch the compiler
> performing harmful optimistations, we look for a way to disable them.
> However, there are good reasons to enable LTO, so this is one way to
> do that without having to worry about the potential impact on dependency
> ordering.

If it's of any help, I'll see if we can implement that warning in LLVM
if data dependencies somehow disappear (although I don't have any
cycles to pursue right now myself). Until then, short of manual
inspection or encountering a bug in the wild, there is no proof any of
this happens or doesn't happen.

Also, as some anecdotal evidence it's extremely unlikely, even with
LTO: looking at the passes that LLVM runs, there are a number of
passes that seem to want to eliminate basic blocks, thereby getting
rid of branches. Intuitively, it makes sense, because branches are
expensive on most architectures (for GPU targets, I think it tries
even harder to get rid of branches). If we extend our reasoning and
assumptions of LTO's aggressiveness in that direction, we might
actually end up with fewer branches. That might be beneficial for the
data dependencies we worry about (but not so much for control
dependencies we want to keep). Still, no point in speculating (no pun
intended) until we have hard data what actually happens. :-)

Thanks,
-- Marco
