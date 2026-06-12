Return-Path: <linux-alpha+bounces-3654-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1D3bGVBtLGoMQwQAu9opvQ
	(envelope-from <linux-alpha+bounces-3654-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Fri, 12 Jun 2026 22:34:24 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD9167C572
	for <lists+linux-alpha@lfdr.de>; Fri, 12 Jun 2026 22:34:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=saYgt4aG;
	spf=pass (mail.lfdr.de: domain of "linux-alpha+bounces-3654-lists+linux-alpha=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-alpha+bounces-3654-lists+linux-alpha=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 94E1C30118E4
	for <lists+linux-alpha@lfdr.de>; Fri, 12 Jun 2026 20:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D30374E4C;
	Fri, 12 Jun 2026 20:33:32 +0000 (UTC)
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0599A35E1CC
	for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 20:33:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781296412; cv=none; b=uogLIaew0kBd7KjaElwRzGH9j6zoqkfdA4eEnrPXB9TikvX5Mpo495/0iIMypw/T4ert4HQLEGZfclQrMPqMdaKEBWU2N90JgII8AfBNx58pQEZv43FMjvLLbToiXeeoGXl87wNmhmwAPOeVUbPlonH/jxk92seXuCWPgIjvtRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781296412; c=relaxed/simple;
	bh=76DHYxNlVTvtmYPLtAlD94/yHpB+YN1+pJuezDYZS5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TeiQBlLb4WeWM5CgMdrgyHYRw6ytB+aOQQKctTbqz3ckXPMpNl8NZfanEludA8+PTLo0tT6YZg4wg33j0uVdrlN6rTYYhUzGMRr4vEFP78UNz3w/WDqoEKLjRd8bGeKt9oQOUOvIYxhJjBMfHepFHlnX9VA2JDnD7yZpW2Qpon0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=saYgt4aG; arc=none smtp.client-ip=209.85.167.45
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa7bf3d512so1866441e87.2
        for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 13:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781296408; x=1781901208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAIhYTNyQtOlWEz3j2toLlF61RHdf2vKRm56Ho9cdqs=;
        b=saYgt4aGajTCOECZUYTIEataTHTffTvahv/nRScgTURNdPq1gUxr7OSHej+qSqAcF1
         PrZKexdQNTZbNagqcAnP4kAsAkq1TsbD5GnWIG3wxONv9F2u88KtniDTo48s6k+++ie3
         Mg8qujwvhnoTA2i9aL4cew0zgtVUONrEB+e2aC2D0223s1P/HI/Urk0R0IXYGEiV9ajC
         W0sum9wHnShjkyImVylBtwBSbEsYnJLEKwdl0W8+iacyuluGGIfiXlV66c33zYVJQxfS
         lVruE5o4r7sq7sft5k1SVeJH+Icuk3AWKxOfjA2j10tRcakTSbHd/bMBzrjqvr4r3dp8
         3C3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781296408; x=1781901208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rAIhYTNyQtOlWEz3j2toLlF61RHdf2vKRm56Ho9cdqs=;
        b=TTgMtRDNxv1HVz7iJXdRIqeM4b4s0vRU0ki/UEyO2wXsTm121slkwoAyRJ4N238iq7
         Qq4Hz+b56sMakPq4VIw/Fuc3LfpwlbVNkjaVouWkBDlajQKk8STKzv5bFBchk0cXlHgl
         brNp2tdRZ6g97hn01PiRLtjWtWPfuSSmpyyEbbwK4/JM+Rb0cGloxHfzg7Rrunuep2/9
         Zuk29RcxxCxDeLDQDQbfEHmFKRTxTG2GjsWRNQdXq+yE1cEAFSeyx9u+Gf4Wh+gLP8mQ
         nUyR5SeIVmr5afgLuHtBlbH80gWkt6bo5ovO6UUtINKSrKwdlQNLozjJmqorOboPT1Wi
         e1Fw==
X-Forwarded-Encrypted: i=1; AFNElJ9DbrwtckH5wKOsl0ZdgZfPY/eEixZ1BPfsyRYC0rG24jAoY07wy1rQe7QfNcttHhCtJjuFvEUUZEwLzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZIRZch17PFJ2ELaQNieI1X21H2e5VWJoiyQg8zPd4Lmg/66yf
	xjXktuSGx6Jja6hjmrhEMgsF2aZ3DJm7IQaVE01IiF6p2mugrpqDMS58
X-Gm-Gg: Acq92OGjxUkIFxqMMm9Lx4zcieGNaggB6DXa7wlSVj4GZvOQQ6vshHgl6dxUjZ5lCTH
	9OnZXn/Glb9OB/xNRPCFVVkOPr8W+4q43fxjfY9A2ug7GQVYOoN+0W7RT+uE7wUGZenZQ95IuX+
	lyL+i9e1MKF5gdKdH5l2DhfP7AyXsByPL9zDkReKaPVwZXXhOQ79vHTdqtD+ujUf1k/+T0G4kCF
	YdevTo7cgCq3r3kCt52yze5v+dVp6gEiqt6fwXFwJcY/mlP/Jg3QpeHDzSWeF1R+90IHLHZfcLD
	8cN1Z1MisxgFv+0CoP0at/LGYnYXi14fU2Is9hsJI6bd0F9BAedelh8jhCaNjiJ5I1Cvjsetvn/
	ounZ8Z5hPzqmjcfeuHBmTu+3qectlJG07GHLQ3pz1xjXpx73khf6RAEHIHJAFU5EUj6sfKS3oYa
	vGLTxHQjKuZHG0R7iS5tk6o7K9vpUBGDhUzfxChXWs0LbuTJa+OTQJ75/2D1uRCa3ZY50D6JS56
	spYlQQf0lw2ckdbTpc9ThHB04js3xqFYbvVnRR0UHU=
X-Received: by 2002:ac2:414c:0:b0:5aa:678f:5646 with SMTP id 2adb3069b0e04-5ad2db2c62amr952773e87.8.1781296408153;
        Fri, 12 Jun 2026 13:33:28 -0700 (PDT)
Received: from buildhost.darklands.se (h-37-123-143-144.NA.cust.bahnhof.se. [37.123.143.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161e70sm788949e87.5.2026.06.12.13.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:33:27 -0700 (PDT)
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
Subject: [PATCH v3 4/8] alpha: initialize PCI sysfs bin attributes for lockdep
Date: Fri, 12 Jun 2026 22:26:52 +0200
Message-ID: <20260612203006.2265557-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612203006.2265557-1-linmag7@gmail.com>
References: <20260612203006.2265557-1-linmag7@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[linmag7@gmail.com,linux-alpha@vger.kernel.org];
	FREEMAIL_CC(0.00)[physik.fu-berlin.de,orcon.net.nz,unseen.parts,orcam.me.uk,gmail.com];
	TAGGED_FROM(0.00)[bounces-3654-lists,linux-alpha=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-alpha@vger.kernel.org,m:glaubitz@physik.fu-berlin.de,m:mcree@orcon.net.nz,m:ink@unseen.parts,m:macro@orcam.me.uk,m:linmag7@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6AD9167C572

Alpha allocates PCI resource sysfs bin attributes dynamically.  When
lockdep is enabled, dynamically allocated sysfs attributes need their
lockdep metadata initialized before registration.

Call sysfs_bin_attr_init() before registering the resource bin attribute
with sysfs.  This avoids unrelated sysfs lock-class warnings once Alpha
enables lockdep support.

Reviewed-by: Matt Turner <mattst88@gmail.com>
Tested-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/pci-sysfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.c
index 3048758304b5..ba08dbb43521 100644
--- a/arch/alpha/kernel/pci-sysfs.c
+++ b/arch/alpha/kernel/pci-sysfs.c
@@ -159,6 +159,8 @@ static int pci_create_one_attr(struct pci_dev *pdev, int num, char *name,
 {
 	size_t size = pci_resource_len(pdev, num);
 
+	sysfs_bin_attr_init(res_attr);
+
 	sprintf(name, "resource%d%s", num, suffix);
 	res_attr->mmap = sparse ? pci_mmap_resource_sparse :
 				  pci_mmap_resource_dense;
-- 
2.53.0


