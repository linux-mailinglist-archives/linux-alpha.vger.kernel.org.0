Return-Path: <linux-alpha+bounces-696-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEC69240EA
	for <lists+linux-alpha@lfdr.de>; Tue,  2 Jul 2024 16:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1562283FC7
	for <lists+linux-alpha@lfdr.de>; Tue,  2 Jul 2024 14:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3540A1B5831;
	Tue,  2 Jul 2024 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XcjrS/mU"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED31A1B5837
	for <linux-alpha@vger.kernel.org>; Tue,  2 Jul 2024 14:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719930653; cv=none; b=XoWGXzeVjhMttajStYB6vFl4WT6EvEE6/N/leVlzUItwMok7msy1bArwlsiz35uQxPwzYtG5OipYE+Vjaf77HWiFlSfaUHTR5SfwfkOlaLHm8+23CKep9HzC2ih9H1w0IX2CtDfa0sh+WobSkr8QR+zo91h4SJwp9NNX7+Yy+/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719930653; c=relaxed/simple;
	bh=nPsWzSKNKWp6syDtdY7Ir2nt0wTvI1SQEd/GjSGs6hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sQmr3T7XsCiRWXZrXYlzAQ7eZjRtkU1A93qXY+lvlDZXdQ5cVPYb1KP1QuFGBpnp1Pi1WJGEBmDZ4f7N8S3hnhVDH+w8k5+rUoZPHEr062XMKhcLJ5UIbLz6YVbz4N4nUCd2XC2XAW3GlBFCJdL7eowdetTrqbsCaGLRmlyMrJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XcjrS/mU; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-58c0abd6b35so5731a12.0
        for <linux-alpha@vger.kernel.org>; Tue, 02 Jul 2024 07:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719930649; x=1720535449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jM7/wfZzza6LzDSng98O/sFMouLELQtFerEOq9E8OA=;
        b=XcjrS/mUBdohB1KNhGJQfJf/nbZ8kwgOfO6qBmU7gseA2VjYs3KYNg6P3qjdS6kXwA
         t3PYUEXsAYNAnugIOeyWNrMKC9zpbt9E2WcvB3YJqqb45ymsEt1oYukBzuoT48ERCr13
         qAhDw+AsJhrb54yNrOORg0LQz50mBF2K7N645UDwGtgq3FLU/FUwoCEkGz8KC/gfnEPh
         kCjhKxR/KPHv8ud5NsMekoA8HF6CNdf2M9HPr5BKCrCkxZhD6UFov63lSjr16CW4Qv/0
         UUNHiPyslXVCt/BKP8SCP6MSQOYal4roNuMJgSUBSneb1BxDv8FD0LAV+td72x/VG8LW
         /vnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719930649; x=1720535449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jM7/wfZzza6LzDSng98O/sFMouLELQtFerEOq9E8OA=;
        b=YUOdvPdAAyZVgrf9hM2vGz0Z/vyJim9JzFQsUI3g9lDc3BGmOKpVRGG6Q8BORTOArA
         lh9FNy0MywHhRrcXIcVvg1J+BCgi5IAZvgRKfjr+UIW+xpHu1EltksY3GN+JTEGGLE86
         10+JUDbhdT3QaSwC8s+qIzuDrdzRtQvZoiQ12myJd/1xPj6A+7V58+Zok+EZPJ7Ekqbr
         IF0G+INfLshw34ynj4wsrab7h8bw5B6At+3W9c+zwWh2v4xhOUUgQuS1qMqQWOJboG23
         QwHmFNHe1kqXpTuOFnvbNXbChBFZGEPiI5ISmTNDr3ALdaQkostKHsT8mb85pcebxySr
         aO2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdbmmxLpX+ErmtA22uE3y1thBQ/pYVU3KP0q09yTdMRqfrCHNfhcfMX5G2CACSicis9ZpyDvHtO1OplnmyiFkBewRVMC7So8icgH0=
X-Gm-Message-State: AOJu0YzZjy6Y0M0HfysaHpUOHFtp3rGzEqsjw/pbFJcUUllhIO1Sz+gT
	WhlTjStNP7P1WuTK/130vit7g00xy11WU/ZXbPH/ViSAmDG5PmQTgggA7vgxxKhqfx39+y7I05I
	ymNv6dlGl8zXXczgmNlv4GAGNINYLgbaMpEsk
