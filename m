Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BED5070FC7F
	for <lists+linux-alpha@lfdr.de>; Wed, 24 May 2023 19:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbjEXRTN (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 24 May 2023 13:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbjEXRTG (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 24 May 2023 13:19:06 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B94E46
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:18:55 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64d30ab1f89so906107b3a.3
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684948734; x=1687540734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjn6EdAl09CUVOfjtVI6BOYTWM3WknCj5waV1jTxDBs=;
        b=FEle1APVRzL697qNwmsE1rCHmb1YKkQEoVCxUN0/9vtN6/Tb/lUTJ873/S2zMh164U
         v2kgmVJZ8GBqkSN+BklYabiOgTM+okVz1WAqPcmEmWrUEpSXFvUI2dOBnexmUrfWeHPE
         i9uFGU/Lk87J2RxlPd+0asFb4McwiNkfTbNxNcmBUitj/eiDZpztgdG2Bdu+NrQVkWxm
         9EhiYL23rIxR4r/SQa4DyHyk48QoGcjCsGD8lo4wqPVaq77RrOhsfzCj3K1/5o6xFVkE
         Lt4WdGOfM0QeuBAh7nL/tx9f2/Ir2DZ1jTMjheXz8xfxu+y4pMImseR2VQt3ZrYXX2n+
         MPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684948734; x=1687540734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjn6EdAl09CUVOfjtVI6BOYTWM3WknCj5waV1jTxDBs=;
        b=jCg1zH51b6NCEPD3xpqzVjArP4Xv1HkcIpdTcavK0LozLzFR9/7/Wz0gG7rbzcHpFh
         TmTqozRDLRUSP4bKJPt4tlJZJmdgK8FNY0JhhlBOVe+tomed1YpKw+/fIAhupvW0NdIc
         ADWKKWDdo1ri1cxN/xxfzwP94Bm+T6tPtQWTZCfdZhuK0AJ6RafAAGnV996v4vyg45Qz
         2ELjzrUKnJTN7F0qRBvP51u1ph5rXkE3yncoT6inG624vhKlW1oWthpFMbgkUHQKhePx
         IbZ0RsrNBj3mpcRFB44H+4rCPSjH382+YOV4Dd1anmQmmwjKlyKkuPtqOMVskJThkCKQ
         tNuw==
X-Gm-Message-State: AC+VfDw4thmfz+/KSOKAZCvbRh3GCxA4MG9j3AIsjly2P2GDBE2rpqAh
        RNj7wg9cllLpFpvmxloWFTJTcHIpn4o=
X-Google-Smtp-Source: ACHHUZ4c9vye8atu1XbJpgiS8oBbbxTDY6kF+nKtVnghGX0uN9gSxxo0+3SDduGJYdmz8DvhnX0Iww==
X-Received: by 2002:a05:6a00:2daa:b0:64b:20cd:6d52 with SMTP id fb42-20020a056a002daa00b0064b20cd6d52mr4512621pfb.14.1684948734187;
        Wed, 24 May 2023 10:18:54 -0700 (PDT)
Received: from wheely.local0.net ([220.240.241.243])
        by smtp.gmail.com with ESMTPSA id p18-20020aa78612000000b0063b7c42a070sm7698643pfn.68.2023.05.24.10.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:18:53 -0700 (PDT)
From:   Nicholas Piggin <npiggin@gmail.com>
To:     linux-alpha@vger.kernel.org
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [RFC PATCH 5/6] alpha: enable MMU_LAZY_TLB_SHOOTDOWN
Date:   Thu, 25 May 2023 03:18:21 +1000
Message-Id: <20230524171822.177133-6-npiggin@gmail.com>
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

With the sticky mm_cpumask, and conversion to mmgrab_lazy_tlb(), alpha
meets the requirements for MMU_LAZY_TLB_SHOOTDOWN. Select it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/alpha/Kconfig      | 1 +
 arch/alpha/kernel/smp.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index a5c2b1aa46b0..8f9995d66345 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -35,6 +35,7 @@ config ALPHA
 	select OLD_SIGSUSPEND
 	select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
 	select MMU_GATHER_NO_RANGE
+	select MMU_LAZY_TLB_SHOOTDOWN
 	select SPARSEMEM_EXTREME if SPARSEMEM
 	select ZONE_DMA
 	help
diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index d668b9d319af..73bbb81f336e 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -143,7 +143,7 @@ smp_callin(void)
 		alpha_mv.smp_callin();
 
 	/* All kernel threads share the same mm context.  */
-	mmgrab(&init_mm);
+	mmgrab_lazy_tlb(&init_mm);
 	current->active_mm = &init_mm;
 	cpumask_set_cpu(smp_processor_id(), mm_cpumask(&init_mm));
 
-- 
2.40.1

