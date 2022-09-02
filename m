Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBC85AA548
	for <lists+linux-alpha@lfdr.de>; Fri,  2 Sep 2022 03:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbiIBBuS (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 1 Sep 2022 21:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbiIBBuQ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Thu, 1 Sep 2022 21:50:16 -0400
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615B2481F5
        for <linux-alpha@vger.kernel.org>; Thu,  1 Sep 2022 18:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=W5SHzcCJ9TQE1sD0casjp0OwWnnjRWnpqa3vML0gp+A=; b=KFE0cgyw+KDGGNttqjNdURVsj2
        DhLSdy1lveZKmfWZxNb+RXaV6qSgMBPyhzyivhFNSodqMvwtXZywuy/c/H7A1PLfwmlD+aHa7Uol7
        3rrHkgh1rKjM4uUDgr23QJqAphdz/P/Vom9UEgS6ejbb1DmuK/0fkFV3h9RMsWpjF3izUhLnbt24F
        Sg1iOlruYcg1AaTIQUUDajnQIDM5nWMqR5TX4iJBQI/e4Zf84n98Q9VoWrm8So+QMaKYYhPXwF9YC
        zq9xNX+kxVMqVJYpsfaz4GcYweAezazpqlGwoAxrH7GM2q+dX82OB7FuFf5s7JIG0HSop0ninWWMe
        FcaVYWFA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat Linux))
        id 1oTvoz-00BBAQ-0Y;
        Fri, 02 Sep 2022 01:50:13 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     linux-alpha@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 4/7] alpha: fix handling of a3 on straced syscalls
Date:   Fri,  2 Sep 2022 02:50:09 +0100
Message-Id: <20220902015012.2664521-4-viro@zeniv.linux.org.uk>
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

For successful syscall that happens to return a negative, we want
a3 set to 0, no matter whether it's straced or not.  As it is,
for straced case we leave the value it used to have on syscall
entry.  Easily fixed, fortunately...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index c41a5a9c3b9f..78fe7ee25425 100644
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
2.30.2

