Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCD270FC7E
	for <lists+linux-alpha@lfdr.de>; Wed, 24 May 2023 19:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233929AbjEXRTJ (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 24 May 2023 13:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232688AbjEXRTD (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 24 May 2023 13:19:03 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B1C1A8
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:18:51 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-64d24136663so921178b3a.0
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684948730; x=1687540730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/fgyjon/AwniOTHg0dz2YdYyh8X90uD3//N5gexQS8=;
        b=YqpyVFlp/d4Lx0SsnRQaqESTcuqAxtY+z/G3hBNpzdk9qAI2rrOTjXfwVNHLGPXSvW
         3D0Lg85VlDAGr5Vnz+eQJVtRS95S3puj09RSyQOiQ8vVLLIAW4pXT8Ia4shdQxpL3gPX
         RWkt8ncOZfb+qZ9bNAmW2ylYiuhjfd9j7MI7w+CQJQRw3+kr/KFzMudlUmpUBjmsz7po
         CjxXSPag109m5qiOvHPiKgjJCPQZpni8RSbg9YWnUEo11o9vAyVYgbF6BuG4wV1sPupN
         wMNsWKEYQTvcds+DKgNl2indi8YjTy20ygnH2ojIzTgxOimL45fZKpdQ1+MdNPXJj0nU
         k8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684948730; x=1687540730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/fgyjon/AwniOTHg0dz2YdYyh8X90uD3//N5gexQS8=;
        b=jcoYzJGf5iW0rxnctQny5H/hA9t97LVsNrlFkQ7BtVBdaqS6U74obLlnHaK05G2Ufv
         AiFycr47PeZbv9SPY1X7LVaDyeEczWyM6moFS3WNudsnF+27qSstiO+oqrucIAeIybZP
         00jlp99bbn1Vn94TTRlj0AcuDz+7vTvCk65g7lIILac4ekx3mqT8XD1FuDez1MkgdA6K
         s2FC0Il1baHf3+yJnweb0h2Dr+KXRR8a2t5MzTFN309eKfF/9nTFs2b43FuHPfKYy7gE
         vkHu4PqJfNp1qSl6PQMcQ2vT6tYfj3drMhrc84EO+4uPOxU0N5MILoyAijy7Fc1L8jxo
         eRKQ==
X-Gm-Message-State: AC+VfDzqpfRT7PiJChKH+Nm2cWMoQjDo5LVJn3FZXRrH0ZfE08ZFSEdv
        gylRsK/GdTXswjEKXHH1Wg0Q0SbhfTM=
X-Google-Smtp-Source: ACHHUZ6HfFMFc/d2v/oxxEl7VwRE3rz6SMQJRQmkBlNQx0dOwei0qqk9Cb1kUv651OIxHM2p6JepSg==
X-Received: by 2002:a05:6a00:a1a:b0:64a:f8c9:a421 with SMTP id p26-20020a056a000a1a00b0064af8c9a421mr5257909pfh.32.1684948730012;
        Wed, 24 May 2023 10:18:50 -0700 (PDT)
Received: from wheely.local0.net ([220.240.241.243])
        by smtp.gmail.com with ESMTPSA id p18-20020aa78612000000b0063b7c42a070sm7698643pfn.68.2023.05.24.10.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:18:49 -0700 (PDT)
From:   Nicholas Piggin <npiggin@gmail.com>
To:     linux-alpha@vger.kernel.org
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [RFC PATCH 4/6] alpha: clean mm_cpumask when flushing TLBs
Date:   Thu, 25 May 2023 03:18:20 +1000
Message-Id: <20230524171822.177133-5-npiggin@gmail.com>
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

mm_cpumask is a map of the CPUs which must be IPIed to flush TLBs,
and/or IPIed to shootdown lazy TLB mms at exit time.

When flushing TLBs on the CPU, trim it from mm_cpumask if the mm is not
currently active on the CPU. TLBs will have been flush, and the mm is
not active, so there is no more reason to get IPIs.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/alpha/include/asm/tlbflush.h |  3 +++
 arch/alpha/kernel/smp.c           | 29 +++++++++++++++++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/tlbflush.h b/arch/alpha/include/asm/tlbflush.h
index 94dc37cf873a..7c4e719ac9e7 100644
--- a/arch/alpha/include/asm/tlbflush.h
+++ b/arch/alpha/include/asm/tlbflush.h
@@ -12,6 +12,7 @@
 #endif
 
 extern void __load_new_mm_context(struct mm_struct *);
+extern void try_clear_mm_cpumask(struct mm_struct *);
 
 
 /* Use a few helper functions to hide the ugly broken ASN
@@ -106,6 +107,7 @@ static inline void flush_tlb_all(void)
 static inline void
 flush_tlb_mm(struct mm_struct *mm)
 {
+	try_clear_mm_cpumask(mm);
 	if (mm == current->active_mm)
 		flush_tlb_current(mm);
 	else
@@ -118,6 +120,7 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
 	struct mm_struct *mm = vma->vm_mm;
 
+	try_clear_mm_cpumask(mm);
 	if (mm == current->active_mm)
 		flush_tlb_current_page(mm, vma, addr);
 	else
diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index e436c056267d..d668b9d319af 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -610,6 +610,28 @@ smp_imb(void)
 }
 EXPORT_SYMBOL(smp_imb);
 
+#define asn_locked() (cpu_data[smp_processor_id()].asn_lock)
+
+/*
+ * If the mm_cpumask bit is cleared, the caller *must* flush the TLB for the
+ * mm on this CPU. It is only cleared when the mm is not active, in which
+ * case the flushing always performs flush_tlb_other that flushes everything.
+ * If that changes in callers, they will have to arrange to always do a full
+ * flush if mm_cpumask is cleared by this function.
+ */
+void
+try_clear_mm_cpumask(struct mm_struct *mm)
+{
+	int cpu;
+
+	if (current->active_mm == mm || asn_locked())
+		return;
+
+	cpu = smp_processor_id();
+	if (cpumask_test_cpu(cpu, mm_cpumask(mm)))
+		cpumask_clear_cpu(cpu, mm_cpumask(mm));
+}
+
 static void
 ipi_flush_tlb_all(void *ignored)
 {
@@ -624,12 +646,12 @@ flush_tlb_all(void)
 	on_each_cpu(ipi_flush_tlb_all, NULL, 1);
 }
 
-#define asn_locked() (cpu_data[smp_processor_id()].asn_lock)
-
 static void
 ipi_flush_tlb_mm(void *x)
 {
 	struct mm_struct *mm = x;
+
+	try_clear_mm_cpumask(mm);
 	if (mm == current->active_mm && !asn_locked())
 		flush_tlb_current(mm);
 	else
@@ -671,6 +693,7 @@ ipi_flush_tlb_page(void *x)
 	struct flush_tlb_page_struct *data = x;
 	struct mm_struct * mm = data->mm;
 
+	try_clear_mm_cpumask(mm);
 	if (mm == current->active_mm && !asn_locked())
 		flush_tlb_current_page(mm, data->vma, data->addr);
 	else
@@ -710,6 +733,8 @@ static void
 ipi_flush_icache_page(void *x)
 {
 	struct mm_struct *mm = (struct mm_struct *) x;
+
+	try_clear_mm_cpumask(mm);
 	if (mm == current->active_mm && !asn_locked())
 		__load_new_mm_context(mm);
 	else
-- 
2.40.1

