Return-Path: <linux-alpha+bounces-1640-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 595529EA5A9
	for <lists+linux-alpha@lfdr.de>; Tue, 10 Dec 2024 03:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DDF918840EA
	for <lists+linux-alpha@lfdr.de>; Tue, 10 Dec 2024 02:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D061F63ED;
	Tue, 10 Dec 2024 02:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jXDVKwz2"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A22A1D8A16
	for <linux-alpha@vger.kernel.org>; Tue, 10 Dec 2024 02:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798504; cv=none; b=P2MuzqHfKeU0e7EKfdJLYYydCZGSmst0muNuWoKKVuzmIwceMKA7r/GENQ6OeWJ7TCBI4IVIhsqPunoYdD/TFhVE2/IL0vM6pWKJaZ/9Zcd+5YcJNWfQHuFC5rq8s9Mn4mqMlkQroX+d8zFYLvat5Dgjstl5U2khWSV/PzGcMIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798504; c=relaxed/simple;
	bh=YQNhhHXT9hyTrt6apZYYX7TOornK2CckVq9q4j85xZI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FinPbgGIj5MfxEpYoOfDVQw1IYYRr1MzWzc6YINjm/7znV91GflH6xrreTvO6TOWMZOIGFecRS7E9d+czUqHnAs94u2dgldUwW6Fq+4CmyUULVq2m1GAHpbK1ChGxKHmSy21sHMZlcwEhcupky3F3zWI9EYhs32K7d2utxZXUbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jXDVKwz2; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef775ec883so2673311a91.1
        for <linux-alpha@vger.kernel.org>; Mon, 09 Dec 2024 18:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798502; x=1734403302; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7OiWBktXHvnpSQLcvIs2hf981HtU8PP2N6UjUFZYaM8=;
        b=jXDVKwz2fIqvxVbl3zexCiGJ81OZOqGEtDnUqZOX/kWSQQw4FnIhouauVwFHub3y3V
         0y4wQccd/T50ti+TVpMdPzMwgkUyrzq9pNxoxLnA61K6p89yZqTar4ParG9wbZOMYu03
         0KwwdbEPQYM7njWA4N2QzpwWPBVI/zs1UVw43paxwDTgU3GPQMObRsnRQIM7PLOnoIEy
         3/1u6+VBLPyt1A4pBljJaV4mrqmjZd9JJJssoZSNx7a0+6jmv3h9dSm9GzR6UHOpDNAQ
         Efed5IwQJi4k274pdVZgws46cVXHP4nEPdBljxWfSH/3lMWMkfoIcS80iSfa92X4oCtb
         6e5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798502; x=1734403302;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7OiWBktXHvnpSQLcvIs2hf981HtU8PP2N6UjUFZYaM8=;
        b=Mc1iuS3VpjLZhb/CzgAmjTORVZfIcMSzGL68fI3a15ElXldkgE5eTmWZVJ+dhY8bZp
         j+ZC/Nz5BXrqGaJLIEpGibFKTsmbngxbsAJzUkOxM/zJJ89IeqBOrB/jBKIzqwSM6lDP
         WybT00MWFPWO6yCZdcOraaCr9xPc274M36QjynB+8l+6B+dMHaKzrV+uMhh5edmp+GMR
         Jcy/GX++x6byMkn+dVFYDHbh9wbsIhukl7p0l7W6ElPVZlAFVdorDYWaVlghmAAJoD/L
         6mIMEIG/SAFySonjplemRsuigioWl58UTb/D04i8rPwWzbHhS8ExEe99XGULAVPcVhk/
         oxfA==
X-Forwarded-Encrypted: i=1; AJvYcCUq0wi4wh3qP9JOxg/BPBiLY93ww4Txhotepw+77r35w5LKSSkMKt515wwGt2msoYyxHCSFQZq7ZwGL0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhUx24mPkZmCqBfnpSFyks4k1VK3EGHUZc6d2df5V1nTjmpeUw
	yRG/Q1LcgpZ40cszigjfOGrWwH2CoSJKD2YGtDPmPLetMapEjv/x9NzY20YtQH/Tial9BQ0My3L
	h/XrxjiXXa8ONmIsPLS9Fag==
X-Google-Smtp-Source: AGHT+IHGYo+0xZ93dmqZHCUo2fH2lASnlYW3/982jLUqUj3uy5rS3NmT8SEwDvEmCBiRAIKAMZxd1Te/85r8WkWevA==
X-Received: from pjbqi10.prod.google.com ([2002:a17:90b:274a:b0:2ea:3a1b:f493])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a91:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-2efcf127449mr4419672a91.10.1733798501710;
 Mon, 09 Dec 2024 18:41:41 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:12 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-11-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 10/17] mm: s390: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com
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

Introduce s390 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/s390/include/asm/pgtable.h |  1 +
 arch/s390/mm/mmap.c             | 32 ++++++++++++++++----------------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 48268095b0a3..eaecb558ab9b 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1997,6 +1997,7 @@ extern void s390_reset_cmma(struct mm_struct *mm);
 /* s390 has a private copy of get unmapped area to deal with cache synonyms */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #define pmd_pgtable(pmd) \
 	((pgtable_t)__va(pmd_val(pmd) & -sizeof(pte_t)*PTRS_PER_PTE))
diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
index 33f3504be90b..3f82401b77cd 100644
--- a/arch/s390/mm/mmap.c
+++ b/arch/s390/mm/mmap.c
@@ -83,12 +83,21 @@ static int get_align_mask(struct file *filp, unsigned long flags)
 	return 0;
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	if (len > TASK_SIZE - mmap_min_addr)
+		return 0;
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 				     unsigned long len, unsigned long pgoff,
 				     unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 
 	if (len > TASK_SIZE - mmap_min_addr)
@@ -97,13 +106,9 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (flags & MAP_FIXED)
 		goto check_asce_limit;
 
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr && addr >= mmap_min_addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			goto check_asce_limit;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		goto check_asce_limit;
 
 	info.length = len;
 	info.low_limit = mm->mmap_base;
@@ -123,7 +128,6 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 					     unsigned long len, unsigned long pgoff,
 					     unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
 	struct vm_unmapped_area_info info = {};
 
@@ -135,13 +139,9 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 		goto check_asce_limit;
 
 	/* requesting a specific address */
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr && addr >= mmap_min_addr &&
-				(!vma || addr + len <= vm_start_gap(vma)))
-			goto check_asce_limit;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		goto check_asce_limit;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


