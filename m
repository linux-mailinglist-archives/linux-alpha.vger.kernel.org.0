Return-Path: <linux-alpha+bounces-786-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D580F9453C7
	for <lists+linux-alpha@lfdr.de>; Thu,  1 Aug 2024 22:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 046641C23222
	for <lists+linux-alpha@lfdr.de>; Thu,  1 Aug 2024 20:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E9714A60A;
	Thu,  1 Aug 2024 20:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iLjXCbK2"
X-Original-To: linux-alpha@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF0A14A4E5
	for <linux-alpha@vger.kernel.org>; Thu,  1 Aug 2024 20:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722544584; cv=none; b=q5eoGzlIPodrE+wx7atVVHsZnnieReScZaYqzvPImnxabf/cWbRP1nta72Lb8q0P+hcgul82KTi8KT3kSdTpJLcQhK9eO2P3zOBhmoPudrgbhxo0MTlhWkjrJ0QDR0yCCGmnu/MXQ9QthRdq46mTBUZAI0Xrs+6g4kiZjKgozxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722544584; c=relaxed/simple;
	bh=88mQIyKv1v9j5qA/objncp5Pzvf1ssUJs0T91Yu09fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/jR6/vsNVomOmje3OBlieZktKEZ97cDAcTsV0rKQXIjVnC4EcZvi6xoYwmy2UJ1yfSfmFY2eYUPzMNbVUdZ87V/0rAXW36PswY2pyOdwgLkRjmGqK5TgvFs0cKwsEqfGdESS5a4WhDebEERExA515RP+kSqSsJKefSatDWZ+UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iLjXCbK2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722544582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9K9HgaDKNdZd379OukpsFKa06aZrb2knoO+bglpEAU8=;
	b=iLjXCbK2AL1pPjRQZYIoB0K6Ho/EtRHVlfxPH2+qdooITcmDXWVt9SUI8LfVDjwClVaWbI
	K/WIDf2bHCk+xV2/9B3+YxmO0LMFM5ybKtrSxEbE/EEqpCIQwiyq+KszYMrauPnrcJ0Mni
	Ux664keSm/y3ttmpiWPSQeBFzIdaSJE=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-uuAwuT7SN6qenhRdkq9s3A-1; Thu, 01 Aug 2024 16:36:20 -0400
X-MC-Unique: uuAwuT7SN6qenhRdkq9s3A-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ef3133ca88so71838731fa.3
        for <linux-alpha@vger.kernel.org>; Thu, 01 Aug 2024 13:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722544579; x=1723149379;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9K9HgaDKNdZd379OukpsFKa06aZrb2knoO+bglpEAU8=;
        b=vEULLFFeXhUxQ54aEQc/9GmtG4iPkO8lp13wbD6r5GB+Wlf77J+hVW4dumlE6LGllc
         /YPQ70iAtd7NO/0XlzIHHGAVOEqdXD4M+uYmi3PLR0pml2FsdegEleXEFV9uWmvEMuUU
         gHoOt19eM80wmRku6DInPLGDWP8QPYBrWra6+LFp5YQSCKghLS0BtdqACXWO8azoU3ln
         wv5ieFD82041brRPz+eCEUfDzrnpKZDXJBl4//u0RHvhmSFpaDfc6TbyW+s7nHHrZYvp
         h4v0kqXFO/SHMKCy4vcw+GIq6U3JsSl5nTr96nyYfUuJpeAf8BR1r2XEU/R8gNIUV17H
         z27Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYkYXc3qTiPxiZHn1dV7T2YeM5B7Vu/jLeUUop7pJl7eD465KgiRae9l5uSLwiYCPGXzgj5uKh+C1t/9OruR0br4j7S8GSp3lI1Fc=
X-Gm-Message-State: AOJu0Yzu966LU9YNI4YXjNwvyPNSY9VAlFf+9xu0oR0HIOTioerSbgNs
	ZCqFVpykAkaoYkhmQWgEo+WYB/MOWCA/GDkrer9GevOMg7uA2TexP47p+0CIhdoqPOalXOT/i9T
	Nnx2oIL3JjshAeUmrp6eqUr64BC4xW+w1KFP6EjXTpGEDwkqnzUYoCEGNSDim
X-Received: by 2002:a2e:9606:0:b0:2ef:23ec:9357 with SMTP id 38308e7fff4ca-2f15a9f988emr10593001fa.0.1722544579009;
        Thu, 01 Aug 2024 13:36:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGD1jLFu3k9A5oSwiIarD8oISJoLm6YRL5dKjuPQdlltDFKTJ64oPAlpbFUisJe8DOka40hA==
X-Received: by 2002:a2e:9606:0:b0:2ef:23ec:9357 with SMTP id 38308e7fff4ca-2f15a9f988emr10592691fa.0.1722544578387;
        Thu, 01 Aug 2024 13:36:18 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:5c00:e650:bcd7:e2a0:54fe? (p200300cbc7075c00e650bcd7e2a054fe.dip0.t-ipconnect.de. [2003:cb:c707:5c00:e650:bcd7:e2a0:54fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282b8adc7dsm69224985e9.14.2024.08.01.13.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 13:36:17 -0700 (PDT)
Message-ID: <5de3795a-a75b-48af-b62c-07639cd21d59@redhat.com>
Date: Thu, 1 Aug 2024 22:36:15 +0200
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mm: introduce MADV_DEMOTE/MADV_PROMOTE
To: Andrew Morton <akpm@linux-foundation.org>,
 BiscuitOS Broiler <zhang.renze@h3c.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 linux-arch@vger.kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
 James.Bottomley@HansenPartnership.com, deller@gmx.de,
 linux-parisc@vger.kernel.org, tsbogend@alpha.franken.de,
 rdunlap@infradead.org, bhelgaas@google.com, linux-mips@vger.kernel.org,
 richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 linux-alpha@vger.kernel.org, jiaoxupo@h3c.com, zhou.haofan@h3c.com
References: <20240801075610.12351-1-zhang.renze@h3c.com>
 <20240801075610.12351-2-zhang.renze@h3c.com>
 <20240801122514.60ceff638d97f460361f09de@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240801122514.60ceff638d97f460361f09de@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.08.24 21:25, Andrew Morton wrote:
> On Thu, 1 Aug 2024 15:56:10 +0800 BiscuitOS Broiler <zhang.renze@h3c.com> wrote:
> 
>> From: BiscuitOS Broiler <zhang.renze@h3c.com>
> 
> Please use a real name.
> 
>  From Documentation/process/submitting-patches.rst:
> 
> : then you just add a line saying::
> :
> : 	Signed-off-by: Random J Developer <random@developer.example.org>
> :
> : using a known identity (sorry, no anonymous contributions.)
> 
> 

I'm curious, reading d4563201f33a022fc0353033d9dfeb1606a88330, 
pseudonyms are allowed now as long as we are dealing with a "known 
identity".

"Real name" was replaced by "known identity" in that commit.

I'm pretty much in favor of people just using their real name here as 
well. But apparently, "knwon identity" is sufficient. Not that I could 
tell when someone is a "known identity". Likely "BiscuitOS Broiler" 
would be a known identity and not "anonymous"?

-- 
Cheers,

David / dhildenb


