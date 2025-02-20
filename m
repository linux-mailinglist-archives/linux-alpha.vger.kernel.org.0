Return-Path: <linux-alpha+bounces-1989-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 389FEA3E37F
	for <lists+linux-alpha@lfdr.de>; Thu, 20 Feb 2025 19:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19F891775C3
	for <lists+linux-alpha@lfdr.de>; Thu, 20 Feb 2025 18:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C16213E84;
	Thu, 20 Feb 2025 18:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBxOHilS"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671381FF7BB
	for <linux-alpha@vger.kernel.org>; Thu, 20 Feb 2025 18:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740075126; cv=none; b=fWmpjJvCLnW/bKXkVvDfvvB1QjA/TAUP1W2sbCvNvSgPbFT6wiZN1TY9MuOYT/OQRNO+NJ4MWTIAXxKOitpDKgKsM8/uY1Nzqor+8m0lo3UVlUu9is/c7A6v+Z/gFNRcXoc1fGYTIonlc203lalChGW0EUlEZBoC16FUjbNDp1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740075126; c=relaxed/simple;
	bh=U7NEU5p+86CmS2ot4xSRm3tLGJInLZjdrsEntbaiLRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ukLVbyD2rasYqMFoLguJfHnM4BRWL6wgdQ6UMVIvmiVjW2JNbzCg+EMnZWh5tJPOjJVkPJ+ZOl/w3yTL5d5MJfEU94HcPaby3vCQLTJ6cG9qJ6W69BEirxPm13dSHjx3LiktA3vROssMGMZZZ/Ik5u0wYpnBG++eVE9Gm33jTVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gBxOHilS; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-220e989edb6so34463225ad.1
        for <linux-alpha@vger.kernel.org>; Thu, 20 Feb 2025 10:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740075125; x=1740679925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JPYGV4/Ybq5Qlp+Qgl6PHP0uBHTPtS+cFplKODIBa0c=;
        b=gBxOHilSHraDFl9BFQwNJSKLd67RETnveFaNS20138PAxx2tYixi7JSDodM9pNOSUJ
         rMI+hrJ8k8WOV+nc2W0DzjE+Hv9rdV1hIYUuw8gWt7WKH1Y3BIUFfyYxMU046y4apTeN
         NDpiMNJRvr/gW9SxxYhFxSuqmaGZsjjOu91SV/Kw5tofvvsr0GI4RNiMjvMhjnQZxu6J
         tfUCd5gIexSDEU0EwXDrv+ZJ9hcEwAi/pvWd3qDWmknOghcahhrXpg/JmYeADxiFtxUo
         1k/BuosOD4kb+mEHSX1wg4geCeu0/TaUKhLIxVLNlf+NS4Z8LwXaStIUDY7gEZDRn2Ia
         nvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740075125; x=1740679925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JPYGV4/Ybq5Qlp+Qgl6PHP0uBHTPtS+cFplKODIBa0c=;
        b=Xxjb2Z+7mwMnBTkdpqQdKeImhQVYJ/GiTOsUJN7gAnmXWPfMjWV+54AGb9ZaEeYqaR
         h7mEfcw25Jt3HQQVnCAxoFjHZthRQyaDjxfOVkSKwkz8/D+2KAvUGgzqrIN0RUer9Lh8
         iZFBqEgSgybNgyMCqzI9S+Qw6Q8eu+U+FUmC/duLKucI0vh2FUpJ4n02sOwX0/RfeYaU
         Tw/jbNPLVKfPfFQHNfm4/t9SJzgu+bkFJIPAF8GJECr9Ol4q5nK4O1UjEAsXAd/Ptr+1
         9nc30QgILwNsISlQV4RIcLCCiudyBfO/r1e8J1eofC+i7z6eSLrrzMzqtWA5yoJJcALk
         o7MA==
X-Forwarded-Encrypted: i=1; AJvYcCXYRqSzQDV+L+3d32EITJCSGAGCVCQL5B6EaUEQmoCApAXWrM+cgnJj9WTlWRdVG2/wGUxCyuTYNdf0AA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ICyGHaW/d1dbuJ1VDJqwEGPwgHktsyi5AoTDRslCRJ08Zk04
	smYZ4hKJ5rIgUQXgOHYMpM46v/D5I5g80pIvjxCMHttTD3HGFbH5hQp/Q3syRqE=
X-Gm-Gg: ASbGncuNuqvx86DHydV6m8H2nVrEAPD2BCOl5QPmBukBLi0z7saRvt4MI0issM4NZus
	8NIrTGXibuXFUoclIDbc/ASnA1Cb6LvejOiAJmYqgPrbKzewzA1QhUXlM5kQMt6KmUjVFXtHL8X
	0TlFEsoHOlAgUfYH0wTX2u9tDUkgu/IMvkKeF6sfq50b9SAmqJD8U6gzpDI1AYeNrjGMTU4X+WZ
	8H6btUXUyIZReuC9MyebEYbGkEiAi8Io9QaBUe4lpvRXzQ2TThJPYxdsonRMWxkXOJOqJDc356e
	lAYKeqHA92OZKxBt4aTLSAKSK1LhGpUb/072yOClyVN1Os9NKLw707c=
X-Google-Smtp-Source: AGHT+IEYJgTH2xijRGZv7IRxIjgPMGI3m3DAMNwwlL4W85cg6VLecg7jKjF0QGzCafBl8PC63PSroA==
X-Received: by 2002:a05:6a21:7011:b0:1ee:d860:61eb with SMTP id adf61e73a8af0-1eef3deaa0amr134496637.39.1740075124654;
        Thu, 20 Feb 2025 10:12:04 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adb58618700sm13027051a12.36.2025.02.20.10.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 10:12:04 -0800 (PST)
Message-ID: <dfb14748-c5b8-4a50-990b-d61765a6a75c@linaro.org>
Date: Thu, 20 Feb 2025 10:12:02 -0800
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Alpha: Emulate unaligned LDx_L/STx_C for data consistency
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Ivan Kokshaysky <ink@unseen.parts>, Matt Turner <mattst88@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Magnus Lindholm <linmag7@gmail.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.2502181912230.65342@angie.orcam.me.uk>
 <45155869-1490-49ab-8df1-7ad13f79c09a@linaro.org>
 <CAHk-=wj42Dks1vknzKKBbXUMCrs-iuLZHq=0z3P0AN9TrXNP+A@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAHk-=wj42Dks1vknzKKBbXUMCrs-iuLZHq=0z3P0AN9TrXNP+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/25 09:59, Linus Torvalds wrote:
> On Thu, 20 Feb 2025 at 09:54, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Crucially, when emulating non-aligned, you should not strive to make it atomic.  No other
>> architecture promises atomic non-aligned stores, so why should you do that here?
> 
> I'm not disagreeing with the "it doesn't necessarily have to be
> atomic", but I will point out that x86 does indeed promise atomic
> non-aligned accesses.

I should have been more expansive with that statement: I didn't mean "no unaligned 
atomics" (e.g. lock orw), but "unaligned normal stores may be non-atomic" (e.g. movw 
across a cacheline).

My guess about the gcc patches is that it's the latter that wanted emulation here.


r~

