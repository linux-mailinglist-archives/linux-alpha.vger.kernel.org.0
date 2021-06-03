Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E48CE3998CC
	for <lists+linux-alpha@lfdr.de>; Thu,  3 Jun 2021 06:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbhFCEEx (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 3 Jun 2021 00:04:53 -0400
Received: from cpe-67-11-230-143.satx.res.rr.com ([67.11.230.143]:42942 "EHLO
        gherkin.frus.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhFCEEx (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Thu, 3 Jun 2021 00:04:53 -0400
X-Greylist: delayed 1284 seconds by postgrey-1.27 at vger.kernel.org; Thu, 03 Jun 2021 00:04:53 EDT
Received: by gherkin.frus.com (Postfix, from userid 500)
        id 17CED6BF46; Wed,  2 Jun 2021 22:41:45 -0500 (CDT)
Date:   Wed, 2 Jun 2021 22:41:45 -0500
From:   Bob Tracy <rct@frus.com>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Michael Cree <mcree@orcon.net.nz>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
Subject: Re: X11 system lockup with 5.11.0 kernel
Message-ID: <YLhPeYdhLrFqsbCY@gherkin.frus.com>
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
 <YF1k+3462hOXkI6d@gherkin.frus.com>
 <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
 <YGqWfkMbChi7G/Vj@gherkin.frus.com>
 <20210405045515.GA6637@tower>
 <20210405095825.GA17443@tower>
 <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
 <20210406091431.GA4462@tower>
 <dda17ea7-2abd-3e81-475f-8f103f7c9217@amd.com>
 <e6c7209e-de57-a9b8-dc23-70444aac8d1e@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6c7209e-de57-a9b8-dc23-70444aac8d1e@physik.fu-berlin.de>
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, Apr 06, 2021 at 12:19:29PM +0200, John Paul Adrian Glaubitz wrote:
> We're also supporting everything else that most commercial vendors consider obsolete
> such as PA-RISC, M68k, big-endian PowerPC (32 and 64 bits) SPARC and so on, in case
> you need testing there.

(Mostly including the above just as a reference to the most recent
posting in this thread...)

As of mainline kernel 5.12.0, the fix I (we) have been waiting for still
hasn't been included.  My alpha still locks up when X11 starts.

Stuck at kernel version 5.10.0 for the time being.

Respectfully,
--Bob
