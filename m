Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A91EF3AF999
	for <lists+linux-alpha@lfdr.de>; Tue, 22 Jun 2021 01:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhFUXmB (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 21 Jun 2021 19:42:01 -0400
Received: from mga04.intel.com ([192.55.52.120]:59312 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231707AbhFUXmA (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 21 Jun 2021 19:42:00 -0400
IronPort-SDR: 1ywaGA0GSHFyLCMSBjJQC/wTWCiHIkWaJOPf5LX+2L7ATBYx7NAF0i/UbZi4VdQ8cBdpORL2e4
 ps6BGoID8Gqg==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="205127015"
X-IronPort-AV: E=Sophos;i="5.83,290,1616482800"; 
   d="gz'50?scan'50,208,50";a="205127015"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2021 16:39:42 -0700
IronPort-SDR: 9MBUNGhWkxtgNVNX2rW4/0nkcfoDuYTkRyyCh3eGmjAYYHOC6VvLV5PgdsFpa0XyFjYusxYp/V
 NS4Mb0nkP/5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,290,1616482800"; 
   d="gz'50?scan'50,208,50";a="556419735"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2021 16:39:39 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lvTVy-0004qZ-Sm; Mon, 21 Jun 2021 23:39:38 +0000
Date:   Tue, 22 Jun 2021 07:38:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     akpm@linux-foundation.org, aneesh.kumar@linux.ibm.com,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org
Cc:     kbuild-all@lists.01.org
Subject: Re: [to-be-updated]
 mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t.patch
 removed from -mm tree
Message-ID: <202106220755.ti7LqBKU-lkp@intel.com>
References: <20210616230804.7nsBdkkF4%akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <20210616230804.7nsBdkkF4%akpm@linux-foundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on tip/x86/mm asm-generic/master linus/master sparc/master v5.13-rc7]
[cannot apply to sparc-next/master next-20210621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/akpm-linux-foundation-org/mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t-patch-removed-from-mm-tree/20210617-075958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: m68k-randconfig-r011-20210621 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/490957abd94a7b67576c0029c771c6691dce1878
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review akpm-linux-foundation-org/mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t-patch-removed-from-mm-tree/20210617-075958
        git checkout 490957abd94a7b67576c0029c771c6691dce1878
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/m68k/mm/motorola.c: In function 'kernel_ptr_table':
>> arch/m68k/mm/motorola.c:265:8: warning: assignment to 'long unsigned int' from 'pmd_t *' {aka 'struct <anonymous> *'} makes integer from pointer without a cast [-Wint-conversion]
     265 |    pmd = pgd_page_vaddr(kernel_pg_dir[i]);
         |        ^
   arch/m68k/mm/motorola.c: At top level:
   arch/m68k/mm/motorola.c:390:13: warning: no previous prototype for 'paging_init' [-Wmissing-prototypes]
     390 | void __init paging_init(void)
         |             ^~~~~~~~~~~


vim +265 arch/m68k/mm/motorola.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  248  
^1da177e4c3f41 Linus Torvalds     2005-04-16  249  static pmd_t * __init kernel_ptr_table(void)
^1da177e4c3f41 Linus Torvalds     2005-04-16  250  {
ef9285f69f0efb Peter Zijlstra     2020-01-31  251  	if (!last_pmd_table) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  252  		unsigned long pmd, last;
^1da177e4c3f41 Linus Torvalds     2005-04-16  253  		int i;
^1da177e4c3f41 Linus Torvalds     2005-04-16  254  
^1da177e4c3f41 Linus Torvalds     2005-04-16  255  		/* Find the last ptr table that was used in head.S and
^1da177e4c3f41 Linus Torvalds     2005-04-16  256  		 * reuse the remaining space in that page for further
^1da177e4c3f41 Linus Torvalds     2005-04-16  257  		 * ptr tables.
^1da177e4c3f41 Linus Torvalds     2005-04-16  258  		 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  259  		last = (unsigned long)kernel_pg_dir;
^1da177e4c3f41 Linus Torvalds     2005-04-16  260  		for (i = 0; i < PTRS_PER_PGD; i++) {
60e50f34b13e9e Mike Rapoport      2019-12-04  261  			pud_t *pud = (pud_t *)(&kernel_pg_dir[i]);
60e50f34b13e9e Mike Rapoport      2019-12-04  262  
60e50f34b13e9e Mike Rapoport      2019-12-04  263  			if (!pud_present(*pud))
^1da177e4c3f41 Linus Torvalds     2005-04-16  264  				continue;
60e50f34b13e9e Mike Rapoport      2019-12-04 @265  			pmd = pgd_page_vaddr(kernel_pg_dir[i]);
^1da177e4c3f41 Linus Torvalds     2005-04-16  266  			if (pmd > last)
^1da177e4c3f41 Linus Torvalds     2005-04-16  267  				last = pmd;
^1da177e4c3f41 Linus Torvalds     2005-04-16  268  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  269  
ef9285f69f0efb Peter Zijlstra     2020-01-31  270  		last_pmd_table = (pmd_t *)last;
^1da177e4c3f41 Linus Torvalds     2005-04-16  271  #ifdef DEBUG
ef9285f69f0efb Peter Zijlstra     2020-01-31  272  		printk("kernel_ptr_init: %p\n", last_pmd_table);
^1da177e4c3f41 Linus Torvalds     2005-04-16  273  #endif
^1da177e4c3f41 Linus Torvalds     2005-04-16  274  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  275  
ef9285f69f0efb Peter Zijlstra     2020-01-31  276  	last_pmd_table += PTRS_PER_PMD;
41f1bf37a63ecd Geert Uytterhoeven 2020-08-26  277  	if (PAGE_ALIGNED(last_pmd_table)) {
7e158826564fbb Geert Uytterhoeven 2020-08-26  278  		last_pmd_table = memblock_alloc_low(PAGE_SIZE, PAGE_SIZE);
ef9285f69f0efb Peter Zijlstra     2020-01-31  279  		if (!last_pmd_table)
8a7f97b902f4fb Mike Rapoport      2019-03-11  280  			panic("%s: Failed to allocate %lu bytes align=%lx\n",
8a7f97b902f4fb Mike Rapoport      2019-03-11  281  			      __func__, PAGE_SIZE, PAGE_SIZE);
^1da177e4c3f41 Linus Torvalds     2005-04-16  282  
ef9285f69f0efb Peter Zijlstra     2020-01-31  283  		clear_page(last_pmd_table);
ef9285f69f0efb Peter Zijlstra     2020-01-31  284  		mmu_page_ctor(last_pmd_table);
^1da177e4c3f41 Linus Torvalds     2005-04-16  285  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  286  
ef9285f69f0efb Peter Zijlstra     2020-01-31  287  	return last_pmd_table;
^1da177e4c3f41 Linus Torvalds     2005-04-16  288  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  289  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--BXVAT5kNtrzKuDFl
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
pXIQdSsBAA==

--BXVAT5kNtrzKuDFl--
