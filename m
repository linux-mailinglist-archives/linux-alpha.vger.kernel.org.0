Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 341D7E91E2
	for <lists+linux-alpha@lfdr.de>; Tue, 29 Oct 2019 22:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730054AbfJ2VUp (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 29 Oct 2019 17:20:45 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43454 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729950AbfJ2VUn (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 29 Oct 2019 17:20:43 -0400
Received: by mail-pg1-f195.google.com with SMTP id l24so10503719pgh.10
        for <linux-alpha@vger.kernel.org>; Tue, 29 Oct 2019 14:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6NYi1SpcPEk1nAcODb6GN96JVcdeHOxwVojV0owHqow=;
        b=dNy1CZ6LVOC5Xwy361W5/FOiLjIeZ1a3UnC8UVfqNFHlsVQ8qbaqjGnKLGJCwZ4kjW
         R9OofJoUgLk3AYwWdNoTsAeWT8lvKhX3jyPzcDsVrpYn7dDwO7ngiDpQ9N4Jp5AybLbF
         IvOGqmpRh0nWfHe5uyqSfrp6ttnHKPg3vSxs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6NYi1SpcPEk1nAcODb6GN96JVcdeHOxwVojV0owHqow=;
        b=jjqM1MweDBY+30MgVBNFqF5pYMHNWXIqjVaA3hxzgFEE8EpuPGskUYidH/+bVnXApc
         kMCY5+UJiuzgypFeSfcKN78aVlKWG+cOQDWlmgpsm7tEmwrBeWFuIVTrcj7BUOMRIaPQ
         JEn+JvYoJLE21z6LiZt/tNLlRZ8MJ49a2rlMAtJdbKp70c0n9yvYHLBjzlpnue4GHn8l
         SC/I0DJY5b1UNGmcamd+E3UKS8aLOBhDyk1jO4b47keEg0kqwF/Dafft5ugSERrdxApD
         lnB2uhSp1LJBHv+eKRmhlAiwC//sPwF/Gzbsa/TYU5RhtmAMOpx348keD4X2rNs0d83U
         S9Kg==
X-Gm-Message-State: APjAAAUz3Msp0x9Ao/78UZc2oTZKOF5FFP/mmeMFL3CU8TbDTokT6tTA
        0EzvlYvprSBcXjJz1dbQW7vKGg==
X-Google-Smtp-Source: APXvYqwXkyOdxRjPJDw9RQKLanWP+r60JXUsvq8Thfmh0vWjgoChchb/tzi5pjG59oK1fgBkYf+n6Q==
X-Received: by 2002:a17:90a:7bcc:: with SMTP id d12mr9331544pjl.63.1572384042527;
        Tue, 29 Oct 2019 14:20:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v25sm47257pfn.78.2019.10.29.14.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 14:20:38 -0700 (PDT)
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
Subject: [PATCH v3 25/29] xtensa: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Tue, 29 Oct 2019 14:13:47 -0700
Message-Id: <20191029211351.13243-26-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/vmlinux.lds.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/xtensa/kernel/vmlinux.lds.S b/arch/xtensa/kernel/vmlinux.lds.S
index bdbd7c4056c1..0043d5858f14 100644
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@ -14,6 +14,8 @@
  * Joe Taylor <joe@tensilica.com, joetylr@yahoo.com>
  */
 
+#define RO_EXCEPTION_TABLE_ALIGN	16
+
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/page.h>
 #include <asm/thread_info.h>
@@ -130,7 +132,6 @@ SECTIONS
 
   .fixup   : { *(.fixup) }
 
-  EXCEPTION_TABLE(16)
   /* Data section */
 
   _sdata = .;
-- 
2.17.1

