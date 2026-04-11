Return-Path: <linux-alpha+bounces-3386-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OqJJykA2mnxxggAu9opvQ
	(envelope-from <linux-alpha+bounces-3386-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 10:02:49 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF943DECE4
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 10:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61C053041D51
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 08:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3084723C8C7;
	Sat, 11 Apr 2026 08:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URmQWa3q"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEB11C5D7D;
	Sat, 11 Apr 2026 08:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775894566; cv=none; b=E4jkltX170RMPvoACBiSGDzA3R7gYI7UXNhKyauP3qownYHa72VTJ43wmmj1Mzg4NnSXYLeL/0DUtZt4RJkbvf6CLZLCrHIF8b9iMSTNWyBSr6fZYQbYC0jIrAZ6dQOGWdFVpsFKS6XtDa/IX7+IqjGsY9EQEoYOlySgeMgM/V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775894566; c=relaxed/simple;
	bh=DXESaPnzd7c3JQ2Cj6QdfGEnPi+ZFUUE0vNpiijc+CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RrZZYzCF2cm57lKQuRKUQoHCqUSgTbz6LFk7dY/amY2E5kE1gabnd6T0O2D+pwlNPQ5ur8JHxc9ub+JbL5H80fi+LOwzcLksGHj12V33Rvw+FumS6LVaZ04qvhNImwpiy/K9r82bGz19uT/xQU6w7kKsYDRCNn9kHoQNQy4hanc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URmQWa3q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9153C2BC9E;
	Sat, 11 Apr 2026 08:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775894565;
	bh=DXESaPnzd7c3JQ2Cj6QdfGEnPi+ZFUUE0vNpiijc+CQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=URmQWa3q2QkaBIhjekHwjkIQ6ygmAcCk5P7N+qFY0DtVxyE4GgfwvJ3JEPbkiTZo0
	 OTIcElHxkmygEAmNHNZNqL58DBxmbgmSiRDcnnK9pATkqoFX11xo6/LTtY16Azxdck
	 nPSw8oAsZf1/hN1NkW8rubQCLJH3CBftLKXXREIbbTKUVKN5BEOi94irqitjc/w6+d
	 pRY5BdvzfBn/a8vSMcBxYI32ElWedqiNvwXzpJ8C7HHpOzIkl2ONIBwgq1Tzoex5y/
	 3YyA+tPjvODPYccpayyfAriUwS/JE8X9pyCPNvMWzzI43+Mq4+tzaFzDNiUcCnyjw1
	 xdZXqbiut/HmA==
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
Subject: [PATCH v4 15/24] alpha/PCI: Fix __pci_mmap_fits() overflow for zero-length BARs
Date: Sat, 11 Apr 2026 08:01:39 +0000
Message-ID: <20260411080148.471335-16-kwilczynski@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,linux.intel.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3386-lists,linux-alpha=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3AF943DECE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, __pci_mmap_fits() computes the BAR size using
pci_resource_len() - 1, which wraps to a large value when the
BAR length is zero, causing the bounds check to incorrectly
succeed.

Thus, add an early return for empty resources.

Fixes: 10a0ef39fbd1 ("PCI/alpha: pci sysfs resources")
Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
---
 arch/alpha/kernel/pci-sysfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.c
index 6c011dab326d..2748000a7486 100644
--- a/arch/alpha/kernel/pci-sysfs.c
+++ b/arch/alpha/kernel/pci-sysfs.c
@@ -37,12 +37,16 @@ static int hose_mmap_page_range(struct pci_controller *hose,
 static int __pci_mmap_fits(struct pci_dev *pdev, int num,
 			   struct vm_area_struct *vma, int sparse)
 {
+	resource_size_t len = pci_resource_len(pdev, num);
 	unsigned long nr, start, size;
 	int shift = sparse ? 5 : 0;
 
+	if (!len)
+		return 0;
+
 	nr = vma_pages(vma);
 	start = vma->vm_pgoff;
-	size = ((pci_resource_len(pdev, num) - 1) >> (PAGE_SHIFT - shift)) + 1;
+	size = ((len - 1) >> (PAGE_SHIFT - shift)) + 1;
 
 	if (start < size && size - start >= nr)
 		return 1;
-- 
2.53.0


