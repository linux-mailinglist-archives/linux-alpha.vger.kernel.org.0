Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2218A217B44
	for <lists+linux-alpha@lfdr.de>; Wed,  8 Jul 2020 00:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729530AbgGGWud (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 7 Jul 2020 18:50:33 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29714 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728979AbgGGWub (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 7 Jul 2020 18:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594162229;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9zINhPgn0dLU827u0kCMWiXWqm1EOoX2bkCYV8BQtz4=;
        b=S+SwsKNyzR9drw2DZbM9hW3qX4ranriHXEVqrCQrN1c/fTOf4EzQtBuNt9os8USyLG5VTz
        swGBbTX+eRjWoGm1ljRgbamGxpm6ngGv3tdnleTDIzr8zki5PdfbX4ZY9dRjJ7Bdqj1gyj
        nMbFwozfnl/QeTPmnY9OO9TvV+8hZs0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-J11GtkuFMDK3hCGd-E6U0A-1; Tue, 07 Jul 2020 18:50:28 -0400
X-MC-Unique: J11GtkuFMDK3hCGd-E6U0A-1
Received: by mail-qk1-f199.google.com with SMTP id 13so17759301qkk.10
        for <linux-alpha@vger.kernel.org>; Tue, 07 Jul 2020 15:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9zINhPgn0dLU827u0kCMWiXWqm1EOoX2bkCYV8BQtz4=;
        b=WH3o3ayWYM+0ymuH2sgpGI9GDWucMe8G0fOnJ1dfpybTiWEq6U/9sSxkWpN2max/At
         i5TT8LCEQ+PNG5DqYeK4MZscnaSCvsT4U97Kiw+wntwMIV9mRXzCuAXsi2hRFs7DPqB9
         bXWUeJ0RGDY5RxQVk2z1bINpE62OY36sMmW5DrFP3leTgiD28YVxrxawvD1AfqwwM7zq
         Wp8FVqE5WRdqbUxgxmOyC2DpcRgtgAaHvPnPSz/wd88FmO4tKecY3Ous98GHUAPEqZoR
         +tIT3Apt66mOAt8wRAooea1JbaQGEVP1wsCry8iCS8nAshGvcHZz5oMe/GCZxAg/P2Jp
         c3lg==
X-Gm-Message-State: AOAM533iKUD+8kYIsGzP0DMeP/Lqgqu4NXpSTi3vkdRzC5IQ7LiQtkYR
        t29YxR3PCLbJ9TOSWMeQDgXJh9syuWuxv+gpmwJ/uEUBDgz8vUrLzbXIMy9+iGSU/vCVETkag2C
        qR53eBr+0/qeKBUA3eNb806Q=
X-Received: by 2002:ac8:7b57:: with SMTP id m23mr36398735qtu.379.1594162227887;
        Tue, 07 Jul 2020 15:50:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjtNA8lnpn1m/KE5+eQlmjotnypaLOF4WLVE5X368ySfVMh096MOzRrWMEJA23JXXqHHd3XA==
X-Received: by 2002:ac8:7b57:: with SMTP id m23mr36398711qtu.379.1594162227647;
        Tue, 07 Jul 2020 15:50:27 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id j16sm26267642qtp.92.2020.07.07.15.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 15:50:27 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        peterx@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Subject: [PATCH v5 02/25] mm/alpha: Use general page fault accounting
Date:   Tue,  7 Jul 2020 18:49:58 -0400
Message-Id: <20200707225021.200906-3-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200707225021.200906-1-peterx@redhat.com>
References: <20200707225021.200906-1-peterx@redhat.com>
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
index 1983e43a5e2f..09172f017efc 100644
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
 	mmap_read_lock(mm);
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

