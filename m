Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5759F70FC80
	for <lists+linux-alpha@lfdr.de>; Wed, 24 May 2023 19:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233629AbjEXRTW (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 24 May 2023 13:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235779AbjEXRTI (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 24 May 2023 13:19:08 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956FEE5B
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:18:59 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64d2e8a842cso911675b3a.3
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684948738; x=1687540738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4zFZrNoBN7VmAO1selbkqGP4to7smKZ8JOAFepzbeA=;
        b=ZDueHHRfLWIs9BABd7MhLFNcW2S0IRxmKCRr8dfgqxSaTEGbJw2zJ9rpzyIqlJpzTc
         IVcCJyZXUjl/cuLXido/nVL8BBc+qEnrN+pKlYuEvKcWQFGQCFiJ4tMOBclDISXfIoO8
         l8aXBFZ4YSrFBR+bSsqR42b/I54L7XZ15ftS6laMcX/SkrWTmb82IISpplDBxbh1bVyZ
         kj2/UxwvmzC3oddV6k68tGZ2h/FApgd9D6ggI0FjZ//yojq1X4WLKKTeVaYNTe+3ZqhS
         Esy/9HOj3OI1UepnxZNRfglJbcS9kiu5wlzawBna1DIZLhe0jv3murYgw+qyffGwECGS
         1x5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684948738; x=1687540738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4zFZrNoBN7VmAO1selbkqGP4to7smKZ8JOAFepzbeA=;
        b=Nl+70Lh0vgEaW8kXwR0H6UJgh7BkEm7zg5aWkTcJ9WTV/74J9dPrUhT4U5QBppvTfv
         5kc4g6MGbQZHZmpYHyDcUjCD8VsUEffU3aVc22/F1fGyyPdHFUdGCrUc1FSiK7bAw1v0
         0OCSdiBXjcpAX7FNfJZuu0zJA8bVj6TmDZdc+CA1Hu/RC2xUJe0+dMqy6R+sPvLApYts
         NnTz4GMYAAIiwg7akfxExFYOOHoPC46s6nr7nR6+rEMSQi4ZyaYLE0+3BwFk2K1x3+4F
         qmUNUdZJaBebmtrBxgvRx1Qfd1xH+M+j8msAYUoBzjOtp+l4geI9NTtemQkKSCKMn9fg
         pZJw==
X-Gm-Message-State: AC+VfDxnWvAhjSVubxEcIHx4TRWvvARl4CMketZ0EhyF84BkmPFjllgy
        oucc0c5fzJn8ig7R2A52Emys4MN08n4=
X-Google-Smtp-Source: ACHHUZ5aq+qzxZwYhRwXy9e2IjDAmKZxrmNsSkjkVlbYUfJgNbo20p5Z9kvrzgBykqySxq91d91lKQ==
X-Received: by 2002:a05:6a00:15cf:b0:643:b263:404 with SMTP id o15-20020a056a0015cf00b00643b2630404mr5071635pfu.33.1684948738586;
        Wed, 24 May 2023 10:18:58 -0700 (PDT)
Received: from wheely.local0.net ([220.240.241.243])
        by smtp.gmail.com with ESMTPSA id p18-20020aa78612000000b0063b7c42a070sm7698643pfn.68.2023.05.24.10.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:18:57 -0700 (PDT)
From:   Nicholas Piggin <npiggin@gmail.com>
To:     linux-alpha@vger.kernel.org
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [RFC PATCH 6/6] alpha: shoot the lazy tlb mm when flushing TLBs
Date:   Thu, 25 May 2023 03:18:22 +1000
Message-Id: <20230524171822.177133-7-npiggin@gmail.com>
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

Since we're flushing the TLB, take the opportunity to switch away from
a lazy tlb mm if it's active, allowing the CPU to be taken out of
mm_cpumask and avoiding any further IPIs from TLB flushing or the final
lazy tlb mm shootdown.

This naturally combines lazy tlb mm shootdowns with the final exit TLB
flush IPIs, reducing the need for additional IPIs for the lazy tlb mm
shootdown.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/alpha/kernel/smp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 73bbb81f336e..cccd5ef721b7 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -624,9 +624,18 @@ try_clear_mm_cpumask(struct mm_struct *mm)
 {
 	int cpu;
 
-	if (current->active_mm == mm || asn_locked())
+	if (current->mm == mm || asn_locked())
 		return;
 
+	/*
+	 * Shoot the lazy tlb mm while we're here. This allows us to also
+	 * trim it out of the mm_cpumask if it was the active_mm, and has the
+	 * effect of avoiding final lazy shootdown IPIs in cleanup_lazy_tlbs(),
+	 * because the final TLB cleanup happens before that.
+	 */
+	if (current->active_mm == mm)
+		kthread_end_lazy_tlb_mm();
+
 	cpu = smp_processor_id();
 	if (cpumask_test_cpu(cpu, mm_cpumask(mm)))
 		cpumask_clear_cpu(cpu, mm_cpumask(mm));
-- 
2.40.1

