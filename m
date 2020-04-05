Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 231A019ED6C
	for <lists+linux-alpha@lfdr.de>; Sun,  5 Apr 2020 20:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgDESty (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 5 Apr 2020 14:49:54 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41932 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgDESty (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Sun, 5 Apr 2020 14:49:54 -0400
Received: by mail-pl1-f193.google.com with SMTP id d24so5001839pll.8
        for <linux-alpha@vger.kernel.org>; Sun, 05 Apr 2020 11:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vukA4BCy8hPLxpxj8As00UZ6jZyoV8t8UgBtm7ruucc=;
        b=klDvP2nakMe1uERBpsXPMZHIwxdoQJbVtLutHMYhtFx7Q3GtCyorDvYb1RQySlN5xn
         vQP+t5KbtRfKu+ayYat2Kmnowz5S+7ozLQcrRuNf0fe3tafn1ILCYgrHOfxNXacY4Psu
         j1yeDlEjhh1yJTLOffidg9owsJBN/dN6mZAkYRKVpp4XAsbW3kZ3gArMcJuSAZR+FlL9
         kT+Mk+3NtIONJz8Eodt4ZKRskkaLgAjv2isRU8cdaKKPlaU7aAtbyS31xRpvrPEhRJs/
         3nd7vF9So4E2hnABP77/YpJdbS4fgXD7YoPFlIowxxAvZzvicMhsjuGUh2zVIDjM31Au
         n4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vukA4BCy8hPLxpxj8As00UZ6jZyoV8t8UgBtm7ruucc=;
        b=UB0qyhxAoONqhtPY7vHsFgCxRYSLjeRwLpP5Vl97AxINpVqMFZKf/Ay6pR4PLP/Q6M
         yWcXVwq/0b3M6qfrk991+uJCcvWWGHzqt71Vebm+PCzZbPurODmnau5TV5C3e4vouuJL
         SxEuN+cmIQJcfRg2jTraDv0l3DgmhMybpsa5LvkAR/2X5SaKZursFMcWr1+XkZOOI2pQ
         xtN7mm87mnOV2FqXbR3BN44HHI1wf8xH4n+zVRkbMB4VOKW0HjJmvYfNK6VPDgYeQ1Or
         F56i7HE6bszrxC4txbrZxpaaRjJmaNML9Udmi76Y4xvebTFEY3OAZEyMYDJ5qjb7KhI2
         OAhw==
X-Gm-Message-State: AGi0PubI1I/OkpgKoHz4CQIBUQhM7ai+4Ymehhlks8dG0LEYFC2bWkmw
        IzMWs/y9UAxQHIoNgnjML2gbRU3L
X-Google-Smtp-Source: APiQypKlz5HQuUKRGGEFVK2ZCInPVyIjPHCT3+qKiOJw/l75vzLrQJCi5CRHkd6QKfczdPruX7P8mA==
X-Received: by 2002:a17:902:be12:: with SMTP id r18mr17807384pls.303.1586112592330;
        Sun, 05 Apr 2020 11:49:52 -0700 (PDT)
Received: from localhost ([108.161.26.224])
        by smtp.gmail.com with ESMTPSA id mg20sm10492639pjb.12.2020.04.05.11.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:49:51 -0700 (PDT)
From:   Matt Turner <mattst88@gmail.com>
To:     linux-alpha@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Matt Turner <mattst88@gmail.com>
Subject: [PATCH 1/5] silo: Build with -fno-PIC to reduce size
Date:   Sun,  5 Apr 2020 11:48:54 -0700
Message-Id: <20200405184858.3963582-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Otherwise the resulting image will be too large:

| ./util second.map second.aout second2.aout second.b second.b2
| Distance between two changes larger than 63K 3 84553 0

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 Rules.make | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Rules.make b/Rules.make
index 0f176db..3d0efe7 100644
--- a/Rules.make
+++ b/Rules.make
@@ -19,7 +19,7 @@ cc-option-yn = $(shell if $(CC) $(CFLAGS) $(1) -S -o /dev/null -xc /dev/null \
 		> /dev/null 2>&1; then echo "y"; else echo "n"; fi;)
 
 CFLAGS = -Os -Wall -I. -I../include -fomit-frame-pointer \
-	-fno-strict-aliasing -DSMALL_RELOC=$(SMALL_RELOC) \
+	-fno-strict-aliasing -fno-PIC -DSMALL_RELOC=$(SMALL_RELOC) \
 	-DLARGE_RELOC=$(LARGE_RELOC)
 HOSTCFLAGS = -O2 -Wall
 
-- 
2.24.1

