Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8334B2013EA
	for <lists+linux-alpha@lfdr.de>; Fri, 19 Jun 2020 18:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392182AbgFSQFu (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 19 Jun 2020 12:05:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52748 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2390684AbgFSQFr (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 19 Jun 2020 12:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592582746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QX5XNFqam9mdd/6wKfca40oUCGNepMLO5UWfniIypyY=;
        b=U7o1PjzDnM3p1y0awnDYV/kUTfCHPLw9IN6O24H3V5k3oxF9+ioICVlrd/h0yOAd8rjmbI
        CEn7HQ76Mi9W1EP8SD7l9GDpr1XlHIH3Yx+LXnUbL1JuP9bWdmMXtLsafXr6fx6gAh2aPa
        klpVixnKhcM6ezZDE/fic0o6VF7r5+g=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-ByJtQqEvMuS_5cgd9eEotQ-1; Fri, 19 Jun 2020 12:05:45 -0400
X-MC-Unique: ByJtQqEvMuS_5cgd9eEotQ-1
Received: by mail-qv1-f69.google.com with SMTP id t20so7019742qvy.16
        for <linux-alpha@vger.kernel.org>; Fri, 19 Jun 2020 09:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QX5XNFqam9mdd/6wKfca40oUCGNepMLO5UWfniIypyY=;
        b=QIDth1bbig1xTtviXPOsVtydmQqbiLimeeXzf59qbqODjcJCV6H8qaWJAiqYd1hRr5
         Ma3/0FyGGZZHJsPWJNR+s6uJ6lvF2MqORKI1lQtbgV/8MTAGYbEafKtF0rnosfov/ROU
         21ZAMAQH0XtloDTtzF188bniOMuR2ccmKnGpfPLCUA+yL0vjjqgfuQnIOXN3B07XGc+0
         PSXkLARawLabsfXfm1jEI5PEISyNtWSb5e+BxcrbK3pTldBm+ASqu+Ma4/gxhRKX7AIp
         mLMFkw80V230M0YCcoCuQkcXuDdB+/KvYXt7wIaO8DEQAIQpr+6C+kriHRv+q0oUuXqj
         RBeg==
X-Gm-Message-State: AOAM532D6Eil/hGi2gOautFC6D6/YxkWp8ou8nkcBCfwKbLQ6kh8N3VC
        pqb0Bp8UXQzmQZU88l5SkHp+7e6U/xPNMWhM2rpKoMeDuK/Q+NROpgrZ0wQXsCT+mNwdGfKF280
        RNZxVy9WO9qhoMKEUS78D11w=
X-Received: by 2002:ae9:df84:: with SMTP id t126mr4010336qkf.420.1592582743575;
        Fri, 19 Jun 2020 09:05:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXJk79qIDPkgg9Bu+gM9Xo3p9+ll31vLKTGG+uA4L1k/Aqbh37gU+sPivXDad1xaGVNQjOFg==
X-Received: by 2002:ae9:df84:: with SMTP id t126mr4010307qkf.420.1592582743346;
        Fri, 19 Jun 2020 09:05:43 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id g11sm6412604qkk.123.2020.06.19.09.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 09:05:42 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Gerald Schaefer <gerald.schaefer@de.ibm.com>, peterx@redhat.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Subject: [PATCH 02/26] mm/alpha: Use general page fault accounting
Date:   Fri, 19 Jun 2020 12:05:14 -0400
Message-Id: <20200619160538.8641-3-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619160538.8641-1-peterx@redhat.com>
References: <20200619160538.8641-1-peterx@redhat.com>
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

