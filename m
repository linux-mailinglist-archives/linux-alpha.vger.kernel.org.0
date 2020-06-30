Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9990920FE13
	for <lists+linux-alpha@lfdr.de>; Tue, 30 Jun 2020 22:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730025AbgF3UrD (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 30 Jun 2020 16:47:03 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58011 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730032AbgF3UpT (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 30 Jun 2020 16:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593549917;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9zINhPgn0dLU827u0kCMWiXWqm1EOoX2bkCYV8BQtz4=;
        b=cAvc7Pw09CgBjtEtOLQEahXWtgY+2QA7nH451xpNQRovGnFC5dlaf46xQRscJhZrlSSETE
        TD/RntDGhctd63OwlDovGhAbTErrorhVGU1sGbLHWVk7mFpcGTrwzhxl5bHk/n8qTNPfET
        9sn5GksQZ7R77QEdTttZKLFKQslS49o=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-_70V_StEPUaWWTu0u6CMMg-1; Tue, 30 Jun 2020 16:45:11 -0400
X-MC-Unique: _70V_StEPUaWWTu0u6CMMg-1
Received: by mail-qt1-f197.google.com with SMTP id c5so15275213qtv.20
        for <linux-alpha@vger.kernel.org>; Tue, 30 Jun 2020 13:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9zINhPgn0dLU827u0kCMWiXWqm1EOoX2bkCYV8BQtz4=;
        b=jhx35zUDJQ4hNLY45DJA0xXgLN1v4V7X/cQlJHSK3ctlS49oqYg0OUUCxjXI6G0fGL
         tbIyKHPiBM7+d9JEhv6uSvODJgsd2wdNM4mYMClmH3/TsVWbgC2XMg+9cJLP16tKK0rU
         nXFSj79nLtRCxEh90hq0gyQiV2GLCIJ/tHPCM9npmwmpwl7L6S0kQt7GkjvvAdrTWcfg
         AH/c9jNqSeT/vCdPFajq7KHsVAPEBHs/kLBGQiel+bxvWokko0zmQFwQpVZmLHF85UVo
         79p+CYFmduRR1rGkECKMrmHDH4OozHw4/fILqIYawTlWGKupvQxJ3r5rNsHi0Lu+1+Zo
         wk9Q==
X-Gm-Message-State: AOAM530W1vPiKVtaDXJU9eztmZNCODu9xtGWI3xcwz3E5XQv1Y/tNhcl
        4RO+S/Q2kIFumi5jZWTJ/7DpJd2Ui694Ho3cXQn+5OQC9/s3fMYR8vl60w5EvlLOc5O8m4Hsikl
        wTFmhTpEPeA47cz2WsZxXdWU=
X-Received: by 2002:ac8:100b:: with SMTP id z11mr23499526qti.157.1593549911381;
        Tue, 30 Jun 2020 13:45:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0yAgQnRD/5TZveHkpZPXLU358GLo0DpfJwL9wdYY6bw9cMFV6GaGklDvsflsay5ajX+3TFA==
X-Received: by 2002:ac8:100b:: with SMTP id z11mr23499328qti.157.1593549908970;
        Tue, 30 Jun 2020 13:45:08 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id o145sm3987048qke.2.2020.06.30.13.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 13:45:08 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>, peterx@redhat.com,
        John Hubbard <jhubbard@nvidia.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Subject: [PATCH v4 02/26] mm/alpha: Use general page fault accounting
Date:   Tue, 30 Jun 2020 16:45:06 -0400
Message-Id: <20200630204506.38567-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
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

