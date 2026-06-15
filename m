Return-Path: <linux-alpha+bounces-3663-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id APbZB3kmMGr1OwUAu9opvQ
	(envelope-from <linux-alpha+bounces-3663-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Mon, 15 Jun 2026 18:21:13 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B67A5688492
	for <lists+linux-alpha@lfdr.de>; Mon, 15 Jun 2026 18:21:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dwEzd3VA;
	spf=pass (mail.lfdr.de: domain of "linux-alpha+bounces-3663-lists+linux-alpha=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-alpha+bounces-3663-lists+linux-alpha=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9FCB31DBC7E
	for <lists+linux-alpha@lfdr.de>; Mon, 15 Jun 2026 16:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7ED409126;
	Mon, 15 Jun 2026 16:10:18 +0000 (UTC)
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B32D409636;
	Mon, 15 Jun 2026 16:10:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539818; cv=none; b=stn3rVLhxmzaI0+U+IV1PR1NwdSvh6TrryzDSt6Wwdyj4z3XGyNA4wKI2Dth88/MF3q74WYLfxWAuoAgPxpBwfmWmDZsWisOLhBM3ZIPUpzyzJZKlvrAYF/j42gexv96mqP1Zi85GmlRXbGwhzW42l03NEs+mdqUcva51Z/vnw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539818; c=relaxed/simple;
	bh=4mxqW8AVI0jK2FpwPdzys8Gb9YWIetklNTMPOBbQpMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PCuddjT6liLBOy0zvUWj1ELfUcXm4ACNKjRqJfGPIHtzvTJlh3EO2nJDVko2qtdjkCOXS/oQC5aOTwTBGqvXSJIzCO3x5chGvRVClCywIiJ9emiwTqnLaLf1cMV6uAQ3ipOGo9NaXU4Ijf4U9YTAK1fjd4SoHoMab5V65XLa64Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwEzd3VA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3DA1F00A3D;
	Mon, 15 Jun 2026 16:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781539817;
	bh=XgEw8VzDOeN00GX/f4SQZXmzNyfAjAdVxW2eorZU+eU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dwEzd3VADX2YsaAB3hEXO3VToWTfeY0gBFecLojFYV8vTjhKEy+BGcAEY/9HbxnRP
	 hNXklnK91dihcYIZxbn6/bpzDag/VTX9cCIkmfdi+XQomA0AF1FzvVxsv6lmDlcw1g
	 0ShklUIfXD2vDaOyFBvELBaMmkBFi4CJ4oa/KnBSD4heu3UqWsKKE6i1co+Ah/4xmy
	 MM6YZvht3bxrHsXBIBffOARbZpTxrNKImynlP4SHPA7AB64YUKSuL56nj/eB6dLOUC
	 AMqjuuuOy3oUawqbhrIciEeS6so5lIKqByE1czU5/V/N8pdsvWspWCOJ8xbZZLdUzh
	 Z/B7MVlYqJLhA==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Mon, 15 Jun 2026 18:08:58 +0200
Subject: [PATCH 02/19] alpha: define DPS root partition type UUID
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-discoverable-root_partitions-v1-2-39c78fac42e2@kernel.org>
References: <20260615-discoverable-root_partitions-v1-0-39c78fac42e2@kernel.org>
In-Reply-To: <20260615-discoverable-root_partitions-v1-0-39c78fac42e2@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Davidlohr Bueso <dave@stgolabs.net>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-efi@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 linux-alpha@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1760; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=4mxqW8AVI0jK2FpwPdzys8Gb9YWIetklNTMPOBbQpMs=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFkGylfuSE/X95f0UXj9OuHgWuO0bS4rdio1H67WmtwV4
 xqt9D2nYyILgxgXg6WYIsuyck5uhY5C77BDfy1h5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 IEPHiIGLUwCm+uVcRoa9rZn9vyJiSt5kVYpb7zc6vXQmi+Przr0pQkJ2F7Xli/cw/JWyS/yVOPu
 cbk/eja2Z2+Uc+u/e//Bn6epuJv9radrer5kB
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3663-lists,linux-alpha=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:dave@stgolabs.net,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:mailhol@kernel.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux-alpha@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mailhol@kernel.org,linux-alpha@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linaro.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailhol@kernel.org,linux-alpha@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-alpha];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,uapi-group.org:url,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B67A5688492

DPS [1] assigns GPT partition type UUIDs to operating system partitions.
Root partitions use architecture-specific type UUIDs so the OS can
discover the intended root filesystem without relying on a root= cmdline
option.

Define DPS_ROOT_PARTITION_TYPE_UUID in asm/dps_root.h for alpha and
select ARCH_HAS_DPS_ROOT_PARTITION_TYPE_UUID.

[1] The Discoverable Partitions Specification (DPS)
Link: https://uapi-group.org/specifications/specs/discoverable_partitions_specification/

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 arch/alpha/Kconfig                | 1 +
 arch/alpha/include/asm/dps_root.h | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 7b7dafe7d9df..400cbb7525c8 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -5,6 +5,7 @@ config ALPHA
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_OPS if PCI
+	select ARCH_HAS_DPS_ROOT_PARTITION_TYPE_UUID
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_MODULE_NEEDS_WEAK_PER_CPU if SMP
diff --git a/arch/alpha/include/asm/dps_root.h b/arch/alpha/include/asm/dps_root.h
new file mode 100644
index 000000000000..7f70a83f72de
--- /dev/null
+++ b/arch/alpha/include/asm/dps_root.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_ALPHA_DPS_ROOT_H
+#define _ASM_ALPHA_DPS_ROOT_H
+
+#define DPS_ROOT_PARTITION_TYPE_UUID "6523f8ae-3eb1-4e2a-a05a-18b695ae656f"
+
+#endif /* _ASM_ALPHA_DPS_ROOT_H */

-- 
2.53.0


