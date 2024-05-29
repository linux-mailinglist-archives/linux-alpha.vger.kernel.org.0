Return-Path: <linux-alpha+bounces-468-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DCF8D3F18
	for <lists+linux-alpha@lfdr.de>; Wed, 29 May 2024 21:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6449E1C225AE
	for <lists+linux-alpha@lfdr.de>; Wed, 29 May 2024 19:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F4C1C68AE;
	Wed, 29 May 2024 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WaKJxj2r"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9F71C6888
	for <linux-alpha@vger.kernel.org>; Wed, 29 May 2024 19:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717012167; cv=none; b=c8GrJ1HFjcj8acj5gVsyWJaCMMjcb+Za3gIoANhpOv06sN+DvdLXqaAXA1P3U0duLb8ReEHHwRg+3TSz7Ly+B28HXfcqnSl8QbujDWFwm6ueLYws1LXDBrmRbtTPHWAODgNEhKYXiBullS8Od8zNEZQr9AmaZXEzfRy1tnBNsaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717012167; c=relaxed/simple;
	bh=6SM4nGMq6YXwjPx3hzOgTtkr8rnEX3Vki2GtQ9/v/Tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVLWBzmsfmqrqTarowKB9W60YcJVv68BdL7cWPZoXC1vlWbrGbqfVkb+mO891v1C+KWtJZydbfDwy7l3tZtJPfoygE6/V0E5cd41qlLCVnu9P5GimmB4Ke7FshJFqUkQpBzzyxtdBEff4GZJXvlcqC52XKXJbB5J3yEDGahFZ5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WaKJxj2r; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57883b25b50so106675a12.2
        for <linux-alpha@vger.kernel.org>; Wed, 29 May 2024 12:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717012162; x=1717616962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mc6m1mM9m4Ud5DdSGHmt9Zcx4NpBQQ1agEgintMCgFk=;
        b=WaKJxj2rSmiptfxPuIpvUd4DO37VpSMk36dQcSjU2nfbhLrs/6sj+L957ozHRkSxyE
         TahFIlyXavs4CwVkXbGgibHaZ78nBGAoNz1E+2HWXC9+7wpBE9x3fU/+vVUNcUW6rJqc
         n0wSQUBi2d3dc4nr8ulLpmSegCq86rCBEhG/icMRdmocKpO4NWAppHoIuWkJ8uNPH+jX
         o2ArPykUTi8L9m/w0vlaDn5Dc8OxRXwlaoO9jd/ezYSXQJ3I6lBNJtlfF/AcwBvjH0to
         Qv6SqMuA/Yte/M52TzTy7XMHZ3YE8iF0RhhZ/93YZjD2Ch6+/yU4fVLtCjI9qC9Bx0KN
         3KUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717012162; x=1717616962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mc6m1mM9m4Ud5DdSGHmt9Zcx4NpBQQ1agEgintMCgFk=;
        b=nwXcw6Blfc5/9/aFph45N8DU2dxfa8hRlavVrM3FDPb4D1bVu2B1n6hOJc9tc8D8dB
         zn1+jC90bOW2IS++ux56yIY/8e/mUphc0HHJWWeM0mh0AdLSNC66tQ1PfMo30K03yCGK
         AT3NX7A4yCgh8FZ/Doxo51krgJluI9y2PPE5wPvB6vD4CWCIspOwukqKu4tEOvjvo+cn
         Fv+md3D0Xx8WLOYY2uHZ/Pn7rL8Rv3riFwZ/OeaB66AAMJfZDYIQwuv618ziIqrcM7LL
         6dapAZOoU62j8JKtms3+isQQhlxAm6W87trMi/+8J2gVCtbJQfMo61umj1Kk80u+vr+G
         MQcg==
X-Forwarded-Encrypted: i=1; AJvYcCWbMBBdmPMeQMtCGv2N2p00LUt5TVXya18uwiFU0o8zM3Wax2vfdUt+DIYlyur5C8UTwpXtC0NrnCEcDhA7g5aKYyiembjuhGTB2c0=
X-Gm-Message-State: AOJu0Yx5ahZXEHHbvkmRtcdv6fpFmNPk1pjPZDxCQGOvBUOim30toQVT
	n50oWP3FoKtcUaAva6ukdh7HwC1hvZ0OTXTk3yxcKzhcuRwErWc3RSjNlnFMggXzUUZ15gvRUzB
	Uv23on73ghvuOWAS57Qrf+9/RDOOEdXQMbm+eu2KUBKXF8olE50oIgetSgQ==
