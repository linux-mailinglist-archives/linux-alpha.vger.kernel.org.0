Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECD4AE91CB
	for <lists+linux-alpha@lfdr.de>; Tue, 29 Oct 2019 22:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729867AbfJ2VUh (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 29 Oct 2019 17:20:37 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36005 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfJ2VUh (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 29 Oct 2019 17:20:37 -0400
Received: by mail-pg1-f195.google.com with SMTP id j22so4498485pgh.3
        for <linux-alpha@vger.kernel.org>; Tue, 29 Oct 2019 14:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lRKWSrTg286Thkv+067O15xYlsz/vHDryK8riTvVVz8=;
        b=lsjBqilbjWU6MFS9rWcLcOQWyRD6+SCcmlhZrfeAUwJdFdYUrV/zJyYe6p7W1rK6+q
         aZ5/h2E089XLOUAZvSt5SmEWcBN0H8NMuVg5brQ2m/jentO0kOqeNqJv4AAtVylP/JIH
         ZX2zbsJfyPROvvu5hMlEGCv2/Yg6Z35TRgjZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lRKWSrTg286Thkv+067O15xYlsz/vHDryK8riTvVVz8=;
        b=f8D6EEv0WSBqsGIIGamcZu6RFK0/YyCP/QhkRmZwcx2GFgnc87lFGBGw/7PYp3/jmg
         lG4QsiWHfRiAGJLi0crXJOdgZv/MBKjn64PORTcxXvABL7bNkYRQbAQmwE436CVOXAL/
         unBqvT2I9qvTAt8MIc//sUOYoWd/QgNv55mJIrIZtCdNwC86/Oo3v6sx7D5l0c4V+7ra
         poM6THBEQSMMjjPt3BnBKVOVeykjIlSaU45/JddbYKTVE1RGSWB1hUuESZPzaIhiOlnK
         n6VWzwwQPh1Y3JyUgyBkRyWWhJDZQSGwoxHJGRhucUfyT0X8ak7IIvCK7FSPKs428eZo
         3a/Q==
X-Gm-Message-State: APjAAAUnGAQKv+2z14Rr4N005DQcb/KTErSS+SjxZtfDMn2h9Z6N4R8o
        GeAdUQ7FLKN++NMHq00T1tqrOw==
X-Google-Smtp-Source: APXvYqy81jTT4HhfJE3tNPm8FNZPIHWb+gbOtqbnHh99X62BzwI3PfmgAlElXpAuHV2q2+VJspYBVw==
X-Received: by 2002:a17:90a:2e18:: with SMTP id q24mr9282951pjd.61.1572384035602;
        Tue, 29 Oct 2019 14:20:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h9sm50793pjh.8.2019.10.29.14.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 14:20:32 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Kees Cook <keescook@chromium.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-c6x-dev@linux-c6x.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Michal Simek <monstr@monstr.eu>
Subject: [PATCH v3 13/29] vmlinux.lds.h: Replace RW_DATA_SECTION with RW_DATA
Date:   Tue, 29 Oct 2019 14:13:35 -0700
Message-Id: <20191029211351.13243-14-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Rename RW_DATA_SECTION to RW_DATA. (Calling this a "section" is a lie,
since it's multiple sections and section flags cannot be applied to
the macro.)

Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Heiko Carstens <heiko.carstens@de.ibm.com> # s390
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
---
 arch/alpha/kernel/vmlinux.lds.S      | 2 +-
 arch/arc/kernel/vmlinux.lds.S        | 2 +-
 arch/arm/kernel/vmlinux-xip.lds.S    | 2 +-
 arch/arm/kernel/vmlinux.lds.S        | 2 +-
 arch/arm64/kernel/vmlinux.lds.S      | 2 +-
 arch/csky/kernel/vmlinux.lds.S       | 2 +-
 arch/h8300/kernel/vmlinux.lds.S      | 2 +-
 arch/hexagon/kernel/vmlinux.lds.S    | 2 +-
 arch/m68k/kernel/vmlinux-nommu.lds   | 2 +-
 arch/m68k/kernel/vmlinux-std.lds     | 2 +-
 arch/m68k/kernel/vmlinux-sun3.lds    | 2 +-
 arch/microblaze/kernel/vmlinux.lds.S | 2 +-
 arch/nds32/kernel/vmlinux.lds.S      | 2 +-
 arch/nios2/kernel/vmlinux.lds.S      | 2 +-
 arch/openrisc/kernel/vmlinux.lds.S   | 2 +-
 arch/parisc/kernel/vmlinux.lds.S     | 2 +-
 arch/riscv/kernel/vmlinux.lds.S      | 2 +-
 arch/s390/kernel/vmlinux.lds.S       | 2 +-
 arch/sh/kernel/vmlinux.lds.S         | 2 +-
 arch/sparc/kernel/vmlinux.lds.S      | 2 +-
 arch/unicore32/kernel/vmlinux.lds.S  | 2 +-
 arch/xtensa/kernel/vmlinux.lds.S     | 2 +-
 include/asm-generic/vmlinux.lds.h    | 4 ++--
 23 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index af411817dd7d..edc45f45523b 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -50,7 +50,7 @@ SECTIONS
 
 	_sdata = .;	/* Start of rw data section */
 	_data = .;
-	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
+	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 
 	.got : {
 		*(.got)
diff --git a/arch/arc/kernel/vmlinux.lds.S b/arch/arc/kernel/vmlinux.lds.S
index 7d1d27066deb..54139a6f469b 100644
--- a/arch/arc/kernel/vmlinux.lds.S
+++ b/arch/arc/kernel/vmlinux.lds.S
@@ -101,7 +101,7 @@ SECTIONS
 	 * 1. this is .data essentially
 	 * 2. THREAD_SIZE for init.task, must be kernel-stk sz aligned
 	 */
-	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
+	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 
 	_edata = .;
 
diff --git a/arch/arm/kernel/vmlinux-xip.lds.S b/arch/arm/kernel/vmlinux-xip.lds.S
index d2a9651c24ad..21b8b271c80d 100644
--- a/arch/arm/kernel/vmlinux-xip.lds.S
+++ b/arch/arm/kernel/vmlinux-xip.lds.S
@@ -112,7 +112,7 @@ SECTIONS
 
 	. = ALIGN(THREAD_SIZE);
 	_sdata = .;
-	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
+	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 	.data.ro_after_init : AT(ADDR(.data.ro_after_init) - LOAD_OFFSET) {
 		*(.data..ro_after_init)
 	}
diff --git a/arch/arm/kernel/vmlinux.lds.S b/arch/arm/kernel/vmlinux.lds.S
index 068db6860867..319ccb10846a 100644
--- a/arch/arm/kernel/vmlinux.lds.S
+++ b/arch/arm/kernel/vmlinux.lds.S
@@ -141,7 +141,7 @@ SECTIONS
 	__init_end = .;
 
 	_sdata = .;
-	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
+	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 	_edata = .;
 
 	BSS_SECTION(0, 0, 0)
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index e7dafc29b1fa..a4b3e6c0680c 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -214,7 +214,7 @@ SECTIONS
 
 	_data = .;
 	_sdata = .;
-	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_ALIGN)
+	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_ALIGN)
 
 	/*
 	 * Data written with the MMU off but read with the MMU on requires
diff --git a/arch/csky/kernel/vmlinux.lds.S b/arch/csky/kernel/vmlinux.lds.S
index 8598bd7a7bcd..2ff37beaf2bf 100644
--- a/arch/csky/kernel/vmlinux.lds.S
+++ b/arch/csky/kernel/vmlinux.lds.S
@@ -50,7 +50,7 @@ SECTIONS
 
 	_sdata = .;
 	RO_DATA(PAGE_SIZE)
-	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
+	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 	_edata = .;
 
 	EXCEPTION_TABLE(L1_CACHE_BYTES)
diff --git a/arch/h8300/kernel/vmlinux.lds.S b/arch/h8300/kernel/vmlinux.lds.S
index d3247d33b115..2ac7bdcd2fe0 100644
--- a/arch/h8300/kernel/vmlinux.lds.S
+++ b/arch/h8300/kernel/vmlinux.lds.S
@@ -47,7 +47,7 @@ SECTIONS
 #endif
 	_sdata = . ;
 	__data_start = . ;
-	RW_DATA_SECTION(0, PAGE_SIZE, THREAD_SIZE)
+	RW_DATA(0, PAGE_SIZE, THREAD_SIZE)
 #if defined(CONFIG_ROMKERNEL)
 #undef ADDR
 #endif
diff --git a/arch/hexagon/kernel/vmlinux.lds.S b/arch/hexagon/kernel/vmlinux.lds.S
index 0145251fa317..0ca2471ddb9f 100644
--- a/arch/hexagon/kernel/vmlinux.lds.S
+++ b/arch/hexagon/kernel/vmlinux.lds.S
@@ -49,7 +49,7 @@ SECTIONS
 	INIT_DATA_SECTION(PAGE_SIZE)
 
 	_sdata = .;
-		RW_DATA_SECTION(32,PAGE_SIZE,_THREAD_SIZE)
+		RW_DATA(32,PAGE_SIZE,_THREAD_SIZE)
 		RO_DATA(PAGE_SIZE)
 	_edata = .;
 
diff --git a/arch/m68k/kernel/vmlinux-nommu.lds b/arch/m68k/kernel/vmlinux-nommu.lds
index de80f8b8ae78..7b975420c3d9 100644
--- a/arch/m68k/kernel/vmlinux-nommu.lds
+++ b/arch/m68k/kernel/vmlinux-nommu.lds
@@ -61,7 +61,7 @@ SECTIONS {
 
 	_sdata = .;
 	RO_DATA(PAGE_SIZE)
-	RW_DATA_SECTION(16, PAGE_SIZE, THREAD_SIZE)
+	RW_DATA(16, PAGE_SIZE, THREAD_SIZE)
 	_edata = .;
 
 	EXCEPTION_TABLE(16)
diff --git a/arch/m68k/kernel/vmlinux-std.lds b/arch/m68k/kernel/vmlinux-std.lds
index 625a5785804f..6e7eb49ed985 100644
--- a/arch/m68k/kernel/vmlinux-std.lds
+++ b/arch/m68k/kernel/vmlinux-std.lds
@@ -33,7 +33,7 @@ SECTIONS
 
   RODATA
 
-  RW_DATA_SECTION(16, PAGE_SIZE, THREAD_SIZE)
+  RW_DATA(16, PAGE_SIZE, THREAD_SIZE)
 
   BSS_SECTION(0, 0, 0)
 
diff --git a/arch/m68k/kernel/vmlinux-sun3.lds b/arch/m68k/kernel/vmlinux-sun3.lds
index 9868270b0984..1a0ad6b6dd8c 100644
--- a/arch/m68k/kernel/vmlinux-sun3.lds
+++ b/arch/m68k/kernel/vmlinux-sun3.lds
@@ -30,7 +30,7 @@ SECTIONS
 
   EXCEPTION_TABLE(16) :data
   _sdata = .;			/* Start of rw data section */
-  RW_DATA_SECTION(16, PAGE_SIZE, THREAD_SIZE) :data
+  RW_DATA(16, PAGE_SIZE, THREAD_SIZE) :data
   /* End of data goes *here* so that freeing init code works properly. */
   _edata = .;
   NOTES
diff --git a/arch/microblaze/kernel/vmlinux.lds.S b/arch/microblaze/kernel/vmlinux.lds.S
index 2299694748ea..b8efb08204a1 100644
--- a/arch/microblaze/kernel/vmlinux.lds.S
+++ b/arch/microblaze/kernel/vmlinux.lds.S
@@ -69,7 +69,7 @@ SECTIONS {
 	}
 
 	_sdata = . ;
-	RW_DATA_SECTION(32, PAGE_SIZE, THREAD_SIZE)
+	RW_DATA(32, PAGE_SIZE, THREAD_SIZE)
 	_edata = . ;
 
 	/* Under the microblaze ABI, .sdata and .sbss must be contiguous */
diff --git a/arch/nds32/kernel/vmlinux.lds.S b/arch/nds32/kernel/vmlinux.lds.S
index 10ff570ba95b..f679d3397436 100644
--- a/arch/nds32/kernel/vmlinux.lds.S
+++ b/arch/nds32/kernel/vmlinux.lds.S
@@ -54,7 +54,7 @@ SECTIONS
 
 	_sdata = .;
 	RO_DATA(PAGE_SIZE)
-	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
+	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 	_edata  =  .;
 
 	EXCEPTION_TABLE(16)
diff --git a/arch/nios2/kernel/vmlinux.lds.S b/arch/nios2/kernel/vmlinux.lds.S
index 318804a2c7a1..c55a7cfa1075 100644
--- a/arch/nios2/kernel/vmlinux.lds.S
+++ b/arch/nios2/kernel/vmlinux.lds.S
@@ -50,7 +50,7 @@ SECTIONS
 
 	_sdata = .;
 	RO_DATA(PAGE_SIZE)
-	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
+	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 	_edata = .;
 
 	BSS_SECTION(0, 0, 0)
diff --git a/arch/openrisc/kernel/vmlinux.lds.S b/arch/openrisc/kernel/vmlinux.lds.S
index f73e0d3ea09f..60449fd7f16f 100644
--- a/arch/openrisc/kernel/vmlinux.lds.S
+++ b/arch/openrisc/kernel/vmlinux.lds.S
@@ -74,7 +74,7 @@ SECTIONS
 	/* Whatever comes after _e_kernel_ro had better be page-aligend, too */
 
 	/* 32 here is cacheline size... recheck this */
-	RW_DATA_SECTION(32, PAGE_SIZE, PAGE_SIZE)
+	RW_DATA(32, PAGE_SIZE, PAGE_SIZE)
 
         _edata  =  .;
 
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index e1c563c7dca1..12b3d7d5e9e4 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -148,7 +148,7 @@ SECTIONS
 	data_start = .;
 
 	/* Data */
-	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, PAGE_SIZE)
+	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, PAGE_SIZE)
 
 	/* PA-RISC locks requires 16-byte alignment */
 	. = ALIGN(16);
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 66dc17d24dd9..12f42f96d46e 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -57,7 +57,7 @@ SECTIONS
 		*(.srodata*)
 	}
 
