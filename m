Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B42CE4F225D
	for <lists+linux-alpha@lfdr.de>; Tue,  5 Apr 2022 07:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiDEFEp (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 5 Apr 2022 01:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiDEFER (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Tue, 5 Apr 2022 01:04:17 -0400
Received: from smtp-3.orcon.net.nz (smtp-3.orcon.net.nz [60.234.4.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD10186D8
        for <linux-alpha@vger.kernel.org>; Mon,  4 Apr 2022 22:01:39 -0700 (PDT)
Received: from [121.99.247.178] (port=38465 helo=tower)
        by smtp-3.orcon.net.nz with esmtpa (Exim 4.90_1)
        (envelope-from <mcree@orcon.net.nz>)
        id 1nbbJr-0005LR-5Y; Tue, 05 Apr 2022 17:01:31 +1200
Date:   Tue, 5 Apr 2022 17:01:25 +1200
From:   Michael Cree <mcree@orcon.net.nz>
To:     Bob Tracy <rct@frus.com>
Cc:     debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
Subject: Re: 5.17.0 boot issue on Miata
Message-ID: <20220405050125.GA25969@tower>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
        Bob Tracy <rct@frus.com>, debian-alpha@lists.debian.org,
        linux-alpha@vger.kernel.org
References: <Yj0u150JJpsb9nj4@gherkin.frus.com>
 <20220326222157.GA13650@tower>
 <YkuejknyPDJoQEDC@gherkin.frus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkuejknyPDJoQEDC@gherkin.frus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Mon, Apr 04, 2022 at 08:42:38PM -0500, Bob Tracy wrote:
> On Sun, Mar 27, 2022 at 11:21:57AM +1300, Michael Cree wrote:
> > On Thu, Mar 24, 2022 at 09:54:15PM -0500, Bob Tracy wrote:
> > > When I attempt to boot a 5.17.0 kernel built from the kernel.org
> > > sources, I see disk sector errors on my "sda" device, and the boot
> > > process hangs at the point where "systemd-udevd.service" starts.
> > > 
> > > Rebooting on 5.16.0 works with no disk I/O errors of any kind.
> > 
> > Oh, you can run a 5.16.y kernel on Alpha?  I have had problems
> > with everything since 5.9.y with rare, random, corruptions in
> > memory in user space (exhibiting as glibc detected memory
> > corruptions or segfaults).
> 
> Did we have this painted into the "SMP vs. not-SMP" corner at one point?

No, this affects both ES45 (with 3 cpus) and XP1000 (one cpu).

The problem is rare. I often have to run tests for 12 hours on
the XP1000 before I see a problem.  On miata it might occur even
less often.

I hope I am getting close to the bad commit, but it is taking
time when I run testing for a whole day before I feel confident
enough to mark the kernel as good.  And I have been wrong on
that one a couple of times now, having to repeat part of the
bisection.

Cheers,
Michael.
