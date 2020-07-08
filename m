Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF99218CE8
	for <lists+linux-alpha@lfdr.de>; Wed,  8 Jul 2020 18:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730278AbgGHQX1 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 8 Jul 2020 12:23:27 -0400
Received: from mga05.intel.com ([192.55.52.43]:20744 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730116AbgGHQX1 (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 8 Jul 2020 12:23:27 -0400
IronPort-SDR: wO47Tto9pLNM3vjYiA0VBymsi/2oL2ra2BMj1T1ftKR7qGA+QX22d1JHPC53F2iwz8uPtjm35C
 aZCzhUP8zLoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="232725557"
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; 
   d="scan'208";a="232725557"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2020 09:23:27 -0700
IronPort-SDR: f90kjkVLuSx4DyNZzz4rsmDd7qpDPBBSR89NBD3M2EQQLWtcFWvct98V7UU7YKfU+PxQEX9qNV
 OR1vznApnrnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; 
   d="scan'208";a="322983726"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Jul 2020 09:23:25 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jtCr0-000hbm-6r; Wed, 08 Jul 2020 19:23:26 +0300
Date:   Wed, 8 Jul 2020 19:23:26 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1] alpha: io: Make sparse happy about bitwise types
Message-ID: <20200708162326.GO3703480@smile.fi.intel.com>
References: <20200618135117.14894-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618135117.14894-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, Jun 18, 2020 at 04:51:17PM +0300, Andy Shevchenko wrote:
> On Alpha the IO accessors are using plain unsigned types, such as uXX.
> But Alpha can be configured to any endianess and implementation of
> BE IO accessors, such as iowrite32be(), require endianess conversion.
> This conversion, when done via cpu_to*() and *_to_cpu() helpers, uses
> bitwise types of which sparse is not happy.
> 
> 8250_dwlib.c:45:17: sparse: sparse: incorrect type in argument 1 (different base types)
> 8250_dwlib.c:45:17: sparse:     expected unsigned int [usertype]
> 8250_dwlib.c:45:17: sparse:     got restricted __be32 [usertype]
> 
> One way is to use a lot of ifdeffery to properly use swab*() combination with
> writel() or so, another is much simpler, i.e. forcing types, especially taking
> into consideration the commit message of the original commit for that API.

Any comment on this so far?

> Fixes: 25534eb77078 ("alpha: add io{read,write}{16,32}be functions")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/alpha/include/asm/io.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
> index a4d0c19f1e79..9529656c24bb 100644
> --- a/arch/alpha/include/asm/io.h
> +++ b/arch/alpha/include/asm/io.h
> @@ -491,8 +491,8 @@ extern inline void writeq(u64 b, volatile void __iomem *addr)
>  
>  #define ioread16be(p) be16_to_cpu(ioread16(p))
>  #define ioread32be(p) be32_to_cpu(ioread32(p))
> -#define iowrite16be(v,p) iowrite16(cpu_to_be16(v), (p))
> -#define iowrite32be(v,p) iowrite32(cpu_to_be32(v), (p))
> +#define iowrite16be(v,p) iowrite16((__force u16)cpu_to_be16(v), (p))
> +#define iowrite32be(v,p) iowrite32((__force u32)cpu_to_be32(v), (p))
>  
>  #define inb_p		inb
>  #define inw_p		inw
> -- 
> 2.27.0.rc2
> 

-- 
With Best Regards,
Andy Shevchenko


