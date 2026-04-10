Return-Path: <linux-alpha+bounces-3298-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GkPKd6P2GksfQgAu9opvQ
	(envelope-from <linux-alpha+bounces-3298-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 07:51:26 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC003D2668
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 07:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B3B313004F15
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 05:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD0A3264DC;
	Fri, 10 Apr 2026 05:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhcFm+T1"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72B130F52A;
	Fri, 10 Apr 2026 05:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775800284; cv=none; b=XG2dCJDqM8xne98IOzM/5E5hVf1QEEEswIYcV7J+z81Cv4qMoNPW+7zTh/lO9Cg/KDwr3bYc7Q+3abACOYtfF6dKCVh3sZ3ufkej1XSD5PCzfH4skjrTHr0mqKxiY+sxkoBQRcyD8ma8CTivG6XGsb9++f+JNSKb/aOGs50HgwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775800284; c=relaxed/simple;
	bh=4+W1kd8ovvTGg2a+x1mXoEZZdmh6JcYJxVFeZ3Yu0xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I/SDcrqIYo0uEM4iyVtvA4MkLhESQx7vyfFT7rNac9atDfYEk3M0JX4BiT8WqBGbBa0UX/fl6dci/1pHF2eSOtaFV6mobmoZuQbaHOaUorsb3ozaRZZq7W0l0QKsya8E5vbrNjmDH5vC+Pd4P8vdFjOzCxWfqqGOEObvxU3+IGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhcFm+T1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D21C2BCAF;
	Fri, 10 Apr 2026 05:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775800284;
	bh=4+W1kd8ovvTGg2a+x1mXoEZZdmh6JcYJxVFeZ3Yu0xQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fhcFm+T12KNVqPEsauDmvNs2LgfnB15yjv07PjZoD5L2qgLCuSm8jS2fqKePwfwyl
	 hUr7/un8ohQP2ZqR45z2sokFDVsaSUbSep87bcyWUnDxZHhSLTGP+q+Nty/zI7NEK+
	 i4ss+3NC2srWor8vOMhDUWRTO9EbgSmHxOIc4gIl5C7rb2u9ttihS4qC3G6lEIkqqZ
	 Pu6GtV96b1n3g3IeugY30bB6IJ8PYeXYTvADqUCjuaw0APrUOgMkGPJU7lE+ELXzhx
	 O3DjB98247UHP3RjJNj9CLtkTNsRqiQXVuowSaLVR1XfNIFPlZ2ZLY5JMac9O3gxMs
	 JIwZVi+YpY0Ag==
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
Subject: [PATCH 11/20] alpha/PCI: Use BAR index in sysfs attr->private instead of resource pointer
Date: Fri, 10 Apr 2026 05:50:31 +0000
Message-ID: <20260410055040.39233-12-kwilczynski@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410055040.39233-1-kwilczynski@kernel.org>
References: <20260410055040.39233-1-kwilczynski@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,linux.intel.com,vger.kernel.org,lists.ozlabs.org];
	URIBL_MULTI_FAIL(0.00)[sto.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-3298-lists,linux-alpha=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kwilczynski@kernel.org,linux-alpha@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-alpha];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4CC003D2668
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, Alpha's pci_create_one_attr() stores a resource pointer in
attr->private, and pci_mmap_resource() loops through all BARs to find
the matching index.

Thus, store the BAR index directly in attr->private and retrieve the
resource via pci_resource_n().  This eliminates the loop and aligns
with the convention used by the generic PCI sysfs code.

While at it, add parentheses around the bitwise flag test in
pci_mmap_resource() to make the precedence explicit, and to
match the preferred style.

The PCI core change was first added in the commit dca40b186b75 ("PCI:
Use BAR index in sysfs attr->private instead of resource pointer").

Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
---
 arch/alpha/kernel/pci-sysfs.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.c
index 2324720c3e83..c84867ce31f5 100644
--- a/arch/alpha/kernel/pci-sysfs.c
+++ b/arch/alpha/kernel/pci-sysfs.c
@@ -69,25 +69,20 @@ static int pci_mmap_resource(struct kobject *kobj,
 			     struct vm_area_struct *vma, int sparse)
 {
 	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
-	struct resource *res = attr->private;
+	int barno = (unsigned long)attr->private;
+	struct resource *res = pci_resource_n(pdev, barno);
 	enum pci_mmap_state mmap_type;
 	struct pci_bus_region bar;
-	int i, ret;
+	int ret;
 
 	ret = security_locked_down(LOCKDOWN_PCI_ACCESS);
 	if (ret)
 		return ret;
 
-	for (i = 0; i < PCI_STD_NUM_BARS; i++)
-		if (res == &pdev->resource[i])
-			break;
-	if (i >= PCI_STD_NUM_BARS)
-		return -ENODEV;
-
-	if (res->flags & IORESOURCE_MEM && iomem_is_exclusive(res->start))
+	if ((res->flags & IORESOURCE_MEM) && iomem_is_exclusive(res->start))
 		return -EINVAL;
 
-	if (!__pci_mmap_fits(pdev, i, vma, sparse))
+	if (!__pci_mmap_fits(pdev, barno, vma, sparse))
 		return -EINVAL;
 
 	pcibios_resource_to_bus(pdev->bus, &bar, res);
@@ -170,7 +165,7 @@ static int pci_create_one_attr(struct pci_dev *pdev, int num, char *name,
 	res_attr->attr.name = name;
 	res_attr->attr.mode = S_IRUSR | S_IWUSR;
 	res_attr->size = sparse ? size << 5 : size;
-	res_attr->private = &pdev->resource[num];
+	res_attr->private = (void *)(unsigned long)num;
 	return sysfs_create_bin_file(&pdev->dev.kobj, res_attr);
 }
 
-- 
2.53.0


