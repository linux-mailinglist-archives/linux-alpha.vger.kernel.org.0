Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C731E1FF3D2
	for <lists+linux-alpha@lfdr.de>; Thu, 18 Jun 2020 15:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730602AbgFRNva (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 18 Jun 2020 09:51:30 -0400
Received: from mga09.intel.com ([134.134.136.24]:39004 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730616AbgFRNvV (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 18 Jun 2020 09:51:21 -0400
IronPort-SDR: bjXGZgDPAStywaY4BSLcBfvVI8IaUkRnQ0A7RzVA+cPRpoIv7bvVeToN2xkaUcl78ZGPDonSIM
 tRYsn4MVY58g==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="144091198"
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; 
   d="scan'208";a="144091198"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2020 06:51:21 -0700
IronPort-SDR: 8U2wcFmuRpZGkf6iOVmYI+LHqs/G9CYYBdrA3B+Ukc6aUKAS0XdhCBZEOd0JHxNVSVVE6Znayw
 vF6TqKBcfmbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; 
   d="scan'208";a="291771980"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 18 Jun 2020 06:51:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9ACB42AA; Thu, 18 Jun 2020 16:51:18 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v1] alpha: io: Make sparse happy about bitwise types
Date:   Thu, 18 Jun 2020 16:51:17 +0300
Message-Id: <20200618135117.14894-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Alpha the IO accessors are using plain unsigned types, such as uXX.
But Alpha can be configured to any endianess and implementation of
BE IO accessors, such as iowrite32be(), require endianess conversion.
This conversion, when done via cpu_to*() and *_to_cpu() helpers, uses
bitwise types of which sparse is not happy.

8250_dwlib.c:45:17: sparse: sparse: incorrect type in argument 1 (different base types)
8250_dwlib.c:45:17: sparse:     expected unsigned int [usertype]
8250_dwlib.c:45:17: sparse:     got restricted __be32 [usertype]

One way is to use a lot of ifdeffery to properly use swab*() combination with
writel() or so, another is much simpler, i.e. forcing types, especially taking
into consideration the commit message of the original commit for that API.

Fixes: 25534eb77078 ("alpha: add io{read,write}{16,32}be functions")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/alpha/include/asm/io.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index a4d0c19f1e79..9529656c24bb 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -491,8 +491,8 @@ extern inline void writeq(u64 b, volatile void __iomem *addr)
 
 #define ioread16be(p) be16_to_cpu(ioread16(p))
 #define ioread32be(p) be32_to_cpu(ioread32(p))
-#define iowrite16be(v,p) iowrite16(cpu_to_be16(v), (p))
-#define iowrite32be(v,p) iowrite32(cpu_to_be32(v), (p))
+#define iowrite16be(v,p) iowrite16((__force u16)cpu_to_be16(v), (p))
+#define iowrite32be(v,p) iowrite32((__force u32)cpu_to_be32(v), (p))
 
 #define inb_p		inb
 #define inw_p		inw
-- 
2.27.0.rc2

