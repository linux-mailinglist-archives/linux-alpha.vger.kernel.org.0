Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCBA4F4FDB
	for <lists+linux-alpha@lfdr.de>; Fri,  8 Nov 2019 16:36:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbfKHPgR (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 8 Nov 2019 10:36:17 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41846 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbfKHPgQ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Fri, 8 Nov 2019 10:36:16 -0500
Received: by mail-wr1-f67.google.com with SMTP id p4so7521073wrm.8
        for <linux-alpha@vger.kernel.org>; Fri, 08 Nov 2019 07:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=9lMgRNG2cJGG8AVeRQHErI9Gl3XI9KK/U31d8R3ejsQ=;
        b=EWNepT2WAfQMuRY60vzjXFgqPnRfaJU3DzL/cj1ATfS4TGT6MpPVYa3DtzO31+GY9U
         vlzIMrIyyXu3srvKdjem8uigYtg+lTS+x/T92CG9/SBuSyIsS7RYo8uBBuyvyjfoLeWW
         yZqDgtQmGMf9uk3FfTgemAWGIAqlBkVUFBC42XPIuVhMbttBjDtbaKjx6ken+aS2hDMD
         tz0emFkFCXwHC3dp3nQrWR561uI8jBBybT0ovHdWIZ74nV7TVtQf94Vq7sJf1TXcxcv1
         OL3LyD1xu/P6yHHnz5cWE6OqYBXaE9mm3K3xUEzwELESrCEGVlic3EbtfcYcZn2x1NwQ
         ot0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9lMgRNG2cJGG8AVeRQHErI9Gl3XI9KK/U31d8R3ejsQ=;
        b=uOOMs2lsGU4aSGtAS1vm3dOkbob9Am2LBHj5RDFuRG5FCB8D0hp4Av/JIQS9UiWYRZ
         /tmONG61+OIdYP6EqcRvlwKhJ7m1QHuh51tlc9sbuGTOPPSHtikbWiRM2CzMmfuoijzB
         s41LoR0ET2vRJi9YjBF+nmRGMj5ENN8fPRwW9TPBW/dqzCdaY4caeJWSVD7C0HIamQTL
         uuNR1ASRWexGv/QfxfCGcW53DoKcFFUFS+NC6dCpEfnlfNzQ4VTQ5DME4szFTtn6YmHK
         s36ZH/Nk78rdomaZ0M+N/v6oa0KPLFivcw5HD58z1XYUTaAJY+ppqOByCpaJNicdonhI
         HU/Q==
X-Gm-Message-State: APjAAAVMK4yYQBT86BV9C2FBy8hPbLuU6H/Zf9F3qAAim/vKVofDAP1s
        VTsnGDfiUqn/2mwunqdNyfvk/Q==
X-Google-Smtp-Source: APXvYqwWS/q1mGxIc2fbqY27w5J8g01MN+wCCoW1rgz0kKv0EGBVn7dxIb2E7BSFHsFLrS7qaNJgxg==
X-Received: by 2002:adf:e712:: with SMTP id c18mr8638572wrm.127.1573227374707;
        Fri, 08 Nov 2019 07:36:14 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id z6sm7422500wro.18.2019.11.08.07.36.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 08 Nov 2019 07:36:13 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     ink@jurassic.park.msu.ru, mattst88@gmail.com, rth@twiddle.net
Cc:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] alpha: __udiv_qrnnd should be exported
Date:   Fri,  8 Nov 2019 15:36:08 +0000
Message-Id: <1573227368-32686-1-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

When building an alpha kernel with mpi set as module, I hit this build
error:
ERROR: "__udiv_qrnnd" [lib/mpi/mpi.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:92: __modpost] Error 1
make[1]: *** [Makefile:1266: modules] Error 2

This is due to __udiv_qrnnd not exported.
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/alpha/math-emu/math.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/alpha/math-emu/math.c b/arch/alpha/math-emu/math.c
index d568cd9a3e43..5617ac0889b8 100644
--- a/arch/alpha/math-emu/math.c
+++ b/arch/alpha/math-emu/math.c
@@ -401,3 +401,5 @@ alpha_fp_emul_imprecise (struct pt_regs *regs, unsigned long write_mask)
 egress:
 	return si_code;
 }
+
+EXPORT_SYMBOL(__udiv_qrnnd);
-- 
2.23.0

