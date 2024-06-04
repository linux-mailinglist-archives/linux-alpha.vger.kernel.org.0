Return-Path: <linux-alpha+bounces-516-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCB88FB90C
	for <lists+linux-alpha@lfdr.de>; Tue,  4 Jun 2024 18:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60BF51C224F1
	for <lists+linux-alpha@lfdr.de>; Tue,  4 Jun 2024 16:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C201487CC;
	Tue,  4 Jun 2024 16:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="HgXnE0hF"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1AF148858
	for <linux-alpha@vger.kernel.org>; Tue,  4 Jun 2024 16:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717518727; cv=none; b=aoEf3FqGUYlmAem6OXpgyl5aoqlO2ery77tjOlndACVyNnI/jDJD+iHJi/TtnsqjHVhYAoUXvwrYh11ihEH4xmOqdzDiMijGyEstgcgVn0Wp+wh7XBJ30aC6Wb2N6UfxpBr+USUpd9rEYy/CHWcfKPgOLXikf0R4ifrC1ODSGiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717518727; c=relaxed/simple;
	bh=i4Ogx5/mcBgPe8sS8F8X3tQ7eWEg2sGB2TGn7q/9bMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbuOYPvOKqQFTdsQPpR9OC1JZSA5jGvUv/aFG5vUBFkg/16K0D6AGrxSWaeXNxlUwfYwxIqzmoIKQLT9H7tl3Lh0D1URPXgVNGE0sJXDkAH5ooeUVm4mOBt0fpT3BGyJ5lpdnCe8b3P71v7xh3RELdsmTmNlegsDWaFNpMXWZt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=HgXnE0hF; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7951e24db3bso34290285a.3
        for <linux-alpha@vger.kernel.org>; Tue, 04 Jun 2024 09:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1717518723; x=1718123523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EYr0Y7RICrMaykessJ15jPU9wen2fALKwAvygZWhRiU=;
        b=HgXnE0hFGN5LPcj1volHEzaktqS39wRLFKsfdPOjrGSzbcgM8iKqyoaryZ52o2p4vz
         Nqvfru5A3eCMEsddtspDtceHVmvigeqFj0/Ij/SWd9KTnXD3bn3UyKCelhqIg83GURRF
         fFg+ZD+ksUXGFmVvcZM3sQHu0HhfE3BnJEeapN441cKgo1NE6skc9DQJuhi8ACyH2mpO
         g7g7WrO8weGOIJ+4PgW52LK2eVAJR4zyWFW45r8R/V5Y79eksxGmoaNkh+uA5pmk4kNf
         qJ1+8x1GntZWXPuug9UqtquGS0oy8GcsbydN/4pkBCLAOHYhUNroafSvXiAUP8FEdYJq
         2oBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717518723; x=1718123523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYr0Y7RICrMaykessJ15jPU9wen2fALKwAvygZWhRiU=;
        b=CDRjIRiwr4Bh12XHVUihWfeWKXAYY3BMr+zkYDHyFcCugWJShtYzu61PDS8NVLPm/d
         Vmt1H0t/J3cqdY8maWSHTRn/8t0f9RW8LsfDS0RKIBPs6qzaLQXPUK7gfeNbuk2GL+qv
         /QsWqtTl8szFr3kAmHm3GsoV4yh21UDmrKynt7kuzGMNQWtwg/yq6H+0tz9JcpzwFJXq
         d8Fu+Q9X0ji1C2FZ73BZJaUclqvwEDK3V9FiEtYD/QtqjdRK8nBjSN4y7IKjQK3u2Tj3
         vRRqSMsWhRyVkrc3m1GxC31gfSaL2O3dNAXuW36NiFCDQ3cJ9sgFCPZ5zKruw6aUJUNP
         qaLg==
