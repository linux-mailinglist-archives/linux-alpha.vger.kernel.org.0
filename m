Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02DDE4F4E7A
	for <lists+linux-alpha@lfdr.de>; Wed,  6 Apr 2022 03:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbiDFAXG (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 5 Apr 2022 20:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443265AbiDEPjS (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Tue, 5 Apr 2022 11:39:18 -0400
Received: from gherkin.frus.com (cpe-67-11-228-40.satx.res.rr.com [67.11.228.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4F9BA148652
        for <linux-alpha@vger.kernel.org>; Tue,  5 Apr 2022 06:55:17 -0700 (PDT)
Received: by gherkin.frus.com (Postfix, from userid 500)
        id 7905361CD4; Tue,  5 Apr 2022 08:55:16 -0500 (CDT)
Date:   Tue, 5 Apr 2022 08:55:16 -0500
From:   Bob Tracy <rct@frus.com>
To:     Michael Cree <mcree@orcon.net.nz>, debian-alpha@lists.debian.org,
        linux-alpha@vger.kernel.org
Subject: Re: 5.17.0 boot issue on Miata
Message-ID: <YkxKRElYUhMgOOCN@gherkin.frus.com>
References: <Yj0u150JJpsb9nj4@gherkin.frus.com>
 <20220326222157.GA13650@tower>
 <YkuejknyPDJoQEDC@gherkin.frus.com>
 <20220405050125.GA25969@tower>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405050125.GA25969@tower>
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_00,PDS_RDNS_DYNAMIC_FP,
        RCVD_IN_PBL,RCVD_IN_SORBS_DUL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, Apr 05, 2022 at 05:01:25PM +1200, Michael Cree wrote:
> On Mon, Apr 04, 2022 at 08:42:38PM -0500, Bob Tracy wrote:
> > On Sun, Mar 27, 2022 at 11:21:57AM +1300, Michael Cree wrote:
> > > On Thu, Mar 24, 2022 at 09:54:15PM -0500, Bob Tracy wrote:
> > > > When I attempt to boot a 5.17.0 kernel built from the kernel.org
> > > > sources, I see disk sector errors on my "sda" device, and the boot
> > > > process hangs at the point where "systemd-udevd.service" starts.
> > > > 
> > > > Rebooting on 5.16.0 works with no disk I/O errors of any kind.
> > > 
> > > Oh, you can run a 5.16.y kernel on Alpha?  I have had problems
> > > with everything since 5.9.y with rare, random, corruptions in
> > > memory in user space (exhibiting as glibc detected memory
> > > corruptions or segfaults).
> > 
> > Did we have this painted into the "SMP vs. not-SMP" corner at one point?
> 
> No, this affects both ES45 (with 3 cpus) and XP1000 (one cpu).
> 
> The problem is rare. I often have to run tests for 12 hours on
> the XP1000 before I see a problem.  On miata it might occur even
> less often.
> 
> I hope I am getting close to the bad commit, but it is taking
> time when I run testing for a whole day before I feel confident
> enough to mark the kernel as good.  And I have been wrong on
> that one a couple of times now, having to repeat part of the
> bisection.

Stupid question, but possibly related to what I'm seeing in v5.17-final.
Beginning with "-rc3" there's a new FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
configuration option.  Do I need this enabled on Miata if I normally
boot in a video mode that displays a logo?  I'll try "no" for the "-rc3"
build if/when "-rc2" boots properly.

--Bob
