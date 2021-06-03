Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C4B39A1F8
	for <lists+linux-alpha@lfdr.de>; Thu,  3 Jun 2021 15:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbhFCNQ4 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 3 Jun 2021 09:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbhFCNQz (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Thu, 3 Jun 2021 09:16:55 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DA8A5C06174A
        for <linux-alpha@vger.kernel.org>; Thu,  3 Jun 2021 06:15:10 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id EDC5492009C; Thu,  3 Jun 2021 15:15:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id E741C92009B;
        Thu,  3 Jun 2021 15:15:05 +0200 (CEST)
Date:   Thu, 3 Jun 2021 15:15:05 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Bob Tracy <rct@frus.com>
cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Michael Cree <mcree@orcon.net.nz>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
Subject: Re: X11 system lockup with 5.11.0 kernel
In-Reply-To: <YLhPeYdhLrFqsbCY@gherkin.frus.com>
Message-ID: <alpine.DEB.2.21.2106031511500.25828@angie.orcam.me.uk>
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com> <YF1k+3462hOXkI6d@gherkin.frus.com> <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk> <YGqWfkMbChi7G/Vj@gherkin.frus.com> <20210405045515.GA6637@tower> <20210405095825.GA17443@tower>
 <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com> <20210406091431.GA4462@tower> <dda17ea7-2abd-3e81-475f-8f103f7c9217@amd.com> <e6c7209e-de57-a9b8-dc23-70444aac8d1e@physik.fu-berlin.de> <YLhPeYdhLrFqsbCY@gherkin.frus.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Wed, 2 Jun 2021, Bob Tracy wrote:

> > We're also supporting everything else that most commercial vendors consider obsolete
> > such as PA-RISC, M68k, big-endian PowerPC (32 and 64 bits) SPARC and so on, in case
> > you need testing there.
> 
> (Mostly including the above just as a reference to the most recent
> posting in this thread...)
> 
> As of mainline kernel 5.12.0, the fix I (we) have been waiting for still
> hasn't been included.  My alpha still locks up when X11 starts.
> 
> Stuck at kernel version 5.10.0 for the time being.

 I have lost track about this issue, so please fill me in as to whether 
the offending commit causing the regression has been bisected or not.

  Maciej
