Return-Path: <linux-alpha+bounces-202-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9E68712FA
	for <lists+linux-alpha@lfdr.de>; Tue,  5 Mar 2024 03:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82F491C214CC
	for <lists+linux-alpha@lfdr.de>; Tue,  5 Mar 2024 02:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58DC7EEF2;
	Tue,  5 Mar 2024 02:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WjOW3BcU"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D5218026
	for <linux-alpha@vger.kernel.org>; Tue,  5 Mar 2024 02:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709604143; cv=none; b=c103NozcTb7fvvLesrlsgfllRasdpgVjb2Tr83yuq74j1gcK8Dk1WIBpSiNXeDItJVCXhAs6nrbq16w8L/9DQ3dqUdbMbZ17+iuoLoY98YMsx1F3UVEOCqXB48n48oKDZY6/+Vy6PsRzTcHaGbiKvGIOAHG2sdViFMKfMb7OMu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709604143; c=relaxed/simple;
	bh=SXdErJW9D1+sDqaFuvCj2Z+RaR4qEPO6VOZw+7zfEtk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Mc/OdWSwblDsvRljIclcRXiFWeggc8+zM2zYaeKhHz/H6I6fjfp7vvGQ3vRYejjisxMe280nDlxWYEeVBakK324D+2blBOfVngiuNPDmg+FjhkP0DMI3+LYHkfbl26YAZqvHplr3R5f2n0G2kMRzwlrCHEXVtp8tWPCYO0qrYqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WjOW3BcU; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6096493f3d3so67534177b3.2
        for <linux-alpha@vger.kernel.org>; Mon, 04 Mar 2024 18:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709604135; x=1710208935; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nkxfr4SlhZWFnLcECmyyXlGB4ia5zuSiqg3Ceq5Q54U=;
        b=WjOW3BcUAQ8Ip7boTMf1Avl/HaLkdGAKrRO0a1jnoE5Li9jt4iRVdNVoRXrwSkJBY9
         wwH9mAkx11P6qiazuOaCiUic/WJTBOopZxaMvchU57o/DVTsNvXJcb6o8zT+hd0SjPY8
         F0pbWS1r6IrzkJvF9McRqBU2M/yaSP1cJS/CEpVs4pokTUFGemkEwMih7cDmJZJrrbRp
         P9i86AH+ksG+WLUuZvKfQcDo1fnFMDnZZnpERr8lXJFbyMTVry8EANXHyB08/5/1+gRq
         9XRjg542NYnFgVrhSoAgoEmqubpQB2OA8+BpqCQqEIORdOyS3ptI2H2b8j6YwjUMxP+A
         37kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709604135; x=1710208935;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nkxfr4SlhZWFnLcECmyyXlGB4ia5zuSiqg3Ceq5Q54U=;
        b=UhVUntpYgzrjAb+EPmGeH6seibC9Akmv8tq0w5CchqbsRF+4NKPW7oYKGk0NfooVe8
         GjDAKm28ROqeuINzkJE9lq0fusti18fUskQqbLKwjzxbH6Fk3X9at145tBgoiTcu9krr
         l8EDQcYH5AMkXoMfKiCNWiRwZQh+GzHSabQsYkK+VWX3QnOI4nRDnMOhaCCfT85Nzwut
         wrClLO1Eoe8u9s63ay3k5Thz4kaza4zON2U0dW4vySfnTQLK15LvFfPrWUkfICVDJDS5
         V8+jgWjp4wykn2h6sg/7Yi0IuEhnd45MeKB+hpOfLG9PqcevhUTIV4gLIUKF95rrAJjV
         3EjA==
X-Forwarded-Encrypted: i=1; AJvYcCVjTjYv0oJv4+kum48pK7eB2JBx9bl18ThmexF/qX442TRsBPwqq48PmTIpJ15wwN2lwzw9mwKHHxl3E79gTtk2LnR8CtFi3FMhLlA=
X-Gm-Message-State: AOJu0YzS1ykeyFFMGcmdepPlrLB7LvJ/0Adt30o2X1KrYKg3I9PxHRvU
	j5NtJZqb1FVeTfcJfDUozVKw1ZodQglGcMu2pni+SpJoF02MiixcJhhRUj3j1a4xQgwnb2IqmaO
	5zikOV1e42pqWrAeS3hiz2w==
