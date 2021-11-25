Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C6245D3D7
	for <lists+linux-alpha@lfdr.de>; Thu, 25 Nov 2021 05:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbhKYEQg (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 24 Nov 2021 23:16:36 -0500
Received: from smtprelay0195.hostedemail.com ([216.40.44.195]:36826 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238594AbhKYEOg (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 24 Nov 2021 23:14:36 -0500
X-Greylist: delayed 632 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Nov 2021 23:14:35 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave08.hostedemail.com (Postfix) with ESMTP id 512A2181941A2
        for <linux-alpha@vger.kernel.org>; Thu, 25 Nov 2021 04:02:53 +0000 (UTC)
Received: from omf20.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 1A2B8180286D2;
        Thu, 25 Nov 2021 04:00:52 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id 9CF9A8019069;
        Thu, 25 Nov 2021 04:00:49 +0000 (UTC)
Message-ID: <5391025983087ae9d1292387bc0b2b37c9c57863.camel@perches.com>
Subject: Re: [PATCH] mm: Fix warning comparing pointer to 0
From:   Joe Perches <joe@perches.com>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, rth@twiddle.net
Cc:     ink@jurassic.park.msu.ru, mattst88@gmail.com,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 24 Nov 2021 20:00:50 -0800
In-Reply-To: <1637748818-21730-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1637748818-21730-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.09
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 9CF9A8019069
X-Stat-Signature: 6zqqzbz1sqt5oazxhb545nytrck9tzbz
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19ZHyG6HZuZcrDFFVBqrCEJf5gPp55xOJA=
X-HE-Tag: 1637812849-701401
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Wed, 2021-11-24 at 18:13 +0800, Jiapeng Chong wrote:
> Fix the following coccicheck warning:
> 
> ./arch/alpha/mm/fault.c:193:52-53: WARNING comparing pointer to 0.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
[]
> diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
[]
> @@ -190,7 +190,7 @@
>  
>   no_context:
>  	/* Are we prepared to handle this fault as an exception?  */
> -	if ((fixup = search_exception_tables(regs->pc)) != 0) {
> +	if (!(fixup = search_exception_tables(regs->pc)) {

This is now a reversed test.

The more typical kernel style is:

	fixup = search_exception_tables(regs->pc);
	if (fixup) {

>  		unsigned long newpc;
>  		newpc = fixup_exception(dpf_reg, fixup, regs->pc);
>  		regs->pc = newpc;

and it looks as if newpc is unnecessary.  Maybe:
---
 arch/alpha/mm/fault.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index eee5102c3d889..364b6322629cb 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -192,10 +192,9 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 
  no_context:
 	/* Are we prepared to handle this fault as an exception?  */
-	if ((fixup = search_exception_tables(regs->pc)) != 0) {
-		unsigned long newpc;
-		newpc = fixup_exception(dpf_reg, fixup, regs->pc);
-		regs->pc = newpc;
+	fixup = search_exception_tables(regs->pc)
+	if (fixup) {
+		regs->pc = fixup_exception(dpf_reg, fixup, regs->pc);
 		return;
 	}
 


