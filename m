Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4E461DA292
	for <lists+linux-alpha@lfdr.de>; Tue, 19 May 2020 22:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgESU2d (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 19 May 2020 16:28:33 -0400
Received: from smtp-3.orcon.net.nz ([60.234.4.44]:41377 "EHLO
        smtp-3.orcon.net.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbgESU2d (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 19 May 2020 16:28:33 -0400
Received: from [121.99.228.40] (port=55989 helo=tower)
        by smtp-3.orcon.net.nz with esmtpa (Exim 4.90_1)
        (envelope-from <mcree@orcon.net.nz>)
        id 1jb8qc-0001qY-2l; Wed, 20 May 2020 08:28:23 +1200
Date:   Wed, 20 May 2020 08:28:17 +1200
From:   Michael Cree <mcree@orcon.net.nz>
To:     John Ogness <john.ogness@linutronix.de>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Subject: Re: Alpha hardware for printk tests?
Message-ID: <20200519202817.GA4637@tower>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
        John Ogness <john.ogness@linutronix.de>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
References: <87tv0lgqut.fsf@vostro.fn.ogness.net>
 <20200513092526.GD2743@tower>
 <87r1vokp00.fsf@vostro.fn.ogness.net>
 <87v9ksavns.fsf@vostro.fn.ogness.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v9ksavns.fsf@vostro.fn.ogness.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, May 19, 2020 at 03:42:15PM +0200, John Ogness wrote:
> On 2020-05-12, John Ogness <john.ogness@linutronix.de> wrote:
> > I have posted[0] a new lockless printk ringbuffer implementation. The
> > ringbuffer has been tested heavily on x86_64 and arm64 SMP
> > systems. However, I would also like to test it on an SMP Alpha
> > system. Since the main purpose of the test is to verify the memory
> > barriers, the tests need to run on real hardware.
> > 
> > The new ringbuffer (with test routine) can also be built as a kernel
> > module and does not require any kernel patching. It should work on any
> > Linux kernel 4.20 or higher.
> > 
> > Is there anyone with access to SMP Alpha hardware that would be
> > willing to run the tests for me? Or can someone tell me where I might
> > find such a candidate? Thanks!
> 
> A problem leading to data corruption in the ringbuffer messages has been
> identified and fixed. A new version of the test module is available:
> 
> https://linux:linux@dl.linutronix.de/customers/printk/prb-test.tar.gz
> 
> The README in the tarball explains how to build/run the test and what
> information to send back after the test.
> 
> This test module should build/run without any kernel patching or
> rebooting. Even if it is only allowed to run on your SMP-Alpha for an
> hour, that would be very helpful for me.

Thanks for that.  I will give this new version a test.  I hadn't run
the tests as yet because the two alphas were very busy building
packages, but things are quiet again, so I'll take one out of the
builder network for testing.

Cheers,
Michael.