X-Google-Smtp-Source: AGHT+IF9PV9JeYxxToH3qJtJfXsnwGUXtNUCB5FusC4DI8sGVRwbRTrnhLkmsIc9tQHh+KHAMPViyk6pTFPRs1HCH10=
X-Received: by 2002:a17:906:c18f:b0:a63:49a5:9390 with SMTP id
 a640c23a62f3a-a65e8f74d3dmr11845366b.41.1717012162364; Wed, 29 May 2024
 12:49:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510232128.1105145-1-almasrymina@google.com>
 <20240510232128.1105145-5-almasrymina@google.com> <d85f4ba4-774f-4577-985f-45a5a1866da7@davidwei.uk>
In-Reply-To: <d85f4ba4-774f-4577-985f-45a5a1866da7@davidwei.uk>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 29 May 2024 12:49:08 -0700
Message-ID: <CAHS8izPVhDaokO9C+S4RR9b6+77OV2CsNb8jnGGKxNqGTa6DXg@mail.gmail.com>
Subject: Re: [PATCH net-next v9 04/14] netdev: support binding dma-buf to netdevice
To: David Wei <dw@davidwei.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
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
	Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 18, 2024 at 11:46=E2=80=AFAM David Wei <dw@davidwei.uk> wrote:
>
> On 2024-05-10 16:21, Mina Almasry wrote:
> > +void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *bindin=
g)
> > +{
> > +     struct netdev_rx_queue *rxq;
> > +     unsigned long xa_idx;
> > +     unsigned int rxq_idx;
> > +
> > +     if (!binding)
> > +             return;
> > +
> > +     if (binding->list.next)
> > +             list_del(&binding->list);
> > +
> > +     xa_for_each(&binding->bound_rxq_list, xa_idx, rxq) {
> > +             if (rxq->mp_params.mp_priv =3D=3D binding) {
> > +                     /* We hold the rtnl_lock while binding/unbinding
> > +                      * dma-buf, so we can't race with another thread =
that
> > +                      * is also modifying this value. However, the pag=
e_pool
> > +                      * may read this config while it's creating its
> > +                      * rx-queues. WRITE_ONCE() here to match the
> > +                      * READ_ONCE() in the page_pool.
> > +                      */
> > +                     WRITE_ONCE(rxq->mp_params.mp_ops, NULL);
> > +                     WRITE_ONCE(rxq->mp_params.mp_priv, NULL);
> > +
> > +                     rxq_idx =3D get_netdev_rx_queue_index(rxq);
> > +
> > +                     netdev_rx_queue_restart(binding->dev, rxq_idx);
>
> What if netdev_rx_queue_restart() fails? Depending on where it failed, a
> queue might still be filled from struct net_devmem_dmabuf_binding. This
> is one downside of the current situation with netdev_rx_queue_restart()
> needing to do allocations each time.
>
> Perhaps a full reset if individual queue restart fails?
>

Sorry for the late reply, I've been out on vacation for a few days and
caught up to some other work.

Yes, netdev_rx_queue_restart() can fail, but I'm not sure how to
recover. Full reset would be an option, but it may be way too big of a
hammer to do a full reset on this failure. Also, last I discussed with
Jakub, AFAIU, there is no way for core to reset the driver? I had
suggested to Jakub to use ndo_stop/ndo_open to reset the driver on
queue binding/unbinding, but he rejected that as it could cause the
driver to fail to come back up, which would leave the machine stranded
from the network. This is why we implemented the queue API, as a way
to do the binding/unbinding without risking the machine stranding via
a full reset. This is the previous convo from months back[1].

So, all in all, I don't see anything amazing we can do here to
recover. How about just log? I will add a warning in the next
iteration.

(I applied most of the rest of your suggestions btw).

[1] https://patchwork.kernel.org/project/netdevbpf/patch/20231106024413.280=
1438-13-almasrymina@google.com/#25590262

--=20
Thanks,
Mina

