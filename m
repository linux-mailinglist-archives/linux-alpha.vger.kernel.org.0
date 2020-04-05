Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A58D19ED70
	for <lists+linux-alpha@lfdr.de>; Sun,  5 Apr 2020 20:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbgDESt7 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 5 Apr 2020 14:49:59 -0400
Received: from mail-pj1-f44.google.com ([209.85.216.44]:52443 "EHLO
        mail-pj1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgDESt7 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Sun, 5 Apr 2020 14:49:59 -0400
Received: by mail-pj1-f44.google.com with SMTP id ng8so5510159pjb.2
        for <linux-alpha@vger.kernel.org>; Sun, 05 Apr 2020 11:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+2u8Zi5WKG0LXUGqO/LujvBudiFZlVRinVUlFzRXq1M=;
        b=H6gBPvPFY9gUXO95qHEf5NwE5Kz51xKeXBdSODWb8hcogHSAssIVybbFz7Z16pMAl9
         BwaNhLI/CoR0J673YHjml1JLNgRDy26LUkfwuhGR95qg0US0fwGcRR3tSNsON1LkTeTb
         dY+of8kAPGEedWrV6UYSuVamR1VN9tolZF90tk+K/hCtKfmawuMqBJ6xiQudz48x1NYl
         PLnu12Sr9nHmrgeaNL+DEYgeRHSbxkeHgOwpZCDCimpqe39T63aAdF9U+94/vdyeEEwB
         Bu4yjkXh0l0dBXS915jPQ9AEAiigVyNpsgwJri3plMlv2nNQEOEqWb86R1gDQRn6zJ51
         hciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+2u8Zi5WKG0LXUGqO/LujvBudiFZlVRinVUlFzRXq1M=;
        b=DJ2AiKOmhiHpGWLxJHizLBrJ5ZMVNDFKL0MvgnADuWA8l7httmv90OG5wzaRxkLX2F
         oG+4uSF2NVA4LVaJd2VaSpr+oU0/ECuwv/njRYuUvM2zuIo9MPk6nE9e3xYBf8GID+YV
         Fw3yQiBbQGA4Wi8pfWOjSMgev6U4epFnrq15zfUY1/651j5wzeMVC5+AsbnLnsXNq2zW
         IspU09+FzXdBS0BjY1sF3GC+OdQHlymS4Byf94eYLB0Z+f3rTmFbnvLpdNuPIbOC0bm7
         97AShX5CsG9jqcxa8tyyoWVzJUHglDCHxN99XNTYSyJMAvwSbuehiuolh7YO1wlSTf5z
         rkXg==
X-Gm-Message-State: AGi0PubiyhXIc24fXTdrzJqH6liTGeKBz7wy1h9F5DzyPE3ivcKKSmqA
        VJMKilLAoH2Pc1Jhi9UeMOQUU2sq
X-Google-Smtp-Source: APiQypJQNL/EfOF+98PhJoE3glI5LhVMv1W72ZBGA/KYSGPD87lHafjiN1PsCPRGdgL2OMyXMIf5iA==
X-Received: by 2002:a17:90a:ac18:: with SMTP id o24mr22047318pjq.62.1586112598087;
        Sun, 05 Apr 2020 11:49:58 -0700 (PDT)
Received: from localhost ([108.161.26.224])
        by smtp.gmail.com with ESMTPSA id 132sm10126891pfc.183.2020.04.05.11.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:49:57 -0700 (PDT)
From:   Matt Turner <mattst88@gmail.com>
To:     linux-alpha@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Matt Turner <mattst88@gmail.com>
Subject: [PATCH 5/5] second/util: Remove unused shadowed variables
Date:   Sun,  5 Apr 2020 11:48:58 -0700
Message-Id: <20200405184858.3963582-5-mattst88@gmail.com>
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
 second/util.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/second/util.c b/second/util.c
index 3346823..3469c34 100644
--- a/second/util.c
+++ b/second/util.c
@@ -120,8 +120,6 @@ int main(int argc, char **argv)
     int end, rodata_start, rodata_end;
     int net = 0;
     int i = 1;
-    char sym[256];
-    unsigned int addr;
 
     if (!strcmp (argv[i], "-a")) {
 	net = 1;
-- 
2.24.1

