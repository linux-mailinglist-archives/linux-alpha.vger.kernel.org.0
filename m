Return-Path: <linux-alpha+bounces-551-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9B89018FC
	for <lists+linux-alpha@lfdr.de>; Mon, 10 Jun 2024 02:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C3941F21892
	for <lists+linux-alpha@lfdr.de>; Mon, 10 Jun 2024 00:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB01187F;
	Mon, 10 Jun 2024 00:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="csbBepzg"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3320D17F6
	for <linux-alpha@vger.kernel.org>; Mon, 10 Jun 2024 00:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717979857; cv=none; b=LyLHnig2n4Ls50WMA++HbJ6s3ETtQH8Jb5IlUIDY6KfkgJz2aalHulmLhxxhjOLg1mk0VIYJh6Ftgh+SNz+Zq6rGEJrl+D/JWnYQL1GpgGtEqzNXMH06dg+WBgU5bGZr7tfdtJcegyvSKLknP5/jLFKdc0R/IZpq3rNAz/WmYpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717979857; c=relaxed/simple;
	bh=+o3cil3us8SguPa7qsyp1XhJLUxH5Q1E4SZdY/0NVqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVcTPaBN9xzn0vHL5M6i30IiZXZkhiPWKBdBeTpr86KLCF6TH233veigmb9dufXFI7L5kAA1UOtW0KC6RrC+P01AyjvPwBvLiwygHmleXXF8vb8ijm6zL3QWLwQPpmiFf8VRU1nKvAB5g+WzNjTbBaeHGhO8tf6GmUbA7ZIaIkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=csbBepzg; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f70fdc9644so3577215ad.0
        for <linux-alpha@vger.kernel.org>; Sun, 09 Jun 2024 17:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1717979855; x=1718584655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hS7n98TDY72tf1Gt3gpPTHvSO7f4fNN8VMGdhY9nX8c=;
        b=csbBepzgCy2/sm2grtPo5g7NMbzBmk7v6xdD7k9AGN/GGEKXViC9xqtY5trb2MBYIh
         i/kq0rArDrfFJRBYl7JNV2H8R10/VpZv39Mhiwjx7+eqJc9vvzKQfrDIXk+AH6v0oPJP
         /m1BIHOSWOi6f914KovjaOrhM+ZpSpOpmYhQoSsW/WzzSG1ozTyM+Si65w24c11BvF5K
         ds/aIs0C+NLJ1aug8mEOL5Vvr/IRx4jKPvuGTNh+1EyOOGCcWqcAdFlUA41OR0s8erXB
         a7DTLae18dW9nGXgt/R/sdo6KDcwoqOHFdF/8dd8H1hocHE3+GM8HDA0EW5XJwemWmjC
         qyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717979855; x=1718584655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hS7n98TDY72tf1Gt3gpPTHvSO7f4fNN8VMGdhY9nX8c=;
        b=Vk6sLkU+oSWG4UI0PeWK/4vhSehyCYIXl8bTGLpq1Prych0DdM2VIldJKwaSKX0Av5
         XIPgXGwNsj6eJ1a5XKhL3/FB9mUucc5sp+EI8vOLprj3PdHto4IkU97HRj6QF0EXR4eT
         vwxCTmJkOVk3i+WekzaErA0e1sHq2R367hbMI5p1mYQvumj/vkxa8UtwjEh36SaYNPhd
         B3QPVZpGXdLk8CSbMKpnOjAsRReLtXNG6uxCpACzYtTDNqv2ZuGmu+aWnQBfBcawtGoQ
         xhuglwtGyz2CU0dgm8vhTM2g5XOFn+OhjT2hqAgFeSPAFPMvNGx3593/vDRp7pLjZ5J4
         x5HA==
X-Forwarded-Encrypted: i=1; AJvYcCXpFbKyXcvRRjUindNcD1eD3HiPMlG3sU5H2zS+5ELNgz9vi7nwzYb51TYkk0LLmcNB6DqyjIjYUEl6KvdSMVD1o5VGwm8StgYw1T0=
X-Gm-Message-State: AOJu0YxUMhjiUt0Sqw0lNPhnBAJv45QC/V6JhG5ibqFKiw/IoK/tHbab
	GaZpglWh9XbGD3xidusK9hO2arm2w/U87MGNTnmSOehNb0MQltMbgOXZxY/jjQo=
X-Google-Smtp-Source: AGHT+IF/jQhCZx2Abw7DSxRG+gkk1EZNGK2154m819MXP2LbgwzefTTWrobn4NY5q6T/kzn7SpSdLA==
X-Received: by 2002:a17:903:32c6:b0:1f7:18cf:a70f with SMTP id d9443c01a7336-1f718cfab0amr8620855ad.34.1717979855488;
        Sun, 09 Jun 2024 17:37:35 -0700 (PDT)
Received: from [192.168.1.8] (174-21-189-109.tukw.qwest.net. [174.21.189.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76c240sm71665825ad.89.2024.06.09.17.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jun 2024 17:37:35 -0700 (PDT)
Message-ID: <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
Date: Sun, 9 Jun 2024 17:37:33 -0700
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
Content-Language: en-GB
To: Jason Gunthorpe <jgg@ziepe.ca>, David Ahern <dsahern@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
 Mina Almasry <almasrymina@google.com>, Christoph Hellwig
 <hch@infradead.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-3-almasrymina@google.com>
 <ZlqzER_ufrhlB28v@infradead.org>
 <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
 <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
 <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <20240607145247.GG791043@ziepe.ca>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240607145247.GG791043@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-06-07 17:52, Jason Gunthorpe wrote:
> IMHO it seems to compose poorly if you can only use the io_uring
> lifecycle model with io_uring registered memory, and not with DMABUF
> memory registered through Mina's mechanism.

By this, do you mean io_uring must be exclusively used to use this
feature?

And you'd rather see the two decoupled, so userspace can register w/ say
dmabuf then pass it to io_uring?

> 
> Jason

