Return-Path: <linux-alpha+bounces-3587-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H3TH4Ro/WkMdgAAu9opvQ
	(envelope-from <linux-alpha+bounces-3587-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Fri, 08 May 2026 06:37:24 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB774F1ABE
	for <lists+linux-alpha@lfdr.de>; Fri, 08 May 2026 06:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B75B4302172B
	for <lists+linux-alpha@lfdr.de>; Fri,  8 May 2026 04:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68ACB17A2FC;
	Fri,  8 May 2026 04:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDIZz6JT"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C6115539A;
	Fri,  8 May 2026 04:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778215036; cv=none; b=JtOvs1GvypVCCDWrHNsXu7Vz+eivuWuV0IFgFnc2ojf0rgjwREQr+VjWG4l+Unt0RaE742X0W0k9TVTkDFk8DgRlh/LGm3u79fBYw0mnC9Tj/5wHUe/kOcCOF/WNJ5tt4kHVNbrIW6c1PvHc7M4JfHbOeKX44QLpoFsno4Um1pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778215036; c=relaxed/simple;
	bh=g1Q0Y9xFxmkBFDILfcdAU3XRw5NhqOHXxvlpf+w+W4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yflkpni5iTNoZuYAVY1bZvfiQIOugokzHcDgUpU2zYDST6xnPiXCN3iSy7rsi+Kw5nOFylSX27THex8waBSIkaj8gyNoEFemufWWfb81IvSp5+QRjGaKZo6spq73fY0/QfSWWmttki2u74T3yvci55J6+CuH/YYPx05Y2uz8h4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDIZz6JT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B32C2BCB0;
	Fri,  8 May 2026 04:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778215036;
	bh=g1Q0Y9xFxmkBFDILfcdAU3XRw5NhqOHXxvlpf+w+W4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pDIZz6JT+F50/NoXuF7lFmNqg8Xpq6ar8JHkiL1odWO86N+rOe8JidqrT7wtsIW3t
	 93FSlxaBsR1QokyyJQgywFCxNoHnJN1NdlhT9+bOWnTetGZ0UGfNr2EJYfRxtSa9+7
	 QafCJBekO6SkU2yTq/Ljkct+pzdCfy1y6YRu75s/pcMlmDhnqoynyxXB9EWN3hAlq+
	 ShPRwGhnWD94gNzGH+PKAm0G7/pWojPkWZV7fdHaAbDN0ZvvmcR/LehdvcM5/RxpQY
	 fy+35MGYw1z1BM427XCnE9GzPrIrGwKKUJDZMlUpUYQFHur1LncvYHjphNqfo8qNUB
	 zzg9mYwpDD3dw==
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
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
Subject: [PATCH v7 24/24] PCI/sysfs: Limit BAR resize attribute scope to platforms with PCI mmap
Date: Fri,  8 May 2026 04:35:43 +0000
Message-ID: <20260508043543.217179-25-kwilczynski@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508043543.217179-1-kwilczynski@kernel.org>
References: <20260508043543.217179-1-kwilczynski@kernel.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EFB774F1ABE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,shazbot.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,linux.intel.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3587-lists,linux-alpha=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kwilczynski@kernel.org,linux-alpha@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-alpha];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Currently, __resource_resize_store() uses sysfs_remove_groups()
and sysfs_create_groups() on pci_dev_resource_attr_groups to
tear down and recreate the resourceN files after a BAR resize,
so the updated BAR sizes are visible in sysfs.

The resourceN files only exist on platforms that define
HAVE_PCI_MMAP or ARCH_GENERIC_PCI_MMAP_RESOURCE.  On platforms
that define neither, pci_dev_resource_attr_groups is NULL and
the sysfs_remove_groups() and sysfs_create_groups() calls in
__resource_resize_store() become no-ops.

Resizable BAR (ReBAR) is a PCI Express extended capability
(PCI_EXT_CAP_ID_REBAR) that requires PCIe extended config
space.  Every PCIe-capable architecture defines HAVE_PCI_MMAP
or ARCH_GENERIC_PCI_MMAP_RESOURCE (via arch headers or the
asm-generic/pci.h fallback).  Architectures without either
only support conventional PCI and cannot have any ReBAR-capable
devices.

Thus, move the resize show and store helpers, the per-BAR attribute
definitions, and the attribute group behind the existing #ifdef
HAVE_PCI_MMAP || ARCH_GENERIC_PCI_MMAP_RESOURCE guard, and fold the
group reference in pci_dev_groups[] into the existing #if block.

Tested-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
---
 drivers/pci/pci-sysfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index f5427bcfb0cc..6099371f67e7 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1661,6 +1661,7 @@ static const struct attribute_group pci_dev_reset_method_attr_group = {
 	.is_visible = pci_dev_reset_attr_is_visible,
 };
 
+#if defined(HAVE_PCI_MMAP) || defined(ARCH_GENERIC_PCI_MMAP_RESOURCE)
 static ssize_t __resource_resize_show(struct device *dev, int n, char *buf)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
@@ -1775,6 +1776,7 @@ static const struct attribute_group pci_dev_resource_resize_attr_group = {
 	.attrs = resource_resize_attrs,
 	.is_visible = resource_resize_attr_is_visible,
 };
+#endif
 
 static struct attribute *pci_dev_dev_attrs[] = {
 	&dev_attr_boot_vga.attr,
@@ -1849,8 +1851,8 @@ const struct attribute_group *pci_dev_groups[] = {
 	&pci_dev_resource_io_attr_group,
 	&pci_dev_resource_uc_attr_group,
 	&pci_dev_resource_wc_attr_group,
-#endif
 	&pci_dev_resource_resize_attr_group,
+#endif
 	&pci_dev_config_attr_group,
 	&pci_dev_rom_attr_group,
 	&pci_dev_reset_attr_group,
-- 
2.54.0


