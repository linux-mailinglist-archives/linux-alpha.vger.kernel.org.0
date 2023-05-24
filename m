Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD46170FC77
	for <lists+linux-alpha@lfdr.de>; Wed, 24 May 2023 19:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbjEXRSi (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 24 May 2023 13:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbjEXRSh (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 24 May 2023 13:18:37 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 706EA93
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:18:36 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64a9335a8e7so53655b3a.0
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684948715; x=1687540715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ncto795Pkenn5ADtTHrtUXOk59yhvX99AT0T/piavMI=;
        b=JTONNMSFtHFzYhwb9qJBuZdT7SpQESQepxPn+Q9M6cly+DItAU12yQdflWx+9/ouv+
         mDeFzYIw/YYKtRQMDVV/Yzf/8hSxRvluGyTIOrR0DVoLRUP3xy9TxPBhugP2ktsz40dh
         ngnh0/XzTvxuEEmCJj3ZaWjAv7/0E3D9ojJ7ISKpcb8cQQTWz51X335oSoKTXHZUnfSE
         h7C/dja+JpMsFcfRapPk9D3xmAiL7YiC/UxXuZ0DvGIHeDrBdtmvv5E0O2z4hlOVATLv
         A4KIwCeR+wy39yiyUcS1f4KbAZLrEA9KjRZdkT2FjV5z0kI4u5eMVzadLMn8j7xrdaeJ
         xRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684948715; x=1687540715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ncto795Pkenn5ADtTHrtUXOk59yhvX99AT0T/piavMI=;
        b=Q5MDUjLCJvLBBeMrE+/YN6iq4y/s09AucrgOAaKmF9bzIAxy6QD/SEGl1IN/A1rhmb
         HZ/74LQnL+J33xNVaAoFxRtlyMJqc+TOCcOZDSXgyIjEezRnrkyd+MPM3dBG1l5xA6oQ
         jW2eR3iymZ5xKxt0o4ATdBSa0ciClUXBqB5LqhMf9Zj+AZZS+g903tl9lmkKsRpHx2un
         M8EeQ51D76moEwrR4rqxVdfXvo/LDY23xxo4WUe+scrfmy/zu0yk+2wnwKBXVQb8/3w1
         u3M4OpZeMFepYIPPJMnFt8JYbocedhe0ydwudQTQZwekgw4vz722QXvC2bsWURlG7tAA
         34rA==
X-Gm-Message-State: AC+VfDzJpeCQSuT9KE/OhF1rD9RBdP1foj/8QcsmZGEpLghbpi8XN1WC
        3X8jmYCAoucSBJe4G7D7Dcu3O1ahEwQ=
X-Google-Smtp-Source: ACHHUZ6G5QgCq4FsYnS7crYfDQghT3ubJdoMqMGuFtikxe9ylJ4bp390IqaEhd9YA8Ffs/y1rA5HPw==
X-Received: by 2002:a05:6a20:6a22:b0:f0:50c4:4c43 with SMTP id p34-20020a056a206a2200b000f050c44c43mr142624pzk.5.1684948715353;
        Wed, 24 May 2023 10:18:35 -0700 (PDT)
Received: from wheely.local0.net ([220.240.241.243])
        by smtp.gmail.com with ESMTPSA id p18-20020aa78612000000b0063b7c42a070sm7698643pfn.68.2023.05.24.10.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:18:34 -0700 (PDT)
From:   Nicholas Piggin <npiggin@gmail.com>
To:     linux-alpha@vger.kernel.org
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [RFC PATCH 0/6] Implement MMU_LAZY_TLB_SHOOTDOWN for alpha
Date:   Thu, 25 May 2023 03:18:16 +1000
Message-Id: <20230524171822.177133-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hi,

I started looking at alpha TLB flushing a while back with the aim of
converting another architecture to this option. powerpc has fairly
complicated MMU and TLB code so I thought it would be good to have a
simpler reference architecture.

alpha had SMP QEMU support, TLB flushing that's fairly simple, and it
doesn't use mm_cpumask in a complicated way, so it fits.

These patches work for me, but only tested on QEMU so that's not saying
too much when it comes to race conditions, so some healthy skepticism
is recommended.

Any thoughts about the series would be interesting to hear.

Thanks,
Nick

Nicholas Piggin (6):
  alpha: remove extern inline from mmu_context
  alpha: implement simple mm_cpumask TLB flush filter
  alpha: remove TLB flushing mm_users special case
  alpha: clean mm_cpumask when flushing TLBs
  alpha: enable MMU_LAZY_TLB_SHOOTDOWN
  alpha: shoot the lazy tlb mm when flushing TLBs

 arch/alpha/Kconfig                   |   1 +
 arch/alpha/include/asm/mmu_context.h |  43 +++++-----
 arch/alpha/include/asm/tlbflush.h    |   3 +
 arch/alpha/kernel/smp.c              | 120 ++++++++++++++-------------
 arch/alpha/mm/init.c                 |   2 +
 5 files changed, 94 insertions(+), 75 deletions(-)

-- 
2.40.1

