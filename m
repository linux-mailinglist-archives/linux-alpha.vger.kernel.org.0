Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9743BE914A
	for <lists+linux-alpha@lfdr.de>; Tue, 29 Oct 2019 22:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728592AbfJ2VOG (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 29 Oct 2019 17:14:06 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33255 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729072AbfJ2VOE (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 29 Oct 2019 17:14:04 -0400
Received: by mail-pl1-f193.google.com with SMTP id y8so8320403plk.0
        for <linux-alpha@vger.kernel.org>; Tue, 29 Oct 2019 14:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JlR9HB+AtjkcOVkmTX2Eg2H+ZftC0HH+zvchdZkpMjY=;
        b=Vu+Cz3Bdr08FSpvurZE6wBEe8DPddNVCED4EbuBPLwaTYSq1C3hmodOBylEmeZ5fDF
         y1zF6hUioUHj4Jt94NznScqaHTONpB2VPrjf+1SWvp2je3tJCr6C8uetE+3Pf1UJpm+s
         lVZUPSKcsBhxaTrvaBH+v13ap8LI2UehQEeHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JlR9HB+AtjkcOVkmTX2Eg2H+ZftC0HH+zvchdZkpMjY=;
        b=faS040lx4ttuU5F7dgwFI+vWPvUwfDV9z3hmJyAlt/+daz+jNXJ1baKkcK3R3PAo4c
         S2WeC/q8E1U016NMiOeZu+yf06Ul93GAPlotrxjGEPO6rtj0GNJDtF8pR/7FTaT+0nK8
         4vdj3VA0YS1r3Zsnkm+zbtTetI1ItZf5gU1FQdBwFj8kngifZOYjsMALkAAif2AqNe43
         MpMXU6hZ10T8I2xRyId3wohWERPuElOXxQ/U9oEXFrCwbnzqAKt78WvXANpAKpAKa7yi
         Ib+2pZ2MEoGh9l4SRczXlYj7suIq9ZOHBUqj22xT8fcCi4DoHO/HiXqNzuberU4aGeqK
         jeHw==
X-Gm-Message-State: APjAAAUX03XQoVX66qKU6VdcNFyyLakgWgpChb4O61+FdoFg8IrQ+Q05
        SOKLtS+qiv1/laRSSyjg5Q0FrC2l1Jc=
X-Google-Smtp-Source: APXvYqw+HrHYWhGYydF8kNZSKv8NuZ4R4TmpMJCE64dPlGrdUiNxIUpv7BIOTO3KxcC7XYK68jIPIA==
X-Received: by 2002:a17:902:9f81:: with SMTP id g1mr801835plq.82.1572383643666;
        Tue, 29 Oct 2019 14:14:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a8sm51854pff.5.2019.10.29.14.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 14:14:00 -0700 (PDT)
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
Subject: [PATCH v3 03/29] powerpc: Rename PT_LOAD identifier "kernel" to "text"
Date:   Tue, 29 Oct 2019 14:13:25 -0700
Message-Id: <20191029211351.13243-4-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

In preparation for moving NOTES into RO_DATA, rename the linker script
internal identifier for the PT_LOAD Program Header from "kernel" to
"text" to match other architectures.

Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/vmlinux.lds.S | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index a3c8492b2b19..e184a63aa5b0 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -18,7 +18,7 @@
 ENTRY(_stext)
 
 PHDRS {
-	kernel PT_LOAD FLAGS(7); /* RWX */
+	text PT_LOAD FLAGS(7); /* RWX */
 	note PT_NOTE FLAGS(0);
 }
 
@@ -63,7 +63,7 @@ SECTIONS
 #else /* !CONFIG_PPC64 */
 		HEAD_TEXT
 #endif
-	} :kernel
+	} :text
 
 	__head_end = .;
 
@@ -112,7 +112,7 @@ SECTIONS
 		__got2_end = .;
 #endif /* CONFIG_PPC32 */
 
-	} :kernel
+	} :text
 
 	. = ALIGN(ETEXT_ALIGN_SIZE);
 	_etext = .;
@@ -163,9 +163,9 @@ SECTIONS
 #endif
 	EXCEPTION_TABLE(0)
 
-	NOTES :kernel :note
+	NOTES :text :note
 	/* Restore program header away from PT_NOTE. */
-	.dummy : { *(.dummy) } :kernel
+	.dummy : { *(.dummy) } :text
 
 /*
  * Init sections discarded at runtime
@@ -180,7 +180,7 @@ SECTIONS
 #ifdef CONFIG_PPC64
 		*(.tramp.ftrace.init);
 #endif
-	} :kernel
+	} :text
 
 	/* .exit.text is discarded at runtime, not link time,
 	 * to deal with references from __bug_table
-- 
2.17.1

