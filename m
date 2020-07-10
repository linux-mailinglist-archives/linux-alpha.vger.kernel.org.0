Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5A3B21BBD2
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Jul 2020 19:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbgGJRGZ (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 10 Jul 2020 13:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727818AbgGJRGZ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 10 Jul 2020 13:06:25 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE5DC08C5DC
        for <linux-alpha@vger.kernel.org>; Fri, 10 Jul 2020 10:06:24 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k71so2880919pje.0
        for <linux-alpha@vger.kernel.org>; Fri, 10 Jul 2020 10:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hUUzdCZO7cOEjM8UPSu4KBBKoTC+8Tu1Me77yU74KLk=;
        b=UZTVAEzHrsDgJP78s0HloMVAuOUv3FwX+DkXiwaS0QhCqsLNWEjmofaPfN4D13+xg+
         BXiB46hVqKuzlU7JoyckRiIHwh8eGyd8gGxEi9O1BwL+1P/cRbqBwVU3NWsmo3jSL4l9
         sK2C6Hhp6l7SFYFGpy9L6KyQhlcX5x0cBHA3os+6EbKa6iuTXdVzIjwVL4gp0efhbmKq
         3q4cS8CGyGDDCIUSAV4fAFNjDW+GCUveiPds2A4egvjqPn80FdFfufNw0eG/H0hGL++P
         aVvXZMeqKdhDD7WWZzYD19p+Cqs1MhDi+umLiVd5HPTI/xU3ULgd5VV28V7wtZ5UHeRv
         5k8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hUUzdCZO7cOEjM8UPSu4KBBKoTC+8Tu1Me77yU74KLk=;
        b=Wr0DUom6kbyiBsy89h2dfbsSiaSLthPug0kygsuUoOGnZ3BMq4klgzY3vja6o7cMvJ
         5EII2BMu/dJx7+s2a5j1v1ak0gECVSCUVLkKgQw8QoqbB1Vm47fzs5vB3XaC3xK2V48F
         mXF8YIUuA1FEtnvT3WldyGrj8fwsv0z9EG6NQMz6m5eh7067YM+Xw0kVaX0d/caj0MEz
         pxwcNt2QJK+nThnSRC5udpxGk0WlTsFR2GK72qUgJ4T+4KlNPhbaEHrl0AWljPMoPLjv
         865+ZSljO0Gae9hwaKkeSTZzrIW0z3ByJXsyo+ePnZ2PW8842Hqxbww6RMo/nDJnvCB3
         Bp6w==
X-Gm-Message-State: AOAM530djj+SaLBwbPgKDWr34UlBXo38OX0wLLoyf+7NXpAaR7jfF/Ki
        9f0lVgjLNiSsa83masCD3rlJX1oHEzWiYVOoVv5kVg==
X-Google-Smtp-Source: ABdhPJwRQBEK6dyNFlDfbU4Yt4nNc6ZeNycLC+s5xlWnA3CaJIsX3y9fd/e3NodN8pbHV0qttAg1iJmTBh6hiUMsM6Q=
X-Received: by 2002:a17:90a:21ef:: with SMTP id q102mr6946097pjc.101.1594400784244;
 Fri, 10 Jul 2020 10:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200710165203.31284-1-will@kernel.org> <20200710165203.31284-7-will@kernel.org>
In-Reply-To: <20200710165203.31284-7-will@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 10 Jul 2020 10:06:12 -0700
Message-ID: <CAKwvOd=HJye0iHr=9=7EMytO8ycFNJEsHHe1m64uT8s0jOQw0Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/19] asm/rwonce: Don't pull <asm/barrier.h> into 'asm-generic/rwonce.h'
To:     Will Deacon <will@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Joel Fernandes <joelaf@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Kees Cook <keescook@chromium.org>,
        Marco Elver <elver@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-alpha@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Fri, Jul 10, 2020 at 9:52 AM Will Deacon <will@kernel.org> wrote:
