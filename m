Return-Path: <linux-alpha+bounces-3384-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBszLSAA2mnxxggAu9opvQ
	(envelope-from <linux-alpha+bounces-3384-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 10:02:40 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7DE3DECA7
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 10:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A588930217DC
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 08:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D4D13D8B1;
	Sat, 11 Apr 2026 08:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6OIcRmo"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BE328FFF6;
	Sat, 11 Apr 2026 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775894559; cv=none; b=WpsiCN87gfA5KlMb4n2HMRUhLIU0TNTHqCMTbrYH9vCmYqLf1Ek8FmaYHMhvbGgF8GxcT+UyVYkGBbXf8j/OKFQD4YB2r9u7E+Rj3yaBcDWdcFD/lHdesBuARB/3a124sBjIhpCzEw9Hc5OVRVrGKWR8UbPofJ5bFNNLT7v0VDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775894559; c=relaxed/simple;
	bh=Df1aBfnuunD1kkINpPJqSY9nS+M/yRuSpoem5jvpmGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HgTTeoP5KyLoq8L38oGJnOgt3hTHyqqIblUKKunQPGuYBKMPjMnX7R6SeRdaJcdU+9W66Ld8XcTfdQ0nFWFL/+X5hoJAua4MfYQqaiSCX8MZf63m/MajhCK06bj+r/b2UWkIImAYpV3MyNa2itVFtbgmB7+Jesop+4Hi02dMCbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6OIcRmo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E828C2BCB0;
	Sat, 11 Apr 2026 08:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775894558;
	bh=Df1aBfnuunD1kkINpPJqSY9nS+M/yRuSpoem5jvpmGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L6OIcRmokA9ihUuAHXOh6gSaDU7BSbARKEEI8Nj6N3HPK5UN3o4/RZoQbh6NiEzxR
	 veDDOaUEW8sfmwuf9xuFlfKjMs/eInLOGBK+eadSEsh6IfZPCLhDq0PfypnTBlgDSi
	 UqE/2qJDynL5FjpNwTrG1MeUHffg5tHZel3ThsX8axBJwpURwcNsgKgZSbjuD9rLJ1
	 MjMMEXZduzVbvoM7sH3Th/zO/NAq6AA9dvsKeBb5q3CvdLakAi0Foozym6Glr5pDtN
	 +UJAhy/sFruPglch/gIlRac9h8gb3h1tqGUWAGMmmLbBaKW1btnNyf5VMuwKVKFuEb
	 LORCX/crRf4sA==
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
Subject: [PATCH v4 13/24] alpha/PCI: Use PCI resource accessor macros
Date: Sat, 11 Apr 2026 08:01:37 +0000
Message-ID: <20260411080148.471335-14-kwilczynski@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,linux.intel.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3384-lists,linux-alpha=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7B7DE3DECA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace direct pdev->resource[] accesses with pci_resource_n(),
and pdev->resource[].flags accesses with pci_resource_flags().

No functional changes intended.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
---
 arch/alpha/kernel/pci-sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.c
index c84867ce31f5..7aac5e76dcd6 100644
--- a/arch/alpha/kernel/pci-sysfs.c
+++ b/arch/alpha/kernel/pci-sysfs.c
@@ -141,7 +141,7 @@ static int sparse_mem_mmap_fits(struct pci_dev *pdev, int num)
 	long dense_offset;
 	unsigned long sparse_size;
 
-	pcibios_resource_to_bus(pdev->bus, &bar, &pdev->resource[num]);
+	pcibios_resource_to_bus(pdev->bus, &bar, pci_resource_n(pdev, num));
 
 	/* All core logic chips have 4G sparse address space, except
 	   CIA which has 16G (see xxx_SPARSE_MEM and xxx_DENSE_MEM
@@ -181,7 +181,7 @@ static int pci_create_attr(struct pci_dev *pdev, int num)
 	suffix = "";	/* Assume bwx machine, normal resourceN files. */
 	nlen1 = 10;
 
-	if (pdev->resource[num].flags & IORESOURCE_MEM) {
+	if (pci_resource_flags(pdev, num) & IORESOURCE_MEM) {
 		sparse_base = hose->sparse_mem_base;
 		dense_base = hose->dense_mem_base;
 		if (sparse_base && !sparse_mem_mmap_fits(pdev, num)) {
-- 
2.53.0


