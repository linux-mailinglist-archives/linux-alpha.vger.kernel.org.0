Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCC9D351E
	for <lists+linux-alpha@lfdr.de>; Fri, 11 Oct 2019 02:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbfJKAHP (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 10 Oct 2019 20:07:15 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35023 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727546AbfJKAG1 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 10 Oct 2019 20:06:27 -0400
Received: by mail-pg1-f196.google.com with SMTP id p30so4699724pgl.2
        for <linux-alpha@vger.kernel.org>; Thu, 10 Oct 2019 17:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/BlCq1vuoPK6b90i9+3dEN0gsbsUxI5XzRVDtU+Y9n4=;
        b=GHJrn0r8p4QDRypis6WzxDqJLjyLzu0c9DD31onEhaU6MLFCbVj+PFhPVkLaKrLr36
         6/jJ7OuoXZWX6LGkizVGzJHGBfhDDMvBdX6JasWlhwE3Pz+fa+29g8GSrJ2HxibXscDy
         XREgc77JYPHoKnPPc/FC6vHKtCm5+OUHsSdmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/BlCq1vuoPK6b90i9+3dEN0gsbsUxI5XzRVDtU+Y9n4=;
        b=B0MWSwHaD0UTwGSADSfLzWr1cX+mOmyAq1chb4vh/AYpYzNDD8Sct+XZAokF5yr0eA
         AaHM8bWiRgB4T+r4Cb0T1f9w9ZI01r+azfsOEDYMy5B5f0eW10KkWTJpkpjFVZ9VdjqX
         h//hPJrUhsJNqdiOojmzIh7uIEwpf2pHoKN2vf+rWNOgDg7Jyj1bxGNVt71PoGMl4zKr
         Wr40ywFFfsMCIx5sx3AT9i7w8FUvLm7VOCpX9vQUOZeJ2oIc+B0CzrwHUHmShqZCREIH
         Bttdx7JdqnBu0j23We8c+Wx3C5XuTxKVWM3Sdd6tHRu+cBoESj/gNO+t/NMWhKNN2IwW
         D8dQ==
X-Gm-Message-State: APjAAAV2X1VyWcleAyoZPRhU1Ob7KSx+NHtUKWu8U1EZOp+rzqI6rQFA
        3cQwMFkGnwdu4loBpfuBB16+aA==
X-Google-Smtp-Source: APXvYqxm1QyOZv5u+41ebuDjigq/RdhkNKyMk/fjtAY65tjxQi2WIaaeC50vP1uynwiInzpzpev47Q==
X-Received: by 2002:a63:5c07:: with SMTP id q7mr13867865pgb.294.1570752386631;
        Thu, 10 Oct 2019 17:06:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h2sm7642311pfq.108.2019.10.10.17.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 17:06:24 -0700 (PDT)
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
Subject: [PATCH v2 07/29] x86: Restore "text" Program Header with dummy section
Date:   Thu, 10 Oct 2019 17:05:47 -0700
Message-Id: <20191011000609.29728-8-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011000609.29728-1-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

In a linker script, if once places a section in one or more segments using
":PHDR", then the linker will place all subsequent allocatable sections,
which do not specify ":PHDR", into the same segments. In order to have
the NOTES section in both PT_LOAD (":text") and PT_NOTE (":note"), both
segments are marked, and the only way to to undo this to keep subsequent
sections out of PT_NOTE is to mark the following section with just the
single desired PT_LOAD (":text").

In preparation for having a common NOTES macro, perform the segment
assignment use a dummy section (as done by other architectures).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/kernel/vmlinux.lds.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index e2feacf921a0..788e78978030 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -147,8 +147,9 @@ SECTIONS
 	} :text = 0x9090
 
 	NOTES :text :note
+	.dummy : { *(.dummy) } :text
 
-	EXCEPTION_TABLE(16) :text = 0x9090
+	EXCEPTION_TABLE(16)
 
 	/* .text should occupy whole number of pages */
 	. = ALIGN(PAGE_SIZE);
-- 
2.17.1

