Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9DB715A468
	for <lists+linux-alpha@lfdr.de>; Wed, 12 Feb 2020 10:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728643AbgBLJQi (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 12 Feb 2020 04:16:38 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45166 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728615AbgBLJQi (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 12 Feb 2020 04:16:38 -0500
Received: by mail-wr1-f66.google.com with SMTP id g3so1244086wrs.12
        for <linux-alpha@vger.kernel.org>; Wed, 12 Feb 2020 01:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uk+gFfcB3b6FjGRTP1nlFspmuyGmgWlIC086s4vck+w=;
        b=tx63Leo7FrRp0l54LTIEM0mJaUSmFSJs8Jtan6w3TdwyKCuw0Eu7b2I9GrPzaP8mjr
         XjDvfMlhRKTbK/pdenWOIi2NtyBIR/rlcogzVZTLoqIly3RaBeNH3ROBYO4InWV35ScG
         R1EixNT+YyHv7e19HkIfVYZgEpqErrhzxhTcgUR8V2cXKWQTYuS21lrCOcbTmRPuT5uy
         I3KNIQovuRRaTeyytRIGb04+jn/BEfv9MdaQPyXAx8RZVVsiVINu0g67BeESTKqIkxlT
         sM+jQ3MQZkAw6e5tAkX7AuFgwDJyeZcbcqYJeb0Kl/frjkzNH9bv24q+C50KvozngigY
         pfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Uk+gFfcB3b6FjGRTP1nlFspmuyGmgWlIC086s4vck+w=;
        b=FHqlP8aZgS7qeqByfmvOfQc1GpOLARPDKyh/HdqERUWacK7CopIMxG3RRTC+TsAwGq
         7iMz2stzayvOWeSD5gvdlTPtxmOUWbMLfzPrr0Mf8GQSKyvDEF0FsEd+FruSiUY16A1T
         cvJEhRSL3SARIqmyggSOxwDoNc3Y+IcaaL/gz6aTiFpbYS/K9INTZLFZVmEGXCsCUwm8
         XMBCKqfwmqd49iTl8bltxR/vlTYIb6Aa1dguHpMNijX4JbE+8AOsyDO+83pk5EztJdIC
         jdCk/UxpIDssHBImq8+hcorGHfso8s7l6n6vNdEeJ6/+N7+tsCmCG+hKu2AaPiTjAE96
         IE7A==
X-Gm-Message-State: APjAAAXWRdUdYtk+J9eu2A/jzmlvxeYDELA9L/1ce9s8vB4BO+w0rgb+
        fjjDKTKfFn2SysuW8ECv0cwfWQ==
X-Google-Smtp-Source: APXvYqzdt6o6j4qqNJoPYtoq55Sx9ZpUuHqgwT8USJjl8gjw+SUMB3okJ1S6XFjAX10CeKKJ9aqCWg==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr13657787wrw.31.1581498995201;
        Wed, 12 Feb 2020 01:16:35 -0800 (PST)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id l17sm8579262wro.77.2020.02.12.01.16.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 01:16:34 -0800 (PST)
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com, arnd@arndb.de,
        akpm@linux-foundation.org
Cc:     Stefan Asserhall <stefan.asserhall@xilinx.com>,
        Chris Zankel <chris@zankel.net>,
        "David S. Miller" <davem@davemloft.net>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Helge Deller <deller@gmx.de>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Rich Felker <dalias@libc.org>,
        Richard Henderson <rth@twiddle.net>,
        Tony Luck <tony.luck@intel.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        sparclinux@vger.kernel.org
Subject: [PATCH v2] asm-generic: Fix unistd_32.h generation format
Date:   Wed, 12 Feb 2020 10:16:33 +0100
Message-Id: <dcdd615f77dacf8a98e18950b66fb5a675277f38.1581498987.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Generated files are also checked by sparse that's why add newline
to remove sparse (C=1) warning.

The issue was found on Microblaze and reported like this:
./arch/microblaze/include/generated/uapi/asm/unistd_32.h:438:45:
warning: no newline at end of file

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Reviewed-by: Stefan Asserhall <stefan.asserhall@xilinx.com>
---

Changes in v2:
- Update also others archs not just microblaze - Arnd
- Align subject and description to match multiarch chagne

 arch/alpha/kernel/syscalls/syscallhdr.sh      | 1 +
 arch/ia64/kernel/syscalls/syscallhdr.sh       | 1 +
 arch/m68k/kernel/syscalls/syscallhdr.sh       | 1 +
 arch/microblaze/kernel/syscalls/syscallhdr.sh | 1 +
 arch/parisc/kernel/syscalls/syscallhdr.sh     | 1 +
 arch/sh/kernel/syscalls/syscallhdr.sh         | 1 +
 arch/sparc/kernel/syscalls/syscallhdr.sh      | 1 +
 arch/xtensa/kernel/syscalls/syscallhdr.sh     | 1 +
 8 files changed, 8 insertions(+)

diff --git a/arch/alpha/kernel/syscalls/syscallhdr.sh b/arch/alpha/kernel/syscalls/syscallhdr.sh
index e5b99bd2e5e7..524c69fbcab7 100644
--- a/arch/alpha/kernel/syscalls/syscallhdr.sh
+++ b/arch/alpha/kernel/syscalls/syscallhdr.sh
@@ -33,4 +33,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#endif\n"
 	printf "\n"
 	printf "#endif /* %s */" "${fileguard}"
+	printf "\n"
 ) > "$out"
diff --git a/arch/ia64/kernel/syscalls/syscallhdr.sh b/arch/ia64/kernel/syscalls/syscallhdr.sh
index 0c2d2c748565..8e462a9be54a 100644
--- a/arch/ia64/kernel/syscalls/syscallhdr.sh
+++ b/arch/ia64/kernel/syscalls/syscallhdr.sh
@@ -33,4 +33,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#endif\n"
 	printf "\n"
 	printf "#endif /* %s */" "${fileguard}"
+	printf "\n"
 ) > "$out"
