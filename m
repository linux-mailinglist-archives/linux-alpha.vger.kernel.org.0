Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51641BF818
	for <lists+linux-alpha@lfdr.de>; Thu, 26 Sep 2019 19:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbfIZR4c (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 26 Sep 2019 13:56:32 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44110 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728158AbfIZR4c (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 26 Sep 2019 13:56:32 -0400
Received: by mail-pf1-f194.google.com with SMTP id q21so2232728pfn.11
        for <linux-alpha@vger.kernel.org>; Thu, 26 Sep 2019 10:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HjFHv9xxIhK5RJeBiuSF34CW9EFCi2H1cUI0osZb25Q=;
        b=KPMZBnze/A/QVrsTLF2KGN3ebdUhyckFs45P2jOghM70xqivIFR9hfivXkVt5CbeNY
         IE1kSylnyZRNl8HDUTfbWj8AKjNJnMw62zdeR5tu6VCLH496t+W13oMohTiMGaZ6p79Z
         3c4uLS8nqL5lvrbWSW4400GI1UZ1nPH1jjAIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HjFHv9xxIhK5RJeBiuSF34CW9EFCi2H1cUI0osZb25Q=;
        b=SZyDt1RyG8tDXpnDGwxCN0ZWosvoK98as0DwOgQlcUE0rh4E4k+UBmVqxK4ezeyx4s
         3zfV4GT/pfd9EU9Uns8ze5QMLDfPhqEWGJKBB1Gg7iswLbIxG+qbnWyqNLfy6G7j6kHE
         jImwXo285O4s4OB5SMaHfqp4QxvDTIctTal/4/74kxX202AGhr/zurgRssMUVLD60jhg
         YRWPO7I4/JYOPy85d7628u+zM5A8RpABI1FwFAL0NHlUknxMZBbZGbScCIkcPvxtJnoO
         O2kZ56Df3wYlfy1KqvLy9thPMQeATZ9vWcHf6x8bBRbqQj8XVCdK5m0dai8u+Ir/7bcB
         SSNg==
X-Gm-Message-State: APjAAAWUbdx2I0PFwXUb/dGo4jINoj9/ZuH2dwKS1gwnkI4MZaINW0HB
        EWKbZHkdSLWhmc7mBXLoSDvDGQ==
X-Google-Smtp-Source: APXvYqyFMbRLlIoK6p9J6QIn/93x5dhozlYQ0YGx3wABZc+vZZjpU1J4N8nao/7zNkR46rXeo7ym8w==
X-Received: by 2002:a62:19c7:: with SMTP id 190mr5160181pfz.105.1569520591920;
        Thu, 26 Sep 2019 10:56:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f89sm3068052pje.20.2019.09.26.10.56.24
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
Subject: [PATCH 20/29] h8300: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Thu, 26 Sep 2019 10:55:53 -0700
Message-Id: <20190926175602.33098-21-keescook@chromium.org>
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
 arch/h8300/kernel/vmlinux.lds.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/h8300/kernel/vmlinux.lds.S b/arch/h8300/kernel/vmlinux.lds.S
index 2ac7bdcd2fe0..aba90398b774 100644
--- a/arch/h8300/kernel/vmlinux.lds.S
+++ b/arch/h8300/kernel/vmlinux.lds.S
@@ -1,4 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+
+#define RO_DATA_EXCEPTION_TABLE_ALIGN	16
+
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/page.h>
 #include <asm/thread_info.h>
@@ -37,7 +40,6 @@ SECTIONS
 #endif
 	_etext = . ;
 	}
-	EXCEPTION_TABLE(16)
 	RO_DATA(4)
 	ROMEND = .;
 #if defined(CONFIG_ROMKERNEL)
-- 
2.17.1

