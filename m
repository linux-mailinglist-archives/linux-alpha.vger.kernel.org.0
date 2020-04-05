Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA9A819ED6E
	for <lists+linux-alpha@lfdr.de>; Sun,  5 Apr 2020 20:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbgDESt5 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 5 Apr 2020 14:49:57 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36336 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgDESt5 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Sun, 5 Apr 2020 14:49:57 -0400
Received: by mail-pf1-f196.google.com with SMTP id n10so6443971pff.3
        for <linux-alpha@vger.kernel.org>; Sun, 05 Apr 2020 11:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N+5xtB9gijt0AIzDLP8WDiG6Mdj5tsb0toFgxnvnpVc=;
        b=ayTEyZihrLZFoMmN9PPXdC2MK0saCpGUWJ95mwNcg1eXVDPFH9Eiq5wyQxDve0cmV8
         9ol0uU1Pl8B221RBUapBp0Jpscut/+0IU472v2y1tIEmSVQGjv2I9vHo9FZYQvGAVKXN
         kbxPksUYntxVO/uPK97iq6vXW7GOu3QizGgjL9h32PBOyoLvWZAH2hicgO904EWRW8vo
         cNGoMT/FbCppQmKCq7CwhquGObQdXyv3U/pHw3dQTPmqmh/yUI+yaUoQ6A011fp8bxo8
         JgBsMrad1Uq33V7BQgoS7VCc5c19fVFiLTQ2w5rQGKfz2IR7hb54994F9ma3qqoBhOxS
         wlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N+5xtB9gijt0AIzDLP8WDiG6Mdj5tsb0toFgxnvnpVc=;
        b=rFzyl0O/4NK4fxXoPKNZhi8GAt9q2oowaMHZ+uNBjXCVYg1h8cNEOrsuQ6XT7Rj3se
         9X0tXVti0WQLmYvB8vv93lrdH8Qjodib8dK8pvI2HEUD7GmSzhl+vCubzhDKm4gLmCR0
         jDEatANIysncI9nc6v4nzhMat7PHXM2uQMiTfLWFnD3sb5Xit20tbN/ShTCkvcJZHwCj
         x6tu9y1NQgBe8gefqQYoQkVx9op6U1/y15P5Tk7ORTxSPKMjSN2rB93/RhU6K6berpKh
         ER/kDAWfov8hNEeZ53CS2BfQO7VeMBQWb6oLovWgV/dBs4+3ungkBG2h9ikJtl0k06pZ
         YC4w==
X-Gm-Message-State: AGi0PuYupkhE8tyFSI5PLOSczecZFV+bhw3Gd6gsbo8dQNo2H5ohbYlD
        fc9K9drU1ZEVchP49lhIhEpEQMfr
X-Google-Smtp-Source: APiQypKNQCcUGZ4Y9fj0EjAN1f5a3a8H2JSrRdx2kqJ65hJSeneozmN/IM/mdt26FHxauq4X2xUGPQ==
X-Received: by 2002:a62:1e83:: with SMTP id e125mr18324206pfe.264.1586112595312;
        Sun, 05 Apr 2020 11:49:55 -0700 (PDT)
Received: from localhost ([108.161.26.224])
        by smtp.gmail.com with ESMTPSA id 25sm10481053pjg.35.2020.04.05.11.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:49:54 -0700 (PDT)
From:   Matt Turner <mattst88@gmail.com>
To:     linux-alpha@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Matt Turner <mattst88@gmail.com>
Subject: [PATCH 3/5] silo: Fix misleading indentation
Date:   Sun,  5 Apr 2020 11:48:56 -0700
Message-Id: <20200405184858.3963582-3-mattst88@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200405184858.3963582-1-mattst88@gmail.com>
References: <20200405184858.3963582-1-mattst88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 common/stringops1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common/stringops1.c b/common/stringops1.c
index 08ed4be..6edac96 100644
--- a/common/stringops1.c
+++ b/common/stringops1.c
@@ -74,7 +74,7 @@ int strlen(const char *s)
 {
 	const char *sc;
 	for (sc = s; *sc != '\0'; ++sc);
-		return sc - s;
+	return sc - s;
 }
 
 int strncmp(const char *cs, const char *ct, size_t count)
-- 
2.24.1

