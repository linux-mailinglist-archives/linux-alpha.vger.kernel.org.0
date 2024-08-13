Return-Path: <linux-alpha+bounces-830-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A9C9500B4
	for <lists+linux-alpha@lfdr.de>; Tue, 13 Aug 2024 11:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DAF51F22AA0
	for <lists+linux-alpha@lfdr.de>; Tue, 13 Aug 2024 09:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C4F13D50E;
	Tue, 13 Aug 2024 09:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uY3Czher"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C1617C7BD
	for <linux-alpha@vger.kernel.org>; Tue, 13 Aug 2024 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723539828; cv=none; b=e2PUsqRlaCTJs0oLqk0ehoLgAnLfnwREgehrBUeCFjYRoSFAZOvu7Gt9A3lh8LnMnL5+mcjT7r6zbnF/UUG3H1T7wJiKC3042MMzRN8BFhp+6uof3tA63U05k0QlE65r58ei+K6x9Sn+GSzeyBD8J9MC8jtv/brpYI6jwlDWl14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723539828; c=relaxed/simple;
	bh=OFLmnkChNt3TrBDQB3OchS9v9nydUBdhsCvm9Qr0paQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dlFj7juiTT/6hHoCRVN7TkSV3ue5t3+9BOQyfS36ylRkhEkOEnp7bC0Rqq9eQKfYQ4B/638+W8kNc66gKWIKUs1AmHPXuEyUE+QXBsKrrwxHnDO74CuS2PQmdmYZzI1opiVGWn5aHmPhwHgixTY+v6O38FZz2B2r+iTWNuAJFIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uY3Czher; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-81ff08e24f8so1724197241.3
        for <linux-alpha@vger.kernel.org>; Tue, 13 Aug 2024 02:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723539825; x=1724144625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqfnVnhHsKTNIdZ3g99elQ8N0kSquMZj93pvaOSIp0U=;
        b=uY3CzherVSUXaUL2L45nDDjUe851uSDwoUak+sWbM5SLZgqZu0RzWakWib6600bcM3
         nkpN48NnEKFdKHNu45FDUJ+iB/gabNPMokNHB4mnqALGdAwZ3ybYGg6whRFoVc9NBxZW
         U1SkhkP4aChDRMPRkgx8vXA+ZlnLtATO+602voSTI274QqM7RicCA6o3qPCI+mW0gOB9
         y+K0HPR/eBxpYqeHyFh6JP/dbTfsAN//pojGBDgYuWYY8y4FA/tPQh+K1e2yh39e3RSp
         NiRMGNuOEyiuVZmbB7CHeVf5LcFuLYiHjUtvhEDA4gf4pNEQxoUNr8DV9kVgMMw88MOS
         ZbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723539825; x=1724144625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqfnVnhHsKTNIdZ3g99elQ8N0kSquMZj93pvaOSIp0U=;
        b=lJOwsKTkuipGDldVA9LIaG91SH6k6J5H+phT0MI4/Yy8Ck4VcELg7kGcmTpyxH+ooM
         gnuKk+oHYBWhMP3BWeqSMKXB3ENuJcj7r5fdmzf7M1qlSOlQrRrHKKmiD2538/qIAAZr
         yhMlN6ldsC1mHW7vI6oiTxvkdtlA1WvNyDx/4iwt7mB6IW5ahJQWAy4SrTzCZdVc+tiB
         cvz6MEH9e71CTT0703vejigsOJJE8nyNGx8l9E7T7Ct9ieNANY2qh4Zc9WUFxFGcCHqY
         S3w/cYLQ1Ij9bMJ8MeMdx+Dakqx9vqzux61aOq+wY6kPkPcZci/J4d4zAGgMg8ejtVog
         qEQg==
X-Forwarded-Encrypted: i=1; AJvYcCW//N8pxlvuD01r98p4aCKkk85uzBBroefDCmKEE6xi1yhHd6rQHTLPzVogZFpMkzxF61iYA0raMSdzDFvY6bREF1Zn7oztGRy8/f0=
X-Gm-Message-State: AOJu0YzDCEK7jTmTAF2XOmyf1q5Xd7xbNY8r/ynCn32rf7I/k0XFjbmT
	G69+z4PPmyr2rzbI9NUMkAhjb96d/ftEay8jxvEvtqZp4iKQCokAwg7uk/QydRbau+jq1aDC5cL
	OaPnVN7kj2B56YomErNlFVH2Hzh0azDRUPEWE
