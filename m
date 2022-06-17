Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB4E54FB6E
	for <lists+linux-alpha@lfdr.de>; Fri, 17 Jun 2022 18:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383492AbiFQQta (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 17 Jun 2022 12:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383462AbiFQQtG (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 17 Jun 2022 12:49:06 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30E051E46;
        Fri, 17 Jun 2022 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655484529; x=1687020529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WZN3UDo3zpD+50tJke53tIbEZG68aHP7L9dQUAla3kk=;
  b=cyDejBjPOjwBLgReDG5wQ4EQkJ7rbtTAc6ko/AjDg6RBGa9vsmYFG7BS
   sUc9p70kiQXeHl60PGeqEOtNuc24x7SdcoYneDzCeWdJ8Pq/ya1pawsbz
   SDy4eeD2OS8oD6KSxMRYvkhlo7bvpkqhsCi7/HB7sH5yoWcVnFQvbXsnu
   cmya4kDWqoLt4wMoesYeLJXtzmRORa0pqxBRU9BFkUD82c/k5p2DcKGUq
   uzy3z69lvTi/3WTqmCDdVo67auMU4DXhEwL/wisw1sD0toZhcyKimHmU4
   HOP9d57AfSiUNIzg8eJ5UDkqRvZ4kIEtQs0YAhYXsgwtULHcSOwg/BWuz
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259333261"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="259333261"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 07:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="688318445"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2022 07:40:46 -0700
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
        by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 25HEeXl7024161;
        Fri, 17 Jun 2022 15:40:44 +0100
From:   Alexander Lobakin <alexandr.lobakin@intel.com>
To:     Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>
Cc:     Alexander Lobakin <alexandr.lobakin@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matt Turner <mattst88@gmail.com>,
        Brian Cain <bcain@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Marco Elver <elver@google.com>, Borislav Petkov <bp@suse.de>,
        Tony Luck <tony.luck@intel.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-alpha@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] bitops: wrap non-atomic bitops with a transparent macro
Date:   Fri, 17 Jun 2022 16:40:29 +0200
Message-Id: <20220617144031.2549432-6-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220617144031.2549432-1-alexandr.lobakin@intel.com>
References: <20220617144031.2549432-1-alexandr.lobakin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

In preparation for altering the non-atomic bitops with a macro, wrap
them in a transparent definition. This requires prepending one more
'_' to their names in order to be able to do that seamlessly. It is
a simple change, given that all the non-prefixed definitions are now
in asm-generic.
sparc32 already has several triple-underscored functions, so I had
to rename them ('___' -> 'sp32_').

Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
---
 arch/sparc/include/asm/bitops_32.h            | 18 ++++++------
 arch/sparc/lib/atomic32.c                     | 12 ++++----
 .../bitops/instrumented-non-atomic.h          | 28 +++++++++----------
 .../bitops/non-instrumented-non-atomic.h      | 14 +++++-----
 include/linux/bitops.h                        | 18 +++++++++++-
 tools/include/asm-generic/bitops/non-atomic.h | 24 ++++++++--------
 tools/include/linux/bitops.h                  | 16 +++++++++++
 7 files changed, 81 insertions(+), 49 deletions(-)

diff --git a/arch/sparc/include/asm/bitops_32.h b/arch/sparc/include/asm/bitops_32.h
index 889afa9f990f..3448c191b484 100644
--- a/arch/sparc/include/asm/bitops_32.h
+++ b/arch/sparc/include/asm/bitops_32.h
@@ -19,9 +19,9 @@
 #error only <linux/bitops.h> can be included directly
 #endif
 
-unsigned long ___set_bit(unsigned long *addr, unsigned long mask);
-unsigned long ___clear_bit(unsigned long *addr, unsigned long mask);
-unsigned long ___change_bit(unsigned long *addr, unsigned long mask);
+unsigned long sp32___set_bit(unsigned long *addr, unsigned long mask);
+unsigned long sp32___clear_bit(unsigned long *addr, unsigned long mask);
+unsigned long sp32___change_bit(unsigned long *addr, unsigned long mask);
 
 /*
  * Set bit 'nr' in 32-bit quantity at address 'addr' where bit '0'
@@ -36,7 +36,7 @@ static inline int test_and_set_bit(unsigned long nr, volatile unsigned long *add
 	ADDR = ((unsigned long *) addr) + (nr >> 5);
 	mask = 1 << (nr & 31);
 
-	return ___set_bit(ADDR, mask) != 0;
+	return sp32___set_bit(ADDR, mask) != 0;
 }
 
 static inline void set_bit(unsigned long nr, volatile unsigned long *addr)
@@ -46,7 +46,7 @@ static inline void set_bit(unsigned long nr, volatile unsigned long *addr)
 	ADDR = ((unsigned long *) addr) + (nr >> 5);
 	mask = 1 << (nr & 31);
 
-	(void) ___set_bit(ADDR, mask);
+	(void) sp32___set_bit(ADDR, mask);
 }
 
 static inline int test_and_clear_bit(unsigned long nr, volatile unsigned long *addr)
@@ -56,7 +56,7 @@ static inline int test_and_clear_bit(unsigned long nr, volatile unsigned long *a
 	ADDR = ((unsigned long *) addr) + (nr >> 5);
 	mask = 1 << (nr & 31);
 
-	return ___clear_bit(ADDR, mask) != 0;
+	return sp32___clear_bit(ADDR, mask) != 0;
 }
 
 static inline void clear_bit(unsigned long nr, volatile unsigned long *addr)
@@ -66,7 +66,7 @@ static inline void clear_bit(unsigned long nr, volatile unsigned long *addr)
 	ADDR = ((unsigned long *) addr) + (nr >> 5);
 	mask = 1 << (nr & 31);
 
-	(void) ___clear_bit(ADDR, mask);
+	(void) sp32___clear_bit(ADDR, mask);
 }
 
 static inline int test_and_change_bit(unsigned long nr, volatile unsigned long *addr)
@@ -76,7 +76,7 @@ static inline int test_and_change_bit(unsigned long nr, volatile unsigned long *
 	ADDR = ((unsigned long *) addr) + (nr >> 5);
 	mask = 1 << (nr & 31);
 
-	return ___change_bit(ADDR, mask) != 0;
+	return sp32___change_bit(ADDR, mask) != 0;
 }
 
 static inline void change_bit(unsigned long nr, volatile unsigned long *addr)
@@ -86,7 +86,7 @@ static inline void change_bit(unsigned long nr, volatile unsigned long *addr)
 	ADDR = ((unsigned long *) addr) + (nr >> 5);
 	mask = 1 << (nr & 31);
 
-	(void) ___change_bit(ADDR, mask);
+	(void) sp32___change_bit(ADDR, mask);
 }
 
 #include <asm-generic/bitops/non-atomic.h>
diff --git a/arch/sparc/lib/atomic32.c b/arch/sparc/lib/atomic32.c
index 8b81d0f00c97..cf80d1ae352b 100644
--- a/arch/sparc/lib/atomic32.c
+++ b/arch/sparc/lib/atomic32.c
@@ -120,7 +120,7 @@ void arch_atomic_set(atomic_t *v, int i)
 }
 EXPORT_SYMBOL(arch_atomic_set);
 
-unsigned long ___set_bit(unsigned long *addr, unsigned long mask)
+unsigned long sp32___set_bit(unsigned long *addr, unsigned long mask)
 {
 	unsigned long old, flags;
 
@@ -131,9 +131,9 @@ unsigned long ___set_bit(unsigned long *addr, unsigned long mask)
 
 	return old & mask;
 }
-EXPORT_SYMBOL(___set_bit);
+EXPORT_SYMBOL(sp32___set_bit);
 
-unsigned long ___clear_bit(unsigned long *addr, unsigned long mask)
+unsigned long sp32___clear_bit(unsigned long *addr, unsigned long mask)
 {
 	unsigned long old, flags;
 
@@ -144,9 +144,9 @@ unsigned long ___clear_bit(unsigned long *addr, unsigned long mask)
 
 	return old & mask;
 }
-EXPORT_SYMBOL(___clear_bit);
+EXPORT_SYMBOL(sp32___clear_bit);
 
-unsigned long ___change_bit(unsigned long *addr, unsigned long mask)
+unsigned long sp32___change_bit(unsigned long *addr, unsigned long mask)
 {
 	unsigned long old, flags;
 
@@ -157,7 +157,7 @@ unsigned long ___change_bit(unsigned long *addr, unsigned long mask)
 
 	return old & mask;
 }
-EXPORT_SYMBOL(___change_bit);
+EXPORT_SYMBOL(sp32___change_bit);
 
 unsigned long __cmpxchg_u32(volatile u32 *ptr, u32 old, u32 new)
 {
diff --git a/include/asm-generic/bitops/instrumented-non-atomic.h b/include/asm-generic/bitops/instrumented-non-atomic.h
index b019f77ef21c..988a3bbfba34 100644
--- a/include/asm-generic/bitops/instrumented-non-atomic.h
+++ b/include/asm-generic/bitops/instrumented-non-atomic.h
@@ -14,7 +14,7 @@
 #include <linux/instrumented.h>
 
 /**
- * __set_bit - Set a bit in memory
+ * ___set_bit - Set a bit in memory
  * @nr: the bit to set
  * @addr: the address to start counting from
  *
@@ -23,14 +23,14 @@
  * succeeds.
  */
 static __always_inline void
-__set_bit(unsigned long nr, volatile unsigned long *addr)
+___set_bit(unsigned long nr, volatile unsigned long *addr)
 {
 	instrument_write(addr + BIT_WORD(nr), sizeof(long));
 	arch___set_bit(nr, addr);
 }
 
 /**
- * __clear_bit - Clears a bit in memory
+ * ___clear_bit - Clears a bit in memory
  * @nr: the bit to clear
  * @addr: the address to start counting from
  *
@@ -39,14 +39,14 @@ __set_bit(unsigned long nr, volatile unsigned long *addr)
  * succeeds.
  */
 static __always_inline void
-__clear_bit(unsigned long nr, volatile unsigned long *addr)
+___clear_bit(unsigned long nr, volatile unsigned long *addr)
 {
 	instrument_write(addr + BIT_WORD(nr), sizeof(long));
 	arch___clear_bit(nr, addr);
 }
 
 /**
- * __change_bit - Toggle a bit in memory
+ * ___change_bit - Toggle a bit in memory
  * @nr: the bit to change
  * @addr: the address to start counting from
  *
@@ -55,7 +55,7 @@ __clear_bit(unsigned long nr, volatile unsigned long *addr)
  * succeeds.
  */
 static __always_inline void
-__change_bit(unsigned long nr, volatile unsigned long *addr)
+___change_bit(unsigned long nr, volatile unsigned long *addr)
 {
 	instrument_write(addr + BIT_WORD(nr), sizeof(long));
 	arch___change_bit(nr, addr);
@@ -86,7 +86,7 @@ static __always_inline void __instrument_read_write_bitop(long nr, volatile unsi
 }
 
 /**
- * __test_and_set_bit - Set a bit and return its old value
+ * ___test_and_set_bit - Set a bit and return its old value
  * @nr: Bit to set
  * @addr: Address to count from
  *
@@ -94,14 +94,14 @@ static __always_inline void __instrument_read_write_bitop(long nr, volatile unsi
  * can appear to succeed but actually fail.
  */
 static __always_inline bool
-__test_and_set_bit(unsigned long nr, volatile unsigned long *addr)
+___test_and_set_bit(unsigned long nr, volatile unsigned long *addr)
 {
 	__instrument_read_write_bitop(nr, addr);
 	return arch___test_and_set_bit(nr, addr);
 }
 
 /**
- * __test_and_clear_bit - Clear a bit and return its old value
+ * ___test_and_clear_bit - Clear a bit and return its old value
  * @nr: Bit to clear
  * @addr: Address to count from
  *
@@ -109,14 +109,14 @@ __test_and_set_bit(unsigned long nr, volatile unsigned long *addr)
  * can appear to succeed but actually fail.
  */
 static __always_inline bool
-__test_and_clear_bit(unsigned long nr, volatile unsigned long *addr)
+___test_and_clear_bit(unsigned long nr, volatile unsigned long *addr)
 {
 	__instrument_read_write_bitop(nr, addr);
 	return arch___test_and_clear_bit(nr, addr);
 }
 
 /**
- * __test_and_change_bit - Change a bit and return its old value
+ * ___test_and_change_bit - Change a bit and return its old value
  * @nr: Bit to change
  * @addr: Address to count from
  *
@@ -124,19 +124,19 @@ __test_and_clear_bit(unsigned long nr, volatile unsigned long *addr)
  * can appear to succeed but actually fail.
  */
 static __always_inline bool
-__test_and_change_bit(unsigned long nr, volatile unsigned long *addr)
+___test_and_change_bit(unsigned long nr, volatile unsigned long *addr)
 {
 	__instrument_read_write_bitop(nr, addr);
 	return arch___test_and_change_bit(nr, addr);
 }
 
 /**
- * test_bit - Determine whether a bit is set
+ * _test_bit - Determine whether a bit is set
  * @nr: bit number to test
  * @addr: Address to start counting from
  */
 static __always_inline bool
-test_bit(unsigned long nr, const volatile unsigned long *addr)
+_test_bit(unsigned long nr, const volatile unsigned long *addr)
 {
 	instrument_atomic_read(addr + BIT_WORD(nr), sizeof(long));
 	return arch_test_bit(nr, addr);
diff --git a/include/asm-generic/bitops/non-instrumented-non-atomic.h b/include/asm-generic/bitops/non-instrumented-non-atomic.h
index e0fd7bf72a56..bdb9b1ffaee9 100644
--- a/include/asm-generic/bitops/non-instrumented-non-atomic.h
+++ b/include/asm-generic/bitops/non-instrumented-non-atomic.h
@@ -3,14 +3,14 @@
 #ifndef __ASM_GENERIC_BITOPS_NON_INSTRUMENTED_NON_ATOMIC_H
 #define __ASM_GENERIC_BITOPS_NON_INSTRUMENTED_NON_ATOMIC_H
 
-#define __set_bit		arch___set_bit
-#define __clear_bit		arch___clear_bit
-#define __change_bit		arch___change_bit
+#define ___set_bit		arch___set_bit
+#define ___clear_bit		arch___clear_bit
+#define ___change_bit		arch___change_bit
 
-#define __test_and_set_bit	arch___test_and_set_bit
-#define __test_and_clear_bit	arch___test_and_clear_bit
-#define __test_and_change_bit	arch___test_and_change_bit
+#define ___test_and_set_bit	arch___test_and_set_bit
+#define ___test_and_clear_bit	arch___test_and_clear_bit
+#define ___test_and_change_bit	arch___test_and_change_bit
 
-#define test_bit		arch_test_bit
+#define _test_bit		arch_test_bit
 
 #endif /* __ASM_GENERIC_BITOPS_NON_INSTRUMENTED_NON_ATOMIC_H */
diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index d393297287d5..3c3afbae1533 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -26,8 +26,24 @@ extern unsigned int __sw_hweight16(unsigned int w);
 extern unsigned int __sw_hweight32(unsigned int w);
 extern unsigned long __sw_hweight64(__u64 w);
 
+/*
+ * Defined here because those may be needed by architecture-specific static
+ * inlines.
+ */
+
 #include <asm-generic/bitops/generic-non-atomic.h>
 
+#define bitop(op, nr, addr)						\
+	op(nr, addr)
+
+#define __set_bit(nr, addr)		bitop(___set_bit, nr, addr)
+#define __clear_bit(nr, addr)		bitop(___clear_bit, nr, addr)
+#define __change_bit(nr, addr)		bitop(___change_bit, nr, addr)
+#define __test_and_set_bit(nr, addr)	bitop(___test_and_set_bit, nr, addr)
+#define __test_and_clear_bit(nr, addr)	bitop(___test_and_clear_bit, nr, addr)
+#define __test_and_change_bit(nr, addr)	bitop(___test_and_change_bit, nr, addr)
+#define test_bit(nr, addr)		bitop(_test_bit, nr, addr)
+
 /*
  * Include this here because some architectures need generic_ffs/fls in
  * scope
@@ -38,7 +54,7 @@ extern unsigned long __sw_hweight64(__u64 w);
 #define __check_bitop_pr(name)						\
 	static_assert(__same_type(arch_##name, generic_##name) &&	\
 		      __same_type(const_##name, generic_##name) &&	\
-		      __same_type(name, generic_##name))
+		      __same_type(_##name, generic_##name))
 
 __check_bitop_pr(__set_bit);
 __check_bitop_pr(__clear_bit);
diff --git a/tools/include/asm-generic/bitops/non-atomic.h b/tools/include/asm-generic/bitops/non-atomic.h
index e5e78e42e57b..0c472a833408 100644
--- a/tools/include/asm-generic/bitops/non-atomic.h
+++ b/tools/include/asm-generic/bitops/non-atomic.h
@@ -5,7 +5,7 @@
 #include <linux/bits.h>
 
 /**
- * __set_bit - Set a bit in memory
+ * ___set_bit - Set a bit in memory
  * @nr: the bit to set
  * @addr: the address to start counting from
  *
@@ -14,7 +14,7 @@
  * may be that only one operation succeeds.
  */
 static __always_inline void
-__set_bit(unsigned long nr, volatile unsigned long *addr)
+___set_bit(unsigned long nr, volatile unsigned long *addr)
 {
 	unsigned long mask = BIT_MASK(nr);
 	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
@@ -23,7 +23,7 @@ __set_bit(unsigned long nr, volatile unsigned long *addr)
 }
 
 static __always_inline void
-__clear_bit(unsigned long nr, volatile unsigned long *addr)
+___clear_bit(unsigned long nr, volatile unsigned long *addr)
 {
 	unsigned long mask = BIT_MASK(nr);
 	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
@@ -32,7 +32,7 @@ __clear_bit(unsigned long nr, volatile unsigned long *addr)
 }
 
 /**
- * __change_bit - Toggle a bit in memory
+ * ___change_bit - Toggle a bit in memory
  * @nr: the bit to change
  * @addr: the address to start counting from
  *
@@ -41,7 +41,7 @@ __clear_bit(unsigned long nr, volatile unsigned long *addr)
  * may be that only one operation succeeds.
  */
 static __always_inline void
-__change_bit(unsigned long nr, volatile unsigned long *addr)
+___change_bit(unsigned long nr, volatile unsigned long *addr)
 {
 	unsigned long mask = BIT_MASK(nr);
 	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
@@ -50,7 +50,7 @@ __change_bit(unsigned long nr, volatile unsigned long *addr)
 }
 
 /**
- * __test_and_set_bit - Set a bit and return its old value
+ * ___test_and_set_bit - Set a bit and return its old value
  * @nr: Bit to set
  * @addr: Address to count from
  *
@@ -59,7 +59,7 @@ __change_bit(unsigned long nr, volatile unsigned long *addr)
  * but actually fail.  You must protect multiple accesses with a lock.
  */
 static __always_inline bool
-__test_and_set_bit(unsigned long nr, volatile unsigned long *addr)
+___test_and_set_bit(unsigned long nr, volatile unsigned long *addr)
 {
 	unsigned long mask = BIT_MASK(nr);
 	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
@@ -70,7 +70,7 @@ __test_and_set_bit(unsigned long nr, volatile unsigned long *addr)
 }
 
 /**
- * __test_and_clear_bit - Clear a bit and return its old value
+ * ___test_and_clear_bit - Clear a bit and return its old value
  * @nr: Bit to clear
  * @addr: Address to count from
  *
@@ -79,7 +79,7 @@ __test_and_set_bit(unsigned long nr, volatile unsigned long *addr)
  * but actually fail.  You must protect multiple accesses with a lock.
  */
 static __always_inline bool
-__test_and_clear_bit(unsigned long nr, volatile unsigned long *addr)
+___test_and_clear_bit(unsigned long nr, volatile unsigned long *addr)
 {
 	unsigned long mask = BIT_MASK(nr);
 	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
@@ -91,7 +91,7 @@ __test_and_clear_bit(unsigned long nr, volatile unsigned long *addr)
 
 /* WARNING: non atomic and it can be reordered! */
 static __always_inline bool
-__test_and_change_bit(unsigned long nr, volatile unsigned long *addr)
+___test_and_change_bit(unsigned long nr, volatile unsigned long *addr)
 {
 	unsigned long mask = BIT_MASK(nr);
 	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
@@ -102,12 +102,12 @@ __test_and_change_bit(unsigned long nr, volatile unsigned long *addr)
 }
 
 /**
- * test_bit - Determine whether a bit is set
+ * _test_bit - Determine whether a bit is set
  * @nr: bit number to test
  * @addr: Address to start counting from
  */
 static __always_inline bool
-test_bit(unsigned long nr, const volatile unsigned long *addr)
+_test_bit(unsigned long nr, const volatile unsigned long *addr)
 {
 	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
 }
diff --git a/tools/include/linux/bitops.h b/tools/include/linux/bitops.h
index 5fca38fe1ba8..f18683b95ea6 100644
--- a/tools/include/linux/bitops.h
+++ b/tools/include/linux/bitops.h
@@ -25,6 +25,22 @@ extern unsigned int __sw_hweight16(unsigned int w);
 extern unsigned int __sw_hweight32(unsigned int w);
 extern unsigned long __sw_hweight64(__u64 w);
 
+/*
+ * Defined here because those may be needed by architecture-specific static
+ * inlines.
+ */
+
+#define bitop(op, nr, addr)						\
+	op(nr, addr)
+
+#define __set_bit(nr, addr)		bitop(___set_bit, nr, addr)
+#define __clear_bit(nr, addr)		bitop(___clear_bit, nr, addr)
+#define __change_bit(nr, addr)		bitop(___change_bit, nr, addr)
+#define __test_and_set_bit(nr, addr)	bitop(___test_and_set_bit, nr, addr)
+#define __test_and_clear_bit(nr, addr)	bitop(___test_and_clear_bit, nr, addr)
+#define __test_and_change_bit(nr, addr)	bitop(___test_and_change_bit, nr, addr)
+#define test_bit(nr, addr)		bitop(_test_bit, nr, addr)
+
 /*
  * Include this here because some architectures need generic_ffs/fls in
  * scope
-- 
2.36.1

