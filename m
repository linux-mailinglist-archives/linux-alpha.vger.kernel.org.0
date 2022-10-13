Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8205FD649
	for <lists+linux-alpha@lfdr.de>; Thu, 13 Oct 2022 10:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiJMIiJ (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 13 Oct 2022 04:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiJMIiJ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 13 Oct 2022 04:38:09 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3318106932
        for <linux-alpha@vger.kernel.org>; Thu, 13 Oct 2022 01:38:07 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id w3so573482qtv.9
        for <linux-alpha@vger.kernel.org>; Thu, 13 Oct 2022 01:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lunos.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sgDOOatof3X2oIuMz8I1+gDbeFzYNyzibUS1dRt2DSc=;
        b=ltuE1b3//6EzFMyS9oLEp4hUz7t9jyCBfUc8KfcNdEnOhTCT9LUymJPBSELeHr0bJd
         1jN4AVQfR1O1UmC5PCJWLNCbXef/f0WY2g28bFj9tegbtrNf33fE+OCGuFX5Jbz716Dp
         ckltaVKKoTLP1tuc/7SrfC+BikxcYcDu0zdN8OI0RHAfvDhGENoBXRWOIrlUzHU6FQdA
         bM1wnROZ2L3IXCdqBRKkF5iCtbW8VcJQnZd8brgyXcrASnmjRdACj3yPViFCd/Xw7/3A
         2/Xzyb8IWeXPBT1tWuHkAQhbB7x/3ri5WW4PJ1pQF3LQXKLXW72dW6w9WImJiJDGEI8I
         oknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgDOOatof3X2oIuMz8I1+gDbeFzYNyzibUS1dRt2DSc=;
        b=jLfTOxL0jYCMuHQnW7KA2SNwsCpVR9EzZYOKGMrtKTPF9EO+gLCG4LnELlJmDDvP2A
         xtl08/dAaEca3U8slPSoOPBkpSs6CR5h7lHlweEuV2noyp11DtdncEgmwmsFCSPbSPMZ
         XnfQhuJQo2YSbg9Vw9heWkks2cGfU0dgV3F7SWCDXvgl0CQ5K2bgEGkRfcJBHbdEPBjQ
         HeqVwLsBJksU4wmj9guvaRx6OO6HJVqsy21OvMoYWyIT55+eq1LVVj0Iwt2XorCfZuTR
         d9YyklNwt8y/4927wRkcu9TIpGrOJYy97EUDwNIlC9doq+flZY1IHafXm/5eNBapVfUk
         O3oA==
X-Gm-Message-State: ACrzQf3u61rHDlxhpnzd9HcVktzwPEKdPKA9rRRjRK3PSZKlIR85Dpvx
        XbryjGfLQl2RtWhsjH19WPQTlN9cruC7y3Ed+m4=
X-Google-Smtp-Source: AMsMyM7+V5Q+ZeAHCJ7+3PLeoKi2hspqCcWca1cDyySHeZCbEtRqOlYahHBpD97eekGJQR/lHWFVYw==
X-Received: by 2002:a05:622a:1750:b0:39a:82aa:f4ab with SMTP id l16-20020a05622a175000b0039a82aaf4abmr15019034qtk.411.1665650286734;
        Thu, 13 Oct 2022 01:38:06 -0700 (PDT)
Received: from andromeda.lan (c-73-135-167-67.hsd1.md.comcast.net. [73.135.167.67])
        by smtp.gmail.com with ESMTPSA id bm4-20020a05620a198400b006cfc7f9eea0sm18151568qkb.122.2022.10.13.01.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 01:38:06 -0700 (PDT)
From:   Edward Humes <aurxenon@lunos.org>
To:     linux-alpha@vger.kernel.org
Cc:     mattst88@gmail.com, ink@jurassic.park.msu.ru,
        richard.henderson@linaro.org, Edward Humes <aurxenon@lunos.org>
Subject: [PATCH] alpha: fix R_ALPHA_LITERAL reloc for large modules
Date:   Thu, 13 Oct 2022 04:37:46 -0400
Message-Id: <20221013083746.1281828-1-aurxenon@lunos.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Previously, R_ALPHA_LITERAL relocations would overflow for large kernel
modules.

This was because the Alpha's apply_relocate_add was relying on the kernel's
module loader to have sorted the GOT towards the very end of the module as it
was mapped into memory in order to correctly assign the global pointer. While
this behavior would mostly work fine for small kernel modules, this approach
would overflow on kernel modules with large GOT's since the global pointer
would be very far away from the GOT, and thus, certain entries would be out of
range.

This patch fixes this by instead using the Tru64 behavior of assigning the
global pointer to be 32KB away from the start of the GOT. The change made
in this patch won't work for multi-GOT kernel modules as it makes the
assumption the module only has one GOT located at the beginning of .got,
although for the vast majority kernel modules, this should be fine. Of the
kernel modules that would previously result in a relocation error, none of
them, even modules like nouveau, have even come close to filling up a single
GOT, and they've all worked fine under this patch.

Signed-off-by: Edward Humes <aurxenon@lunos.org>
---
 arch/alpha/kernel/module.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/module.c b/arch/alpha/kernel/module.c
index 5b60c248de9e..cbefa5a77384 100644
--- a/arch/alpha/kernel/module.c
+++ b/arch/alpha/kernel/module.c
@@ -146,10 +146,8 @@ apply_relocate_add(Elf64_Shdr *sechdrs, const char *strtab,
 	base = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr;
 	symtab = (Elf64_Sym *)sechdrs[symindex].sh_addr;
 
-	/* The small sections were sorted to the end of the segment.
-	   The following should definitely cover them.  */
-	gp = (u64)me->core_layout.base + me->core_layout.size - 0x8000;
 	got = sechdrs[me->arch.gotsecindex].sh_addr;
+	gp = got + 0x8000;
 
 	for (i = 0; i < n; i++) {
 		unsigned long r_sym = ELF64_R_SYM (rela[i].r_info);
-- 
2.34.1

