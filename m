Return-Path: <linux-alpha+bounces-273-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C198E87807C
	for <lists+linux-alpha@lfdr.de>; Mon, 11 Mar 2024 14:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 616CB1F21151
	for <lists+linux-alpha@lfdr.de>; Mon, 11 Mar 2024 13:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EDD3D0C6;
	Mon, 11 Mar 2024 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="YBgKCB/2"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44863FB21
	for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 13:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710163403; cv=none; b=tGb0BdVH3dTvjwNmQXgjHznyHRbRmTPEhk996KxgJjtbcyYl1AfkNnfJLAavXeANsdb0sRVmFb+cISeKRw0kVjcGFMP/M8JZMbvXpSFYip7PJpftVOVIkngj9colYk+t0ulBWSWvVZvSdrc8KP/uppRQtwkyr7KMO6dqxCNjPnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710163403; c=relaxed/simple;
	bh=KAB6hhZAz6A8i0BnoCpdZg6DUxWcJAZtEBcm2aaeNXE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lQCOAXvcs6AHOtfoUDHNow72rLu8p5xr/EvWPL7ZBciUcrkwxCBKVjsbPAZ+ujbes1MlvhOehVgkObbKjskPOZu/CPw10VKamhOTZ8b5AReKx8DReGo/41v1yun7kPVSqa2og8jwZS6jdBfO3Y+b9o14C0oft+ceawzIt52C3qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=YBgKCB/2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a462be1b7easo114582166b.1
        for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 06:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1710163400; x=1710768200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvd6aj0X2hBUl6mM6641rETJeDz5pw6wHYPDi/FbNkU=;
        b=YBgKCB/2W9AZu+aynlOK0YReY0bJppgOhyj6xbm7mxniHTIefUjiCUBNiVSAjf6Cy9
         Suw8b2qhzytr1eKWLb7Rn/Ol9Z1HSCV76yvRc+vXd9wCfqaK/l2T9Ck4DRciO+O81EXb
         yu21hVQ2yjp8s0zp9pSF6+wxLlKCV0zjIj7Hi3pH8kAmi//Q0jG/FxnH2GlJlKDspFkE
         jV39QvmedZTaL8gLg72+F5GRgMBVOBjqMwiPRRO/GilIYgBbqwbvU/qfvvG+aiNJYuZR
         1pRYo7r9KM1LKgN7tlE5Cc8fqM4WSfH5ZKQqLqZWQ841DRBY3UqzkccRl/AG7gvz2K70
         o3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710163400; x=1710768200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvd6aj0X2hBUl6mM6641rETJeDz5pw6wHYPDi/FbNkU=;
        b=LWRt98bY44Y52XRW7wmNAB6jzFm7deNUC/PpgZ78QP1QlB3ZTkexYny4EYCnTcWjsf
         WXRh0GPxuUkAGnNrZdJ6dl4qCxObwFUcktvHnufV+83bBzazUzHO1QoatlyGkKW5OiS6
         Ii7xrJDLGNxVGkXOmnSbygIULJhph8g9gMF1A4G1NKj4m7ve9kzxNce0amNO2CUj4+uI
         yW883Jyzt00nWJEhhtuwecRKQ7mBFay7ntQvHsG6W9gV0/J4iqLUix63SkXwqnX5Hah0
         zkiIZpbl6bW1qYN6oKXHYPZmvKMAjHYKkgpPeVs06QvkZy32B3zollDpxCkUoR/79YhH
         iC+g==
X-Forwarded-Encrypted: i=1; AJvYcCWzdTaLQ0JGyfT8EAciAoIMRA+byhzBjp2VsMd3L5i2MLQXDkQMCbnkU56BynHpx9T0ftlwRtI56xYwB+2q0FfsHWsFYWl81ok9NwU=
X-Gm-Message-State: AOJu0Yzn0ebkKWnkqf0GJ5hqx4YT8bV3opEr8TNFZ1odka9JYmF8i35Y
	XMmIXDffxEbb8VafVj404prpTSvPhn1RNCJforRiIYiddddQedU8I01KMnIOavoOz5B1wul86WM
	o
X-Google-Smtp-Source: AGHT+IGeboUs/c/b90bnp2CO6TazhO2bLzxUqB3uAeCN/iOeWl9yRmjEm98YOo+49/4l8Arc5W0CNw==
X-Received: by 2002:a17:906:b14e:b0:a43:6cd2:7bb7 with SMTP id bt14-20020a170906b14e00b00a436cd27bb7mr4381632ejb.47.1710163400110;
        Mon, 11 Mar 2024 06:23:20 -0700 (PDT)
Received: from raven.blarg.de (p200300dc6f010900023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f01:900:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id i26-20020a170906251a00b00a44cb0bf11bsm2861075ejb.79.2024.03.11.06.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 06:23:19 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: richard.henderson@linaro.org,
	ink@jurassic.park.msu.ru,
	mattst88@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 05/11] arch/alpha/pci: make pcibios_claim_one_bus() static
Date: Mon, 11 Mar 2024 14:23:00 +0100
Message-Id: <20240311132306.3420135-5-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240311132306.3420135-1-max.kellermann@ionos.com>
References: <20240311132306.3420135-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function is only used within this source file.  Fixes
`-Wmissing-prototypes`:

 arch/alpha/kernel/pci.c:285:1: error: no previous prototype for 'pcibios_claim_one_bus' [-Werror=missing-prototypes]
   285 | pcibios_claim_one_bus(struct pci_bus *b)
       | ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 arch/alpha/kernel/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/pci.c b/arch/alpha/kernel/pci.c
index 4458eb7f44f0..71495b1354eb 100644
--- a/arch/alpha/kernel/pci.c
+++ b/arch/alpha/kernel/pci.c
@@ -281,7 +281,7 @@ pcibios_set_master(struct pci_dev *dev)
 	pci_write_config_byte(dev, PCI_LATENCY_TIMER, 64);
 }
 
-void __init
+static void __init
 pcibios_claim_one_bus(struct pci_bus *b)
 {
 	struct pci_dev *dev;
-- 
2.39.2


