Return-Path: <linux-alpha+bounces-731-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD8F92C78C
	for <lists+linux-alpha@lfdr.de>; Wed, 10 Jul 2024 02:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D0231F23CD4
	for <lists+linux-alpha@lfdr.de>; Wed, 10 Jul 2024 00:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318F11FA5;
	Wed, 10 Jul 2024 00:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EVV77sFc"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC45823C3
	for <linux-alpha@vger.kernel.org>; Wed, 10 Jul 2024 00:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720570704; cv=none; b=J9vvjGHSuumlqkNSJmqOvUNIxH3DqiOQoQ/k7bigzk7xTN5Sw/sKR8sI4BRq2090a+jJNip+5s50RZrbVOB1oLJYwChPUNSGPLZPxlCH1/SMOH4beSXuBfzo+FMVEjzctiYyL5wCTDD5HlplVlaUFVkQ+S36u14rwnDZRreAtiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720570704; c=relaxed/simple;
	bh=p9TCrtunq3Sc+tHM9HSo0pjT1D7aMbYnoIhXBBRGHcA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A0xQN1FXlTUDdJ98oD/rNcr4W8Y6pJpQ/mmYQfrEqvWK/9jdaaCOqEN9b92ijcAf9Y0xTU9X1PB7jxyshwABExdsQjs9ACmbxYAPRINMS+dQkfuX/ZO/H6QPdj+Fl3/uzCPDIXwyUIXzkO15rvohEK6QgYkxqHqY8Ad0KQLkTyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EVV77sFc; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-64f30b1f8ecso86720757b3.3
        for <linux-alpha@vger.kernel.org>; Tue, 09 Jul 2024 17:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720570696; x=1721175496; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5P7T8nlF1fJQfwxNLMQaeLRVD2aIiRw+Td5GpIM/t7s=;
        b=EVV77sFceVqLWviNlasFmMPXU4GBHJpENMZH+Sm/tHPX0TueSjK0ZKKCFVJYMSvNDs
         reOH61jlO3qdfcn85MDS69sd0u0z2PaX2tkL2SumrxgSCDJASw4I4k4T/vrSOf5/PI/S
         o/0rKIrMrafJDGJzLCcQ9gFNUbhyT1FSl//biVrprxtE5umFIri2bP5/3BPMs+nHkV80
         RvSB6kg4gO+DOlNId2ampA+XNE3J+RrBGzOimDFJsFPBeG8UeftfdAnuhyhmR1M0gHeh
         HKzeFZow9jYU8bsN0lY2yIazW9QYEScP2bu/ncwvzuj1bZ3rh1PLNGxsYv0LhKPlNzB8
         Sfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720570696; x=1721175496;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5P7T8nlF1fJQfwxNLMQaeLRVD2aIiRw+Td5GpIM/t7s=;
        b=YHiKPWoazsIBvzjAh+51TegsK50EoNF0OOpqga/GqaxRNeTZWG2CA8KyODz0DUrfXd
         JIyFGIXiTVcbJ5b0WXHKlDhhpR0hBnAtzi+/Igsd6/Hah2P5NFppuISdPZzTxuFd+nhZ
         Uabv+9AaluxJlQIxkDV3cSquohQRCG2EpvYEpL35aRnXf/+Sxov40QP9YKFBIQG620n4
         Ef6e4U/OXCBgIVuTgaNYnTvjmMF/AZLjPgJnIpxCcuBDRQmsTWyOw+THDC8mhU4ogXae
         98YwuEZm/Z2Ysr13tACggmzlsL7ZZmuEqYKsMSimOkSW4/UkWVYYFv6xG6wg04P/gr/u
         xZxg==
X-Forwarded-Encrypted: i=1; AJvYcCUmeGksOeKYVsJLzek5qKOiBMI/CSde/8G1PtGhW0X14Ev7oindDdBKtegcQWLymWnEypcGx3/vjldXska8aN0Qvib6lxhb22Eah5c=
X-Gm-Message-State: AOJu0YwxfanPZ5ZLugW2rIr4Tw2hBdXdQMUhLjAIg1PvDERIfAqzpv/U
	TZnh2fJKEZWjUxYZrgSUmTIM/P6aTUXnMY9v50CRZ1KNe1Mika/10iKBdgUeLc8Ms3Fao/oahlx
	fdUB0Uu3JbcDjRmXRNXaG0w==
