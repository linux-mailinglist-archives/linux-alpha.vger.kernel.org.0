Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECA41D1280
	for <lists+linux-alpha@lfdr.de>; Wed, 13 May 2020 14:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731823AbgEMMR4 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 13 May 2020 08:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbgEMMR4 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 13 May 2020 08:17:56 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51699C061A0C
        for <linux-alpha@vger.kernel.org>; Wed, 13 May 2020 05:17:56 -0700 (PDT)
Received: from localhost ([127.0.0.1] helo=vostro)
        by Galois.linutronix.de with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
        (Exim 4.80)
        (envelope-from <john.ogness@linutronix.de>)
        id 1jYqKe-00023H-PA; Wed, 13 May 2020 14:17:52 +0200
From:   John Ogness <john.ogness@linutronix.de>
To:     Michael Cree <mcree@orcon.net.nz>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Subject: Re: Alpha hardware for printk tests?
References: <87tv0lgqut.fsf@vostro.fn.ogness.net>
        <20200513092526.GD2743@tower>
Date:   Wed, 13 May 2020 14:17:51 +0200
In-Reply-To: <20200513092526.GD2743@tower> (Michael Cree's message of "Wed, 13
        May 2020 21:25:26 +1200")
Message-ID: <87r1vokp00.fsf@vostro.fn.ogness.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On 2020-05-13, Michael Cree <mcree@orcon.net.nz> wrote:
>> I have posted[0] a new lockless printk ringbuffer implementation. The
>> ringbuffer has been tested heavily on x86_64 and arm64 SMP
>> systems. However, I would also like to test it on an SMP Alpha
>> system. Since the main purpose of the test is to verify the memory
>> barriers, the tests need to run on real hardware.
>> 
>> The new ringbuffer (with test routine) can also be built as a kernel
>> module and does not require any kernel patching. It should work on
>> any Linux kernel 4.20 or higher.
>> 
>> Is there anyone with access to SMP Alpha hardware that would be
>> willing to run the tests for me? Or can someone tell me where I might
>> find such a candidate? Thanks!
>
> I run the two Alpha ES45's building for Debian-Ports.  I can run
> the tests on one of them if you provide me with instructions.

That would be very helpful! Actually the test should build/run fine on
the Debian/stable (4.19) kernel as well. The source code is available
here:

https://linux:linux@dl.linutronix.de/customers/printk/prb-test.tar.gz

The README in the tarball explains how to build/run the test and what
information to send back after the test.

Even if you only had time to run the test for a few minutes, it would be
very helpful for me!

If you have any problems with the test module, please let me know. This
test has been confirmed to run successfully on: arm64, amd64, ppc64el

John Ogness
