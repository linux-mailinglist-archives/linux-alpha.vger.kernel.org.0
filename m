Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2150F29F0AF
	for <lists+linux-alpha@lfdr.de>; Thu, 29 Oct 2020 17:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbgJ2QAt (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 29 Oct 2020 12:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbgJ2QAt (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 29 Oct 2020 12:00:49 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873DBC0613CF
        for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2020 09:00:47 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id a20so3518627ilk.13
        for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2020 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=tMp2A0cmGdPXsWoXbDq8YFf8P3UnhjyMeu/E7Fr5588=;
        b=1cXQbr7SDRQrjOSa7DSUbfWqeKzkdaCWnyGVChqdyoAVUjlYmnKQ0NAgqHyYTlh58n
         o1hNyeWbUj63beDhxTyb0nz5rTFynU+QaE0jCx0JLNXpJe9GPr0WNToopujZhDnMAx+T
         JR+8dba/byLD3t+2ZqXypdTCF+tdqKBdaU1GkikZGemwejzW2smhX9Xi2bK7hcFpxeIk
         VpJuYfLtEcomYoSvzbgc77d6sALuCw2yxJA6YGxUipl6FEPTsnZPZbVtf/vE5vWuhZLd
         d/eOT9PcwUM3n7n+QUrTMTeRHdWcbURfI7nmGylshJgr4IkewXeXlwrSHE7NhAaJrjzC
         l50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=tMp2A0cmGdPXsWoXbDq8YFf8P3UnhjyMeu/E7Fr5588=;
        b=WIWkW6WIGBmKsoEOSgloiSC1Z1JxNnxxewtUSbfCU63aIR0++vySb+5PBBazQSm+kq
         7spJ43FrESU9DOVUy0e+U3Y2sjiAkR4Ibw0tqtQDEZ7eVg+uCzi6u6WJVJLXQh2LgMA4
         ZpB2tS3L9m0uN6qvDxUAj/iFcqhSx9ua3vQYf6jhY0dnNt/4RV39kTpoG120W3Ct/Upm
         e3hsWre4GjsDIYjdjbH5QzJQcjzk17VhC0A20QZQDgo8fBMnVk7iqTytJOt/B9fWsr0U
         JixN5hu7m8cHhGA+BRZum39eOE3oB3G5PM7d3VAYkqLJwPMCofpvVxu4zJ+JV9qIKu4N
         uwHw==
X-Gm-Message-State: AOAM530xncTK59e/0oQRyCELsoyUz+2AWe8QOHCiUeR1GBl6cwBOYAkd
        7roWH/ZzydlnLwwURJKk+2njTt1uavW0JA==
X-Google-Smtp-Source: ABdhPJz4C6wCehrI9/rMVgunq4Xmf++rOenUBEV3nmEveq+dCTA2f+XxN+LK5Soe0HCcRflcZ1SUtw==
X-Received: by 2002:a92:c529:: with SMTP id m9mr3718336ili.195.1603987246240;
        Thu, 29 Oct 2020 09:00:46 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id y17sm2793634ila.17.2020.10.29.09.00.45
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 09:00:45 -0700 (PDT)
To:     linux-alpha@vger.kernel.org
From:   Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] alpha: add support for TIF_NOTIFY_SIGNAL
Message-ID: <e04d1f77-9131-15b4-321a-ba0d9c22ff52@kernel.dk>
Date:   Thu, 29 Oct 2020 10:00:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Wire up TIF_NOTIFY_SIGNAL handling for alpha.

Cc: linux-alpha@vger.kernel.org
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---

5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
for details:

https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/

As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
as that will enable a set of cleanups once all of them support it. I'm
happy carrying this patch if need be, or it can be funelled through the
arch tree. Let me know.

 arch/alpha/include/asm/thread_info.h | 2 ++
 arch/alpha/kernel/entry.S            | 2 +-
 arch/alpha/kernel/signal.c           | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index 807d7b9a1860..2592356e3215 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -62,6 +62,7 @@ register struct thread_info *__current_thread_info __asm__("$8");
 #define TIF_SIGPENDING		2	/* signal pending */
 #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
 #define TIF_SYSCALL_AUDIT	4	/* syscall audit active */
+#define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
 #define TIF_DIE_IF_KERNEL	9	/* dik recursion lock */
 #define TIF_MEMDIE		13	/* is terminating due to OOM killer */
 #define TIF_POLLING_NRFLAG	14	/* idle is polling for TIF_NEED_RESCHED */
@@ -71,6 +72,7 @@ register struct thread_info *__current_thread_info __asm__("$8");
 #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
 #define _TIF_NOTIFY_RESUME	(1<<TIF_NOTIFY_RESUME)
 #define _TIF_SYSCALL_AUDIT	(1<<TIF_SYSCALL_AUDIT)
+#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 #define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
 
 /* Work to do on interrupt/exception return.  */
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 2e09248f8324..6a90d05cae1f 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -544,7 +544,7 @@ $ret_success:
 	.align	4
 	.type	work_pending, @function
 work_pending:
-	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING, $2
+	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING, | _TIF_NOTIFY_SIGNAL, $2
 	bne	$2, $work_notifysig
 
 $work_resched:
diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index 3739efce1ec0..948b89789da8 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -527,7 +527,7 @@ do_work_pending(struct pt_regs *regs, unsigned long thread_flags,
 			schedule();
 		} else {
 			local_irq_enable();
-			if (thread_flags & _TIF_SIGPENDING) {
+			if (thread_flags & (_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)) {
 				do_signal(regs, r0, r19);
 				r0 = 0;
 			} else {
-- 
2.29.0

-- 
Jens Axboe

