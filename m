Return-Path: <linux-alpha+bounces-67-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4387F3626
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Nov 2023 19:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3661B210D8
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Nov 2023 18:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AE25101C
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Nov 2023 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C/ZEMiJF"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69BD918E
	for <linux-alpha@vger.kernel.org>; Tue, 21 Nov 2023 09:58:31 -0800 (PST)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1f5d2e4326fso1978945fac.0
        for <linux-alpha@vger.kernel.org>; Tue, 21 Nov 2023 09:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700589510; x=1701194310; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=77qERLs0OaQrBVtVqKqY8REeDJgJr05nxeZrsBFakuY=;
        b=C/ZEMiJFlpYDHxuW1leUupyS6vNzdkfSumXePhGeFDhDCLK1cdurDgDjkbAhPXNUdR
         qkMPqpti0sv8HqkMMkuHCSYzgNvFI0Ov90tBF4Nv6cg5+5OqPKZXvlTRuq9K+WbzYN5k
         WMvrVAd5hyRH07yloQ5Oy095mdEMhN2JY5mXdGF9lG4G9LABX5tSNMEsaz38TfU7Sh9J
         5cbpvt0c92/hkvgReLQ9ijmal1MfBpcJEVdZP89dgqYwOHpNzxNhrva/oCM8Zk9zYnoO
         zBoqtlosoI7ovoSMcVOjXLZNV6ag4AhMV/oE/HzcRuLUAhMhWr7Th3SZ2Dqq+Mst6+wy
         +q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700589510; x=1701194310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77qERLs0OaQrBVtVqKqY8REeDJgJr05nxeZrsBFakuY=;
        b=uGOfF41f7vwxbfIa8g3vy5oqnQ4X/OO2pTXnoYyfTMr+aTiqeQj5Xdrzs+sTbiG0JZ
         u7MYwCQdzh28JdfZng+E60SLy5nGaGlZ/JIoB6My+Qis9/dFdJOPVW+JlEvIpoxzciWz
         BAA4r1txQN1IHbsJDYJeT6GRo+XtD/0aYosJFfzWpks1i/+sWbcR3h8XAZV7+hKzBk7P
         Nz+iAPNbkr7vAj3cbON6It+J4tgg0bYIRjEVCF2oyEt4Dr5DRDKtEoIlkMmwfjTEYCp/
         EivYf7Sq7zqNurk6mvHRQwA4cHw7m/GLByanJbPJp9dzwKULXvp7Sy4fFTYpog3evL7T
         hBSw==
X-Gm-Message-State: AOJu0Yyxpr+H26t5iv+CVi4Fa8v5udlMcgtnN6OZqjL4NadcyXusSSjH
	zBS/iJfoGK/4i3CppSECYKMGug==
X-Google-Smtp-Source: AGHT+IH2kHEJhg1L+w3IKpHNOng3FayS3H19pAQ9FtKcBKGQIPjhcoraxZrC/R/qsT/fQHVTmFyF/Q==
X-Received: by 2002:a05:6870:46a9:b0:1e9:b0fa:de48 with SMTP id a41-20020a05687046a900b001e9b0fade48mr7101338oap.47.1700589510707;
        Tue, 21 Nov 2023 09:58:30 -0800 (PST)
Received: from [172.20.7.39] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id j25-20020a9d7699000000b006b74bea76c0sm1648610otl.47.2023.11.21.09.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 09:58:30 -0800 (PST)
Message-ID: <885063ee-b0da-42cc-b836-da2117d4d3aa@linaro.org>
Date: Tue, 21 Nov 2023 11:58:27 -0600
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

Best to remove this entirely...

>   	size_t c;
>   	srmcons_result result;
>   
> @@ -119,7 +119,7 @@ srmcons_do_write(struct tty_port *port, const char *buf, int count)
>   		}
>   
>   		while (need_cr) {
> -			result.as_long = callback_puts(0, str_cr, 1);
> +			result.as_long = callback_puts(0, &str_cr, 1);

... and simply use "\r" here.

Logically it adds one '\0' of const data, but it is virtually certain that even more bytes 
of padding are present anyway.  As a string literal it will be placed into .rodata.str1.1 
and packed with other strings.


r~

