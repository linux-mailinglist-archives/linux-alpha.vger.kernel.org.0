Return-Path: <linux-alpha+bounces-1047-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3954096E4DA
	for <lists+linux-alpha@lfdr.de>; Thu,  5 Sep 2024 23:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EC55B21099
	for <lists+linux-alpha@lfdr.de>; Thu,  5 Sep 2024 21:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563381B29AE;
	Thu,  5 Sep 2024 21:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="KRtbqZ34"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153081B12C8
	for <linux-alpha@vger.kernel.org>; Thu,  5 Sep 2024 21:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725570983; cv=none; b=qUObROtV+mBg0n+dqiCJgLoxniWP5Osj7tYdu0IBf+aLNCO1SD7GShioUCIPwh6zpVzAYMa3Rt7Oy0FBg+iod7mfirdONqOAi2BobMb/kxpf7Bel6cQTYX/rsKDuXL8MveEDeI3xe1tLGnk0pEb1tLh1k6N0hHS0emca1yNVXSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725570983; c=relaxed/simple;
	bh=v+6JyaTNEum7sQVRfCLlZa2h0GjRhYNybjctqPTjXjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=drpHZq9WVAIVCxx0K0rFwx7U6bL9LP/CJepHZKBVW2/kHg0XlLVA8hwvdCiA/XP3wp4ui0N3tOjlrKvEVCGxNAKmf2azlCCPnGNnEm8xavIKWyw+YF3dwxQkfL1D+fLzijf8650ZBys6jZ96OPo3P6w6jYTTFbCic9IErtof4ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=KRtbqZ34; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7c6aee8e8daso997194a12.0
        for <linux-alpha@vger.kernel.org>; Thu, 05 Sep 2024 14:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725570979; x=1726175779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BC+wwN1fePLvWLzJkRJwUgtVdOqgdkSuyAR2hC6nLRw=;
        b=KRtbqZ348/BYDeSXaw6rSlS5k2zXiAMIjzgBEeEP4dracgdhRjL501rYq2KzvMc4ol
         oVaLvqQdJaPg7ZYy3p720p7SwjXIDvOdyqPNoj4AKMDMihujaa27sWgHa+P68nBIrYKJ
         8ZoBHU7gSnjWsl6XHUMTiAXXLam0Bwer+P3eUH5Ne4dIouK6XN00aqvD72skHJ6fWB+j
         /ZXFOC2aThFAkkuzfuQb7aXIEXGYERAZna5R+stF3HpGJ3zUSZSjy3+ekGJpuFDto751
         iU5ZIfZbepk9HiTLSMmYkIt1Qe2cGA0aaHt8PyrxBYbQgyTkfzEJw4OVAdA5KqLHPn33
         rJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725570979; x=1726175779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BC+wwN1fePLvWLzJkRJwUgtVdOqgdkSuyAR2hC6nLRw=;
        b=n9FPt9zxH6Z96Kz1OjLaViGPqRLNG/chuOZ3Wyp9V+9JJa+XsWdv69ZtL/6wDsSAdL
         dBX9jHhdEyn1/knESLk1OK659Qu8qdt59llvmt92HmT3JCyIQDRkg9WSXfOKD28/raTG
         n1BxxdlXkCTtF7L003Q6s5isUJaSIgGYvIVpBKkw8OFANklpl+KGt8timzoUS1K4rTzH
         iHkIPkFUnlNY6KbCN8dTV4YIu6O0JZtrpXRviRZJ4LH79KrmMMHoK+QftX193o5Gleif
         VZ0YAORCeKznFDDVAXtzaZHkLzvp9hHNbMC3YI6RIckLhlgUBccIJxGbuZVO1RNXD1dR
         5VeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTZ5E8fXCXPaZceWcNfOgHmZnT9z/N1JbPoGzSRPBqdh+mhOGD30IfsfhhKiS97lwciS2GzNAtaWYxyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQGw+ZKeVw/HyRmwbAzk6uUN87XOsmYM0QmXKnE4ngg3pZrKbb
	6LWF/vB7+qL38kxAIf2nRIchfZBn0LjMy9ZqKQSG5yMEoFWSNjmEgr6KPmZTBHk=
