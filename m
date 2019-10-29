Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E26F7E9177
	for <lists+linux-alpha@lfdr.de>; Tue, 29 Oct 2019 22:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729620AbfJ2VOV (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 29 Oct 2019 17:14:21 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38685 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729601AbfJ2VOT (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 29 Oct 2019 17:14:19 -0400
Received: by mail-pg1-f193.google.com with SMTP id w3so10506636pgt.5
        for <linux-alpha@vger.kernel.org>; Tue, 29 Oct 2019 14:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=O8SEsfE9Vx0Hoh9SzPjKsL9yL1yAPo1QWRZUpqQZ5BE=;
        b=MVZa5dInIYyT6ti5/NzPmeCXtnqhowzk1esSCyG5Z9GszZCjPRJs6Uq1nYd3sgJ/iy
         I5nUIKu579OFsUgb17L62TPPY9/qPbLOFHiVmTqqoh0Us96LJOlq47Tr0Nf+DbCIpYU0
         LT6TLHPIsd3z+g0ec+N7peRpjdVoC7wJzSqzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=O8SEsfE9Vx0Hoh9SzPjKsL9yL1yAPo1QWRZUpqQZ5BE=;
        b=LM7NQKcoTQTqZ4y5+nBg5AX+4M56+mUlcoEZhKLHgytp0Ho6h2PTQ7uD0sAE0hX7+m
         4TGJ66CeoyM6RC8suwNlB5LEzgQscfEw23np+B1hi9m5lPbe/EbKsCWFzAB7wxZnHaUt
         ucGf09hGGvMqF+2Fb/Q6SWbWb2AzRYN+v9aCisVqwM/4qhRk0hboAHNtMcvmY+RU46b4
         /nQeHBuif67EEeE2CP1KAxQFt55+Lkm8TqSb2ggXTqSsOkA7XLeb/RFyIq89WJWzAART
         2MlGd4wmCU4l8FP4hNl+9chYbm99j4cr2CgNh0874VWtBb4BXS9EvT47ITv+f1/+2Jj6
         56fA==
X-Gm-Message-State: APjAAAUq55dZZYikvM8AlIig2WExWyHXSocrLXDB01WI1BkqNh7ejpcQ
        zixyfspGyjKzVp6fx3TJYxMNzw==
X-Google-Smtp-Source: APXvYqxMUhvu1n5WvrxswEvafiIeF+Kxf/nCho5z0X/7ybjlTknoEC2LOXXwkMiKGbP/o5SDd9yzaA==
X-Received: by 2002:a63:5c4a:: with SMTP id n10mr30299789pgm.120.1572383657598;
        Tue, 29 Oct 2019 14:14:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w2sm43191pjt.1.2019.10.29.14.14.05
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
Subject: [PATCH v3 14/29] vmlinux.lds.h: Allow EXCEPTION_TABLE to live in RO_DATA
Date:   Tue, 29 Oct 2019 14:13:36 -0700
Message-Id: <20191029211351.13243-15-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Many architectures have an EXCEPTION_TABLE that only needs to
be readable. As such, it should live in RO_DATA. Create a macro to
identify this case for the architectures that can move EXCEPTION_TABLE
into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Will Deacon <will@kernel.org>
---
 include/asm-generic/vmlinux.lds.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 356078e50a5c..9867d8e41eed 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -69,6 +69,17 @@
 #define NOTES_HEADERS_RESTORE
 #endif
 
+/*
+ * Some architectures have non-executable read-only exception tables.
+ * They can be added to the RO_DATA segment by specifying their desired
+ * alignment.
+ */
+#ifdef RO_EXCEPTION_TABLE_ALIGN
+#define RO_EXCEPTION_TABLE	EXCEPTION_TABLE(RO_EXCEPTION_TABLE_ALIGN)
+#else
+#define RO_EXCEPTION_TABLE
+#endif
+
 /* Align . to a 8 byte boundary equals to maximum function alignment. */
 #define ALIGN_FUNCTION()  . = ALIGN(8)
 
@@ -513,6 +524,7 @@
 		__stop___modver = .;					\
 	}								\
 									\
+	RO_EXCEPTION_TABLE						\
 	NOTES								\
 									\
 	. = ALIGN((align));						\
-- 
2.17.1

