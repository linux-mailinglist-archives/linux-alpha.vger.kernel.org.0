Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4E970FC7B
	for <lists+linux-alpha@lfdr.de>; Wed, 24 May 2023 19:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbjEXRSu (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 24 May 2023 13:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbjEXRSq (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 24 May 2023 13:18:46 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690BBE9
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:18:43 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d2b42a8f9so939723b3a.3
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684948722; x=1687540722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aW9dB57BRIB+tjdJ7Y8Up9BA4aWey7gcj2dYPEDbFFQ=;
        b=N/qKjDV0ec1hJ6kIeRIqEf84nR0Q0oKM9z2nw6N2zPnkdaLXANSxBJvtAguzS7pm9N
         F4Bvf6RZVgE7SKyqoMBuD88j+IwtJKALTT2OF43whgvd5Yzyt46An/7oIIJaP+pKql2q
         C/Oso2yWRYfVyLZRVitiIe+B+YlUGIoL9uHQ4+QPDJjljcVxD5B6A6v8Oz3g410UeLxX
         vpQ0sU9n1NGHA6y5I/CoNc6M2gVUgf7FP9tx7wR04UtpfhDuR7xc6uoq/l70Ej0QNj22
         Mh5+USK3VYYitH63Jr9BD5mbNXTBwIJJiWCEB01vr2SDzjeBImoyKA5WN3jtM5ZT8NJR
         O5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684948722; x=1687540722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aW9dB57BRIB+tjdJ7Y8Up9BA4aWey7gcj2dYPEDbFFQ=;
        b=GcegBBtBxNkKiWuyFSr+3atQOmNGSEOISIg6eI2qbvHQdq90N1bQOAj+GLBerJSE8Y
         Y0/3ksYyc02LwAGph1LGQlwidgyyGpcVQGLjWa6oviBHHfEd2L7YmZk/1tGjBQflw4dg
         LH+X3FBcG+y7sJfsSG1gYrBlHoEOPUVkzz8yajJ8/jbQn4eWzGpKVPfIRJIMrNZYXr9M
         FrbJrC9JtYKnDVXUmYw28gXXxybS6XDM896Ah4DgP4bmQzQZee7EqMKtkQ4Hj3hDNQC4
         QK5eTCwSmfTLMhbIxsVJ5U3AcW99McNlL7EaVBhLqnRyCNIltYzR5sSAbw0PZwMVcoGH
         hulA==
X-Gm-Message-State: AC+VfDxor2h/Ku3B1/DFdlP6D7qKL9886+o3RbEiRgl8NnYa6TovOVFr
        IodDXY7+7Yc7zWxEO7vIgHrRCaOYMMU=
X-Google-Smtp-Source: ACHHUZ7WIYKRlK4pkei+MzvOWgZL4mBX4djlWM8EIgpZ9LB6nN3Rrz/qSyFw15gm9xtx+HrtwdH42Q==
X-Received: by 2002:a05:6a20:2450:b0:10c:d3e5:1953 with SMTP id t16-20020a056a20245000b0010cd3e51953mr5558929pzc.3.1684948722525;
        Wed, 24 May 2023 10:18:42 -0700 (PDT)
Received: from wheely.local0.net ([220.240.241.243])
        by smtp.gmail.com with ESMTPSA id p18-20020aa78612000000b0063b7c42a070sm7698643pfn.68.2023.05.24.10.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:18:42 -0700 (PDT)
From:   Nicholas Piggin <npiggin@gmail.com>
To:     linux-alpha@vger.kernel.org
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [RFC PATCH 2/6] alpha: implement simple mm_cpumask TLB flush filter
Date:   Thu, 25 May 2023 03:18:18 +1000
Message-Id: <20230524171822.177133-3-npiggin@gmail.com>
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

Implement a sticky mm_cpumask and use it to filter TLB flush IPIs.
Sticky meaning that when an mm runs on a CPU, it gets set in the mask
and never goes away. This is the "base" mm_cpumask implementation that
comes with the least complexity.

This reduces IPIs booting into a small rootfs by about 10-15% on 4CPU
system.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/alpha/include/asm/mmu_context.h | 19 +++++++++++++++++++
 arch/alpha/kernel/smp.c              | 16 ++++++++++++++--
 arch/alpha/mm/init.c                 |  2 ++
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index 8ce89350e4b3..9c9e9a8c01a4 100644
--- a/arch/alpha/include/asm/mmu_context.h
+++ b/arch/alpha/include/asm/mmu_context.h
@@ -135,6 +135,21 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 #ifdef CONFIG_SMP
 	cpu_data[cpu].asn_lock = 1;
 	barrier();
+
+	if (!cpumask_test_cpu(cpu, mm_cpumask(next_mm))) {
+		cpumask_set_cpu(cpu, mm_cpumask(next_mm));
+		/*
+		 * Store to mm_cpumask must be visible to CPUs performing
+		 * TLB flushes before memory accesses that could bring in
+		 * new TLB entries. This orders the store above with the
+		 * load of the new context and subsequent loads of PTEs
+		 * that can then be cached in the TLB.
+		 *
+		 * The other side is in the mm_cpumask testing in TLB
+		 * flush.
+		 */
+		smp_mb();
+	}
 #endif
 	asn = cpu_last_asn(cpu);
 	mmc = next_mm->context[cpu];
@@ -151,6 +166,8 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	   a new mm->context (via flush_tlb_mm) without the ASN serial
 	   number wrapping.  We have no way to detect when this is needed.  */
 	task_thread_info(next)->pcb.asn = mmc & HARDWARE_ASN_MASK;
+
+	WARN_ON(!cpumask_test_cpu(cpu, mm_cpumask(prev_mm)));
 }
 
 static inline void
@@ -195,12 +212,14 @@ do {								\
 static inline void
 ev5_activate_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm)
 {
+	cpumask_set_cpu(smp_processor_id(), mm_cpumask(next_mm));
 	__load_new_mm_context(next_mm);
 }
 
 static inline void
 ev4_activate_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm)
 {
+	cpumask_set_cpu(smp_processor_id(), mm_cpumask(next_mm));
 	__load_new_mm_context(next_mm);
 	tbiap();
 }
diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 7439b2377df5..b702372fbaba 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -145,6 +145,7 @@ smp_callin(void)
 	/* All kernel threads share the same mm context.  */
 	mmgrab(&init_mm);
 	current->active_mm = &init_mm;
+	cpumask_set_cpu(smp_processor_id(), mm_cpumask(&init_mm));
 
 	/* inform the notifiers about the new cpu */
 	notify_cpu_starting(cpuid);
@@ -655,7 +656,17 @@ flush_tlb_mm(struct mm_struct *mm)
 		}
 	}
 
-	smp_call_function(ipi_flush_tlb_mm, mm, 1);
+	/*
+	 * TLB flush IPIs will be sent to all CPUs with mm_cpumask set. The
+	 * problem of ordering the load of mm_cpumask vs a CPU switching to
+	 * the mm and caching a translation from a PTE being invalidated and
+	 * flushed here means we must have a memory barrier. This orders the
+	 * prior stores to invalidate the PTEs from the load of mm_cpumask.
+	 *
+	 * The other side is switch_mm.
+	 */
+	smp_mb();
+	smp_call_function_many(mm_cpumask(mm), ipi_flush_tlb_mm, mm, 1);
 
 	preempt_enable();
 }
@@ -706,7 +717,8 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 	data.mm = mm;
 	data.addr = addr;
 
-	smp_call_function(ipi_flush_tlb_page, &data, 1);
+	smp_mb(); /* see flush_tlb_mm */
+	smp_call_function_many(mm_cpumask(mm), ipi_flush_tlb_page, &data, 1);
 
 	preempt_enable();
 }
diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index a155180d7a83..33f4c0abd2c8 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -254,6 +254,8 @@ void __init paging_init(void)
 
 	/* Initialize the kernel's ZERO_PGE. */
 	memset(absolute_pointer(ZERO_PGE), 0, PAGE_SIZE);
+
+	cpumask_set_cpu(raw_smp_processor_id(), mm_cpumask(&init_mm));
 }
 
 #if defined(CONFIG_ALPHA_GENERIC) || defined(CONFIG_ALPHA_SRM)
-- 
2.40.1

