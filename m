Return-Path: <linux-alpha+bounces-267-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AE5876E21
	for <lists+linux-alpha@lfdr.de>; Sat,  9 Mar 2024 01:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 810E9B22208
	for <lists+linux-alpha@lfdr.de>; Sat,  9 Mar 2024 00:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2097E36E;
	Sat,  9 Mar 2024 00:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cKLX+2Aa"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC4A1102
	for <linux-alpha@vger.kernel.org>; Sat,  9 Mar 2024 00:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709944076; cv=none; b=nXEN69BsqVhM7fx6j529I34TDDM1K+kTWyy+NSBvBxp0dmMkfGULfB5K1j4UmT3sEB2BkvxPT5EB5dxCPOiVogiV8stKR4XEPDSc+5xfPXJ5/aAmUpX7UpnVR5I3q9q0Lir5r3otzYAes2VH1HOlxKAAUtUW8M/U0VHy8AO6PEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709944076; c=relaxed/simple;
	bh=UAHNOoQOfnXGU4ynjW3Di4sMLSMOx0hwkdhyKrO246c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aaon3wtj8LRNlpS3o3auCpLd4KfbN4pXu6ncIaQmUqV5AclMfP7qfE4TYBcVyOGDxExTnnIDM5giVgtgH6+w9qsFB3bGf9mepqgiwYFb0UrBJgrMkoCqQsYaWpWOkSSouwcelLyEJTJkl7d2G112nNsdGWpKjpzfN+Z7ubCQxmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cKLX+2Aa; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-567bac94719so1623536a12.0
        for <linux-alpha@vger.kernel.org>; Fri, 08 Mar 2024 16:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709944071; x=1710548871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWYfh9XoJurOTi8J7CJKHaNZmYFNooi7e3RylW8C//Y=;
        b=cKLX+2AaXAKsbJm0yJSoV5EfK47mkTHgBxnjzLm3Qi+mbVTJ0/35N0WYiav0SapGJM
         cDyGrmHJrruoMoMLbe1jOUloQx5t4MAi4aNwOQY0tF21GKFBaIbyB/l1TEL/VySh/Mik
         uhP1cbY/yn+43G6SGbVcuyZnEEPvvCMiXnZzryMRsh8Odw3H7pu5pO3+Xv/68hE6he8H
         ZAR9cxuAP0O2ixXqz107LMaGDHHGH3a2etOdS48euG1nmkimVqQO91HOAsFYAgNUbZv7
         gdlKD2Ge6lIpNV+E+cB7LDUcbiPqA15QcEwaIAxb+3xOnQn/QxOZXkzs8kwfH8dshzUL
         sTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709944071; x=1710548871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWYfh9XoJurOTi8J7CJKHaNZmYFNooi7e3RylW8C//Y=;
        b=qDTah5qjwKZ0NLH9sEyC1/S/JTXv9/4462h3+9m2RjLNYHxOhjnI4fv/K//QnzEmGq
         IQ1RytVuPCLo3U1Ral5XNYb8ZqH54ajrqwWgI3qqXR/TxhJpeS682KxCcp6snaDBj21X
         tCn+yO/UDqYNvXuackKBLCix9E2i6XGqMwjLq142UeCesbUe2oj6yawFHC/6XLjEXFw7
         WICDuDT89aXrzTHPUkYw2dbVr/Vu80o7EvSPC87aWAtQutrcyvnvkUOtwMRkl6S9njPK
         SYBWZaq65DltHwW76tDVy2PcUg28uuz3OxJk7jTCDqECoXn0BUR7JGSN2aegPUiXmO1X
         YXqA==
X-Forwarded-Encrypted: i=1; AJvYcCXLruS5ddsI/f/3aGAvB/uSFTkhxLmubadVz9VQGC0uvlmGn8UIbLrpsQgr59lR4zXNOpzDivtlX42OQCAKLlRLza5OOx5TgXZyqoI=
X-Gm-Message-State: AOJu0YyHbhjBA0uoQC6BvH43HUDJbs7gsHTDElA0DkJR5ekwDYQ6CM58
	1D0nyUkDEanPUEoqDrQwmiLtbX81iap2wy1iU/+X1rKVJXF1gcznqCfpJa3OzkA/ga3fr7AprTJ
	Ya2VUWOmTfZUTESKlKpnfErttjolGaZJSMloQ
