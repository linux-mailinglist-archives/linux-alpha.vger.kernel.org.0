Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3EEA3B4C25
	for <lists+linux-alpha@lfdr.de>; Sat, 26 Jun 2021 05:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhFZDWx (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 25 Jun 2021 23:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhFZDWx (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 25 Jun 2021 23:22:53 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3530C061766
        for <linux-alpha@vger.kernel.org>; Fri, 25 Jun 2021 20:20:31 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id pf4-20020a17090b1d84b029016f6699c3f2so9123244pjb.0
        for <linux-alpha@vger.kernel.org>; Fri, 25 Jun 2021 20:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m/r2jKnf6mzXHGS0+mY6tO8kdxoIVifevnwrBMvWaHk=;
        b=k5evDFcu122UMvrbb5kz6pJG46rSJobzAashV394QfzBP+VFZW1qcemLOWIMTqTwnO
         KhX0VgfKs97JSqirj7NxmKbJhyY7pwgk8AjhjA15rr2M34TyDxxbjmKofm2KW8+ZtL0q
         Wq8LJ8oNzBFS43JDygd5Msv1UzewtYzPIfmIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m/r2jKnf6mzXHGS0+mY6tO8kdxoIVifevnwrBMvWaHk=;
        b=dgyNklbU4J83uU4iFGlnByPSNm0W/wGjmsYY3En/+ryoLFl4VK1qG9SgEIy5WeEcvp
         OEOboM8Xpt0MH4JfWP6luGIj/ve4MM8ogkl2R5rt7J3SQM+3OB2D2kYfrBUoZDe2mysj
         znkManepvZ9ZO56mlIIBLVTpKrUp/xU0E07uzyKIKH0WLFqvVzN58yna+bLceAoFjwBm
         kEg4oClEgFiAFAwrExP/UIOD3SlOpj/dfkncWJ1DkYq53Kl2ANXnZq4rRps97Ud2SHWT
         6BI+8NyefAb6Isk7yp/+DVLrUdGi56p2fNA2cuhMcYaEZghXoxf3bTSUrHurL8eiGscV
         BNig==
X-Gm-Message-State: AOAM532TZdu3Gv30/aTBTtPaLyqzaKdq/8EXthSzVh/NLHQtbA39IkIA
        cAY36dcfqODqMuMVnovMH3/Zcg==
X-Google-Smtp-Source: ABdhPJx6GLx4csCnOZlukBXZovccTKxSC/6UVhMJK8OX54jANvNUvIHSf9UYkCV8OtkrYu2Hzi1FWg==
X-Received: by 2002:a17:90a:3d09:: with SMTP id h9mr23591717pjc.78.1624677631208;
        Fri, 25 Jun 2021 20:20:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h18sm6660549pgl.87.2021.06.25.20.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 20:20:30 -0700 (PDT)
Date:   Fri, 25 Jun 2021 20:20:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
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
        Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 3/9] signal/seccomp: Dump core when there is only one
 live thread
Message-ID: <202106252018.0EC329C@keescook>
References: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133>
 <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133>
 <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133>
 <875yy3850g.fsf_-_@disp2133>
 <87lf6z6qbd.fsf_-_@disp2133>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lf6z6qbd.fsf_-_@disp2133>
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, Jun 24, 2021 at 02:00:22PM -0500, Eric W. Biederman wrote:
> Replace get_nr_threads with atomic_read(&current->signal->live) as
> that is a more accurate number that is decremented sooner.

Okay, seems fine to me. :)

-- 
Kees Cook
