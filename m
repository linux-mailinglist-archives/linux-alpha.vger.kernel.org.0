Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A7C3B4C28
	for <lists+linux-alpha@lfdr.de>; Sat, 26 Jun 2021 05:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhFZD03 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 25 Jun 2021 23:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhFZD02 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 25 Jun 2021 23:26:28 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB247C061574
        for <linux-alpha@vger.kernel.org>; Fri, 25 Jun 2021 20:24:06 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id o3so606438plg.4
        for <linux-alpha@vger.kernel.org>; Fri, 25 Jun 2021 20:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZYiH9nK6crmHzzEefhGaKJK98dSESEicqRD9TcJugLA=;
        b=DcagL9ukyAri4GHOF/R0Zf3Iu0Lo6msYVkx5FGprR+PMGBy9p9RQixD9ErVc1gzXH6
         mSli7Te1XBpclsd+1tAr6ijhr8hce6Hp3XBsdEJyda/f94I0H+WZ5DnF+oq1N6s+TGRd
         RJdvcGL/FQ4D2d/B27HhdT/IBBdxghruULKz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZYiH9nK6crmHzzEefhGaKJK98dSESEicqRD9TcJugLA=;
        b=NNh7BbTj95VcOcpESYxy1V1FEF+nuh8v4tbnOh8r2FSm7UmT8x1phyrM0SghFuGDDl
         8Bw7iebb21WiL9yHr0+elEHfs6M/8Iz3gLiE0iJqZ+HGxb1VUdtSEmCTta1cMYvWawNi
         FVE6SwPMPSsaACU49L7Hzl2NEnbXUV2TLjC2xe+L/jcIDyP8YJnZXqwNDxjYGO3fUopv
         Hz+xexCJoPU4jOklyBvLyL9hVl7IfCCTvgeFRCtitLQNFo9e6Tydi+2jgcW/bQlWxMGz
         seaKVrpk7cuvr7pif/tv/XTcxw3CGY5+IUQJ6jATwoE4ZJqoVGKlNvEYXtZafisksm3P
         SalQ==
X-Gm-Message-State: AOAM532gLA9n3CtwoF/DZvY+X13xbI2lJdNo1dzCzhla4aKiQYVbC5SM
        NlQKnBSdrg1XoHX1o5aFS54Psg==
X-Google-Smtp-Source: ABdhPJzaO+QEnFQnNol01zQxJCk+8I37gEbzWkLNj3gUl/PIejMlM+53/MOUevmSyYRVKywcyg4+IA==
X-Received: by 2002:a17:902:e850:b029:127:a2ed:9924 with SMTP id t16-20020a170902e850b0290127a2ed9924mr8346735plg.57.1624677846193;
        Fri, 25 Jun 2021 20:24:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k7sm1724628pfp.65.2021.06.25.20.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 20:24:05 -0700 (PDT)
Date:   Fri, 25 Jun 2021 20:24:04 -0700
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
Subject: Re: [PATCH 4/9] signal: Factor start_group_exit out of
 complete_signal
Message-ID: <202106252022.79A9A1A@keescook>
References: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133>
 <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133>
 <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133>
 <875yy3850g.fsf_-_@disp2133>
 <87czsb6q9r.fsf_-_@disp2133>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87czsb6q9r.fsf_-_@disp2133>
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, Jun 24, 2021 at 02:01:20PM -0500, Eric W. Biederman wrote:
> +static void start_group_exit_locked(struct signal_struct *signal, int exit_code)
> +{
> +	/*
> +	 * Start a group exit and wake everybody up.
> +	 * This way we don't have other threads
> +	 * running and doing things after a slower
> +	 * thread has the fatal signal pending.
> +	 */
> +	struct task_struct *t;
> +
> +	signal->flags = SIGNAL_GROUP_EXIT;
> +	signal->group_exit_code = exit_code;
> +	signal->group_stop_count = 0;
> +	__for_each_thread(signal, t) {
> +		task_clear_jobctl_pending(t, JOBCTL_PENDING_MASK);
> +
> +		/* Don't bother with already dead threads */
> +		if (t->exit_state)
> +			continue;
> +		sigaddset(&t->pending.signal, SIGKILL);
> +		signal_wake_up(t, 1);
> +	}

This both extracts it and changes it. For ease-of-review, maybe split
this patch into the move and then the logic changes?

-- 
Kees Cook
