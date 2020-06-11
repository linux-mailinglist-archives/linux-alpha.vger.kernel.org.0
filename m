Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2921F5F4B
	for <lists+linux-alpha@lfdr.de>; Thu, 11 Jun 2020 02:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbgFKApa (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 10 Jun 2020 20:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbgFKApa (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 10 Jun 2020 20:45:30 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16579C08C5C1
        for <linux-alpha@vger.kernel.org>; Wed, 10 Jun 2020 17:45:30 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a45so2536501pje.1
        for <linux-alpha@vger.kernel.org>; Wed, 10 Jun 2020 17:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CGRnUIreoLTBDb/yvpjHmHR02mw68n2dnzxC4vEtTes=;
        b=WHwJyCnfpWqepOjSduVWbz4+PssN6zFkBBfuV0v8kVDf8yJwFuWqjzPxoQjUzL5Qz0
         AkdxLMPdeBeJEYHztLJo7HS2MN2A5m8TfXvDTjdgl36Z5OaziSHV6G1kXgv4jvT5O2MF
         3IEjMCPGIa2N/5252MDG0/8EWGAZFGQXWwk4DEZauFUjAl3EFMGnjG688YoZGgxBe83j
         8GTQCOpyv4yBfAuJPEHI+iGfdsHwhzRlFNeCuhALm9QdYTMF/Q9cRC2CRphTo0vYRsuc
         pCrTNxq6dBGo2y2Tsozq4+4JK04iqTg7z3SFc0ZJvkwsMkTPA6LgRUj4sQ0qBw5xIH6O
         sSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CGRnUIreoLTBDb/yvpjHmHR02mw68n2dnzxC4vEtTes=;
        b=iONqnAKQjEEHKWVG+8CkPwFqapg2mfiGSKlkjUlUBmc/XMRzyh94aimdthn1wa+F5G
         qrV21LKGwV2QfZ9hEG67q6fKeZb22OERW6Tg2xruVMfziptTg5J7y97IIsuHiHfI1GME
         0tA/OekN6dAiHyGRCIU5fKpNO6a9snl/aHyvs8Jnssac4vMsfqPHCuCUuidvM30MzPVL
         PLH/slNHP/UbfgfVdCNNLyfbhsAormITonAZL5N0Y6r2EOsgq+FGjCrN9A0Ix/9J101C
         D8vvyfDBDcG9oz5SZf/YAbaLMWLGCkIEKJ1zo5lJfr5zJTHWzDurmyFke5R39Fl+YT7y
         ZzuQ==
X-Gm-Message-State: AOAM531GB0Kn1ZLUGhsGvDg+lDR8WB6KOnOAtAmrCMKHdKjWWli6IN5t
        21y6eTFAI4BVdPINwGRox7Cj0kMh4Ww=
X-Google-Smtp-Source: ABdhPJwhYvWQzToHF1TPyvn2tAzc+abw66/8zuV1vm+hLNWEpvzcBg5B+HQAGUcQngDGaGSGttgSNg==
X-Received: by 2002:a17:902:7403:: with SMTP id g3mr4722784pll.342.1591836328957;
        Wed, 10 Jun 2020 17:45:28 -0700 (PDT)
Received: from localhost ([108.161.26.224])
        by smtp.gmail.com with ESMTPSA id u12sm798899pjy.37.2020.06.10.17.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 17:45:27 -0700 (PDT)
From:   Matt Turner <mattst88@gmail.com>
To:     linux-alpha@vger.kernel.org
Cc:     Vasily Averin <vvs@virtuozzo.com>, Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: c_next should increase position index
Date:   Wed, 10 Jun 2020 17:45:18 -0700
Message-Id: <20200611004518.1433720-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index f19aa577354b..0964f373c4ba 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -1412,6 +1412,7 @@ c_start(struct seq_file *f, loff_t *pos)
 static void *
 c_next(struct seq_file *f, void *v, loff_t *pos)
 {
+	(*pos)++;
 	return NULL;
 }
 
-- 
2.26.2

