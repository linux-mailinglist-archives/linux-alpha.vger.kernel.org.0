Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39C313B91B7
	for <lists+linux-alpha@lfdr.de>; Thu,  1 Jul 2021 14:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236413AbhGAMnk (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 1 Jul 2021 08:43:40 -0400
Received: from cpe-67-11-230-143.satx.res.rr.com ([67.11.230.143]:53200 "EHLO
        gherkin.frus.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236282AbhGAMnk (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Thu, 1 Jul 2021 08:43:40 -0400
Received: by gherkin.frus.com (Postfix, from userid 500)
        id 2822369089; Thu,  1 Jul 2021 07:41:09 -0500 (CDT)
Date:   Thu, 1 Jul 2021 07:41:09 -0500
From:   Bob Tracy <rct@frus.com>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Michael Cree <mcree@orcon.net.nz>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
Subject: Re: X11 system lockup with 5.11.0 kernel
Message-ID: <YN235QP+s9wwHFMN@gherkin.frus.com>
References: <20210405045515.GA6637@tower>
 <20210405095825.GA17443@tower>
 <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
 <20210406091431.GA4462@tower>
 <dda17ea7-2abd-3e81-475f-8f103f7c9217@amd.com>
 <e6c7209e-de57-a9b8-dc23-70444aac8d1e@physik.fu-berlin.de>
 <YLhPeYdhLrFqsbCY@gherkin.frus.com>
 <alpine.DEB.2.21.2106031511500.25828@angie.orcam.me.uk>
 <YLm3wsDSxgWgrNEk@gherkin.frus.com>
 <YLm8Cu2VwGQdRdgU@gherkin.frus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YLm8Cu2VwGQdRdgU@gherkin.frus.com>
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Quick update: if this issue was ever fixed, the patch hasn't made it
into the mainline kernel as of 5.13.0.  I'm still getting the system
lock-up when X11 starts, and have to hit the reset switch to recover.

For whatever it might be worth, the mainline 5.10.0 kernel continues
to work properly alongside all the user space changes in "sid" that
have happened since late last year.

Respectfully,
--Bob

On Fri, Jun 04, 2021 at 12:37:14AM -0500, Bob Tracy wrote:
> On Fri, Jun 04, 2021 at 12:18:58AM -0500, Bob Tracy wrote:
> > On Thu, Jun 03, 2021 at 03:15:05PM +0200, Maciej W. Rozycki wrote:
> > >  I have lost track about this issue, so please fill me in as to whether 
> > > the offending commit causing the regression has been bisected or not.
> > 
> > It has.  Michael Cree reported the following back on April 5th:
> > 
> > And the first bad commit is:
> > 
> > 0fe3cf3a53b5c1205ec7d321be1185b075dff205 is the first bad commit
> > commit 0fe3cf3a53b5c1205ec7d321be1185b075dff205
> > Author: Christian König <christian.koenig@amd.com>
> > Date:   Sat Oct 24 13:12:23 2020 +0200
> > 
> >     drm/radeon: switch to new allocator v2
> >     
> >     It should be able to handle all cases here.
> >     
> >     v2: fix debugfs as well
> >     
> >     Signed-off-by: Christian König <christian.koenig@amd.com>
> >     Reviewed-by: Dave Airlie <airlied@redhat.com>
> >     Reviewed-by: Madhav Chauhan <madhav.chauhan@amd.com>
> >     Tested-by: Huang Rui <ray.huang@amd.com>
> >     Link: https://patchwork.freedesktop.org/patch/397088/?series=83051&rev=1
> > 
> > :040000 040000 4e643ef861b921392bc67be21a42298c91c7ff7a b36453567c3176a3cd50fa0b23886b0fd642560d M	drivers
> 
> There were a few follow-up messages in this thread that left me with the
> impression there *may* have been a patch submitted, although Christian
> complained at the time he was having problems locating Alpha hardware to
> test with.
> 
> The current (5.12.0 kernel) problem symptoms show some "improvement".
> I at least got to the point that the login screen displayed, but it
> had a bit of pixelation/distortion in a few areas indicative of "bad
> things about to happen".  Then I got the expected system lock-up,
> just as I originally reported: had to hit the reset switch to recover.
