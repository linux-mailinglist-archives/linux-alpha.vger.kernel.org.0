Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1FD5AA549
	for <lists+linux-alpha@lfdr.de>; Fri,  2 Sep 2022 03:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbiIBBuS (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 1 Sep 2022 21:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232782AbiIBBuQ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Thu, 1 Sep 2022 21:50:16 -0400
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4509C47BA2
        for <linux-alpha@vger.kernel.org>; Thu,  1 Sep 2022 18:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=raCO+sDSlo+bbdl2pgcuT8tWqC15TyeXE+vpatplOYI=; b=j2QQGlQWg+F9mPXvlZPQpAcWGl
        9jilCEP52CCPB0VYiZTSAdHsvAH6eQCMnmvjZIPcG/IG4jY5kVfPtbHOYWnW28LrxWFRVbT2fpfay
        /m2VNFPwZZFYazKFEFHY7G+SDm56AWul3Vsv638SDFZZfZLP1KC8/ARVH6grg9RO3nVX9bFQY2j26
        KBl2oy+gSjtvTsc4WHbZCVBORmbwQJlxq5TgW60+zKX7ll2kOsbvdFVOnB2rQFjHMiVzppDWWNhYX
        ZbbKvMJvb3Q9+JSlJcv6pR8KmpFHMh39UyreoZdYvceasGPb2des0o4mjbj9lYJndDgbsW6TdpBq1
        ega6/zHg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat Linux))
        id 1oTvoy-00BBAM-P0;
        Fri, 02 Sep 2022 01:50:12 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     linux-alpha@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 3/7] alpha: fix syscall entry in !AUDUT_SYSCALL case
Date:   Fri,  2 Sep 2022 02:50:08 +0100
Message-Id: <20220902015012.2664521-3-viro@zeniv.linux.org.uk>
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

We only want to take the slow path if SYSCALL_TRACE or SYSCALL_AUDIT is
set; on !AUDIT_SYSCALL configs the current tree hits it whenever _any_
thread flag (including NEED_RESCHED, NOTIFY_SIGNAL, etc.) happens to
be set.

Fixes: a9302e843944 "alpha: Enable system-call auditing support"
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/kernel/entry.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index e227f3a29a43..c41a5a9c3b9f 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -469,8 +469,10 @@ entSys:
 #ifdef CONFIG_AUDITSYSCALL
 	lda     $6, _TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT
 	and     $3, $6, $3
-#endif
 	bne     $3, strace
+#else
+	blbs    $3, strace		/* check for SYSCALL_TRACE in disguise */
+#endif
 	beq	$4, 1f
 	ldq	$27, 0($5)
 1:	jsr	$26, ($27), sys_ni_syscall
-- 
2.30.2

