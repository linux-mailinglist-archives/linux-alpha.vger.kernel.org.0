Return-Path: <linux-alpha+bounces-989-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D50D196570A
	for <lists+linux-alpha@lfdr.de>; Fri, 30 Aug 2024 07:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D1B9B22643
	for <lists+linux-alpha@lfdr.de>; Fri, 30 Aug 2024 05:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B57152169;
	Fri, 30 Aug 2024 05:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mzuDB1rY"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DDB14A4C0
	for <linux-alpha@vger.kernel.org>; Fri, 30 Aug 2024 05:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724996494; cv=none; b=guXUIsz+MEH9keqsepciD7dt6j9t62NP4pekTrt6O+DRUtd/qH/mNzj+btqMEGJH4X0Pn3wlrseBREBHxb4u2EmsEyUMFBk93lDIOOFlM3rphCm562iB1XXVmv6FodRb9kqF7jAi+Kcnqca99FSz0oH0/rv75AXyPgXjYFms6Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724996494; c=relaxed/simple;
	bh=sw/z0V7t62DQd/qzCRru7G5IMJTzCRndRN+lm9ctM2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTw1SbxnhZ9r68Ju+h5fI/5H/buoGTLGzq7l3E643lDkkKpSh6SKkoHIypj9BS0RgxaNsYmiwAylQ4koQTYGKn5RArPhgggiB64jNnVh5xFGwPy6TuyF3EJPGDKHevrjr29Izv4RzmrdEa26cS6S7QNkjpfW5FI/jgU3MOkir+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mzuDB1rY; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4567fe32141so217371cf.0
        for <linux-alpha@vger.kernel.org>; Thu, 29 Aug 2024 22:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724996491; x=1725601291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGeAe2VvLt867O6PJvkuLBlyvjINITixvnm768ff9FY=;
        b=mzuDB1rYWDyPjZzvdX79WUt2S6rBiqFOtJAmdGK5qkwibD266jlpF2ukdux+pwTHrA
         igSeLo8xdS6RHMHxckeZBY5j+BECFTrueAM8NoF+fNX1bCJewdx4eLfcL3g5Sv7EFINz
         29Cy7yftlxEReyl7svsdeDc2jqhndKdN0qlPa5y35yDmdKDafvURbkhfFsFDn+/SCCuI
         yK1/578XwWSP4rBkeZBZt7q2MRBtYIrxc+y23/CMbJYRhR/z/7h6KtAuBWUqay4Q/G4/
         bFfuYvt5W8KIHEFweRFzxO9BinqJ8XTLALfFCAHLd36EMJ2I6pS0HZHyQVv79YIohtA8
         kCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724996491; x=1725601291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGeAe2VvLt867O6PJvkuLBlyvjINITixvnm768ff9FY=;
        b=qFuJ2IIA5tA2JLSNt1YSADNMbsGBSoBflHnFHIyRlpUEpiJmvqYVmtB5dqcvA0yTN/
         ReBZ2kM8kO3taSwT8AUKmqonx573c2Ms3nYih186v57KbX15LFeL4tEO0N3kzp7s2OtF
         tbagxWrDbeQyOWBk2g65ZWeiRIn5oMN9IvQFP0TK0sPkOaZCM/sMr1bOLFNFcTi3ozDr
         jBetZkLSBVWIDUzN+RnCW0ZLg1BnvTfCsbGpzzWOcoha25vF1V1T5clKXB3OtRUI1+pS
         hDCWtI6Nr/8p4gfqWxhnpwcSJ4CNcs5Rab9KM79Q0p3aoYzZfnv6d3FiXJ51u/TKqTeB
         D0Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVPA5447bE2tn4c/cFMEUGqsbcxKjp3OOIhDmvJeO/xjvWuFLe1n21mQh58p9qfWvdljyXMg9oWDBEjcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWYEgsEy9BI9ihZzkvIKHfaj7f7USVDjpT7X0xcXTuqS+Xhtau
	3XQW5g6aN2D49vWMcp1UTQv/KZS5IUN80/o04po3COGg3ulnMvNMCZEDTwvweA/2AnMpEdY0rtP
	L0t+CD0nMJTVMgXm44NPwbgyOWBjBh8TYX67w
X-Google-Smtp-Source: AGHT+IFJ5dSdgHloFb1Pn4hIJolGDXJPa0ot44BqfHuQJyxrQVYkduwL7EuLxMx9wUjPI6We8cpcbnMVMN++0hRnKxw=
X-Received: by 2002:a05:622a:1a9a:b0:453:56e7:c62b with SMTP id
 d75a77b69052e-4568a9fb7edmr1721641cf.12.1724996491072; Thu, 29 Aug 2024
 22:41:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829060126.2792671-1-almasrymina@google.com>
 <20240829060126.2792671-4-almasrymina@google.com> <20240829140824.555d016c@kernel.org>
 <e6df00ec-2c52-489e-a510-b69db7e9dbf9@linux.dev>
In-Reply-To: <e6df00ec-2c52-489e-a510-b69db7e9dbf9@linux.dev>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 29 Aug 2024 22:41:17 -0700
Message-ID: <CAHS8izOy26r0uoWdASgmBCENNS6cDjHpkp+AHhOaKVkZR1LZqQ@mail.gmail.com>
Subject: Re: [PATCH net-next v23 03/13] netdev: support binding dma-buf to netdevice
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
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
	Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 2:24=E2=80=AFPM Vadim Fedorenko
<vadim.fedorenko@linux.dev> wrote:
>
> On 29/08/2024 22:08, Jakub Kicinski wrote:
> > On Thu, 29 Aug 2024 06:01:16 +0000 Mina Almasry wrote:
> >> +    err =3D genlmsg_reply(rsp, info);
> >> +    if (err)
> >> +            goto err_unbind;
> >> +
> >>      return 0;
> >> +
> >> +err_unbind:
> >
> > rtnl_lock()
>
> There are 2 places with goto err_unbind, and one is under the lock,
> additional label (or rearrange of the last check) is needed..
>

Thank you, I think the right fix here is to reacquire rtnl_lock before
the `goto err_unbind;`, since err_unbind expects rtnl to be locked at
this point.

This could introduce a weird edge case where we drop rtnl_lock, then
find out genlmsg_reply failed, then reacquire rtnl_lock to do the
cleanup. I can't think of anything that would horribly break if we do
that, but I may be missing something. In theory we could race with a
dmabuf unbind call happening in parallel.

If we can't reacquire rtnl_lock to do the cleanup, I think I need to
revert back to doing genlmsg_reply inside of rtnl_lock, and dropping
the lock before we return from the function.

--=20
Thanks,
Mina

