Return-Path: <linux-alpha+bounces-2432-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAF4B55BD9
	for <lists+linux-alpha@lfdr.de>; Sat, 13 Sep 2025 02:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD8161B25596
	for <lists+linux-alpha@lfdr.de>; Sat, 13 Sep 2025 00:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DEA14EC62;
	Sat, 13 Sep 2025 00:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3WPIWnp"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4B2136672
	for <linux-alpha@vger.kernel.org>; Sat, 13 Sep 2025 00:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757724922; cv=none; b=TqAzG9qrqxrUv/Cp8eWlpvkpVh8r/M7f48R/mGh+wYvkEB50ZSnHANPV933HeaeMmrstPh5vnedzEyzKkzifQByNUCNmA8QF+mCLjGnrTrPWJK6fyXT5U0wFuokQcXXl0GBttB0oEtWuZoNFO9G6AXeajIcI/1zSI5drRlnIAB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757724922; c=relaxed/simple;
	bh=eGt6p4ZjFeLe2iCSQ/AVZeB8ZlFdwKPgIafRJWfogAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3Esfmq1gkpyqLT/dhDoKnHD2A0Sg8OKKdLE5t2I8GJMRJO6OXi2wCQcfQrfgwU9rjMq7dmwRsL2/AOk6GjCDzxLTuBQ1O6zmw/rygYMULFyBtq81j2bBt8ZNhA3uRqsKB+THLcJ/weGsDQODPXeBK4bxFl6IWq6ibiXSykx4ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3WPIWnp; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b04b55d5a2cso427896866b.2
        for <linux-alpha@vger.kernel.org>; Fri, 12 Sep 2025 17:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724919; x=1758329719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brUQzIfCd0Hsthf3I31XlgkqlDsgZYmVYRfws4Ev66A=;
        b=k3WPIWnpYGB19QtY2ZeyrleT42W5nkqtp5hNrrsJZadgJNIeFKftVhkdYbTipwZwaO
         22htrL3YG35gwGmchXTxq7N1fsxiCUCyUp4KOzy9aGv4rL9EyZGhbxGIblsXU7DSrzqo
         qZLjUBfa0tj7D8Dx4yUuO1C60eimaKg6Zlwa0/II98sJWz5s1CPbW2Fs4HnmBryEetkQ
         PoTz1ovN/sMdd6zEgHQfLZRinnQ0hwCTWUOT+twTWe42aaxZlZqgbJoYb0Z72uNfT3pX
         H8DSqPUZlo0pZzTuw1SdZIGKV4ll6g6XQMwmaEAT9giGqAr9Uxrp+R4v9CiU970pQFLp
         SSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724919; x=1758329719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brUQzIfCd0Hsthf3I31XlgkqlDsgZYmVYRfws4Ev66A=;
        b=UN6P6Yu37DTEnOEGjwS+xM7/RkXbwW6wrAHbP14uSfl7oGBWk2TQSAaFMzJ0LGO8ZE
         SYM+7i4bP01IxOJxnRdsgzo8e93RZVNg7nCbXmgm2v4y3LyaNb/+iStW3brh/fR/A1+s
         8BylREezUYmzt9l0ceLEhmkocaPEf0XUjGLMeVxG22d4j3YnpT7hcZrEV6HbY87EWrYW
         tAHNssv5pPwUuSi6/N1YoXIZMIIitvXdP2zU9C41Xsk/5Gg8bMOU9NjEpe8YPxRxDSrT
         Xx61bibitKkJfAMq2hp8En9i6IEuMysnjhKgNDRavoQHRaf0etK9i5kEAKdlE+54y78X
         Ps0w==
X-Forwarded-Encrypted: i=1; AJvYcCWSrSB+KzaqM3ce5p0HtfBMeHmsDJAZDp64C7mFr6wm9lvzzWhCDDQBJgz6rjj2XsoM714392sJl0BV6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuGRhwzdfdwICUhCaWena5HFTESQ2W/kzOhMriCDkTcZWbWL6o
	3kPVztWD7j1QT36xNmaOJ0W0S6a16iu8GG7Zesv9bbdK9LLHUZEpvZrg
X-Gm-Gg: ASbGncsjh4y8/0p9uCe+n/i14PCR0yjg8AmFRAwyHRpFMMxbGKH1qLsZeomvgoexvyT
	08gMiMVKH8L8icQlOU5M+SUMPZ/W0O3MT/nRQm+WiQ4QTnAlOXWJmk+wyKMyhKYgiD0afq4GBDw
	j/n85DJYBbsyKyD6Ct0bkYvGEwNHG+xWcRdnhL4mfrRj6YZFiCXC81MAIv+d1T+AQkOchzl6DBV
	sVjFALvPqpPJpSXBRYSGrZkeIbcZFIigdykrqC4UBL458K8naExZgoTLbiQCZ+zokrF1pCH8foh
	GQnsED2dGOZKUiGax4vuLFjeDQOpz9sZ2WyaxZVh/nDz2DSY6PdsmgmeZ6pdFvQbUT7jqSBC8Jb
	RKTGgrAr13FQ763ld7SP/v6a2MBkGyg==
X-Google-Smtp-Source: AGHT+IFhKaZuOZuHh9m3zt1qgdjZK8E9TZ0Xtk6mNXJxSo6OktVvoEgwN+yDRi3/QGfp0/HMd569SA==
X-Received: by 2002:a17:907:3d8c:b0:afe:8b53:449c with SMTP id a640c23a62f3a-b07c37dc9f1mr442768666b.34.1757724918489;
        Fri, 12 Sep 2025 17:55:18 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b316e2d4sm471493966b.45.2025.09.12.17.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:55:18 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 14/62] init: m68k, mips, powerpc, s390, sh: remove Root_RAM0
