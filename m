Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8DC02A835D
	for <lists+linux-alpha@lfdr.de>; Thu,  5 Nov 2020 17:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgKEQT6 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 5 Nov 2020 11:19:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgKEQT5 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Thu, 5 Nov 2020 11:19:57 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A78C0613CF
        for <linux-alpha@vger.kernel.org>; Thu,  5 Nov 2020 08:19:57 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id n5so1870419ile.7
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2020 08:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=kXwLcH9t+0eJDCUNwZd4GJMyLTOultsm92dhCeYpXEg=;
        b=MJSznFJATOaoKOnfNI/7M/gh+pGJuGzkSCf8cEVaq8YkuLdRqAnO0xYqpnqyqeClL8
         P0LikcuE7xZExEAJuPU0pmGAA5/seTFJ293hlKGV/kTGpiAwa3I3ETHwu83juhaAXG3p
         XDWxTjLHp/AGY/m4gFTe+T5zIF9nozCEY5Bl0MGZYf2yrmEyksxe6DtoLqiUZKQy3u+7
         QWLk085VqYAVvgBKR5iRVph3HUNvFpM4LKRgEov3cX7IFzSrE5dy5vMFqmMarFbkB9lc
         FR0XOTGBT7G7dIeBTyCtLBGBJXaaTD6tNqGp/iTAshfkwEfoO+Z9q8fwG2UCjzgyLARx
         9epQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kXwLcH9t+0eJDCUNwZd4GJMyLTOultsm92dhCeYpXEg=;
        b=El6v+cjyhuizkw7kgiKyAWJKkaG4ZeKrPgWEhqKp+3b++XrNiIvfUyXlwOTWXwA2jF
         f3KeOZNGKUJUhHovPt6NMXi3+yg4I5h7JNcMyGCgkRT/lFAd6JaKdDNKonVHlqdQfHoB
         IQSPrFXux63cZS0NXjCa/tF6lwwURQHMkPKnn6lspL24DXw2+Klegr8HiMNHSaLxCzTV
         JDRhGUe/0W4e0bjew4Nu4VwwODaLZjzq9tdlaV9YyqSHmjJlVeZp1wzOEJ7xAVO6aFmy
         7vCjauG4/Ah0lxxMUIvcNRhe3lk9iGUo9tMiUs9OnKX6tbKlB7YfheLXp7WE3Q1IRwwT
         JKdw==
X-Gm-Message-State: AOAM531/B+jHM3IwEzlpslOHakiLsHci9vdZz0dcwdQneLWYHnNCu7EZ
        q4p/Pl9RKRVUx1Iy3JXma1oV9UApoECnSw==
X-Google-Smtp-Source: ABdhPJxt6y7gtrIupz/hNwIGKW9S4L2JGcOIb04Qc0f9uf7nBNaq/llHNtt4GrW2HLZ+4m0qGgGXaA==
X-Received: by 2002:a92:650d:: with SMTP id z13mr2469232ilb.23.1604593196841;
        Thu, 05 Nov 2020 08:19:56 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id h6sm1363799ils.14.2020.11.05.08.19.56
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 08:19:56 -0800 (PST)
Subject: Re: [PATCH] alpha: add support for TIF_NOTIFY_SIGNAL
From:   Jens Axboe <axboe@kernel.dk>
To:     linux-alpha@vger.kernel.org
References: <e04d1f77-9131-15b4-321a-ba0d9c22ff52@kernel.dk>
Message-ID: <1d7ff5d2-a44a-d968-1072-e2160200a6bf@kernel.dk>
Date:   Thu, 5 Nov 2020 09:19:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e04d1f77-9131-15b4-321a-ba0d9c22ff52@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Gentle nudge on this one.

On 10/29/20 10:00 AM, Jens Axboe wrote:
> Wire up TIF_NOTIFY_SIGNAL handling for alpha.
> 
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---
> 
> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
> for details:
> 
> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
> 
> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
> as that will enable a set of cleanups once all of them support it. I'm
> happy carrying this patch if need be, or it can be funelled through the
> arch tree. Let me know.
> 
>  arch/alpha/include/asm/thread_info.h | 2 ++
>  arch/alpha/kernel/entry.S            | 2 +-
>  arch/alpha/kernel/signal.c           | 2 +-
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
> index 807d7b9a1860..2592356e3215 100644
> --- a/arch/alpha/include/asm/thread_info.h
> +++ b/arch/alpha/include/asm/thread_info.h
> @@ -62,6 +62,7 @@ register struct thread_info *__current_thread_info __asm__("$8");
>  #define TIF_SIGPENDING		2	/* signal pending */
>  #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
>  #define TIF_SYSCALL_AUDIT	4	/* syscall audit active */
> +#define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
>  #define TIF_DIE_IF_KERNEL	9	/* dik recursion lock */
>  #define TIF_MEMDIE		13	/* is terminating due to OOM killer */
>  #define TIF_POLLING_NRFLAG	14	/* idle is polling for TIF_NEED_RESCHED */
> @@ -71,6 +72,7 @@ register struct thread_info *__current_thread_info __asm__("$8");
>  #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
>  #define _TIF_NOTIFY_RESUME	(1<<TIF_NOTIFY_RESUME)
>  #define _TIF_SYSCALL_AUDIT	(1<<TIF_SYSCALL_AUDIT)
> +#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
>  #define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
>  
>  /* Work to do on interrupt/exception return.  */
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index 2e09248f8324..6a90d05cae1f 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -544,7 +544,7 @@ $ret_success:
>  	.align	4
>  	.type	work_pending, @function
>  work_pending:
> -	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING, $2
> +	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING, | _TIF_NOTIFY_SIGNAL, $2
>  	bne	$2, $work_notifysig
>  
>  $work_resched:
> diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
> index 3739efce1ec0..948b89789da8 100644
> --- a/arch/alpha/kernel/signal.c
> +++ b/arch/alpha/kernel/signal.c
> @@ -527,7 +527,7 @@ do_work_pending(struct pt_regs *regs, unsigned long thread_flags,
>  			schedule();
>  		} else {
>  			local_irq_enable();
> -			if (thread_flags & _TIF_SIGPENDING) {
> +			if (thread_flags & (_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)) {
>  				do_signal(regs, r0, r19);
>  				r0 = 0;
>  			} else {
> 


-- 
Jens Axboe

