Return-Path: <linux-alpha+bounces-3606-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P7dK8I1CmrQxgQAu9opvQ
	(envelope-from <linux-alpha+bounces-3606-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Sun, 17 May 2026 23:40:18 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5AE5640AF
	for <lists+linux-alpha@lfdr.de>; Sun, 17 May 2026 23:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 867E43019FD3
	for <lists+linux-alpha@lfdr.de>; Sun, 17 May 2026 21:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7013242AC;
	Sun, 17 May 2026 21:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8T3U94o"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5FD320A34
	for <linux-alpha@vger.kernel.org>; Sun, 17 May 2026 21:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779054007; cv=none; b=pjFzwC7CoSKhlOetdA44jaA1wG3eToIZMnhiP62Tb6pqnb7hXa+Gf0zXZi2R/SGFyAh4PXr2FiJDaZ3XtVmE4ygpuSN4B4g6mDq0LCTNrEaNEttz9HTprIRnLlMcdpnR9uvlbrsQl+XMNY0OXq0W8aofGlFP0zOhmy8KALmh2lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779054007; c=relaxed/simple;
	bh=HE6RHHD80LhTOnOIxDn55ZV+XR4m0A2pX3dfr15Ejfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qgpdh+y4AWBlW1vO7MbbhAOJU8TDoCczb2DtKztRNzP48kgbwWwzJeC6fQLdhFIRP/qYiMdXtrfCpa/sZRzYGem7e6GHLxpUFDdXQ/XPMu4QpxG+DmU4B5q8sx4t68LZYjlpfuifhtUGRPvBFmG7Pf/10nXQQb1sxA8ydsA1588=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8T3U94o; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a87782588cso1969669e87.3
        for <linux-alpha@vger.kernel.org>; Sun, 17 May 2026 14:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779054004; x=1779658804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jM2g/fNisSlNBmuh3HXPnL9GcxMgIFTfKPUaQ1PrVMU=;
        b=L8T3U94oL01yKLEsJnkDqK75FeqqMshPUV36gH7FGjzXKzCTY7HIJSujcHdSWi+nXd
         44t2L9Vemv3BfJpiZGUIyc21ZleZtnBV5WRw7oCMjOuN3/dYrxYt/GvVm5bgd64hGr+A
         jp2wVo5O+19UqOOoHibamcFJuPZzE3s6p7wk0ZnbIGDGRqEInrwCcvA0Qp2ul+zrX8W8
         HIWeOIXIQdIVERNKtezKzse/Kltx1TLURICAmeGw70K4t1/Fjnw21d4nZSL3UKj45fiS
         BZ0jHn0dn72bP2me8EFlZyBRfvtbYywBggGXHCNIt8v8FnRWUs3DtmVV3sWvjOtkCUv+
         qVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779054004; x=1779658804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jM2g/fNisSlNBmuh3HXPnL9GcxMgIFTfKPUaQ1PrVMU=;
        b=bYE8VrcIqaBViBVv88mwL3ZAYPUWY5+84ow2JzFjoRwDokeV+ZG1Ja1zfdqwLPjApC
         McWtz+pOkDQTqAbc4jwZ4iKwBjC40coOuqDkXZJTQ9WIA32Nc26qIofMATsh7E+FcXOp
         p9LVNS4by9EHVNxWe5TQAf5S14VbKpHfKA+ykRdVPoF7rpzaj4X+t5pF593U7HZq1osu
         osZv7aU1zH8wx7ypsDPcO3zim2DEfI1lH4miwZ4+bNvt+1I9o0mKryIQu4KcgKl9ebog
         zarWRra+7/yfsPyrdzG2uWyS+MfC/1olhe6D6Y7bvnk8NkynQo7y3TyjrjTiaTnu1g3a
         ovoA==
X-Forwarded-Encrypted: i=1; AFNElJ8rZLRm+eHIap4uYWTaFj8NQpXcDmTaxo5AcgMJ1pE4Boms+gvunZ+hrPWnFPW9EISjLWgbG7aojPk7SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeaqosjF7+XWxWEtUTDcVhv98Ik3KNcjDCcJ7yPgTkYNu0bBYF
	ugzUCELy74+1/MlwT919qCK7q4AtMB49ORwqi+1h2m6c24bKxmVF17pB
X-Gm-Gg: Acq92OFNLHI9lYgOxOUJqeqwj8ZYB7CuoI3xZPiIMthrCSzeCA/PYje1R/MwW9a+cVX
	oPwkA+kOBobcqZgA7Pd/mn2l6NqFiXcu0605fRyM0OD/SfcYTd+6ZIV7/9Wl6Hc1422zT0M6pMK
	UqD+YPZEp/XabYYzm6M3zSlKBlhHxEYLp5Rh/QaFLsgPpT53CKS9P9ZGkzyjS7RcThImjY67/dw
	VUkU7bcHwMk7Y09ohWQg5X5xiUFy8FD/r06/W3eFgIT461MCe0L4CvoqzgYZKzwAktzAZUfwuhT
	7MV61ymmtovG0qlCHkedYyoYt35dzAv+NrhFK3+pjh2WCwgdS8SPBrgmmlLw9ofTfHpuLvI4Lvb
	MZfUAHMZu9rzmr0wuhWvCk2PuWhOHF07I8ZFjufitOTxrHG756WwlrkcsBtHig2ecRVBFoXVH1C
	KSdGz8NgzFTNKAOHJRDgAs8taPmxf2XsjuzyY2EwIQ3dmBo73ljGvX9xUz7sq7/iGnD3SuGYl5H
	t/u2Pppgw8c9PO9V/3k3r7wbQfYgg0HBwmWQwA615VM+w==
X-Received: by 2002:a05:6512:3192:b0:5aa:b6b:93c1 with SMTP id 2adb3069b0e04-5aa0e744e11mr3627600e87.43.1779054004091;
        Sun, 17 May 2026 14:40:04 -0700 (PDT)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91c1558f3sm2890076e87.77.2026.05.17.14.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 14:40:03 -0700 (PDT)
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
Subject: [PATCH 4/8] alpha: initialize PCI sysfs bin attributes for lockdep
Date: Sun, 17 May 2026 23:36:13 +0200
Message-ID: <20260517213919.347523-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260517213919.347523-1-linmag7@gmail.com>
References: <20260517213919.347523-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3E5AE5640AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[physik.fu-berlin.de,orcon.net.nz,unseen.parts,orcam.me.uk,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3606-lists,linux-alpha=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmag7@gmail.com,linux-alpha@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-alpha];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Alpha allocates PCI resource sysfs bin attributes dynamically.  When
lockdep is enabled, dynamically allocated sysfs attributes need their
lockdep metadata initialized before registration.

Call sysfs_bin_attr_init() before registering the resource bin attribute
with sysfs.  This avoids unrelated sysfs lock-class warnings once Alpha
enables lockdep support.

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


