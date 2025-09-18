Return-Path: <linux-alpha+bounces-2424-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8237B55B49
	for <lists+linux-alpha@lfdr.de>; Sat, 13 Sep 2025 02:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AED3A1D62AAB
	for <lists+linux-alpha@lfdr.de>; Sat, 13 Sep 2025 00:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7611547E7;
	Sat, 13 Sep 2025 00:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGk3bVsR"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD11272606
	for <linux-alpha@vger.kernel.org>; Sat, 13 Sep 2025 00:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757724400; cv=none; b=llnburrQaZl9EfykolkdlyVt+VUvMIh6scQQMjyz28kfR5792q1rcBObww88xKX0ynTgtxY8mFrQiBWgKq0lk0dZd49RsZJrAEXRo4ILmbuwxb/qQOxhfR3dySUckFdVpz57gzyKeNi7zYq4RT/tnorKiTGhwV5wEgXuG9wt+DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757724400; c=relaxed/simple;
	bh=zjnx3/NY9AOu8ee75jqsChu3O0QCH1Ezxe1gYYeY9CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SkdhxmTnUQvEzAlE1f73xe8loDRZMfykA9N3LS6pY6ohioU8dbEjYEaamyeOXp7OEKuQ3cxlPFmkG+LrBvde26I0YZiNxXJmvK6ttPw6Q78ALviQw4sFXtwoaoxFVQO4YOjSJm1IoBYbcZRUs1KVrnY5MXemTMooIvmgRQPtO+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGk3bVsR; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62f0702ef0dso235288a12.1
        for <linux-alpha@vger.kernel.org>; Fri, 12 Sep 2025 17:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724394; x=1758329194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y83Wia04Z/mNTHCUGozzAt26nJVQ29vmo/6z8Jb/IIM=;
        b=PGk3bVsRmWQpgLwAnVuCRO0kfYqwetnBUpZ9Zl3Pvel66XWmCXB4VKQL5Bdc7K3yzn
         M/NiRXfXYINjUibah+GvZKkATvgQcgRMrf1NawlM6FGu0AMPYtqvTfiI1b3aVJjsZ1zG
         5YdT6fe78qL81b9ih8iEIF4U5t2vDQEqoXcLlaw+dOojNkrgJ0XGZoO11wokr1P3l8k1
         2POWKMHVAj+usqOdMHfl8x1l168nDqH0UlymBKEpDjbdysCodQukbPtnikPIMlUgCONA
         EeCKIjtBRwOssS5KWaLD6MYW6PEx814n+0axgQBjjZ9AyZVboPwbEM/rFfBdkNQ+CZsf
         jz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724394; x=1758329194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y83Wia04Z/mNTHCUGozzAt26nJVQ29vmo/6z8Jb/IIM=;
        b=OYXpiorl/AccQJRf61Zxtm8HnubqMq5cT3pNQySX7p/+ObvrFyCK14TOhteUEIAFid
         TRHDLdd61MHGxP6Fx4XLer8q44kJTurdIVXcbfGpCea/IitXwk6dIZC0BrzX5WZQy1To
         br3tzlhsombyPPP9vGi/pkN430AltJo33yLWUJLzgtd+f/y+BMR4JKXNq6Kj/xOOAhlf
         aR+jTukaqYeUo+aBBboOBeQzkJFz/l6jQ6kvywa+bXzcKreIr1nfaC4ao6aYfxwxQrcG
         5LIilCosDHPQJ0dk3DhMQMzY1pzdz7k+krusGgg3JT3H7sFoUW3WijUjizEGNNKukNL0
         y1Lw==
X-Forwarded-Encrypted: i=1; AJvYcCX1f4Iwo3HTAqufzh9FEkErVwuBWe7S0N0rcNBIMkewIgjneN9ETisq5BoB0Y9DVPSiSCCs1koZcYgGEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhnTEyWBEVOTPewlPUUqLIAvJyhWN+N6rxSv+qwpZFQZ+drakn
	tBbAYhIPHOrk2CahoEUZHY33od5Pq5Vf8HttVdcBqKDe/q13uYowH+iQ
