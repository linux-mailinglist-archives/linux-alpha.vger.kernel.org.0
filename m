Return-Path: <linux-alpha+bounces-2097-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9E0A6C3AA
	for <lists+linux-alpha@lfdr.de>; Fri, 21 Mar 2025 20:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4432F480AE5
	for <lists+linux-alpha@lfdr.de>; Fri, 21 Mar 2025 19:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2A0230D3A;
	Fri, 21 Mar 2025 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AoVSmLWx"
X-Original-To: linux-alpha@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9273F230BD6
	for <linux-alpha@vger.kernel.org>; Fri, 21 Mar 2025 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742586567; cv=none; b=Jdkk8PYeL14eeZGu95F4TyUzl7ENRD+RcuqPFsoAFFUAAYiOiCpB65XX8XrXZICLhc1qIjcQMUPecgVsxawem+CWC7LoZEm2QM7W12YNIpVn6WtSQ8aW+1U9PRRU9CcUrwDkeDyO01Bclep7xfNf+VemukYsYV7Sv2N6+jt1ioE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742586567; c=relaxed/simple;
	bh=U65D6SohAEKFKir81pK5H51AE5x6/jUW8l5jaJk9nGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+KB+Hr2Yeb88vUu2irT2UMraJEzzhQmpbbnixA8PkRq2ny3IBvlD1IYDqhAntabwhubNDzftINpljjInoyEA+vbOAyV9jS5lKBBJ5fLpjIgCxk7EGk+b5In97oJUiZb3M3SqDh3uTzjfRrL84NDFzW1f7ypuWmr9S+1yJwTgSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AoVSmLWx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742586562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P+CKY6hYnggEy5gDUo8IBcPB4aoVwWaaXqwhjqRQh5c=;
	b=AoVSmLWx5YwJPEtLVi1Z6cNl8Jc31u1ef/LKGwe8yfwooSvSDGvrrvPoQ6wu3w1+HZU0Qy
	y+YXTLPqu/ezYvYpytSKqXsT8DuC6fguSzCSQdjLb84vXphbZpLuZYQR+/3sojd2lQ1wKz
	mMHgRmzcqVdO5xykTVNvjbQFrN0Ey54=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-nkmqKVueOQqCiCe8pqOIIA-1; Fri, 21 Mar 2025 15:49:19 -0400
X-MC-Unique: nkmqKVueOQqCiCe8pqOIIA-1
X-Mimecast-MFC-AGG-ID: nkmqKVueOQqCiCe8pqOIIA_1742586556
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac3dca41591so188619066b.1
        for <linux-alpha@vger.kernel.org>; Fri, 21 Mar 2025 12:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742586556; x=1743191356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+CKY6hYnggEy5gDUo8IBcPB4aoVwWaaXqwhjqRQh5c=;
        b=DQq6pnXxTXTmGnDzPtmKZwseaIIAi66XENu5OwdB2G8eO9Lft5i0KYAtTxUu3/5lvy
         /G/GF3DKSP7mkIZirsoSou7rkjDB9DS0jzJdM8PYyWham6Y8YIEQuajBU4YQRpqPx/F0
         r5Is9xGOLH3htbE9lQbcXkyYLWtdYbAvug9GoSi1zeY3qI0iBiASvek4eiESelS9OASu
         JO16PQYT5X8KglIantUE1bjsjzGkffMGqVRqIwIhewh0rpjJ5V9bI+y11j6nBEW1omKz
         DGh3gXbDxaCBXfUVz37/FLz5Ub4yz+UmfDivI2AYV+yTz7jAXsPPH8h7NyUqoxaRywNz
         sXKw==
X-Gm-Message-State: AOJu0Yy9LcgazenxY4R0OtCywmWxdh9OVZzyBuwiO3GPb/JLaXHQJnY9
	+cRwDRX3fy7SMAMEiyzi11m+JE0NxQMEox1hJFVTGFWwaRTLPogEsKLIZm/eqI7ZBk+DkEsGgNS
	XEPqD/4ZVqrlPS2TPLec2gGh6ZJHjaHVJcXltwG5pA3i2KZrQMgovlfhvjYk=
X-Gm-Gg: ASbGncsEgrU7Vi8N255aS3HExy/L+Lq7h8MPNHwD2nM+5jBnDemuJFM5TypmTwNOzG/
	vacfg9ckPl4E2zPCKi1JxHpZWx7KJExrSykdNJOQ6SGkhD0epbFg2aidT6cKxNh5aLpPaWMwbGH
	GCKGVgxJ5r4czkMKiC1blZSdGZnqkrKsAnq6RDnq2VmFXYFHJPIhXgH/E8uKrrhB6VEkiBhq2iW
	FrkIWqJtma270uhTqQL1ihvejuQfmCKQndwaqDuzX16O/5RnC2qk+8/5ZcNA9WccWGvcLR3QubV
	EZs+PMINoFIYj3DBUKGRTPdc1JZw7XrOFrxZtAx4HA==
X-Received: by 2002:a17:907:9482:b0:ac2:13f:338b with SMTP id a640c23a62f3a-ac3f2537a13mr417245366b.55.1742586555810;
        Fri, 21 Mar 2025 12:49:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE364/oBuyn+cE4ig5ONss+vPjSo5TWTy9RSOBlsLCFEbZLg0sVEvc8UiI6SNuN3e2vwFGwrA==