Date: Sat, 13 Sep 2025 00:37:53 +0000
Message-ID: <20250913003842.41944-15-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Root_RAM0 used to specify ramdisk as root device.
It means nothing now, so let's remove it

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/m68k/kernel/uboot.c                |  1 -
 arch/mips/kernel/setup.c                |  1 -
 arch/powerpc/kernel/setup-common.c      | 11 ++++-------
 arch/powerpc/platforms/powermac/setup.c |  4 +---
 arch/s390/kernel/setup.c                |  2 --
 arch/sh/kernel/setup.c                  |  4 +---
 include/linux/root_dev.h                |  1 -
 init/do_mounts.c                        |  2 --
 8 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
index fa7c279ead5d..d278060a250c 100644
--- a/arch/m68k/kernel/uboot.c
+++ b/arch/m68k/kernel/uboot.c
@@ -83,7 +83,6 @@ static void __init parse_uboot_commandline(char *commandp, int size)
 	    (uboot_initrd_end > uboot_initrd_start)) {
 		initrd_start = uboot_initrd_start;
 		initrd_end = uboot_initrd_end;
-		ROOT_DEV = Root_RAM0;
 		pr_info("initrd at 0x%lx:0x%lx\n", initrd_start, initrd_end);
 	}
 #endif /* if defined(CONFIG_BLK_DEV_INITRD) */
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 11b9b6b63e19..a78e24873231 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -173,7 +173,6 @@ static unsigned long __init init_initrd(void)
 		goto disable;
 	}
 
-	ROOT_DEV = Root_RAM0;
 	return PFN_UP(end);
 disable:
 	initrd_start = 0;
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 68d47c53876c..97d330f3b8f1 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -363,17 +363,14 @@ void __init check_for_initrd(void)
 	DBG(" -> check_for_initrd()  initrd_start=0x%lx  initrd_end=0x%lx\n",
 	    initrd_start, initrd_end);
 
-	/* If we were passed an initrd, set the ROOT_DEV properly if the values
-	 * look sensible. If not, clear initrd reference.
+	/* If we were not passed an sensible initramfs, clear initramfs reference.
 	 */
-	if (is_kernel_addr(initrd_start) && is_kernel_addr(initrd_end) &&
-	    initrd_end > initrd_start)
-		ROOT_DEV = Root_RAM0;
-	else
+	if (!(is_kernel_addr(initrd_start) && is_kernel_addr(initrd_end) &&
+	    initrd_end > initrd_start))
 		initrd_start = initrd_end = 0;
 
 	if (initrd_start)
-		pr_info("Found initrd at 0x%lx:0x%lx\n", initrd_start, initrd_end);
+		pr_info("Found initramfs at 0x%lx:0x%lx\n", initrd_start, initrd_end);
 
 	DBG(" <- check_for_initrd()\n");
 #endif /* CONFIG_BLK_DEV_INITRD */
diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index eb092f293113..237d8386a3f4 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -296,9 +296,7 @@ static void __init pmac_setup_arch(void)
 #endif
 #ifdef CONFIG_PPC32
 #ifdef CONFIG_BLK_DEV_INITRD
-	if (initrd_start)
-		ROOT_DEV = Root_RAM0;
-	else
+	if (!initrd_start)
 #endif
 		ROOT_DEV = DEFAULT_ROOT_DEVICE;
 #endif
diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
index 7b529868789f..a4ce721b7fe8 100644
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@ -923,8 +923,6 @@ void __init setup_arch(char **cmdline_p)
 	/* boot_command_line has been already set up in early.c */
 	*cmdline_p = boot_command_line;
 
-        ROOT_DEV = Root_RAM0;
-
 	setup_initial_init_mm(_text, _etext, _edata, _end);
 
 	if (IS_ENABLED(CONFIG_EXPOLINE_AUTO))
diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
index 50f1d39fe34f..c4312ee13db9 100644
--- a/arch/sh/kernel/setup.c
+++ b/arch/sh/kernel/setup.c
@@ -147,10 +147,8 @@ void __init check_for_initrd(void)
 
 	/*
 	 * If we got this far in spite of the boot loader's best efforts
-	 * to the contrary, assume we actually have a valid initrd and
-	 * fix up the root dev.
+	 * to the contrary, assume we actually have a valid initramfs.
 	 */
-	ROOT_DEV = Root_RAM0;
 
 	/*
 	 * Address sanitization
diff --git a/include/linux/root_dev.h b/include/linux/root_dev.h
index 847c9a06101b..e411533b90b7 100644
--- a/include/linux/root_dev.h
+++ b/include/linux/root_dev.h
@@ -10,7 +10,6 @@ enum {
 	Root_NFS = MKDEV(UNNAMED_MAJOR, 255),
 	Root_CIFS = MKDEV(UNNAMED_MAJOR, 254),
 	Root_Generic = MKDEV(UNNAMED_MAJOR, 253),
-	Root_RAM0 = MKDEV(RAMDISK_MAJOR, 0),
 };
 
 extern dev_t ROOT_DEV;
diff --git a/init/do_mounts.c b/init/do_mounts.c
index f0b1a83dbda4..5c407ca54063 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -437,8 +437,6 @@ static dev_t __init parse_root_device(char *root_device_name)
 		return Root_NFS;
 	if (strcmp(root_device_name, "/dev/cifs") == 0)
 		return Root_CIFS;
-	if (strcmp(root_device_name, "/dev/ram") == 0)
-		return Root_RAM0;
 
 	error = early_lookup_bdev(root_device_name, &dev);
 	if (error) {
-- 
2.47.2


