Return-Path: <linux-alpha+bounces-1182-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5C198F462
	for <lists+linux-alpha@lfdr.de>; Thu,  3 Oct 2024 18:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 193CA1F21F8B
	for <lists+linux-alpha@lfdr.de>; Thu,  3 Oct 2024 16:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B9D1A7046;
	Thu,  3 Oct 2024 16:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uatXi8xH"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FF01547E2
	for <linux-alpha@vger.kernel.org>; Thu,  3 Oct 2024 16:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727974017; cv=none; b=c7PrUERK0YOXp4rhG9mbpu0kYwcXBvGT9Hws9SRd8Ue7qr19DRT7dBlxOgVyO89JuMVncTSSwr6GAYTJtg9L9woc4IkGfaxVo3nL90nF9CV5Hncrgr0oUgVk39A9IM4SvdLIVB0I/bEIkaQO2hW5aEZb2c9mRamvSrUs4zZw3H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727974017; c=relaxed/simple;
	bh=EwT3q9EsnCa7yrZWUCyRNUjVCTNH45yR8vvcQYT/i1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WacdB9RxNDrI5s8bxd7ZCO8fMk3AmmB93a27x1z7Ni3Wm8zOXzlL0SA85i7+KkDc2aBoghn1+opdjFLAzfrTIlbZJdvMeldQWo2wigyvr88zNNbLb+dShhvggR+HJwOIiVVgu4w0gmzg4sE2dL7FDqdyy+KLjaWeb8xG3VxYR8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uatXi8xH; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7163489149eso980981a12.1
        for <linux-alpha@vger.kernel.org>; Thu, 03 Oct 2024 09:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727974015; x=1728578815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RW5P1Arx8XPYT/NPFqMkITFeiGycXbJcANO3qtPPvbA=;
        b=uatXi8xHkUqeCRDr5Mlfvk0MQ7i+Nps7epYpKwfgqrQRySXt99qKBhbRaMqzKGY+tS
         OIILTTs16rkouA4DCwtOCgugHYZ1rF2oUSWAOPqourYu+pstKMN50Zy6PbC5TnxhfXc8
         H0P7LVQeSJlpJsVQ6k7sQKEiG+zt7wQAmyeC1x3aH2n4rdeOKOJ/FTSqCmN1aKpRN6VV
         KfJ6kMjnomN0iZhMexd+6BBmqinzauQsPlsDnPUocmILborbu/Wn3eXu3N9HJhpQykQh
         GWosPjT/vKjbFLkWvjARTDnbRXScsqHn9e8VnprsXgwtA+/X355H36ntcB+C2fELdeeJ
         TUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727974015; x=1728578815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RW5P1Arx8XPYT/NPFqMkITFeiGycXbJcANO3qtPPvbA=;
        b=j5nH4pOfQ97C7znDQr7VosR1G8eS/1vpKWiDwXdibPtK98teFiVIH+SubM9m1ejf2v
         18Vd7FVg2sH7RiDBMPupESl3B9r9HnY6uC4elKQn2NzCkQKNd1OB4FVbVWUwGqQ/zKki
         YwQMRpDcQg+2oBGibdIQo6qHdi1OFD/fCD2fWXp0SCaFEQZ6T/faSsxfwUByGmEMVUX8
         epd6Nx1esLjL3QK/+3UOR6dCHjTGYyOcI4+glKENEI5LCVVF5j2P6JSYBlhpmdrKT0jd
         9NT44jaJSaB7RLduMMVxDX3Dpm42r4P6cwbOlMyLwVljLSO5p8QP0PodNM3ICyYZmsY4
         ksiA==
X-Forwarded-Encrypted: i=1; AJvYcCUPseWBJ0pmaaGPJFPhOyiSWJr5C+iuHxl1iF4Y0F6rSzvJBk8mejFlQBX/qOJYHWUmuqMy9Oo6yHVpWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyisDW7AzwBfaaZbh9ai2Iytr0T6QQUD9Np+hBwJi7vuW8L845k
	TZlYl0WVH3Mb5HKveOQPIE9RsKfe/nYKo3t886BM+FT9S6/3e8ltxzLDofrjlZU=
X-Google-Smtp-Source: AGHT+IHrNLnq312K7GVWKGT1Vo9Ff69i9ensfXAZGMY12ruPSu/BXqZiVZ26a2jiItIAw0CUa22nFw==
X-Received: by 2002:a05:6a20:cf84:b0:1d2:e8f6:81e with SMTP id adf61e73a8af0-1d5db1bf932mr10105522637.24.1727974014772;
        Thu, 03 Oct 2024 09:46:54 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9dbcf13b6sm1055380a12.8.2024.10.03.09.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 09:46:54 -0700 (PDT)
Message-ID: <a4f85184-73d4-44e4-bddd-0c1775ed9f50@linaro.org>
Date: Thu, 3 Oct 2024 09:46:50 -0700
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/10] Consolidate IO memcpy/memset into iomap_copy.c
To: Julian Vetter <jvetter@kalrayinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 Yann Sionneau <ysionneau@kalrayinc.com>
References: <20240930132321.2785718-1-jvetter@kalrayinc.com>
 <20240930132321.2785718-2-jvetter@kalrayinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240930132321.2785718-2-jvetter@kalrayinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/24 06:23, Julian Vetter wrote:
> +void memset_io(volatile void __iomem *dst, int c, size_t count)
> +{
> +	uintptr_t qc = (u8)c;

Missed one change to 'long'

> +
> +	qc |= qc << 8;
> +	qc |= qc << 16;
> +
> +#ifdef CONFIG_64BIT
> +	qc |= qc << 32;
> +#endif

Could be 'qc *= -1ul / 0xff;'


r~