X-Gm-Gg: ASbGncvdhFFO9hWQsg0kSI4at4LoJ6pi+tYq00WsN2Y/5jMn12JNv7KA7NU8ve8yNPE
	NywanaKd8QvBn80ljdZyPHX+WNQkGEsIMt3/+WiOiVxV6BAWhyWSObETmsJ83i6r7qWao/aHrf4
	SjELYyKeS4Sf6S+gNCSyXQH1E4mSQKuMWjzPxv1abF3TTgARkYNvTW748QZPWgJJ6Da75Wumkpy
	A10nZlRC0JlGNCjN8l8OGk3Yye0VaYcDXQANOcDlgJO2fYhqgdTLQ5nXSwLDygD9h4mK+iPPLhr
	nVjTJ9HrB1cDc5BAkwiuMu26F2hJ1bahHkjaMcxPMvZXuB1kUSwWqbYgym5SihlxGhgKF4QXGHZ
	5EkZ6oRv8qcdGC+R49fY=
X-Google-Smtp-Source: AGHT+IEhRE4IwIn6e21II3sG+AWhFOewnNElGtSUdTtt48+B8a0G24fjikoaCpJ97iRLzEKC56BiAg==
X-Received: by 2002:a17:907:96a3:b0:b07:e258:4629 with SMTP id a640c23a62f3a-b07e2584a05mr103605766b.16.1757724393999;
        Fri, 12 Sep 2025 17:46:33 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32f2334sm475232966b.78.2025.09.12.17.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:46:33 -0700 (PDT)
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
Subject: [PATCH RESEND 06/62] arm: init: remove special logic for setting brd.rd_size
Date: Sat, 13 Sep 2025 00:37:45 +0000
Message-ID: <20250913003842.41944-7-safinaskar@gmail.com>
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

There is no any reason for having special mechanism
for setting ramdisk size.

Also this allows us to change rd_size variable to static

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/arm/kernel/atags_parse.c | 12 ------------
 drivers/block/brd.c           |  8 ++++----
 include/linux/initrd.h        |  3 ---
 3 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/arch/arm/kernel/atags_parse.c b/arch/arm/kernel/atags_parse.c
index a3f0a4f84e04..615d9e83c9b5 100644
--- a/arch/arm/kernel/atags_parse.c
+++ b/arch/arm/kernel/atags_parse.c
@@ -87,18 +87,6 @@ static int __init parse_tag_videotext(const struct tag *tag)
 __tagtable(ATAG_VIDEOTEXT, parse_tag_videotext);
 #endif
 
-#ifdef CONFIG_BLK_DEV_RAM
-static int __init parse_tag_ramdisk(const struct tag *tag)
-{
-	if (tag->u.ramdisk.size)
-		rd_size = tag->u.ramdisk.size;
-
-	return 0;
-}
-
-__tagtable(ATAG_RAMDISK, parse_tag_ramdisk);
-#endif
-
 static int __init parse_tag_serialnr(const struct tag *tag)
 {
 	system_serial_low = tag->u.serialnr.low;
diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index 0c2eabe14af3..72f02d2b8a99 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -27,6 +27,10 @@
 
 #include <linux/uaccess.h>
 
+static unsigned long rd_size = CONFIG_BLK_DEV_RAM_SIZE;
+module_param(rd_size, ulong, 0444);
+MODULE_PARM_DESC(rd_size, "Size of each RAM disk in kbytes.");
+
 /*
  * Each block ramdisk device has a xarray brd_pages of pages that stores
  * the pages containing the block device's contents.
@@ -209,10 +213,6 @@ static int rd_nr = CONFIG_BLK_DEV_RAM_COUNT;
 module_param(rd_nr, int, 0444);
 MODULE_PARM_DESC(rd_nr, "Maximum number of brd devices");
 
-unsigned long rd_size = CONFIG_BLK_DEV_RAM_SIZE;
-module_param(rd_size, ulong, 0444);
-MODULE_PARM_DESC(rd_size, "Size of each RAM disk in kbytes.");
-
 static int max_part = 1;
 module_param(max_part, int, 0444);
 MODULE_PARM_DESC(max_part, "Num Minors to reserve between devices");
diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index 6320a9cb6686..b42235c21444 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -5,9 +5,6 @@
 
 #define INITRD_MINOR 250 /* shouldn't collide with /dev/ram* too soon ... */
 
-/* size of a single RAM disk */
-extern unsigned long rd_size;
-
 /* 1 if it is not an error if initrd_start < memory_start */
 extern int initrd_below_start_ok;
 
-- 
2.47.2


