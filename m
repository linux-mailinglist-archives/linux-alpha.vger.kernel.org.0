Return-Path: <linux-alpha+bounces-66-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B1E7F3622
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Nov 2023 19:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E4E8281C34
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Nov 2023 18:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3E97468
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Nov 2023 18:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RSU8gWck"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7331018C
	for <linux-alpha@vger.kernel.org>; Tue, 21 Nov 2023 09:52:13 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cf74ad87e0so3877185ad.3
        for <linux-alpha@vger.kernel.org>; Tue, 21 Nov 2023 09:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700589133; x=1701193933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QB47EGfsEp2zY8aVpZ1yVDhEkhsejg57h9CxYIF9pMY=;
        b=RSU8gWck77NXCZny7Jlx/NGb4kecJIYRWEcnVjBCM/uqXAEoJdHhUR9mc+3fd+3N1+
         4RwXD+FketwnKRl+XE8iQbO7mIRu6fWQYVpKYyHla02fUrAk1gKVCW6D+nBilzQEjlme
         7cx9q0Zx7lRwYlfoPSnUxxlLPnCXR+aUde+b5glcJGWvxgYSbRtLrQLhIglyiJr6EZX6
         T49TaOQSYYzN7PcQ53SeoUfR0rfPInnLNbUOWT8MsZKb98HadmV6Cf0mcUA5YrYiusgZ
         r5ha3+rgR3CXJPtxty45laJGgi7HA7Wh3+MiCfUL9ZIc055H1QL8pjN3BtQcySHANkU4
         7GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700589133; x=1701193933;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QB47EGfsEp2zY8aVpZ1yVDhEkhsejg57h9CxYIF9pMY=;
        b=uw2koMqXP9gJzTN3+6hILvHqmKv/5tQK1fVCxmNfm14jBEnLz3hD3XiPqbOT4gm8rA
         jNlY9Lxdp7ztz/c6oZz5kNHUuKz9MgBcd/B5vXmgYZJNshvUM7MZXhNbAhxuOEFoPFVC
         WHaD9LzG6pQBRG/zrCTJKlzoD2Fcr6ctESfN21w8j1l+VVyZZUk1TY0J7qZ5RG3kHP9F
         V3l6WRTFBJeDOHgPBkQ4c0KdYgtnHppEFQsP6RHxbMCPsWhHRE4wpDU6qum95vc9tgtU
         /9pacN7RC5GMEMqA/sDUUNkFtk9USpdx9Z9c8xWIwd2ccBdPotS832bbkoHxPjh7ny7H
         O1/A==
X-Gm-Message-State: AOJu0Yx+ymcrrhsrPikHFP5CDGsKIWM4avO1PEC/JV8ArAGmpvgVpnu3
	AL/1fjALd8OgsOdc32asi3AHFg==
X-Google-Smtp-Source: AGHT+IFWYeTkevTsKJFuxiA1n9NmJm/3ZFZkrXCfs5QmtKQPONxovvZR+2Zqk+21Ud++2IVfWkz2tg==
X-Received: by 2002:a17:903:1205:b0:1bb:598a:14e5 with SMTP id l5-20020a170903120500b001bb598a14e5mr14104285plh.43.1700589132895;
        Tue, 21 Nov 2023 09:52:12 -0800 (PST)
Received: from [172.20.7.39] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id ju4-20020a170903428400b001cc3875e658sm8267124plb.303.2023.11.21.09.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 09:52:12 -0800 (PST)
Message-ID: <6c37708e-c345-4cad-b002-7cc18c9cb7ed@linaro.org>
Date: Tue, 21 Nov 2023 11:52:09 -0600
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] tty: srmcons: make 'str_cr' const and non-array
Content-Language: en-US
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, linux-alpha@vger.kernel.org
References: <20231121092258.9334-1-jirislaby@kernel.org>
 <20231121092258.9334-18-jirislaby@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231121092258.9334-18-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *

On 11/21/23 03:22, Jiri Slaby (SUSE) wrote:
> 'str_cr' contains a single character: \n. There is no need to declare it

\r

> as array. Declare it as a variable, make it const and pass a pointer to
> it to callback_puts().
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> ---
>   arch/alpha/kernel/srmcons.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
> index c6b821afbfd3..a6cff61706b5 100644
> --- a/arch/alpha/kernel/srmcons.c
> +++ b/arch/alpha/kernel/srmcons.c
> @@ -91,7 +91,7 @@ srmcons_receive_chars(struct timer_list *t)
>   static void
>   srmcons_do_write(struct tty_port *port, const char *buf, int count)
>   {
> -	static char str_cr[1] = "\r";
> +	static const char str_cr = '\r';

An array of one element is fine -- what's wrong with that?
Adding const is an improvement though.


r~