X-Google-Smtp-Source: AGHT+IFcaWW5jqfEL6UmmKDurzwGMgILdQq8qULJRfWHlLzreMoST4DZONBBVue+Todgr1TAQxDVXsqBdlPZBjt4Ag==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:4882:b0:627:a787:abf4 with
 SMTP id 00721157ae682-658eed5ddcamr1032287b3.3.1720570696535; Tue, 09 Jul
 2024 17:18:16 -0700 (PDT)
Date: Wed, 10 Jul 2024 00:17:46 +0000
In-Reply-To: <20240710001749.1388631-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240710001749.1388631-1-almasrymina@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240710001749.1388631-14-almasrymina@google.com>
Subject: [PATCH net-next v16 13/13] netdev: add dmabuf introspection
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
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
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"

Add dmabuf information to page_pool stats:

$ ./cli.py --spec ../netlink/specs/netdev.yaml --dump page-pool-get
...
 {'dmabuf': 10,
  'id': 456,
  'ifindex': 3,
  'inflight': 1023,
  'inflight-mem': 4190208},
 {'dmabuf': 10,
  'id': 455,
  'ifindex': 3,
  'inflight': 1023,
  'inflight-mem': 4190208},
 {'dmabuf': 10,
  'id': 454,
  'ifindex': 3,
  'inflight': 1023,
  'inflight-mem': 4190208},
 {'dmabuf': 10,
  'id': 453,
  'ifindex': 3,
  'inflight': 1023,
  'inflight-mem': 4190208},
 {'dmabuf': 10,
  'id': 452,
  'ifindex': 3,
  'inflight': 1023,
  'inflight-mem': 4190208},
 {'dmabuf': 10,
  'id': 451,
  'ifindex': 3,
  'inflight': 1023,
  'inflight-mem': 4190208},
 {'dmabuf': 10,
  'id': 450,
  'ifindex': 3,
  'inflight': 1023,
  'inflight-mem': 4190208},
 {'dmabuf': 10,
  'id': 449,
  'ifindex': 3,
  'inflight': 1023,
  'inflight-mem': 4190208},

And queue stats:

$ ./cli.py --spec ../netlink/specs/netdev.yaml --dump queue-get
...
{'dmabuf': 10, 'id': 8, 'ifindex': 3, 'type': 'rx'},
{'dmabuf': 10, 'id': 9, 'ifindex': 3, 'type': 'rx'},
{'dmabuf': 10, 'id': 10, 'ifindex': 3, 'type': 'rx'},
{'dmabuf': 10, 'id': 11, 'ifindex': 3, 'type': 'rx'},
{'dmabuf': 10, 'id': 12, 'ifindex': 3, 'type': 'rx'},
{'dmabuf': 10, 'id': 13, 'ifindex': 3, 'type': 'rx'},
{'dmabuf': 10, 'id': 14, 'ifindex': 3, 'type': 'rx'},
{'dmabuf': 10, 'id': 15, 'ifindex': 3, 'type': 'rx'},

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---
 Documentation/netlink/specs/netdev.yaml | 10 ++++++++++
 include/uapi/linux/netdev.h             |  2 ++
 net/core/netdev-genl.c                  | 10 ++++++++++
 net/core/page_pool_user.c               |  4 ++++
 tools/include/uapi/linux/netdev.h       |  2 ++
 5 files changed, 28 insertions(+)

diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
index 0c747530c275e..08412c279297b 100644
--- a/Documentation/netlink/specs/netdev.yaml
+++ b/Documentation/netlink/specs/netdev.yaml
@@ -167,6 +167,10 @@ attribute-sets:
           "re-attached", they are just waiting to disappear.
           Attribute is absent if Page Pool has not been detached, and
           can still be used to allocate new memory.
+      -
+        name: dmabuf
+        doc: ID of the dmabuf this page-pool is attached to.
+        type: u32
   -
     name: page-pool-info
     subset-of: page-pool
@@ -268,6 +272,10 @@ attribute-sets:
         name: napi-id
         doc: ID of the NAPI instance which services this queue.
         type: u32
+      -
+        name: dmabuf
+        doc: ID of the dmabuf attached to this queue, if any.
+        type: u32
 
   -
     name: qstats
@@ -543,6 +551,7 @@ operations:
             - inflight
             - inflight-mem
             - detach-time
+            - dmabuf
       dump:
         reply: *pp-reply
       config-cond: page-pool
@@ -607,6 +616,7 @@ operations:
             - type
             - napi-id
             - ifindex
