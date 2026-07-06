Return-Path: <linux-alpha+bounces-3738-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QSfcDVbsS2r4cwEAu9opvQ
	(envelope-from <linux-alpha+bounces-3738-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Mon, 06 Jul 2026 19:56:38 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B566E7142D6
	for <lists+linux-alpha@lfdr.de>; Mon, 06 Jul 2026 19:56:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gDsF9MPo;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-alpha+bounces-3738-lists+linux-alpha=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-alpha+bounces-3738-lists+linux-alpha=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A84B2303B6AC
	for <lists+linux-alpha@lfdr.de>; Mon,  6 Jul 2026 17:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD4D3BCD26;
	Mon,  6 Jul 2026 17:54:28 +0000 (UTC)
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE2C3B8D78;
	Mon,  6 Jul 2026 17:54:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360468; cv=none; b=oXK35Fqp/WcORlxS7pQOfqAafR1WMy+/ESX2kpi/z0JcQIE2DbCBzmtKjMH7J8BbyCcnWcn847FhK6xtYtDEhHaNMwn488OvrFDYy2g97JhgspafuiOogT3q0IJu5xFJE+Y7Pd1kToP2D6zKzuz8g9KPkEebuzb+8k83nCNwMak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360468; c=relaxed/simple;
	bh=M7l5Mtfeb55mtqcU/EZZzML3bjTyV6YmpSGkFskhWns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lZSN2jxGi2WsI6j+RhfCM4nqkaKiPeEB9YIaM+FzjH9tVR5/fjtDXdFR31n2ZHNx0ES1o66vyS5ZUYczVFuwgzfc3ZmKimXaCuFQuzpuLC73/NXQlURzG6062RI15KDqq5jfO1akDPO9Cai2s+QJcoJoIbP1c+pOnUX6pMxSSJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDsF9MPo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4AF1F00A3E;
	Mon,  6 Jul 2026 17:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360466;
	bh=sHyabwLdiSdyQjfwz7I0N8nEStW6t/tFkfoIupEeLWs=;
	h=From:To:Cc:Subject:Date;
	b=gDsF9MPoC6qbMr7gtgMoqux5jRksilmW+/bgeO09vWvK6DhAVr8ZYBFK0FuACrV/N
	 80sLfuXItj3rxkJDDHivIO/HSiqQUILRRWhfUCF/QeQicEF6oe/X5DDyHQHdcDFtOp
	 7VP5pKkdrACwEF7OG9dP9L/HHaVl3+zOjxTWTE9fzG+Ba8MnaNBT+zTfRXVT8C5C6n
	 ZhBzo7Nn9kgFufUBJVIZTTjMaDzoOAKu59uJxxfl4WxgSULrX/g+tib16gzBfPNtHK
	 TIbz1W8LhPBeGIHQGih4ZVePJAxQkoJzmsX4i2r1t/LJL1diD82JfYnN8vifKCCI6M
	 /8c/22+4mBY0Q==
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Jesse Barnes <jbarnes@virtuousgeek.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] alpha/PCI: Fix I/O port accessor argument order in pci_legacy_write()
Date: Mon,  6 Jul 2026 17:54:23 +0000
Message-ID: <20260706175423.98305-1-kwilczynski@kernel.org>
X-Mailer: git-send-email 2.55.0
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,jurassic.park.msu.ru,virtuousgeek.org,google.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-3738-lists,linux-alpha=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[kwilczynski@kernel.org,linux-alpha@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:richard.henderson@linaro.org,m:linmag7@gmail.com,m:mattst88@gmail.com,m:ink@jurassic.park.msu.ru,m:jbarnes@virtuousgeek.org,m:bhelgaas@google.com,m:helgaas@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kwilczynski@kernel.org,linux-alpha@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-alpha];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B566E7142D6

pci_legacy_write() in arch/alpha/kernel/pci-sysfs.c passes its arguments
to outb(), outw() and outl() in the wrong order:

  outb(port, val);

The Alpha I/O accessors in arch/alpha/include/asm/io.h take the value
first and the port second:

  extern void outb(u8 b, unsigned long port);

So the port number is written as data to the I/O address taken from the
user-supplied value, and the intended write to the requested port never
happens.

The arguments have been reversed since the file was added, and the
function returns the access size regardless, so the caller sees success
while the requested port is left untouched.

Fixes: 10a0ef39fbd1 ("PCI/alpha: pci sysfs resources")
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
---
Changes in v2:
 https://lore.kernel.org/linux-pci/20260612232400.585195-1-kwilczynski@kernel.org/

 - Collected Reviewed-by and Tested-by tags from Magnus Lindholm.

 arch/alpha/kernel/pci-sysfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.c
index 94dbc470cd6c..7050f0f7fe3d 100644
--- a/arch/alpha/kernel/pci-sysfs.c
+++ b/arch/alpha/kernel/pci-sysfs.c
@@ -224,17 +224,17 @@ int pci_legacy_write(struct pci_bus *bus, loff_t port, u32 val, size_t size)
 
 	switch(size) {
 	case 1:
-		outb(port, val);
+		outb(val, port);
 		return 1;
 	case 2:
 		if (port & 1)
 			return -EINVAL;
-		outw(port, val);
+		outw(val, port);
 		return 2;
 	case 4:
 		if (port & 3)
 			return -EINVAL;
-		outl(port, val);
+		outl(val, port);
 		return 4;
 	}
 	return -EINVAL;
-- 
2.55.0


