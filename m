Return-Path: <linux-alpha+bounces-271-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EE3878078
	for <lists+linux-alpha@lfdr.de>; Mon, 11 Mar 2024 14:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67E1C1F210B1
	for <lists+linux-alpha@lfdr.de>; Mon, 11 Mar 2024 13:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFA13FB2E;
	Mon, 11 Mar 2024 13:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="WLwuZdnV"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439DB3D551
	for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 13:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710163401; cv=none; b=d8pCsbdtHjwyDf3snxsBcpXHzB8YBBs7NDoRnmHxEdjnHOj15aXu0U8rWvl3u+BhvOxambXzU2wtBCU0HM78+Sj+3+RwjVIEM1FVgaUePMuIBm9ccsxQ6pNr3aep+O6sxJL7B8B2/XbCUlw++AGaqBY3ZGumttiLFD34Vh3ABpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710163401; c=relaxed/simple;
	bh=uf4SxEIdL1Lu/utlwEEAC3EeK1jRVpaGltn8ifMkXDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GfAtszDQdaxNz+0L2djkmTEwrryaqMOjGmjkVLnxVahPEumUH07ukN0BkmTVM7T8Qg60M6nyMOA2JL9g5ahlyyUbs8qL+PNFOp4VRiaOOMW07D52ekrNI0HksxZpGRlK6JPDIZehnh515y0zZC1JZW6ondGUIiNPqgaouP7wQbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=WLwuZdnV; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5649c25369aso4025477a12.2
        for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 06:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1710163397; x=1710768197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WV3RC9oJAgPDXMxvyWwipVZFW4SYNnqtCmgosdQ7RuY=;
        b=WLwuZdnVKTr2+9r6ki3NvMPjZ3fTfJOY9Z7hhOutetmADkoGfRYKkHJtbR8A4SqkC3
         EXj3JGE60GIXQlHp+X0dST5OQv2NokeuLfe+M8Pd8UnJ2A8IcUlOjoEU905VlIVcw8Jd
         iiEJttQI50w+lTBwiF0Uv4wsNXLkB5S11Eiq1wElAJRXuc062Dtfch6NiXa+DukLezOj
         SKLCUI7ieRF3Hy9KMxmIOJhbqLxSBPF+is3f7GSNVoztj0gRaNpZdKu6vM65Bc+yfZT/
         22X5XfbMepCQy8BSGpetBL4iUctlf7mPduSy/NOaibJcEoXFZm8iqwMMxqBezM0/4ZMj
         D6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710163397; x=1710768197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WV3RC9oJAgPDXMxvyWwipVZFW4SYNnqtCmgosdQ7RuY=;
        b=BhdHBkrVXHCRK6OA/QAhZY9EbUjjvuhWiK9goBQqhF74LKmftkN1EkLXvh8aDO2JXu
         hEEKuyZ1+YbBK5fQ3C/PPYMd10OtE3DgtIguUpv4GtKNQPMOGSq/9hNTxvCa32hSs+0L
         V4iVJeFZV/4rMPOWzHJOr0ag5tKR8Qz7YRo7Wc20GrugrRY7H+xgtRUc/4Dq1iuszWPZ
         uf84LoyNyOv2DgbJ63sNtUHA3pVSDAXyG+eW60UiW8cZBqaKgKy2P6UMG2kEXJCx4uvd
         kaaNFmaRjsgpuqT+JYAorbE7Rqg5RdNQ8AhGYLu0YKExdqNE8MDtKUyXjV64++j5vZ9C
         yn6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVULvi+ThOF4Y1ILuWgHw5fYSYmHa39d+A67qBw6B4pRmNu2R9d1K5SaT/K6TF3p4YJCm7MtRSLN0bpm/MoHcFqrCLa66PAOTv1Aqc=
X-Gm-Message-State: AOJu0Yzqb5kLj7tKvq1tfHQP8VsJW4TU7YqNPZUpamf/zXLiWadTAqaP
	GdalzBUD9fAr6YlfEtLncnsJk7fJBeK00JVw6lLYQ/qDawWTA7nM3HXx97vCkFc=
X-Google-Smtp-Source: AGHT+IGM9lZkvmnB5kyNy4XysPJgcR1bqsR3sGlD4kZp4t3GQffZZ1XMuz8VhcjtZodpAYqTvZByew==
X-Received: by 2002:a17:906:a085:b0:a45:aef0:c449 with SMTP id q5-20020a170906a08500b00a45aef0c449mr3039305ejy.39.1710163397673;
        Mon, 11 Mar 2024 06:23:17 -0700 (PDT)
Received: from raven.blarg.de (p200300dc6f010900023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f01:900:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id i26-20020a170906251a00b00a44cb0bf11bsm2861075ejb.79.2024.03.11.06.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 06:23:16 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: richard.henderson@linaro.org,
	ink@jurassic.park.msu.ru,
	mattst88@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 03/11] arch/alpha/bugs: include <linux/cpu.h> to fix -Wmissing-prototypes
Date: Mon, 11 Mar 2024 14:22:58 +0100
Message-Id: <20240311132306.3420135-3-max.kellermann@ionos.com>
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

Fixes:

 arch/alpha/kernel/bugs.c:19:9: error: no previous prototype for 'cpu_show_meltdown' [-Werror=missing-prototypes]
    19 | ssize_t cpu_show_meltdown(struct device *dev,
       |         ^~~~~~~~~~~~~~~~~
 [...]

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 arch/alpha/kernel/bugs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/kernel/bugs.c b/arch/alpha/kernel/bugs.c
index 6a16559c1a8f..d6ee9a30698d 100644
--- a/arch/alpha/kernel/bugs.c
+++ b/arch/alpha/kernel/bugs.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/cpu.h> // prototypes for functions defined here
 #include <asm/hwrpb.h>
 #include <linux/device.h>
 
-- 
2.39.2


