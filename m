Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF57E486C9E
	for <lists+linux-alpha@lfdr.de>; Thu,  6 Jan 2022 22:47:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244720AbiAFVri (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 6 Jan 2022 16:47:38 -0500
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:64441 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244684AbiAFVqz (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Thu, 6 Jan 2022 16:46:55 -0500
Received: from pop-os.home ([90.11.185.88])
        by smtp.orange.fr with ESMTPA
        id 5aazntU632lVY5aaznSl6v; Thu, 06 Jan 2022 22:46:53 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 06 Jan 2022 22:46:53 +0100
X-ME-IP: 90.11.185.88
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     arnd@arndb.de, hch@infradead.org, akpm@linux-foundation.org,
        rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com
Cc:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 01/16] alpha: Remove usage of the deprecated "pci-dma-compat.h" API
Date:   Thu,  6 Jan 2022 22:46:52 +0100
Message-Id: <30686538ee42aaa4c2dd0788c42edbc6df07f250.1641500561.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

In [1], Christoph Hellwig has proposed to remove the wrappers in
include/linux/pci-dma-compat.h.

Some reasons why this API should be removed have been given by Julia
Lawall in [2].

A coccinelle script has been used to perform the needed transformation.
It can be found in [3].

[1]: https://lore.kernel.org/kernel-janitors/20200421081257.GA131897@infradead.org/
[2]: https://lore.kernel.org/kernel-janitors/alpine.DEB.2.22.394.2007120902170.2424@hadrien/
[3]: https://lore.kernel.org/kernel-janitors/20200716192821.321233-1-christophe.jaillet@wanadoo.fr/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
Reviewed in: https://lore.kernel.org/kernel-janitors/CAK8P3a2XwFveAd8nSCexZG3_UZga2PQ+EXHxQLGaWkLjCwrBxQ@mail.gmail.com/
---
 arch/alpha/include/asm/floppy.h |  7 ++++---
 arch/alpha/kernel/pci_iommu.c   | 12 ++++++------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/alpha/include/asm/floppy.h b/arch/alpha/include/asm/floppy.h
index 8dfdb3aa1d96..588758685439 100644
--- a/arch/alpha/include/asm/floppy.h
+++ b/arch/alpha/include/asm/floppy.h
@@ -43,17 +43,18 @@ alpha_fd_dma_setup(char *addr, unsigned long size, int mode, int io)
 	static int prev_dir;
 	int dir;
 
-	dir = (mode != DMA_MODE_READ) ? PCI_DMA_FROMDEVICE : PCI_DMA_TODEVICE;
+	dir = (mode != DMA_MODE_READ) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
 
 	if (bus_addr 
 	    && (addr != prev_addr || size != prev_size || dir != prev_dir)) {
 		/* different from last time -- unmap prev */
-		pci_unmap_single(isa_bridge, bus_addr, prev_size, prev_dir);
+		dma_unmap_single(&isa_bridge->dev, bus_addr, prev_size,
+				 prev_dir);
 		bus_addr = 0;
 	}
 
 	if (!bus_addr)	/* need to map it */
-		bus_addr = pci_map_single(isa_bridge, addr, size, dir);
+		bus_addr = dma_map_single(&isa_bridge->dev, addr, size, dir);
 
 	/* remember this one as prev */
 	prev_addr = addr;
diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 21f9ac101324..e83a02ed5267 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -333,7 +333,7 @@ static dma_addr_t alpha_pci_map_page(struct device *dev, struct page *page,
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	int dac_allowed;
 
-	BUG_ON(dir == PCI_DMA_NONE);
+	BUG_ON(dir == DMA_NONE);
 
 	dac_allowed = pdev ? pci_dac_dma_supported(pdev, pdev->dma_mask) : 0; 
 	return pci_map_single_1(pdev, (char *)page_address(page) + offset, 
@@ -356,7 +356,7 @@ static void alpha_pci_unmap_page(struct device *dev, dma_addr_t dma_addr,
 	struct pci_iommu_arena *arena;
 	long dma_ofs, npages;
 
-	BUG_ON(dir == PCI_DMA_NONE);
+	BUG_ON(dir == DMA_NONE);
 
 	if (dma_addr >= __direct_map_base
 	    && dma_addr < __direct_map_base + __direct_map_size) {
@@ -460,7 +460,7 @@ static void alpha_pci_free_coherent(struct device *dev, size_t size,
 				    unsigned long attrs)
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
-	pci_unmap_single(pdev, dma_addr, size, PCI_DMA_BIDIRECTIONAL);
+	dma_unmap_single(&pdev->dev, dma_addr, size, DMA_BIDIRECTIONAL);
 	free_pages((unsigned long)cpu_addr, get_order(size));
 
 	DBGA2("pci_free_consistent: [%llx,%zx] from %ps\n",
@@ -639,7 +639,7 @@ static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
 	dma_addr_t max_dma;
 	int dac_allowed;
 
-	BUG_ON(dir == PCI_DMA_NONE);
+	BUG_ON(dir == DMA_NONE);
 
 	dac_allowed = dev ? pci_dac_dma_supported(pdev, pdev->dma_mask) : 0;
 
@@ -702,7 +702,7 @@ static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
 	/* Some allocation failed while mapping the scatterlist
 	   entries.  Unmap them now.  */
 	if (out > start)
-		pci_unmap_sg(pdev, start, out - start, dir);
+		dma_unmap_sg(&pdev->dev, start, out - start, dir);
 	return -ENOMEM;
 }
 
@@ -722,7 +722,7 @@ static void alpha_pci_unmap_sg(struct device *dev, struct scatterlist *sg,
 	dma_addr_t max_dma;
 	dma_addr_t fbeg, fend;
 
-	BUG_ON(dir == PCI_DMA_NONE);
+	BUG_ON(dir == DMA_NONE);
 
 	if (! alpha_mv.mv_pci_tbi)
 		return;
-- 
2.32.0

