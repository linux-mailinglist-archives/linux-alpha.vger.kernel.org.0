Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62658E915B
	for <lists+linux-alpha@lfdr.de>; Tue, 29 Oct 2019 22:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729395AbfJ2VOK (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 29 Oct 2019 17:14:10 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38734 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729450AbfJ2VOK (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 29 Oct 2019 17:14:10 -0400
Received: by mail-pf1-f194.google.com with SMTP id c13so10537028pfp.5
        for <linux-alpha@vger.kernel.org>; Tue, 29 Oct 2019 14:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9QIZQEEx86BzYrPbnl0U6tW2XkUfCUBHfootbZQ3f/s=;
        b=VJKPZjg5h5gIb74ChOF4ZrXYYhfiSwHea2i8hHsp07EIPVVXHD8rJMUqhwk1sE/z0k
         hBdmEZ2eVq3eJ4nxcE1nQ08scid6AV39pHBxxM+ioMPALnIdJ4Bsh/9B8mj3a1kPr2u3
         4UcyG5T8BsKDyw0SPatdMBiPtbEEJi6vDNyiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9QIZQEEx86BzYrPbnl0U6tW2XkUfCUBHfootbZQ3f/s=;
        b=bsRMmInj05ylt44XDxsbf7hw0p42N2zva0+Yc4P38k7c58eytm0FbvzvBNbwZE0aO6
         rzk0/GXqUnvQHJbOLU20uYWlsL37vdapD1igPMP5n8F13z7dOQ8MebkX40hvGwnzCrq9
         ov3Ov4CPoEriESdYXhH8Owww12lBhWLpJNRKKMgVaI17s17s5e2PIYZC6mdMfwUWmh/r
         nc3kx0ichrARUxm7IDXqfj2MYamIKmbgsJ5A5LAVD9bhNAT+dNNu9aDX3n9fLhFQAP4w
         OAiwskDtq6FTPSvSFFra20bU/lZWDuie2oC7Sf/ePU7tAMN3/fRxRDZWZ3yOIpOU0Vco
         Ptow==
X-Gm-Message-State: APjAAAV0tHXd+2VA5AFqSWkyXr3kgk1xMa81qqMJqdOwmbigqMZdRvhd
        /fmGPAO6L0kq8SrduWxbnggZ4Q==
X-Google-Smtp-Source: APXvYqxFjQ0J1oEh3GsydIUe8Mnx6PYm+2ICQsvndatm2xSff7UaaV/GBwyJtelYDI9HsI8eY0NLwA==
X-Received: by 2002:a63:e509:: with SMTP id r9mr20185029pgh.431.1572383647938;
        Tue, 29 Oct 2019 14:14:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n23sm31540pff.137.2019.10.29.14.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 14:14:04 -0700 (PDT)
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
Subject: [PATCH v3 05/29] ia64: Rename PT_LOAD identifier "code" to "text"
Date:   Tue, 29 Oct 2019 14:13:27 -0700
Message-Id: <20191029211351.13243-6-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

In preparation for moving NOTES into RO_DATA, rename the linker script
internal identifier for the PT_LOAD Program Header from "code" to "text"
to match other architectures.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/ia64/kernel/vmlinux.lds.S | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/ia64/kernel/vmlinux.lds.S b/arch/ia64/kernel/vmlinux.lds.S
index d9d4e21107cd..2c4f23c390ad 100644
--- a/arch/ia64/kernel/vmlinux.lds.S
+++ b/arch/ia64/kernel/vmlinux.lds.S
@@ -13,7 +13,7 @@ ENTRY(phys_start)
 jiffies = jiffies_64;
 
 PHDRS {
-	code   PT_LOAD;
+	text   PT_LOAD;
 	percpu PT_LOAD;
 	data   PT_LOAD;
 	note   PT_NOTE;
@@ -36,7 +36,7 @@ SECTIONS {
 	phys_start = _start - LOAD_OFFSET;
 
 	code : {
-	} :code
+	} :text
 	. = KERNEL_START;
 
 	_text = .;
@@ -68,9 +68,9 @@ SECTIONS {
 	/*
 	 * Read-only data
 	 */
-	NOTES :code :note       /* put .notes in text and mark in PT_NOTE  */
+	NOTES :text :note       /* put .notes in text and mark in PT_NOTE  */
 	code_continues : {
-	} : code               /* switch back to regular program...  */
+	} :text                /* switch back to regular program...  */
 
 	EXCEPTION_TABLE(16)
 
@@ -102,9 +102,9 @@ SECTIONS {
 		__start_unwind = .;
 		*(.IA_64.unwind*)
 		__end_unwind = .;
-	} :code :unwind
+	} :text :unwind
 	code_continues2 : {
-	} : code
+	} :text
 
 	RODATA
 
@@ -214,7 +214,7 @@ SECTIONS {
 	_end = .;
 
 	code : {
-	} :code
+	} :text
 
 	STABS_DEBUG
 	DWARF_DEBUG
-- 
2.17.1

