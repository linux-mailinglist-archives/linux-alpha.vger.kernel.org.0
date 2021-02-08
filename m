Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1D7314272
	for <lists+linux-alpha@lfdr.de>; Mon,  8 Feb 2021 22:59:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbhBHV6V (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 8 Feb 2021 16:58:21 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:41836 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236985AbhBHV6L (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Mon, 8 Feb 2021 16:58:11 -0500
Received: from mail-oo1-f69.google.com ([209.85.161.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <seth.forshee@canonical.com>)
        id 1l9EXA-0004lb-T7
        for linux-alpha@vger.kernel.org; Mon, 08 Feb 2021 21:57:29 +0000
Received: by mail-oo1-f69.google.com with SMTP id o15so8656496oov.22
        for <linux-alpha@vger.kernel.org>; Mon, 08 Feb 2021 13:57:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=slTd59I7Y8E1WEkwRd821CTDk7j9skLtmaaFeE6az84=;
        b=JFKP9yQgi4EY5O6dxiX9V3TmHPejG5LQNAGDDbv13ES0RQIPGgaqzwgzFoFMZp4D2+
         fk4QNb28kvIta/kLFvlEqsS+47gBNoJdIvORjinnDa45wzO7sBjhty+MM+YDPxt6daKo
         pwnYS3QuNNSzYH1vkQldgvpx9IRStZrFnEjzMNnhjQCGJivhl7jQlCrhrvLF4UfE4AIz
         8HBPspc8uukIyOQqncVk/2fpvPEtOOOLqTVPFnSg5xTIRBXo7yBpquncQ75NdxDZmXE4
         X6DpEthXyNK8i1GgzBKWq0A5X3Isw6m3gVBvKI8ZjzoMBYUNy/dzmv3F31wnkA10oSUF
         xHUA==
X-Gm-Message-State: AOAM5315lZRHU4uuSBv6IUi++7uV9icPtt6Y4KmU7Q1w68HkocczVZxW
        3iyex7ALqNpONR2OQBXzC1S4b2B6nUVhzAVI5+v/Iv7e7UdmFC3Vt5+j8qcwzJNFJCGfjSTf15A
        fOF8c09kddf+9B46F4OC37VXoxjIjqccqz8CvVi5h
X-Received: by 2002:aca:52c3:: with SMTP id g186mr547245oib.136.1612821447891;
        Mon, 08 Feb 2021 13:57:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdmxPQ0LjgXEXekhxPlC8Xp1x895S5NdnL8KBPc+KE+eBLEBoYWh33hbrIv2kwqD1i89kT+w==
X-Received: by 2002:aca:52c3:: with SMTP id g186mr547233oib.136.1612821447721;
        Mon, 08 Feb 2021 13:57:27 -0800 (PST)
Received: from localhost ([2605:a601:ac0f:820:953a:a460:6ddc:bef4])
        by smtp.gmail.com with ESMTPSA id g3sm3839161ooi.28.2021.02.08.13.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 13:57:26 -0800 (PST)
From:   Seth Forshee <seth.forshee@canonical.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Chris Down <chris@chrisdown.name>,
        Amir Goldstein <amir73il@gmail.com>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-mm@kvack.org,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH] tmpfs: disallow CONFIG_TMPFS_INODE64 on alpha
Date:   Mon,  8 Feb 2021 15:57:26 -0600
Message-Id: <20210208215726.608197-1-seth.forshee@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

As with s390, alpha is a 64-bit architecture with a 32-bit ino_t.
With CONFIG_TMPFS_INODE64=y tmpfs mounts will get 64-bit inode
numbers and display "inode64" in the mount options, whereas
passing "inode64" in the mount options will fail. This leads to
erroneous behaviours such as this:

 # mkdir mnt
 # mount -t tmpfs nodev mnt
 # mount -o remount,rw mnt
 mount: /home/ubuntu/mnt: mount point not mounted or bad option.

Prevent CONFIG_TMPFS_INODE64 from being selected on alpha.

Fixes: ea3271f7196c ("tmpfs: support 64-bit inums per-sb")
Cc: stable@vger.kernel.org # v5.9+
Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 fs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/Kconfig b/fs/Kconfig
index 3347ec7bd837..da524c4d7b7e 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -203,7 +203,7 @@ config TMPFS_XATTR
 
 config TMPFS_INODE64
 	bool "Use 64-bit ino_t by default in tmpfs"
-	depends on TMPFS && 64BIT && !S390
+	depends on TMPFS && 64BIT && !(S390 || ALPHA)
 	default n
 	help
 	  tmpfs has historically used only inode numbers as wide as an unsigned
-- 
2.29.2

