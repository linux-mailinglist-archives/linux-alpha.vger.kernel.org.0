Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52EA416117
	for <lists+linux-alpha@lfdr.de>; Thu, 23 Sep 2021 16:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241405AbhIWOfj (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 23 Sep 2021 10:35:39 -0400
Received: from cpe-67-11-230-143.satx.res.rr.com ([67.11.230.143]:51670 "EHLO
        gherkin.frus.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240652AbhIWOfj (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 23 Sep 2021 10:35:39 -0400
X-Greylist: delayed 1593 seconds by postgrey-1.27 at vger.kernel.org; Thu, 23 Sep 2021 10:35:39 EDT
Received: by gherkin.frus.com (Postfix, from userid 500)
        id B1FBD6D5F9; Thu, 23 Sep 2021 09:07:33 -0500 (CDT)
Date:   Thu, 23 Sep 2021 09:07:33 -0500
From:   Bob Tracy <rct@frus.com>
To:     Michael Cree <mcree@orcon.net.nz>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
Subject: Re: X11 system lockup with 5.11.0 kernel
Message-ID: <YUyKJQT/ldEao9U3@gherkin.frus.com>
References: <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
 <20210406091431.GA4462@tower>
 <dda17ea7-2abd-3e81-475f-8f103f7c9217@amd.com>
 <e6c7209e-de57-a9b8-dc23-70444aac8d1e@physik.fu-berlin.de>
 <YLhPeYdhLrFqsbCY@gherkin.frus.com>
 <alpine.DEB.2.21.2106031511500.25828@angie.orcam.me.uk>
 <YLm3wsDSxgWgrNEk@gherkin.frus.com>
 <YLm8Cu2VwGQdRdgU@gherkin.frus.com>
 <YN235QP+s9wwHFMN@gherkin.frus.com>
 <20210905230027.GA27992@tower>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210905230027.GA27992@tower>
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Mon, Sep 06, 2021 at 11:00:27AM +1200, Michael Cree wrote:
> I had intended to assist in testing with real hardware but there
> are other issues due to the 5.10 kernel on Alpha that need fixing
> first and I am working on that.  I am hoping to come back to this
> and can run some tests in the near future.

I am delighted to report that this issue has finally been resolved
as of the 5.14.0 mainline kernel.

There is a completely unrelated annoyance involving APC UPSs and a
flood of "hid-generic: <device_id> control queue full" messages on
the console.  This was reported and fixed as of 01 Sep 2021, but
the fix hasn't made it into mainline yet :-(.

Respectfully,
--Bob
