Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43C8EE91DE
	for <lists+linux-alpha@lfdr.de>; Tue, 29 Oct 2019 22:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729968AbfJ2VUn (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 29 Oct 2019 17:20:43 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42910 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729971AbfJ2VUm (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 29 Oct 2019 17:20:42 -0400
Received: by mail-pf1-f194.google.com with SMTP id 21so10532121pfj.9
        for <linux-alpha@vger.kernel.org>; Tue, 29 Oct 2019 14:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bvYKnL/TaFkIaenIAvKRMlAb1gjfrMgYQ33pk+cyLNw=;
        b=eUd4sJyuTxgb840F9yzQhnhrVaW7UlInFUEaGLHC1o+XiNP1nT/Ur++05DeF2BOEy1
         B62m8k8aGhQzoIv1kV+qUa/1jSYvGM+XuBBi2YZI/Sqw728eeJNak1/uE8PFXjImt3OF
         0AKvdtizmmUcAZkSIZCgqYnSyMgJK/Tq10Dl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bvYKnL/TaFkIaenIAvKRMlAb1gjfrMgYQ33pk+cyLNw=;
        b=C6p5CBchHd6RXDW4N38btoULaJ+JtopBTyEKeclBqnPRiLk3D+DJ/hmHqMBZFiJNl8
         yRYKobgeS1fNn9zTn6Am6hbswrV2uHL4rA/R1JBAqSMkHJ+u8WibYJJpc6YrwGY8UMnd
         /3vIEGCrHdDm00FGw6CxZaX+G2wP2MBZsTXuY95Fiwl8y0rdrav9uKQFNf449Hnqmx6m
         JGCq/H3uu455Eyq5flC0e79MjAGcpvt5s30xovpPTBXzwjDwdXziEafKsCMqCp915G1q
         jIBpHrj5EoepIWVEZeyz8/8LD/aHwR5+ke/GMHb2l/wNK/nS4mNtuvRJCnt6MPCIF9SX
         ykvA==
X-Gm-Message-State: APjAAAXHlwE73PfyUcL1i+cOIxCYkNibnLSBGXTmWXBPcD1/htPfhxFr
        eo02X4CL/+eEZnvy414Fwse9fA==
X-Google-Smtp-Source: APXvYqwwc1LDGwYBzq0oCKE2jPQZSBhTqIM79blAEpYmjFxE7wS/lF6/Gpxpu2EeXpX55BTOzgQThA==
X-Received: by 2002:a63:29c1:: with SMTP id p184mr25932369pgp.174.1572384041825;
        Tue, 29 Oct 2019 14:20:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c66sm55210pfb.25.2019.10.29.14.20.34
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
Subject: [PATCH v3 22/29] microblaze: Move EXCEPTION_TABLE to RO_DATA segment
Date:   Tue, 29 Oct 2019 14:13:44 -0700
Message-Id: <20191029211351.13243-23-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/microblaze/kernel/vmlinux.lds.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/microblaze/kernel/vmlinux.lds.S b/arch/microblaze/kernel/vmlinux.lds.S
index b8efb08204a1..760cac41cbfe 100644
--- a/arch/microblaze/kernel/vmlinux.lds.S
+++ b/arch/microblaze/kernel/vmlinux.lds.S
@@ -11,6 +11,8 @@
 OUTPUT_ARCH(microblaze)
 ENTRY(microblaze_start)
 
+#define RO_EXCEPTION_TABLE_ALIGN	16
+
 #include <asm/page.h>
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/thread_info.h>
@@ -52,7 +54,6 @@ SECTIONS {
 
 	. = ALIGN(16);
 	RO_DATA(4096)
-	EXCEPTION_TABLE(16)
 
 	/*
 	 * sdata2 section can go anywhere, but must be word aligned
-- 
2.17.1

