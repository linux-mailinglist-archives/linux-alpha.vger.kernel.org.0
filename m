Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAC2919ED6F
	for <lists+linux-alpha@lfdr.de>; Sun,  5 Apr 2020 20:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbgDESt6 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 5 Apr 2020 14:49:58 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33273 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgDESt6 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Sun, 5 Apr 2020 14:49:58 -0400
Received: by mail-pf1-f194.google.com with SMTP id c138so6452441pfc.0
        for <linux-alpha@vger.kernel.org>; Sun, 05 Apr 2020 11:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OMzenX4mqVJrFhYZZkTRMlhfVu2Wc0DhKWgmDJYanJI=;
        b=HiXlKjbJMNr/EyuA1+oJE0asKCCH/+kT4NzOvdNmBrhXYR1erCa9+1z5L59vWxriYe
         PUGEHcxqNquXtI35ztMJmecbw2rGabBlVDOSPSnVxPoJ/S74PyHxR3Fmq4vS+llQ+Nw1
         CrvD3K7BYzvUax/kQf7Nca6tXDDc0tephvTqquHVVF/JMU/QZqb3H7mhksuIKh5l/CGX
         2U6k4ttcFxl4lsMH1o4e49DIeooABhEAw3x8aWzkR2UztH//7/XCWviVs2zG5wKoP4OB
         YTR4Xk9Ka0ErlpIoBzCSZKnjAUt+OOI584o6XZtjw8buISKGgnnjmw8ER1N7UKqI32uJ
         lnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OMzenX4mqVJrFhYZZkTRMlhfVu2Wc0DhKWgmDJYanJI=;
        b=NfnnzqUa1HfmFYI3EAihYi/jqwc7IMNRe51Wim7aqqmv00naLFdss2/WXFn7Tz3Adt
         5/oCBBHeJnoXX/fdRX2SmC0h9t5moW+Oeznjg4ijfITUiIJJEbUUuI6/YCUbsw7VRWF1
         7+MJhwE2vfs1yK0s4UV1f9bW7Xe5wgPleVESapImxLpoDJ1GB5BM/O7aXO/vgSvXGlx7
         SA8kSKhm2e2dsmOOz1BSLPwqrDOMmyHgVPOaBhcTEX5lnKJLoblHixjI3TOuLT97mT22
         rgwcMUO3YJwcearxFekWlU1XAOLkOd2cpRFZUjW+565378Af1ROVrpXdrZbqbWDzBUPo
         lbGw==
X-Gm-Message-State: AGi0PuZM9doVkE/zygNXYMgMBkSIvQGuEtyYggmvW12hl8/kaC3zey8A
        QmiYO/7uJDJR+4oDRHQzKHEOush9
X-Google-Smtp-Source: APiQypL/KnKbAkkhkEs2kyHS0vpHwBbb5f58pLuZICc/uQSYyuFfA7zVgStfccPmYRmttSwZ/oljrg==
X-Received: by 2002:a63:2254:: with SMTP id t20mr15133278pgm.121.1586112596736;
        Sun, 05 Apr 2020 11:49:56 -0700 (PDT)
Received: from localhost ([108.161.26.224])
        by smtp.gmail.com with ESMTPSA id z30sm9971223pfq.84.2020.04.05.11.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:49:56 -0700 (PDT)
From:   Matt Turner <mattst88@gmail.com>
To:     linux-alpha@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Matt Turner <mattst88@gmail.com>
Subject: [PATCH 4/5] second: Fix typo'd operator
Date:   Sun,  5 Apr 2020 11:48:57 -0700
Message-Id: <20200405184858.3963582-4-mattst88@gmail.com>
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
 second/disk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/second/disk.c b/second/disk.c
index 40234b3..b81a465 100644
--- a/second/disk.c
+++ b/second/disk.c
@@ -293,7 +293,7 @@ int silo_disk_read(char *buff, int size, unsigned long long offset)
 	if (!net) {
 	    if (prom_vers != PROM_P1275) {
 		    if (((romvec->pv_printrev >> 16) < 2 || 
-		         ((romvec->pv_printrev >> 16) == 2 && (romvec->pv_printrev && 0xffff) < 6)) 
+		         ((romvec->pv_printrev >> 16) == 2 && (romvec->pv_printrev & 0xffff) < 6))
 		        && offset >= 0x40000000) {
 		    	printf ("Buggy old PROMs don't allow reading past 1GB from start of the disk. Send complaints to SMCC\n");
 	    		return -1;
-- 
2.24.1

