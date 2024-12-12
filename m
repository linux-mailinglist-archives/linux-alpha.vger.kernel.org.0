Return-Path: <linux-alpha+bounces-1670-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E689EDB8D
	for <lists+linux-alpha@lfdr.de>; Thu, 12 Dec 2024 00:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C70601689E8
	for <lists+linux-alpha@lfdr.de>; Wed, 11 Dec 2024 23:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7651FD7AB;
	Wed, 11 Dec 2024 23:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uQR62U21"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44541FCD13
	for <linux-alpha@vger.kernel.org>; Wed, 11 Dec 2024 23:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733959702; cv=none; b=meUXjjwmIEFvZZD9DFbh1Q1JtbH2HLvSjfXaRKABxSB+OSmVBboaOkq2OymE3W4ZRvqqMFs4YAvfU/2pmev2D/+v5qzG5C/jTPbW96N6LrIEH7BOcp2ZFn7gJI17IvjNFKymyP6c4olp8Ak0sol5l5xTPjbsXtb0nxcMOQ7EJ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733959702; c=relaxed/simple;
	bh=ihwAm37IJ2/hyH8wk9p8tewzBNUAFvpAvR4rEE9oF+8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WDG1/94+SLNQP/zqVCEFwA8hUN7bnldt4EJNPY7hVYeP9Yj8jtfJsVU7c2zWH+9IVWMf2QAUq0gd201io7gfTfY+oOaqpne6/QOY2iXqp3FMfFECoRFmn4fdWCyu+aThEeRjqh0g0GVk7zXOWTDBilCawImZb83w9gD2OoiwQa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uQR62U21; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2166a1a5cc4so26496025ad.3
        for <linux-alpha@vger.kernel.org>; Wed, 11 Dec 2024 15:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959699; x=1734564499; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uS3JA6w5wn3oIbxGMB+ie6BxkNausmcv0DhJz9a4fkc=;
        b=uQR62U217bS+T1AweoH918/5FFDimU0rPOTcz+N1nByJhHqrKlo8nwPm0+nqlBU45B
         WrPADAHSbRqfp2GCPefvAbI9wCOIeWBiniKXINJ2LWu60bFuekVilayqfzUBvLxWXV9R
         wIs0Bjheu0LrYfSDg52K3U+OLXAhcOQOk/NEx0orAuFtge1GCpQEmfQtdWePC5FqtczM
         +yRp5Yv3V1GMmYqYw9+il62IIDvfxdzHP7DIFfMNR+FwBX19HPqHZ/JD4+HZjFqTQ1Dy
         w0tLB7BUfTh+l87ZlLQGmbYsjLqXgGY+OndYds4N28PiJgWIjRNVxDV2CGxwLlM0oE0z
         fdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959699; x=1734564499;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uS3JA6w5wn3oIbxGMB+ie6BxkNausmcv0DhJz9a4fkc=;
        b=BqvCpjgwznzE94tWD+nyg6qZzKxmp6HqixUj8ngKZcYub7H/stP1LSyUyU7Zh2Ae5b
         yJ5AwuYF+BLZ17SybyfqcIoQXtvUiey2SQPWaguIwlrRNFfTNhj8nzWmxyvbD9Km9Fdt
         XuVldBFUUAW6gXDEIMGz8uwORIYu9gVTrmMZudw57B2UqD2pNNulqYmAz1ygbwqs6/Ja
         YUZ5AINAz+GWZuQuITCKEx+TOAshMlKRa6z6rZp5XwvCDvCHNAKT2ev7WfluArTN56te
         44bsYsF5xLEWRAXixIl0l7F8Z2D/XSzDKaEoQ45XZ35BSC9I1Y08qs9LZ90SFF0YRu5M
         vTNA==
