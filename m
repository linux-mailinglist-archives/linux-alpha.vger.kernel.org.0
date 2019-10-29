Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7CA9E9183
	for <lists+linux-alpha@lfdr.de>; Tue, 29 Oct 2019 22:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729721AbfJ2VOY (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 29 Oct 2019 17:14:24 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45921 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729704AbfJ2VOY (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 29 Oct 2019 17:14:24 -0400
Received: by mail-pf1-f195.google.com with SMTP id c7so9354007pfo.12
        for <linux-alpha@vger.kernel.org>; Tue, 29 Oct 2019 14:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Wn91QvvOWXGcdAukdBFPOsAS+V9wjbJFfxE/dszqFsM=;
        b=e23Up0zA+FknG/wy6VhmeVSbZB8QZjiX0vsAsUiCjELXoASbot+u6O/Ejby5OAZXcC
         D20Gb77Tr51mlHzmSwSoKEoW2ET0UoL8WLxGdBgnuf4w6xJFYBJGnW///YPOFqwXtqCa
         uskFEoYIZvG0NYVP/lEJT6kwVN4SzBgoCgvaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Wn91QvvOWXGcdAukdBFPOsAS+V9wjbJFfxE/dszqFsM=;
        b=Utf2cteP40vk6SX4g009VBSJ28Q+v3Q0Fj8Yn75mKxJ0Y+nI8MMGOaaDkAaOOtr6Zt
         X4+XP/T/S1H0ZAmAMbpjpIaPWLXRLu9af4AAuTAgh6IYi8nmkcGTZHSX7u+5LSh4FAdq
         Hb1x05XH12BG/ODh1NBvbcAwOjav/KJOR4389oey+x2CoMvdaYsXvUr6PrVeVTN1EAA+
         eWOWTHNAP8aGG3qzteOjv7WnXp0IZHsrdHMsSSyg7ujEC0wb80WM/d1Aa9l32ymcWqN6
         l8S8IjnGwqVKnLvx75ICZGvKrlXEGhIphDQBV+ar9Sbk9stTL2CdYIOVZa5qKE6cqbwl
         RPTg==
X-Gm-Message-State: APjAAAWd6J/VA35XbwAMR6Howw1oMCh4DwktWhwD/4PBpIcQJ5s49eOd
        K+0nusd39oOfDBIah9ZT+FEgHQ==
X-Google-Smtp-Source: APXvYqyvNm7i+bRgKLxrIbvnaiMusgEvUvRAV9KmH69+2MPaKK4I97mcIP1d4LNMzQRr44De1wfu9w==
X-Received: by 2002:a17:90a:854c:: with SMTP id a12mr9437017pjw.2.1572383661980;
        Tue, 29 Oct 2019 14:14:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k24sm149619pgl.6.2019.10.29.14.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 14:14:20 -0700 (PDT)
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
Subject: [PATCH v3 29/29] x86: Use INT3 instead of NOP for linker fill bytes
Date:   Tue, 29 Oct 2019 14:13:51 -0700
Message-Id: <20191029211351.13243-30-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Instead of using 0x90 (NOP) to fill bytes between functions, which makes
it easier to sloppily target functions in function pointer overwrite
attacks, fill with 0xCC (INT3) to force a trap. Also drop the space
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
index b06d6e1188de..3a1a819da137 100644
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

