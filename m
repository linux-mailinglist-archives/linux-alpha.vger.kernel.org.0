Return-Path: <linux-alpha+bounces-217-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D54C287277F
	for <lists+linux-alpha@lfdr.de>; Tue,  5 Mar 2024 20:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 648451F25635
	for <lists+linux-alpha@lfdr.de>; Tue,  5 Mar 2024 19:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04A55C608;
	Tue,  5 Mar 2024 19:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HB+2fcJF"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F233F8E4
	for <linux-alpha@vger.kernel.org>; Tue,  5 Mar 2024 19:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709666554; cv=none; b=IM7DRNNGx6J+XkM4Yx0w0N/i6aj+kL+dB1gn3lM5U9lahGcs0Fxcb/Ymq9605gPUn3NXYnsqqSvGp1KHssLkjemG44KbvIhQPzI7AD1aQzsqsv7HnNUQpH+AoWHNby5eVzExUhdhA3hyra2Xnw0dvwfxoCZ2egc8QHHgGx7N9ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709666554; c=relaxed/simple;
	bh=kV74Yj1MzqVyf6NNGDQ2CeGxlzKebgu7sxAA/z9x7pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=di9iMuJtmr/L0BIsdBY2ZoJeLTIcJtiQAPsZuWTXgenrCFTKyVBV8FuNx6x187gB+Tls8jQB+5nRzHZk59ZkAwmH8/Ammi226wcchEqXkOkAh3ztXjpOTh81Hwf476zRpempOCn0cBnXlmVhpUq5cd55lgiC19MJlvFd1C1I0xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HB+2fcJF; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a44f2d894b7so431846766b.1
        for <linux-alpha@vger.kernel.org>; Tue, 05 Mar 2024 11:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709666549; x=1710271349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zz04MsiLPf1EieQ9O8SZKHnfGRYziipBu1MQvsGASi0=;
        b=HB+2fcJF8i4aysA250J5V59Sykrt6RAA7OXvzat/EnHx2gkocUpUFfYcL8Laz1ldgo
         uiq13FWYw/j0TY+/6iyX/O6AUybIRCjMfzwKCPIgKaUfkCNCLj3y0UY2V8JiX33j0wen
         OwgHQb+0rmI4v39A53bSy1Om0beyGkFDa3QQvfHNJTTfum6Inur6L+BWAqkAGRFlS9YP
         3xSpuMB/U6nEoVyuBlUgOtuPjXyCtuh77HZyW+u7qIRHC47PKwtOqESealfxelh235M8
         Z7o8aAj05QR3jtuf8U2ilcjw+0l2nsg02feqIqxDTH5A3GXCM5ehYD5yLdpoqIGWrNBh
         rl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709666549; x=1710271349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zz04MsiLPf1EieQ9O8SZKHnfGRYziipBu1MQvsGASi0=;
        b=K9TZwOTp+HYlmrkQeitZ0IFWnH3z+eGg8Ww6Q3d6gpwInpCpVkvCRJ0I32p7Km1XhL
         sm3qKzLx3G6Ajj8Tro494fyDYOED+2vSLp1Gm+OIHDS8PZT4XDZSmFUoMP1HVXjHUbh8
         iqaXpbZVQYWZ6Q85x0hUPMMYn5bNRCN68UYL7liQUhIrkPS2LlMUGs0X+i6hVt9k/Z3O
         Nd5FKIuhn4nfmk//4YrrjvUa2WL3CE8ZsoAmySbRVcAVc/3JAk209EU5OhhAK4utimr2
         pJLV1UvazROUiMAnnak70hL0qtjTb8Mt3QfxlZPaC6vD4mnjEG/NrFzHbmLVxE5pLrUc
         auzw==
X-Forwarded-Encrypted: i=1; AJvYcCVtgOA/qlb6wcyzI2odwHKsEX1fS4sYSYxUeNfpkBFyvhIOp2JPZ4xPzZ0brSdBiqt0UQIcKDshrh7yiwerkLkycsKggY5OIGWzMxw=
X-Gm-Message-State: AOJu0Yzx98EIcKHjHocg7a14eX1He3p6/1BQPz/jIYcWik2t6oJKYs/h
	JmYX45CT5ZG2jA35kujmiKm19E81FGUfqZfMvJGQeqq+0Sx6wPk2rf21e+3sV+dx89PwWCalP3Y
	CokKfey8m+OXeZgJ607sqGKm1U5oimgYdZ6P8
