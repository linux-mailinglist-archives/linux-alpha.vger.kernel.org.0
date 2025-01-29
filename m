Return-Path: <linux-alpha+bounces-1890-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F6CA21A1E
	for <lists+linux-alpha@lfdr.de>; Wed, 29 Jan 2025 10:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B58CA163269
	for <lists+linux-alpha@lfdr.de>; Wed, 29 Jan 2025 09:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7581ACEAB;
	Wed, 29 Jan 2025 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b="P6ztastu"
X-Original-To: linux-alpha@vger.kernel.org
Received: from minute.unseen.parts (minute.unseen.parts [139.162.151.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3721AC448;
	Wed, 29 Jan 2025 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.151.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738143812; cv=none; b=kdonvKqYi8Ba04VDBx4zsSNxv+QUub7H0/5OKaakSYdMAgEPEo2In0M7oNeQCnefPJKrastc3k3hJeZqR84ZndNcgLyVVXwLQ02fteZGEFqcpyPA1oY1P6D0jwQebx71bJ7hgRUQdsJxd9yirioOyMDUS7XYVHugrTlxI3fDphQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738143812; c=relaxed/simple;
	bh=DI0hsQKSBth0HcOjTYmd0vSlA71BbKEJz3zGU40mDcM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CSrJdYw4blohxmD2P7ZXmJBEMZKATjyQG3ixs28XVR3kJoVIb93jhjoG1YLPKCiu2AueTMnzT/r5LBScp03o43LVImDwLsROuDlSploCggaB381/xGTs2cowNPTX+WR4qTslXuRhs5hcTXpPvp1tUFR+1AcyQRk7OCLQKcHQu2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts; spf=pass smtp.mailfrom=unseen.parts; dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b=P6ztastu; arc=none smtp.client-ip=139.162.151.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unseen.parts
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=unseen.parts; s=sig; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QsJX2q4R1vVtgWZPKumYna8ezYIFmpagPEpx7dAVMdY=; b=P6ztastui7IkTdgb1eXG1dRXTU
	hf6roInMc/xvUYnjoE5a+jnsTat9nmKzTI5661vHACPSbi9qy1csGm4LGnI67JDlReNckY8hEaLPM
	NshIfIbotq7qF18EPIPXkxU2/TRBxYdrlHpm7bKdNaURyGeIiNAyD82k30pz/LtN3FcZXNKBIpcbk
	Oy4PUA/bSDggoaSjhE1WMrFdlJmv4qjD0nBgnjnH9SSEtgMAkJZJEjcRJpO/aSzO56xdgQvirAs8R
	3qy17uPF8WBRtyhdoF/CGJstj9po2UGivKvCguWsWpSqEM1Bt6ug9bcQa9b2772FPhmaBVtqe2bdw
	L72dAHIQ==;
Received: from ink by minute.unseen.parts with local (Exim 4.96)
	(envelope-from <ink@unseen.parts>)
	id 1td4bI-00078C-1j;
	Wed, 29 Jan 2025 10:43:12 +0100
From: Ivan Kokshaysky <ink@unseen.parts>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	"Paul E. McKenney" <paulmck@kernel.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Magnus Lindholm <linmag7@gmail.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] alpha: replace hardcoded stack offsets with autogenerated ones
Date: Wed, 29 Jan 2025 10:43:10 +0100
Message-Id: <20250129094312.27399-3-ink@unseen.parts>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250129094312.27399-1-ink@unseen.parts>
References: <20250129094312.27399-1-ink@unseen.parts>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ivan Kokshaysky <ink@unseen.parts>
---
 arch/alpha/kernel/asm-offsets.c | 4 ++++
 arch/alpha/kernel/entry.S       | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/kernel/asm-offsets.c b/arch/alpha/kernel/asm-offsets.c
index 4cfeae42c79a..e9dad60b147f 100644
--- a/arch/alpha/kernel/asm-offsets.c
+++ b/arch/alpha/kernel/asm-offsets.c
@@ -19,9 +19,13 @@ static void __used foo(void)
 	DEFINE(TI_STATUS, offsetof(struct thread_info, status));
 	BLANK();
 
+	DEFINE(SP_OFF, offsetof(struct pt_regs, ps));
 	DEFINE(SIZEOF_PT_REGS, sizeof(struct pt_regs));
 	BLANK();
 
+	DEFINE(SWITCH_STACK_SIZE, sizeof(struct switch_stack));
+	BLANK();
+
 	DEFINE(HAE_CACHE, offsetof(struct alpha_machine_vector, hae_cache));
 	DEFINE(HAE_REG, offsetof(struct alpha_machine_vector, hae_register));
 }
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index dd26062d75b3..6fb38365539d 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -15,10 +15,6 @@
 	.set noat
 	.cfi_sections	.debug_frame
 
-/* Stack offsets.  */
-#define SP_OFF			184
-#define SWITCH_STACK_SIZE	64
-
 .macro	CFI_START_OSF_FRAME	func
 	.align	4
 	.globl	\func
-- 
2.39.5


