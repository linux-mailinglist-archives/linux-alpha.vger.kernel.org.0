Return-Path: <linux-alpha+bounces-220-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 984F7872824
	for <lists+linux-alpha@lfdr.de>; Tue,  5 Mar 2024 21:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F3DD2904B3
	for <lists+linux-alpha@lfdr.de>; Tue,  5 Mar 2024 20:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A86126F1C;
	Tue,  5 Mar 2024 20:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GQCcdh2M"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C42F7764A
	for <linux-alpha@vger.kernel.org>; Tue,  5 Mar 2024 20:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709668824; cv=none; b=aNdF+12DUBxR9jUMUM63aD5QJfPteklTzOffQ12teqKfARggcG7d0UfXOoLsYm0sgE+7I6JjfEpOxWQee0x7nKaTgrqG1qReK/065xG1ygYD4fBG1dcvKe17oRtwnst4b2nx1GOziCGHfhFXSO8aNY7oPG+jZk/+gwR0z+03Cig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709668824; c=relaxed/simple;
	bh=zvCIxr8VBjsKzdRKj72ITiWaaPuXwUFhasVmFGiaDtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dCi446Hfl4c0ialN6X1Uof8avHOv9Lm3JaoWec1BI3xh75ARvzTIZYJEZD1Q14it/uXeQCdkub8znUye+VG/aVPtIB12wmQeXm5CQbginnJh2QPDtxF1Q21uEsQb2j7xx5Gpq1Ha18JFXvOq9V1R3UKSo3W+nofRKtg2toZ7UkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GQCcdh2M; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a45b25f6f84so40309866b.0
        for <linux-alpha@vger.kernel.org>; Tue, 05 Mar 2024 12:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709668821; x=1710273621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um7HQJN8N4J1bd3DjjlCtIBtcKYJjLGAY5O7WX29jhs=;
        b=GQCcdh2MldH/YcpNngEOhJ93Lez+BG92jbvj3xTQKZfXfuaZNCzmOOZbV2gDMd4//R
         RUDIXcB0aVfS9WSwFs7IJJQ/y1Qy/nicYVfdFQluHtxSMfgcamUEChzZrV6bE5RVAg+d
         8x7sUhgoYrXyQAD3Q6LRJGRQxNsdjrhT6qN4tKbeqfoxWmkzMvDIL7erP/n5qj18xKHf
         R8fBtNcxgwib9+mtc8yx+839STKOJlbtiDxY5Rzdvlj2/s7kRdLuo4E2+Lxyc/t5v71o
         hE27KoRkiuOaRQejDkoDPRhF+QXyaz5wGJRSvG72AT2vKBH6JSBdgt/ZHxE3VsBBvnf8
         rw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709668821; x=1710273621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Um7HQJN8N4J1bd3DjjlCtIBtcKYJjLGAY5O7WX29jhs=;
        b=oWbqgpi1aT37BUSKy0e9w6GElVDxz9Ca7JKPwy7rFpDTsdo55KQycndCRl0p4ViXj7
         jZQb12s13sRrSL4sHOacttVkNRtv/ZnyTHgs0UXMrTyCN6tjPd85IVyH+MAH1EmcurQb
         TNoMYlt66YQYABR2n6hB1+9f5yagdCOD0Uo6kWw6d4rSzCsdrLc3+yfNK6mjfGhGydDC
         C0gCwu/ecTydkPFNn8PMlBKbMAjip6k1DWsmXzg/cvP5lLpSBVX3nF4JHeUEANa7n0oA
         k+F1xMSXdiHC0QVbqFsiXWunPp9YGprd6qcpqrpPWPVxR8/iLwCaS1M61vmdke6yEpGJ
         O5lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVubBMj6iPTycWsiRmQwP8Q8oDBTKgp5pguREZnDsvTpHqZko8Xd65Jhu9JUIbS2AHkQ9WWE/BfPkerY2Ttz5GX2zLyGfYASKn+pUE=
