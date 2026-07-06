Return-Path: <linux-alpha+bounces-3732-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7Aw3CLf3S2pCdwEAu9opvQ
	(envelope-from <linux-alpha+bounces-3732-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Mon, 06 Jul 2026 20:45:11 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 792B4714A14
	for <lists+linux-alpha@lfdr.de>; Mon, 06 Jul 2026 20:45:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KD9y7RLk;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-alpha+bounces-3732-lists+linux-alpha=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-alpha+bounces-3732-lists+linux-alpha=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B8FC34728B5
	for <lists+linux-alpha@lfdr.de>; Mon,  6 Jul 2026 17:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A2C2ED16D;
	Mon,  6 Jul 2026 17:00:36 +0000 (UTC)
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A002E738D
	for <linux-alpha@vger.kernel.org>; Mon,  6 Jul 2026 17:00:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357236; cv=none; b=GGnmQ6zHCuL2FGxmMj4o9UxJ92zQgmkFLzd1NrxZz1Sg+cpQ1V5tkpE33aZOB/pSdPZUAspF9NOK9YfEoDsLrYqabwJ5KrNs1RRsVmpx0Fa510qHvu3HcnPXZ5ihRJnNvyEAsaRbsv+JKQiO3OWfzcYxSletMlaXFnGvjYqDScE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357236; c=relaxed/simple;
	bh=ZziSC1n6N4F1brdtCP75PwL3mwkBGaV/H9I0p/XM020=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KteBulAZc9qP7MykE2B+3pvl8m54BG0na/WWn+1bevRQkHCJfB37q3v5gMNVuEuF3poZmjhDDNE/0IwBMOV2ciBtkrSm9nxklmsnGx1ZAY0gobOEf3be8qloEfJnNPXEkOjgag6QcZdRrurkqU8InbghQbw26jB5wW9si86Wdu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KD9y7RLk; arc=none smtp.client-ip=209.85.167.51
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so2669714e87.1
        for <linux-alpha@vger.kernel.org>; Mon, 06 Jul 2026 10:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783357233; x=1783962033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTcVz9luL8bir/ZzptwlcjQQqCfAppeo2d04/ZWzcNg=;
        b=KD9y7RLkk8cdIyAnUl0UrYvr/r2fKqGteKcmZu5N6Zrsl7Tb7SjGt5KT5ovRw1G7z8
         zHzOqS4EQb5iIR52G5D9LTDxxgboRBiyZ7t2JLec9jH50HRKulRW1dcccLHbWxWkdSCW
         QyE6q3IOB6GjebG40SbKcPL5ruEZFGzXNn8lM7fTFXb2qIzsRvW6dHdi31eJ0RoPuuYO
         atEBurDoEqS/sfPLIJlLI/2fF6ttcE6nV5g77yA62PzKO+aUBKoQEYvdQ6UtrfF4Ig1J
         T0K5C6v+9ObMUO963W0eJZyJmmAHboglFPDBTyx4Ws4SJ8oouw2vl69XtCnkKY5+Mm9R
         oYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357233; x=1783962033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTcVz9luL8bir/ZzptwlcjQQqCfAppeo2d04/ZWzcNg=;
        b=DxrNSoNri4SgUvI8JgwbFjKFw2CcCRgBkIDSXmo5BjA9wbemKK7dTekL9kDyVlCSQ4
         grd4QepwzosNatWRoygG48o5oBpmSJ6xmKMc/gdr2ZOKmo7vmOby0Qht5j0I+xs0FAUA
         YkkatLhQiOugKNOC5EP4HdvfmYis0INTRC/FTH5HWxWmIqhjweSW7YWzGKrc11E8pjZk
         cd0ypc186Qdyq//5SZpcCXmIzVsj2Nij67JFXbQEQL0wokHGjn+sNBMOVj4Dj85A87Pb
         9pCL5PK0rXCmIt2hUi2awuDA09+cbM3/UWrtcAproKr2plg5YB4muACL74mksufaEapQ
         JZ1w==
X-Forwarded-Encrypted: i=1; AHgh+Rq1Cuu3+UGhIlbwaAZHk/jgX/rETjpohoJylRQx5M3y2+kAaIk/FcR/nJKFEW4uhzmf0a8nbxgQJXnq/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyunjykYl3cbK2zZCjI88gQS753phcuNRRGLFRimktBd5vyL/UN
	VXNhkvklXKLV5T6hX2JgYvXeD2jcPte5Tsubr7zF9MySq+FH+eYeJPNw
X-Gm-Gg: AfdE7cnCHgIk8ZPxy1yzqxuM50hsbGX9rUHCBxJTSRWXgwtAyOPrmzu5r1wNIT/gEYb
	x2u4NunH8WV/USUa9qIYS6YTWcOYXgsqvvg38bfg/o3OE4Prj8Wftrr9r4EnokBPD2zD5TvZrUF
	8y0yrqfbN4UBqySPFMnP/gfcMwJ4P2WG3AuvG0nDaAvolAjHCbiEhG0nYB7QnE1NHx1IG6LP/7e
	oDVpllRyn5izAbkJnVjKHabYXwpfcxFlsFx1sOWPk/AZsXt5bgHpm1yAzyJAPPcVPOyHCEx6/5G
	Xy2zukiHaEijYZJyuju97PR06VStBkz51gVsTfCM6xwhs/OqejHXVgoiYw5HqK6KjOjCrSozzm3
	i1YbtYlJuSWnElRZGodAZG/zonaJEDQfqAqx6zhQtHIfYfJJDQBaBhZm3TkVTBLSYIUhnaAwV2v
	CN79t1Q7IOye7TbfDEXzApEBdkRu/Uw12OSLE4nS6ZwwrwguNl02Kj9ralpWat64YqXtABUtf/E
	3CCLu0Z/FlVDjT+XvlzPHaakfA=
X-Received: by 2002:a05:6512:838f:b0:5ae:a89c:3cd8 with SMTP id 2adb3069b0e04-5b007bcf8f3mr230720e87.46.1783357233045;
        Mon, 06 Jul 2026 10:00:33 -0700 (PDT)
Received: from buildhost.darklands.se (h-158-174-102-211.A469.priv.bahnhof.se. [158.174.102.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bfd1fsm2961021e87.55.2026.07.06.10.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:00:32 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	macro@orcam.me.uk,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v4 3/7] alpha: make irqflags helpers operate on IPL state
Date: Mon,  6 Jul 2026 18:56:44 +0200
Message-ID: <20260706170019.2941459-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706170019.2941459-1-linmag7@gmail.com>
References: <20260706170019.2941459-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[linmag7@gmail.com,linux-alpha@vger.kernel.org];
	FREEMAIL_CC(0.00)[physik.fu-berlin.de,orcon.net.nz,unseen.parts,orcam.me.uk,gmail.com];
	TAGGED_FROM(0.00)[bounces-3732-lists,linux-alpha=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-alpha@vger.kernel.org,m:glaubitz@physik.fu-berlin.de,m:mcree@orcon.net.nz,m:ink@unseen.parts,m:macro@orcam.me.uk,m:linmag7@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmag7@gmail.com,linux-alpha@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-alpha];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 792B4714A14

Alpha interrupt masking is controlled by the PAL IPL value, not by the
full processor status word.  Make arch_local_save_flags() return the
current IPL directly, and make arch_local_irq_restore() and
arch_irqs_disabled_flags() treat their argument as IPL state.

Mask the low IPL bits in the restore and test helpers so callers which
still pass a saved PS value continue to behave as expected.

This prepares the irqflags helpers for lockdep IRQ-state tracking, where
the saved flags value is used to determine whether hard IRQs are enabled
or disabled.

Reviewed-by: Matt Turner <mattst88@gmail.com>
Tested-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/irqflags.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/irqflags.h b/arch/alpha/include/asm/irqflags.h
index 9f25d4e0d37e..f207544f52de 100644
--- a/arch/alpha/include/asm/irqflags.h
+++ b/arch/alpha/include/asm/irqflags.h
@@ -26,7 +26,7 @@ extern int __min_ipl;
 
 static inline unsigned long arch_local_save_flags(void)
 {
-	return rdps();
+	return getipl();
 }
 
 static inline void arch_local_irq_disable(void)
@@ -51,13 +51,13 @@ static inline void arch_local_irq_enable(void)
 static inline void arch_local_irq_restore(unsigned long flags)
 {
 	barrier();
-	setipl(flags);
+	setipl(flags & 7);
 	barrier();
 }
 
 static inline bool arch_irqs_disabled_flags(unsigned long flags)
 {
-	return flags == IPL_MAX;
+	return (flags & 7) == IPL_MAX;
 }
 
 static inline bool arch_irqs_disabled(void)
-- 
2.53.0


