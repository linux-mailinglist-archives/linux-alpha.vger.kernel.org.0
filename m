Return-Path: <linux-alpha+bounces-3305-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CnxOPiP2GksfQgAu9opvQ
	(envelope-from <linux-alpha+bounces-3305-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 07:51:52 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 987A63D26BB
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 07:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4DC430160EE
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 05:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947FC3264DC;
	Fri, 10 Apr 2026 05:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idNrnZGK"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715CF30F52A;
	Fri, 10 Apr 2026 05:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775800310; cv=none; b=o6gKB8VPczKC/qXE9aGH0qwypIyHAk6Q+LHgcEkZxJbQJuXyYldLJW2Sj6t8FuO/aRKcKE7CJbGiychGXy1URQWk5rCFiYD8hCVg1xWHu/+l7RoJbXTBnY5lUrXlOxSfb1p1WEv4+mzPpzQnnPZ5s7uVECdiqRbEAYWWSiXhdRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775800310; c=relaxed/simple;
	bh=oQgIbc3awQh5fpb2CqNNM9x6RSDapGc3MWBpJJrWA7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l6NsnWRxYwrBd3ntCSLt+Yj+mmK9g+QJ2HfokIblXJoXcowDQpE4Xy7Ytt3tP0Lf8n22ObWZDKa80gyGWOg1RCCwiWIOeMDuZaBnyCWBFXvxBWs2/N45DD7R44EdmR/ng6CbXbhnQWYZr00Rw8CjPdTsC7I7/X2y93DJziQDyD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idNrnZGK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0872FC19424;
	Fri, 10 Apr 2026 05:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775800310;
	bh=oQgIbc3awQh5fpb2CqNNM9x6RSDapGc3MWBpJJrWA7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=idNrnZGKoasnD+B1n6MQ4w55cpcbgnyBAaSbeyxgoqaEf9peMLrM99g7hbTJTahvx
	 RPGuG1UNYkXbtttYpaE75RjqXuyb2pDPR1VMWk1U1OrtGjHHvKX4EPLinekes/d7vk
	 bN46bFvKC5+DQQzRpB/ufCE4vD6TRb9VjEiIHPMyQ0z0kq8+2GzVzIDmINommzG9ow
	 qyNlHpAMWYY4+QqnBUvBglUeE0z2v+iKqL98oyXZYUsDxikE5IemvqgnUbEtwGyJzB
	 KTh7H61KNCjotmjDPR5DBjp75RYdJ84VeWLcUFJFRMxAwxP2/MrQUIQiKn64YXQvUU
	 XpMjiHJAGvHlA==
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
Subject: [PATCH 18/20] PCI/sysfs: Add __weak pci_legacy_has_sparse() helper
Date: Fri, 10 Apr 2026 05:50:38 +0000
Message-ID: <20260410055040.39233-19-kwilczynski@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,linux.intel.com,vger.kernel.org,lists.ozlabs.org];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-3305-lists,linux-alpha=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 987A63D26BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, Alpha's sparse/dense legacy attribute handling is done via
pci_adjust_legacy_attr(), which updates dynamically allocated attributes
at runtime.  The upcoming conversion to static attributes needs a way
to determine sparse support at visibility check time.

Add a __weak pci_legacy_has_sparse() that returns false by default.
Alpha overrides it to check has_sparse() on the bus host controller.

Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
---
 arch/alpha/kernel/pci-sysfs.c | 7 +++++++
 drivers/pci/pci-sysfs.c       | 6 ++++++
 drivers/pci/pci.h             | 4 ++++
 3 files changed, 17 insertions(+)

diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.c
index 2da95d965e9c..2031a3b6972c 100644
--- a/arch/alpha/kernel/pci-sysfs.c
+++ b/arch/alpha/kernel/pci-sysfs.c
@@ -190,6 +190,13 @@ int pci_mmap_legacy_page_range(struct pci_bus *bus, struct vm_area_struct *vma,
 	return hose_mmap_page_range(hose, vma, mmap_type, sparse);
 }
 
+bool pci_legacy_has_sparse(struct pci_bus *bus, enum pci_mmap_state type)
+{
+	struct pci_controller *hose = bus->sysdata;
+
+	return has_sparse(hose, type);
+}
+
 /**
  * pci_adjust_legacy_attr - adjustment of legacy file attributes
  * @bus: bus to create files under
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 40b5e21d77f3..fe079fb31dce 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1019,6 +1019,12 @@ static int pci_mmap_legacy_io(struct file *filp, struct kobject *kobj,
 	return pci_mmap_legacy_page_range(bus, vma, pci_mmap_io);
 }
 
+bool __weak pci_legacy_has_sparse(struct pci_bus *bus,
+				  enum pci_mmap_state type)
+{
+	return false;
+}
+
 /**
  * pci_adjust_legacy_attr - adjustment of legacy file attributes
  * @b: bus to create files under
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 1bf165595583..f52caf7e4d13 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -390,6 +390,10 @@ static inline int pci_no_d1d2(struct pci_dev *dev)
 
 }
 
+#ifdef HAVE_PCI_LEGACY
+bool pci_legacy_has_sparse(struct pci_bus *bus, enum pci_mmap_state type);
+#endif
+
 #ifdef CONFIG_SYSFS
 extern const struct attribute_group *pci_dev_groups[];
 extern const struct attribute_group *pci_dev_attr_groups[];
-- 
2.53.0


