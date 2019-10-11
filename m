Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65933D358C
	for <lists+linux-alpha@lfdr.de>; Fri, 11 Oct 2019 02:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727642AbfJKAM7 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 10 Oct 2019 20:12:59 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42988 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727592AbfJKAM6 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 10 Oct 2019 20:12:58 -0400
Received: by mail-pf1-f196.google.com with SMTP id q12so4944134pff.9
        for <linux-alpha@vger.kernel.org>; Thu, 10 Oct 2019 17:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BONbSwO3yUZE8RnSGxOUsa1O5SfUej1bEo+UUtcRz+8=;
        b=WAsHYQawMi4SZmZgp8/tZRHbrTyjaN/efP/1ePAdIKhuzenhHAkQSemi72oSFyzy5T
         BUP8VJmLQCYcSjbNgTQmhLF0rh39giv7Aj/ab5NbcDAnNRa5xqPwvle+ummM9Ru1MTnT
         6FSY7l03L75U7xLgPLADUTO/JJnoTeuiDWO4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BONbSwO3yUZE8RnSGxOUsa1O5SfUej1bEo+UUtcRz+8=;
        b=dc3wCA9YlTpzBeNrYFi3tJr2Q9ZsmD1bcifU+L+/QNqojMGme1JObpqlztQLmfODeN
         db9GoIYj6qA+cLrNyrcbgfcJC1SsMFyOLswgE5QUe0vOc5q1U9dAZ+nLaXK/KiglwK+p
         Ho8Tb0wyTMqDqZj5PiSrRJYPWJVRZ34S6m/vuFfF8WOOv7C8RmMkU0P6oFgRmv33lxM+
         Wbe6hu+LvvsXgTaTvv8HS1NRcVJkVHEiZBys9u+XSd1n96IrXxm0GGBVBa3YVlPpYzhB
         EN3tdOrPGo5+sI5gioDPru7ZR/EmyA62ZojqCF78gEbYj1+zBZb8l5Ld8yXl+7hSjvP/
         RqLw==
X-Gm-Message-State: APjAAAUK68VD4xin6QhfM0yaAMMFHLOfnYAXRJI8k87WIJu6P1ezkBxS
        4uJcmT6JCWx27e8ZbYyBDyVyfQ==
X-Google-Smtp-Source: APXvYqxI99kv+xtRG2LlmRclYNJDw1iNLuQgHN4M3GLkprM+ZRb8jXZUnF9huFcBlH1wmB6a5xQwdw==
X-Received: by 2002:a62:5284:: with SMTP id g126mr13294604pfb.95.1570752778224;
        Thu, 10 Oct 2019 17:12:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d5sm5379454pjw.31.2019.10.10.17.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 17:12:56 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Kees Cook <keescook@chromium.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
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
        Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, x86@kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 21/29] ia64: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Thu, 10 Oct 2019 17:06:01 -0700
Message-Id: <20191011000609.29728-22-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011000609.29728-1-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/ia64/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/ia64/kernel/vmlinux.lds.S b/arch/ia64/kernel/vmlinux.lds.S
index 11d5115bc44d..1ec6b703c5b4 100644
--- a/arch/ia64/kernel/vmlinux.lds.S
+++ b/arch/ia64/kernel/vmlinux.lds.S
@@ -6,6 +6,7 @@
 #include <asm/thread_info.h>
 
 #define EMITS_PT_NOTE
+#define RO_EXCEPTION_TABLE_ALIGN	16
 
 #include <asm-generic/vmlinux.lds.h>
 
@@ -70,7 +71,6 @@ SECTIONS {
 	/*
 	 * Read-only data
 	 */
-	EXCEPTION_TABLE(16)
 
 	/* MCA table */
 	. = ALIGN(16);
-- 
2.17.1