X-Forwarded-Encrypted: i=1; AJvYcCU6zEJJpTYXyfJhw+Dg3CCQIE1mNICk+AvzTcOCqdb7f2sJy8UfD6PJ3Bon01PByNO8ncBx/7GROmqSCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrKql3pZjr9w8o+xwUhzQJZNTZQ2MPqY19VI/V8VNfulvLpa7N
	vWPgDf0HEl+tYUyVvdg/jbZ+Q45OX0Bg7Sa5uNkI4YdnzAygHZDXk10jqVUmAYh/GseODDsgITt
	ohV4ksTtbqAi8O2mW9ERm0w==
X-Google-Smtp-Source: AGHT+IH7t7zoi6yI0PaPMLOJjSIpLoHx+Um10nYrD7SAuARxjRKOSw8DIf3dxsqs6hFZHoDsSpm8PlX4hDRCbsA6SQ==
X-Received: from pgbcr9.prod.google.com ([2002:a05:6a02:4109:b0:7fd:4e21:2f5a])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d590:b0:216:7ee9:2227 with SMTP id d9443c01a7336-21778505a3cmr82109795ad.36.1733959699175;
 Wed, 11 Dec 2024 15:28:19 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:49 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-12-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 11/16] mm: sh: Introduce arch_mmap_hint()
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

Introduce sh arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/sh/include/asm/pgtable.h |  1 +
 arch/sh/mm/mmap.c             | 83 ++++++++++++++---------------------
 2 files changed, 33 insertions(+), 51 deletions(-)

diff --git a/arch/sh/include/asm/pgtable.h b/arch/sh/include/asm/pgtable.h
index 729f5c6225fb..072dbe038808 100644
--- a/arch/sh/include/asm/pgtable.h
+++ b/arch/sh/include/asm/pgtable.h
@@ -149,5 +149,6 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 /* arch/sh/mm/mmap.c */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* __ASM_SH_PGTABLE_H */
diff --git a/arch/sh/mm/mmap.c b/arch/sh/mm/mmap.c
index c442734d9b0c..ebda962e8c4e 100644
--- a/arch/sh/mm/mmap.c
+++ b/arch/sh/mm/mmap.c
@@ -51,14 +51,14 @@ static inline unsigned long COLOUR_ALIGN(unsigned long addr,
 	return base + off;
 }
 
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
-	unsigned long len, unsigned long pgoff, unsigned long flags,
-	vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
-	int do_colour_align;
-	struct vm_unmapped_area_info info = {};
+	bool do_colour_align;
+
+	if (unlikely(len > TASK_SIZE))
+		return -ENOMEM;
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -70,24 +70,29 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		return addr;
 	}
 
-	if (unlikely(len > TASK_SIZE))
-		return -ENOMEM;
+	do_colour_align = filp || (flags & MAP_SHARED);
 
-	do_colour_align = 0;
-	if (filp || (flags & MAP_SHARED))
-		do_colour_align = 1;
+	if (do_colour_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
 
-	if (addr) {
-		if (do_colour_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
 
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
+	unsigned long len, unsigned long pgoff, unsigned long flags,
+	vm_flags_t vm_flags)
+{
+	struct vm_unmapped_area_info info = {};
+	bool do_colour_align;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	do_colour_align = filp || (flags & MAP_SHARED);
 
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
@@ -102,41 +107,17 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 			  const unsigned long len, const unsigned long pgoff,
 			  const unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
 	unsigned long addr = addr0;
-	int do_colour_align;
 	struct vm_unmapped_area_info info = {};
+	bool do_colour_align;
 
-	if (flags & MAP_FIXED) {
-		/* We do not accept a shared mapping if it would violate
-		 * cache aliasing constraints.
-		 */
-		if ((flags & MAP_SHARED) &&
-		    ((addr - (pgoff << PAGE_SHIFT)) & shm_align_mask))
-			return -EINVAL;
+	/* requesting a specific address */
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
-	}
 
-	if (unlikely(len > TASK_SIZE))
-		return -ENOMEM;
-
-	do_colour_align = 0;
-	if (filp || (flags & MAP_SHARED))
-		do_colour_align = 1;
-
-	/* requesting a specific address */
-	if (addr) {
-		if (do_colour_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	do_colour_align = filp || (flags & MAP_SHARED);
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


