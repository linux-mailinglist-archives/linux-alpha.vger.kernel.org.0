Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355FB45DB3E
	for <lists+linux-alpha@lfdr.de>; Thu, 25 Nov 2021 14:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347471AbhKYNl4 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 25 Nov 2021 08:41:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355013AbhKYNjz (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 25 Nov 2021 08:39:55 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F79FC061757
        for <linux-alpha@vger.kernel.org>; Thu, 25 Nov 2021 05:28:20 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id i12so5570155wmq.4
        for <linux-alpha@vger.kernel.org>; Thu, 25 Nov 2021 05:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-powerpc-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id;
        bh=aSUF9oXETjDoDDLltfRKWNT8EucdXZILjenFDT8AYDA=;
        b=gWAmT6cCMkmGGaC4S+d292wYYIftHaMXJMyMoJQ3WVYusc8GfA8iID3axlalSlaGuC
         7MNbIltYsqGh3k2f+gRXYR20keJkwTcSEtHzziTKKEABcH8ugGUYUIwq0z7A8YeEo6Gw
         aCxqTCjJWZBOImibTgcX34q6zd/9ow7LNj9pongrpUF1QjvaXSZqginEbPJDCDNA8Enz
         96A03KVuCT2ZmHyh2vrvgL5N3ix3mQOpo3UR3G1szhoXZ6gAR9SM16GsjSnVRH5McASu
         2LYbU5mLWYmd3tMbQAGJ1TzPrC7mwNFf9TfzE4GGnJHJIIOUzXAEL2+cA+la/M4Nqgk1
         Tq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=aSUF9oXETjDoDDLltfRKWNT8EucdXZILjenFDT8AYDA=;
        b=0QbaM3HPOnNf2tftmSfE0ySANMuVkNsj05s1IXy5QJV6wTtosf5opdhZyHNlIGyKLe
         AvFxBxXm9a+/8a9aoH5TB1Qjxi9xe7UjBafDu7VQaAmP39a8Ibq88OZiM/AuhYT7OK4f
         ZgPSQOQA0uBRmnuuSAKXDr+YKKmIwQ1glF54vrc0ADIo6wBXUAsdXLlIcOnBy6M4J+JX
         0dhuUjAPz6oTPXJ+LqYU9M80y+1SUsJ7WO0TdkhBMhU5YdZcKjK1EkkJpQPS8MHLynGb
         ebJkyfhhvkkfTpw6LhmTtRQ3dsSla3XN84x5r2najPI0lgtzp1sc7jpdPVEhDO7v4uIR
         UqqA==
X-Gm-Message-State: AOAM532GP0JVQkiinOH6vgce2H0rWVFQL7nUfEalW8INLZ/NzaEZ3Lfc
        Hl3g2pLCF4dmEwGmmL5bvFEx25Z4+K1qw5a8
X-Google-Smtp-Source: ABdhPJw7AMs9Lho0vN0879hze/fEPfqO1Hectw0NdJD5eiAV+5zKVxS0RmTfYgdm4IGHU0lDSd8hKg==
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr7045639wmf.177.1637846898495;
        Thu, 25 Nov 2021 05:28:18 -0800 (PST)
Received: from localhost.localdomain ([5.35.23.193])
        by smtp.gmail.com with ESMTPSA id c4sm2845350wrr.37.2021.11.25.05.28.17
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Nov 2021 05:28:18 -0800 (PST)
From:   Denis Kirjanov <kda@linux-powerpc.org>
To:     linux-alpha@vger.kernel.org
Subject: [PATCH] alpha: signal: drop DEBUG_SIG print statements
Date:   Thu, 25 Nov 2021 16:27:59 +0300
Message-Id: <20211125132759.16212-1-kda@linux-powerpc.org>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Drop compile-based legacy debug print statements

Signed-off-by: Denis Kirjanov <kda@linux-powerpc.org>
---
 arch/alpha/kernel/signal.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index bc077babafab..d5849d6181b6 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -31,8 +31,6 @@
 #include "proto.h"
 
 
-#define DEBUG_SIG 0
-
 #define _BLOCKABLE (~(sigmask(SIGKILL) | sigmask(SIGSTOP)))
 
 asmlinkage void ret_from_sys_call(void);
@@ -362,10 +360,6 @@ setup_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs)
 	regs->r18 = (unsigned long) &frame->sc;	/* a2: sigcontext pointer */
 	wrusp((unsigned long) frame);
 	
-#if DEBUG_SIG
-	printk("SIG deliver (%s:%d): sp=%p pc=%p ra=%p\n",
-		current->comm, current->pid, frame, regs->pc, regs->r26);
-#endif
 	return 0;
 }
 
@@ -416,11 +410,6 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs)
 	regs->r18 = (unsigned long) &frame->uc;	  /* a2: ucontext pointer */
 	wrusp((unsigned long) frame);
 
-#if DEBUG_SIG
-	printk("SIG deliver (%s:%d): sp=%p pc=%p ra=%p\n",
-		current->comm, current->pid, frame, regs->pc, regs->r26);
-#endif
-
 	return 0;
 }
 
-- 
2.16.4

