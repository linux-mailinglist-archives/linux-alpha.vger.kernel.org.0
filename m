Return-Path: <linux-alpha+bounces-3372-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLl+M/3/2WnxxggAu9opvQ
	(envelope-from <linux-alpha+bounces-3372-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 10:02:05 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9373DEBF7
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 10:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D70AA300F788
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 08:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803C7221F39;
	Sat, 11 Apr 2026 08:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLLnRsUt"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAA51C5D7D;
	Sat, 11 Apr 2026 08:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775894517; cv=none; b=lrmjCOkx3QmtM00NhkononOtSVlONuTyjWWfLAcff4U2OAXMexm2PwrG6THH/W6jEtM7jLCSSa2Dm1YCt0BPZIO/cgXaF2wzCYver9RFfUbRDS1X4KI15zCgfXgcWepVdcWplVV3F7p46KIwKFyewrneALRpDkIosIv5lAeXa7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775894517; c=relaxed/simple;
	bh=+MngKbk4Fu+hXvrF1jLsdL88/ySXVmeG1h0/A7xlETY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sUsegP7MtrRUWdUtr7HQ43NYE+1fY3qG4wGNvH2xC4P6LPOtYjKXwlz3eJlSml4w7aFgmbBeEqCL0YQ2LRT8nO/M56CFbF0cGvGXeuF4R/09xU7/YOLdDqIVxpsXVMcsclj+vFbt8Ph0cVIM3Ksbi8Fs+cYhN6IKW2Yp6RdjUSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLLnRsUt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E34C2BCAF;
	Sat, 11 Apr 2026 08:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775894517;
	bh=+MngKbk4Fu+hXvrF1jLsdL88/ySXVmeG1h0/A7xlETY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hLLnRsUtQdKBkr1E2YTD83+aGN/yU3sxh89srqSUF183NKPL7XfwGw+IVBr4nUBUX
	 +Dcef6LNrtVh1IPdd3gFxoHsg/uJleINXHd2XYrzl/FmnTsbCqLmAznhXMtQHRkZ1I
	 vWtGvGBedKLo3hvRGKyC8ftroH/60ibIDAn6LGpQgWxLCwDKRra18hs5vZiydO+pFP
	 J+1ciusoXTGgsA7gCl2lzCPcTFn19DTxVEOInmTkKR01D93GQBGhGNtvOPwdehn5Xv
	 j/n2z8rJ0715aFfbqpruhJIfhBvfkglWcs9lMsF9R+26HbLAkIFR7o6P6YpkpDHFLh
	 8R6PHqxG6Bh3A==
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Christophe Leroy <chleroy@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Dexuan Cui <decui@microsoft.com>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Lukas Wunner <lukas@wunner.de>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Saurabh Singh Sengar <ssengar@microsoft.com>,
	Shuan He <heshuan@bytedance.com>,
	Srivatsa Bhat <srivatsabhat@microsoft.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-pci@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 01/24] PCI/sysfs: Use PCI resource accessor macros
Date: Sat, 11 Apr 2026 08:01:25 +0000
Message-ID: <20260411080148.471335-2-kwilczynski@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411080148.471335-1-kwilczynski@kernel.org>
References: <20260411080148.471335-1-kwilczynski@kernel.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,linux.intel.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3372-lists,linux-alpha=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kwilczynski@kernel.org,linux-alpha@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-alpha];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 0F9373DEBF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace direct pdev->resource[] accesses with pci_resource_n(),
and pdev->resource[].flags accesses with pci_resource_flags().

No functional changes intended.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
---
 drivers/pci/pci-sysfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 16eaaf749ba9..ad3c17f86c7f 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -177,7 +177,7 @@ static ssize_t resource_show(struct device *dev, struct device_attribute *attr,
 		max = PCI_BRIDGE_RESOURCES;
 
 	for (i = 0; i < max; i++) {
-		struct resource *res =  &pci_dev->resource[i];
+		struct resource *res = pci_resource_n(pci_dev, i);
 		struct resource zerores = {};
 
 		/* For backwards compatibility */
@@ -715,7 +715,7 @@ static ssize_t boot_vga_show(struct device *dev, struct device_attribute *attr,
 		return sysfs_emit(buf, "%u\n", (pdev == vga_dev));
 
 	return sysfs_emit(buf, "%u\n",
-			  !!(pdev->resource[PCI_ROM_RESOURCE].flags &
+			  !!(pci_resource_flags(pdev, PCI_ROM_RESOURCE) &
 			     IORESOURCE_ROM_SHADOW));
 }
 static DEVICE_ATTR_RO(boot_vga);
@@ -1108,7 +1108,7 @@ static int pci_mmap_resource(struct kobject *kobj, const struct bin_attribute *a
 	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
 	int bar = (unsigned long)attr->private;
 	enum pci_mmap_state mmap_type;
-	struct resource *res = &pdev->resource[bar];
+	struct resource *res = pci_resource_n(pdev, bar);
 	int ret;
 
 	ret = security_locked_down(LOCKDOWN_PCI_ACCESS);
@@ -1312,7 +1312,7 @@ static int pci_create_resource_files(struct pci_dev *pdev)
 		retval = pci_create_attr(pdev, i, 0);
 		/* for prefetchable resources, create a WC mappable file */
 		if (!retval && arch_can_pci_mmap_wc() &&
-		    pdev->resource[i].flags & IORESOURCE_PREFETCH)
+		    pci_resource_flags(pdev, i) & IORESOURCE_PREFETCH)
 			retval = pci_create_attr(pdev, i, 1);
 		if (retval) {
 			pci_remove_resource_files(pdev);
-- 
2.53.0


