Return-Path: <linux-alpha+bounces-662-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ED091AFF1
	for <lists+linux-alpha@lfdr.de>; Thu, 27 Jun 2024 21:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F2BC1F24190
	for <lists+linux-alpha@lfdr.de>; Thu, 27 Jun 2024 19:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E3619DF40;
	Thu, 27 Jun 2024 19:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pKZGc8sT"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A577D33C9
	for <linux-alpha@vger.kernel.org>; Thu, 27 Jun 2024 19:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719518158; cv=none; b=bIc8T+q6131kbTmjrgsF9/pCwb4btXXvRAZIUsAiK/cfXGBKbKDu3yf3qf5CRQJFr7vaXSs3DQugd8RfPboMWWlfo9b9PaT+fHK6vahfA8qgfC8+SWAnyYmutU5xHFRi7IBnQV7iq4R0aZklA3IC05Dp/Pb+twoxHUs9Tx3bf7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719518158; c=relaxed/simple;
	bh=36GxoZjliAZT52Uum3hkhku+z1zWUxDL4YWuJDbCmCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MnoGMlATuxoi51E501IujEXhauAlYBoTlgQPRdkExtN5GSnN44onaW84inK8AFzylXMENujfEnvfzcVjBjq2DkOFd97qRHyhOSkCIGKTBT2y8sBoeWjNKMDxc0h2LjZJKKCMLe86Jl6QRQu1Xh2dYVDKI7+mXikuq7Wg00O5X3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pKZGc8sT; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52cdea1387eso6106402e87.0
        for <linux-alpha@vger.kernel.org>; Thu, 27 Jun 2024 12:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719518153; x=1720122953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwbPl7/RVFpU7jHcXTQEjahrmwW8PQdQrA+IV3FhN4w=;
        b=pKZGc8sTJiPK8evW+kyTJom27vWLLcaatgTP+pqNNLik3mw1pmxqfY8BC6C2Oa9+oI
         o0sCCeMv+WZal6hDaWgzmHoncPuHmkHoAWo/Ck/6FuDrAQdLlfhkR9KmZsxGc443vkjr
         5ujWzSTQNw9wjOOwbnW3XPU61Dca2ugh48ywLYRU+VcRpd7i3tp/cfEjewfSyXRILNvv
         sJgKRnx3yzI5aWIHj3tc6qE6MNwWNocuDjwigxiw7d7HiOc30Xdd29sJqDUtaTNLWPyr
         RN1F5aOe5ICn2RmnfOTaJ1d72Wl+yAJWGgOJhh7wOYjxwW+dPqi2218Mw9ed924jYzNQ
         0M7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719518153; x=1720122953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwbPl7/RVFpU7jHcXTQEjahrmwW8PQdQrA+IV3FhN4w=;
        b=gDolDVbLVwQgpTXSw5bSbEqsDZqDPoxUcLqB1jt+46NZYcT5QnL5NBRxaHeYRpksSz
         /iHHVpePJjqKRqp5zjQajO1iKb1kLBqK9toEZWz3l0pb01PeWcOU0C7wLiHdODOD3oWw
         YVB3vh4Xo1uSK3USOICp6dk1jZtnkM0xjsdD3X9OXFRUD3p7pUGIZkdBUTr5KSULR0tM
         9SWdQlIJxKskSMCH6i6/qFdFX80xQDpeThgOZen3ipkwJ1Y2VjkGFsHgJ/CegZweGPFa
         HHNulFoEVP06fCKVkxdOZ2yoW70SDCWYOF+9J2tmTA0JWNAv3d1ruUIXGgMGlBqWPtzt
         PvqA==
X-Forwarded-Encrypted: i=1; AJvYcCVd/RJ7ODE/WyzV+gLr3w7JZXSvXEZ262QcqNk8dYs4Y6DXx+omvGmuaGG3m7+wb+N2fSlPmRXTRkVZbjoD7o/KIqRrqxhWVzp78FA=
X-Gm-Message-State: AOJu0YxAa79SdaPvspIQTwzFl/GgA61JjaCfRkVp5g1fLimFcLE1j0X2
	L5CY34ovJ8z7b/jokuCMT0FiUTvNsMOgODTyQn32OZda/fDs+JZsX2pwkTDkYEMLj+s4hAkeU5O
	7ZXNQH6aywI/+6NeGkuy038i4k6EaXCCnIrdN
X-Google-Smtp-Source: AGHT+IHrIkqcjhj0KSGiy7gblVxOce/ysoGeptTitOpdzuEly5ueVJ0/ZUmc2dX4a/lyh+Q8t0Uj2uTJuS+Tj9wzWDM=
X-Received: by 2002:a05:6512:2004:b0:516:d692:5e0b with SMTP id
 2adb3069b0e04-52ce185f9d6mr8027892e87.54.1719518152535; Thu, 27 Jun 2024
 12:55:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625195407.1922912-1-almasrymina@google.com>
 <20240625195407.1922912-14-almasrymina@google.com> <20240626150822.742eaf6a@kernel.org>
 <20240626174634.2adec19d@kernel.org>
In-Reply-To: <20240626174634.2adec19d@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 27 Jun 2024 12:55:38 -0700
Message-ID: <CAHS8izOd_yYNJ6+xv35XoCvF7MzqachPVrkQJbic8-h=T1Vg_A@mail.gmail.com>
Subject: Re: [PATCH net-next v14 13/13] selftests: add ncdevmem, netcat for
 devmem TCP
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
	Praveen Kaligineedi <pkaligineedi@google.com>, Stanislav Fomichev <sdf@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 5:46=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 26 Jun 2024 15:08:22 -0700 Jakub Kicinski wrote:
