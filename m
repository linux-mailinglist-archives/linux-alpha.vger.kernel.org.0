Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ACEF20FCF0
	for <lists+linux-alpha@lfdr.de>; Tue, 30 Jun 2020 21:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbgF3Trn (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 30 Jun 2020 15:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgF3Trn (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 30 Jun 2020 15:47:43 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AEDBC061755
        for <linux-alpha@vger.kernel.org>; Tue, 30 Jun 2020 12:47:43 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id t4so666405oij.9
        for <linux-alpha@vger.kernel.org>; Tue, 30 Jun 2020 12:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9UKxlIJOTY2zx2nzmpDV6yMhwVzomovdk4iBLHXz+to=;
        b=b5QTXRyrtvJIel7TqOAPE7QxmKK0A0Kk/L9Y88ohrYuISTLLPdp5HH9fUHPSEDqcTq
         etgp/5shPJOkJzg9Azw7IAVltGons+60NY0zqsd3wibTXJCm7bDqpHR4MPEfSKZzdKFY
         RaVLrZFIUpykTrxj5+s/RbG50eBIV8k/bAMIsgo/F2IPeaMwuK8gvy97eT9jx28c4BLJ
         n+G1HzxZvlmPyqoBCikNS2FAk3hiUfcugrxlaT9FJD/xkpXz+luMfWgNw9gAEJLh0JfU
         sbJELKGA/NjGmfY/jqBwt2FR3nBPIvf0eHx8gW0vJwhwxCXQXRWsrnRGHLL8vwBPP+iw
         v1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9UKxlIJOTY2zx2nzmpDV6yMhwVzomovdk4iBLHXz+to=;
        b=ozKKkjsxXP3AiVqdAEv+jzImlrEG9uZE1XEYBvKhX4eZTDh5eZDcJauIdOZs3qMpQJ
         IFE21oMzK4TZ+NPlSp3M0/lXK41xFOeoJLKwj9sk/ND+zvbxujWqFPZWZcei8ZjpLGI/
         32TcniuxtoT9m3OpM8SlVeWCFLzbQSZ77B5mXUwm84JypEtf4myB6aG2W9GlVwA1pAC3
         HMm780p0ZWuFhoBrJZ/0ZtdFsOtYr73zp1elIUcWuKz8HaIAZNdlqNcnXDRSNXvlnnWG
         SCOpvEMnAUmKXDWK6Kwsv6IyEZ+VP/7SDWPiCNMfGBWzku1A/P8nTC0mFhftH/9dpb+N
         VcRg==
X-Gm-Message-State: AOAM533ma7oDhdQeA/hoU0DT61laLzccTeucY51X1j0GRpwITCHY7rSQ
        OC9JNaoMo79wtSIIppkWKkFW7tb0Hvxm1PuwManHVw==
X-Google-Smtp-Source: ABdhPJzl9oZuNesnaQZ/teRrLRE7pNmT9CEUr1yOCRE9DkovB1JFdxUa5I7sAEWXrcc+60LRYFXJ6PfgRURsOozdFbY=
X-Received: by 2002:a05:6808:3ab:: with SMTP id n11mr12490827oie.121.1593546462237;
 Tue, 30 Jun 2020 12:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200630173734.14057-1-will@kernel.org> <20200630173734.14057-19-will@kernel.org>
In-Reply-To: <20200630173734.14057-19-will@kernel.org>
From:   Marco Elver <elver@google.com>
Date:   Tue, 30 Jun 2020 21:47:30 +0200
Message-ID: <CANpmjNPOO=AVsVJMdL8sq03jwHsDR_1_FfWccwaLKEBRn1RFtA@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: lto: Strengthen READ_ONCE() to acquire when CLANG_LTO=y
To:     Will Deacon <will@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Matt Turner <mattst88@gmail.com>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Richard Henderson <rth@twiddle.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, 30 Jun 2020 at 19:39, Will Deacon <will@kernel.org> wrote:
>
> When building with LTO, there is an increased risk of the compiler
> converting an address dependency headed by a READ_ONCE() invocation
> into a control dependency and consequently allowing for harmful
> reordering by the CPU.
>
> Ensure that such transformations are harmless by overriding the generic
> READ_ONCE() definition with one that provides acquire semantics when
> building with LTO.
>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/rwonce.h   | 63 +++++++++++++++++++++++++++++++
>  arch/arm64/kernel/vdso/Makefile   |  2 +-
>  arch/arm64/kernel/vdso32/Makefile |  2 +-
>  3 files changed, 65 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/include/asm/rwonce.h

This seems reasonable, given we can't realistically tell the compiler
about dependent loads. What (if any), is the performance impact? I
guess this also heavily depends on the actual silicon.

I do wonder, though, if there is some way to make the compiler do
something better for us. Clearly, implementing real
memory_order_consume hasn't worked out until today. But maybe the
compiler could promote dependent loads to acquires if it recognizes it
lost dependencies during optimizations. Just thinking out loud, it
probably still has some weird corner case that will break. ;-)

The other thing is that I'd be cautious blaming LTO, as I tried to
summarize here:
https://lore.kernel.org/kernel-hardening/20200630191931.GA884155@elver.google.com/

The main thing is that, yes, this might be something to be worried
about, but if we are worried about it, we need to be worried about it
in *all* builds (LTO or not). My guess is that's not acceptable. Would
it be better to just guard the promotion of READ_ONCE() to acquire
behind a config option like CONFIG_ACQUIRE_READ_DEPENDENCIES, and then
make LTO select that (or maybe leave it optional?). In future, for
very aggressive non-LTO compilers even, one may then also select that
if there is substantiated worry things do actually break.

Thanks,
-- Marco
