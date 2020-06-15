Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A101FA360
	for <lists+linux-alpha@lfdr.de>; Tue, 16 Jun 2020 00:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgFOWRX (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 15 Jun 2020 18:17:23 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60019 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726515AbgFOWQV (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 15 Jun 2020 18:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592259379;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Uy9S6zWlY4QUCbRMwtgEQKAubvhaoWQ6Csg0YCMvJi4=;
        b=WdG/RJq1p0uPmlyY29l/spZ8SkZ0Iok/p6eFLzk/S6ui4zZsFgHWPFiq7bKIb1syvHrF8D
        0uxa+WTnBOFVPJDXwBlaFae4QCsBb3l/WeEUIn5pRmDwdb3X0SeajKTJWlb4GquYKTf9RC
        JYezMbDwJdehIGFdZZxiNJ50JRmmQrs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-8bOMOJuPPEC6PD6ty0gT4g-1; Mon, 15 Jun 2020 18:16:15 -0400
X-MC-Unique: 8bOMOJuPPEC6PD6ty0gT4g-1
Received: by mail-qk1-f197.google.com with SMTP id 140so15340789qko.23
        for <linux-alpha@vger.kernel.org>; Mon, 15 Jun 2020 15:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uy9S6zWlY4QUCbRMwtgEQKAubvhaoWQ6Csg0YCMvJi4=;
        b=IppDbaJguhzP6L0K1WFaC2mujGuq4EnMJZ8GwROLE/ZEfgILd83sTllaBHJ/y4T2tu
         eqfmPdL+reCf6pyMAAUeOfVxezP4T779KiC9RpoISF7g/QPMRDlGgSFbmaBXNToEJiR2
         4Yv/Yx2gHHKU1uj/N2d+mDMSKgPCIqa36bX9GLgN1wOhdh633D49/SLm1QBKH4clKX89
         LOv78XfcSuaRYmzqaVoUIFzbblgHcnv1TNVQ+/ILfWvSrlivsU8rtbpEqMnbqV/L0GLn
         tJ+Xh6XddgZAzMGo52xMmtIt6lO0g+NNTIgkoNso0HK8qDh0ozgQ1fJj7eh2AdQ5xvwX
         sCOg==
X-Gm-Message-State: AOAM532+4z74KuY1o19qWIaw46Jp0TWv17ksewtmcOrSb7Y7NLdGNv+V
        Rkujl2Xt2EhEuRYgpsFROvTPqz0DxSBHPqI21deoLKfbYh9ge3N4emwGT1dHgwB8ivl+xzIA2bR
        MWvVErQnxL9x0mwqY060DLP8=
X-Received: by 2002:a37:383:: with SMTP id 125mr16915090qkd.487.1592259375278;
        Mon, 15 Jun 2020 15:16:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzx2jdZbikd8ij9fO7Na7EhCsaCx+jNGFIMPDIBNn75KvLdZjW89Wj8DO9pFH/vOL7V0f2F0g==
X-Received: by 2002:a37:383:: with SMTP id 125mr16915044qkd.487.1592259374706;
        Mon, 15 Jun 2020 15:16:14 -0700 (PDT)
Received: from xz-x1.hitronhub.home ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id w13sm12351509qkb.91.2020.06.15.15.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 15:16:14 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, peterx@redhat.com,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Subject: [PATCH 03/25] mm/alpha: Use mm_fault_accounting()
Date:   Mon, 15 Jun 2020 18:15:45 -0400
Message-Id: <20200615221607.7764-4-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615221607.7764-1-peterx@redhat.com>
References: <20200615221607.7764-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Use the new mm_fault_accounting() helper for page fault accounting.

Avoid doing page fault accounting multiple times if the page fault is retried.
Also, the perf events for page faults will be accounted too when the config has
CONFIG_PERF_EVENTS defined.

CC: Richard Henderson <rth@twiddle.net>
CC: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
CC: Matt Turner <mattst88@gmail.com>
CC: linux-alpha@vger.kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/alpha/mm/fault.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index c2d7b6d7bac7..4f8632ddef25 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -88,7 +88,7 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	struct mm_struct *mm = current->mm;
 	const struct exception_table_entry *fixup;
 	int si_code = SEGV_MAPERR;
-	vm_fault_t fault;
+	vm_fault_t fault, major = 0;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
 
 	/* As of EV6, a load into $31/$f31 is a prefetch, and never faults
@@ -149,6 +149,7 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	   make sure we exit gracefully rather than endlessly redo
 	   the fault.  */
 	fault = handle_mm_fault(vma, address, flags);
+	major |= fault & VM_FAULT_MAJOR;
 
 	if (fault_signal_pending(fault, regs))
 		return;
@@ -164,10 +165,6 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	}
 
 	if (flags & FAULT_FLAG_ALLOW_RETRY) {
-		if (fault & VM_FAULT_MAJOR)
-			current->maj_flt++;
-		else
-			current->min_flt++;
 		if (fault & VM_FAULT_RETRY) {
 			flags |= FAULT_FLAG_TRIED;
 
@@ -182,6 +179,8 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 
 	up_read(&mm->mmap_sem);
 
+	mm_fault_accounting(current, regs, address, major);
+
 	return;
 
 	/* Something tried to access memory that isn't in our memory map.
-- 
2.26.2

