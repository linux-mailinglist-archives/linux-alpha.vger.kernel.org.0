Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B66417F6D
	for <lists+linux-alpha@lfdr.de>; Sat, 25 Sep 2021 04:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347692AbhIYC5Y (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 24 Sep 2021 22:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347703AbhIYC5X (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 24 Sep 2021 22:57:23 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA37C061760
        for <linux-alpha@vger.kernel.org>; Fri, 24 Sep 2021 19:55:49 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mTxqu-0076js-EA; Sat, 25 Sep 2021 02:55:48 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     linux-alpha@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 6/6] alpha: ret_from_fork can go straight to ret_to_user
Date:   Sat, 25 Sep 2021 02:55:47 +0000
Message-Id: <20210925025548.1694143-6-viro@zeniv.linux.org.uk>
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

We only hit ret_from_fork when the child is meant to return to
userland (since 2012 or so).

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 43380fbf600dd..a6207c47f0894 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -766,7 +766,7 @@ alpha_switch_to:
 	.align	4
 	.ent	ret_from_fork
 ret_from_fork:
-	lda	$26, ret_from_sys_call
+	lda	$26, ret_to_user
 	mov	$17, $16
 	jmp	$31, schedule_tail
 .end ret_from_fork
-- 
2.11.0

