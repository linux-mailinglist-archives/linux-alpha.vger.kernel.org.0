Return-Path: <linux-alpha+bounces-317-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E978908C3
	for <lists+linux-alpha@lfdr.de>; Thu, 28 Mar 2024 19:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6239DB234F5
	for <lists+linux-alpha@lfdr.de>; Thu, 28 Mar 2024 18:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8D813791B;
	Thu, 28 Mar 2024 18:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Hb+XRtA"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5268139578
	for <linux-alpha@vger.kernel.org>; Thu, 28 Mar 2024 18:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711652141; cv=none; b=JHo6waI4ySvYmVH8Ia39+r0N05h+7LQ3Uh0//HfxTCoLZzuDSBgev2NF8s9W0u5/DXAfs1jIfUQjKsd3AE7LD3RaaOxGU87+ew4NOhUaAeXVqIKEnboaDOmLRK09mktTZlitxiVXb7W8lx/QXJB4wc0wennKXZScndTKfNQPGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711652141; c=relaxed/simple;
	bh=HEIIl0JSGFr4znc+2rNtcx7sc7JVm8rdL5u1IoWR8YY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tM+kWVKVKmAcvQsl/kYyb+XRXO55GQiPV+ZE0kzNXnsp3QBtol2UQiYbkSQKWTbsAE0hLVkVVu0s7f+5RMY3IA9hsCK2LKnHCD145maUiSYqXRzG6GzZFsoDLiHuKOQCt8CPf+ULaZk1HN1VKItUdTkXvbtB6wWfMxbtAtylMJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Hb+XRtA; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56c0d1bddc1so1571082a12.3
        for <linux-alpha@vger.kernel.org>; Thu, 28 Mar 2024 11:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711652137; x=1712256937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/g0QRd03Q47daRFmOpf216fDEljWTmtj0CWrlO2PgGk=;
        b=3Hb+XRtAwkk/pUajFr4adIyn143CbCRNoz4ccLHfrEILcL2DaBXJgRzVn523BzxLIW
         SlDsWRkY+EJzn2phJnhfdGUCWGAvqjRRUGpDhhYGc1RNFKvj/UyIS7tkAOCH+GizezUH
         Q0FuDIQFk8w+YBWsFoGc95yI0VQehrHpVm5ak6CuvmCt385vHaWYrhRKrFUKfdJsGTeB
         qjacse03vJTO4H8UVvu3cHA5lqIMt4Q66SXYjFAUjlDi4xTf5nX+vPn0qoxB2hlZGkpP
         OyarGDeASq0f0xuzTDKXTVNFper3pHEuTcUZWfOaMk7T36Dq65PrYfaQJq9DJkWzpwds
         x+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711652137; x=1712256937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/g0QRd03Q47daRFmOpf216fDEljWTmtj0CWrlO2PgGk=;
        b=oNJ1LkpneiFBkCgvCuS7xIDmptcLITJ6IhdSmqAugEjRJyaWXWZ+wTlLYUh0j07xRv
         kcl/qGkac1qa7VMcDcHB42n9GrKNCLSu4WGx3/Lq3uUCbienKuZgJWinhbznVYdBeLp4
         3IZIilxW/Ejqj//2JhPvcqPHiTLy3OgReon7324vPMI3zcBmM78JelocJHIYvsYiv2Co
         3vD8ZM1BcnUGaRe8XIrhg1tjNaucOEDlN59YLX6XENC0+4AkIcChAK3VQSJhaM7IP2ip
         F0Reg5RxPJogxlDRfXs5ENZYTPoiHobdd9fhCCxLvajTUrv7iUh5pAkhvxBL+5ZbPfkA
         k32w==
X-Forwarded-Encrypted: i=1; AJvYcCVZjZ3fVBUTpG2OwgGT0uawvurgXjHWSRxAmkOAmmlaEGBjTvYiMT8+44hv6koavUUTUsjSiypfp5eeEh0HR4uJK2bDD0pg8Nd9Rk4=
X-Gm-Message-State: AOJu0Yzg3N/Ww/jM1W0RS9mruvjZF7PeM5Nz0UbR1AzGS67uyxRbyxhT
	x4P/AvF08A6JExLLGAXNNUG9FAW+8PgMoVktu/bWw/6MQBsIrz98mOuSPGFCaiQ1PW2B6BZ1sP7
	J0OZ5s4RtwMLFgafiAykoQIE/WYzTn4FitI7+
