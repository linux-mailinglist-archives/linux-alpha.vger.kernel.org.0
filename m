Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C809370FC78
	for <lists+linux-alpha@lfdr.de>; Wed, 24 May 2023 19:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbjEXRSn (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 24 May 2023 13:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbjEXRSm (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 24 May 2023 13:18:42 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFBFC130
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:18:39 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-64d3bc502ddso1349652b3a.0
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684948719; x=1687540719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErBiScfzJ/3xiKxznskKuvERy9jtasoKBcxxPGITvYY=;
        b=AT7CwRECFJ9o82eR3kZBX1xYlgc1fWJHelTyG7NQGCb9ZwbpFDGClHFOcIz5IbYHY1
         xIDSDfwFzd3PEFuuzKKcMeAjp4fzNXQh65oybC1v1pdKmP/Kdk+XKWpSU8w3lfAER8Eb
         v9GjAlclsK0PA5XxUjG4lmI5R/juD6W2CRbTfHgus6MDT+MQGmLFGrDMPAtZwuDZoRrs
         BYTVGm4YN8HIxarEAuCsj1HgoG0qn3wsvClNnvrYsBqw49PpaMPpvf9WtulpHnReij6n
         DV5N9SvfZDSHSSRlP+r+0GPLBgdyCTR4WvuvT4KG70/embNFTYWF6eeor2Qc5CzfBXWh
         dK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684948719; x=1687540719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErBiScfzJ/3xiKxznskKuvERy9jtasoKBcxxPGITvYY=;
        b=EA0YtXx4oKZPatSYbCd0arrrNfPpdDONEYPZZ2wlU8xAy1Icugjk28o0VF04E62+vi
         V7l0p80JlMAIpYc0ncOxlYhJiChPx4sURufxg63WnFx0wPWa0Tz4vE7qn7NjE84XrZuw
         WV4D9ZQJVCZnIYAB/Yr7p0CO7hhdLVVgHsfDujCQZ9qkQgfMVC19UmluRI5WTbSpTrPK
         dEZbkp5/LBi0zYC2zgQ9Pio5omfNeFD/dtN/+0ggpWk2ivjdkeLgYdEA1/c8RPEf1ZId
         n0EsRmWsusv3RJOCNm2KiBMzKJIfUTPUCw2b2a9tnQ/rfdf9NctrztF71CkG7juo/LqM
         bu6A==
X-Gm-Message-State: AC+VfDx9jpQb5tuFVl/0KoG/z1XZD/TidQZ2YK8A4IWM7CSwoC+yC6yQ
        VOI7Yt8KgrVSLAMz/ihNoIjusEy3j8k=
X-Google-Smtp-Source: ACHHUZ5/86Q+50qTqZwv/0n2eC0HozAYSG123ohMNQ7XYodiiqx5sDsNGOSlnELI1CyoB6WebjtHHg==
X-Received: by 2002:a05:6a00:1503:b0:63d:24d0:2c32 with SMTP id q3-20020a056a00150300b0063d24d02c32mr4841910pfu.33.1684948718856;
        Wed, 24 May 2023 10:18:38 -0700 (PDT)
Received: from wheely.local0.net ([220.240.241.243])
        by smtp.gmail.com with ESMTPSA id p18-20020aa78612000000b0063b7c42a070sm7698643pfn.68.2023.05.24.10.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:18:38 -0700 (PDT)
From:   Nicholas Piggin <npiggin@gmail.com>
To:     linux-alpha@vger.kernel.org
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [RFC PATCH 1/6] alpha: remove extern inline from mmu_context
Date:   Thu, 25 May 2023 03:18:17 +1000
Message-Id: <20230524171822.177133-2-npiggin@gmail.com>
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

This caused a pain when working on alpha, and extern inlines aren't
really used these days (outside alpha), so remove them from mmu_context.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/alpha/include/asm/mmu_context.h | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index 4eea7c616992..8ce89350e4b3 100644
--- a/arch/alpha/include/asm/mmu_context.h
+++ b/arch/alpha/include/asm/mmu_context.h
@@ -20,11 +20,7 @@
  * table pointer or when we update the ASN of the current process.
  */
 
-/* Don't get into trouble with dueling __EXTERN_INLINEs.  */
-#ifndef __EXTERN_INLINE
 #include <asm/io.h>
-#endif
-
 
 static inline unsigned long
 __reload_thread(struct pcb_struct *pcb)
@@ -112,12 +108,7 @@ extern unsigned long last_asn;
  * run.
  */
 
-#ifndef __EXTERN_INLINE
-#define __EXTERN_INLINE extern inline
-#define __MMU_EXTERN_INLINE
-#endif
-
-extern inline unsigned long
+static inline unsigned long
 __get_new_mm_context(struct mm_struct *mm, long cpu)
 {
 	unsigned long asn = cpu_last_asn(cpu);
@@ -132,7 +123,7 @@ __get_new_mm_context(struct mm_struct *mm, long cpu)
 	return next;
 }
 
-__EXTERN_INLINE void
+static inline void
 ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	      struct task_struct *next)
 {
@@ -162,7 +153,7 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	task_thread_info(next)->pcb.asn = mmc & HARDWARE_ASN_MASK;
 }
 
-__EXTERN_INLINE void
+static inline void
 ev4_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	      struct task_struct *next)
 {
@@ -201,13 +192,13 @@ do {								\
 #define check_mmu_context()  do { } while(0)
 #endif
 
-__EXTERN_INLINE void
+static inline void
 ev5_activate_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm)
 {
 	__load_new_mm_context(next_mm);
 }
 
-__EXTERN_INLINE void
+static inline void
 ev4_activate_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm)
 {
 	__load_new_mm_context(next_mm);
@@ -251,9 +242,4 @@ enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
 
 #include <asm-generic/mmu_context.h>
 
-#ifdef __MMU_EXTERN_INLINE
-#undef __EXTERN_INLINE
-#undef __MMU_EXTERN_INLINE
-#endif
-
 #endif /* __ALPHA_MMU_CONTEXT_H */
-- 
2.40.1

