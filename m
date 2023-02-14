Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E29A9695C4A
	for <lists+linux-alpha@lfdr.de>; Tue, 14 Feb 2023 09:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbjBNIJf (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 14 Feb 2023 03:09:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231866AbjBNIJe (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 14 Feb 2023 03:09:34 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E0D227B8
        for <linux-alpha@vger.kernel.org>; Tue, 14 Feb 2023 00:09:32 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id g6-20020a05600c310600b003e1f6dff952so398261wmo.1
        for <linux-alpha@vger.kernel.org>; Tue, 14 Feb 2023 00:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIGhaDfE5SLWmKnSG9ikHY6squrBg187QDirpB8eFVo=;
        b=3lVcUd9sn2zQtFJR0u5J0kIaXOBwAUdWgS6TENWUzffST6PzutUUl4KQpRH68UCRqd
         AmXoKs3y/uU0PKnWtHqvwoOcZOhZN4v1Z7I6ss2MsSWN20umEr3jHUop77luRvjOQ+bk
         v9lp8QZUxuG4bx+6A9WxrhaJL2ZCl/14dMrBN4+4+AEiSiWCOTWv1xrROBT0jCNPejG9
         KRw3spY1j9L9Rl4qLoqZjdsJkumRxyNrfV8n0f91+GGjQwwO2+2THxyXibuvkVx1Ha1Y
         3AaXyilcA+IllPgV2/eY+YJepAx3JFCIrPZ694HAOjj7uDLhBVRVm9DXebU0wkwu1Nw1
         GNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIGhaDfE5SLWmKnSG9ikHY6squrBg187QDirpB8eFVo=;
        b=d2ATaMGPe3Tmj8Hr8LAMo79qit8AIUc1blFWP3ItYIOdZx0kFoiorfADKQHHba2jbM
         rC7lAvCWTrxdnKwjqDexW5V/nvppWj9OpQ+6jw7bV/6EAhsOgUlz1T4yYx6B/249reJW
         KVA/6s7GNCO7C0J8bCgsbZp5EdtPT5Iit13QjyR549X+T51pXw380SA2hiZrHMT4HcPc
         MC/Wc0R9S1mcsGciaNnUDTIuzeStKYSDwT2GWhDlYmH/PEh4OCmlrjRQyCGl/46G5j8m
         J6Zx1R5LxN2X4QC0v4Gz+7I3cJZ+CPStyzXSs2L7fWTBQvAwMz0k5Z63dQ/bk94FiEl4
         dR5g==
X-Gm-Message-State: AO0yUKV5qNYcLYj+lGdqrg7g0gSmo/UXRdrSXgRMPMmMDkZ+WjNs4Nlz
        EKWn201yAQLN/AJ0cLRDkh4wkA==
X-Google-Smtp-Source: AK7set88Ec71bhliYVjT8vjP3kYFJaQCuobrrvuvuiyk+qYoiCOwcAHhOO4G490cg0AP2c/iYiSZ+A==
X-Received: by 2002:a05:600c:1817:b0:3e0:c0d:75d8 with SMTP id n23-20020a05600c181700b003e00c0d75d8mr1854136wmp.23.1676362170796;
        Tue, 14 Feb 2023 00:09:30 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id s12-20020adfdb0c000000b002c3ec1fbc0bsm12256456wri.94.2023.02.14.00.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:09:30 -0800 (PST)
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
Subject: [PATCH v3 19/24] parisc: Remove empty <uapi/asm/setup.h>
Date:   Tue, 14 Feb 2023 08:49:20 +0100
Message-Id: <20230214074925.228106-20-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
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
 arch/parisc/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/parisc/include/uapi/asm/setup.h

diff --git a/arch/parisc/include/uapi/asm/setup.h b/arch/parisc/include/uapi/asm/setup.h
deleted file mode 100644
index bfad89428e47..000000000000
--- a/arch/parisc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _PARISC_SETUP_H
-#define _PARISC_SETUP_H
-
-#endif /* _PARISC_SETUP_H */
-- 
2.37.2

