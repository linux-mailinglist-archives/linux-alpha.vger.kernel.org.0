Return-Path: <linux-alpha+bounces-3290-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFKFEcOP2GksfQgAu9opvQ
	(envelope-from <linux-alpha+bounces-3290-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 07:50:59 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C29943D262E
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 07:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0844730022C7
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 05:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C77E3264DC;
	Fri, 10 Apr 2026 05:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rXzq+qXX"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE19430F52A;
	Fri, 10 Apr 2026 05:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775800255; cv=none; b=KandSWmUom6/VOtQX9f/2w+H2cfTRpctVsWz5Wyp8jeOObleQrg5kI5yTnL5jEB8LNbrPpS1vAVPLFsY0rXG6HkDhGsZzIBX7/pkM5utRkxgm9J6bGGexQqHT7Ogen1wM3zJCMYBNeIel0QvbYBViZk6jGTA3Ac/wy1r25t6on0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775800255; c=relaxed/simple;
	bh=adotA/V+MQ7wgPmgyJRZLabHOEzjzDHEZuvNSiVnByw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pK3QBJZtaNA88nqYzAMCfy7LJFKq6C9obtSYjRPLo/XLHwYA0J3XeDheOCZQ70auCUMIKDsQUVK1glowgnZwdxTO+ol+sqaRPxKJ6qDiYU1wxPbZVhtcUWOZG+X/kpB7zlcplKfHzRDpg3br1VUc6a9CpG8VxBRDIoy/3rRnups=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rXzq+qXX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A5EC19421;
	Fri, 10 Apr 2026 05:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775800255;
	bh=adotA/V+MQ7wgPmgyJRZLabHOEzjzDHEZuvNSiVnByw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rXzq+qXXGHKFdTEHH4V081hOqLkNfjy+xN3A5I8xX0aYNfICbiGwyuZ4M+EQxV/y8
	 OVas0PkRjej2GjVa2TpozsrFLkYhADO2Z8BI5c2RQD0sS8lgX0nPAxSSs67Y6iYShi
	 lvNfF4hO12cIERJz/rc/oWrrJbCoIAn68jxSdQvtmMTEw3QXQ+sE4UCgB12QfpXAoM
	 dCptzylbzbnOLJUlrfaV/rJhjXggRsRzdxjmQwbmp8TFGemSxaNRFSU/akdoECuUJD
	 KrIhwYEurakMPTHwHiNXwIAYdQhuwAcruK1YVIHeaP5RBsLznbYH+ivhACQkevt7ew
	 KKmng7Ls70EVw==
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
Subject: [PATCH 03/20] PCI/sysfs: Use BAR length in pci_llseek_resource() when attr->size is zero
Date: Fri, 10 Apr 2026 05:50:23 +0000
Message-ID: <20260410055040.39233-4-kwilczynski@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,linux.intel.com,vger.kernel.org,lists.ozlabs.org];
	URIBL_MULTI_FAIL(0.00)[sto.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-3290-lists,linux-alpha=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C29943D262E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both legacy and resource attributes set .f_mapping = iomem_get_mapping,
so the default generic_file_llseek() would consult iomem_inode for the
file size, which knows nothing about the attribute.  That is why this
custom llseek callback exists.

Currently, the legacy and resource attributes have .size set at creation
time, as such, using the attr->size is sufficient.  However, the upcoming
static resource attributes will have .size == 0 set, since they are const,
and the .bin_size callback will be used to provide the real size to kernfs
instead.

Thus, update pci_llseek_resource() to derive the file size from the
BAR using pci_resource_len() instead of reading the attr->size directly.

The custom pci_llseek_resource() helper has been added in commit
24de09c16f97 ("PCI: Implement custom llseek for sysfs resource
entries").

Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
---
 drivers/pci/pci-sysfs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 008e0dd0de36..ac4e7c516e78 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -909,11 +909,21 @@ static const struct attribute_group pci_dev_config_attr_group = {
  */
 static __maybe_unused loff_t
 pci_llseek_resource(struct file *filep,
-		    struct kobject *kobj __always_unused,
+		    struct kobject *kobj,
 		    const struct bin_attribute *attr,
 		    loff_t offset, int whence)
 {
-	return fixed_size_llseek(filep, offset, whence, attr->size);
+	struct pci_dev *pdev;
+	int bar;
+
+	if (attr->size)
+		return fixed_size_llseek(filep, offset, whence, attr->size);
+
+	pdev = to_pci_dev(kobj_to_dev(kobj));
+	bar = (unsigned long)attr->private;
+
+	return fixed_size_llseek(filep, offset, whence,
+				 pci_resource_len(pdev, bar));
 }
 
 #ifdef HAVE_PCI_LEGACY
-- 
2.53.0