X-Google-Smtp-Source: AGHT+IHs2VM10a+LkmC7DxyIc41RzFXOh9p7dahDMBbjSpPF6selHUVHzoLN835wz46TCqbj+LGLXlk566uG17XhnQ==
X-Received: from almasrymina.svl.corp.google.com ([2620:15c:2c4:200:b614:914c:63cd:3830])
 (user=almasrymina job=sendgmr) by 2002:a81:9b97:0:b0:609:3c53:d489 with SMTP
 id s145-20020a819b97000000b006093c53d489mr2258866ywg.3.1709604134747; Mon, 04
 Mar 2024 18:02:14 -0800 (PST)
Date: Mon,  4 Mar 2024 18:01:43 -0800
In-Reply-To: <20240305020153.2787423-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240305020153.2787423-9-almasrymina@google.com>
Subject: [RFC PATCH net-next v6 08/15] page_pool: devmem support
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
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
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"

Convert netmem to be a union of struct page and struct netmem. Overload
the LSB of struct netmem* to indicate that it's a net_iov, otherwise
it's a page.

Currently these entries in struct page are rented by the page_pool and
used exclusively by the net stack:

struct {
	unsigned long pp_magic;
	struct page_pool *pp;
	unsigned long _pp_mapping_pad;
	unsigned long dma_addr;
	atomic_long_t pp_ref_count;
};

Mirror these (and only these) entries into struct net_iov and implement
netmem helpers that can access these common fields regardless of
whether the underlying type is page or net_iov.

Implement checks for net_iov in netmem helpers which delegate to mm
APIs, to ensure net_iov are never passed to the mm stack.

Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v6:
- Rebased on top of the merged netmem_ref type.
- Rebased on top of the merged skb_pp_frag_ref() changes.

v5:
- Use netmem instead of page* with LSB set.
- Use pp_ref_count for refcounting net_iov.
- Removed many of the custom checks for netmem.

v1:
- Disable fragmentation support for iov properly.
- fix napi_pp_put_page() path (Yunsheng).
- Use pp_frag_count for devmem refcounting.

---
 include/net/netmem.h            | 142 ++++++++++++++++++++++++++++++--
 include/net/page_pool/helpers.h |  25 +++---
 include/net/page_pool/types.h   |   1 +
 net/core/page_pool.c            |  26 +++---
 net/core/skbuff.c               |  23 +++---
 5 files changed, 171 insertions(+), 46 deletions(-)

diff --git a/include/net/netmem.h b/include/net/netmem.h
index 21f53b29e5fe..8699788d587d 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -9,14 +9,51 @@
 #define _NET_NETMEM_H
 
 #include <net/devmem.h>
+#include <net/net_debug.h>
 
 /* net_iov */
 
+DECLARE_STATIC_KEY_FALSE(page_pool_mem_providers);
+
+/*  We overload the LSB of the struct page pointer to indicate whether it's
+ *  a page or net_iov.
+ */
+#define NET_IOV 0x01UL
+
 struct net_iov {
+	unsigned long __unused_padding;
+	unsigned long pp_magic;
+	struct page_pool *pp;
 	struct dmabuf_genpool_chunk_owner *owner;
 	unsigned long dma_addr;
+	atomic_long_t pp_ref_count;
 };
 
