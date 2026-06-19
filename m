Return-Path: <linux-alpha+bounces-3695-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xXDCN7YDNWormAYAu9opvQ
	(envelope-from <linux-alpha+bounces-3695-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Fri, 19 Jun 2026 10:54:14 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAB06A4C84
	for <lists+linux-alpha@lfdr.de>; Fri, 19 Jun 2026 10:54:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YR7iqatK;
	spf=pass (mail.lfdr.de: domain of "linux-alpha+bounces-3695-lists+linux-alpha=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-alpha+bounces-3695-lists+linux-alpha=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41DDB30425BE
	for <lists+linux-alpha@lfdr.de>; Fri, 19 Jun 2026 08:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2E831B80D;
	Fri, 19 Jun 2026 08:53:36 +0000 (UTC)
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF8D18FDBD;
	Fri, 19 Jun 2026 08:53:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781859216; cv=none; b=qexNWqowKFConPlmWUP2sigMbhqzBhre/Fbom4/gJ9f58eM9LG3D1uGGwqSWlicRDSuK0PYBgU1cqocrb+sgYc92vUd8hPqsFkdXmw/lMVrnZ+fhXG0LEUPSbLlOcQZm5IQ//FcXG4JFU182+C6Dowcok5ca7pZTUqAoOK/Qzyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781859216; c=relaxed/simple;
	bh=q6eh3YWRlj4SdW0vT1gEKkpxB8oWR43EJ8X/XthYkE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ohTBDMsbjcPvswB+YrZHYxzTfGEP+OD5jYfiXeUexUGPFjkZ8jHjgrYaZ5EsgyBXulJ1i5RwlLDin86YZyDek/FM26G7hBVJOnFpaSBBvcu7/syZUK4f5q1iSlzGEONpzdjJHIZ1Wyrrs0SS/Ka9oYXEq+VWdL3oK18GmgjCDYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YR7iqatK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769F91F00A3D;
	Fri, 19 Jun 2026 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781859215;
	bh=AEt6yMxt+anDbS/xfw6iqNjqi9OlzbWZj7cBi3ZQBhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YR7iqatK+cx4aYp6j5tWzOuzMZJB0txouHE9bTlGvW0HPY4heYYHga1kXZ+YKjyNP
	 E7drzIXDvtVBCjndnrWFcqc/Wm40uJZIQOAK6xmt3w4hUzhltEhe/Njp7N2adLkil0
	 R32L5Yb0XO1sc7o9DyAn5dyfGuEwSbnqWwHcoOvVyLGGUJbaSel6ORZ2AO6UcopuFh
	 nrLgGV2fNEIUp8e2ivUkR+UZFJc3CLuoujqPHdS16JN4QE+Wy9i1+ilgQPP/BhV5Ja
	 kVk4zoH1apiKNPSTe1xDDOn8t0pp9RbSfDCNw9pJBTcTn6aMFMXb+2To7gxOTpRdoQ
	 CNUEKwaiwjAGg==
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
Subject: [PATCH v8 25/25] PCI/sysfs: Limit BAR resize attribute scope to platforms with PCI mmap
Date: Fri, 19 Jun 2026 08:52:00 +0000
Message-ID: <20260619085200.3729431-26-kwilczynski@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619085200.3729431-1-kwilczynski@kernel.org>
References: <20260619085200.3729431-1-kwilczynski@kernel.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:helgaas@kernel.org,m:mani@kernel.org,m:lpieralisi@kernel.org,m:alex@shazbot.org,m:linmag7@gmail.com,m:mattst88@gmail.com,m:richard.henderson@linaro.org,m:chleroy@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:decui@microsoft.com,m:khalasa@piap.pl,m:lukas@wunner.de,m:oohall@gmail.com,m:ssengar@microsoft.com,m:heshuan@bytedance.com,m:srivatsabhat@microsoft.com,m:ilpo.jarvinen@linux.intel.com,m:linux-pci@vger.kernel.org,m:linux-alpha@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[kwilczynski@kernel.org,linux-alpha@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-3695-lists,linux-alpha=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kwilczynski@kernel.org,linux-alpha@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,shazbot.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,linux.intel.com,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-alpha];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FAB06A4C84

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
index dd87b83ba3a9..4216ed520d41 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1652,6 +1652,7 @@ static const struct attribute_group pci_dev_reset_method_attr_group = {
 	.is_visible = pci_dev_reset_attr_is_visible,
 };
 
+#if defined(HAVE_PCI_MMAP) || defined(ARCH_GENERIC_PCI_MMAP_RESOURCE)
 static ssize_t __resource_resize_show(struct device *dev, int n, char *buf)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
@@ -1766,6 +1767,7 @@ static const struct attribute_group pci_dev_resource_resize_attr_group = {
 	.attrs = resource_resize_attrs,
 	.is_visible = resource_resize_attr_is_visible,
 };
+#endif
 
 static struct attribute *pci_dev_dev_attrs[] = {
 	&dev_attr_boot_vga.attr,
@@ -1840,8 +1842,8 @@ const struct attribute_group *pci_dev_groups[] = {
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


