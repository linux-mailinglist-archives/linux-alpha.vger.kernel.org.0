Return-Path: <linux-alpha+bounces-276-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1D8878081
	for <lists+linux-alpha@lfdr.de>; Mon, 11 Mar 2024 14:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79C791F20F29
	for <lists+linux-alpha@lfdr.de>; Mon, 11 Mar 2024 13:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FFA41232;
	Mon, 11 Mar 2024 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="JL1wkBGY"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A7240846
	for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 13:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710163406; cv=none; b=tFumT0fUaWeJvoMXR2pH5/4xmj2DoGfdClkmPZPb48EFYssSq+LLVUsGoWSwzJe6egg95F4Ryy9AddOazi3842z3TuILV6Vx7v14m09Ps9gfe6AXzYJRO3A8EEeHkKQvAobsQ0icNySJQeulJ3UyUR8iPaerY3u2kLuig/y2MQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710163406; c=relaxed/simple;
	bh=3tyYmXiWAM/q5HVicUkqXvu+N4NisQr6T3xjXABkdy4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fgxaUEd3cJiZs4JEvzmnP31i55LFGTrEIoi+U/RX+2M9Kga3UJdKcJ/FsEqjrr7LCr5dXHKRhFwEv+MfgG+cSoJAhjCAjGHEfl19kvbKFoaV8ahejewzSS48WlS0aD5a4WIoS24pi+eXdD0KDrfpizxuyP6oKmVam9cIGPdKT8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=JL1wkBGY; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a460185d1a7so242127466b.0
        for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1710163403; x=1710768203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t0NAN8QitndA7AWWVE6RWeZPaPNMsbNUKpFN+f7Kdg=;
        b=JL1wkBGY6cADk5Vl6LLarqvBbQ2fZtv5D1sj87Ta9LggH4x8vliY5y8DfLmZFkOh82
         cCYbcw7PrVO0UFlM0ik3Pw7sSJh0DnvZy+AZOypN18KO0AUKGipGnDVVc3l2pxF/LKXh
         8q811jYeh3v2bP4Usx4BaBI7033qA9iSPqBjEi/jYtSEB4u20LfX/ASHmSiPAYPgvIhW
         8t/4fNWhYKkEG2rDXuuainrdRFS0xsJr/bNUQ/Vqvy/tOrO3bP/XwbDszf8a+k4KwG52
         q1fTxutuSbsKIyqHtnlFbcPl33jY5pgWe/L6sgHdhj6lre5wYB5qFS7tqJN68mAdjYmb
         DBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710163403; x=1710768203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+t0NAN8QitndA7AWWVE6RWeZPaPNMsbNUKpFN+f7Kdg=;
        b=rSS5H4NhoyaWSEQVdhnNsLDVB7QhmLpbBK2geVZ7OaNvgWZNmgkFFAE9MAfMPhMssd
         12GgPDmWrPrDkgUPrhBWNthirUVBD9ByF2YWuOUKS6DjTSVmfi6Tmg47+nVvGsHUj2x3
         eaaoJXMVVU3nn0vZ4MTb6p1QQk9ZcUBLXksqIADcoFJabIomDnPru/pbZFOYEUqSoOOr
         AsZc50l+cWyprlDVAfTM0hVbZWS8oybyvRozFpI3qa9RnbQiDKAXUDoogNoRBYI+gtsx
         LkYt2Dno75yRWPwZfYXLgR/+TGxvYxsPcUZOt/hB+Xz3UyGrdbo6LFmvmN9JgncsMfMh
         Zp+A==
X-Forwarded-Encrypted: i=1; AJvYcCWBkJMMC8cScFK1oQv0ZKLjwVPYOf3SW+N/zlTkFTzlu15FuG6v+xUWf9Oa54ANTAdWzhDw9IR9P2pS1Dn12RcQSk/MtJTGLZS0/d0=
X-Gm-Message-State: AOJu0YwPi1F2xx9LIg4eT5OrCAtGYXmFW9SNvN29bEnJyyXAvP1JjBWE
	g1ON3DUC0SmuOHYxPr5E+nQ/GWDHzZOEsHRmGbZ4jSg4i+iqc1VGZIvBQaz+jro=
X-Google-Smtp-Source: AGHT+IHoU7VjL6i6NUg22SF3l8kTO+bIkiVcclef3Kx1yn0C1QBWfKLE1hOzGRqyswmSb69Q5pVi3g==
X-Received: by 2002:a17:907:7898:b0:a45:119e:3dec with SMTP id ku24-20020a170907789800b00a45119e3decmr3972814ejc.73.1710163403282;
        Mon, 11 Mar 2024 06:23:23 -0700 (PDT)
Received: from raven.blarg.de (p200300dc6f010900023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f01:900:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id i26-20020a170906251a00b00a44cb0bf11bsm2861075ejb.79.2024.03.11.06.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 06:23:23 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: richard.henderson@linaro.org,
	ink@jurassic.park.msu.ru,
	mattst88@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 08/11] arch/alpha/checksum: add missing includes to fix -Wmissing-prototypes
Date: Mon, 11 Mar 2024 14:23:03 +0100
Message-Id: <20240311132306.3420135-8-max.kellermann@ionos.com>
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

 arch/alpha/lib/checksum.c:45:9: error: no previous prototype for 'csum_tcpudp_magic' [-Werror=missing-prototypes]
    45 | __sum16 csum_tcpudp_magic(__be32 saddr, __be32 daddr,
       |         ^~~~~~~~~~~~~~~~~

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 arch/alpha/lib/checksum.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/alpha/lib/checksum.c b/arch/alpha/lib/checksum.c
index 3f35c3ed6948..66cad8354a44 100644
--- a/arch/alpha/lib/checksum.c
+++ b/arch/alpha/lib/checksum.c
@@ -10,6 +10,8 @@
  *	Rick Gorton	<rick.gorton@alpha-processor.com>
  */
  
+#include <asm/checksum.h>
+
 #include <linux/module.h>
 #include <linux/string.h>
 
-- 
2.39.2


