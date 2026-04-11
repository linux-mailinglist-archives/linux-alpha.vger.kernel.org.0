Return-Path: <linux-alpha+bounces-3374-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBNQBQAA2mnxxggAu9opvQ
	(envelope-from <linux-alpha+bounces-3374-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 10:02:08 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF36C3DEC06
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 10:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0C4A3034EEB
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 08:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E857221F39;
	Sat, 11 Apr 2026 08:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0dNidQj"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDAD13D8B1;
	Sat, 11 Apr 2026 08:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775894524; cv=none; b=KzEwPHuH5SWCF8WPlg/8aEv9om4YO0mDRpzvW5phHKbtLQZyXIlUkL+ZLy5l0tM0c0x/stbjrqEQ6Ro39CHO8BxHkQxWse/r0c2CaKXt2rCOvEhlbYkEaz5mAGqimcftjwzpWmjUuMloCderxN4CORDQM+HGtouL7GUUVu/2sRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775894524; c=relaxed/simple;
	bh=gvdpAvTWcmWTQ2Jvb4VCkVuJk3Ar+NokzIsq3HF2vFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hz1pkiyDpAlly9IlEHdptnpvyNPD6aXh4wVzTfw+nX7PzuJJyfG5hTARTAKjNdMQtvMSMEaZL3L7ZlzavjjMgXIkD8q7LflmN+pHMFt8QhBxp3Uv/lI//GqgkIhWqJOIE6dCZbOO4jwBgCoHNvZjNtkRd5lHZJubRzPwx6vW3hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0dNidQj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B4FC2BCAF;
	Sat, 11 Apr 2026 08:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775894524;
	bh=gvdpAvTWcmWTQ2Jvb4VCkVuJk3Ar+NokzIsq3HF2vFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f0dNidQjV44Ue+vVjSEEnDjBkc8VTjDJSr8gWP4mgEne0S/0mHRvxG+2fvJNOfhvZ
	 17zqSgAj/9/8IGOyLsWO+8iTgzv7h8SXYYM4g4ooOK1h3j0pEkGaEOGMWcYb1RcEgo
	 321TfKyRs3FhrpvZfYpMb/bj/P63M/59GcLd7stTFG9jraLs2GPnYcx/hL5ZTV+fBU
	 PW11SyYxDQGBKyq0NkQVGVQpgKnHYtwNWpRdSc1G/CWEn3IGQ4DCEWPAseyH9u2xA2
	 OuZikA0WNSZDuh9+Qyftvu+6gVplPZSkCtlvX8bDIc1D41c5d07iaP20X+cIuYn5Eg
	 Eoi5/mo7ROo7A==
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
Subject: [PATCH v4 03/24] PCI/sysfs: Only allow supported resource types in I/O and MMIO helpers
Date: Sat, 11 Apr 2026 08:01:27 +0000
Message-ID: <20260411080148.471335-4-kwilczynski@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-3374-lists,linux-alpha=lfdr.de];
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
X-Rspamd-Queue-Id: BF36C3DEC06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, when the sysfs attributes for PCI resources are added
dynamically, the resource access callbacks are only set when the
underlying BAR type matches, using .read and .write for IORESOURCE_IO,
and .mmap for IORESOURCE_MEM or IORESOURCE_IO with arch_can_pci_mmap_io()
support.  As such, when the callback is not set, the operation inherently
fails.

After the conversion to static attributes, visibility callbacks will
control which resource files appear for each BAR, but the callbacks
themselves will always be set.

Thus, add a type check to pci_resource_io() and pci_mmap_resource()
to return -EIO for an unsupported resource type.

Use the new pci_resource_is_io() and pci_resource_is_mem() helpers
for the type checks, replacing the open-coded bitwise flag tests and
also drop the local struct resource pointer in pci_mmap_resource().

Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
---
 drivers/pci/pci-sysfs.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index ad3c17f86c7f..6783c6168445 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1108,20 +1108,24 @@ static int pci_mmap_resource(struct kobject *kobj, const struct bin_attribute *a
 	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
 	int bar = (unsigned long)attr->private;
 	enum pci_mmap_state mmap_type;
-	struct resource *res = pci_resource_n(pdev, bar);
 	int ret;
 
 	ret = security_locked_down(LOCKDOWN_PCI_ACCESS);
 	if (ret)
 		return ret;
 
-	if (res->flags & IORESOURCE_MEM && iomem_is_exclusive(res->start))
+	if (!pci_resource_is_mem(pdev, bar) &&
+	    !(pci_resource_is_io(pdev, bar) && arch_can_pci_mmap_io()))
+		return -EIO;
+
+	if (pci_resource_is_mem(pdev, bar) &&
+	    iomem_is_exclusive(pci_resource_start(pdev, bar)))
 		return -EINVAL;
 
 	if (!pci_mmap_fits(pdev, bar, vma, PCI_MMAP_SYSFS))
 		return -EINVAL;
 
-	mmap_type = res->flags & IORESOURCE_MEM ? pci_mmap_mem : pci_mmap_io;
+	mmap_type = pci_resource_is_mem(pdev, bar) ? pci_mmap_mem : pci_mmap_io;
 
 	return pci_mmap_resource_range(pdev, bar, vma, mmap_type, write_combine);
 }
@@ -1149,6 +1153,9 @@ static ssize_t pci_resource_io(struct file *filp, struct kobject *kobj,
 	int bar = (unsigned long)attr->private;
 	unsigned long port = off;
 
+	if (!pci_resource_is_io(pdev, bar))
+		return -EIO;
+
 	port += pci_resource_start(pdev, bar);
 
 	if (port > pci_resource_end(pdev, bar))
-- 
2.53.0


