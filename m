Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A21C55A66B0
	for <lists+linux-alpha@lfdr.de>; Tue, 30 Aug 2022 16:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiH3OxB (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 30 Aug 2022 10:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiH3Ow7 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 30 Aug 2022 10:52:59 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1BB21037C6
        for <linux-alpha@vger.kernel.org>; Tue, 30 Aug 2022 07:52:58 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id y29so7517489pfq.0
        for <linux-alpha@vger.kernel.org>; Tue, 30 Aug 2022 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=VF2yFiQXsHFg7elo8aq6tkA58KhGU6nq72XqcwehWe4=;
        b=XZXsT8Id4sJb7OFK0gZZSv/2povrfct6wbmT+3Zzu4tjCBBi9ckJ2GoH4dcomkl1ID
         +9UKEyIv1myh9gpvwWeVjE/KSd2NEmHd9Zdqv+rRfiQ7TbDBjiCBip5XUl0+A77bgVUL
         HnGtz7C/ecJ5g2APqttxLpP6WrnRiofrIGUcUaZEZlt0qdVIBp7Wz8TzRO5mV6dAmnTY
         3yuY8lYum69Gtnm6MnD0K/n3SvnGK+fp5H0yLm8L+2lQ1xh6oIbHCq/jQ/DKgajojTM/
         Ew+QcBTP6t0wjN0ZRLTDpgGFo6o0JBxd5SAtL0v5WFVDIp7ffZiKA/wGHkZl3mVw2M8R
         wV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=VF2yFiQXsHFg7elo8aq6tkA58KhGU6nq72XqcwehWe4=;
        b=hAiqXtwvZuHQGNy0k6dyxuU70QU5Ro/fhirmiC33EfcuhSdFpPrBDTp/jmnzQ7lG7T
         X4JAGKM7fz/oxD4F2d9nppsBCDxUyhTT60XQMTjY/CPibNYFBdRjUBYlHYuUxoja7J6W
         2rijQWKfsvah/UrW4ouqJj+CgiyQ0tJthKUTWeI10NxgBXkrl5yWd0bwm2QNoF5IQ89J
         hcRHGU3bI9bWjdhrkGBJ5ZweLpWPCiRUssOghOyFx+aOFu8UzpWDOofAo7xwgl4q6M2B
         cYmSYxiCEnWnG8schs6NTKecgX/2jvtDt75VT3d23dl+abX5Fl7ZVRVXrYvlcCcw0C2R
         GhqA==
X-Gm-Message-State: ACgBeo23QMloHj1cQejXN/6rOW0xoa8F/Lbm0eJjji3zU9rDtLH+KzmH
        pMwxECIwsTXuLo5ra472X57HTA==
X-Google-Smtp-Source: AA6agR4QFwjwV2m/Y7BauKMj+1Nh3dfAv3u0+oa1Al9voYlvJzZip5BE2Xp40b38hMYBozxG+Lng9g==
X-Received: by 2002:a63:c7:0:b0:42e:8690:960e with SMTP id 190-20020a6300c7000000b0042e8690960emr2756146pga.234.1661871178131;
        Tue, 30 Aug 2022 07:52:58 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902684500b001635b86a790sm9695132pln.44.2022.08.30.07.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 07:52:57 -0700 (PDT)
Message-ID: <3ad149d0-916c-e80e-ef17-ca406a4d7f6d@linaro.org>
Date:   Tue, 30 Aug 2022 07:52:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] alpha: Fix double word in comments
Content-Language: en-US
To:     Shaomin Deng <dengshaomin@cdjrlc.com>, ink@jurassic.park.msu.ru,
        mattst88@gmail.com, linux-alpha@vger.kernel.org
References: <20220830074202.11274-1-dengshaomin@cdjrlc.com>
From:   Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220830074202.11274-1-dengshaomin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On 8/30/22 00:42, Shaomin Deng wrote:
> Delete the rebundant word "and" in comments.

typo.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> 
> Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
> ---
>   arch/alpha/kernel/irq_i8259.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/alpha/kernel/irq_i8259.c b/arch/alpha/kernel/irq_i8259.c
> index 1dcf0d9038fd..db574dcd6675 100644
> --- a/arch/alpha/kernel/irq_i8259.c
> +++ b/arch/alpha/kernel/irq_i8259.c
> @@ -147,7 +147,7 @@ isa_no_iack_sc_device_interrupt(unsigned long vector)
>   	 */
>   	/*
>   	 *  The first read of gives you *all* interrupting lines.
> -	 *  Therefore, read the mask register and and out those lines
> +	 *  Therefore, read the mask register and out those lines
>   	 *  not enabled.  Note that some documentation has 21 and a1
>   	 *  write only.  This is not true.
>   	 */

