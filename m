Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6A8B5A8823
	for <lists+linux-alpha@lfdr.de>; Wed, 31 Aug 2022 23:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbiHaVbI (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 31 Aug 2022 17:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232210AbiHaVbH (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 31 Aug 2022 17:31:07 -0400
X-Greylist: delayed 1791 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 31 Aug 2022 14:31:02 PDT
Received: from smtp-1.orcon.net.nz (smtp-1.orcon.net.nz [60.234.4.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59A4D5DDF
        for <linux-alpha@vger.kernel.org>; Wed, 31 Aug 2022 14:31:02 -0700 (PDT)
Received: from [121.99.247.178] (port=34876 helo=creeky)
        by smtp-1.orcon.net.nz with esmtpa (Exim 4.90_1)
        (envelope-from <mcree@orcon.net.nz>)
        id 1oTUpX-00081B-9V; Thu, 01 Sep 2022 09:01:00 +1200
Date:   Thu, 1 Sep 2022 09:00:58 +1200
From:   Michael Cree <mcree@orcon.net.nz>
To:     Richard Henderson <richard.henderson@linaro.org>
Cc:     Shaomin Deng <dengshaomin@cdjrlc.com>, ink@jurassic.park.msu.ru,
        mattst88@gmail.com, linux-alpha@vger.kernel.org
Subject: Re: [PATCH] alpha: Fix double word in comments
Message-ID: <Yw/MCsb9v6jXWcE1@creeky>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
        Richard Henderson <richard.henderson@linaro.org>,
        Shaomin Deng <dengshaomin@cdjrlc.com>, ink@jurassic.park.msu.ru,
        mattst88@gmail.com, linux-alpha@vger.kernel.org
References: <20220830074202.11274-1-dengshaomin@cdjrlc.com>
 <3ad149d0-916c-e80e-ef17-ca406a4d7f6d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ad149d0-916c-e80e-ef17-ca406a4d7f6d@linaro.org>
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, Aug 30, 2022 at 07:52:56AM -0700, Richard Henderson wrote:
> On 8/30/22 00:42, Shaomin Deng wrote:
> > Delete the rebundant word "and" in comments.
> 
> typo.

Are you sure it's a typo and not that the first "and" is a conjunction
and the second "and" is a verb (more properly "and out") that acts on
the object, namely "those lines"?

Cheers
Michael.

> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> > 
> > Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
> > ---
> >   arch/alpha/kernel/irq_i8259.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/alpha/kernel/irq_i8259.c b/arch/alpha/kernel/irq_i8259.c
> > index 1dcf0d9038fd..db574dcd6675 100644
> > --- a/arch/alpha/kernel/irq_i8259.c
> > +++ b/arch/alpha/kernel/irq_i8259.c
> > @@ -147,7 +147,7 @@ isa_no_iack_sc_device_interrupt(unsigned long vector)
> >   	 */
> >   	/*
> >   	 *  The first read of gives you *all* interrupting lines.
> > -	 *  Therefore, read the mask register and and out those lines
> > +	 *  Therefore, read the mask register and out those lines
> >   	 *  not enabled.  Note that some documentation has 21 and a1
> >   	 *  write only.  This is not true.
> >   	 */
> 