X-Google-Smtp-Source: AGHT+IESd1pHYOts43futyrxfMXx/f2edur2d17Kl0AlPQ1Jsil6uEMQ/KupG2jdYDiEzWeJ95HiQuXNh787lBIftRY=
X-Received: by 2002:a17:906:3c56:b0:a45:b631:1045 with SMTP id
 i22-20020a1709063c5600b00a45b6311045mr133451ejg.21.1709944071018; Fri, 08 Mar
 2024 16:27:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-2-almasrymina@google.com> <54891f27-555a-4ed1-b92f-668813c18c37@davidwei.uk>
In-Reply-To: <54891f27-555a-4ed1-b92f-668813c18c37@davidwei.uk>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 8 Mar 2024 16:27:39 -0800
Message-ID: <CAHS8izPJbLSgvXn7pA6OQ89=dOCoXYYtTvM=7-0_MB2NxucazA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 01/15] queue_api: define queue api
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
	Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 8, 2024 at 3:48=E2=80=AFPM David Wei <dw@davidwei.uk> wrote:
>
> On 2024-03-04 18:01, Mina Almasry wrote:
> > This API enables the net stack to reset the queues used for devmem.
> >
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> >
> > ---
> >  include/linux/netdevice.h | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> > index c41019f34179..3105c586355d 100644
> > --- a/include/linux/netdevice.h
> > +++ b/include/linux/netdevice.h
> > @@ -1435,6 +1435,20 @@ struct netdev_net_notifier {
> >   *                      struct kernel_hwtstamp_config *kernel_config,
> >   *                      struct netlink_ext_ack *extack);
> >   *   Change the hardware timestamping parameters for NIC device.
> > + *
> > + * void *(*ndo_queue_mem_alloc)(struct net_device *dev, int idx);
> > + *   Allocate memory for an RX queue. The memory returned in the form =
of
> > + *   a void * can be passed to ndo_queue_mem_free() for freeing or to
> > + *   ndo_queue_start to create an RX queue with this memory.
> > + *
> > + * void      (*ndo_queue_mem_free)(struct net_device *dev, void *);
> > + *   Free memory from an RX queue.
> > + *
> > + * int (*ndo_queue_start)(struct net_device *dev, int idx, void *);
> > + *   Start an RX queue at the specified index.
> > + *
> > + * int (*ndo_queue_stop)(struct net_device *dev, int idx, void **);
> > + *   Stop the RX queue at the specified index.
> >   */
> >  struct net_device_ops {
> >       int                     (*ndo_init)(struct net_device *dev);
> > @@ -1679,6 +1693,16 @@ struct net_device_ops {
> >       int                     (*ndo_hwtstamp_set)(struct net_device *de=
v,
> >                                                   struct kernel_hwtstam=
p_config *kernel_config,
> >                                                   struct netlink_ext_ac=
k *extack);
> > +     void *                  (*ndo_queue_mem_alloc)(struct net_device =
*dev,
> > +                                                    int idx);
> > +     void                    (*ndo_queue_mem_free)(struct net_device *=
dev,
> > +                                                   void *queue_mem);
> > +     int                     (*ndo_queue_start)(struct net_device *dev=
,
> > +                                                int idx,
> > +                                                void *queue_mem);
> > +     int                     (*ndo_queue_stop)(struct net_device *dev,
> > +                                               int idx,
> > +                                               void **out_queue_mem);
> >  };
>
> I'm working to port bnxt over to using this API. What are your thoughts
> on maybe pulling this out and use bnxt to drive it?
>

Sure thing, go for it! Thanks!

I think we've going to have someone from GVE working on this in
parallel. I see no issue with us aligning on what the core-net ndos
would look like and implementing those in parallel for both drivers.
We're not currently planning to make any changes to the ndos besides
applying Jakub's feedback from this thread. If you find a need to
deviate from this, let us know and we'll work on staying in line with
that. Thanks!

--=20
Thanks,
Mina

