Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 467E63540FD
	for <lists+linux-alpha@lfdr.de>; Mon,  5 Apr 2021 12:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbhDEJ6q (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 5 Apr 2021 05:58:46 -0400
Received: from smtp-1.orcon.net.nz ([60.234.4.34]:59969 "EHLO
        smtp-1.orcon.net.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbhDEJ6p (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Mon, 5 Apr 2021 05:58:45 -0400
Received: from [121.99.228.40] (port=47718 helo=tower)
        by smtp-1.orcon.net.nz with esmtpa (Exim 4.90_1)
        (envelope-from <mcree@orcon.net.nz>)
        id 1lTM06-0000JM-Nv; Mon, 05 Apr 2021 21:58:31 +1200
Date:   Mon, 5 Apr 2021 21:58:25 +1200
From:   Michael Cree <mcree@orcon.net.nz>
To:     Bob Tracy <rct@frus.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: X11 system lockup with 5.11.0 kernel
Message-ID: <20210405095825.GA17443@tower>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
        Bob Tracy <rct@frus.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
 <YF1k+3462hOXkI6d@gherkin.frus.com>
 <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
 <YGqWfkMbChi7G/Vj@gherkin.frus.com>
 <20210405045515.GA6637@tower>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210405045515.GA6637@tower>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Mon, Apr 05, 2021 at 04:55:15PM +1200, Michael Cree wrote:
> On Sun, Apr 04, 2021 at 11:47:58PM -0500, Bob Tracy wrote:
> > On Wed, Mar 31, 2021 at 11:04:42AM +0200, Maciej W. Rozycki wrote:
> > >  I think the only feasible way of determining what has happened here is 
> > > that you track the offending change down by bisecting the upstream kernel 
> > > repository with `git bisect'.
> > 
> > That would normally be what I would do, and it may yet happen.  Problem
> > is, I don't have a 64-bit system with enough disk space to do the kernel
> > builds with a cross-compiler, and local (native) builds on the PWS are
> > taking 36+ hours each these days.  Unless I get *really* lucky with the
> > bisects, the task will take a couple of weeks.
> 
> Confirmed that v5.11.0 hard locks up on presenting the X-Desktop
> login screen whereas v5.10.0 is fine. This is on a XP1000 with
> a Radeon HD4350.

And the first bad commit is:

0fe3cf3a53b5c1205ec7d321be1185b075dff205 is the first bad commit
commit 0fe3cf3a53b5c1205ec7d321be1185b075dff205
Author: Christian König <christian.koenig@amd.com>
Date:   Sat Oct 24 13:12:23 2020 +0200

    drm/radeon: switch to new allocator v2
    
    It should be able to handle all cases here.
    
    v2: fix debugfs as well
    
    Signed-off-by: Christian König <christian.koenig@amd.com>
    Reviewed-by: Dave Airlie <airlied@redhat.com>
    Reviewed-by: Madhav Chauhan <madhav.chauhan@amd.com>
    Tested-by: Huang Rui <ray.huang@amd.com>
    Link: https://patchwork.freedesktop.org/patch/397088/?series=83051&rev=1

:040000 040000 4e643ef861b921392bc67be21a42298c91c7ff7a b36453567c3176a3cd50fa0b23886b0fd642560d M	drivers

Cheers
Michael.
