Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAD82DE4E8
	for <lists+linux-alpha@lfdr.de>; Fri, 18 Dec 2020 15:38:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729121AbgLROhO (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 18 Dec 2020 09:37:14 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:59215 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727842AbgLROfK (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 18 Dec 2020 09:35:10 -0500
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MIMXE-1ktVvH3Qeq-00EO5n; Fri, 18 Dec 2020 15:31:52 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
        jolsa@redhat.com, namhyung@kernel.org, catalin.marinas@arm.com,
        will@kernel.org, msalter@redhat.com, jacquiot.aurelien@gmail.com,
        gerg@linux-m68k.org, geert@linux-m68k.org,
        tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
        deller@gmx.de, benh@kernel.crashing.org, paulus@samba.org,
        ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net,
        tglx@linutronix.de, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        maz@kernel.org, tony@atomide.com, arnd@arndb.de,
        linux-alpha@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arch@vger.kernel.org
Subject: [PATCH 06/23] arch: mips: drop misleading warning on spurious IRQ
Date:   Fri, 18 Dec 2020 15:31:05 +0100
Message-Id: <20201218143122.19459-7-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218143122.19459-1-info@metux.net>
References: <20201218143122.19459-1-info@metux.net>
X-Provags-ID: V03:K1:FGKFVpjRm8i7alCduF6w5xVQ9QBhhI+BcbMoR2xYuHsBqi3HW+a
 zuZ/nO0yECgUh91EZuccQMI4v9u0fvgFaaXDlnfpg4pNnW+9YPm0m6vFzoP8y3nI/L80U2q
 tOYG+TtPDtewTmWoSaBjj031Z1xtRhX13X03Cj1R8WbJJ6hRxdjlasrHGXlgq0z0XRCY/7R
 7bMVFVy/AwQ9G65ocohFQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5QbacgAAcV8=:SjlVoKIRpMoJbMDin1Wxmv
 r7hX0/Hb1uQQh9DWyGtQ4hJ/O7UuoWSZBLXqv3HLbGuwbraALbYBJaVDC8hOM6Rc34+eN5uUd
 VRtPdFPKbEXn7MPrknDfMOMfZmLIdjknTzIWTnexfB4JFPWnpLPS2uCDscdMklO+Ww0/aBe30
 WK8pshbeLhGqWu+4zq5EeVvhjKHOayfwPjMJnG0vngvQQxPP1BmzSm0fNQLZTEARXdkwu2pqE
 Eear9qZL5q1/abLp+4Wu/OabD7PVErjHqqBocNxuGjo1pGM2bAzuyckbJ44wcZDSvUGHf7l2D
 ou8BxCqHc2Ss6RnvX/JERqSHQ55352dSyIVht/cmKR8eT9fg35ihrPgOO9fzNj7XQUWwawJOh
 HR9IQlONZti0Q4+USJXCQTytoyovM/QCwtkXcmv3mUZpColG/mUlBGm0hTFRX
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

The warning in ack_bad_irq() is misleading in several ways:
* the term "vector" isn't quite correct
* the printing format isn't consistent across the archs: some print decimal,
  some hex, some hex w/o 0x prefix.
* the printed linux irq isn't meaningful in all cases - we actually would
  want it to print the hw irq.

Since all call sites already print out more detailed and correct information,
we just don't need to duplicate this in each single arch. So just drop it.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 arch/mips/include/asm/hardirq.h | 3 +--
 arch/mips/kernel/irq.c          | 9 ---------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/mips/include/asm/hardirq.h b/arch/mips/include/asm/hardirq.h
index c977a86c2c65..75444120e6cb 100644
--- a/arch/mips/include/asm/hardirq.h
+++ b/arch/mips/include/asm/hardirq.h
@@ -10,8 +10,7 @@
 #ifndef _ASM_HARDIRQ_H
 #define _ASM_HARDIRQ_H
 
-extern void ack_bad_irq(unsigned int irq);
-#define ack_bad_irq ack_bad_irq
+#define ack_bad_irq(irq)
 
 #include <asm-generic/hardirq.h>
 
diff --git a/arch/mips/kernel/irq.c b/arch/mips/kernel/irq.c
index 85b6c60f285d..c98be305fab6 100644
--- a/arch/mips/kernel/irq.c
+++ b/arch/mips/kernel/irq.c
@@ -27,15 +27,6 @@
 
 void *irq_stack[NR_CPUS];
 
-/*
- * 'what should we do if we get a hw irq event on an illegal vector'.
- * each architecture has to answer this themselves.
- */
-void ack_bad_irq(unsigned int irq)
-{
-	printk("unexpected IRQ # %d\n", irq);
-}
-
 atomic_t irq_err_count;
 
 int arch_show_interrupts(struct seq_file *p, int prec)
-- 
2.11.0

