Return-Path: <linux-alpha+bounces-3485-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHw5Nk316GnaSAIAu9opvQ
	(envelope-from <linux-alpha+bounces-3485-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Wed, 22 Apr 2026 18:20:29 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 587F4448798
	for <lists+linux-alpha@lfdr.de>; Wed, 22 Apr 2026 18:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F258A30492B0
	for <lists+linux-alpha@lfdr.de>; Wed, 22 Apr 2026 16:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908B93603E8;
	Wed, 22 Apr 2026 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9viRKS6"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D12E3264F7;
	Wed, 22 Apr 2026 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776874459; cv=none; b=lKL3vk1z2k7jhexHWlfQYKR5/Flr81MEYuwotSNocEPfH+KrLaWCa5PT4yzV0Puf1tSDBaEskNFJfwwDFr9ZrrD8i8+KB1LbBYoJYJFKKs03ZzWkissGoFX7BYkIfDOr93I+S3aSDJuK7Vxre9tw+kL4ohDt/O9ZkLZ5l34VABk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776874459; c=relaxed/simple;
	bh=O8CncpOJK/HEBS5SYT1UON/nV1bsCDfLQepqxgK+Uww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pfDKkNfuklL//MOtEnAqqWpJd9litdh+yewvYQLyKQbbiDzfZytBwXSdAhf5G70tVpv5gPShRBKGBn/Qh+LBVcmzCry3xAwwI0qiaJoYYmY1QUUhVpWmDF3lnZGrstFhG7JHoHOIR+HoOzlu8z9673FJLiYtQpgrq1mLifk4mYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9viRKS6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E09C2BCB7;
	Wed, 22 Apr 2026 16:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776874459;
	bh=O8CncpOJK/HEBS5SYT1UON/nV1bsCDfLQepqxgK+Uww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k9viRKS6BQTK2BLg0soUC2j+wByHK5EaixTiZUg0Pf15vY5LH7YVo3wMhaxRPz0sa
	 UoZt4y9z/67I7pCDd6LV6JfLgeBc4kMwMsVFOS0wDrTLdpwIDKOUyIvNKQYvmzwvN9
	 HVGck6uprDbL9SUB/Nv8NbQCeQFONGP4SnVrK6st/5Vakhz/miRs7VJgEjxCmi8mX1
	 9Y3P0jhwwWcXhJlBVxBvjQ4jr04kNNX70xO4ckgKTyARp/whyGdLh/ZoXn4Y3SmcB5
	 0pkOWgx/RUa1hAsA2IfXFMEKzDoIHxA0WUotSGR2Ije1bLphywGsrpvgMbZwSmtnIZ
	 hTDVu0RxWsesw==
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
Subject: [PATCH v6 02/24] PCI: Add pci_resource_is_io() and pci_resource_is_mem() helpers
Date: Wed, 22 Apr 2026 16:13:45 +0000
Message-ID: <20260422161407.118748-3-kwilczynski@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260422161407.118748-1-kwilczynski@kernel.org>
References: <20260422161407.118748-1-kwilczynski@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,linux.intel.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3485-lists,linux-alpha=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 587F4448798
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add helpers to check whether a PCI resource is of I/O port or
memory type.  These replace the open-coded pci_resource_flags()
with IORESOURCE_IO and IORESOURCE_MEM pattern used across the
tree.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
---
 include/linux/pci.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1c270f1d5123..05aceb7f1f37 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2295,6 +2295,31 @@ int pci_iobar_pfn(struct pci_dev *pdev, int bar, struct vm_area_struct *vma);
 	CONCATENATE(__pci_dev_for_each_res, COUNT_ARGS(__VA_ARGS__)) 	\
 		    (dev, res, __VA_ARGS__)
 
+/**
+ * pci_resource_is_io - check if a PCI resource is of I/O port type.
+ * @dev: PCI device to check.
+ * @resno: The resource number (BAR index) to check.
+ *
+ * Returns true if the resource type is I/O port.
+ */
+static inline bool pci_resource_is_io(const struct pci_dev *dev, int resno)
+{
+	return resource_type(pci_resource_n(dev, resno)) == IORESOURCE_IO;
+}
+
+/**
+ * pci_resource_is_mem - check if a PCI resource is of memory type.
+ * @dev: PCI device to check.
+ * @resno: The resource number (BAR index) to check.
+ *
+ * Returns true if the resource type is memory, including
+ * prefetchable memory.
+ */
+static inline bool pci_resource_is_mem(const struct pci_dev *dev, int resno)
+{
+	return resource_type(pci_resource_n(dev, resno)) == IORESOURCE_MEM;
+}
+
 /*
  * Similar to the helpers above, these manipulate per-pci_dev
  * driver-specific data.  They are really just a wrapper around
-- 
2.54.0