X-Google-Smtp-Source: AGHT+IEDjVBWF1MtU621r7c9KTxxkpXecwmSkiD37eYz3ttGuDqjz8Aa65UHLyu0qffTTOccInI+PGwQjjCKHuK8rFw=
X-Received: by 2002:a05:6102:3e94:b0:48f:a858:2b52 with SMTP id
 ada2fe7eead31-49743b56abemr3993740137.29.1723539824928; Tue, 13 Aug 2024
 02:03:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805212536.2172174-1-almasrymina@google.com>
 <20240805212536.2172174-8-almasrymina@google.com> <20240806135924.5bb65ec7@kernel.org>
 <CAHS8izOA80dxpB9rzOwv7Oe_1w4A7vo5S3c3=uCES8TSnjyzpg@mail.gmail.com>
 <20240808192410.37a49724@kernel.org> <CAHS8izMH4UhD+UDYqMjt9d=gu-wpGPQBLyewzVrCWRyoVtQcgA@mail.gmail.com>
 <fc6a8f0a-cdb4-4705-a08f-7033ef15213e@gmail.com> <20240809205236.77c959b0@kernel.org>
 <CAHS8izOXwZS-8sfvn3DuT1XWhjc--7-ZLjr8rMn1XHr5F+ckbA@mail.gmail.com>
 <48f3a61f-9e04-4755-b50c-8fae6e6112eb@gmail.com> <20240812105732.5d2845e4@kernel.org>
 <7e2ffe62-032a-4c5e-953b-b7117ab076be@gmail.com> <71260e3c-dee4-4bf0-b257-cdabd8cff3f1@gmail.com>
 <20240812171548.509ca539@kernel.org> <CAHS8izPyGwe_i4eNemW+A+MgMVHqJ0fdp=+-ju2ynqgc0mb_Ow@mail.gmail.com>
In-Reply-To: <CAHS8izPyGwe_i4eNemW+A+MgMVHqJ0fdp=+-ju2ynqgc0mb_Ow@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 13 Aug 2024 05:03:33 -0400
Message-ID: <CAHS8izM=d9pe0V3BWAY_gguNGymdc4DSFAz0DWyCMoGX6QVhDw@mail.gmail.com>
Subject: Re: [PATCH net-next v18 07/14] memory-provider: dmabuf devmem memory provider
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Donald Hunter <donald.hunter@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, David Wei <dw@davidwei.uk>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 4:39=E2=80=AFAM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> On Mon, Aug 12, 2024 at 8:15=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> =
wrote:
> > BTW, Mina, the core should probably also check that XDP isn't installed
> > before / while the netmem is bound to a queue.
>
> Sorry if noob question, but what is the proper check for this? I tried
> adding this to net_devmem_bind_dmabuf_to_queue():
>
> if (xdp_rxq_info_is_reg(&rxq->xdp_rxq))
>                  return -EEXIST;
>
> But quickly found out that in  netif_alloc_rx_queues() we initialize
> all the rxq->xdp_rxq to state REGISTERED regardless whether xdp is
> installed or not, so this check actually fails.
>
> Worthy of note is that GVE holds an instance of xdp_rxq_info in
> gve_rx_ring, and seems to use that for its xdp information, not the
> one that hangs off of netdev_rx_queue in core.
>

To elaborate further, in order to disable binding dmabuf and XDP on
the same rx queue for GVE, AFAIT the check would need to be inside of
GVE. Inside of GVE I'd check if gve_priv->xdp_prog is installed, and
check if the gve_rx_ring->xdp_info is registered. If so, then the rx
queue is XDP enabled, and should not be bound to dmabuf. I think that
would work.

At the moment I can't think of a check inside of core that would be
compatible with GVE, but above you clearly are specifically asking for
a check in core. Any pointers to what you have in mind would be
appreciated here, but I'll try to take a deeper look.

> Additionally, my understanding of XDP is limited, but why do we want
> to disable it? My understanding is that XDP is a kernel bypass that
> hands the data directly to userspace. In theory at least there should
> be no issue binding dmabuf to a queue, then getting the data in the
> queue via an XDP program instead of via TCP sockets or io uring. Is
> there some fundamental reason why dmabuf and XDP are incompatible?
>
> --
> Thanks,
> Mina



--=20
Thanks,
Mina