X-Forwarded-Encrypted: i=1; AJvYcCVh6xhHiM/BdqZHMl2N8/x+8yey5aEBEf0qIVhjxNiejfmf1OERyRqagnnmf/i0Pc44+KyPQPyH2wSwYORjLvyakenWu/TFH0h4bsM=
X-Gm-Message-State: AOJu0Yz/rFZBVMxJqYjiZ+LrM8wm6TKJedMmldh1C9gNgUgBuyEAXN6i
	Z4Ap6tSSoB1A32dihNtE3AhdWqiKm5dCAksq9UaBW56B1/UMq6/SV1pZSEhrCmI=
X-Google-Smtp-Source: AGHT+IHcNJm5ltpG2mf7+3csAwiL5eKctuS7MAmZ+C2lRHB7rHiUktaBSt3TzVqwSkXLa2Nb4dRvUA==
X-Received: by 2002:a05:620a:271a:b0:792:c5c7:e90d with SMTP id af79cd13be357-794f5cc687emr1510000185a.49.1717518722779;
        Tue, 04 Jun 2024 09:32:02 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.89])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7951a7b3314sm48813285a.40.2024.06.04.09.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 09:32:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sEX4o-002rQm-Kw;
	Tue, 04 Jun 2024 13:31:58 -0300
Date: Tue, 4 Jun 2024 13:31:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Mina Almasry <almasrymina@google.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
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
	David Ahern <dsahern@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
	Yunsheng Lin <linyunsheng@huawei.com>,
	Shailend Chand <shailend@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Kaiyuan Zhang <kaiyuanz@google.com>
Subject: Re: [PATCH net-next v10 05/14] netdev: netdevice devmem allocator
Message-ID: <20240604163158.GB21513@ziepe.ca>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-6-almasrymina@google.com>
 <bea8b8bf1630309bb004f614e4a3c7f684a6acb6.camel@redhat.com>
 <20240604121551.07192993@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604121551.07192993@gandalf.local.home>

On Tue, Jun 04, 2024 at 12:15:51PM -0400, Steven Rostedt wrote:
> On Tue, 04 Jun 2024 12:13:15 +0200
> Paolo Abeni <pabeni@redhat.com> wrote:
> 
> > On Thu, 2024-05-30 at 20:16 +0000, Mina Almasry wrote:
> > > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > > index d82f92d7cf9ce..d5fac8edf621d 100644
> > > --- a/net/core/devmem.c
> > > +++ b/net/core/devmem.c
> > > @@ -32,6 +32,14 @@ static void net_devmem_dmabuf_free_chunk_owner(struct gen_pool *genpool,
> > >  	kfree(owner);
> > >  }
> > >  
> > > +static inline dma_addr_t net_devmem_get_dma_addr(const struct net_iov *niov)  
> > 
> > Minor nit: please no 'inline' keyword in c files.
> 
> I'm curious. Is this a networking rule? I use 'inline' in my C code all the
> time.

It mostly comes from Documentation/process/coding-style.rst:

15) The inline disease
----------------------

There appears to be a common misperception that gcc has a magic "make me
faster" speedup option called ``inline``. While the use of inlines can be
appropriate (for example as a means of replacing macros, see Chapter 12), it
very often is not. Abundant use of the inline keyword leads to a much bigger
kernel, which in turn slows the system as a whole down, due to a bigger
icache footprint for the CPU and simply because there is less memory
available for the pagecache. Just think about it; a pagecache miss causes a
disk seek, which easily takes 5 milliseconds. There are a LOT of cpu cycles
that can go into these 5 milliseconds.

A reasonable rule of thumb is to not put inline at functions that have more
than 3 lines of code in them. An exception to this rule are the cases where
a parameter is known to be a compiletime constant, and as a result of this
constantness you *know* the compiler will be able to optimize most of your
function away at compile time. For a good example of this later case, see
the kmalloc() inline function.

Often people argue that adding inline to functions that are static and used
only once is always a win since there is no space tradeoff. While this is
technically correct, gcc is capable of inlining these automatically without
help, and the maintenance issue of removing the inline when a second user
appears outweighs the potential value of the hint that tells gcc to do
something it would have done anyway.

Jason

