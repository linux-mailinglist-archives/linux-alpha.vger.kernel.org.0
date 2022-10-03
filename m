Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3FC5F300C
	for <lists+linux-alpha@lfdr.de>; Mon,  3 Oct 2022 14:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbiJCMNZ (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 3 Oct 2022 08:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbiJCMNY (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Mon, 3 Oct 2022 08:13:24 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A547E520BD
        for <linux-alpha@vger.kernel.org>; Mon,  3 Oct 2022 05:13:22 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id s10so11535818ljp.5
        for <linux-alpha@vger.kernel.org>; Mon, 03 Oct 2022 05:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=YsLY1swMVj4DKjC2Q49eQR4Pp7U9mFeotQVi/NOOp94=;
        b=pV53mRtibSCQbNNhXfTXs70Kmg8n3Z+FVWKdAtto7dRD3YuIZyNVFPInMy3JGWS3MD
         FBsQWZ+GAJHC7TItFNEGBj6pQdVskouXi66wSGxST8L8thTQDQST6VHHLeAaD732CbTm
         QLVxgKBWZT8Yz6EiRY5KjKJ/i5oojzRPwOolKi1GsscMGPbxvEn9VWJzUb07ObMNssIQ
         HkE9fXeTFtCOtxnL3uzM3p/ktu4I3MVsr7/ehRHh4GawuEyuJgpYb5lVSZHxMV3CO+kX
         gYXhjlFYAd3c9H5gG2TZxmvD3uDF0nfgqC1PN0yi0PbUf/1UI1AAEeAt1wuDgKuF1SlQ
         LRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=YsLY1swMVj4DKjC2Q49eQR4Pp7U9mFeotQVi/NOOp94=;
        b=hlfDCW2L4NLu2FOIZWQjbvqJUShL/xs4/HXFRW0N+u/VXKGbd7ZhIweketRCSJbLuk
         FeRuB42ZNtCaYdU7RjHb4X4B8Ga7EhYwgvyihR5vR4sK+Try0dakpbJH9290k8vrDPjs
         lKMT8pRSwJwnpuYF1CiXaZ5Zhg6cpTcoFqL7Gq7BB5UW0OTd2FB6TIuur5R6TPC1yUXK
         rnXMdvZpVeDhZJfceW1iprnWvhD/80tImwotaBMBSxOySC727w24mvuXizeEmTYbsOtg
         B2ALPxEU8nw+S4YDCr9AsoZjaY9wMm6Pc99+cfZD2Dgs1rTuqzib4UaoEWn+4HBwijwr
         WJlQ==
X-Gm-Message-State: ACrzQf0SU+6Qtt5eo7JaFz8fPrk0cvN45IrtXB8UaiLy/Qd4898g7qVT
        q5bk5vELXl6YOQrYUu8EaGE8pg==
X-Google-Smtp-Source: AMsMyM5jkom1WL6i/J8FWjPHF3VUaTG9/NOtjIVcSs2jkS65wz9QlEyEI1W5sI+i9gtnHsXm+73LdQ==
X-Received: by 2002:a2e:b8d6:0:b0:26c:4776:ba2e with SMTP id s22-20020a2eb8d6000000b0026c4776ba2emr5998334ljp.143.1664799200257;
        Mon, 03 Oct 2022 05:13:20 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id k15-20020a05651239cf00b00492dadd8143sm1431154lfu.168.2022.10.03.05.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 05:13:19 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-alpha@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-arch@vger.kernel.org
Subject: [PATCH] alpha: Fix ioread64/iowrite64 helpers
Date:   Mon,  3 Oct 2022 14:13:16 +0200
Message-Id: <20221003121316.2540339-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

When doing allmod builds it turns out some modules are using
ioread64() and iowrite64() that the alpha does not implement,
as it is using <asm-generic/iomap.h> without selecting
GENERIC_IOMAP.

Fix this by implementing the ioread64()/iowrite64() stubs
as well, using readq() and writeq() respectively.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: 7e772dad9913 ("alpha: Use generic <asm-generic/io.h>")
Link: https://lore.kernel.org/linux-arch/20221002224521.GA968453@roeck-us.net/
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-arch@vger.kernel.org
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Arnd if this looks OK then please apply it on linux-arch
for fixes.
---
 arch/alpha/kernel/io.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/alpha/kernel/io.c b/arch/alpha/kernel/io.c
index 838586abb1e0..5f3e75a945c1 100644
--- a/arch/alpha/kernel/io.c
+++ b/arch/alpha/kernel/io.c
@@ -41,6 +41,11 @@ unsigned int ioread32(const void __iomem *addr)
 	return ret;
 }
 
+u64 ioread64(const void __iomem *addr)
+{
+	return readq(addr);
+}
+
 void iowrite8(u8 b, void __iomem *addr)
 {
 	mb();
@@ -59,12 +64,19 @@ void iowrite32(u32 b, void __iomem *addr)
 	IO_CONCAT(__IO_PREFIX,iowrite32)(b, addr);
 }
 
+void iowrite64(u64 b, void __iomem *addr)
+{
+	writeq(b, addr);
+}
+
 EXPORT_SYMBOL(ioread8);
 EXPORT_SYMBOL(ioread16);
 EXPORT_SYMBOL(ioread32);
+EXPORT_SYMBOL(ioread64);
 EXPORT_SYMBOL(iowrite8);
 EXPORT_SYMBOL(iowrite16);
 EXPORT_SYMBOL(iowrite32);
+EXPORT_SYMBOL(iowrite64);
 
 u8 inb(unsigned long port)
 {
-- 
2.34.1

