Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA5CC5AA546
	for <lists+linux-alpha@lfdr.de>; Fri,  2 Sep 2022 03:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234101AbiIBBuQ (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 1 Sep 2022 21:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbiIBBuQ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Thu, 1 Sep 2022 21:50:16 -0400
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019A24198C
        for <linux-alpha@vger.kernel.org>; Thu,  1 Sep 2022 18:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=fPue4i3USC/KKxhvKvFPfszIGb3R4HwrzGYH6JeAovs=; b=lW1QMrLqPAWWr5seMUd+rstIoh
        vqip7ery29ie8LV1sNFBO0ik1o7ZbykjCzSfkt9uqdcQpWScB9cAsxc7/fnDeagvMVVnc7m3P5L5e
        zn866RBwPDifLLLRxausYHTUzET3ki6ronDyWJFQ6KomhzSD8c+QYTM5KV4Zn4M36mPt83xbdItbg
        ctH5FzJfeqc52mNVsYiPqVwHnWRPpSTI26zSoGHNfTzMk4cJsCxcSjId4JKRVFHHmOgH1dB8NFu1n
        jh/G/e8w1PfSp9ykGw9DCZTQJqnmVLLrvB0Fpk/QyClYN40whynU7WvgyQlqrnqmuIhbWsmKqTyjv
        bY1GvRKQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat Linux))
        id 1oTvoy-00BBAI-JS;
        Fri, 02 Sep 2022 01:50:12 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     linux-alpha@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 2/7] alpha: _TIF_ALLWORK_MASK is unused
Date:   Fri,  2 Sep 2022 02:50:07 +0100
Message-Id: <20220902015012.2664521-2-viro@zeniv.linux.org.uk>
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

... and never had been used, actually

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/include/asm/thread_info.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index 084c27cb0c70..082631465074 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -77,10 +77,6 @@ register struct thread_info *__current_thread_info __asm__("$8");
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
2.30.2

