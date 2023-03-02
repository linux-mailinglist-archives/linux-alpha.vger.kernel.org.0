Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37FD6A7E74
	for <lists+linux-alpha@lfdr.de>; Thu,  2 Mar 2023 10:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbjCBJrF (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 2 Mar 2023 04:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbjCBJrE (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Thu, 2 Mar 2023 04:47:04 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F953B3DF
        for <linux-alpha@vger.kernel.org>; Thu,  2 Mar 2023 01:47:02 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id h14so15886515wru.4
        for <linux-alpha@vger.kernel.org>; Thu, 02 Mar 2023 01:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8G1o29Ga/UNTNJtY/6LksyBwTKom5lFj7gKfXcB8h4g=;
        b=f5l6eWLUG26Tt1766JjI6+GInzRq5lOwonJqSgSnLvYw936TWJoY/k8LCTgJ0bfkJF
         /sik1QE/lKik4wYpmelpWwyeaSPucJJe3LtOwmdgxeOqZMifyze3wQXcaEwnVHnCP8iI
         uhTP6oBehvNs+Cq9TAu5oyX9Vr61Hg6hkYQJhCoxh8B3x+E2tjjKNdPaBlxqsIBA6ezp
         DZWBusm4N21C0GYVueAYiVK6ByGTSyb/OuQDlMShYL/GtXpALshSesRtnYJRb8OPxeZX
         E33mvg7vxn/lJGdB/iNyGNTrfDviw75Ua5B9SYEXBJXNoIAFOQ2EvY0Y2b9fZZBUzwZp
         R52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8G1o29Ga/UNTNJtY/6LksyBwTKom5lFj7gKfXcB8h4g=;
        b=EwGXJVRd0gKsriXAE6T7v4MBgbD//xwBfVQycU4jKcHqkklc/ImHPgsI0w2EgHjubw
         Vi0fFI55idkllOhj4goZRGnE/aY3xCn3F07GPSz7tHDKAVHe5wDnloNk57YIDu9m8gc8
         YQmu4YY9RyxHMLE26awYbAls1QEuCrSSJFnc63OyAIA9rfpbbeeHt9JC5R1y4z0OzdA8
         xWo6jWUKKa3Msnl+jrtjJqy7VK1ryHjg/ERgFSIY49RS4DRIc5qdR99Qpcq33lxGKk49
         FlMt2uURCBmTFzdBk4twu3JXCtDyleNW8bclFHO1osU7kuXY3qeO6dE4bKmV1qiULZrl
         DjiQ==
X-Gm-Message-State: AO0yUKV0VLM27NEneP39/AoCtnoZHzdAO34hcIcWX1BThRSg8wgNXo1I
        VcHsWTyKzxRnhz6+GrN0S7epig==
X-Google-Smtp-Source: AK7set9J3h1SdWZFjFBk1kF/VV/+0cIiLPOiFxwZAoniEed5KnNwwwJqjyvLs0/w3Ko/NwUYEOVAHw==
X-Received: by 2002:a5d:568d:0:b0:2c7:f56:28d9 with SMTP id f13-20020a5d568d000000b002c70f5628d9mr6805976wrv.54.1677750420888;
        Thu, 02 Mar 2023 01:47:00 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c444700b003eb0d6f48f3sm2536356wmn.27.2023.03.02.01.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:47:00 -0800 (PST)
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
Subject: [PATCH v4 11/24] xtensa: Remove COMMAND_LINE_SIZE from uapi
Date:   Thu,  2 Mar 2023 10:35:26 +0100
Message-Id: <20230302093539.372962-12-alexghiti@rivosinc.com>
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

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/setup.h      | 17 +++++++++++++++++
 arch/xtensa/include/uapi/asm/setup.h |  2 --
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 arch/xtensa/include/asm/setup.h

diff --git a/arch/xtensa/include/asm/setup.h b/arch/xtensa/include/asm/setup.h
new file mode 100644
index 000000000000..5356a5fd4d17
--- /dev/null
+++ b/arch/xtensa/include/asm/setup.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * include/asm-xtensa/setup.h
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ *
+ * Copyright (C) 2001 - 2005 Tensilica Inc.
+ */
+
+#ifndef _XTENSA_SETUP_H
+#define _XTENSA_SETUP_H
+
+#define COMMAND_LINE_SIZE	256
+
+#endif
diff --git a/arch/xtensa/include/uapi/asm/setup.h b/arch/xtensa/include/uapi/asm/setup.h
index 5356a5fd4d17..6f982394684a 100644
--- a/arch/xtensa/include/uapi/asm/setup.h
+++ b/arch/xtensa/include/uapi/asm/setup.h
@@ -12,6 +12,4 @@
 #ifndef _XTENSA_SETUP_H
 #define _XTENSA_SETUP_H
 
-#define COMMAND_LINE_SIZE	256
-
 #endif
-- 
2.37.2

