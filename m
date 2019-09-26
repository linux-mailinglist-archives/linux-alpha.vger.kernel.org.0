Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62219BF827
	for <lists+linux-alpha@lfdr.de>; Thu, 26 Sep 2019 19:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbfIZR4q (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 26 Sep 2019 13:56:46 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38007 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728187AbfIZR4e (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 26 Sep 2019 13:56:34 -0400
Received: by mail-pf1-f194.google.com with SMTP id h195so2262119pfe.5
        for <linux-alpha@vger.kernel.org>; Thu, 26 Sep 2019 10:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yn5wfwJoFu2XxkEapi5oUode7Z6ofSq2WooR/oMOeig=;
        b=GIG4pntI4mSLZBUOLoFMk4guSw8F6GtVAwhEFiBddEsAgwrkRwPjIGbLRlxFjf3FFl
         AAkc2fNz+FhNHp9iA1Gn1CLcywcbJ+TQMeOOKdi3rLClFQao449j+D61pfii2Lo6mCp9
         gdFOurgujqWI728AB8TNIMWAJHUqnNxeyVafk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yn5wfwJoFu2XxkEapi5oUode7Z6ofSq2WooR/oMOeig=;
        b=BqSQhW4JboxtIXnf1iALhsqBTwRm9iixSs2ozVj/lIYYLZBXLBe2L4Zq89Sbbrx0mL
         I/Kz10/SIUGKEvvGYG8mV1hkH6AQabeE8TD/8EWDDncLvqviV3V/z65E7ABFYJKVXjgI
         UgYNGUdPaz1pdWYBdo9085vqfZJpMIWdphsVBLkXUkcaN4PoLGLnQG62POMVVXx8Mq12
         PTlYsfB5DA7ULjihGCwrU6y6TO319LhjDgtHsW1c6OBp6CooqdLH2ZaH7Dui0AZDAGiD
         JWZIieQeaZxX5c8C+gTVCDDTGmx2UZ/Dd+kM4ZLgDAhUiLiQImMbNWw9XXn7scmWl0LG
         wTbw==
X-Gm-Message-State: APjAAAVsCADCQQBeqafEpqGZy++FpzeT613XYsVurQv7i5WFz7maDcYp
        k5QyyfIwLcav4Nmhywkux6/RmQ==
X-Google-Smtp-Source: APXvYqztKKvfKjgB5MJEkhZ1uiyu1Mkac35wqulYkyxXb+7C2TAggJBadFx7VmxAR9W2f3IICOin9w==
X-Received: by 2002:aa7:920d:: with SMTP id 13mr5075737pfo.17.1569520593466;
        Thu, 26 Sep 2019 10:56:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x6sm7506434pfd.53.2019.09.26.10.56.27
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
Subject: [PATCH 29/29] x86: Use INT3 instead of NOP for linker fill bytes
Date:   Thu, 26 Sep 2019 10:56:02 -0700
Message-Id: <20190926175602.33098-30-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
References: <20190926175602.33098-1-keescook@chromium.org>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Instead of using 0x90 (NOP) to fill bytes between functions, which makes
it easier to sloppily target functions in function pointer overwrite
attacks, fill with 0xCC (INT3) to force a trap. Also drops the space
between "=" and the value to better match the binutils documentation
https://sourceware.org/binutils/docs/ld/Output-Section-Fill.html#Output-Section-Fill

Example "objdump -d" before:

...
ffffffff810001e0 <start_cpu0>:
ffffffff810001e0:       48 8b 25 e1 b1 51 01    mov 0x151b1e1(%rip),%rsp        # ffffffff8251b3c8 <initial_stack>
ffffffff810001e7:       e9 d5 fe ff ff          jmpq   ffffffff810000c1 <secondary_startup_64+0x91>
ffffffff810001ec:       90                      nop
ffffffff810001ed:       90                      nop
ffffffff810001ee:       90                      nop
ffffffff810001ef:       90                      nop

ffffffff810001f0 <__startup_64>:
...

After:

...
ffffffff810001e0 <start_cpu0>:
ffffffff810001e0:       48 8b 25 41 79 53 01    mov 0x1537941(%rip),%rsp        # ffffffff82537b28 <initial_stack>
ffffffff810001e7:       e9 d5 fe ff ff          jmpq   ffffffff810000c1 <secondary_startup_64+0x91>
ffffffff810001ec:       cc                      int3
ffffffff810001ed:       cc                      int3
ffffffff810001ee:       cc                      int3
ffffffff810001ef:       cc                      int3

ffffffff810001f0 <__startup_64>:
...

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index a5c8571e4967..a37817fafb22 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -144,7 +144,7 @@ SECTIONS
 		*(.text.__x86.indirect_thunk)
 		__indirect_thunk_end = .;
 #endif
-	} :text = 0x9090
+	} :text =0xcccc
 
 	/* End of text section, which should occupy whole number of pages */
 	_etext = .;
-- 
2.17.1

