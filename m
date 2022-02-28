Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 547A54C67BD
	for <lists+linux-alpha@lfdr.de>; Mon, 28 Feb 2022 11:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234988AbiB1KvR (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 28 Feb 2022 05:51:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235007AbiB1Ku0 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 28 Feb 2022 05:50:26 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BE11F64BC1;
        Mon, 28 Feb 2022 02:49:44 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77F3A1063;
        Mon, 28 Feb 2022 02:49:44 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BC64A3F73D;
        Mon, 28 Feb 2022 02:49:36 -0800 (PST)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
To:     linux-mm@kvack.org, akpm@linux-foundation.org
Cc:     linux-kernel@vger.kernel.org, geert@linux-m68k.org,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, sparclinux@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-alpha@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-parisc@vger.kernel.org,
        openrisc@lists.librecores.org, linux-um@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-arch@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH V3 07/30] mips/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date:   Mon, 28 Feb 2022 16:17:30 +0530
Message-Id: <1646045273-9343-8-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

This defines and exports a platform specific custom vm_get_page_prot() via
subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
macros can be dropped which are no longer needed.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/mips/Kconfig               |  1 +
 arch/mips/include/asm/pgtable.h | 22 ------------
 arch/mips/mm/cache.c            | 60 +++++++++++++++++++--------------
 3 files changed, 36 insertions(+), 47 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 058446f01487..fcbfc52a1567 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -13,6 +13,7 @@ config MIPS
 	select ARCH_HAS_STRNLEN_USER
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_SUPPORTS_UPROBES
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 7b8037f25d9e..bf193ad4f195 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -41,28 +41,6 @@ struct vm_area_struct;
  * by reasonable means..
  */
 
-/*
- * Dummy values to fill the table in mmap.c
- * The real values will be generated at runtime
- */
-#define __P000 __pgprot(0)
-#define __P001 __pgprot(0)
-#define __P010 __pgprot(0)
-#define __P011 __pgprot(0)
-#define __P100 __pgprot(0)
-#define __P101 __pgprot(0)
-#define __P110 __pgprot(0)
-#define __P111 __pgprot(0)
-
-#define __S000 __pgprot(0)
-#define __S001 __pgprot(0)
-#define __S010 __pgprot(0)
-#define __S011 __pgprot(0)
-#define __S100 __pgprot(0)
-#define __S101 __pgprot(0)
-#define __S110 __pgprot(0)
-#define __S111 __pgprot(0)
-
 extern unsigned long _page_cachable_default;
 extern void __update_cache(unsigned long address, pte_t pte);
 
diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 830ab91e574f..9f33ce4fb105 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -159,30 +159,6 @@ EXPORT_SYMBOL(_page_cachable_default);
 
 #define PM(p)	__pgprot(_page_cachable_default | (p))
 
-static inline void setup_protection_map(void)
-{
-	protection_map[0]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-	protection_map[1]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
-	protection_map[2]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-	protection_map[3]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
-	protection_map[4]  = PM(_PAGE_PRESENT);
-	protection_map[5]  = PM(_PAGE_PRESENT);
-	protection_map[6]  = PM(_PAGE_PRESENT);
-	protection_map[7]  = PM(_PAGE_PRESENT);
-
-	protection_map[8]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-	protection_map[9]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
-	protection_map[10] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE |
-				_PAGE_NO_READ);
-	protection_map[11] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
-	protection_map[12] = PM(_PAGE_PRESENT);
-	protection_map[13] = PM(_PAGE_PRESENT);
-	protection_map[14] = PM(_PAGE_PRESENT | _PAGE_WRITE);
-	protection_map[15] = PM(_PAGE_PRESENT | _PAGE_WRITE);
-}
-
-#undef PM
-
 void cpu_cache_init(void)
 {
 	if (cpu_has_3k_cache) {
@@ -206,6 +182,40 @@ void cpu_cache_init(void)
 
 		octeon_cache_init();
 	}
+}
 
-	setup_protection_map();
+pgprot_t vm_get_page_prot(unsigned long vm_flags)
+{
+	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
+	case VM_NONE:
+		return PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
+	case VM_READ:
+		return PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	case VM_WRITE:
+		return PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
+	case VM_WRITE | VM_READ:
+		return PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	case VM_EXEC:
+	case VM_EXEC | VM_READ:
+	case VM_EXEC | VM_WRITE:
+	case VM_EXEC | VM_WRITE | VM_READ:
+		return PM(_PAGE_PRESENT);
+	case VM_SHARED:
+		return PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
+	case VM_SHARED | VM_READ:
+		return PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	case VM_SHARED | VM_WRITE:
+		return PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE | _PAGE_NO_READ);
+	case VM_SHARED | VM_WRITE | VM_READ:
+		return PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
+	case VM_SHARED | VM_EXEC:
+	case VM_SHARED | VM_EXEC | VM_READ:
+		return PM(_PAGE_PRESENT);
+	case VM_SHARED | VM_EXEC | VM_WRITE:
+	case VM_SHARED | VM_EXEC | VM_WRITE | VM_READ:
+		return PM(_PAGE_PRESENT | _PAGE_WRITE);
+	default:
+		BUILD_BUG();
+	}
 }
+EXPORT_SYMBOL(vm_get_page_prot);
-- 
2.25.1

