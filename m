Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD61A20BC84
	for <lists+linux-alpha@lfdr.de>; Sat, 27 Jun 2020 00:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgFZWbj (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 26 Jun 2020 18:31:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22923 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725909AbgFZWbj (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 26 Jun 2020 18:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593210697;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QX5XNFqam9mdd/6wKfca40oUCGNepMLO5UWfniIypyY=;
        b=K2pxyPtKjI2LOKtBjEkzn/0i4u/8Dl0/r4ooqcrCVcv/hRgrRD4rssQEO2rYjaURVuYgWo
        Ok645+UCgu1GsnbxGWu5uNUs5XoNrh9PpMAFSK2DV780TBnCHNmh6UZLiTbqewEIS5PS1x
        nc0dAdwop8JqDZ09LIYDFP+uSmmoVtQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-hp9WykBZNNag02FT3-kGCw-1; Fri, 26 Jun 2020 18:31:36 -0400
X-MC-Unique: hp9WykBZNNag02FT3-kGCw-1
Received: by mail-qv1-f70.google.com with SMTP id g17so5599085qvw.0
        for <linux-alpha@vger.kernel.org>; Fri, 26 Jun 2020 15:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QX5XNFqam9mdd/6wKfca40oUCGNepMLO5UWfniIypyY=;
        b=H/sp/mRLraogCyLLlWnlxE6GDx0IL/NrPZ4U51vd8pLkKK7tPfGezUa0KrsA41YTlS
         9rN46TuXmGfo05/KSH3XzcTWTRVS3Djwat++NIjbey2ZM3KxrsJtWfa4FooVy5GTQJbb
         GkSU7A0b6h+C16JGzGR0qLCS15oKoST3oyJkHPBCLWg//FVDygwiabL6c+/i6sN39Qxq
         onKQMqBitSG21326Z1f36fpJuwaRj8cgt3XNhb5ghjMjQTcLXCr6gdr2OLDdw9v7MyIR
         WeTdfe+4JzpzKm04q6ysclw3YZtYrt/GFKDL64VOIgc4z4/k98zucpOHsl86z5FDx6Xo
         /fOg==
X-Gm-Message-State: AOAM533370J5uTyP1sX/ISHx9gZWsCB0ifn7P8QwEWjOtjBLdBFPeyhn
        c6ExjNa7SGlG0mAUyzOEMuhx3mryYjYilomo9Zu6aCn/kMjOdXOaaeQiX7riQ94ffZOqr+tQHq5
        /FuyCmNJpS4TPvYZGHwQEWsg=
X-Received: by 2002:ac8:2201:: with SMTP id o1mr5258769qto.68.1593210695573;
        Fri, 26 Jun 2020 15:31:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7yWTEPryaGHfpSKL2GWGcCnPfmI9k8i2GBPufBTdDPbzspX0WX/DcpjvFiBdcbf/0mG7GHQ==
X-Received: by 2002:ac8:2201:: with SMTP id o1mr5258746qto.68.1593210695355;
        Fri, 26 Jun 2020 15:31:35 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id f203sm9903311qke.135.2020.06.26.15.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 15:31:34 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Will Deacon <will@kernel.org>, peterx@redhat.com,
        Michael Ellerman <mpe@ellerman.id.au>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Subject: [PATCH 02/26] mm/alpha: Use general page fault accounting
Date:   Fri, 26 Jun 2020 18:31:06 -0400
Message-Id: <20200626223130.199227-3-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200626223130.199227-1-peterx@redhat.com>
References: <20200626223130.199227-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Use the general page fault accounting by passing regs into handle_mm_fault().

Add the missing PERF_COUNT_SW_PAGE_FAULTS perf events too.  Note, the other two
perf events (PERF_COUNT_SW_PAGE_FAULTS_[MAJ|MIN]) were done in handle_mm_fault().

CC: Richard Henderson <rth@twiddle.net>
CC: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
CC: Matt Turner <mattst88@gmail.com>
CC: linux-alpha@vger.kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/alpha/mm/fault.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index 82e72f24486e..2e325af081bc 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -25,6 +25,7 @@
 #include <linux/interrupt.h>
 #include <linux/extable.h>
 #include <linux/uaccess.h>
+#include <linux/perf_event.h>
 
 extern void die_if_kernel(char *,struct pt_regs *,long, unsigned long *);
 
@@ -116,6 +117,7 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 #endif
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
+	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 retry:
 	down_read(&mm->mmap_sem);
 	vma = find_vma(mm, address);
@@ -148,7 +150,7 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	/* If for any reason at all we couldn't handle the fault,
 	   make sure we exit gracefully rather than endlessly redo
 	   the fault.  */
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 
 	if (fault_signal_pending(fault, regs))
 		return;
@@ -164,10 +166,6 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	}
 
 	if (flags & FAULT_FLAG_ALLOW_RETRY) {
-		if (fault & VM_FAULT_MAJOR)
-			current->maj_flt++;
-		else
-			current->min_flt++;
 		if (fault & VM_FAULT_RETRY) {
 			flags |= FAULT_FLAG_TRIED;
 
-- 
2.26.2

