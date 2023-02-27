Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFEB6A46F0
	for <lists+linux-alpha@lfdr.de>; Mon, 27 Feb 2023 17:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbjB0Q1g (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 27 Feb 2023 11:27:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbjB0Q1e (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 27 Feb 2023 11:27:34 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 73ABC21A32
        for <linux-alpha@vger.kernel.org>; Mon, 27 Feb 2023 08:27:31 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 7ADD492009C; Mon, 27 Feb 2023 17:27:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 6C29292009B;
        Mon, 27 Feb 2023 16:27:28 +0000 (GMT)
Date:   Mon, 27 Feb 2023 16:27:28 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Matt Turner <mattst88@gmail.com>
cc:     Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        linux-alpha <linux-alpha@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Alpha: Remove redundant local asm header redirections
In-Reply-To: <CAEdQ38GOQxCA53WWzh8FBbsAKe42sARv5n24cWvvi60Q272jwg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2302271621470.63909@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2202131944000.34636@angie.orcam.me.uk> <CAEdQ38EpBMnkP-PNZnwaoO4poFJQO5YSFJeZgiQ-obJmjogBFQ@mail.gmail.com> <alpine.DEB.2.21.2204150100380.9383@angie.orcam.me.uk>
 <CAEdQ38GOQxCA53WWzh8FBbsAKe42sARv5n24cWvvi60Q272jwg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sat, 25 Feb 2023, Matt Turner wrote:

> >  No worries, and thanks for chiming in.  I plan to get one of my Alphas
> > set up and wired in my remote lab later this year, so I hope to get a bit
> > more active with the port.  At least I've got a reasonably recent build of
> > the toolchain:
> >
> > $ alpha-linux-gnu-gcc --version
> > alpha-linux-gnu-gcc (GCC) 12.0.1 20220129 (experimental)
> > [...]
> 
> Thanks for the patch! This was included in my pull request today and
> is now upstream in Linus' tree.

 Great, thanks!  And BTW my Alpha has been relocated and was scheduled for 
wiring back in Jan, but events beyond my control have prevented this from 
happening.  I have it planned late Mar now, so fingers crossed I'll be 
able to do some more soon.

  Maciej
