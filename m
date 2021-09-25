Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5F3417F6B
	for <lists+linux-alpha@lfdr.de>; Sat, 25 Sep 2021 04:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347540AbhIYC5Y (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 24 Sep 2021 22:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347630AbhIYC5X (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 24 Sep 2021 22:57:23 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FFFFC06161E
        for <linux-alpha@vger.kernel.org>; Fri, 24 Sep 2021 19:55:49 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mTxqu-0076jc-4i; Sat, 25 Sep 2021 02:55:48 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     linux-alpha@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 2/6] alpha: _TIF_ALLWORK_MASK is unused
Date:   Sat, 25 Sep 2021 02:55:43 +0000
Message-Id: <20210925025548.1694143-2-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk>
 <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

... and never had been used, actually

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/include/asm/thread_info.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index 0ce1eee0924b1..9b99fece40af9 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -79,10 +79,6 @@ register struct thread_info *__current_thread_info __asm__("$8");
 #define _TIF_WORK_MASK		(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
 				 _TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL)
 
-/* Work to do on any return to userspace.  */
-#define _TIF_ALLWORK_MASK	(_TIF_WORK_MASK		\
-				 | _TIF_SYSCALL_TRACE)
-
 #define TS_UAC_NOPRINT		0x0001	/* ! Preserve the following three */
 #define TS_UAC_NOFIX		0x0002	/* ! flags as they match          */
 #define TS_UAC_SIGBUS		0x0004	/* ! userspace part of 'osf_sysinfo' */
-- 
2.11.0

