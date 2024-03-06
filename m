Return-Path: <linux-alpha+bounces-228-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DCE872CDB
	for <lists+linux-alpha@lfdr.de>; Wed,  6 Mar 2024 03:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33C6528882A
	for <lists+linux-alpha@lfdr.de>; Wed,  6 Mar 2024 02:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CACCD531;
	Wed,  6 Mar 2024 02:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZFNSeEi6"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDC5D529
	for <linux-alpha@vger.kernel.org>; Wed,  6 Mar 2024 02:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709692973; cv=none; b=OxmlRVfbzwHhz8n239GXOMwdJ7Wef5cN45KhZkGiD1dKq/hZrcgCZmxNQoXZ0rzlNIgYTsDv7+uahWmaWEA0il2xSZ3VZKGDVYUK2vrvlYOUuvnYzdmSZ2nRCm+QfK+56ZSkOi1xFgWxYmoYj7J4gpmpcOHFAsoL7mHs9i0sM4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709692973; c=relaxed/simple;
	bh=NvDvKdXSBfFKBtLGn84e/ck4Kn9xC15K+wg1+/TVvIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9jdUOHRGkb90yjXzXMQecL83CcB0Df9JaRpnlj3gcDRhFPA3jN/6XcSK88la0O+pihvpJtDWSKNn2Im76c12zlQK97SvXSChdew9IlKDTLE+cfxXb1ey0hgz/V8DiLuIDsPwcXAKaO+4+bWkQLltyjWogzz3YDYbObVzJuG0YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZFNSeEi6; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a441d7c6125so146180166b.2
        for <linux-alpha@vger.kernel.org>; Tue, 05 Mar 2024 18:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709692969; x=1710297769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2WY4uFfSORqsxmoN252fMsc5YpGsXMNwoTLggkrkUc=;
        b=ZFNSeEi6fJz1DxapDerPDO0oc3CCjhA4NKeWKjNh5mOF7RPy73sAJa+6d8Jl0hD4//
         qaWfnGJDRztzQdE2ONgL48DEla3ykgVII3xlYaOzktBdXeecXIwEZVtg6/f6zcJSbyCX
         +v2Pw8/EdMIoYJEAWnRtEM5Wsg6PMFK7cK+8MTNNuip90TSqu4T/KUDQbN7knCo4jkU6
         XxmEhZhJtc0Xv79ozueLyCX+rP7eVEN6JxHPfclD5yooPfLL0R/mf0co4iPW0Kp4nVuU
         0bn1Ttic5qrtTyM+vhJn3yWOo08SQZQt7OWKODQd9eXY3FFWNQ28hjWU0UeuyvPQb3qp
         LS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709692969; x=1710297769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2WY4uFfSORqsxmoN252fMsc5YpGsXMNwoTLggkrkUc=;
        b=slmo2/bHXqlEfuSm9AASIYeCn7hAw96btNDEvGxl/IlDZNo0F+Lmzm/RHuF1cJAu69
         O5Nsev8DmxAN2TwPGod+QFlCuxCuPb0kuND+kLUAs8bKko06JVdthgiFtKK/AoSxTOeJ
         5SdROuTYgyFGzjX2TWcLdI/RnvUiEmQ7wENzh0fZkWUpP30SK8NjWyp6CPbJPXOD40ZA
         hLHLf82JH+JkTGt/BIGYdT8lZgC0ssZq4CKU72Ee8ie2T74InpTLCTM20PzH5NkHzS4C
         zBE4RkhmJECoLW4OfzjaLwxcnHvVXtfJI5JHMrIVe2vZXkb+LkTQSGhTI2Qi0aTBRhck
         DZpA==
X-Forwarded-Encrypted: i=1; AJvYcCUUBRzj+LeC596Lk3OZp+Q/Jx6yYAlzW8vdPMIB7C6z3FGpH9ZG1TBUXmB1VTYIMWTFlOCZu/VDilCmRFcYcWNhaZ9A/A3f0rv8+N4=
X-Gm-Message-State: AOJu0Yzx4kKCIsEDMMyaCZnLgK3IZDZHBr7zxag2CARD5Ahk29RLTBmI
	b+d6ZuKBFwVwZMw4rFa9/OLFbcDu/YBSs22rcvC07evozEhwewo82AnanJWarjzmHF3FgrHqRA1
	x+gv+y1ba/U7Qf1+OBxPpy1pLerv7WFowQN2P
X-Google-Smtp-Source: AGHT+IE0p4dMKmBQEWPN97sZRzFoRZYkkR6K2Lqxx/MoMEWGX+2miy2Ao5l4zesUpz9uL42402ZTwWMCpTdHvKmmsvU=
X-Received: by 2002:a17:906:2417:b0:a45:ad5d:98ac with SMTP id
 z23-20020a170906241700b00a45ad5d98acmr1779500eja.44.1709692968869; Tue, 05
 Mar 2024 18:42:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-10-almasrymina@google.com> <383c4870-167f-4123-bbf3-928db1463e01@davidwei.uk>
In-Reply-To: <383c4870-167f-4123-bbf3-928db1463e01@davidwei.uk>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 5 Mar 2024 18:42:35 -0800
Message-ID: <CAHS8izP_PzDJVxycwZe_d_x10-SX4=Q-CWpKTjoOQ5dc2NSn3w@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 09/15] memory-provider: dmabuf devmem
 memory provider
To: David Wei <dw@davidwei.uk>
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
	Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 6:28=E2=80=AFPM David Wei <dw@davidwei.uk> wrote:
>
> On 2024-03-04 18:01, Mina Almasry wrote:
> > +     if (pool->p.queue)
> > +             binding =3D READ_ONCE(pool->p.queue->binding);
> > +
> > +     if (binding) {
> > +             pool->mp_ops =3D &dmabuf_devmem_ops;
> > +             pool->mp_priv =3D binding;
> > +     }
>
> This is specific to TCP devmem. For ZC Rx we will need something more
> generic to let us pass our own memory provider backend down to the page
> pool.
>
> What about storing ops and priv void ptr in struct netdev_rx_queue
> instead? Then we can both use it.

Yes, this is dmabuf specific, I was thinking you'd define your own
member of netdev_rx_queue, and then add something like this to
page_pool_init:

+       if (pool->p.queue)
+               io_uring_metadata =3D READ_ONCE(pool->p.queue->io_uring_met=
adata);
+
+       /* We don't support rx-queues that are configured for both
io_uring & dmabuf binding */
+       BUG_ON(io_uring_metadata && binding);
+
+       if (io_uring_metadata) {
+               pool->mp_ops =3D &io_uring_ops;
+               pool->mp_priv =3D io_uring_metadata;
+       }

I.e., we share the pool->mp_ops and the pool->mp_priv but we don't
really need to share the same netdev_rx_queue member. For me it's a
dma-buf specific data structure (netdev_dmabuf_binding) and for you
it's something else.

page_pool_init() probably needs to validate that the queue is
configured for dma-buf or io_uring but not both. If it's configured
for both then the user is doing something funky we shouldn't support.

Perhaps I can make the intention clearer by renaming 'binding' to
something more specific to dma-buf like queue->dmabuf_binding, to make
it clear that this is the dma-buf binding and not some other binding
like io_uring?

--=20
Thanks,
Mina

