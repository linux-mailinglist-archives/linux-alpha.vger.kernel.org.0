Return-Path: <linux-alpha+bounces-64-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 055A47F361F
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Nov 2023 19:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8953BB21BCA
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Nov 2023 18:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88915101C
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Nov 2023 18:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jtj8h/Gj"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB041197
	for <linux-alpha@vger.kernel.org>; Tue, 21 Nov 2023 09:48:47 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6bd32d1a040so5932286b3a.3
        for <linux-alpha@vger.kernel.org>; Tue, 21 Nov 2023 09:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700588927; x=1701193727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U7Rbioe+AA0m1Xzil+Qj4X93APjsim1oxKrG1rmg9wU=;
        b=jtj8h/Gj/UcUVARWjUu8hsv2XBagNerBCPsxfyimIMsk02UtbmkkJ6NfwvqK0YA1RF
         YV6rNmVivqMstbTM+l7MFHUVEMV5+SgYMtYHT6QIY0fgiOt/J+q7iKyBZjFqGQH9gTgI
         ed3fj7YM5RC5g6Gn2ZvlAm5aoFHP6T0jfUNw1Ixshob9ozIyWxJubUtbQh2fRYDxrpaQ
         o/UBNLmaW2gxvMfvKFLOUtLlVNJ1Q5oytxNPOfG/i6jzlIqd0E2+ICiyGwYWnsfncMhs
         I4uAwbMlGBP5bmtKqzMaP8QPn6fthkT5W/GR/rjmo7g3JMOl/Ye6eh+I4k4Srx2Xj6eQ
         /dKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700588927; x=1701193727;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U7Rbioe+AA0m1Xzil+Qj4X93APjsim1oxKrG1rmg9wU=;
        b=BQMs/ZWa2XtjI3eNAqlw1dMWePJ+f7x81wHi4W+txTOfPKB/GHIQGdh4gFXA0FrCke
         0Etg/4Qm2KewtpdHXfXaVfktC0hbJeFu45WWKhKPNN2s3LhPSVYAAFQgGUYJ+xugtser
         +18bdczCc7vZCSU96o23dgfBWPa3s8+0k5gc7RXsDHC7nlsHvpOf/iYWKayWbsN5C5dt
         Hh0sPUwX/DHVv/yZRL9N12IJHJiM4zM24dsom1RtReIy7nn3Maq5Ok58BQ0a2ZW4DQlD
         zGsX7oraD/mbA1eYfTG65EG1AppccCVP8AIdaXsRKv8wvVNsNQIgrnhcxB653/kLslpW
         ZVSA==
X-Gm-Message-State: AOJu0YwoMsjz+wqlbwTHy8IS1/rxb2UcFy3jTNbSewIjIriiZSadaDQX
	aP3xw71/PP5ZiZ+vn90a9INLfw==
X-Google-Smtp-Source: AGHT+IH2VR6y5Gp7PFy+FKIjD6rAI0xCdmN7BDgDaHvXjsz7rNoF2oUSGeO6SUsyI6QYtEVokRmWlA==
X-Received: by 2002:a05:6a00:15d2:b0:6cb:903a:b064 with SMTP id o18-20020a056a0015d200b006cb903ab064mr9034307pfu.22.1700588927322;
        Tue, 21 Nov 2023 09:48:47 -0800 (PST)
Received: from [172.20.7.39] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id b11-20020a056a000ccb00b006cb69ff0444sm5547127pfv.151.2023.11.21.09.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 09:48:46 -0800 (PST)
Message-ID: <f4babac1-8366-45a2-94c2-838cacb4a006@linaro.org>
Date: Tue, 21 Nov 2023 11:48:44 -0600
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/17] tty: srmcons: use 'count' directly in
 srmcons_do_write()
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-serial <linux-serial@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, linux-alpha@vger.kernel.org
References: <20231121092258.9334-1-jirislaby@kernel.org>
 <20231121092258.9334-15-jirislaby@kernel.org>
 <4f0db52-6430-9122-1ecc-86e337644944@linux.intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4f0db52-6430-9122-1ecc-86e337644944@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: *

On 11/21/23 09:21, Ilpo Järvinen wrote:
> On Tue, 21 Nov 2023, Jiri Slaby (SUSE) wrote:
> 
>> Similarly to 'buf' in the previous patch, there is no need to have a
>> separate counter ('remaining') in srmcons_do_write(). 'count' can be
>> used directly which simplifies the code a bit.
>>
>> Note that the type of the current count ('c') is changed from 'long' to
>> 'size_t' so that:
>> 1) it is prepared for the upcoming change of 'count's type, and
>> 2) is unsigned.
>>
>> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
>> Cc: Matt Turner <mattst88@gmail.com>
>> Cc: linux-alpha@vger.kernel.org
>> ---
>>   arch/alpha/kernel/srmcons.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
>> index b68c5af083cd..8025e2a882ed 100644
>> --- a/arch/alpha/kernel/srmcons.c
>> +++ b/arch/alpha/kernel/srmcons.c
>> @@ -92,24 +92,24 @@ static int
>>   srmcons_do_write(struct tty_port *port, const char *buf, int count)
>>   {
>>   	static char str_cr[1] = "\r";
>> -	long c, remaining = count;
>> +	size_t c;
>>   	srmcons_result result;
>>   	int need_cr;
>>   
>> -	while (remaining > 0) {
>> +	while (count > 0) {
>>   		need_cr = 0;
>>   		/*
>>   		 * Break it up into reasonable size chunks to allow a chance
>>   		 * for input to get in
>>   		 */
>> -		for (c = 0; c < min_t(long, 128L, remaining) && !need_cr; c++)
>> +		for (c = 0; c < min_t(size_t, 128U, count) && !need_cr; c++)
>>   			if (buf[c] == '\n')
>>   				need_cr = 1;
>>   		
>>   		while (c > 0) {
>>   			result.as_long = callback_puts(0, buf, c);
>>   			c -= result.bits.c;
>> -			remaining -= result.bits.c;
>> +			count -= result.bits.c;
>>   			buf += result.bits.c;
>>   
>>   			/*
>>
> 
> The patches in the series are in pretty odd order and it was not told
> anywhere here that the return value is unused by the callers. I'd just
> reorder the patches.
> 

Agreed, patch 15 needs to be before patch 14.  With that,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