+            - dmabuf
       dump:
         request:
           attributes:
diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
index 91bf3ecc5f1d9..7c308f04e7a06 100644
--- a/include/uapi/linux/netdev.h
+++ b/include/uapi/linux/netdev.h
@@ -93,6 +93,7 @@ enum {
 	NETDEV_A_PAGE_POOL_INFLIGHT,
 	NETDEV_A_PAGE_POOL_INFLIGHT_MEM,
 	NETDEV_A_PAGE_POOL_DETACH_TIME,
+	NETDEV_A_PAGE_POOL_DMABUF,
 
 	__NETDEV_A_PAGE_POOL_MAX,
 	NETDEV_A_PAGE_POOL_MAX = (__NETDEV_A_PAGE_POOL_MAX - 1)
@@ -131,6 +132,7 @@ enum {
 	NETDEV_A_QUEUE_IFINDEX,
 	NETDEV_A_QUEUE_TYPE,
 	NETDEV_A_QUEUE_NAPI_ID,
+	NETDEV_A_QUEUE_DMABUF,
 
 	__NETDEV_A_QUEUE_MAX,
 	NETDEV_A_QUEUE_MAX = (__NETDEV_A_QUEUE_MAX - 1)
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index bd54cf50b658a..e944fd56c6b8e 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -293,6 +293,7 @@ static int
 netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
 			 u32 q_idx, u32 q_type, const struct genl_info *info)
 {
+	struct net_devmem_dmabuf_binding *binding;
 	struct netdev_rx_queue *rxq;
 	struct netdev_queue *txq;
 	void *hdr;
@@ -312,6 +313,15 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
 		if (rxq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
 					     rxq->napi->napi_id))
 			goto nla_put_failure;
+
+		binding = (struct net_devmem_dmabuf_binding *)
+				  rxq->mp_params.mp_priv;
+		if (binding) {
+			if (nla_put_u32(rsp, NETDEV_A_QUEUE_DMABUF,
+					binding->id))
+				goto nla_put_failure;
+		}
+
 		break;
 	case NETDEV_QUEUE_TYPE_TX:
 		txq = netdev_get_tx_queue(netdev, q_idx);
diff --git a/net/core/page_pool_user.c b/net/core/page_pool_user.c
index 3a3277ba167b1..ca13363aea343 100644
--- a/net/core/page_pool_user.c
+++ b/net/core/page_pool_user.c
@@ -212,6 +212,7 @@ static int
 page_pool_nl_fill(struct sk_buff *rsp, const struct page_pool *pool,
 		  const struct genl_info *info)
 {
+	struct net_devmem_dmabuf_binding *binding = pool->mp_priv;
 	size_t inflight, refsz;
 	void *hdr;
 
@@ -241,6 +242,9 @@ page_pool_nl_fill(struct sk_buff *rsp, const struct page_pool *pool,
 			 pool->user.detach_time))
 		goto err_cancel;
 
+	if (binding && nla_put_u32(rsp, NETDEV_A_PAGE_POOL_DMABUF, binding->id))
+		goto err_cancel;
+
 	genlmsg_end(rsp, hdr);
 
 	return 0;
diff --git a/tools/include/uapi/linux/netdev.h b/tools/include/uapi/linux/netdev.h
index 91bf3ecc5f1d9..7c308f04e7a06 100644
--- a/tools/include/uapi/linux/netdev.h
+++ b/tools/include/uapi/linux/netdev.h
@@ -93,6 +93,7 @@ enum {
 	NETDEV_A_PAGE_POOL_INFLIGHT,
 	NETDEV_A_PAGE_POOL_INFLIGHT_MEM,
 	NETDEV_A_PAGE_POOL_DETACH_TIME,
+	NETDEV_A_PAGE_POOL_DMABUF,
 
 	__NETDEV_A_PAGE_POOL_MAX,
 	NETDEV_A_PAGE_POOL_MAX = (__NETDEV_A_PAGE_POOL_MAX - 1)
@@ -131,6 +132,7 @@ enum {
 	NETDEV_A_QUEUE_IFINDEX,
 	NETDEV_A_QUEUE_TYPE,
 	NETDEV_A_QUEUE_NAPI_ID,
+	NETDEV_A_QUEUE_DMABUF,
 
 	__NETDEV_A_QUEUE_MAX,
 	NETDEV_A_QUEUE_MAX = (__NETDEV_A_QUEUE_MAX - 1)
-- 
2.45.2.803.g4e1b14247a-goog


