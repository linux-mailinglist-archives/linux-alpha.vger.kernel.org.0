Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12CE21CF770
	for <lists+linux-alpha@lfdr.de>; Tue, 12 May 2020 16:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730194AbgELOjK (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 12 May 2020 10:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730169AbgELOjK (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 12 May 2020 10:39:10 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56582C061A0C
        for <linux-alpha@vger.kernel.org>; Tue, 12 May 2020 07:39:10 -0700 (PDT)
Received: from localhost ([127.0.0.1] helo=vostro)
        by Galois.linutronix.de with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
        (Exim 4.80)
        (envelope-from <john.ogness@linutronix.de>)
        id 1jYW3n-0005zM-IU; Tue, 12 May 2020 16:39:07 +0200
From:   John Ogness <john.ogness@linutronix.de>
To:     Richard Henderson <rth@twiddle.net>
Cc:     Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org
Subject: Alpha hardware for printk tests?
Date:   Tue, 12 May 2020 16:39:06 +0200
Message-ID: <87tv0lgqut.fsf@vostro.fn.ogness.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hello,

I have posted[0] a new lockless printk ringbuffer implementation. The
ringbuffer has been tested heavily on x86_64 and arm64 SMP
systems. However, I would also like to test it on an SMP Alpha
system. Since the main purpose of the test is to verify the memory
barriers, the tests need to run on real hardware.

The new ringbuffer (with test routine) can also be built as a kernel
module and does not require any kernel patching. It should work on any
Linux kernel 4.20 or higher.

Is there anyone with access to SMP Alpha hardware that would be willing
to run the tests for me? Or can someone tell me where I might find such
a candidate? Thanks!

John Ogness

[0] https://lkml.kernel.org/r/20200501094010.17694-1-john.ogness@linutronix.de
