Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1853B5AA54B
	for <lists+linux-alpha@lfdr.de>; Fri,  2 Sep 2022 03:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233260AbiIBBuU (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 1 Sep 2022 21:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234011AbiIBBuQ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Thu, 1 Sep 2022 21:50:16 -0400
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6CFA4A102
        for <linux-alpha@vger.kernel.org>; Thu,  1 Sep 2022 18:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=2HH45ktyMbB/frbvJzGbfjNE4lriEI4z+7PLdjhzLaw=; b=oxLiTmJTurNw9aYFWE923c2ti1
        w+XayLQ0KyOKNo8gTmh4nHN+5KIELSZrRpoQDPpb5X7LJcN1pyYJ7P4V3Y+CJU7qmZNLhhxsCLdzT
        /Bv1hbIjw59/oAovnmSXXLYusKGzQB/C5ojXodLyw6JpdOGb8Ll/HIVc+oJ8kk/06FuGDyWRmr+/Q
        DdpSHqq4AH+S62b9w1N5DvoLH9qhHieAM45tEL7ldzi0cJUsr0MN8H0/w9cOvHi101u8OaO79+9ZA
        P+5TUmtgnQU7Rlv5kPwCrUuQgfgHPpWiR6j4eC84/WjlGh8VMvLKoXaYjFMCDVeDmIEa5qfzHa7wD
        3eumt9IA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat Linux))
        id 1oTvoz-00BBAZ-6w;
        Fri, 02 Sep 2022 01:50:13 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     linux-alpha@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 6/7] alpha: ret_from_fork can go straight to ret_to_user
Date:   Fri,  2 Sep 2022 02:50:11 +0100
Message-Id: <20220902015012.2664521-6-viro@zeniv.linux.org.uk>
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

We only hit ret_from_fork when the child is meant to return to
userland (since 2012 or so).

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 43380fbf600d..a6207c47f089 100644
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
2.30.2