X-Google-Smtp-Source: AGHT+IFT7BjTbnc4go6zIYPcPdx3xb2qgp8zmitrga5SNdEeKiv/hX6FeRXvUPA8/BgWnl2x89qqbJVYumySJ8ZZV8Y=
X-Received: by 2002:a17:907:7898:b0:a4e:eb1:9a3d with SMTP id
 ku24-20020a170907789800b00a4e0eb19a3dmr85852ejc.68.1711652136773; Thu, 28 Mar
 2024 11:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326225048.785801-1-almasrymina@google.com>
 <20240326225048.785801-5-almasrymina@google.com> <20240328182812.GJ651713@kernel.org>
In-Reply-To: <20240328182812.GJ651713@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 28 Mar 2024 11:55:23 -0700
Message-ID: <CAHS8izMZuRwQZsL7PQdoRcrgeh6rEa7n1NMhbm-aZMes2QHVzg@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v7 04/14] netdev: support binding dma-buf to netdevice
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 11:28=E2=80=AFAM Simon Horman <horms@kernel.org> wr=
ote:
>
> On Tue, Mar 26, 2024 at 03:50:35PM -0700, Mina Almasry wrote:
> > Add a netdev_dmabuf_binding struct which represents the
> > dma-buf-to-netdevice binding. The netlink API will bind the dma-buf to
> > rx queues on the netdevice. On the binding, the dma_buf_attach
> > & dma_buf_map_attachment will occur. The entries in the sg_table from
> > mapping will be inserted into a genpool to make it ready
> > for allocation.
> >
> > The chunks in the genpool are owned by a dmabuf_chunk_owner struct whic=
h
> > holds the dma-buf offset of the base of the chunk and the dma_addr of
> > the chunk. Both are needed to use allocations that come from this chunk=
.
> >
> > We create a new type that represents an allocation from the genpool:
> > net_iov. We setup the net_iov allocation size in the
> > genpool to PAGE_SIZE for simplicity: to match the PAGE_SIZE normally
> > allocated by the page pool and given to the drivers.
> >
> > The user can unbind the dmabuf from the netdevice by closing the netlin=
k
> > socket that established the binding. We do this so that the binding is
> > automatically unbound even if the userspace process crashes.
> >
> > The binding and unbinding leaves an indicator in struct netdev_rx_queue
> > that the given queue is bound, but the binding doesn't take effect unti=
l
> > the driver actually reconfigures its queues, and re-initializes its pag=
e
> > pool.
> >
> > The netdev_dmabuf_binding struct is refcounted, and releases its
> > resources only when all the refs are released.
> >
> > Signed-off-by: Willem de Bruijn <willemb@google.com>
> > Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
>
> ...
>
> > +int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_id=
x,
> > +                                 struct net_devmem_dmabuf_binding *bin=
ding)
> > +{
> > +     struct netdev_rx_queue *rxq;
> > +     u32 xa_idx;
> > +     int err;
> > +
> > +     if (rxq_idx >=3D dev->num_rx_queues)
> > +             return -ERANGE;
> > +
> > +     rxq =3D __netif_get_rx_queue(dev, rxq_idx);
> > +     if (rxq->mp_params.mp_priv)
> > +             return -EEXIST;
> > +
> > +     err =3D xa_alloc(&binding->bound_rxq_list, &xa_idx, rxq, xa_limit=
_32b,
> > +                    GFP_KERNEL);
> > +     if (err)
> > +             return err;
> > +
> > +     /* We hold the rtnl_lock while binding/unbinding dma-buf, so we c=
an't
> > +      * race with another thread that is also modifying this value. Ho=
wever,
> > +      * the driver may read this config while it's creating its * rx-q=
ueues.
> > +      * WRITE_ONCE() here to match the READ_ONCE() in the driver.
> > +      */
> > +     WRITE_ONCE(rxq->mp_params.mp_ops, &dmabuf_devmem_ops);
>
> Hi Mina,
>
> This causes a build failure because mabuf_devmem_ops is not added until a
> subsequent patch in this series.
>

My apologies. I do notice the failure in patchwork now. I'll do a
patch by patch build for the next iteration.

> > +     WRITE_ONCE(rxq->mp_params.mp_priv, binding);
> > +
> > +     err =3D net_devmem_restart_rx_queue(dev, rxq_idx);
> > +     if (err)
> > +             goto err_xa_erase;
> > +
> > +     return 0;
> > +
> > +err_xa_erase:
> > +     WRITE_ONCE(rxq->mp_params.mp_ops, NULL);
> > +     WRITE_ONCE(rxq->mp_params.mp_priv, NULL);
> > +     xa_erase(&binding->bound_rxq_list, xa_idx);
> > +
> > +     return err;
> > +}
>
> ...



--=20
Thanks,
Mina

