Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA8CE9174
	for <lists+linux-alpha@lfdr.de>; Tue, 29 Oct 2019 22:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729669AbfJ2VOU (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 29 Oct 2019 17:14:20 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45935 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729595AbfJ2VOS (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 29 Oct 2019 17:14:18 -0400
Received: by mail-pl1-f194.google.com with SMTP id y24so8286513plr.12
        for <linux-alpha@vger.kernel.org>; Tue, 29 Oct 2019 14:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=C4qrRt1wPf/MBbE+aHUnjpKB3JMiaG6wbnmkvfoIFU0=;
        b=KXyB+1WxXpRP1vWrTaJvj7/3l6dZgZlVJLpBPmFcRTDvj8Ze6KOK96KmDFNZoVzzIn
         FNtvoTTZBOIZiH1ckNR5s2SdRXfn3U8w4gXuf0hv6uGKH33p7qdqUGgLP3Z3IwHF72Rt
         c6i0OYnFF5k/KZH8c9IKWHI/dw4IAGrGwpkm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=C4qrRt1wPf/MBbE+aHUnjpKB3JMiaG6wbnmkvfoIFU0=;
        b=DLWRr3Ns48axbvNGzbDLcHfkk8Grqi9DcwfO+R98jyoJGkE8+BAClXm815jv/Hg7Ti
         236PVexlBOlVsSOwr1VtpfJDHM4qV2UxgczJdiNOvA7/9qFatfkXCbQNThQWYEatRV3X
         oQ4FzRbWhrnebC93gxubYPY8mPt/PTlDR+6ZlLvLLY6g7EuqxzDj9u9qKaA9Uh1VnaiK
         5D5cPjTK5NOztj2aV6rR23JvxIXqTcFIKTpNwOR/mrrleiQn/SmzBhKYNDeEMu2spovS
         ybmCBQQ3/lu5o9pfKEh+v5q0Kpajtmy6J8iEeLgYPEeSM7oqWRRadAY8B39Bt14uWG2G
         n5og==
X-Gm-Message-State: APjAAAVNUnc5mzT+LkGJ0hgIJ/HISAl+XrPUP4evB3OEdEsz/DqPEJ5n
        1uRzZdrmax1Eo8DHDk00+NSr4g==
X-Google-Smtp-Source: APXvYqzLrCU++P8bG2JYbV2LJH3eTrhCIrakhV3jmJylmE00AO+0AGji7cSC9oxRISHhfN0jqpW9xA==
X-Received: by 2002:a17:902:ba94:: with SMTP id k20mr767116pls.312.1572383656422;
        Tue, 29 Oct 2019 14:14:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s14sm44942pfe.52.2019.10.29.14.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 14:14:12 -0700 (PDT)
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
Subject: [PATCH v3 17/29] alpha: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Tue, 29 Oct 2019 14:13:39 -0700
Message-Id: <20191029211351.13243-18-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/alpha/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index edc45f45523b..bc6f727278fd 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 #define EMITS_PT_NOTE
+#define RO_EXCEPTION_TABLE_ALIGN	16
 
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/thread_info.h>
@@ -35,7 +36,6 @@ SECTIONS
 	_etext = .;	/* End of text section */
 
 	RO_DATA(4096)
-	EXCEPTION_TABLE(16)
 
 	/* Will be freed after init */
 	__init_begin = ALIGN(PAGE_SIZE);
-- 
2.17.1

