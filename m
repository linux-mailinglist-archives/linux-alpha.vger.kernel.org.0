Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6E4BF84D
	for <lists+linux-alpha@lfdr.de>; Thu, 26 Sep 2019 19:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbfIZR5K (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 26 Sep 2019 13:57:10 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37587 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbfIZR4a (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 26 Sep 2019 13:56:30 -0400
Received: by mail-pg1-f195.google.com with SMTP id c17so1970079pgg.4
        for <linux-alpha@vger.kernel.org>; Thu, 26 Sep 2019 10:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=b1/uW6kDsyZTSJ+gwaKuf5Y3ySZgNCgjZ9WgbQU3J5M=;
        b=NS1tMZPO6DiLtYsg7bkcpePHNmJ/nLyEn8bFqB536OAMsynj/sM0sV9JASHY+/D/aV
         0irY/ZZ/Sw5Ff6a3Xr8hTMKPFlLAyCjdwPHuVnFq7tw1NS7SnAKb8YnaFIBVxhT0Mjeq
         faTnz/PfHNqDfDu8NYYA9Yvm+scVClDMmdf/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=b1/uW6kDsyZTSJ+gwaKuf5Y3ySZgNCgjZ9WgbQU3J5M=;
        b=A3a8HWozkf5IcPsYinPdjYMxysNpi0Rq8M/RuBXyYqwsBiR8r33I787LG4ikv6JuIY
         PgsZOvCXFl1w3RUDvdZHfaNTysPj65ZmDW0tFZijjvT9kiqKZLwqhZdciQmFpAWfGXs7
         /8Eram+Bzu2SJOD8gZswWTjCuHdwd0Zgtv2/j6qs7e8wlSJw2woNrHORlP6gCMI9gq50
         eaqHxOb9yrdUCz946nricanvYzmFqRGDnWhfM6E1ZiHbqzzL1zNotA/Ro9HOmZobwJG7
         Hb9KC0DkEGTtdAeq1wb23tWP6lh6k4dfDUpLuBM+BuIH6KFEVIkqH1fIxUX09E0DYnQF
         V2/g==
X-Gm-Message-State: APjAAAUJaNxn1VCd0uyeJ6pJNIU/g+o/6+mX6OgODp5UAN9C0PD/ZnUS
        vdW60e30DymSubyQBnSfPaPpIw==
X-Google-Smtp-Source: APXvYqxnFFNqQpUkqna8OeByYxEA/Nx8utFzCAqw8OBF0xZQgqdbBmLWMEJr85fjA0ZYcRUxNYx6WA==
X-Received: by 2002:a17:90a:37c9:: with SMTP id v67mr5020846pjb.29.1569520590214;
        Thu, 26 Sep 2019 10:56:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z25sm2899187pfn.7.2019.09.26.10.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 10:56:26 -0700 (PDT)
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
Subject: [PATCH 17/29] alpha: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Thu, 26 Sep 2019 10:55:50 -0700
Message-Id: <20190926175602.33098-18-keescook@chromium.org>
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
 arch/alpha/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index edc45f45523b..72303827bcb4 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 #define EMITS_PT_NOTE
+#define RO_DATA_EXCEPTION_TABLE_ALIGN	16
 
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

