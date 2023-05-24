Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0693270FC7D
	for <lists+linux-alpha@lfdr.de>; Wed, 24 May 2023 19:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234572AbjEXRTD (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 24 May 2023 13:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbjEXRSu (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 24 May 2023 13:18:50 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C2712E
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:18:47 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-64d2467d640so1321759b3a.1
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684948726; x=1687540726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZpZnDLITfYtgsC1nucuMFymh0j+j6fu5jMJb91bNrI=;
        b=H1ZWKZZ/DXD9Ect+aQf5aeUp4j+KEPDTUfNnlT3jNPh2p8JtO5GH+f81fD3uzI+sDn
         HMrbn1KGuv/LU0nxnmiPRWzTPz1ho0Qsaas0NmpeQMGMDM0trEcTxErswnuFBVMlY3f0
         3ig7VQ/Wl3gVmC7EhBVKffW1+6j0/JP7tGDj+E+y1lkXhKNPeaKQrDcp7YZGmI+adzWa
         S3eZaS/Kloh8rGBnSH9qwAQvLsfQ95TMGLLrZQejrb9StqRyCI+NhYpWcJ0Xty0tdBEp
         +blbBi4PkyceTuNL/9XRydT/ywFhROnOL102q3XPPf0MQUqPLKVb/ApKmmiFvdyW2vk0
         FpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684948726; x=1687540726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZpZnDLITfYtgsC1nucuMFymh0j+j6fu5jMJb91bNrI=;
        b=Un0uMoUS5NPAY6c1h/iGZr3X7yAJxin0IMcm4XJMqfJPa3dkgzum6S9GYCcINx0h52
         yA1TIktGu8qwXvJ5Jvpn3n1OjmJWBIt98FEPUpv/4wKRdrhZoYHQYVMZ/Yqd8R7dbGky
         LOfiI+RMUUjfBHbbr0aW913OOqmFIOi6y1XmHYxtTRPvWCvBm/X6tsXdIPXvcfywq6nb
         PJm6CTCqEaz2wp8n262MeMNlEZtAdOqAxW58f5XhjwU6aUuCShjCoO0pssIyBAgKo/Dc
         kYVChd3nD/X1f2MEFTFBWKLD5921dk0bh4iu6yRiNTQZxTwoF0X+w1GSFtLP9puGZDjM
         9xkQ==
X-Gm-Message-State: AC+VfDy8XOMfA6REp5fla1/UnibSD6Eq8J/3VIkpNybfume+J9FL9Pe1
        DeUUbf3AvP8nXSNvIli4T+fskZIMeIE=
X-Google-Smtp-Source: ACHHUZ7a6jG32Cl1jw0plHWfwLQJUS3Ydh2nkx+n0m/8LCs4242G4ejNqExx3SOKkV94U2NHp7XxEg==
X-Received: by 2002:a05:6a00:2309:b0:62d:d045:392 with SMTP id h9-20020a056a00230900b0062dd0450392mr4308554pfh.32.1684948726134;
        Wed, 24 May 2023 10:18:46 -0700 (PDT)
Received: from wheely.local0.net ([220.240.241.243])
        by smtp.gmail.com with ESMTPSA id p18-20020aa78612000000b0063b7c42a070sm7698643pfn.68.2023.05.24.10.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:18:45 -0700 (PDT)
From:   Nicholas Piggin <npiggin@gmail.com>
To:     linux-alpha@vger.kernel.org
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [RFC PATCH 3/6] alpha: remove TLB flushing mm_users special case
Date:   Thu, 25 May 2023 03:18:19 +1000
Message-Id: <20230524171822.177133-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524171822.177133-1-npiggin@gmail.com>
References: <20230524171822.177133-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

With mm_cpumask, there is less reason to keep the mm_users special case
in the TLB flushing code, because IPIs will be filtered out by the mask.

These special cases are another complicated set of races e.g., vs
kthread_use_mm that make this code tricky to reason about.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/alpha/kernel/smp.c | 68 +++++++++--------------------------------
 1 file changed, 15 insertions(+), 53 deletions(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index b702372fbaba..e436c056267d 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -639,23 +639,6 @@ ipi_flush_tlb_mm(void *x)
 void
 flush_tlb_mm(struct mm_struct *mm)
 {
-	preempt_disable();
-
-	if (mm == current->active_mm) {
-		flush_tlb_current(mm);
-		if (atomic_read(&mm->mm_users) <= 1) {
-			int cpu, this_cpu = smp_processor_id();
-			for (cpu = 0; cpu < NR_CPUS; cpu++) {
-				if (!cpu_online(cpu) || cpu == this_cpu)
-					continue;
-				if (mm->context[cpu])
-					mm->context[cpu] = 0;
-			}
-			preempt_enable();
-			return;
-		}
-	}
-
 	/*
 	 * TLB flush IPIs will be sent to all CPUs with mm_cpumask set. The
 	 * problem of ordering the load of mm_cpumask vs a CPU switching to
@@ -666,8 +649,12 @@ flush_tlb_mm(struct mm_struct *mm)
 	 * The other side is switch_mm.
 	 */
 	smp_mb();
+	preempt_disable();
+	if (mm == current->active_mm)
+		flush_tlb_current(mm);
+	else
+		flush_tlb_other(mm);
 	smp_call_function_many(mm_cpumask(mm), ipi_flush_tlb_mm, mm, 1);
-
 	preempt_enable();
 }
 EXPORT_SYMBOL(flush_tlb_mm);
@@ -696,30 +683,17 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 	struct flush_tlb_page_struct data;
 	struct mm_struct *mm = vma->vm_mm;
 
-	preempt_disable();
-
-	if (mm == current->active_mm) {
-		flush_tlb_current_page(mm, vma, addr);
-		if (atomic_read(&mm->mm_users) <= 1) {
-			int cpu, this_cpu = smp_processor_id();
-			for (cpu = 0; cpu < NR_CPUS; cpu++) {
-				if (!cpu_online(cpu) || cpu == this_cpu)
-					continue;
-				if (mm->context[cpu])
-					mm->context[cpu] = 0;
-			}
-			preempt_enable();
-			return;
-		}
-	}
-
 	data.vma = vma;
 	data.mm = mm;
 	data.addr = addr;
 
 	smp_mb(); /* see flush_tlb_mm */
+	preempt_disable();
+	if (mm == current->active_mm)
+		flush_tlb_current_page(mm, vma, addr);
+	else
+		flush_tlb_other(mm);
 	smp_call_function_many(mm_cpumask(mm), ipi_flush_tlb_page, &data, 1);
-
 	preempt_enable();
 }
 EXPORT_SYMBOL(flush_tlb_page);
@@ -751,24 +725,12 @@ flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
 	if ((vma->vm_flags & VM_EXEC) == 0)
 		return;
 
+	smp_mb(); /* see flush_tlb_mm */
 	preempt_disable();
-
-	if (mm == current->active_mm) {
+	if (mm == current->active_mm)
 		__load_new_mm_context(mm);
-		if (atomic_read(&mm->mm_users) <= 1) {
-			int cpu, this_cpu = smp_processor_id();
-			for (cpu = 0; cpu < NR_CPUS; cpu++) {
-				if (!cpu_online(cpu) || cpu == this_cpu)
-					continue;
-				if (mm->context[cpu])
-					mm->context[cpu] = 0;
-			}
-			preempt_enable();
-			return;
-		}
-	}
-
-	smp_call_function(ipi_flush_icache_page, mm, 1);
-
+	else
+		flush_tlb_other(mm);
+	smp_call_function_many(mm_cpumask(mm), ipi_flush_icache_page, mm, 1);
 	preempt_enable();
 }
-- 
2.40.1

