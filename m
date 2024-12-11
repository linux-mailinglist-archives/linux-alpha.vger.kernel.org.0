Return-Path: <linux-alpha+bounces-1667-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2879EDB6F
	for <lists+linux-alpha@lfdr.de>; Thu, 12 Dec 2024 00:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49DAC1688E6
	for <lists+linux-alpha@lfdr.de>; Wed, 11 Dec 2024 23:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA551F37AB;
	Wed, 11 Dec 2024 23:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZKXFlgBZ"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54341F8694
	for <linux-alpha@vger.kernel.org>; Wed, 11 Dec 2024 23:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733959695; cv=none; b=tAMED/xE3X6bzDkRstxCzjnwMU7J/EB52+Pb2Rmy6WHO3dJIXkhUrq+wwj/7Vs2hP9nu0QMHnXyfTI329963ykXdwt8Y0bKjJIvQK4N9Tmh4z/ipETfB42+VNDzajbr3Oz7WMyxlKy1hryitabVqzz9oImq7l9V5W2qRU5iWh0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733959695; c=relaxed/simple;
	bh=zlxExqXE0l4h8ndRv7/8KLE54iJ3pIBdvNI0YUqUibM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YHOGJ5fKlTBCgpbgvdPjWHXjFw7WL6n9kFmqEwHvDqKtsJULZfdq0JmPqrOLjjTEZNIE62nswH5QLmxSIS2HScYnOTkm4fd2z49Dji2rnBLRHGTiLnAL/uA7HPyPn/6FTvJ7PjA0KznFEyK+0WUSE6ldRuFkDg4jPB9N5QHQcsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZKXFlgBZ; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-728e3d9706dso17948b3a.3
        for <linux-alpha@vger.kernel.org>; Wed, 11 Dec 2024 15:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959693; x=1734564493; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lSyWTl6AgHPTeHZ5Av2U3d+7m6ogGk/gBzGXwo6uPmA=;
        b=ZKXFlgBZuKsCHE4ttDnhBKzrwxSKcFIens9/3CDa3+eFbyy24lNz2KOEOpbkcTdmYE
         qvY1MH2wjqJoQhyvypeHkoYmFQKhVAoO8zB0WeT4ZBYLUgxhXOAKIoxGtznmLMWZsBsB
         2jcaU767JBLrmDWlQqK1kIti9Qhj4NxPsdG71tiaqQ5t8L3/wYubo5gsff81mWgkrakX
         x7hMai+cJST8b2/uawEAovKqclpuPmvfQdMVIL1r/0q1dyWoHLp3JYC/WkreHN24EKGF
         Kcus68vuC2nzW+wcHTicUnxqnLZwQDeG1XWDdweKTf6DVgSRUTS38bj5G7gyzNeuwcLk
         ygAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959693; x=1734564493;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSyWTl6AgHPTeHZ5Av2U3d+7m6ogGk/gBzGXwo6uPmA=;
        b=fVThhYMrZccjrY9o4Q+GeK5uXkgFdUQKrCWWe5yM/B9BTHogsU7LS+QxcMvH035GaT
         LcPecWgQvKaxM0oCFcXe/JwhwECLg9gP3sgiEEcRR1v7zfiNVbyRFOIbQU7lvMB9fUy+
         awDqvWEACi0zQ4gorFBkRvyXA23/YvTmL/k9BKjiDujZfssGsh0ew+18po6RfUfb45XK
         nKzL8NRiUXkZ4jkBUdA5Kh1Gy9HPRtvMwyyChehxJCPDd0hhE5HNNpV4hMJ1Glw5vJGb
         fnoAqpU1+EhIKHxSK3hMZemTDYI7Oug7ymhGyPf9CK319AzJZhh72XtF3fx8Uek/Z7Bu
         UWjA==
X-Forwarded-Encrypted: i=1; AJvYcCUUgdzKF6zktLpxEjL7IAzr5KG1fCANkYLy1SoZxU1kHTVrsglF05VMo3M6WukpDTO3AcIvG6p/Rla4/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YypAj1/JuFOwcS7uvxpg6OsZCrI2wLJvTU6/2eBbR9vAevyuFU1
	5CSMgAk+od3kKe0XkiGDVYqqnkVJRdW6hOLiUHUfNePJg3pDgASBo4W9wclB0m7UH3n3WzxETWz
	B1dhsndYlxqWfXUEOOmew3A==
X-Google-Smtp-Source: AGHT+IELNRPT2MoTQPIqvo9hLlMpqD0+8YUx/FKtbvg/ITxUep08nhQE+boeOUdV49+7nevT39OL6ys2YO6NUc/bEw==
X-Received: from pfxa2.prod.google.com ([2002:a05:6a00:1d02:b0:725:c7de:e052])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:c95:b0:725:f376:f4f4 with SMTP id d2e1a72fcca58-728faa23b24mr1501920b3a.13.1733959693368;
 Wed, 11 Dec 2024 15:28:13 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:46 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-9-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 08/16] mm: mips: Introduce arch_align_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduce mips arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/mips/include/asm/pgtable.h |  1 +
 arch/mips/mm/mmap.c             | 50 ++++++++++++++++++---------------
 2 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index c29a551eb0ca..837f25624369 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -766,5 +766,6 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* _ASM_PGTABLE_H */
diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
index 5d2a1225785b..ee9f675190f1 100644
--- a/arch/mips/mm/mmap.c
+++ b/arch/mips/mm/mmap.c
@@ -26,15 +26,11 @@ EXPORT_SYMBOL(shm_align_mask);
 
 enum mmap_allocation_direction {UP, DOWN};
 
-static unsigned long arch_get_unmapped_area_common(struct file *filp,
-	unsigned long addr0, unsigned long len, unsigned long pgoff,
-	unsigned long flags, enum mmap_allocation_direction dir)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
-	unsigned long addr = addr0;
-	int do_color_align;
-	struct vm_unmapped_area_info info = {};
+	bool do_color_align;
 
 	if (unlikely(len > TASK_SIZE))
 		return -ENOMEM;
@@ -54,22 +50,32 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		return addr;
 	}
 
-	do_color_align = 0;
-	if (filp || (flags & MAP_SHARED))
-		do_color_align = 1;
+	do_color_align = filp || (flags & MAP_SHARED);
+
+	if (do_color_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+
+static unsigned long arch_get_unmapped_area_common(struct file *filp,
+	unsigned long addr0, unsigned long len, unsigned long pgoff,
+	unsigned long flags, enum mmap_allocation_direction dir)
+{
+	struct mm_struct *mm = current->mm;
+	unsigned long addr = addr0;
+	struct vm_unmapped_area_info info = {};
+	bool do_color_align;
 
 	/* requesting a specific address */
-	if (addr) {
-		if (do_color_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	do_color_align = filp || (flags & MAP_SHARED);
 
 	info.length = len;
 	info.align_mask = do_color_align ? (PAGE_MASK & shm_align_mask) : 0;
-- 
2.47.0.338.g60cca15819-goog


