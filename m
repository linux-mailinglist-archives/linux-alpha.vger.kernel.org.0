Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C22417F6C
	for <lists+linux-alpha@lfdr.de>; Sat, 25 Sep 2021 04:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347735AbhIYC5Y (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 24 Sep 2021 22:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347701AbhIYC5X (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 24 Sep 2021 22:57:23 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E840C06173F
        for <linux-alpha@vger.kernel.org>; Fri, 24 Sep 2021 19:55:49 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mTxqu-0076jo-Bq; Sat, 25 Sep 2021 02:55:48 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     linux-alpha@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 5/6] alpha: syscall exit cleanup
Date:   Sat, 25 Sep 2021 02:55:46 +0000
Message-Id: <20210925025548.1694143-5-viro@zeniv.linux.org.uk>
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

$ret_success consists of two insn + branch to ret_from_syscall.
The thing is, those insns are identical to the ones immediately
preceding ret_from_syscall...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/kernel/entry.S | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 78fe7ee254250..43380fbf600dd 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -478,6 +478,7 @@ entSys:
 1:	jsr	$26, ($27), sys_ni_syscall
 	ldgp	$gp, 0($26)
 	blt	$0, $syscall_error	/* the call failed */
+$ret_success:
 	stq	$0, 0($sp)
 	stq	$31, 72($sp)		/* a3=0 => no error */
 
@@ -527,11 +528,6 @@ $syscall_error:
 	stq	$1, 72($sp)	/* a3 for return */
 	br	ret_from_sys_call
 
-$ret_success:
-	stq	$0, 0($sp)
-	stq	$31, 72($sp)	/* a3=0 => no error */
-	br	ret_from_sys_call
-
 /*
  * Do all cleanup when returning from all interrupts and system calls.
  *
-- 
2.11.0

