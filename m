Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99A5F51EB99
	for <lists+linux-alpha@lfdr.de>; Sun,  8 May 2022 06:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbiEHEk5 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 8 May 2022 00:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbiEHEk4 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Sun, 8 May 2022 00:40:56 -0400
Received: from relay4.hostedemail.com (relay4.hostedemail.com [64.99.140.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD444101F5
        for <linux-alpha@vger.kernel.org>; Sat,  7 May 2022 21:37:06 -0700 (PDT)
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay07.hostedemail.com (Postfix) with ESMTP id AC05920A84;
        Sun,  8 May 2022 04:30:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf17.hostedemail.com (Postfix) with ESMTPA id 59CC51B;
        Sun,  8 May 2022 04:30:57 +0000 (UTC)
Message-ID: <a18ecdef2efc0a5c23a85cc2a6dc17cf6e7d94c9.camel@perches.com>
Subject: Re: [PATCH] alpha: Fix comment typo
From:   Joe Perches <joe@perches.com>
To:     Jason Wang <wangborong@cdjrlc.com>, rth@twiddle.net
Cc:     ink@jurassic.park.msu.ru, mattst88@gmail.com,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Sat, 07 May 2022 21:30:56 -0700
In-Reply-To: <20220508030029.123056-1-wangborong@cdjrlc.com>
References: <20220508030029.123056-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Stat-Signature: strd3hu6pi1qtfwr76qwcc69xcqmuo67
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 59CC51B
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19mXUkPMZizfPtbSah8N9SOsq5vxophYbQ=
X-HE-Tag: 1651984257-534994
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sun, 2022-05-08 at 11:00 +0800, Jason Wang wrote:
> Remove one of the repeated 'and' in comment line 150.
[]
> diff --git a/arch/alpha/kernel/irq_i8259.c b/arch/alpha/kernel/irq_i8259.c
[]
> @@ -147,7 +147,7 @@ isa_no_iack_sc_device_interrupt(unsigned long vector)
>  	 */
>  	/* 
>  	 *  The first read of gives you *all* interrupting lines.
> -	 *  Therefore, read the mask register and and out those lines
> +	 *  Therefore, read the mask register and out those lines

Not really a repeated word but
perhaps s/and and/then and/

>  	 *  not enabled.  Note that some documentation has 21 and a1 
>  	 *  write only.  This is not true.
>  	 */