+/* These fields in struct page are used by the page_pool and net stack:
+ *
+ *	struct {
+ *		unsigned long pp_magic;
+ *		struct page_pool *pp;
+ *		unsigned long _pp_mapping_pad;
+ *		unsigned long dma_addr;
+ *		atomic_long_t pp_ref_count;
+ *	};
+ *
+ * We mirror the page_pool fields here so the page_pool can access these fields
+ * without worrying whether the underlying fields belong to a page or net_iov.
+ *
+ * The non-net stack fields of struct page are private to the mm stack and must
+ * never be mirrored to net_iov.
+ */
+#define NET_IOV_ASSERT_OFFSET(pg, iov)             \
+	static_assert(offsetof(struct page, pg) == \
+		      offsetof(struct net_iov, iov))
+NET_IOV_ASSERT_OFFSET(pp_magic, pp_magic);
+NET_IOV_ASSERT_OFFSET(pp, pp);
+NET_IOV_ASSERT_OFFSET(dma_addr, dma_addr);
+NET_IOV_ASSERT_OFFSET(pp_ref_count, pp_ref_count);
+#undef NET_IOV_ASSERT_OFFSET
+
 static inline struct dmabuf_genpool_chunk_owner *
 net_iov_owner(const struct net_iov *niov)
 {
@@ -69,20 +106,27 @@ net_iov_binding(const struct net_iov *niov)
  */
 typedef unsigned long __bitwise netmem_ref;
 
+static inline bool netmem_is_net_iov(const netmem_ref netmem)
+{
+#ifdef CONFIG_PAGE_POOL
+	return static_branch_unlikely(&page_pool_mem_providers) &&
+	       (__force unsigned long)netmem & NET_IOV;
+#else
+	return false;
+#endif
+}
+
 /* This conversion fails (returns NULL) if the netmem_ref is not struct page
  * backed.
- *
- * Currently struct page is the only possible netmem, and this helper never
- * fails.
  */
 static inline struct page *netmem_to_page(netmem_ref netmem)
 {
+	if (WARN_ON_ONCE(netmem_is_net_iov(netmem)))
+		return NULL;
+
 	return (__force struct page *)netmem;
 }
 
-/* Converting from page to netmem is always safe, because a page can always be
- * a netmem.
- */
 static inline netmem_ref page_to_netmem(struct page *page)
 {
 	return (__force netmem_ref)page;
@@ -90,17 +134,103 @@ static inline netmem_ref page_to_netmem(struct page *page)
 
 static inline int netmem_ref_count(netmem_ref netmem)
 {
+	/* The non-pp refcount of net_iov is always 1. On net_iov, we only
+	 * support pp refcounting which uses the pp_ref_count field.
+	 */
+	if (netmem_is_net_iov(netmem))
+		return 1;
+
 	return page_ref_count(netmem_to_page(netmem));
 }
 
 static inline unsigned long netmem_to_pfn(netmem_ref netmem)
 {
+	if (netmem_is_net_iov(netmem))
+		return 0;
+
 	return page_to_pfn(netmem_to_page(netmem));
 }
 
+static inline struct net_iov *__netmem_clear_lsb(netmem_ref netmem)
+{
+	return (struct net_iov *)((__force unsigned long)netmem & ~NET_IOV);
+}
+
+static inline unsigned long netmem_get_pp_magic(netmem_ref netmem)
+{
+	return __netmem_clear_lsb(netmem)->pp_magic;
+}
+
+static inline void netmem_or_pp_magic(netmem_ref netmem, unsigned long pp_magic)
+{
+	__netmem_clear_lsb(netmem)->pp_magic |= pp_magic;
+}
+
+static inline void netmem_clear_pp_magic(netmem_ref netmem)
+{
+	__netmem_clear_lsb(netmem)->pp_magic = 0;
+}
+
+static inline struct page_pool *netmem_get_pp(netmem_ref netmem)
+{
+	return __netmem_clear_lsb(netmem)->pp;
+}
+
+static inline void netmem_set_pp(netmem_ref netmem, struct page_pool *pool)
+{
+	__netmem_clear_lsb(netmem)->pp = pool;
+}
+
+static inline unsigned long netmem_get_dma_addr(netmem_ref netmem)
+{
+	return __netmem_clear_lsb(netmem)->dma_addr;
+}
+
+static inline void netmem_set_dma_addr(netmem_ref netmem,
+				       unsigned long dma_addr)
+{
+	__netmem_clear_lsb(netmem)->dma_addr = dma_addr;
+}
+
+static inline atomic_long_t *netmem_get_pp_ref_count_ref(netmem_ref netmem)
+{
+	return &__netmem_clear_lsb(netmem)->pp_ref_count;
+}
+
+static inline bool netmem_is_pref_nid(netmem_ref netmem, int pref_nid)
+{
+	/* Assume net_iov are on the preferred node without actually
+	 * checking...
+	 *
+	 * This check is only used to check for recycling memory in the page
+	 * pool's fast paths. Currently the only implementation of net_iov
+	 * is dmabuf device memory. It's a deliberate decision by the user to
+	 * bind a certain dmabuf to a certain netdev, and the netdev rx queue
+	 * would not be able to reallocate memory from another dmabuf that
+	 * exists on the preferred node, so, this check doesn't make much sense
+	 * in this case. Assume all net_iovs can be recycled for now.
+	 */
+	if (netmem_is_net_iov(netmem))
+		return true;
+
+	return page_to_nid(netmem_to_page(netmem)) == pref_nid;
+}
+
 static inline netmem_ref netmem_compound_head(netmem_ref netmem)
 {
+	/* niov are never compounded */
+	if (netmem_is_net_iov(netmem))
+		return netmem;
+
 	return page_to_netmem(compound_head(netmem_to_page(netmem)));
 }
 
+static inline void *netmem_address(netmem_ref netmem)
+{
+	if (netmem_is_net_iov(netmem))
+		return NULL;
+
+	return page_address(netmem_to_page(netmem));
+}
+
 #endif /* _NET_NETMEM_H */
diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
index 61814f91a458..c6a55eddefae 100644
--- a/include/net/page_pool/helpers.h
+++ b/include/net/page_pool/helpers.h
@@ -215,7 +215,7 @@ inline enum dma_data_direction page_pool_get_dma_dir(struct page_pool *pool)
 
 static inline void page_pool_fragment_netmem(netmem_ref netmem, long nr)
 {
-	atomic_long_set(&netmem_to_page(netmem)->pp_ref_count, nr);
+	atomic_long_set(netmem_get_pp_ref_count_ref(netmem), nr);
 }
 
 /**
@@ -243,7 +243,7 @@ static inline void page_pool_fragment_page(struct page *page, long nr)
 
 static inline long page_pool_unref_netmem(netmem_ref netmem, long nr)
 {
-	struct page *page = netmem_to_page(netmem);
+	atomic_long_t *pp_ref_count = netmem_get_pp_ref_count_ref(netmem);
 	long ret;
 
 	/* If nr == pp_ref_count then we have cleared all remaining
@@ -260,19 +260,19 @@ static inline long page_pool_unref_netmem(netmem_ref netmem, long nr)
 	 * initially, and only overwrite it when the page is partitioned into
 	 * more than one piece.
 	 */
-	if (atomic_long_read(&page->pp_ref_count) == nr) {
+	if (atomic_long_read(pp_ref_count) == nr) {
 		/* As we have ensured nr is always one for constant case using
 		 * the BUILD_BUG_ON(), only need to handle the non-constant case
 		 * here for pp_ref_count draining, which is a rare case.
 		 */
 		BUILD_BUG_ON(__builtin_constant_p(nr) && nr != 1);
 		if (!__builtin_constant_p(nr))
-			atomic_long_set(&page->pp_ref_count, 1);
+			atomic_long_set(pp_ref_count, 1);
 
 		return 0;
 	}
 
-	ret = atomic_long_sub_return(nr, &page->pp_ref_count);
+	ret = atomic_long_sub_return(nr, pp_ref_count);
 	WARN_ON(ret < 0);
 
 	/* We are the last user here too, reset pp_ref_count back to 1 to
@@ -281,7 +281,7 @@ static inline long page_pool_unref_netmem(netmem_ref netmem, long nr)
 	 * page_pool_unref_page() currently.
 	 */
 	if (unlikely(!ret))
-		atomic_long_set(&page->pp_ref_count, 1);
+		atomic_long_set(pp_ref_count, 1);
 
 	return ret;
 }
@@ -400,9 +400,7 @@ static inline void page_pool_free_va(struct page_pool *pool, void *va,
 
 static inline dma_addr_t page_pool_get_dma_addr_netmem(netmem_ref netmem)
 {
-	struct page *page = netmem_to_page(netmem);
-
-	dma_addr_t ret = page->dma_addr;
+	dma_addr_t ret = netmem_get_dma_addr(netmem);
 
 	if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA)
 		ret <<= PAGE_SHIFT;
@@ -425,18 +423,17 @@ static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
 static inline bool page_pool_set_dma_addr_netmem(netmem_ref netmem,
 						 dma_addr_t addr)
 {
-	struct page *page = netmem_to_page(netmem);
-
 	if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA) {
-		page->dma_addr = addr >> PAGE_SHIFT;
+		netmem_set_dma_addr(netmem, addr >> PAGE_SHIFT);
 
 		/* We assume page alignment to shave off bottom bits,
 		 * if this "compression" doesn't work we need to drop.
 		 */
-		return addr != (dma_addr_t)page->dma_addr << PAGE_SHIFT;
+		return addr != (dma_addr_t)netmem_get_dma_addr(netmem)
+				       << PAGE_SHIFT;
 	}
 
-	page->dma_addr = addr;
+	netmem_set_dma_addr(netmem, addr);
 	return false;
 }
 
diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
index 68a24c5ae827..e29e77f7934e 100644
--- a/include/net/page_pool/types.h
+++ b/include/net/page_pool/types.h
@@ -6,6 +6,7 @@
 #include <linux/dma-direction.h>
 #include <linux/ptr_ring.h>
 #include <linux/types.h>
+#include <net/netmem.h>
 
 #define PP_FLAG_DMA_MAP		BIT(0) /* Should page_pool do the DMA
 					* map/unmap
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 24d5236b2efc..22e3d439da18 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -25,7 +25,7 @@
 
 #include "page_pool_priv.h"
 
-static DEFINE_STATIC_KEY_FALSE(page_pool_mem_providers);
+DEFINE_STATIC_KEY_FALSE(page_pool_mem_providers);
 
 #define DEFER_TIME (msecs_to_jiffies(1000))
 #define DEFER_WARN_INTERVAL (60 * HZ)
@@ -359,7 +359,7 @@ static noinline netmem_ref page_pool_refill_alloc_cache(struct page_pool *pool)
 		if (unlikely(!netmem))
 			break;
 
-		if (likely(page_to_nid(netmem_to_page(netmem)) == pref_nid)) {
+		if (likely(netmem_is_pref_nid(netmem, pref_nid))) {
 			pool->alloc.cache[pool->alloc.count++] = netmem;
 		} else {
 			/* NUMA mismatch;
@@ -446,10 +446,8 @@ static bool page_pool_dma_map(struct page_pool *pool, netmem_ref netmem)
 
 static void page_pool_set_pp_info(struct page_pool *pool, netmem_ref netmem)
 {
-	struct page *page = netmem_to_page(netmem);
-
-	page->pp = pool;
-	page->pp_magic |= PP_SIGNATURE;
+	netmem_set_pp(netmem, pool);
+	netmem_or_pp_magic(netmem, PP_SIGNATURE);
 
 	/* Ensuring all pages have been split into one fragment initially:
 	 * page_pool_set_pp_info() is only called once for every page when it
@@ -464,10 +462,8 @@ static void page_pool_set_pp_info(struct page_pool *pool, netmem_ref netmem)
 
 static void page_pool_clear_pp_info(netmem_ref netmem)
 {
-	struct page *page = netmem_to_page(netmem);
-
-	page->pp_magic = 0;
-	page->pp = NULL;
+	netmem_clear_pp_magic(netmem);
+	netmem_set_pp(netmem, NULL);
 }
 
 static struct page *__page_pool_alloc_page_order(struct page_pool *pool,
@@ -695,8 +691,9 @@ static bool page_pool_recycle_in_cache(netmem_ref netmem,
 
 static bool __page_pool_page_can_be_recycled(netmem_ref netmem)
 {
-	return page_ref_count(netmem_to_page(netmem)) == 1 &&
-	       !page_is_pfmemalloc(netmem_to_page(netmem));
+	return netmem_is_net_iov(netmem) ||
+	       (page_ref_count(netmem_to_page(netmem)) == 1 &&
+		!page_is_pfmemalloc(netmem_to_page(netmem)));
 }
 
 /* If the page refcnt == 1, this will try to recycle the page.
@@ -718,7 +715,7 @@ __page_pool_put_page(struct page_pool *pool, netmem_ref netmem,
 	 * refcnt == 1 means page_pool owns page, and can recycle it.
 	 *
 	 * page is NOT reusable when allocated when system is under
-	 * some pressure. (page_is_pfmemalloc)
+	 * some pressure. (page_pool_page_is_pfmemalloc)
 	 */
 	if (likely(__page_pool_page_can_be_recycled(netmem))) {
 		/* Read barrier done in page_ref_count / READ_ONCE */
@@ -734,6 +731,7 @@ __page_pool_put_page(struct page_pool *pool, netmem_ref netmem,
 		/* Page found as candidate for recycling */
 		return netmem;
 	}
+
 	/* Fallback/non-XDP mode: API user have elevated refcnt.
 	 *
 	 * Many drivers split up the page into fragments, and some
@@ -928,7 +926,7 @@ static void page_pool_empty_ring(struct page_pool *pool)
 	/* Empty recycle ring */
 	while ((netmem = (__force netmem_ref)ptr_ring_consume_bh(&pool->ring))) {
 		/* Verify the refcnt invariant of cached pages */
-		if (!(page_ref_count(netmem_to_page(netmem)) == 1))
+		if (!(netmem_ref_count(netmem) == 1))
 			pr_crit("%s() page_pool refcnt %d violation\n",
 				__func__, netmem_ref_count(netmem));
 
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index e1118b637085..cf23392e97f5 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -908,9 +908,9 @@ static void skb_clone_fraglist(struct sk_buff *skb)
 		skb_get(list);
 }
 
-static bool is_pp_page(struct page *page)
+static bool is_pp_netmem(netmem_ref netmem)
 {
-	return (page->pp_magic & ~0x3UL) == PP_SIGNATURE;
+	return (netmem_get_pp_magic(netmem) & ~0x3UL) == PP_SIGNATURE;
 }
 
 int skb_pp_cow_data(struct page_pool *pool, struct sk_buff **pskb,
@@ -1008,11 +1008,10 @@ EXPORT_SYMBOL(skb_cow_data_for_xdp);
 #if IS_ENABLED(CONFIG_PAGE_POOL)
 bool napi_pp_put_page(netmem_ref netmem, bool napi_safe)
 {
-	struct page *page = netmem_to_page(netmem);
 	bool allow_direct = false;
 	struct page_pool *pp;
 
-	page = compound_head(page);
+	netmem = netmem_compound_head(netmem);
 
 	/* page->pp_magic is OR'ed with PP_SIGNATURE after the allocation
 	 * in order to preserve any existing bits, such as bit 0 for the
@@ -1021,10 +1020,10 @@ bool napi_pp_put_page(netmem_ref netmem, bool napi_safe)
 	 * and page_is_pfmemalloc() is checked in __page_pool_put_page()
 	 * to avoid recycling the pfmemalloc page.
 	 */
-	if (unlikely(!is_pp_page(page)))
+	if (unlikely(!is_pp_netmem(netmem)))
 		return false;
 
-	pp = page->pp;
+	pp = netmem_get_pp(netmem);
 
 	/* Allow direct recycle if we have reasons to believe that we are
 	 * in the same context as the consumer would run, so there's
@@ -1045,7 +1044,7 @@ bool napi_pp_put_page(netmem_ref netmem, bool napi_safe)
 	 * The page will be returned to the pool here regardless of the
 	 * 'flipped' fragment being in use or not.
 	 */
-	page_pool_put_full_netmem(pp, page_to_netmem(page), allow_direct);
+	page_pool_put_full_netmem(pp, netmem, allow_direct);
 
 	return true;
 }
@@ -1072,7 +1071,7 @@ static bool skb_pp_recycle(struct sk_buff *skb, void *data, bool napi_safe)
 static int skb_pp_frag_ref(struct sk_buff *skb)
 {
 	struct skb_shared_info *shinfo;
-	struct page *head_page;
+	netmem_ref head_netmem;
 	int i;
 
 	if (!skb->pp_recycle)
@@ -1081,11 +1080,11 @@ static int skb_pp_frag_ref(struct sk_buff *skb)
 	shinfo = skb_shinfo(skb);
 
 	for (i = 0; i < shinfo->nr_frags; i++) {
-		head_page = compound_head(skb_frag_page(&shinfo->frags[i]));
-		if (likely(is_pp_page(head_page)))
-			page_pool_ref_page(head_page);
+		head_netmem = netmem_compound_head(shinfo->frags[i].netmem);
+		if (likely(is_pp_netmem(head_netmem)))
+			page_pool_ref_netmem(head_netmem);
 		else
-			page_ref_inc(head_page);
+			page_ref_inc(netmem_to_page(head_netmem));
 	}
 	return 0;
 }
-- 
2.44.0.rc1.240.g4c46232300-goog


