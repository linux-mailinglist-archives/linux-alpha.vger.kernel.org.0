Return-Path: <linux-alpha+bounces-3385-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFWDNyUA2mnxxggAu9opvQ
	(envelope-from <linux-alpha+bounces-3385-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 10:02:45 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9884B3DECC5
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 10:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E4B13031B33
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 08:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D6923C8C7;
	Sat, 11 Apr 2026 08:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQCKsrLR"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865DE1C5D7D;
	Sat, 11 Apr 2026 08:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775894562; cv=none; b=S8o3CRDUeoACm1Aqh7n+FvyeYe/FXzFz/VagSWTpmIe3co1IMzx9O49ADAijpNfqhoCdLPCiX3LsElKYNT9Iqzex6HqnEWhWqqTWYa8jQu2y5F171VVzc4I3UcpycAGSmclpk0tGAj70uip8vBhDVTRQO61SSpOxlF2m+xsTfIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775894562; c=relaxed/simple;
	bh=kjKATkMwwBWbUVCzi5pJZe7y0tUywHculflz6sXXOSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fjhCkG8beP73NKT21wPRxuPmXavp38CEnjvZfCtkBTR2ovsBFQGfNMMqMhk8WNrAaW3xFaznjIluidx+VHNlUHG+iwvR6fke/QwCDw00IkHE4cvqdqrEtKoSz/y4LX96DBaukDk2VMauQZYHh57TgvuVm0FgWlXg0dB15bEyFO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQCKsrLR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5FAC19425;
	Sat, 11 Apr 2026 08:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775894562;
	bh=kjKATkMwwBWbUVCzi5pJZe7y0tUywHculflz6sXXOSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZQCKsrLRkN12ZbR9aGp2kKcZGxvt4/l5tWCBRwAh2B1eRIMB7FVeK0bf6EmGuhXX0
	 mmik6M6SR717IuW0RdFd2VBrCNbz8+YrSXrJDTSp47zSsONrNPCW7fBUbHhtpigIyI
	 v9zgzAAZYXB6hCeDZ9f9sf75a6khYrB3SD+nW7Oj2XWtZ2kBUj5ZKxhS2y+P4kUkm7
	 p917fcsouobfBSBjIqF/zM0ZXfr/j0rtnXR2KAduqvdnO9E7E2BILFU2kQuL0utfnN
	 vaY2fsDC6QMUctK+k/4PNkXc3ewmn/z1zg7dCYXF/uo4xlv6TdImKVObZGSyJDJzTI
	 rhwsblmw2MaCg==
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
Subject: [PATCH v4 14/24] alpha/PCI: Clean up pci_mmap_resource()
Date: Sat, 11 Apr 2026 08:01:38 +0000
Message-ID: <20260411080148.471335-15-kwilczynski@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,linux.intel.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3385-lists,linux-alpha=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9884B3DECC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace open-coded res->flags type checks with new pci_resource_is_mem()
and pci_resource_start() helpers.  Move the pci_resource_n() call into
pcibios_resource_to_bus() and drop the local struct resource pointer.

Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
---
 arch/alpha/kernel/pci-sysfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.c
index 7aac5e76dcd6..6c011dab326d 100644
--- a/arch/alpha/kernel/pci-sysfs.c
+++ b/arch/alpha/kernel/pci-sysfs.c
@@ -70,7 +70,6 @@ static int pci_mmap_resource(struct kobject *kobj,
 {
 	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
 	int barno = (unsigned long)attr->private;
-	struct resource *res = pci_resource_n(pdev, barno);
 	enum pci_mmap_state mmap_type;
 	struct pci_bus_region bar;
 	int ret;
@@ -79,15 +78,16 @@ static int pci_mmap_resource(struct kobject *kobj,
 	if (ret)
 		return ret;
 
-	if ((res->flags & IORESOURCE_MEM) && iomem_is_exclusive(res->start))
+	if (pci_resource_is_mem(pdev, barno) &&
+	    iomem_is_exclusive(pci_resource_start(pdev, barno)))
 		return -EINVAL;
 
 	if (!__pci_mmap_fits(pdev, barno, vma, sparse))
 		return -EINVAL;
 
-	pcibios_resource_to_bus(pdev->bus, &bar, res);
+	pcibios_resource_to_bus(pdev->bus, &bar, pci_resource_n(pdev, barno));
 	vma->vm_pgoff += bar.start >> (PAGE_SHIFT - (sparse ? 5 : 0));
-	mmap_type = res->flags & IORESOURCE_MEM ? pci_mmap_mem : pci_mmap_io;
+	mmap_type = pci_resource_is_mem(pdev, barno) ? pci_mmap_mem : pci_mmap_io;
 
 	return hose_mmap_page_range(pdev->sysdata, vma, mmap_type, sparse);
 }
-- 
2.53.0