-	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
+	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 	.sdata : {
 		__global_pointer$ = . + 0x800;
 		*(.sdata*)
diff --git a/arch/s390/kernel/vmlinux.lds.S b/arch/s390/kernel/vmlinux.lds.S
index b33c4823f8b5..37695499717d 100644
--- a/arch/s390/kernel/vmlinux.lds.S
+++ b/arch/s390/kernel/vmlinux.lds.S
@@ -67,7 +67,7 @@ SECTIONS
 	. = ALIGN(PAGE_SIZE);
 	__end_ro_after_init = .;
 
-	RW_DATA_SECTION(0x100, PAGE_SIZE, THREAD_SIZE)
+	RW_DATA(0x100, PAGE_SIZE, THREAD_SIZE)
 	BOOT_DATA_PRESERVED
 
 	_edata = .;		/* End of data section */
diff --git a/arch/sh/kernel/vmlinux.lds.S b/arch/sh/kernel/vmlinux.lds.S
index fef39054cc70..c60b19958c35 100644
--- a/arch/sh/kernel/vmlinux.lds.S
+++ b/arch/sh/kernel/vmlinux.lds.S
@@ -51,7 +51,7 @@ SECTIONS
 
 	_sdata = .;
 	RO_DATA(PAGE_SIZE)
-	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
+	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 	_edata = .;
 
 	DWARF_EH_FRAME
diff --git a/arch/sparc/kernel/vmlinux.lds.S b/arch/sparc/kernel/vmlinux.lds.S
index 8929fbc35a80..7ec79918b566 100644
--- a/arch/sparc/kernel/vmlinux.lds.S
+++ b/arch/sparc/kernel/vmlinux.lds.S
@@ -67,7 +67,7 @@ SECTIONS
 	.data1 : {
 		*(.data1)
 	}
-	RW_DATA_SECTION(SMP_CACHE_BYTES, 0, THREAD_SIZE)
+	RW_DATA(SMP_CACHE_BYTES, 0, THREAD_SIZE)
 
 	/* End of data section */
 	_edata = .;
diff --git a/arch/unicore32/kernel/vmlinux.lds.S b/arch/unicore32/kernel/vmlinux.lds.S
index 367c80313bec..6fb320b337ef 100644
--- a/arch/unicore32/kernel/vmlinux.lds.S
+++ b/arch/unicore32/kernel/vmlinux.lds.S
@@ -44,7 +44,7 @@ SECTIONS
 
 	_sdata = .;
 	RO_DATA(PAGE_SIZE)
-	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
+	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 	_edata = .;
 
 	EXCEPTION_TABLE(L1_CACHE_BYTES)
diff --git a/arch/xtensa/kernel/vmlinux.lds.S b/arch/xtensa/kernel/vmlinux.lds.S
index b97e5798b9cf..bdbd7c4056c1 100644
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@ -134,7 +134,7 @@ SECTIONS
   /* Data section */
 
   _sdata = .;
-  RW_DATA_SECTION(XCHAL_ICACHE_LINESIZE, PAGE_SIZE, THREAD_SIZE)
+  RW_DATA(XCHAL_ICACHE_LINESIZE, PAGE_SIZE, THREAD_SIZE)
   _edata = .;
 
   /* Initialization code and data: */
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 061e57c609f6..356078e50a5c 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -24,7 +24,7 @@
  *
  *      _sdata = .;
  *	RO_DATA(PAGE_SIZE)
- *	RW_DATA_SECTION(...)
+ *	RW_DATA(...)
  *	_edata = .;
  *
  *	EXCEPTION_TABLE(...)
@@ -975,7 +975,7 @@
  * matches the requirement of PAGE_ALIGNED_DATA.
  *
  * use 0 as page_align if page_aligned data is not used */
-#define RW_DATA_SECTION(cacheline, pagealigned, inittask)		\
+#define RW_DATA(cacheline, pagealigned, inittask)			\
 	. = ALIGN(PAGE_SIZE);						\
 	.data : AT(ADDR(.data) - LOAD_OFFSET) {				\
 		INIT_TASK_DATA(inittask)				\
-- 
2.17.1

