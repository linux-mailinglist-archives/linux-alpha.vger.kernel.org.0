Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E20A695BEC
	for <lists+linux-alpha@lfdr.de>; Tue, 14 Feb 2023 09:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjBNIFH (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 14 Feb 2023 03:05:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231769AbjBNIEb (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 14 Feb 2023 03:04:31 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03F622A0B
        for <linux-alpha@vger.kernel.org>; Tue, 14 Feb 2023 00:04:23 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id r2so14701316wrv.7
        for <linux-alpha@vger.kernel.org>; Tue, 14 Feb 2023 00:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wjc5nUaXPqzOcikp/dFCXLyDNPdOZGtU07c3eeQkEo=;
        b=QzV31v7ItXqx4yWsJfh152ebFGrBo9gPdhTErCgeoMfuI0a/bXBwVo9zVazH0XhD1o
         1P22Wx88GfdDl5eEqBxmERSHFO/cszqUOCuMenN38SqwMA+e3o2paztN+lm0B02Xgkp3
         e+v+idvauAUtu3a/SIQ7MztA/LQf+9eZsxk+Jym1ZZLsfwfAVWgFyBnu0nM0VTcvl2h7
         FliYXwQgV+CnK774qEo/1yzLrYpRuhTqe2ZbWRvyqrg3H8e5u97kFVktjSnfWw7k86cI
         vT5XzHCiZvDMnZ0VdkIY4TftV6Qme4WQXbWLgnrifFqlcq70lxh8ilRJsq+QAWvDOKHL
         u3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wjc5nUaXPqzOcikp/dFCXLyDNPdOZGtU07c3eeQkEo=;
        b=Clbcv9NFJO9fkkmSUzcSh4uvYV42N6hyncTRfJ3f7MnvIGRajhMivsX4e1iu4QFtmq
         q+AMt9ZYofmXdTrgFC0rbPVJRbcqI03KwyCRJMgdW0RXiwQzGT+BD7XbK+RRvdw1B7J/
         GPrDpSU9bMwPCUPgryPn+hN6CDOt+zDZT5w1rV8/Bzq3kZq9cxqFX09M0v22ukZ33AwQ
         O45ATN8XeRRj32QUd5ZW0PjXvFVLzekIdtnvx/ukx5yhxrgvg9yXX0jIjZ/qrIyoi1Cw
         gfxrvxxWzZ2zcHIY644OkLgSe5jjtGCgN4oS3SM2HQ7lUmpIygC+t8uPm3YFZ++kXJ3Y
         iD+g==
X-Gm-Message-State: AO0yUKWoQ/tqERsq0j4fWW+UlQ9L3KHIbZX7jJ6YbM7LE+8aDg406897
        v/kJ5llDeF112aQdSCraJ9i/sQ==
X-Google-Smtp-Source: AK7set8HOf1J9ROM5HGHA9FxRtFWjGn9F9yobbBJ6lKeYYbdTM09Q7loKzacnDzy8U96Ii9jf9YULg==
X-Received: by 2002:a5d:43c6:0:b0:2bf:bf05:85ac with SMTP id v6-20020a5d43c6000000b002bfbf0585acmr797767wrr.23.1676361862446;
        Tue, 14 Feb 2023 00:04:22 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id r2-20020adff702000000b002bddac15b3dsm12021459wrp.33.2023.02.14.00.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:04:22 -0800 (PST)
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
Subject: [PATCH v3 14/24] arc: Remove empty <uapi/asm/setup.h>
Date:   Tue, 14 Feb 2023 08:49:15 +0100
Message-Id: <20230214074925.228106-15-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/arc/include/asm/setup.h      | 1 -
 arch/arc/include/uapi/asm/setup.h | 6 ------
 2 files changed, 7 deletions(-)
 delete mode 100644 arch/arc/include/uapi/asm/setup.h

diff --git a/arch/arc/include/asm/setup.h b/arch/arc/include/asm/setup.h
index 028a8cf76206..fe45ff4681bc 100644
--- a/arch/arc/include/asm/setup.h
+++ b/arch/arc/include/asm/setup.h
@@ -7,7 +7,6 @@
 
 
 #include <linux/types.h>
-#include <uapi/asm/setup.h>
 
 #define COMMAND_LINE_SIZE 256
 
diff --git a/arch/arc/include/uapi/asm/setup.h b/arch/arc/include/uapi/asm/setup.h
deleted file mode 100644
index a6d4e44938be..000000000000
--- a/arch/arc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/*
- * setup.h is part of userspace header ABI so UAPI scripts have to generate it
- * even if there's nothing to export - causing empty <uapi/asm/setup.h>
- * However to prevent "patch" from discarding it we add this placeholder
- * comment
- */
-- 
2.37.2

