Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1C1424AAB2
	for <lists+linux-alpha@lfdr.de>; Thu, 20 Aug 2020 02:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgHTAEc (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 19 Aug 2020 20:04:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:34752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728461AbgHTAEV (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 19 Aug 2020 20:04:21 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9EFB2208E4;
        Thu, 20 Aug 2020 00:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597881861;
        bh=4hK1erPQRlP1+oL9gdRiB7F0rzjISyPy6USi40HgIjg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MHl8AiitCyMT5o22zzMs6WH0nBbCEEVqgeTSJwXferqYd16qjN7sZ2CCDZHqaq1JK
         hipKFNCohFVI8CU0rgbplR7z2tp5Z9anAdUnvzLzJzBvBIsj9by08nJ60bcKafqpkN
         EMWtrZC5Bfu6OWO5Djrtg0hLBUCtPCwLoE9GLXL8=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        kernel test robot <lkp@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-alpha@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 10/10] alpha: fix annotation of io{read,write}{16,32}be()
Date:   Wed, 19 Aug 2020 20:04:06 -0400
Message-Id: <20200820000406.216050-10-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200820000406.216050-1-sashal@kernel.org>
References: <20200820000406.216050-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

[ Upstream commit bd72866b8da499e60633ff28f8a4f6e09ca78efe ]

These accessors must be used to read/write a big-endian bus.  The value
returned or written is native-endian.

However, these accessors are defined using be{16,32}_to_cpu() or
cpu_to_be{16,32}() to make the endian conversion but these expect a
__be{16,32} when none is present.  Keeping them would need a force cast
that would solve nothing at all.

So, do the conversion using swab{16,32}, like done in asm-generic for
similar situations.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Link: http://lkml.kernel.org/r/20200622114232.80039-1-luc.vanoostenryck@gmail.com
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/alpha/include/asm/io.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index ff4049155c840..355aec0867f4d 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -491,10 +491,10 @@ extern inline void writeq(u64 b, volatile void __iomem *addr)
 }
 #endif
 
-#define ioread16be(p) be16_to_cpu(ioread16(p))
-#define ioread32be(p) be32_to_cpu(ioread32(p))
-#define iowrite16be(v,p) iowrite16(cpu_to_be16(v), (p))
-#define iowrite32be(v,p) iowrite32(cpu_to_be32(v), (p))
+#define ioread16be(p) swab16(ioread16(p))
+#define ioread32be(p) swab32(ioread32(p))
+#define iowrite16be(v,p) iowrite16(swab16(v), (p))
+#define iowrite32be(v,p) iowrite32(swab32(v), (p))
 
 #define inb_p		inb
 #define inw_p		inw
-- 
2.25.1

