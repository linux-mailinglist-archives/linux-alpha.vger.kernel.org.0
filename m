Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB901D980B
	for <lists+linux-alpha@lfdr.de>; Tue, 19 May 2020 15:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727904AbgESNmY (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 19 May 2020 09:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbgESNmY (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 19 May 2020 09:42:24 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3003CC08C5C0
        for <linux-alpha@vger.kernel.org>; Tue, 19 May 2020 06:42:24 -0700 (PDT)
Received: from localhost ([127.0.0.1] helo=vostro)
        by Galois.linutronix.de with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
        (Exim 4.80)
        (envelope-from <john.ogness@linutronix.de>)
        id 1jb2Vf-0001Iz-Eq; Tue, 19 May 2020 15:42:19 +0200
From:   John Ogness <john.ogness@linutronix.de>
To:     Michael Cree <mcree@orcon.net.nz>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Subject: Re: Alpha hardware for printk tests?
References: <87tv0lgqut.fsf@vostro.fn.ogness.net>
        <20200513092526.GD2743@tower> <87r1vokp00.fsf@vostro.fn.ogness.net>
Date:   Tue, 19 May 2020 15:42:15 +0200
In-Reply-To: <87r1vokp00.fsf@vostro.fn.ogness.net> (John Ogness's message of
        "Wed, 13 May 2020 14:17:51 +0200")
Message-ID: <87v9ksavns.fsf@vostro.fn.ogness.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On 2020-05-12, John Ogness <john.ogness@linutronix.de> wrote:
> I have posted[0] a new lockless printk ringbuffer implementation. The
> ringbuffer has been tested heavily on x86_64 and arm64 SMP
> systems. However, I would also like to test it on an SMP Alpha
> system. Since the main purpose of the test is to verify the memory
> barriers, the tests need to run on real hardware.
> 
> The new ringbuffer (with test routine) can also be built as a kernel
> module and does not require any kernel patching. It should work on any
> Linux kernel 4.20 or higher.
> 
> Is there anyone with access to SMP Alpha hardware that would be
> willing to run the tests for me? Or can someone tell me where I might
> find such a candidate? Thanks!

A problem leading to data corruption in the ringbuffer messages has been
identified and fixed. A new version of the test module is available:

https://linux:linux@dl.linutronix.de/customers/printk/prb-test.tar.gz

The README in the tarball explains how to build/run the test and what
information to send back after the test.

This test module should build/run without any kernel patching or
rebooting. Even if it is only allowed to run on your SMP-Alpha for an
hour, that would be very helpful for me.

Thanks,
John Ogness
