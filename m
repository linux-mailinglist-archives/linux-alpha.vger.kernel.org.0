Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC137BF83A
	for <lists+linux-alpha@lfdr.de>; Thu, 26 Sep 2019 19:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbfIZR47 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 26 Sep 2019 13:56:59 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44112 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728164AbfIZR4d (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 26 Sep 2019 13:56:33 -0400
Received: by mail-pf1-f193.google.com with SMTP id q21so2232755pfn.11
        for <linux-alpha@vger.kernel.org>; Thu, 26 Sep 2019 10:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DewAllPq01LncnaE6NYCCskktLTPQ+Oq7qAAM5yWaKA=;
        b=GqCpdlt27oIxoalJ+q55GpBWVA+O9B4EMwRWAPEitDTY5x/y/r3wW9KbkZvPr2V4X/
         S8caIKThukUOlDs2WCows35gv3FJcnOv4JTcjIQERxd+vzGaspWFjmHz3dbggEHqAL0H
         9XgrssZH7A/r46cr0/K6ftOAUAm1WnB4t7vdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DewAllPq01LncnaE6NYCCskktLTPQ+Oq7qAAM5yWaKA=;
        b=eNlpafw22duOaFts5H0TeddUsKU//Bv+T8KpI6f4quLsLfcbQhuE7/fzA+ysd+huEl
         pRVVFHUUWaYoJ47a4AjHsCrI9SepiTT3xy7wo3O+/qLHZeMIOforzogGTRK538ApJaKT
         XIfu9uC9/3cG+1sOs8Gz5/Bs4wyxdpktUU0xylThUAFkqDsvQnWdfW8Yeuk4iBOSZz6t
         oeFvZB9uclbUCo5mc6GSo2pJq0ky/4jByn++Vov2jeaz29K51v0GqKNNop3d1j0wyn0i
         Q/T25IgR/sChE0a5BVCBoFeyJNo4S+IwkCn1jQlTsjGxra+zIwjz9C+6U2pSkPqzYlCS
         lQwg==
X-Gm-Message-State: APjAAAUJkHXJ2Hxnj21C/zy7A3PwfC7NalPy7cvMuS90FIEIQLOI2tMa
        1FLKMlK7DYUma1du7gacoPtYKg==
X-Google-Smtp-Source: APXvYqy6lsJedhQhLRYmBsUadf9UZQvX3qa3S7SjzPO8c/ioUQ997KVZPcsBQte8g5aQEg6d61NfYg==
X-Received: by 2002:a65:5c0b:: with SMTP id u11mr4650029pgr.294.1569520592850;
        Thu, 26 Sep 2019 10:56:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m2sm3024583pgc.19.2019.09.26.10.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 10:56:30 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Kees Cook <keescook@chromium.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-c6x-dev@linux-c6x.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, x86@kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 24/29] powerpc: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Thu, 26 Sep 2019 10:55:57 -0700
Message-Id: <20190926175602.33098-25-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
References: <20190926175602.33098-1-keescook@chromium.org>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

The EXCEPTION_TABLE is read-only, so collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 4e7cec088c8b..2ed44e5824d5 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -7,6 +7,7 @@
 
 #define BSS_FIRST_SECTIONS *(.bss.prominit)
 #define EMITS_PT_NOTE
+#define RO_DATA_EXCEPTION_TABLE_ALIGN	0
 
 #include <asm/page.h>
 #include <asm-generic/vmlinux.lds.h>
@@ -162,7 +163,6 @@ SECTIONS
 		__stop__btb_flush_fixup = .;
 	}
 #endif
-	EXCEPTION_TABLE(0)
 
 /*
  * Init sections discarded at runtime
-- 
2.17.1

