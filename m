Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3B535A5D28
	for <lists+linux-alpha@lfdr.de>; Tue, 30 Aug 2022 09:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiH3Hm0 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 30 Aug 2022 03:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbiH3HmZ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 30 Aug 2022 03:42:25 -0400
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1AA9FA97
        for <linux-alpha@vger.kernel.org>; Tue, 30 Aug 2022 00:42:22 -0700 (PDT)
X-QQ-mid: bizesmtp88t1661845328tsqnodxd
Received: from localhost.localdomain ( [182.148.13.26])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Tue, 30 Aug 2022 15:42:03 +0800 (CST)
X-QQ-SSF: 01000000000000B0C000000A0000000
X-QQ-FEAT: k+kXOVJT+YxXS49HxL8plGBLGIEs0uUZJXqBNy+oBJh6iwYsxnOKfE36oxNtV
        nZziYWB6VXv2cFw3zxp5JyRuoMs63jThCoFqQWyfD+eaXouvy0IHbn11VR2gGX6LTa6Le01
        eu2SZh/GOythc94+y+WQl9/iT3sPqr7Ma5AKmvZi1m9ULOssXpZb3vkwIbHPwWM/dt3ItCE
        p6NDDyo/4XNqGiOgOBvdYhSNinOsfqK9ZAyRRP7KNNDUKjBF/W/wqkrKyZ9uWBAK5Np/tlg
        FDS+AZTd/PXPCpO4bqZMC8H/r2zGrtgkz0khUtJY2KMNZyyi7id+kGLCRPPfeIwIT+Wa9FW
        2OgaQHBe0ytkaF4/lq7k1LBgGAardfeVqielr6jZTo4P5+Sb9q3Dro5ugm8ag==
X-QQ-GoodBg: 0
From:   Shaomin Deng <dengshaomin@cdjrlc.com>
To:     richard.henderson@linaro.org, ink@jurassic.park.msu.ru,
        mattst88@gmail.com, linux-alpha@vger.kernel.org
Cc:     Shaomin Deng <dengshaomin@cdjrlc.com>
Subject: [PATCH] alpha: Fix double word in comments
Date:   Tue, 30 Aug 2022 03:42:02 -0400
Message-Id: <20220830074202.11274-1-dengshaomin@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_00,RCVD_IN_PBL,
        RCVD_IN_SBL_CSS,RCVD_IN_XBL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        *  0.4 RCVD_IN_XBL RBL: Received via a relay in Spamhaus XBL
        *      [43.155.67.158 listed in zen.spamhaus.org]
        *  3.3 RCVD_IN_PBL RBL: Received via a relay in Spamhaus PBL
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Delete the rebundant word "and" in comments.

Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
---
 arch/alpha/kernel/irq_i8259.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/irq_i8259.c b/arch/alpha/kernel/irq_i8259.c
index 1dcf0d9038fd..db574dcd6675 100644
--- a/arch/alpha/kernel/irq_i8259.c
+++ b/arch/alpha/kernel/irq_i8259.c
@@ -147,7 +147,7 @@ isa_no_iack_sc_device_interrupt(unsigned long vector)
 	 */
 	/* 
 	 *  The first read of gives you *all* interrupting lines.
-	 *  Therefore, read the mask register and and out those lines
+	 *  Therefore, read the mask register and out those lines
 	 *  not enabled.  Note that some documentation has 21 and a1 
 	 *  write only.  This is not true.
 	 */
-- 
2.35.1