diff --git a/arch/m68k/kernel/syscalls/syscallhdr.sh b/arch/m68k/kernel/syscalls/syscallhdr.sh
index 6f357d68ef44..8ac15be01ac2 100644
--- a/arch/m68k/kernel/syscalls/syscallhdr.sh
+++ b/arch/m68k/kernel/syscalls/syscallhdr.sh
@@ -33,4 +33,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#endif\n"
 	printf "\n"
 	printf "#endif /* %s */\n" "${fileguard}"
+	printf "\n"
 ) > "$out"
diff --git a/arch/microblaze/kernel/syscalls/syscallhdr.sh b/arch/microblaze/kernel/syscalls/syscallhdr.sh
index 2e9062a926a3..4f4238433644 100644
--- a/arch/microblaze/kernel/syscalls/syscallhdr.sh
+++ b/arch/microblaze/kernel/syscalls/syscallhdr.sh
@@ -33,4 +33,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#endif\n"
 	printf "\n"
 	printf "#endif /* %s */" "${fileguard}"
+	printf "\n"
 ) > "$out"
diff --git a/arch/parisc/kernel/syscalls/syscallhdr.sh b/arch/parisc/kernel/syscalls/syscallhdr.sh
index 50242b747d7c..77eb95416eae 100644
--- a/arch/parisc/kernel/syscalls/syscallhdr.sh
+++ b/arch/parisc/kernel/syscalls/syscallhdr.sh
@@ -33,4 +33,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#endif\n"
 	printf "\n"
 	printf "#endif /* %s */" "${fileguard}"
+	printf "\n"
 ) > "$out"
diff --git a/arch/sh/kernel/syscalls/syscallhdr.sh b/arch/sh/kernel/syscalls/syscallhdr.sh
index 1de0334e577f..7c45d405547c 100644
--- a/arch/sh/kernel/syscalls/syscallhdr.sh
+++ b/arch/sh/kernel/syscalls/syscallhdr.sh
@@ -33,4 +33,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#endif\n"
 	printf "\n"
 	printf "#endif /* %s */" "${fileguard}"
+	printf "\n"
 ) > "$out"
diff --git a/arch/sparc/kernel/syscalls/syscallhdr.sh b/arch/sparc/kernel/syscalls/syscallhdr.sh
index 626b5740a9f1..76e4d1a1f8bf 100644
--- a/arch/sparc/kernel/syscalls/syscallhdr.sh
+++ b/arch/sparc/kernel/syscalls/syscallhdr.sh
@@ -33,4 +33,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#endif\n"
 	printf "\n"
 	printf "#endif /* %s */" "${fileguard}"
+	printf "\n"
 ) > "$out"
diff --git a/arch/xtensa/kernel/syscalls/syscallhdr.sh b/arch/xtensa/kernel/syscalls/syscallhdr.sh
index d37db641ca31..c946c6b2a506 100644
--- a/arch/xtensa/kernel/syscalls/syscallhdr.sh
+++ b/arch/xtensa/kernel/syscalls/syscallhdr.sh
@@ -33,4 +33,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#endif\n"
 	printf "\n"
 	printf "#endif /* %s */" "${fileguard}"
+	printf "\n"
 ) > "$out"
-- 
2.25.0

