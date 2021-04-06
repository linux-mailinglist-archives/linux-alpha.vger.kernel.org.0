Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6677354FA8
	for <lists+linux-alpha@lfdr.de>; Tue,  6 Apr 2021 11:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236495AbhDFJPB (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 6 Apr 2021 05:15:01 -0400
Received: from smtp-1.orcon.net.nz ([60.234.4.34]:33235 "EHLO
        smtp-1.orcon.net.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235194AbhDFJPA (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Tue, 6 Apr 2021 05:15:00 -0400
Received: from [121.99.228.40] (port=6698 helo=tower)
        by smtp-1.orcon.net.nz with esmtpa (Exim 4.90_1)
        (envelope-from <mcree@orcon.net.nz>)
        id 1lThnB-0004GL-8J; Tue, 06 Apr 2021 21:14:37 +1200
Date:   Tue, 6 Apr 2021 21:14:31 +1200
From:   Michael Cree <mcree@orcon.net.nz>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Bob Tracy <rct@frus.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
Subject: Re: X11 system lockup with 5.11.0 kernel
Message-ID: <20210406091431.GA4462@tower>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Bob Tracy <rct@frus.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
 <YF1k+3462hOXkI6d@gherkin.frus.com>
 <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
 <YGqWfkMbChi7G/Vj@gherkin.frus.com>
 <20210405045515.GA6637@tower>
 <20210405095825.GA17443@tower>
 <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, Apr 06, 2021 at 09:08:10AM +0200, Christian König wrote:
> That is a known issue fixed in follow up 5.11.x kernels.

Well, it's intriguing that you say that because the latest 5.11.x
kernel available from www.kernel.org (i.e. 5.11.11) is also bad
and locks up hard when X is started on my Alpha XP1000.

Cheers
Michael.

> Am 05.04.21 um 11:58 schrieb Michael Cree:
> > On Mon, Apr 05, 2021 at 04:55:15PM +1200, Michael Cree wrote:
> > > On Sun, Apr 04, 2021 at 11:47:58PM -0500, Bob Tracy wrote:
> > > > On Wed, Mar 31, 2021 at 11:04:42AM +0200, Maciej W. Rozycki wrote:
> > > > >   I think the only feasible way of determining what has happened here is
> > > > > that you track the offending change down by bisecting the upstream kernel
> > > > > repository with `git bisect'.
> > > > That would normally be what I would do, and it may yet happen.  Problem
> > > > is, I don't have a 64-bit system with enough disk space to do the kernel
> > > > builds with a cross-compiler, and local (native) builds on the PWS are
> > > > taking 36+ hours each these days.  Unless I get *really* lucky with the
> > > > bisects, the task will take a couple of weeks.
> > > Confirmed that v5.11.0 hard locks up on presenting the X-Desktop
> > > login screen whereas v5.10.0 is fine. This is on a XP1000 with
> > > a Radeon HD4350.
> > And the first bad commit is:
> > 
> > 0fe3cf3a53b5c1205ec7d321be1185b075dff205 is the first bad commit
> > commit 0fe3cf3a53b5c1205ec7d321be1185b075dff205
> > Author: Christian König <christian.koenig@amd.com>
> > Date:   Sat Oct 24 13:12:23 2020 +0200
> > 
> >      drm/radeon: switch to new allocator v2
> >      It should be able to handle all cases here.
> >      v2: fix debugfs as well
> >      Signed-off-by: Christian König <christian.koenig@amd.com>
> >      Reviewed-by: Dave Airlie <airlied@redhat.com>
> >      Reviewed-by: Madhav Chauhan <madhav.chauhan@amd.com>
> >      Tested-by: Huang Rui <ray.huang@amd.com>
> >      Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F397088%2F%3Fseries%3D83051%26rev%3D1&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ce271ea2552a640dfec1408d8f81964a3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637532135545775310%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=UYwXgn6lAsES4q8p944kP0Y%2BGzqHRwSMXgrQvZXwXzM%3D&amp;reserved=0
> > 
> > :040000 040000 4e643ef861b921392bc67be21a42298c91c7ff7a b36453567c3176a3cd50fa0b23886b0fd642560d M	drivers
> > 
> > Cheers
> > Michael.
> 