X-Google-Smtp-Source: AGHT+IGfm5Q9d1QQtEV+FHngrLRB7RaEIdB98iS7LcjxrbCUYiUnZIxAhZ7sX2WiKXZhI6ep9u27+39/LAWZPVIzVjw=
X-Received: by 2002:a17:906:1cd5:b0:a44:15c3:c8e9 with SMTP id
 i21-20020a1709061cd500b00a4415c3c8e9mr10269704ejh.28.1709666549065; Tue, 05
 Mar 2024 11:22:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-13-almasrymina@google.com> <a2d926be-695a-484b-b2b5-098da47e372e@app.fastmail.com>
In-Reply-To: <a2d926be-695a-484b-b2b5-098da47e372e@app.fastmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 5 Mar 2024 11:22:15 -0800
Message-ID: <CAHS8izPbBHz=rr65ZtCy-+OGPbXXaY66_5EFSXw2bbhfGweRWg@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 12/15] tcp: RX path for devmem TCP
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

On Tue, Mar 5, 2024 at 12:42=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Tue, Mar 5, 2024, at 03:01, Mina Almasry wrote:
> > --- a/arch/alpha/include/uapi/asm/socket.h
> > +++ b/arch/alpha/include/uapi/asm/socket.h
> >  #define SO_PEERPIDFD         77
> > +#define SO_DEVMEM_LINEAR     79
> > +#define SO_DEVMEM_DMABUF     80
> > --- a/arch/mips/include/uapi/asm/socket.h
> > +++ b/arch/mips/include/uapi/asm/socket.h
> >  #define SO_PEERPIDFD         77
> > +#define SO_DEVMEM_LINEAR     79
> > +#define SO_DEVMEM_DMABUF     80
> > --- a/arch/parisc/include/uapi/asm/socket.h
> > +++ b/arch/parisc/include/uapi/asm/socket.h
> >  #define SO_PEERPIDFD         0x404B
> > +#define SO_DEVMEM_LINEAR     98
> > +#define SO_DEVMEM_DMABUF     99
> > --- a/arch/sparc/include/uapi/asm/socket.h
> > +++ b/arch/sparc/include/uapi/asm/socket.h
> >  #define SO_PEERPIDFD             0x0056
> > +#define SO_DEVMEM_LINEAR         0x0058
> > +#define SO_DEVMEM_DMABUF         0x0059
> > --- a/include/uapi/asm-generic/socket.h
> > +++ b/include/uapi/asm-generic/socket.h
> > @@ -135,6 +135,11 @@
> >  #define SO_PEERPIDFD         77
> > +#define SO_DEVMEM_LINEAR     98
> > +#define SO_DEVMEM_DMABUF     99
>
> These look inconsistent. I can see how you picked the
> alpha and mips numbers, but how did you come up with
> the generic and parisc ones? Can you follow the existing
> scheme instead?
>

Sorry, yes, this is a bit weird. I'll change this to use the next
available entry rather than leave a gap.

> > diff --git a/include/uapi/linux/uio.h b/include/uapi/linux/uio.h
> > index 059b1a9147f4..ad92e37699da 100644
> > --- a/include/uapi/linux/uio.h
> > +++ b/include/uapi/linux/uio.h
> > @@ -20,6 +20,16 @@ struct iovec
> >       __kernel_size_t iov_len; /* Must be size_t (1003.1g) */
> >  };
> >
> > +struct dmabuf_cmsg {
> > +     __u64 frag_offset;      /* offset into the dmabuf where the frag =
starts.
> > +                              */
> > +     __u32 frag_size;        /* size of the frag. */
> > +     __u32 frag_token;       /* token representing this frag for
> > +                              * DEVMEM_DONTNEED.
> > +                              */
> > +     __u32  dmabuf_id;       /* dmabuf id this frag belongs to. */
> > +};
>
> This structure requires a special compat handler to run
> x86-32 binaries on x86-64 because of the different alignment
> requirements. Any uapi-visible structures should be defined
> to avoid this and just have no holes in them. Maybe extend
> one of the __u32 members to __u64 or add another 32-bit padding field?
>

Honestly the 32-bit fields as-is are somewhat comically large. I don't
think extending the __u32 -> __u64 is preferred because I don't see us
needing that much, so maybe I can add another 32-bit padding field.
Does this look good to you?

struct dmabuf_cmsg {
  __u64 frag_offset;
  __u32 frag_size;
  __u32 frag_token;
  __u32 dmabuf_id;
  __u32 ext; /* reserved for future flags */
};

Another option is to actually compress frag_token & dmabuf_id to be
32-bit combined size if that addresses your concern. I prefer that
less in case they end up being too small for future use cases.

--=20
Thanks,
Mina

