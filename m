Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F32CA353BCB
	for <lists+linux-alpha@lfdr.de>; Mon,  5 Apr 2021 07:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbhDEFd0 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 5 Apr 2021 01:33:26 -0400
Received: from smtp-3.orcon.net.nz ([60.234.4.44]:52169 "EHLO
        smtp-3.orcon.net.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhDEFd0 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Mon, 5 Apr 2021 01:33:26 -0400
X-Greylist: delayed 2263 seconds by postgrey-1.27 at vger.kernel.org; Mon, 05 Apr 2021 01:33:26 EDT
Received: from [121.99.228.40] (port=48346 helo=tower)
        by smtp-3.orcon.net.nz with esmtpa (Exim 4.90_1)
        (envelope-from <mcree@orcon.net.nz>)
        id 1lTHGl-0004vt-Gi; Mon, 05 Apr 2021 16:55:23 +1200
Date:   Mon, 5 Apr 2021 16:55:15 +1200
From:   Michael Cree <mcree@orcon.net.nz>
To:     Bob Tracy <rct@frus.com>
Cc:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
Subject: Re: X11 system lockup with 5.11.0 kernel
Message-ID: <20210405045515.GA6637@tower>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
        Bob Tracy <rct@frus.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
 <YF1k+3462hOXkI6d@gherkin.frus.com>
 <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
 <YGqWfkMbChi7G/Vj@gherkin.frus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGqWfkMbChi7G/Vj@gherkin.frus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sun, Apr 04, 2021 at 11:47:58PM -0500, Bob Tracy wrote:
> On Wed, Mar 31, 2021 at 11:04:42AM +0200, Maciej W. Rozycki wrote:
> >  I think the only feasible way of determining what has happened here is 
> > that you track the offending change down by bisecting the upstream kernel 
> > repository with `git bisect'.
> 
> That would normally be what I would do, and it may yet happen.  Problem
> is, I don't have a 64-bit system with enough disk space to do the kernel
> builds with a cross-compiler, and local (native) builds on the PWS are
> taking 36+ hours each these days.  Unless I get *really* lucky with the
> bisects, the task will take a couple of weeks.

Confirmed that v5.11.0 hard locks up on presenting the X-Desktop
login screen whereas v5.10.0 is fine. This is on a XP1000 with
a Radeon HD4350.

I've started a git bisection but it will take some time.

Cheers
Michael.
