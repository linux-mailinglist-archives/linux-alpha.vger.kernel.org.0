Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE7DE6A7EDD
	for <lists+linux-alpha@lfdr.de>; Thu,  2 Mar 2023 10:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjCBJxr (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 2 Mar 2023 04:53:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjCBJxR (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Thu, 2 Mar 2023 04:53:17 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D781730
        for <linux-alpha@vger.kernel.org>; Thu,  2 Mar 2023 01:53:12 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id v16so13089742wrn.0
        for <linux-alpha@vger.kernel.org>; Thu, 02 Mar 2023 01:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZHaQjAFpi9TJWHqFM+95KfED/Q/8XVJn3AfBj+QDY8=;
        b=Nx4N4DdfyFWmONBZABZS4Pm48hFk0i7XpSeJxFrM1IdkfpJbDeyx2UyPVjtHwnvx3a
         lpJXWjSvdy1yA0+hsNHtFHR7RAp9b0Z0XO4k4icMtyTCMym42JBufqEzKgEBwsOsjazw
         /c7TRJTAU4Nc8WHkQHpKc4GVUwoLceyqRnQjvnYnGOpH2u7mKNaRPZtCGDvInV5yov12
         JFsF8t1MvvdfsRhJQjY6N65bWxYp11k2qdDBiH4IhSi5lTyWuaqar1mM2sU6+8fhAPHw
         ib++0c+6bL+olAEsz3JXTuqgqGgSJHpnVL3Rm6fHw46S19nREvykZzaIRYjbTis2Y08+
         sXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZHaQjAFpi9TJWHqFM+95KfED/Q/8XVJn3AfBj+QDY8=;
        b=lajWvXHTyRsAzM+grpfzPEIIZb+Mx9t73Zns5+5SOsAr9M2Df7sGMHys/EFRbQi7Rw
         kNElV0/Kaxb0qrx9anVecuWWS6ZE8f7WQROzGkafBhpEYigMhxFrHmi6DHcOzOIjdARn
         ZB7ePBaWiDJxbna9rrLznEg8vQ/AC1d5QqOA8VW+CCqG9+Mnpb1DJGorBjH5qgFieEFL
         nSizcIltTdagPigB1qy04EKZt8VBwz4JJfvZib1Bwlxg72Z8SE/TcNwfPgUm8cnDAavp
         v86z/tjmLxWfNWSUA3i9YmsMpG0fSEuS2kyGYytYr1AVAWuC0bmqrmVCpFMwK9b6OYMN
         qTtA==
X-Gm-Message-State: AO0yUKVswG9dTy3P/GMzxJD3FX2Xrfo0H5uts3IxCX2N2NQ6028tBh4m
        Ui3bf88EX1gC6pkm+0GJF+ZkGw==
X-Google-Smtp-Source: AK7set81+J76ESnZZm3oyyxTlRUvfii3Bic87MlN7SxfDicQQ8S1GtBwYUf9j+RljuZEcb8UvRCRMQ==
X-Received: by 2002:adf:cf04:0:b0:2c7:19c1:5557 with SMTP id o4-20020adfcf04000000b002c719c15557mr8383081wrj.64.1677750791453;
        Thu, 02 Mar 2023 01:53:11 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id y18-20020adffa52000000b002c55efa9cbesm14490820wrr.39.2023.03.02.01.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:53:11 -0800 (PST)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 17/24] microblaze: Remove empty <uapi/asm/setup.h>
Date:   Thu,  2 Mar 2023 10:35:32 +0100
Message-Id: <20230302093539.372962-18-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/microblaze/include/uapi/asm/setup.h | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 arch/microblaze/include/uapi/asm/setup.h

diff --git a/arch/microblaze/include/uapi/asm/setup.h b/arch/microblaze/include/uapi/asm/setup.h
deleted file mode 100644
index 51aed65880e7..000000000000
--- a/arch/microblaze/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * Copyright (C) 2007-2009 Michal Simek <monstr@monstr.eu>
- * Copyright (C) 2007-2009 PetaLogix
- * Copyright (C) 2006 Atmark Techno, Inc.
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License. See the file "COPYING" in the main directory of this archive
- * for more details.
- */
-
-#ifndef _UAPI_ASM_MICROBLAZE_SETUP_H
-#define _UAPI_ASM_MICROBLAZE_SETUP_H
-
-# ifndef __ASSEMBLY__
-
-# endif /* __ASSEMBLY__ */
-#endif /* _UAPI_ASM_MICROBLAZE_SETUP_H */
-- 
2.37.2

