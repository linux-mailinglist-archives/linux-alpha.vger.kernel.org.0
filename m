Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20AD347BEE
	for <lists+linux-alpha@lfdr.de>; Wed, 24 Mar 2021 16:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236497AbhCXPSf (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 24 Mar 2021 11:18:35 -0400
Received: from cpe-67-11-230-143.satx.res.rr.com ([67.11.230.143]:49654 "EHLO
        gherkin.frus.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236442AbhCXPS3 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 24 Mar 2021 11:18:29 -0400
X-Greylist: delayed 1777 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Mar 2021 11:18:29 EDT
Received: by gherkin.frus.com (Postfix, from userid 500)
        id BEA62626ED; Wed, 24 Mar 2021 09:48:46 -0500 (CDT)
Date:   Wed, 24 Mar 2021 09:48:46 -0500
From:   Bob Tracy <rct@frus.com>
To:     debian-alpha@lists.debian.org
Cc:     mcree@orcon.net.nz, linux-alpha@vger.kernel.org
Subject: X11 system lockup with 5.11.0 kernel
Message-ID: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

All,

First an apology for being "dark" for so long.  There are still a few of
us out here using Alpha computers...

Another apology for the crappy "bug report" that follows, but first, a
little background information.  I'm not in the habit of running X11 on
my PWS 433au these days, except for periodically verifying "lightdm" and
"afterstep" still work.  The natural order of things is "increased bloat
over time", and the elephant barely walks these days, much less dances,
i.e., even an extremely lightweight window manager like AfterStep is
barely usable on my PWS.

Everything worked as well as it's going to for kernel versions up
through v5.10.0.  When I boot on v5.11.0, "lightdm" starts, the screen
goes blank as usual, I get a mouse pointer as usual, and shortly after
that, the system locks up solid (completely nonresponsive except for
being able to ping it -- can't login remotely).  Recovery is via the
reset switch at that point :-(.

It doesn't seem to be a userspace problem: rebooting the system on the
old v5.10.0 kernel works fine.  Nothing is showing up in any of the
system logs, unfortunately, so I'm at a loss how to troubleshoot this
further.

The PWS has the same Radeon 7500 video card in it that I've had for
years.

Any ideas/help appreciated, as always.  In the meantime, my default
strategy is to press on with trying the v5.12 release candidates
(standard kernel.org source tree).

Respectfully,
--Bob
