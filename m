Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBE968A74E
	for <lists+linux-alpha@lfdr.de>; Sat,  4 Feb 2023 01:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232180AbjBDAsS (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 3 Feb 2023 19:48:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbjBDAsR (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Fri, 3 Feb 2023 19:48:17 -0500
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B8F84953
        for <linux-alpha@vger.kernel.org>; Fri,  3 Feb 2023 16:48:15 -0800 (PST)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx0.riseup.net (Postfix) with ESMTPS id 4P7v5W1mcCz9sx9;
        Sat,  4 Feb 2023 00:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1675471695; bh=7btSdxXVlZAq3kfePEmWPlI5siaO9G/Y4NnLytVPLOk=;
        h=From:To:Cc:Subject:Date:From;
        b=JRZdRsgPi0/jG+LyDoVk+SkdmI2g0yo5vpQzRMlM8wJBN7N9ntPM0nCqXRinPY+vE
         RonuEkvkhpkGuNzp1za+JDin0owLSameKka9y/RNf/a8VbFb9cOaca3BdU1VCOiQr6
         e0/gHTE6vWQTTJbLy16uAyfSV/lAMbxZDGQDv+Ng=
X-Riseup-User-ID: A5B7293FF2E15DDE779F536FBFEDE8FA031491450250FC8EFC01CB9A653892A9
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4P7v5V31qkz5vLh;
        Sat,  4 Feb 2023 00:48:14 +0000 (UTC)
From:   rj1 <rj1@riseup.net>
To:     linux-alpha@vger.kernel.org
Cc:     richard.henderson@linaro.org, ink@jurassic.park.msu.ru,
        mattst88@gmail.com, rj1 <rj1@riseup.net>
Subject: [PATCH] fixed a typo in core_cia.c
Date:   Fri,  3 Feb 2023 18:47:03 -0600
Message-Id: <20230204004702.692906-1-rj1@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

---
 arch/alpha/kernel/core_cia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/core_cia.c b/arch/alpha/kernel/core_cia.c
index f489170201c3..12926e9538b8 100644
--- a/arch/alpha/kernel/core_cia.c
+++ b/arch/alpha/kernel/core_cia.c
@@ -527,7 +527,7 @@ verify_tb_operation(void)
 	if (use_tbia_try2) {
 		alpha_mv.mv_pci_tbi = cia_pci_tbi_try2;
 
-		/* Tags 0-3 must be disabled if we use this workaraund. */
+		/* Tags 0-3 must be disabled if we use this workaround. */
 		wmb();
 		*(vip)CIA_IOC_TB_TAGn(0) = 2;
 		*(vip)CIA_IOC_TB_TAGn(1) = 2;
-- 
2.39.1

