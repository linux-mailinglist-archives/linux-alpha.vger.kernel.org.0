Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD2D25A3515
	for <lists+linux-alpha@lfdr.de>; Sat, 27 Aug 2022 08:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbiH0Gtx (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 27 Aug 2022 02:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiH0Gtw (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 27 Aug 2022 02:49:52 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FB4FD0D
        for <linux-alpha@vger.kernel.org>; Fri, 26 Aug 2022 23:49:51 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id s22so230300qkj.3
        for <linux-alpha@vger.kernel.org>; Fri, 26 Aug 2022 23:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lunos.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=sgDOOatof3X2oIuMz8I1+gDbeFzYNyzibUS1dRt2DSc=;
        b=bcsicaY8pXlNaayCCVnZslTWbAp22NSagtOxPIXIQf5rfZm/Qc+lzUaoy4cqQ6CPsz
         fkNYNlPJjPXW87KHJreIHIvY3dAVtBUWK1m32GJHAWaPvjyzaNgET/k0DGKtQGIUYXFR
         SlCmxhnOZic3n029LN0RxN1Y+/BlXE+AAHqx+FiaRHV32ov2Ol6mA12aT4Gnfb73ocR7
         8WUYsIOhHOA9BHctmTL8HXo89yhvY74GfkgZgD7Deozhwcj/KpbnnVsIIH6qUBhg/HNe
         JWF8CxcpZ01zwOMR0H5gf0ZEndGDc/IHwlOLOv+ba+uaLM1Pv/qHib39CuEVV1Jv4cVl
         AYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=sgDOOatof3X2oIuMz8I1+gDbeFzYNyzibUS1dRt2DSc=;
        b=CFHeFsfBCXfjFAxQ20va6ZwQf1cZWuVdsaCsKE5AVPSm3/XivE6TJUXFwJA89MViF+
         rbBq9eCr4ChHOVBgrLL+1j93w/W9fQrWmf2pVUHVIsu8yqyVSfayfKt2SbaIaz7uwvOv
         8CvnEA5HzqQZDm2GKAU9/a4gKncMfupJYqNndWr5AK994UFRFJuAKF1jFIhjZx/eHGHK
         xxA+gN1ZKl0Kx8/ntWxI13nqV/ZSz4GUMvfFolDdnbbjFPPjrUy6/VuByJSWO88EqbZH
         6ORsL9y6AZDf//h96Joq+bfbZ+McoOVHfvpMwUc6fww1bn/wB+s4YSOfWPXv4WoB8m6F
         RsYA==
X-Gm-Message-State: ACgBeo1lo0mnECWAN/0YWKYcaB2/E3Rhtn/LqyUgGSJiCz1Kb7PwQ63V
        0UoVmtl7LHY2jDOxOAgw1JoX7s/JkJtmqF71F6Xt5+b5KT2D9A==
X-Google-Smtp-Source: AA6agR5jUiEgRsvzgOhVes40s0d7xMWOVXX3PC0bju6Fr9MOwzyPQmMW/cwePmKVgzGhwWEQ5psbzA==
X-Received: by 2002:a37:952:0:b0:6ba:37c6:12ec with SMTP id 79-20020a370952000000b006ba37c612ecmr2165159qkj.331.1661582990381;
        Fri, 26 Aug 2022 23:49:50 -0700 (PDT)
Received: from andromeda.lan (c-73-135-167-67.hsd1.md.comcast.net. [73.135.167.67])
        by smtp.gmail.com with ESMTPSA id c12-20020a37e10c000000b006b9576cd060sm1260589qkm.21.2022.08.26.23.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 23:49:50 -0700 (PDT)
From:   Edward Humes <aurxenon@lunos.org>
To:     linux-alpha@vger.kernel.org
Cc:     mattst88@gmail.com, ink@jurassic.park.msu.ru,
        richard.henderson@linaro.org, Edward Humes <aurxenon@lunos.org>
Subject: [PATCH] alpha: fix R_ALPHA_LITERAL reloc for large modules
Date:   Sat, 27 Aug 2022 02:49:39 -0400
Message-Id: <20220827064939.461790-1-aurxenon@lunos.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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

