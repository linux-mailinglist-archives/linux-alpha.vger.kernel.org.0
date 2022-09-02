Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 724705AA54A
	for <lists+linux-alpha@lfdr.de>; Fri,  2 Sep 2022 03:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232782AbiIBBuT (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 1 Sep 2022 21:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233871AbiIBBuQ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Thu, 1 Sep 2022 21:50:16 -0400
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F4348EBD
        for <linux-alpha@vger.kernel.org>; Thu,  1 Sep 2022 18:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=I7NpSH/rLBGjwJr10XcJCw6kobA0vHowCMfdAys6c8Y=; b=TyWsEwveDdRipVusTA3IYV6Rew
        OUaB/5l8ImWjPeRcPKrp4juDXK1TiGnV+DpJ/PzOOFi0KO4lKX6nbmuwIoCdYBbmywFfZ0ERS/xIS
        h2wVsrpt4L6jXj/AUBrEU7yu2OK0PpRrdjdKD83uZj2vjggxJ8ZWMx+vxRE/vPIvOQ27HPtMtEcdL
        JqjTCdo0tP5eEqOaAxWDqpWEUzwiRjXLyRRtYjjrBgXKQebbUm2kcVqRaf0IhOU9rputlX5rWm9Tw
        UiT2MpFnA9xn25lHS6eKc6EhJcbb4XW5DOF6L61ilLUIcGmtxMYHDtRF7qENjJ0Gf74iqcY4J2HQF
        H3dvwdsw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat Linux))
        id 1oTvoz-00BBAU-3t;
        Fri, 02 Sep 2022 01:50:13 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     linux-alpha@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 5/7] alpha: syscall exit cleanup
Date:   Fri,  2 Sep 2022 02:50:10 +0100
Message-Id: <20220902015012.2664521-5-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
References: <YxFhB4/cEXX5aHbn@ZenIV>
 <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
index 78fe7ee25425..43380fbf600d 100644
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
2.30.2

