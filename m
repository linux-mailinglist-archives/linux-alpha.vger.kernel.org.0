Return-Path: <linux-alpha+bounces-976-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBF8964F17
	for <lists+linux-alpha@lfdr.de>; Thu, 29 Aug 2024 21:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A91D282D4D
	for <lists+linux-alpha@lfdr.de>; Thu, 29 Aug 2024 19:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7541AE046;
	Thu, 29 Aug 2024 19:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vyqjdfwa"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DD51BA26F
	for <linux-alpha@vger.kernel.org>; Thu, 29 Aug 2024 19:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960310; cv=none; b=RUQZVJFdlCww519RrwJR3tLJpAcuVpC1FWfnp7LUQ11hYXv0cx1lXmtuABLYurMaFRPDsu7TBr9Ue67NJxxLPy3xsqCbppzeopXz6vmgfMnsh1v/KW0HHJpNh4qQN1xjdYDgKWxMnIhR38bnIb6y/u/X7SW1WYepZ/nazysGY00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960310; c=relaxed/simple;
	bh=4ASADOnCoqNrKV+beHl14a4vrTkq7UjCX+g5PUIp7tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehnciuuE6OsLcxrZKL+8s+TCG0uLQB3R4Rca67K2/s+HZvzebCgcL9AnrVFHur+AGOBuSAPu6v+b5Swam1tSkVL9X1KJlNaqszlB0LwYUWbVpcpsxQ16SORyq7MpD41213A8HRo3p7q3Vq7AgPzMzxXyvdRsdr5H8FRuUX4zQJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vyqjdfwa; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4567fe32141so78701cf.0
        for <linux-alpha@vger.kernel.org>; Thu, 29 Aug 2024 12:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724960307; x=1725565107; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZUAgIcTyrR43pe3gP0emMAssjHjCGemTU8nsF1ejxc=;
        b=VyqjdfwarXMeB4Y4INlQGUPhZkirtCNWsnj7M3szpM9Xkt7avb/e7YL2r2AdYlJkCS
         /Bpf7hR7X6IlL1U00gOg9VKWrTicKAP4a4yqJWgpfD21VBRGI411IWdBSUD/5Y7hsg9E
         wiVrzRVTIUriossLHYwrF3NOTBlUA3fP1JfXXgA9ryu2/FdUqqHMT8zgBxP1tTSWZWlL
         QCyKGDNZFHsNdIEwBTf7SgOpdzJpSQ9AKGvSvwmWIzeVHSp0cwe2o0wB9IAFaHfCkgXB
         wDw8hEMaWDSzGdgfIQ/2EvAJXL3hA9d/YHiz5Hi5yCNbiwnKJ3rLPdpN++PpwyVTZWmo
         hrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724960307; x=1725565107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZUAgIcTyrR43pe3gP0emMAssjHjCGemTU8nsF1ejxc=;
        b=etA0VmDflnv5SzGbMpHmEj1oSaAkoF3RWo8BVZuJt/pUxA7YA6jptjjWCTU+aF2utx
         GQxr4Hrn7B2RO/gcWwK0JlWEkF8xVVxL/7Aswsxhka/qNPS0hqGrhMrNU34njQebDW4Y
         H7L8+B1Wqu/pcmJZJfj1uLxUPCON/SjCxmI+vUztv8PVeV04AhzkXsrvoewIjKfFJ3ru
         lDtxnUiz+1f0L2xoj9m1I4xSOcr5P1SOHVxSrTEhsgPsMx9dwV8+4kQCxfMD27ELWui9
         eASC2/OuarR5FtvRpQcvz+WDSYjB49HGQ8hbmAkQqYeUiALzhNtQC5ZLso0K6V/SDYxP
         9bgA==
X-Forwarded-Encrypted: i=1; AJvYcCUn0SyjUiVQSTRfIzw2kGdDKNUeXH80Qk8mzA7LRYdkQOAMYGg6iOWdMbeK2BKvKqQWVatQZAtVkbUWwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk7CflgbGwzQxCgZw9HgYpekM/glKlAHl5XjId0OSGQGj4p/qz
	YIRLgM43gUE5twjKCqarauteWf9WIIF7VtiQsRrQaEWc6tJ23myzGtB82S63cH4IhCygqksrWau
	jsl47yYiBhSO99dIaX0VAdvfedOrArr4p4zin
X-Google-Smtp-Source: AGHT+IEckjBQSLEDMwf1jYHRwORJ2ZVKtBH36SKJpIYMP8NrCeogwJVm7Q7nebuPSmPKh9r8A+fJeiK+617lAC3ocsU=
X-Received: by 2002:a05:622a:281:b0:447:e59b:54eb with SMTP id
 d75a77b69052e-4568aacd777mr496041cf.26.1724960306474; Thu, 29 Aug 2024
 12:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829060126.2792671-1-almasrymina@google.com> <20240829060126.2792671-4-almasrymina@google.com>
In-Reply-To: <20240829060126.2792671-4-almasrymina@google.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 29 Aug 2024 12:38:13 -0700
Message-ID: <CAHS8izMCZbynEQQ3rPs2QaEbD51ew7VK0sMziBTayCi2yEZ_EA@mail.gmail.com>
Subject: Re: [PATCH net-next v23 03/13] netdev: support binding dma-buf to netdevice
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"

> +#include <linux/list.h>
>  #include <uapi/linux/netdev.h>
>
...

>
> +#include <linux/list.h>
>  #include <uapi/linux/netdev.h>
>

Darn, I went too overboard with sorting of includes. ynl-regen.sh
wants these in the reverse order, which is unsorted. I'll fix it in
the next iteration, and I added this check as well to my presubmits.

BTW I submitted 2 iterations already this week, Sunday and Wednesday.
This is easily fixable and I can resend before the end of the week,
but if I'm stressing NIPA too much with reposts of this large series I
can wait until next week. Sorry about that.

-- 
Thanks,
Mina

