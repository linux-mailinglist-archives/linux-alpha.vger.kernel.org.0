Return-Path: <linux-alpha+bounces-3391-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCk+ODsA2mnxxggAu9opvQ
	(envelope-from <linux-alpha+bounces-3391-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 10:03:07 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D503DED3A
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 10:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CC223032DFC
	for <lists+linux-alpha@lfdr.de>; Sat, 11 Apr 2026 08:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4AD23C8C7;
	Sat, 11 Apr 2026 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iX1XxyzZ"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D1413D8B1;
	Sat, 11 Apr 2026 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775894584; cv=none; b=BZF3nvwQTSWRvVqEuWsCqxnsT+OFy2JmCWG1nvY6/tvluxLvV4KxZlUTJnJGKhYTNPRlREWKKshF6reilte0DXN9+1a49dNlJyvwDDe5iSkt+tPsjeUjhHNSjZMAzIeM9ZwReCEz+OV2V5g3u50kXMq6YNo3Fob0C0Wo9NY+L50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775894584; c=relaxed/simple;
	bh=NQbD4J4pW0nv3pRn8qOen291nD4aqRAslHLpEUCpmsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G65yy/4dSREeXzmraW1yNWw/xhH+YMP5v6VqJvwNdHXLG5QqECJC8jjAuEBckqU5a84cKu7k0bQdRpKI26vmoCp1pUNyN8d7jXTShXcRpI0rApGxNZ1aaUVnktEi0c8Ic3KYg1tfeVnCrQR4n+qaRztqyMs/Qg6yeFkKKLO40Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iX1XxyzZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5784DC2BCAF;
	Sat, 11 Apr 2026 08:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775894584;
	bh=NQbD4J4pW0nv3pRn8qOen291nD4aqRAslHLpEUCpmsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iX1XxyzZtqKzCL0ahK6AWgElhHPuPuyOHWa9d/+HOFVVKtbjE+xKwnc0JGVFFLZ8h
	 N5pvTAHpTMoIEv3ymLzCrp6eiwk0R2BHfp4FW+ZaDechXPTyPrXsxKz0wojLeRWwHz
	 BfzUV5hPFQV91mdGJ26GqPI4l+i49qltuKoVztpsspn3O0pnEfXGMKchfD9byZxVuu
	 IvuVZhg9ZGGLQ/UBAHs1emg57SVYqT0zD9nO3xLt0oMIlDHyH6M84s89QT0+GcMFQ0
	 9tL2aRe5NmkgbluWEFs/Swg9MNFhd702pNoHgCGvVbg5obXy8s4AmKhbPpxLywC5Ub
	 YN3oxfhwowR7A==
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
Subject: [PATCH v4 20/24] PCI: Add macros for legacy I/O and memory address space sizes
Date: Sat, 11 Apr 2026 08:01:44 +0000
Message-ID: <20260411080148.471335-21-kwilczynski@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-3391-lists,linux-alpha=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 63D503DED3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add defines for the standard PCI legacy address space sizes,
replacing the raw literals used by the legacy sysfs attributes.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
---
 include/linux/pci.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index f6f55005f82d..6b630bac8c08 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -27,6 +27,7 @@
 #include <linux/mod_devicetable.h>
 
 #include <linux/types.h>
+#include <linux/sizes.h>
 #include <linux/init.h>
 #include <linux/ioport.h>
 #include <linux/list.h>
@@ -1167,6 +1168,10 @@ enum {
 /* These external functions are only available when PCI support is enabled */
 #ifdef CONFIG_PCI
 
+/* PCI legacy I/O port and memory address space sizes. */
+#define PCI_LEGACY_IO_SIZE	(SZ_64K - 1)
+#define PCI_LEGACY_MEM_SIZE	SZ_1M
+
 extern unsigned int pci_flags;
 
 static inline void pci_set_flags(int flags) { pci_flags = flags; }
-- 
2.53.0


