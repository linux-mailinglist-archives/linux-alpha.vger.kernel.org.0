Return-Path: <linux-alpha+bounces-1102-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE83973C59
	for <lists+linux-alpha@lfdr.de>; Tue, 10 Sep 2024 17:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C02711C25709
	for <lists+linux-alpha@lfdr.de>; Tue, 10 Sep 2024 15:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A4E19E972;
	Tue, 10 Sep 2024 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GrXvSgil"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E7C19CCED
	for <linux-alpha@vger.kernel.org>; Tue, 10 Sep 2024 15:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982739; cv=none; b=U/+6qG/QVuzC++a0bsfz1B+x4cg/0/X2+lDiCdafva4j8AA3xKoEAx9arsDLo/IF+6cP+rhaffkNiXVOWHBrPMbquuYbNMkK9AwDnYQtcq2EKBC90jWnlnOR9jrmgz7n1mvnumYieCUwSm4GcnlhPfhMvJKxnHRob9OtTsRg6aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982739; c=relaxed/simple;
	bh=oCjdkvGBXYk951UuNZ8GUxFDU3TLEafF/eKU6VJhJjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOcZMJpFC+HCbxCbEVCLLd2XFuBHaIXRh862abWTZhYix06Phg4KQ/MiCN/BDw+lVNBgP9/zAU+ub5gKNaKWaB/gK75krbn3I3RnYlLwqbJbgBowO1mIBV+1LLx1ZhXx7BTPRHEpNV4QmcXLoEbdruCcC08rzoonV5YxtT1gSKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GrXvSgil; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4582fa01090so300241cf.0
        for <linux-alpha@vger.kernel.org>; Tue, 10 Sep 2024 08:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725982736; x=1726587536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gszVQrHTml2s4rQX/N3KISfWtIKCjIZkEmtrFN+rLM=;
        b=GrXvSgilpWPDTzYZ9WABiQnJcvcxeBR4bm9wsuD4lVoyCFmn4tA8tyIqlbn3NDhtnn
         Fb+3yNQxZ9V5xDPLtYREJm0lw4h7K0Rb6SyRAXHhMNvDEZP2U1aSz2X28F6hzxZbfqHv
         icxm2c7yOJTBZ72I32Oc7hKkV6kVfNgUmgjNa94lEo1R0sGHmyrsGpCQdgbWdcirjeAB
         Psog1zEKxDmlyl1nf/Qmx7p5/lT15i6QKlnbX6Yk0Y4u1y0vmH5c60tEwsY3GV/f5e16
         AV+0L13zNQiReNL+oSFisUKmIYwvYFa4DTs73zRv2+f3St49KEhoPnaEMo1FVb0vovyC
         nAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725982736; x=1726587536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gszVQrHTml2s4rQX/N3KISfWtIKCjIZkEmtrFN+rLM=;
        b=FRd+iCkzlFoelm2RpWcQKdSDkphlW3jCF/FAd+MzXlZBib9BHXhxCtLVOgQlkzDqpi
         HYF5dxDeIV+qbvf8cjXp6mH1zqk+XjkTi9f/7ji/rotNWnCxqfY9OQqGMT1uhjZz4uiT
         BO6rsKYXvh4nynDlIqnA6StiECo+49003v2cwoJEnE1IE6PYqQACE/8LK6MNQD+41HJN
         rRH3KfBYck5Naebksy21QEROb7zLtBVsDVU/AJ2vmzl9GOfiO+UORuSH8LRdkKZr1D10
         yS/uoN/Rc9HqOcdnfosg8Hdep9544FxCaNS7RxR3lseh1MEC7AFkwfuDnqXz9JG/CKeN
         lc5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9uqC4c8bH0Ddxte/Et2W1ZDz5gCX/fCEY2clk4+VjPFw5O5hLU0TNSm6PX7XFgiyrTV7zR/yyXkImqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb69DFyPEMzop5GN2o+JJMMQqNHBVR4EO9GVqiT09yzHumz5bc
	HomXg9Kg6oK2npKiIhrRIvKwq2j7K1YlAo71RAkOe6P5Qc6zz10+c+mWq0Zh2BbZQiEFoVoS9Py
	9VQlKMum+DvsAIPjwxyDAfu1KDcxk1qg+07AE
X-Google-Smtp-Source: AGHT+IEK6weRhBb+6I+yqObyHVaZqmcs2wOCh/JwTg5EmvszzOI8s/itZSBxrrNFolb48wNjfmGjViIMiDzaN91ZR8I=
X-Received: by 2002:a05:622a:13ca:b0:447:e0e1:2a7b with SMTP id
 d75a77b69052e-4583f0063b0mr2792721cf.23.1725982736186; Tue, 10 Sep 2024
 08:38:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909054318.1809580-1-almasrymina@google.com> <20240910080237.2372cfa6@kernel.org>
In-Reply-To: <20240910080237.2372cfa6@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 10 Sep 2024 08:38:42 -0700
Message-ID: <CAHS8izP4EO3t=7-n2Ok5pgKe+JjJV+T3EH1PaTW=YU234kEpGw@mail.gmail.com>
Subject: Re: [PATCH net-next v25 00/13] Device Memory TCP
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
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
	Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 8:02=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon,  9 Sep 2024 05:43:05 +0000 Mina Almasry wrote:
> > Device memory TCP (devmem TCP) is a proposal for transferring data to a=
nd/or
> > from device memory efficiently, without bouncing the data to a host mem=
ory
> > buffer.
>
> Mina, if you'd like to see this in v6.12 -- please fix the nits and
> repost ASAP.

Running my presubmits now and will repost in the next 2 hours or so.

--
Thanks,
Mina

