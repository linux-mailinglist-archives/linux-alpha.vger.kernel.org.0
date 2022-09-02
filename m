Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8926F5AA547
	for <lists+linux-alpha@lfdr.de>; Fri,  2 Sep 2022 03:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbiIBBuR (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 1 Sep 2022 21:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbiIBBuQ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Thu, 1 Sep 2022 21:50:16 -0400
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79EE40E09
        for <linux-alpha@vger.kernel.org>; Thu,  1 Sep 2022 18:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=RJct9twoiWfPCBpnyEdPbh8BHKnLozy8y1EyGQSbYsc=; b=hu4c/eSCS8N0u/kRx6r4QMnNQN
        OaMFwZBuMIXngCR9wWtII4oKTcZOhmBqH+kTO0+sCRTjkfZbeeXwAVSSOwu8d19S3bWmRfsoTvM9x
        6fROjV1Sx7ZKuhPi9awcGyH0hNd9yEGSddqmD7mT3PjfiL8+kMWwt+XWMnSMJtpJvfbvrsT3Js1Lx
        yBvirtLycwVubeAnzqgOvASg+JpI7tfnNNQyJcqwYLt06mjo+w8xQdFABvVghgDqlV4X8klrKrckL
        7svABqa3Lr4bR7DssvAPnApWZxDRfqk7fNhS1CXcuABMS9RJw97YDn/34JMZYQ6pChzA8Am4Fx5YW
        c5CeixkQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat Linux))
        id 1oTvoy-00BBAG-9W;
        Fri, 02 Sep 2022 01:50:12 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     linux-alpha@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 1/7] alpha: fix TIF_NOTIFY_SIGNAL handling
Date:   Fri,  2 Sep 2022 02:50:06 +0100
Message-Id: <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <YxFhB4/cEXX5aHbn@ZenIV>
References: <YxFhB4/cEXX5aHbn@ZenIV>
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

it needs to be added to _TIF_WORK_MASK, or we might not reach
do_work_pending() in the first place...

Fixes: 5a9a8897c253a "alpha: add support for TIF_NOTIFY_SIGNAL"
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/include/asm/thread_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index fdc485d7787a..084c27cb0c70 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -75,7 +75,7 @@ register struct thread_info *__current_thread_info __asm__("$8");
 
 /* Work to do on interrupt/exception return.  */
 #define _TIF_WORK_MASK		(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
-				 _TIF_NOTIFY_RESUME)
+				 _TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL)
 
 /* Work to do on any return to userspace.  */
 #define _TIF_ALLWORK_MASK	(_TIF_WORK_MASK		\
-- 
2.30.2