X-Google-Smtp-Source: AGHT+IG6q9qlZv6p0XsjYtQr/2CJh2iWJHZfafuRVFcTNadBZxk7tzb9cfayzAyvnfb859R1NpQn1uwJAUI6SXHDoq4=
X-Received: by 2002:a50:f68b:0:b0:58b:e3b:c5d8 with SMTP id
 4fb4d7f45d1cf-58c61e8924fmr10222a12.0.1719930648903; Tue, 02 Jul 2024
 07:30:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628003253.1694510-1-almasrymina@google.com> <20240628003253.1694510-12-almasrymina@google.com>
In-Reply-To: <20240628003253.1694510-12-almasrymina@google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 2 Jul 2024 16:30:37 +0200
Message-ID: <CANn89iLRRaf31svCM9KUChwmKo53T9TTKayr3_bnbUu+Fuej7g@mail.gmail.com>
Subject: Re: [PATCH net-next v15 11/14] net: add SO_DEVMEM_DONTNEED setsockopt
 to release RX frags
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 2:33=E2=80=AFAM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> Add an interface for the user to notify the kernel that it is done
> reading the devmem dmabuf frags returned as cmsg. The kernel will
> drop the reference on the frags to make them available for reuse.
>
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
>
> ---
>
> v10:
> - Fix leak of tokens (Nikolay).
>
> v7:
> - Updated SO_DEVMEM_* uapi to use the next available entry (Arnd).
>
> v6:
> - Squash in locking optimizations from edumazet@google.com. With his
>   changes we lock the xarray once per sock_devmem_dontneed operation
>   rather than once per frag.
>
> Changes in v1:
> - devmemtoken -> dmabuf_token (David).
> - Use napi_pp_put_page() for refcounting (Yunsheng).
> - Fix build error with missing socket options on other asms.
>
> ---
>  arch/alpha/include/uapi/asm/socket.h  |  1 +
>  arch/mips/include/uapi/asm/socket.h   |  1 +
>  arch/parisc/include/uapi/asm/socket.h |  1 +
>  arch/sparc/include/uapi/asm/socket.h  |  1 +
>  include/uapi/asm-generic/socket.h     |  1 +
>  include/uapi/linux/uio.h              |  4 ++
>  net/core/sock.c                       | 61 +++++++++++++++++++++++++++
>  7 files changed, 70 insertions(+)
>

>
> +struct dmabuf_token {
> +       __u32 token_start;
> +       __u32 token_count;
> +};
>  /*
>   *     UIO_MAXIOV shall be at least 16 1003.1g (5.4.1.1)
>   */
> diff --git a/net/core/sock.c b/net/core/sock.c
> index 9abc4fe259535..040c66ac26244 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -124,6 +124,7 @@
>  #include <linux/netdevice.h>
>  #include <net/protocol.h>
>  #include <linux/skbuff.h>
> +#include <linux/skbuff_ref.h>
>  #include <net/net_namespace.h>
>  #include <net/request_sock.h>
>  #include <net/sock.h>
> @@ -1049,6 +1050,62 @@ static int sock_reserve_memory(struct sock *sk, in=
t bytes)
>         return 0;
>  }
>
> +#ifdef CONFIG_PAGE_POOL
> +static noinline_for_stack int
> +sock_devmem_dontneed(struct sock *sk, sockptr_t optval, unsigned int opt=
len)
> +{
> +       unsigned int num_tokens, i, j, k, netmem_num =3D 0;
> +       struct dmabuf_token *tokens;
> +       netmem_ref netmems[16];
> +       int ret =3D 0;
> +
> +       if (sk->sk_type !=3D SOCK_STREAM || sk->sk_protocol !=3D IPPROTO_=
TCP)
> +               return -EBADF;

This might use sk_is_tcp() helper.

> +
> +       if (optlen % sizeof(struct dmabuf_token) ||
> +           optlen > sizeof(*tokens) * 128)
> +               return -EINVAL;
> +
> +       tokens =3D kvmalloc_array(128, sizeof(*tokens), GFP_KERNEL);

This allocates 8192 bytes even for small optlen ?

Probably no big deal, no need to send a new version.

Reviewed-by: Eric Dumazet <edumazet@google.com>

