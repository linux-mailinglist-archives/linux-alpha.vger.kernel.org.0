Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07FF328E38E
	for <lists+linux-alpha@lfdr.de>; Wed, 14 Oct 2020 17:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728576AbgJNPr3 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 14 Oct 2020 11:47:29 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:59494 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728411AbgJNPr3 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 14 Oct 2020 11:47:29 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602690447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=CEHIOjBcSkDJeZj4yitMPftpAVejIzgCqUmY3JfG8EE=;
        b=Wfsoo3YkRmXYF+oZ6nBEMaXpRvg3++4PG51N5xroNPYywCFEOaSX0UqKLdJVhNqQv5l0Pa
        LYBCnbEObqc7Kkj+WOlqY2XMiwKr167qdYP+jLDyGkrv9hlk/jsb15GerF1qXrghf1FGaj
        XGk5mVKz6J1DJycPiK0vE/563vFB0SEiDv23UBBNtxXshTQioOg4QwrZWPhY8Zjj9xmvEr
        gsgAPQpyRJx8i+gxnOL66YQm0IkUAuwOmBcbl0kMY2D0uXlhdOj85l3nx3oFIm/94pDsgC
        syUmjPL/8pYbwevcUk+d8hS/S4yrC2UcRRWWAkqhS99LhGJ7hc9Nhmno4Pb90w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602690447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=CEHIOjBcSkDJeZj4yitMPftpAVejIzgCqUmY3JfG8EE=;
        b=Q5I7hOvcRs9dODuE9eXA4M2Mjm8hWPk8EbNsgdKutNd1krhgR5Y414xs80pt0T7W9EFJ3D
        dQggOYR5+bNB3rCw==
To:     linux-alpha@vger.kernel.org
Cc:     Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: alpha: Replace bogus in_interrupt()
Date:   Wed, 14 Oct 2020 17:47:26 +0200
Message-ID: <87imbcbyi9.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

in_interrupt() is true for a variety of things including bottomhalf
disabled regions. Deducing hard interrupt context from it is dubious at
best.

Use in_irq() which is true if called in hard interrupt context. Otherwise
calling irq_exit() would do more harm than good.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/process.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 7462a7911002..1589467e7528 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -134,7 +134,7 @@ common_shutdown_1(void *generic_ptr)
 #ifdef CONFIG_DUMMY_CONSOLE
 		/* If we've gotten here after SysRq-b, leave interrupt
 		   context before taking over the console. */
-		if (in_interrupt())
+		if (in_irq())
 			irq_exit();
 		/* This has the effect of resetting the VGA video origin.  */
 		console_lock();
