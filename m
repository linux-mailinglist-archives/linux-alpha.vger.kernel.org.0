Return-Path: <linux-alpha+bounces-759-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 346CD9404CC
	for <lists+linux-alpha@lfdr.de>; Tue, 30 Jul 2024 04:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5818C1C20D79
	for <lists+linux-alpha@lfdr.de>; Tue, 30 Jul 2024 02:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F02E16A95A;
	Tue, 30 Jul 2024 02:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TAcAkG5M"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1645150980
	for <linux-alpha@vger.kernel.org>; Tue, 30 Jul 2024 02:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722306404; cv=none; b=eqTSJxWtjMepoZeVsRu0OP4LHjOmjYl+vRyxMtzsi2Szm1YJCKV8uOCaTsscNXcROsZo0TiSQ28n4IdXgxz9T019Vc6qhHsIzyvsZD+WpiZ40SOaUaeeez3mPlEzxlsUpjdvW1lKoeRBZDMjXjqkrszZU+eHsVjbSQwQphAn7dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722306404; c=relaxed/simple;
	bh=dNmQtYy68N/SLiUBNq045aQrib8pOh18k72EvrDuAAE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J1SpL8XttJTcgVU6tPAWkRDOGP6KwkcSF4qCQSMF9yw/uFt8Km6fFeGr2HTivtpJw/NRQDSUVrNOwbL3uvdDe44vg4gBkpQj58d+AhyULjE9pxAtsFbZF3RjnEbauSu3lXA8Zbxm369nUn+W3ZuI8eRLOeKHEUIqqcA4BForRiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TAcAkG5M; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1fc5f04f356so26879235ad.1
        for <linux-alpha@vger.kernel.org>; Mon, 29 Jul 2024 19:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722306397; x=1722911197; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8cpgk7A1Ci0fLZZgBR1RDLKJO/LQnlu3QBndF/2loSU=;
        b=TAcAkG5Mn7Twf2Fv5G0iXo5JzEEbl7akVcbftdXwLTvkEgDoGcLP5hl0ComRENaINK
         o3V4RvuFsQ4STu5yzfB8uoQhzUEZOQKr2NpGASL/5md181+2a1Q6g3eo9YRiFzv7Rp1l
         xoXyoMP+d4io2AYVuQ1oNMjuRqgVCK+z/SpFUs7eyYkr7+L5v6bd1TP6PLap/q+66kvg
         EwL4AIxy4BVYQjQ5EO0v/2ybA5cIJcJqXmks3pptO9sDmh6gsjuNtGrVE9v356m32RPT
         +xz8vSrXIYcemR6v0Wr8/+ZMmwIoyiN3yPyD6R5jQiuYbuC0AxtablzQaKrqzlZy2s64
         BlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722306397; x=1722911197;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8cpgk7A1Ci0fLZZgBR1RDLKJO/LQnlu3QBndF/2loSU=;
        b=PwgSkkjOpKLxsz+ib2MrrryQ9rQQklACL1ANLeDrnvjTSU8D1F0MwwD6iN0fd5Knvv
         wmD3KiwHHFJMarlzM1xG0b0iDWfC7Kuy0KBTCoU9nPT6LI8zV00hsk3DLoW5MZYXtvWS
         yfNJvYSfHFONSJmVjvlTRurymb5wMAUqOsWAN+VbcISoIWXdjIof9NoTwY6nUWTXA/AP
         THs9Woiw/MtFrau24LCPaWaoM2Sg6Du1VnOb9yitERbgahzzBJ2Dfh15Nbue0eYuz/Qk
         2V6vBTS+03ibZiIyxF52CInR4SIE3gl4KoH1qP+FB5yP8jBhpA1rqEDmGdLFOrcxLoGK
         4hMA==
X-Forwarded-Encrypted: i=1; AJvYcCU2MX9sZBR6l5U57tgLcMKnN1IFa0aLyG5FVg3b+B5SjBtreNJ1mJpoFiLpYGk2Ww/R6kRRS//w5V+WncTeK1u4oXRaxZbsL6BwJ+Q=
X-Gm-Message-State: AOJu0YzVdOrXf6QMrM7/H0ydH7s6+joHLI9LDZGXojVzXtWumtmhcuIV
	P3TXVudibwe+O4XmjR1vxdW5wSa0MJTZvuy9+gEAeYGZYJCkXkk/PWKNRtdtfyFx4HUK0o6qGGM
	Ws9idxhBPKqk1i7CHc+u/0A==
X-Google-Smtp-Source: AGHT+IFUJSMorXRhdXYvyK6tSmZn4zMz3HIyw1VyM+jL6c8F5EfQ4VozIOl2s1shRCqIeczmwAPxygQeJAkoT8ZZyA==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a17:903:1d2:b0:1fa:fc15:c513 with SMTP
 id d9443c01a7336-1ff04872d65mr4166475ad.9.1722306396807; Mon, 29 Jul 2024
 19:26:36 -0700 (PDT)
