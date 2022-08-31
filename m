Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1225A8902
	for <lists+linux-alpha@lfdr.de>; Thu,  1 Sep 2022 00:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232566AbiHaWb0 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 31 Aug 2022 18:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232491AbiHaWbO (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 31 Aug 2022 18:31:14 -0400
X-Greylist: delayed 1271 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 31 Aug 2022 15:30:23 PDT
Received: from gherkin.frus.com (cpe-67-11-226-98.satx.res.rr.com [67.11.226.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1B4225A897
        for <linux-alpha@vger.kernel.org>; Wed, 31 Aug 2022 15:30:21 -0700 (PDT)
Received: by gherkin.frus.com (Postfix, from userid 500)
        id 37502693CF; Wed, 31 Aug 2022 17:09:09 -0500 (CDT)
Date:   Wed, 31 Aug 2022 17:09:09 -0500
From:   Bob Tracy <rct@frus.com>
To:     linux-alpha@vger.kernel.org
Cc:     richard.henderson@linaro.org, ink@jurassic.park.msu.ru,
        mattst88@gmail.com
Subject: Re: [PATCH] alpha: Fix double word in comments
Message-ID: <Yw/cBRA2FIsW7QhN@gherkin.frus.com>
References: <20220830074202.11274-1-dengshaomin@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830074202.11274-1-dengshaomin@cdjrlc.com>
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_00,RCVD_IN_PBL,
        RCVD_IN_SORBS_DUL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, Aug 30, 2022 at 03:42:02AM -0400, Shaomin Deng wrote:
> Delete the rebundant word "and" in comments.
> 
> Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
> ---
>  arch/alpha/kernel/irq_i8259.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/alpha/kernel/irq_i8259.c b/arch/alpha/kernel/irq_i8259.c
> index 1dcf0d9038fd..db574dcd6675 100644
> --- a/arch/alpha/kernel/irq_i8259.c
> +++ b/arch/alpha/kernel/irq_i8259.c
> @@ -147,7 +147,7 @@ isa_no_iack_sc_device_interrupt(unsigned long vector)
>  	 */
>  	/* 
>  	 *  The first read of gives you *all* interrupting lines.
> -	 *  Therefore, read the mask register and and out those lines
> +	 *  Therefore, read the mask register and out those lines
>  	 *  not enabled.  Note that some documentation has 21 and a1 
>  	 *  write only.  This is not true.
>  	 */
> -- 
> 2.35.1

This may have been beaten to death elsewhere, but the comment without
the second "and" doesn't make any sense, so I conclude the second "and"
is a logic operation.  As in, "... and AND out those lines...".  If that
is the case, capitalization will help disambiguate, much as I would expect
to see "OR" if that was the intended operation.  The code following the
read of the mask register (not included in the diff fragment above) should
make the meaning clear.

Accordingly, I would reject this proposed patch.

Respectfully,
--Bob