X-Received: by 2002:a17:907:9482:b0:ac2:13f:338b with SMTP id a640c23a62f3a-ac3f2537a13mr417237066b.55.1742586555219;
        Fri, 21 Mar 2025 12:49:15 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d3d38sm204412266b.39.2025.03.21.12.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 12:49:13 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Fri, 21 Mar 2025 20:48:41 +0100
Subject: [PATCH v4 2/3] fs: split fileattr/fsxattr converters into helpers
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-xattrat-syscall-v4-2-3e82e6fb3264@kernel.org>
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
In-Reply-To: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
 Andrey Albershteyn <aalbersh@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3102; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=U65D6SohAEKFKir81pK5H51AE5x6/jUW8l5jaJk9nGM=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIY0u8e2nhsqffE2qNHBdc56kpaBv10/G5zKMBMNU5Y1
 7+08cOt3t6OUhYGMS4GWTFFlnXSWlOTiqTyjxjUyMPMYWUCGcLAxSkAF7Fl+MO39MOayUtjz0Xc
 Zf+S85RBZMPrQyk/IssaWQR3V917GlLI8D93Rvvtmb0TdxnrLdm5326CcYQxW4JKaaBU3XVFNfO
 V51kB1DlIeQ==
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108

This will be helpful for get/setfsxattrat syscalls to convert
between fileattr and fsxattr.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/ioctl.c               | 32 +++++++++++++++++++++-----------
 include/linux/fileattr.h |  2 ++
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/fs/ioctl.c b/fs/ioctl.c
index 4434c97bc5dff5a3e8635e28745cd99404ff353e..840283d8c406623d8d26790f89b62ebcbd39e2de 100644
--- a/fs/ioctl.c
+++ b/fs/ioctl.c
@@ -538,6 +538,16 @@ int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
 }
 EXPORT_SYMBOL(vfs_fileattr_get);
 
+void fileattr_to_fsxattr(const struct fileattr *fa, struct fsxattr *fsx)
+{
+	memset(fsx, 0, sizeof(struct fsxattr));
+	fsx->fsx_xflags = fa->fsx_xflags;
+	fsx->fsx_extsize = fa->fsx_extsize;
+	fsx->fsx_nextents = fa->fsx_nextents;
+	fsx->fsx_projid = fa->fsx_projid;
+	fsx->fsx_cowextsize = fa->fsx_cowextsize;
+}
+
 /**
  * copy_fsxattr_to_user - copy fsxattr to userspace.
  * @fa:		fileattr pointer
@@ -549,12 +559,7 @@ int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa)
 {
 	struct fsxattr xfa;
 
-	memset(&xfa, 0, sizeof(xfa));
-	xfa.fsx_xflags = fa->fsx_xflags;
-	xfa.fsx_extsize = fa->fsx_extsize;
-	xfa.fsx_nextents = fa->fsx_nextents;
-	xfa.fsx_projid = fa->fsx_projid;
-	xfa.fsx_cowextsize = fa->fsx_cowextsize;
+	fileattr_to_fsxattr(fa, &xfa);
 
 	if (copy_to_user(ufa, &xfa, sizeof(xfa)))
 		return -EFAULT;
@@ -563,6 +568,15 @@ int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa)
 }
 EXPORT_SYMBOL(copy_fsxattr_to_user);
 
+void fsxattr_to_fileattr(const struct fsxattr *fsx, struct fileattr *fa)
+{
+	fileattr_fill_xflags(fa, fsx->fsx_xflags);
+	fa->fsx_extsize = fsx->fsx_extsize;
+	fa->fsx_nextents = fsx->fsx_nextents;
+	fa->fsx_projid = fsx->fsx_projid;
+	fa->fsx_cowextsize = fsx->fsx_cowextsize;
+}
+
 static int copy_fsxattr_from_user(struct fileattr *fa,
 				  struct fsxattr __user *ufa)
 {
@@ -571,11 +585,7 @@ static int copy_fsxattr_from_user(struct fileattr *fa,
 	if (copy_from_user(&xfa, ufa, sizeof(xfa)))
 		return -EFAULT;
 
-	fileattr_fill_xflags(fa, xfa.fsx_xflags);
-	fa->fsx_extsize = xfa.fsx_extsize;
-	fa->fsx_nextents = xfa.fsx_nextents;
-	fa->fsx_projid = xfa.fsx_projid;
-	fa->fsx_cowextsize = xfa.fsx_cowextsize;
+	fsxattr_to_fileattr(&xfa, fa);
 
 	return 0;
 }
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index 47c05a9851d0600964b644c9c7218faacfd865f8..31888fa2edf10050be134f587299256088344365 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -33,7 +33,9 @@ struct fileattr {
 	bool	fsx_valid:1;
 };
 
+void fileattr_to_fsxattr(const struct fileattr *fa, struct fsxattr *fsx);
 int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa);
+void fsxattr_to_fileattr(const struct fsxattr *fsx, struct fileattr *fa);
 
 void fileattr_fill_xflags(struct fileattr *fa, u32 xflags);
 void fileattr_fill_flags(struct fileattr *fa, u32 flags);

-- 
2.47.2


