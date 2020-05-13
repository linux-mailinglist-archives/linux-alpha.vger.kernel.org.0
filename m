Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110F01D0C91
	for <lists+linux-alpha@lfdr.de>; Wed, 13 May 2020 11:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729917AbgEMJpI (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 13 May 2020 05:45:08 -0400
Received: from smtp-3.orcon.net.nz ([60.234.4.44]:55319 "EHLO
        smtp-3.orcon.net.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbgEMJpI (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 13 May 2020 05:45:08 -0400
X-Greylist: delayed 1171 seconds by postgrey-1.27 at vger.kernel.org; Wed, 13 May 2020 05:45:07 EDT
Received: from [121.99.228.40] (port=16501 helo=tower)
        by smtp-3.orcon.net.nz with esmtpa (Exim 4.90_1)
        (envelope-from <mcree@orcon.net.nz>)
        id 1jYndn-00018F-Lk; Wed, 13 May 2020 21:25:27 +1200
Date:   Wed, 13 May 2020 21:25:26 +1200
From:   Michael Cree <mcree@orcon.net.nz>
To:     John Ogness <john.ogness@linutronix.de>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Subject: Re: Alpha hardware for printk tests?
Message-ID: <20200513092526.GD2743@tower>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
        John Ogness <john.ogness@linutronix.de>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
References: <87tv0lgqut.fsf@vostro.fn.ogness.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tv0lgqut.fsf@vostro.fn.ogness.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, May 12, 2020 at 04:39:06PM +0200, John Ogness wrote:
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
> Is there anyone with access to SMP Alpha hardware that would be willing
> to run the tests for me? Or can someone tell me where I might find such
> a candidate? Thanks!

I run the two Alpha ES45's building for Debian-Ports.  I can run
the tests on one of them if you provide me with instructions.

Cheers,
Michael.
