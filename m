Return-Path: <linux-alpha+bounces-2145-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8477A94326
	for <lists+linux-alpha@lfdr.de>; Sat, 19 Apr 2025 13:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 220223B48D5
	for <lists+linux-alpha@lfdr.de>; Sat, 19 Apr 2025 11:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F37F1AF0C8;
	Sat, 19 Apr 2025 11:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="blwLTlLt"
X-Original-To: linux-alpha@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139E026AF3
	for <linux-alpha@vger.kernel.org>; Sat, 19 Apr 2025 11:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745063006; cv=none; b=XOvEZ6zZVtX1cE8hx6ApCpUOAlfIwxvK86WTgOfsP7+oqAtfVeBMEGkpcsvOZRv6NR+IdUkHj4EnpZS5XmwxCpXrNoyRZmriMnrB4VDsnGAtFBf9V7mpuQaBZ3Vg3qHya70DoHBEPopRSNmwUEprP/E7TLa53chtE0fnqVT5bbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745063006; c=relaxed/simple;
	bh=TUleW9KRGX0FGrCbp8T9MpS2ex+KPStgayd09seZX9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dk9mu0+OD1/jR76S2cimK3IntyJH9UemR3WDSNFaMnBZ8e1gNo7JcpGwThmtOErTqL6Fr4/s7TaZoGUXhjmLhtoYqlfx7ODl0/Q2Nm26LFZOkns2pKDXfIHmJH6pxzquHudDwoQzO1/WnOCoWIDhugopq19Og09N5gyl3Y4Xeuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=blwLTlLt; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745063000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QowPVoBoSNnEHK0cULG/V4c+a1cIPM2plKANNmK/tiU=;
	b=blwLTlLtzlO6QHzgtCzVoPdEcKjZ9Iwa+POC7b+NgZOj9Ttmk+F2LvFhqK5C60dHGJTt/u
	ij3VB7YvmsEO5Mt4gAUVl7FAh3lHuQ6VAhNR2LI0MmdiI1DoSfy7Ahd6jNshsjXH5BWoAc
	uGoFUo+a/cHAsu3IiMHRMOUGH/daJ0g=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Guo Weikang <guoweikang.kernel@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] alpha: Replace sprintf()/strcpy() with scnprintf()/strscpy()
Date: Sat, 19 Apr 2025 13:40:11 +0200
Message-ID: <20250419114011.164512-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace sprintf() with the safer variant scnprintf() and use its return
value instead of calculating the string length again using strlen().

Use strscpy() instead of the deprecated strcpy().

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/alpha/kernel/core_marvel.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index b1bfbd11980d..d38f4d6759e4 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -17,6 +17,7 @@
 #include <linux/vmalloc.h>
 #include <linux/mc146818rtc.h>
 #include <linux/rtc.h>
+#include <linux/string.h>
 #include <linux/module.h>
 #include <linux/memblock.h>
 
@@ -79,10 +80,12 @@ mk_resource_name(int pe, int port, char *str)
 {
 	char tmp[80];
 	char *name;
-	
-	sprintf(tmp, "PCI %s PE %d PORT %d", str, pe, port);
-	name = memblock_alloc_or_panic(strlen(tmp) + 1, SMP_CACHE_BYTES);
-	strcpy(name, tmp);
+	size_t sz;
+
+	sz = scnprintf(tmp, sizeof(tmp), "PCI %s PE %d PORT %d", str, pe, port);
+	sz += 1; /* NUL terminator */
+	name = memblock_alloc_or_panic(sz, SMP_CACHE_BYTES);
+	strscpy(name, tmp, sz);
 
 	return name;
 }
-- 
2.49.0


