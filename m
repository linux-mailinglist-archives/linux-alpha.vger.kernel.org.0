Return-Path: <linux-alpha+bounces-568-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B065905202
	for <lists+linux-alpha@lfdr.de>; Wed, 12 Jun 2024 14:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0CCC1C235C2
	for <lists+linux-alpha@lfdr.de>; Wed, 12 Jun 2024 12:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0147A16F29D;
	Wed, 12 Jun 2024 12:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="b+K+9yut"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC3416F0E1
	for <linux-alpha@vger.kernel.org>; Wed, 12 Jun 2024 12:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193969; cv=none; b=YP37XqkG0apBk3S4McIPwA7uVDbyM3AkZnmt/Q3VDezuYgNz5TNwiIMrzY60B5n9yZhflfGof8fSUwQ6txtSQClH6xdxtFTw26Yzzw3P5XznpvbAAsEgeEnflt7YkFGtmh3oK6rsj/i2o+5jYoyzySSkaH1wmukNmYBLwIgxB8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193969; c=relaxed/simple;
	bh=654VBwTTZj6O5cwvd+Nmv/nVSh8Rktw+YZv2YfH5NqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4llldoQbKj8A/Dlst1rQf3tdiegOJmKV8eLTjrx5xE/f+S5L3uczlslHwKBYUct5Pct8tF18yfugwW051rf62KUF4ZTQKRP3fYcVCZfBZ9ptwxKkrCGZO1oVOC3o2wSfDMkbQV52zXZqu7QQ+YPfJR8cmA3nqKUOCNzoDOAYIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=b+K+9yut; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-440655e64bdso20148131cf.0
        for <linux-alpha@vger.kernel.org>; Wed, 12 Jun 2024 05:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718193967; x=1718798767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=654VBwTTZj6O5cwvd+Nmv/nVSh8Rktw+YZv2YfH5NqU=;
        b=b+K+9yutIZvL7EhYnDc9PCqyJQyg2rNZnBSM82DUh/mVjbpDQy0AjlTT1QxvPywdj1
         5x3Bd9/ca2iYboUwAHk3ommKdZwLtidiIZFwneX47/uHtGfpvI9RYqChNL0+zSjfMHo1
         eLjMobFz+Qu1oy3MVyvb4rEeOUKTLSjore47JD2UdH3oqgTIkXqhVcGm+UYAEnMiQ+T5
         RK5UP92BF1rCkwKJet0x6kGN6ceBNfxoJL/qrz8UJcsTrQpKGIJJ91JIlvqFFjM3nnYj
         7adAlrkKUSp2YwiQ+JcrIa0p91XG2fUzPI4njv/lY/djRSEZJX+zpmehJwwsBOi4fkfY
         pCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718193967; x=1718798767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=654VBwTTZj6O5cwvd+Nmv/nVSh8Rktw+YZv2YfH5NqU=;
        b=ge+eC1J7s42CAYWj4PMelyP00n4XZGP7yEIWHOfbG4oi9LYBWWbYiwct2pp6ZNh+8j
         OVBWYkHRNNrlSq9h72wKBnlLCvxWO01iPvKpdXuWTbH4PEc3qvF25c1HwXuam8tYq3oJ
         YBwcrov8RMgzpO2p3z9odTZ4/rNQleQoRJL2UO8LyfZEwLqxqDsBdSG2NN2osTqEcef0
         NPeLD05e2YG05DoC2UATb7pmU2BmXyzWPEJVxvj13q6YaefxOSQUN4DobRlNPve+bLIh
         5EMPsA16dzCqUU7qag0gCTi0LOqhCFwwz5DP6JFoeCIatNKCh7K8IRNCxy72KTLCshLJ
         JtXw==
X-Forwarded-Encrypted: i=1; AJvYcCVzAfmBHQ7gZ6oLuh1g1ldMdtmC7NkjH0g91OHvTkHed4P3YytOjnZs0rob6eAwZEBwj/17LQ66MCTUlTwTw9Zl5/K8ELeLbaMkSPo=
X-Gm-Message-State: AOJu0YwSGppmkaU4A7no/hjS6l1rUuODQ2kjazY7rFxSugER5iGIseDk
	AF31Ses3bLzfKGTugybuR09UUMq3LgxSqRQLPCgkrFEgb6xAqHP13sKAXFBE8Zo=
X-Google-Smtp-Source: AGHT+IElu+dk9DZ7aij8c0y6F8TXy6i5LV0OSLpqQpTgGbv9PZ9NHP5JfFSWjv6MHZMgeDua9fHUGQ==
X-Received: by 2002:a05:622a:30f:b0:440:5de2:2a03 with SMTP id d75a77b69052e-4415abae5a3mr13859041cf.1.1718193967008;
        Wed, 12 Jun 2024 05:06:07 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.89])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44152b1585bsm12849751cf.27.2024.06.12.05.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 05:06:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sHMjq-008UjB-Tl;
	Wed, 12 Jun 2024 09:06:02 -0300
Date: Wed, 12 Jun 2024 09:06:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mina Almasry <almasrymina@google.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>,
	Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Yunsheng Lin <linyunsheng@huawei.com>,
	Shailend Chand <shailend@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
Message-ID: <20240612120602.GQ791043@ziepe.ca>
References: <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <20240607145247.GG791043@ziepe.ca>
 <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
 <54975459-7a5a-46ff-a9ae-dc16ceffbab4@gmail.com>
 <20240610121625.GI791043@ziepe.ca>
 <59443d14-1f1d-42bb-8be3-73e6e4a0b683@kernel.org>
 <00c67cf0-2bf3-4eaf-b200-ffe00d91593b@gmail.com>
 <20240610221500.GN791043@ziepe.ca>
 <CAHS8izNRd=f=jHgrYKKfzgcU3JzkZA1NkZnbQM+hfYd8-0NyBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHS8izNRd=f=jHgrYKKfzgcU3JzkZA1NkZnbQM+hfYd8-0NyBQ@mail.gmail.com>

On Tue, Jun 11, 2024 at 11:09:15AM -0700, Mina Almasry wrote:

> Just curious: in Pavel's effort, io_uring - which is not a device - is
> trying to share memory with the page_pool, which is also not a device.
> And Pavel is being asked to wrap the memory in a dmabuf. Is dmabuf
> going to be the kernel's standard for any memory sharing between any 2
> components in the future, even when they're not devices?

dmabuf is how we are refcounting non-struct page memory, there is
nothing about it that says it has to be MMIO memory, or even that the
memory doesn't have struct pages.

All it says is that the memory is alive according to dmabuf
refcounting rules. And the importer obviously don't get to touch the
underlying folios, if any.

Jason