X-Gm-Message-State: AOJu0YyDyyOdDamutGECDgxaKxhOO9z6u388Quvw9CUqy72FWd8LcqAp
	J6XxOyTHWBlxzLQBMWyG9f1Z5Kiqh4G/WVeyALDdX23ku3XpUcqgYEGHEWxx42fxt3E4xZjTuhS
	deGfzrvDlUkg5rv/Pp44afACqZ2+QzNAbWT5r
X-Google-Smtp-Source: AGHT+IHytdC7v7Vx7sLFDUTdLyz9HH4/B980RlTrZABliOPKZSD4E6pDWhlNI6pqEZujcxK31LaEVTdzhieo1tJYP+0=
X-Received: by 2002:a17:906:394b:b0:a43:6146:a4df with SMTP id
 g11-20020a170906394b00b00a436146a4dfmr7667230eje.21.1709668820535; Tue, 05
 Mar 2024 12:00:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-6-almasrymina@google.com> <5e2f9342-4ee9-4b30-9dcf-393e57e0f7c6@app.fastmail.com>
In-Reply-To: <5e2f9342-4ee9-4b30-9dcf-393e57e0f7c6@app.fastmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 5 Mar 2024 12:00:08 -0800
Message-ID: <CAHS8izPhvRDPVHr8mY2FffPCLYjKqaazjy5NFcnJSnLK+CdyCA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 05/15] netdev: support binding dma-buf to netdevice
To: Arnd Bergmann <arnd@arndb.de>
Cc: Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, shuah <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeelb@google.com>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 1:05=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Mar 5, 2024, at 03:01, Mina Almasry wrote:
>
> > +int netdev_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_fd,
> > +                    struct netdev_dmabuf_binding **out)
> > +{
> > +     struct netdev_dmabuf_binding *binding;
> > +     static u32 id_alloc_next;
> > +     struct scatterlist *sg;
> > +     struct dma_buf *dmabuf;
> > +     unsigned int sg_idx, i;
> > +     unsigned long virtual;
> > +     int err;
> > +
> > +     if (!capable(CAP_NET_ADMIN))
> > +             return -EPERM;
> > +
> > +     dmabuf =3D dma_buf_get(dmabuf_fd);
> > +     if (IS_ERR_OR_NULL(dmabuf))
> > +             return -EBADFD;
>
> You should never need to use IS_ERR_OR_NULL() for a properly
> defined kernel interface. This one should always return an
> error or a valid pointer, so don't check for NULL.
>

Thanks for clarifying. I will convert to IS_ERR().

> > +     binding->attachment =3D dma_buf_attach(binding->dmabuf, dev->dev.=
parent);
> > +     if (IS_ERR(binding->attachment)) {
> > +             err =3D PTR_ERR(binding->attachment);
> > +             goto err_free_id;
> > +     }
> > +
> > +     binding->sgt =3D
> > +             dma_buf_map_attachment(binding->attachment, DMA_BIDIRECTI=
ONAL);
> > +     if (IS_ERR(binding->sgt)) {
> > +             err =3D PTR_ERR(binding->sgt);
> > +             goto err_detach;
> > +     }
>
> Should there be a check to verify that this buffer
> is suitable for network data?
>
> In general, dmabuf allows buffers that are uncached or reside
> in MMIO space of another device, but I think this would break
> when you get an skb with those buffers and try to parse the
> data inside of the kernel on architectures where MMIO space
> is not a normal pointer or unaligned access is disallowed on
> uncached data.
>
>         Arnd

A key goal of this patch series is that the kernel does not try to
parse the skb frags that reside in the dma-buf for that precise
reason. This is achieved using patch "net: add support for skbs with
unreadable frags" which disables the kernel touching the payload in
these skbs, and "tcp: RX path for devmem TCP" which implements a uapi
where the kernel hands the data in the dmabuf to the userspace via a
cmsg that gives the user a pointer to the data in the dmabuf (offset +
size).

So really AFACT the only restriction here is that the NIC should be
able to DMA into the dmabuf that we're attaching, and dma_buf_attach()
fails in this scenario so we're covered there.

--=20
Thanks,
Mina

