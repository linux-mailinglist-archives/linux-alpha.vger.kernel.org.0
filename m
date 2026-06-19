Return-Path: <linux-alpha+bounces-3689-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IGxWOqEDNWofmAYAu9opvQ
	(envelope-from <linux-alpha+bounces-3689-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Fri, 19 Jun 2026 10:53:53 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCDE6A4C53
	for <lists+linux-alpha@lfdr.de>; Fri, 19 Jun 2026 10:53:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nR9gEhQz;
	spf=pass (mail.lfdr.de: domain of "linux-alpha+bounces-3689-lists+linux-alpha=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-alpha+bounces-3689-lists+linux-alpha=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59E2C302794D
	for <lists+linux-alpha@lfdr.de>; Fri, 19 Jun 2026 08:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC4B332610;
	Fri, 19 Jun 2026 08:53:15 +0000 (UTC)
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5977131B80D;
	Fri, 19 Jun 2026 08:53:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781859195; cv=none; b=BEuqAXKo+IXi4NsMx/SB+D9TF3NbaZGOWjccCGiiR3m8yZcwlHgic+DBzih2P8e2Ty0A9Uq5I+HCm5Albq1ixEuIdALvDhm8CO3pX+q9f0aDeuUlyIf85dYB+8k5F6OiCNvLVYNqewxNMgBEsHD1y+Q0kzYb/9IJ2CWUa0X5kNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781859195; c=relaxed/simple;
	bh=liUo6UFeNd3e4lQPV4f1+4c+J0RRF2ZSA+DHUFe4Bn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BQe/agOT7FibIU9aWSnosrCXYWGja1wHUpmYPHUVrz16ZAKlRHhoaTxDDipI13SaCSMh5meOAV/1YhzbB6u6UG6Pdxb5um3z/xCZHXkP3u9SAO1hB7lYyzok7muRsEOf6qU3qwxQGUgESwfaDYKQ5V0q8pkRtx1j5uFZH6Dd8pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nR9gEhQz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2551F000E9;
	Fri, 19 Jun 2026 08:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781859194;
	bh=sskwaIOGPPfHiPAa1LaAJ6GSlFNS8/PzCMP/8IQx/ww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nR9gEhQzp2n4Yl8O4T7jOS4nEYX9Ls/GLG1h/NNfPGQ3Wb/nIoPOmFEhE7BO+u4GQ
	 VHTAVC+AISgQC5lf7CrjHy12rLtHLBBKl3xkkHPwWiAkhjNwNgt9MkJ1i4GhpDJkSg
	 fr9cRJ3IdR5WNJXJ2oHfNXlbeDggRMCvlDgidbJKNg657WDFHOLk2VnllTRRiRuyqM
	 Q7Tcd5Sz1kkwRLZAdgcSS4MGvhmDwPQy8XHeswRSK7SOeqeFBHUDeIhq+zzFDI0WKD
	 GCrlkoY/KEasAL3Qpt6zTN0Df+PLFBrPLvZzPbC9/9vrRQ1myMKVyYNmy0srSmHV1n
	 TULMO9rJNXnkA==
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
Subject: [PATCH v8 19/25] PCI: Add macros for legacy I/O and memory address space sizes
Date: Fri, 19 Jun 2026 08:51:54 +0000
Message-ID: <20260619085200.3729431-20-kwilczynski@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-3689-lists,linux-alpha=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DCDE6A4C53

Add defines for the standard PCI legacy address space sizes,
replacing the raw literals used by the legacy sysfs attributes.

Then, replace open-coded values with the newly added macros.

No functional changes intended.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Tested-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
---
 drivers/pci/pci-sysfs.c | 4 ++--
 include/linux/pci.h     | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 9d1378700c3a..b8986a735a46 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1019,7 +1019,7 @@ void pci_create_legacy_files(struct pci_bus *b)
 
 	sysfs_bin_attr_init(b->legacy_io);
 	b->legacy_io->attr.name = "legacy_io";
-	b->legacy_io->size = 0xffff;
+	b->legacy_io->size = PCI_LEGACY_IO_SIZE;
 	b->legacy_io->attr.mode = 0600;
 	b->legacy_io->read = pci_read_legacy_io;
 	b->legacy_io->write = pci_write_legacy_io;
@@ -1036,7 +1036,7 @@ void pci_create_legacy_files(struct pci_bus *b)
 	b->legacy_mem = b->legacy_io + 1;
 	sysfs_bin_attr_init(b->legacy_mem);
 	b->legacy_mem->attr.name = "legacy_mem";
-	b->legacy_mem->size = 1024*1024;
+	b->legacy_mem->size = PCI_LEGACY_MEM_SIZE;
 	b->legacy_mem->attr.mode = 0600;
 	b->legacy_mem->mmap = pci_mmap_legacy_mem;
 	/* See pci_create_attr() for motivation */
diff --git a/include/linux/pci.h b/include/linux/pci.h
index c56f2cf0d2ab..e37677a8dd3c 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -27,6 +27,7 @@
 #include <linux/mod_devicetable.h>
 
 #include <linux/types.h>
+#include <linux/sizes.h>
 #include <linux/init.h>
 #include <linux/ioport.h>
 #include <linux/list.h>
@@ -1169,6 +1170,10 @@ enum {
 /* These external functions are only available when PCI support is enabled */
 #ifdef CONFIG_PCI
 
+/* PCI legacy I/O port and memory address space sizes. */
+#define PCI_LEGACY_IO_SIZE	(SZ_64K - 1)
+#define PCI_LEGACY_MEM_SIZE	SZ_1M
+
 extern unsigned int pci_flags;
 
 static inline void pci_set_flags(int flags) { pci_flags = flags; }
-- 
2.54.0


