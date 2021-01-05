Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA0A2EAE1C
	for <lists+linux-alpha@lfdr.de>; Tue,  5 Jan 2021 16:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbhAEPSA (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 5 Jan 2021 10:18:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35203 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726151AbhAEPSA (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 5 Jan 2021 10:18:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609859794;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=s7UoX0Y+ikwYQJjKfgdSrYJLrwW4Gbhf+F7iH9SWWeM=;
        b=eaxNhVM+XC6AKceREAPM6zqT4/qNcvMdkpk5HMJDK2zIpW1VU/hBm0O260Os5vYAe4Dloz
        8L3vlwbcdVqtc0SnxvREotit7tNdD2aQopgH8jPAGeqbCm+BbsCkRm434eYQRYDvGLzkv2
        VLbX+00pzrbyd9/5vKAS69NT20Td9WE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-G24nw6-cMfGIAxWC84j5Yw-1; Tue, 05 Jan 2021 10:16:31 -0500
X-MC-Unique: G24nw6-cMfGIAxWC84j5Yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E163B803620;
        Tue,  5 Jan 2021 15:16:29 +0000 (UTC)
Received: from prarit.bos.redhat.com (prarit-guest.7a2m.lab.eng.bos.redhat.com [10.16.222.26])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D57E75D6D3;
        Tue,  5 Jan 2021 15:16:28 +0000 (UTC)
From:   Prarit Bhargava <prarit@redhat.com>
To:     linux-alpha@vger.kernel.org
Cc:     Prarit Bhargava <prarit@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: Send stop IPI to send to online CPUs
Date:   Tue,  5 Jan 2021 10:16:27 -0500
Message-Id: <20210105151627.579336-1-prarit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Unfortunately I do not have any HW to test this patch.  Hopefully someone on
the cc list can help me out?

P.

---8<---

This issue was noticed while debugging a shutdown issue where some
secondary CPUs are not being shutdown correctly.  A fix for that [1] requires
that secondary cpus be offlined using the cpu_online_mask so that the
stop operation is a no-op if CPU HOTPLUG is disabled.  I, like the author in
[1] looked at the architectures and found that alpha is one of two
architectures that executes smp_send_stop() on all possible CPUs.

On alpha, smp_send_stop() sends an IPI to all possible CPUs but only needs
to send them to online CPUs.

Send the stop IPI to only the online CPUs.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>

[1] https://lkml.org/lkml/2020/1/10/250
---
 arch/alpha/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index f4dd9f3f3001..f3a58c1fdd55 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -583,7 +583,7 @@ void
 smp_send_stop(void)
 {
 	cpumask_t to_whom;
-	cpumask_copy(&to_whom, cpu_possible_mask);
+	cpumask_copy(&to_whom, cpu_online_mask);
 	cpumask_clear_cpu(smp_processor_id(), &to_whom);
 #ifdef DEBUG_IPI_MSG
 	if (hard_smp_processor_id() != boot_cpu_id)
-- 
2.29.2

