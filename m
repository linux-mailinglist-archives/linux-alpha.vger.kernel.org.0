Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 090CF2DE475
	for <lists+linux-alpha@lfdr.de>; Fri, 18 Dec 2020 15:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbgLROfm (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 18 Dec 2020 09:35:42 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:48969 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728196AbgLROfX (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 18 Dec 2020 09:35:23 -0500
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MO9qz-1kSO7t2hRp-00OXUo; Fri, 18 Dec 2020 15:32:16 +0100
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
Subject: [PATCH 19/23] arch: c6x: use generic irq error counter
Date:   Fri, 18 Dec 2020 15:31:18 +0100
Message-Id: <20201218143122.19459-20-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218143122.19459-1-info@metux.net>
References: <20201218143122.19459-1-info@metux.net>
X-Provags-ID: V03:K1:bUKbPuD/IE863dGqQP/aUVD3gMjanOmJq5smfk4HYWrMLwZeTSB
 k45+tw0yA/1Jgzwos83k90orLCs83aroaMpeBB39uP1uMMStvQ9QhtXMH4BYz0IipHOkY0v
 kH2GQ3WJCiarTYQXG5Q2sadZG2E46xZvuqbjZ+YUOPphysIBTTbyIiz3i3rbydpQdeWrHaA
 LVhGNnbvccZshL+Bhd3sQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vf+aytBGJWs=:r2eZwHED7IQmg6gl03ucQ8
 l/17rxJDH3Q0EehshvVMk0IPYVvjvVR1C65/GN46yrjD3HCMOP/rrIcikwR5HIgVGjphssKtc
 o1lv+fPa0+Hc94H5Hrr/VIr7xmqV3jwm/vnqCzDlsUPvneuBzmfR3qpEB8UAYM1h9ScjXoC2l
 MKQTwfAiMlD7plZW+Ee/8vfC1criUczadakTuunPoNaWsDY1eyC+81GByepRkc1iQUKybJcMl
 ZfT5eVrVcfhx4kg56Z6SbUPfyHAapCnNNYUJo0WSq16JFSLA6qZunWCcuhqFj0NJmHWstMF+B
 1mDqxGu7XYmAbhrPklXsi0ZwpczbVtKfKbBJMPT4YOecjG+Y3G6ewvh1UD6PrIxn5E5d54uln
 v2eQWiQMuctBB13Iev8txxMZUc5iK4R0+3okQnQhFKSsiqpo7859MSe15Do6+
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Use the newly introduced irq error counter, that's already maintained
by all callers of ack_bad_irq(), in order to remove duplicate code.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 arch/c6x/include/asm/hardirq.h |  3 ---
 arch/c6x/include/asm/irq.h     |  2 --
 arch/c6x/kernel/irq.c          | 11 ++---------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/c6x/include/asm/hardirq.h b/arch/c6x/include/asm/hardirq.h
index f37d07d31040..f70f6113e53a 100644
--- a/arch/c6x/include/asm/hardirq.h
+++ b/arch/c6x/include/asm/hardirq.h
@@ -9,9 +9,6 @@
 #ifndef _ASM_C6X_HARDIRQ_H
 #define _ASM_C6X_HARDIRQ_H
 
-extern void ack_bad_irq(int irq);
-#define ack_bad_irq ack_bad_irq
-
 #include <asm-generic/hardirq.h>
 
 #endif /* _ASM_C6X_HARDIRQ_H */
diff --git a/arch/c6x/include/asm/irq.h b/arch/c6x/include/asm/irq.h
index 9da4d1afd0d7..f42c5747c3ee 100644
--- a/arch/c6x/include/asm/irq.h
+++ b/arch/c6x/include/asm/irq.h
@@ -45,6 +45,4 @@ struct pt_regs;
 
 extern asmlinkage void c6x_do_IRQ(unsigned int prio, struct pt_regs *regs);
 
-extern unsigned long irq_err_count;
-
 #endif /* _ASM_C6X_IRQ_H */
diff --git a/arch/c6x/kernel/irq.c b/arch/c6x/kernel/irq.c
index b9f7cfa2ed21..9f9d798925de 100644
--- a/arch/c6x/kernel/irq.c
+++ b/arch/c6x/kernel/irq.c
@@ -21,12 +21,10 @@
 #include <linux/of_irq.h>
 #include <linux/interrupt.h>
 #include <linux/kernel_stat.h>
-
+#include <asm-generic/irq-err.h>
 #include <asm/megamod-pic.h>
 #include <asm/special_insns.h>
 
-unsigned long irq_err_count;
-
 static DEFINE_RAW_SPINLOCK(core_irq_lock);
 
 static void mask_core_irq(struct irq_data *data)
@@ -114,13 +112,8 @@ void __init init_IRQ(void)
 	set_creg(ICR, 0xfff0);
 }
 
-void ack_bad_irq(int irq)
-{
-	irq_err_count++;
-}
-
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
-	seq_printf(p, "%*s: %10lu\n", prec, "Err", irq_err_count);
+	seq_printf(p, "%*s: %10lu\n", prec, "Err", irq_err_get());
 	return 0;
 }
-- 
2.11.0

