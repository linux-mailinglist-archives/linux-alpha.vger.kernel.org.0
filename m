Return-Path: <linux-alpha+bounces-65-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA607F3621
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Nov 2023 19:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65029280DB2
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Nov 2023 18:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1947C51028
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Nov 2023 18:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kymjc8eQ"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84DAF1A3
	for <linux-alpha@vger.kernel.org>; Tue, 21 Nov 2023 09:49:04 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6cb7951d713so1981023b3a.1
        for <linux-alpha@vger.kernel.org>; Tue, 21 Nov 2023 09:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700588944; x=1701193744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MXJqaP9n8CjgzoiH5n3pTHCDJy51tKrsEtKUZtGKn0o=;
        b=Kymjc8eQJqFB+1WawZGFmm5rwkRudVpD7yLbFpTDpcEFDfQBpBPuNUWbTY78Q9Oxyf
         09W0ev46NEZ91N458AfCzgP4cEjBRfi//qjT0KuivPzsXZ3WVLKnek8NhuAyIoPQXAvV
         xfNhesRazd2w8oT6Z8euPB8+VF8xnhO0ecus0eNziAG1r6neS5u5pYJuECc9qRyhstIZ
         8gBFRQf7pRNINu+Yf7sSRSCiAufAAu9OqDl6qvINZwOv6QV0oEYK6cARGM0xZTlMAkmr
         YlBUueG5VY9madjq9lwN0Jw7kYxmLV7SluyBiCe2FAbojIGJgri79N0zeE7svWyfOGJN
         tFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700588944; x=1701193744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXJqaP9n8CjgzoiH5n3pTHCDJy51tKrsEtKUZtGKn0o=;
        b=ilgjXOlSeBQfx85rLgTuxIfK0DCNuDc/H475l/38TE8YMu1UIaqWV2lerT/lCsHMte
         Fjy2rFTD8iT0D5ZqjODqjD1vAZgRp2pgzt79ArxImJrEMFuLAO9mUryKqPkS1OQJheqw
         rxQ09VY7VmD5ouhAWdOTFtfN0q9n2W0JWsX16gunswZ5dBP+VJVysp8E5JAl1zR8+vXX
         ZQCansOhfefGbIbEnkXEw0CXNfz7U7dbhtAyoWAGoRahIVSgcowAHGAl/G02At6t7Rpd
         8FaRGxxEE/b+GAAC+8ujHO4pJYfeX35kRCacUyO4+qAtI7f+K687v/AQxnzXKUcQHiU1
         z8Mw==
X-Gm-Message-State: AOJu0YxG1PeFDb9hZeaQg5BcX/y2E7P4XGrl+mZctkBJ1K7TBn5BS6CE
	krImYaY4BVFEU5PeYgBjGPB6bojdtpXrVHhBeDX2KTKY
X-Google-Smtp-Source: AGHT+IHZYKUmQPsAZKyzIXXSlFSXyQH3BXp0aXl+SLqo3aQCcXZjl7XFH6/OhEzsyY7tAE9b5eduug==
X-Received: by 2002:a05:6a20:1593:b0:185:d125:ea70 with SMTP id h19-20020a056a20159300b00185d125ea70mr69343pzj.19.1700588943997;
        Tue, 21 Nov 2023 09:49:03 -0800 (PST)
Received: from [172.20.7.39] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id b11-20020a056a000ccb00b006cb69ff0444sm5547127pfv.151.2023.11.21.09.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 09:49:03 -0800 (PST)
Message-ID: <b8dc336f-06c6-43eb-974b-7af251532d10@linaro.org>
Date: Tue, 21 Nov 2023 11:49:01 -0600
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] tty: srmcons: switch need_cr to bool
Content-Language: en-US
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, linux-alpha@vger.kernel.org
References: <20231121092258.9334-1-jirislaby@kernel.org>
 <20231121092258.9334-17-jirislaby@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231121092258.9334-17-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *

On 11/21/23 03:22, Jiri Slaby (SUSE) wrote:
> 'need_cr' is a flag, so type it properly to be a 'bool'. Move the
> declaration into the loop too. That ensures the variable is initialized
> properly even if the code was moved somehow.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> ---
>   arch/alpha/kernel/srmcons.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