>
> Now that 'smp_read_barrier_depends()' has gone the way of the Norwegian
> Blue, drop the inclusion of <asm/barrier.h> in 'asm-generic/rwonce.h'.
>
> This requires fixups to some architecture vdso headers which were
> previously relying on 'asm/barrier.h' coming in via 'linux/compiler.h'.
>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm/include/asm/vdso/gettimeofday.h          | 1 +
>  arch/arm64/include/asm/vdso/compat_gettimeofday.h | 1 +
>  arch/arm64/include/asm/vdso/gettimeofday.h        | 1 +
>  arch/riscv/include/asm/vdso/gettimeofday.h        | 1 +
>  include/asm-generic/rwonce.h                      | 2 --
>  include/linux/nospec.h                            | 2 ++
>  6 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/include/asm/vdso/gettimeofday.h b/arch/arm/include/asm/vdso/gettimeofday.h
> index 36dc18553ed8..1b207cf07697 100644
> --- a/arch/arm/include/asm/vdso/gettimeofday.h
> +++ b/arch/arm/include/asm/vdso/gettimeofday.h
> @@ -7,6 +7,7 @@
>
>  #ifndef __ASSEMBLY__
>
> +#include <asm/barrier.h>
>  #include <asm/errno.h>
>  #include <asm/unistd.h>
>  #include <asm/vdso/cp15.h>
> diff --git a/arch/arm64/include/asm/vdso/compat_gettimeofday.h b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
> index b6907ae78e53..bcf7649999a4 100644
> --- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
> +++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
> @@ -7,6 +7,7 @@
>
>  #ifndef __ASSEMBLY__
>
> +#include <asm/barrier.h>
>  #include <asm/unistd.h>
>  #include <asm/errno.h>
>
> diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
> index afba6ba332f8..127fa63893e2 100644
> --- a/arch/arm64/include/asm/vdso/gettimeofday.h
> +++ b/arch/arm64/include/asm/vdso/gettimeofday.h
> @@ -7,6 +7,7 @@
>
>  #ifndef __ASSEMBLY__
>
> +#include <asm/barrier.h>
>  #include <asm/unistd.h>
>
>  #define VDSO_HAS_CLOCK_GETRES          1
> diff --git a/arch/riscv/include/asm/vdso/gettimeofday.h b/arch/riscv/include/asm/vdso/gettimeofday.h
> index c8e818688ec1..3099362d9f26 100644
> --- a/arch/riscv/include/asm/vdso/gettimeofday.h
> +++ b/arch/riscv/include/asm/vdso/gettimeofday.h
> @@ -4,6 +4,7 @@
>
>  #ifndef __ASSEMBLY__
>
> +#include <asm/barrier.h>
>  #include <asm/unistd.h>
>  #include <asm/csr.h>
>  #include <uapi/linux/time.h>
> diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
> index cc810f1f18ca..cd0302746fb4 100644
> --- a/include/asm-generic/rwonce.h
> +++ b/include/asm-generic/rwonce.h
> @@ -26,8 +26,6 @@
>  #include <linux/kasan-checks.h>
>  #include <linux/kcsan-checks.h>
>
> -#include <asm/barrier.h>
> -
>  /*
>   * Use __READ_ONCE() instead of READ_ONCE() if you do not require any
>   * atomicity. Note that this may result in tears!
> diff --git a/include/linux/nospec.h b/include/linux/nospec.h
> index 0c5ef54fd416..c1e79f72cd89 100644
> --- a/include/linux/nospec.h
> +++ b/include/linux/nospec.h
> @@ -5,6 +5,8 @@
>
>  #ifndef _LINUX_NOSPEC_H
>  #define _LINUX_NOSPEC_H
> +
> +#include <linux/compiler.h>

The other hunks LGTM, but this one is a little more curious to me. Can
you walk me through this addition?

>  #include <asm/barrier.h>
>
>  struct task_struct;
> --
> 2.27.0.383.g050319c2ae-goog
>


-- 
Thanks,
~Nick Desaulniers