X-Google-Smtp-Source: AGHT+IEZNTxfv2Eh4MhBvC/nCmC/+9uGBr1mJ2SunSW5zA4oMdQE9dzvz6pYsZBAUp5dcakacvTYeg==
X-Received: by 2002:a05:6a20:6f08:b0:1c6:a680:ef3d with SMTP id adf61e73a8af0-1cf1d13329emr317665637.28.1725570979059;
        Thu, 05 Sep 2024 14:16:19 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbda7abesm3775746a12.61.2024.09.05.14.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 14:16:18 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 05 Sep 2024 14:15:52 -0700
Subject: [PATCH RFC v3 2/2] selftests/mm: Create ADDR_LIMIT_47BIT test
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-patches-below_hint_mmap-v3-2-3cd5564efbbb@rivosinc.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
In-Reply-To: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>, 
 Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>, 
 "Kirill A. Shutemov" <kirill@shutemov.name>, 
 Chris Torek <chris.torek@gmail.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2582; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=v+6JyaTNEum7sQVRfCLlZa2h0GjRhYNybjctqPTjXjI=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9ot+RkaGxaJ/61aKCWQFuW4/RLXZ/ZytuJlXCePW/lm/
 BEMfPmgo5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIl8VmJkmJ40y3j9/d1mFyvf
 My3sVpqs+9/6YNER2ftWy07b31r7azfDfzfJmfzFLLNYSxYW7GExLQoUvbVs9j2GHob0FXfdby4
 9wwcA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add a selftest for the ADDR_LIMIT_47BIT personality flag that mmaps
until it runs out of space and ensures no addresses are allocated above
47 bits.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/testing/selftests/mm/.gitignore              |  1 +
 tools/testing/selftests/mm/Makefile                |  1 +
 tools/testing/selftests/mm/map_47bit_personality.c | 34 ++++++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
index da030b43e43b..918ef05e180d 100644
--- a/tools/testing/selftests/mm/.gitignore
+++ b/tools/testing/selftests/mm/.gitignore
@@ -32,6 +32,7 @@ mlock-random-test
 virtual_address_range
 gup_test
 va_128TBswitch
+map_47bit_personality
 map_fixed_noreplace
 write_to_hugetlbfs
 hmm-tests
diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index cfad627e8d94..2e95fd545409 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -50,6 +50,7 @@ TEST_GEN_FILES += hugepage-shm
 TEST_GEN_FILES += hugepage-vmemmap
 TEST_GEN_FILES += khugepaged
 TEST_GEN_FILES += madv_populate
+TEST_GEN_FILES += map_47bit_personality
 TEST_GEN_FILES += map_fixed_noreplace
 TEST_GEN_FILES += map_hugetlb
 TEST_GEN_FILES += map_populate
diff --git a/tools/testing/selftests/mm/map_47bit_personality.c b/tools/testing/selftests/mm/map_47bit_personality.c
new file mode 100644
index 000000000000..453412990c21
--- /dev/null
+++ b/tools/testing/selftests/mm/map_47bit_personality.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test the ADDR_LIMIT_47BIT personality flag.
+ */
+#include <sys/syscall.h>
+#include <sys/mman.h>
+#include <errno.h>
+#include "../kselftest.h"
+
+#define LENGTH (100000000)
+
+#define ADDR_LIMIT_47BIT	0x10000000
+#define BIT47			1UL << 47
+
+/*
+ * Map memory with ADDR_LIMIT_47BIT until no memory left. Ensure that all returned
+ * addresses are below 47 bits.
+ */
+int main(int argc, char **argv)
+{
+	void *addr;
+
+	syscall(__NR_personality, ADDR_LIMIT_47BIT);
+
+	do {
+		addr = mmap(0, LENGTH, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	} while (addr != MAP_FAILED && (unsigned long)addr < BIT47);
+
+	if (errno == ENOMEM)
+		ksft_test_result_pass("ADDR_LIMIT_47BIT works\n");
+	else
+		ksft_test_result_fail("mmap returned address above 47 bits with ADDR_LIMIT_47BIT with addr: %p and err: %s\n",
+				      addr, strerror(errno));
+}

-- 
2.45.0


