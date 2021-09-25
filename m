Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACC4417F69
	for <lists+linux-alpha@lfdr.de>; Sat, 25 Sep 2021 04:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347630AbhIYC5Y (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 24 Sep 2021 22:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347692AbhIYC5X (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 24 Sep 2021 22:57:23 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46FD7C0614ED
        for <linux-alpha@vger.kernel.org>; Fri, 24 Sep 2021 19:55:49 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mTxqu-0076jk-9W; Sat, 25 Sep 2021 02:55:48 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     linux-alpha@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 4/6] alpha: fix handling of a3 on straced syscalls
Date:   Sat, 25 Sep 2021 02:55:45 +0000
Message-Id: <20210925025548.1694143-4-viro@zeniv.linux.org.uk>
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

For successful syscall that happens to return a negative, we want
a3 set to 0, no matter whether it's straced or not.  As it is,
for straced case we leave the value it used to have on syscall
entry.  Easily fixed, fortunately...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index c41a5a9c3b9f2..78fe7ee254250 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -600,8 +600,8 @@ ret_from_straced:
 
 	/* check return.. */
 	blt	$0, $strace_error	/* the call failed */
-	stq	$31, 72($sp)		/* a3=0 => no error */
 $strace_success:
+	stq	$31, 72($sp)		/* a3=0 => no error */
 	stq	$0, 0($sp)		/* save return value */
 
 	DO_SWITCH_STACK
-- 
2.11.0

