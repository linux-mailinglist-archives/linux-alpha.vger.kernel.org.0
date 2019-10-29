Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE7CCE918A
	for <lists+linux-alpha@lfdr.de>; Tue, 29 Oct 2019 22:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729299AbfJ2VOY (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 29 Oct 2019 17:14:24 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34143 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729660AbfJ2VOW (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 29 Oct 2019 17:14:22 -0400
Received: by mail-pf1-f195.google.com with SMTP id b128so3255pfa.1
        for <linux-alpha@vger.kernel.org>; Tue, 29 Oct 2019 14:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FW8b8NX2lcqvjxUkqurmeLymDZQTO5emHjisNR3IdMA=;
        b=CmZP/I6kjCYMCamfO5EVfb0HxeU/Oeb7AjXqIeGY/TtSvuYzzmcw5WorsEzob1zXbZ
         72HaJzIsCDP0Cliy3IamYxFw+NFuP3yGiROup6Mz5C82hRmDxVQTt8EqMKc4Fm6tztdm
         xI579U09sN8ahLffhZ55dRwzHT/9KI7DmYa38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FW8b8NX2lcqvjxUkqurmeLymDZQTO5emHjisNR3IdMA=;
        b=DWygWnbUaa3S8Zg9lhD9pXX4F1dJeYrJ4o+GSOszlCcxehwAYTW4LChYlZ7LxZf2c8
         TQW92hphtVffhUPCD5sj6gl5BPYI77jsGlT72BweCXNev9bM7DY/R6cKHHVpOM65WMqQ
         Ou4/dJFif6+pTCstSalRRcfkmcz2af33sJRZ8YOw9E4zXtVnSiG/3mqfClhQ6g7+cZnp
         5QVmyRaJLs9hoaQbN15c8eMoyx6qxqsbFBZ4YliFNFB5J0kBzmA1rOAR351iKSGzWWhu
         ZiDy2IrEg613sD4B9d+N5BeX1d2NJZSyk3FsIjN1wkoqfVOEnrMCYA98AtWgtwc0R4au
         hLOw==
X-Gm-Message-State: APjAAAVkVtenNT1gJhVN0zHgHLvPPeas3eCUf5VSnEwIxWUtT7W5NGJc
        7vwYNYKp5aA5d4rrb3y3InKYpA==
X-Google-Smtp-Source: APXvYqwiOUm2jZtJ8dX4r0EtkhUojHpj6j/QBiEaUfiXYnVdq1zBF5gAbu/4e4tDxl0OhH15/UlLGQ==
X-Received: by 2002:a17:90a:bc41:: with SMTP id t1mr9397805pjv.67.1572383660328;
        Tue, 29 Oct 2019 14:14:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u3sm126498pgp.51.2019.10.29.14.14.05
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
Subject: [PATCH v3 18/29] arm64: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Tue, 29 Oct 2019 14:13:40 -0700
Message-Id: <20191029211351.13243-19-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA. Also
removes the redundant ALIGN, which is already present at the end of the
RO_DATA macro.

Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/vmlinux.lds.S | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index a4b3e6c0680c..9128a26eb45b 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -5,6 +5,8 @@
  * Written by Martin Mares <mj@atrey.karlin.mff.cuni.cz>
  */
 
+#define RO_EXCEPTION_TABLE_ALIGN	8
+
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/cache.h>
 #include <asm/kernel-pgtable.h>
@@ -135,10 +137,9 @@ SECTIONS
 	. = ALIGN(SEGMENT_ALIGN);
 	_etext = .;			/* End of text section */
 
-	RO_DATA(PAGE_SIZE)		/* everything from this point to     */
-	EXCEPTION_TABLE(8)		/* __init_begin will be marked RO NX */
+	/* everything from this point to __init_begin will be marked RO NX */
+	RO_DATA(PAGE_SIZE)
 
-	. = ALIGN(PAGE_SIZE);
 	idmap_pg_dir = .;
 	. += IDMAP_DIR_SIZE;
 
-- 
2.17.1