Date: Tue, 30 Jul 2024 02:26:08 +0000
In-Reply-To: <20240730022623.98909-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240730022623.98909-1-almasrymina@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240730022623.98909-5-almasrymina@google.com>
Subject: [PATCH net-next v17 04/14] netdev: netdevice devmem allocator
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"

Implement netdev devmem allocator. The allocator takes a given struct
netdev_dmabuf_binding as input and allocates net_iov from that
binding.

The allocation simply delegates to the binding's genpool for the
allocation logic and wraps the returned memory region in a net_iov
struct.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

---

v17:
- Don't acquire a binding ref for every allocation (Jakub).

v11:
- Fix extraneous inline directive (Paolo)

v8:
- Rename netdev_dmabuf_binding -> net_devmem_dmabuf_binding to avoid
  patch-by-patch build error.
- Move niov->pp_magic/pp/pp_ref_counter usage to later patch to avoid
  patch-by-patch build error.

v7:
- netdev_ -> net_devmem_* naming (Yunsheng).

v6:
- Add comment on net_iov_dma_addr to explain why we don't use
  niov->dma_addr (Pavel)
- Refactor new functions into net/core/devmem.c (Pavel)

v1:
- Rename devmem -> dmabuf (David).

---
 include/net/devmem.h | 13 +++++++++++++
 include/net/netmem.h | 18 ++++++++++++++++++
 net/core/devmem.c    | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/include/net/devmem.h b/include/net/devmem.h
index c7bd6a0a6b9e9..2e7cc46d4d3ca 100644
--- a/include/net/devmem.h
+++ b/include/net/devmem.h
@@ -69,7 +69,20 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding);
 int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 				    struct net_devmem_dmabuf_binding *binding);
 void dev_dmabuf_uninstall(struct net_device *dev);
+struct net_iov *
+net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding);
+void net_devmem_free_dmabuf(struct net_iov *ppiov);
 #else
+static inline struct net_iov *
+net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
+{
+	return NULL;
+}
+
+static inline void net_devmem_free_dmabuf(struct net_iov *ppiov)
+{
+}
+
 static inline void
 __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
 {
diff --git a/include/net/netmem.h b/include/net/netmem.h
index 41e96c2f94b5c..664df8325ece5 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -14,8 +14,26 @@
 
 struct net_iov {
 	struct dmabuf_genpool_chunk_owner *owner;
+	unsigned long dma_addr;
 };
 
+static inline struct dmabuf_genpool_chunk_owner *
+net_iov_owner(const struct net_iov *niov)
+{
+	return niov->owner;
+}
+
+static inline unsigned int net_iov_idx(const struct net_iov *niov)
+{
+	return niov - net_iov_owner(niov)->niovs;
+}
+
+static inline struct net_devmem_dmabuf_binding *
+net_iov_binding(const struct net_iov *niov)
+{
+	return net_iov_owner(niov)->binding;
+}
+
 /* netmem */
 
 /**
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 9a357235bde8f..3f73d0bda023f 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -32,6 +32,14 @@ static void net_devmem_dmabuf_free_chunk_owner(struct gen_pool *genpool,
 	kfree(owner);
 }
 
+static dma_addr_t net_devmem_get_dma_addr(const struct net_iov *niov)
+{
+	struct dmabuf_genpool_chunk_owner *owner = net_iov_owner(niov);
+
+	return owner->base_dma_addr +
+	       ((dma_addr_t)net_iov_idx(niov) << PAGE_SHIFT);
+}
+
 void __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
 {
 	size_t size, avail;
@@ -54,6 +62,38 @@ void __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
 	kfree(binding);
 }
 
+struct net_iov *
+net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
+{
+	struct dmabuf_genpool_chunk_owner *owner;
+	unsigned long dma_addr;
+	struct net_iov *niov;
+	ssize_t offset;
+	ssize_t index;
+
+	dma_addr = gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,
+					(void **)&owner);
+	if (!dma_addr)
+		return NULL;
+
+	offset = dma_addr - owner->base_dma_addr;
+	index = offset / PAGE_SIZE;
+	niov = &owner->niovs[index];
+
+	niov->dma_addr = 0;
+
+	return niov;
+}
+
+void net_devmem_free_dmabuf(struct net_iov *niov)
+{
+	struct net_devmem_dmabuf_binding *binding = net_iov_binding(niov);
+	unsigned long dma_addr = net_devmem_get_dma_addr(niov);
+
+	if (gen_pool_has_addr(binding->chunk_pool, dma_addr, PAGE_SIZE))
+		gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
+}
+
 /* Protected by rtnl_lock() */
 static DEFINE_XARRAY_FLAGS(net_devmem_dmabuf_bindings, XA_FLAGS_ALLOC1);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