> > On Tue, 25 Jun 2024 19:54:01 +0000 Mina Almasry wrote:
> > > +CFLAGS +=3D -I../../../net/ynl/generated/
> > > +CFLAGS +=3D -I../../../net/ynl/lib/
> > > +
> > > +LDLIBS +=3D ../../../net/ynl/lib/ynl.a ../../../net/ynl/generated/pr=
otos.a
> >
> > Not as easy as this.. Please add this commit to your series:
> > https://github.com/kuba-moo/linux/commit/c130e8cc7208be544ec4f6f3627f1d=
36875d8c47
> >
> > And here's an example of how you then use ynl.mk to code gen and build
> > for desired families (note the ordering of variables vs includes,
> > I remember that part was quite inflexible..):
> > https://github.com/kuba-moo/linux/commit/5d357f97ccd0248ca6136c5e11ca3e=
adf5091bb3
>
> Investigating this further my patches will not work for O=3Dxyz builds
> either. Please squash this into the relevant changes:
>

Thanks! I cherry-picked commit 15dbefa97fb98 ("tools: net: package
libynl for use in selftests"), and then applied the diff below to the
series [1].

Now:

`git clean -fdx && make  headers_install && make -C
./tools/testing/selftests/net` works

`git clean -fdx && make  headers_install && make -C
./tools/testing/selftests/net ncdevmem` doesn't work with this error:

make: Entering directory
'/usr/local/google/home/almasrymina/cos-kernel/tools/testing/selftests/net'
gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/
-isystem /usr/local/google/home/almasrymina/cos-kernel/tools/testing/selfte=
sts/../../../usr/include
-I../     ncdevmem.c  -lmnl -o ncdevmem
ncdevmem.c:34:10: fatal error: netdev-user.h: No such file or directory
   34 | #include "netdev-user.h"
      |          ^~~~~~~~~~~~~~~
compilation terminated.
make: *** [<builtin>: ncdevmem] Error 1

It seems specifying the target doesn't trigger the libynl.a to be
built. Isn't this a bug, or is that expected? I took a bit of a look
into it but couldn't figure it out immediately. If it is a bug, any
pointers would be appreciated (but I'm digging into it anyway).

[1] The diff on top of the series-with-cherry-pick that I'm testing with:

diff --git a/tools/testing/selftests/net/Makefile
b/tools/testing/selftests/net/Makefile
index 7ba1505dc2eb4..1d3b99e9c12e8 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -5,10 +5,6 @@ CFLAGS +=3D  -Wall -Wl,--no-as-needed -O2 -g
 CFLAGS +=3D -I../../../../usr/include/ $(KHDR_INCLUDES)
 # Additional include paths needed by kselftest.h
 CFLAGS +=3D -I../
-CFLAGS +=3D -I../../../net/ynl/generated/
-CFLAGS +=3D -I../../../net/ynl/lib/
-
-LDLIBS +=3D ../../../net/ynl/lib/ynl.a ../../../net/ynl/generated/protos.a

 LDLIBS +=3D -lmnl

@@ -100,7 +96,11 @@ TEST_PROGS +=3D fdb_flush.sh
 TEST_PROGS +=3D fq_band_pktlimit.sh
 TEST_PROGS +=3D vlan_hw_filter.sh
 TEST_PROGS +=3D bpf_offload.py
-TEST_GEN_FILES +=3D ncdevmem
+
+# YNL files, must be before "include ..lib.mk"
+EXTRA_CLEAN +=3D $(OUTPUT)/libynl.a
+YNL_GEN_FILES :=3D ncdevmem
+TEST_GEN_FILES +=3D $(YNL_GEN_FILES)

 TEST_FILES :=3D settings
 TEST_FILES +=3D in_netns.sh lib.sh net_helper.sh setup_loopback.sh setup_v=
eth.sh
@@ -111,6 +111,10 @@ TEST_INCLUDES :=3D forwarding/lib.sh

 include ../lib.mk

+# YNL build
+YNL_GENS :=3D netdev
+include ynl.mk
+
 $(OUTPUT)/epoll_busy_poll: LDLIBS +=3D -lcap
 $(OUTPUT)/reuseport_bpf_numa: LDLIBS +=3D -lnuma
 $(OUTPUT)/tcp_mmap: LDLIBS +=3D -lpthread -lcrypto
diff --git a/tools/testing/selftests/net/ynl.mk
b/tools/testing/selftests/net/ynl.mk
index 0e01ad12b30ec..59cb26cf3f738 100644
--- a/tools/testing/selftests/net/ynl.mk
+++ b/tools/testing/selftests/net/ynl.mk
@@ -18,6 +18,4 @@ $(YNL_OUTPUTS): CFLAGS +=3D \

 $(OUTPUT)/libynl.a:
        $(Q)$(MAKE) -C $(top_srcdir)/tools/net/ynl GENS=3D"$(YNL_GENS)" lib=
ynl.a
-       $(Q)cp $(top_srcdir)/tools/net/ynl/libynl.a ./
-
-EXTRA_CLEAN +=3D libynl.a
+       $(Q)cp $(top_srcdir)/tools/net/ynl/libynl.a $(OUTPUT)/libynl.a





--=20
Thanks,
Mina

