Return-Path: <linux-alpha+bounces-82-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 852A07F668B
	for <lists+linux-alpha@lfdr.de>; Thu, 23 Nov 2023 19:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3780F2823DD
	for <lists+linux-alpha@lfdr.de>; Thu, 23 Nov 2023 18:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E315F4C3BC
	for <lists+linux-alpha@lfdr.de>; Thu, 23 Nov 2023 18:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="STzh9Hxm"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F26173C
	for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 10:03:21 -0800 (PST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 86A34420CF
	for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 18:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1700762593;
	bh=HRyVYLIW8z4TePFCPPJByrkbbPXfNmIR6R9pb6rPiTE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=STzh9HxmvKL1WJQrXA6F8XCvYwPhCkYj1CjKxLqAiXtLzewh85gKmO7z3JBB3UhoW
	 oU0Ea40hqYKjOLZmUVftsRsh74rLSF067Tq6O8dQuTkOCH0yimuk/pfpXzBC/olG5g
	 d4dkZ0pf5K4izAtpDx8SKBnFoLwNvYPgmU5hnwxs45YgvZJMLQp8eVFgb4YBECfh37
	 9o53F//4VN8edODRo6Usua2Of3MiKyuE0t8nr0BAncaXOSHF1jCL5aZan7KIII1UH3
	 /FclLjBw7zGGS1WZnn6gAugXDVfBVPiZnzjwZp7xjhwG5cPpbhjoGLGhgWrDt0UXds
	 aG2ZS1mdcL+Vw==
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40b349b9711so6703665e9.0
        for <linux-alpha@vger.kernel.org>; Thu, 23 Nov 2023 10:03:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700762587; x=1701367387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRyVYLIW8z4TePFCPPJByrkbbPXfNmIR6R9pb6rPiTE=;
        b=Su1OryKA/s07rNFMGkWtGj47U/VMCFdbiYwQmYLOMl7uHcWoHndykqNdJd+lnT/s81
         IADZzQJ1RgnfWEj6JLg0uQfggptGFvD4cOAzzVc7uVU6nzhnLNAdOU2wKeGYsTOglN30
         e4Dr+nsx9XsFLeQ9qoyYLhrDlHMFsnLm45ZVQ4qTdIZL1yPnTqWtcPei3orG2JSqC3tS
         ZoExyyF3XItlQJlpM0V3/WZoKJiqigM0cWhZtiGs8hQ1VgJAiRpCUY8QcMBH6gxZuG2K
         gJffw2cKWC/y9rCZuKtS2KOzhB60dn0IP0mOPowmQq5nxCcpT0uqySaIvKoK4SgBthu4
         5gPA==
X-Gm-Message-State: AOJu0YyfI/fuANY7YyRVTvvTvuPM7JTCUn4L3ZT53HaU397K4az3Obr9
	X7PgVWeboq6H3k8VtrQDHfXX2qcY2uP0psCuUhbmyuaTAKMh+ybCQ4KriNHMNQ3PTqi5aqZAY4r
	B6bwdHD2XqS30MY6QB7lSAurdPq2qlFoMb/qq5C3m
X-Received: by 2002:a05:600c:45d1:b0:40b:3056:7420 with SMTP id s17-20020a05600c45d100b0040b30567420mr283023wmo.39.1700762586738;
        Thu, 23 Nov 2023 10:03:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEsTM+mZ76wvwDS29V40A18RFxx8flNlA2hyMuFL6dfEy9Ent8PC5V9rE3/Sk8FDWOuaussw==
X-Received: by 2002:a05:600c:45d1:b0:40b:3056:7420 with SMTP id s17-20020a05600c45d100b0040b30567420mr283001wmo.39.1700762586518;
        Thu, 23 Nov 2023 10:03:06 -0800 (PST)
Received: from localhost ([2001:67c:1560:8007::aac:c15c])
        by smtp.gmail.com with ESMTPSA id r15-20020a05600c35cf00b0040a5e69482esm3355473wmq.11.2023.11.23.10.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:03:05 -0800 (PST)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org
Cc: linux-alpha@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] x86: stop shipping a.out.h uapi headers
Date: Thu, 23 Nov 2023 18:02:44 +0000
Message-Id: <20231123180246.750674-5-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123180246.750674-1-dimitri.ledkov@canonical.com>
References: <20231123180246.750674-1-dimitri.ledkov@canonical.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop shipping a.out.h uapi headers, unused.

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 arch/x86/include/uapi/asm/a.out.h | 21 ---------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 arch/x86/include/uapi/asm/a.out.h

diff --git a/arch/x86/include/uapi/asm/a.out.h b/arch/x86/include/uapi/asm/a.out.h
deleted file mode 100644
index 094c49d8ea..0000000000
--- a/arch/x86/include/uapi/asm/a.out.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _ASM_X86_A_OUT_H
-#define _ASM_X86_A_OUT_H
-
-struct exec
-{
-	unsigned int a_info;	/* Use macros N_MAGIC, etc for access */
-	unsigned a_text;	/* length of text, in bytes */
-	unsigned a_data;	/* length of data, in bytes */
-	unsigned a_bss;		/* length of uninitialized data area for file, in bytes */
-	unsigned a_syms;	/* length of symbol table data in file, in bytes */
-	unsigned a_entry;	/* start address */
-	unsigned a_trsize;	/* length of relocation info for text, in bytes */
-	unsigned a_drsize;	/* length of relocation info for data, in bytes */
-};
-
-#define N_TRSIZE(a)	((a).a_trsize)
-#define N_DRSIZE(a)	((a).a_drsize)
-#define N_SYMSIZE(a)	((a).a_syms)
-
-#endif /* _ASM_X86_A_OUT_H */
-- 
2.34.1


