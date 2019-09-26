Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2854BF8A9
	for <lists+linux-alpha@lfdr.de>; Thu, 26 Sep 2019 20:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbfIZSFW (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 26 Sep 2019 14:05:22 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42084 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727842AbfIZSFV (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 26 Sep 2019 14:05:21 -0400
Received: by mail-pl1-f193.google.com with SMTP id e5so1369435pls.9
        for <linux-alpha@vger.kernel.org>; Thu, 26 Sep 2019 11:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LBq+xea/ZmJQ/9uj4ezLaR0vyHYQneqqBGeQvqqFY5g=;
        b=YyccQSUv7s3dpyKNfcnsTuVNk/Y6kwXh+M8oxRRtdUgW8nSUtTYRC0g/WriqeXH9y2
         wwVCXNxHIivS7mTiFSK+TSyzV+h8hVp4SAUn1izuVQbvw0l7XMGaQM6lK95NH4vmtwbU
         BZR9POA+VLIcdjNACdsaoN48Vcx862rY58h7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LBq+xea/ZmJQ/9uj4ezLaR0vyHYQneqqBGeQvqqFY5g=;
        b=kqyWcq6xf9erewu3g84RxRwR/dPI/0kwCrM3ljj4NqkhZw8rbyE5PefUNeg2uY5OXE
         MZ28AHwRehpdIf8uDIb52zsVTw92C7Gsrg+IfeO+5XsbgVJacj5nKLu9J30v5qniErV5
         B3wIWQDeAJkb4N8lhZwxlOJiOxjtvhuJ/h2UE3vWxfrOGafwi9infJ/rr64YOcMXjIiZ
         zofTVcuDDElZfSJ0duTf4cHC1PjbvAqV2b4zRyFLWCJZKYX1cZnwvgoHRP83071wJ2XN
         X1c2nbxultz7vZA4fg9gmpRKpKgJer8/DjdjY+LmEy/EF+Ssu7saktlTreo7YelT3bIr
         Qrvg==
X-Gm-Message-State: APjAAAXsVTSUaL7dDzNsdCOgPIVGey6sN5pG4pOTlCIlxHXSOfYGiG2g
        Xtp4fJog0hCZzg41RFg0SvKEnA==
X-Google-Smtp-Source: APXvYqzkn6dvMB+EvQiPjIgquz94zhqgnJASSzAj4vbdHobiWS7v9jA7Bv9z5kMPyHOm+3eNniFkDQ==
X-Received: by 2002:a17:902:a618:: with SMTP id u24mr5406606plq.76.1569521121016;
        Thu, 26 Sep 2019 11:05:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e127sm3746231pfe.37.2019.09.26.11.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 11:05:20 -0700 (PDT)
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
Subject: [PATCH 16/29] x86: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Thu, 26 Sep 2019 10:55:49 -0700
Message-Id: <20190926175602.33098-17-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
References: <20190926175602.33098-1-keescook@chromium.org>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

The exception table was needlessly marked executable. In preparation
for execute-only memory, this moves the table into the RO_DATA segment
via a new macro that can be used by any architectures that want to make
a similar consolidation.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/kernel/vmlinux.lds.S | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index a1a758e25b2b..a5c8571e4967 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -22,6 +22,7 @@
 #endif
 
 #define EMITS_PT_NOTE
+#define RO_DATA_EXCEPTION_TABLE_ALIGN	16
 
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/asm-offsets.h>
@@ -145,8 +146,6 @@ SECTIONS
 #endif
 	} :text = 0x9090
 
-	EXCEPTION_TABLE(16)
-
 	/* End of text section, which should occupy whole number of pages */
 	_etext = .;
 	. = ALIGN(PAGE_SIZE);
-- 
2.17.1

