Return-Path: <linux-alpha+bounces-1090-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4200971FA1
	for <lists+linux-alpha@lfdr.de>; Mon,  9 Sep 2024 18:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D9582821E6
	for <lists+linux-alpha@lfdr.de>; Mon,  9 Sep 2024 16:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125C816D9AE;
	Mon,  9 Sep 2024 16:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QmGG9vc0"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AF216DC12
	for <linux-alpha@vger.kernel.org>; Mon,  9 Sep 2024 16:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725900873; cv=none; b=GjikRdciSUb/KSZwOokD12slEWhgyc2jHdnOA+wqbSqs/banh+oQCeHCX9c3KFsU7F0LuaUfdK2CCZgMkw4VKoexh7u845t/XjCbvtJTOlibktEdmFEaeZT76oJOUkmBBlQUBofM/Z40H2JCvSjFFOn71dPdtafH4tIRlOioLYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725900873; c=relaxed/simple;
	bh=6Q+C9ogz7U8bywbJQGcpiixXLogu0mto8kJ/rFDq1hM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WffoepbwHP8BBbcaBtmYs+L8YaU2B3r/lRnS/QREPdKyulYfF7dQnsoRdCqTKwYEWgr/vDXKePo9w4CO9iqMVK8E2fTnwFBBEXb0hICnr1+bUqRWTX7gzG90evcszPptVGkwu0yt4msoHGjHYNDWBbG/E1BiIgXzv6dnEUIBx8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QmGG9vc0; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4582fa01090so6371cf.0
        for <linux-alpha@vger.kernel.org>; Mon, 09 Sep 2024 09:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725900870; x=1726505670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Q+C9ogz7U8bywbJQGcpiixXLogu0mto8kJ/rFDq1hM=;
        b=QmGG9vc0nhkLy0w0zYwEd7A5RFfoCjhO6KVGF74iZBUTYnCq89BJaSnYQI/7BesZNZ
         h4EeT/jSr43u25UIRt1bstO8ypcwTN54tVuGa1E5vpxEfGK5j2nRZs/kULnGbef81vtc
         s7Tl0t5+0byiG9xhgjJPfjIUYfbli7wTWWg8VV43bCNI1/2gZqUHvrjntcmLJ7dCKmnp
         hTZpiDkReDheZhrifHBblwvClX2bD+dHbg4M5LiikipoGAKdgI0nabigwiKE28uiD6dx
         mTZy2gtSKFlxAo+0AXR+dTdX8euM1Cn2Na8if/623tpFaGFo1dSxdezHAg34D5d4LuRw
         H8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725900870; x=1726505670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Q+C9ogz7U8bywbJQGcpiixXLogu0mto8kJ/rFDq1hM=;
        b=eQnNKN3y3YoggdoDivt8dlh6TEzTgBTSee5DcwxXAtV/LCRQ5SeYnhYIqv9rixAnOE
         m0HPGCbeVhbWYyAEzuTz3O8fmoxi7E1YO1REyB616Gc31jMf87K9VC2tKnjvRnWg6EW9
         h07+umsvBwVy3MQ/7Z0uP9FHXKx53yIVA6UBNP4xWUZXLU3XmyQmMfYH47/MRDU4C+dm
         btUQ4CjCjQ+VN+nCr5Mr7dPy9kDsNyo3Iu2JtCpR2xqAoqZLi3U/KTOAhKqZhYvPZ99U
         jWAsRNx2gLFl9hA3PYzSUHNgPVXkrCOyFZV7jyoi/njrMyj/yXsJqEj+bzY0CHAw6hc7
         KdKw==
X-Forwarded-Encrypted: i=1; AJvYcCXNV0J0enrB3Udg+2A+YvIWee+ngrjMcqrAybFMWVYLPqmUi6lhbqckNP30I9hL6Zo0v12c19rRMVCGrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaQVtCWTt8oJ27WcZ0/crWsoyn4MPepTT04YY+I98EOC2RS1cn
	/N71+wFMLmN40i1laS/2vuPgq3cJDQ4fxV0lHRpcVb1cP5IcTPNmJUxN/Sf8IbtR2tHOlboDRtU
	xxdMeDX0f/p5J/zp55rcHd+k3tLXbwUcV2114
X-Google-Smtp-Source: AGHT+IH5CAMa7jyagoL/SPMKxnbKYwRciBwcTHNa9+5fhr4aw1DzDFUIylCWU3J1Sf54qZeykPAuKVr/EjpKtXIeTYU=
X-Received: by 2002:ac8:7f0f:0:b0:456:7501:7c4d with SMTP id
 d75a77b69052e-458214943fbmr5401741cf.9.1725900869141; Mon, 09 Sep 2024
 09:54:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909054318.1809580-1-almasrymina@google.com> <42c202e6-8c4c-494f-8c28-17d66ed75880@huawei.com>
In-Reply-To: <42c202e6-8c4c-494f-8c28-17d66ed75880@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 9 Sep 2024 09:54:16 -0700
Message-ID: <CAHS8izMX+9F1NngbPx6w7ikKR9TgPvm+jMwZ8168NJYhFC7sVQ@mail.gmail.com>
Subject: Re: [PATCH net-next v25 00/13] Device Memory TCP
To: Yunsheng Lin <linyunsheng@huawei.com>
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
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 4:21=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.com=
> wrote:
>
> On 2024/9/9 13:43, Mina Almasry wrote:
>
> >
> > Perf - page-pool benchmark:
> > ---------------------------
> >
> > bench_page_pool_simple.ko tests with and without these changes:
> > https://pastebin.com/raw/ncHDwAbn
> >
> > AFAIK the number that really matters in the perf tests is the
> > 'tasklet_page_pool01_fast_path Per elem'. This one measures at about 8
> > cycles without the changes but there is some 1 cycle noise in some
> > results.
> >
> > With the patches this regresses to 9 cycles with the changes but there
> > is 1 cycle noise occasionally running this test repeatedly.
> >
> > Lastly I tried disable the static_branch_unlikely() in
> > netmem_is_net_iov() check. To my surprise disabling the
> > static_branch_unlikely() check reduces the fast path back to 8 cycles,
> > but the 1 cycle noise remains.
>
> Sorry for the late report, as I was adding a testing page_pool ko basing
> on [1] to avoid introducing performance regression when fixing the bug in
> [2].
> I used it to test the performance impact of devmem patchset for page_pool
> too, it seems there might be some noticable performance impact quite stab=
ly
> for the below testcases, about 5%~16% performance degradation as below in
> the arm64 system:
>

Correct me if I'm wrong here, but on the surface here it seems that
you're re-reporting a known issue. Consensus seems to be that it's a
non-issue.

In v6 I reported that the bench_page_pool_simple.ko test reports a 1
cycle regression with these patches, from 8->9 cycles. That is roughly
consistent with the 5-15% you're reporting.

I root caused the reason for the regression to be the
netmem_is_net_iov() check in the fast path. I removed this regression
in v7 (see the change log) by conditionally compiling the check in
that function.

In v8, Pavel/Jens/David pushed back on the ifdef check. See this
entire thread, but in particular this response from Jens:

https://lore.kernel.org/lkml/11f52113-7b67-4b45-ba1d-29b070050cec@kernel.dk=
/

Seems consensus that it's 'not really worth it in this scenario'.

--=20
Thanks,
Mina

