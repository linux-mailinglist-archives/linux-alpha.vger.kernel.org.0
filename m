Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 614BD79F63
	for <lists+linux-alpha@lfdr.de>; Tue, 30 Jul 2019 05:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbfG3DD3 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 29 Jul 2019 23:03:29 -0400
Received: from smtprelay0147.hostedemail.com ([216.40.44.147]:56115 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732197AbfG3C7X (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 29 Jul 2019 22:59:23 -0400
X-Greylist: delayed 493 seconds by postgrey-1.27 at vger.kernel.org; Mon, 29 Jul 2019 22:59:23 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 5382B181CBC33
        for <linux-alpha@vger.kernel.org>; Tue, 30 Jul 2019 02:51:10 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id A9B4F18224D78;
        Tue, 30 Jul 2019 02:51:08 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3870:3872:4321:4605:4823:5007:7514:7903:10004:10400:10848:11026:11232:11657:11658:11914:12043:12297:12555:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21451:21627:30012:30054:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:25,LUA_SUMMARY:none
X-HE-Tag: title66_9d2ae4e3cb1b
X-Filterd-Recvd-Size: 1909
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf02.hostedemail.com (Postfix) with ESMTPA;
        Tue, 30 Jul 2019 02:51:07 +0000 (UTC)
Message-ID: <3ec468adbd632c2e435c618a1027c4e6c8f97e38.camel@perches.com>
Subject: Re: [PATCH] alpha: Replace strncmp with str_has_prefix
From:   Joe Perches <joe@perches.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 29 Jul 2019 19:51:05 -0700
In-Reply-To: <20190730024401.17152-1-hslester96@gmail.com>
References: <20190730024401.17152-1-hslester96@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, 2019-07-30 at 10:44 +0800, Chuhong Yuan wrote:
> In commit b6b2735514bc
> ("tracing: Use str_has_prefix() instead of using fixed sizes")
> the newly introduced str_has_prefix() was used
> to replace error-prone strncmp(str, const, len).
> Here fix codes with the same pattern.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  arch/alpha/boot/tools/objstrip.c | 3 ++-
>  arch/alpha/kernel/setup.c        | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/alpha/boot/tools/objstrip.c b/arch/alpha/boot/tools/objstrip.c
[]
> @@ -148,7 +148,8 @@ main (int argc, char *argv[])
>  #ifdef __ELF__
>      elf = (struct elfhdr *) buf;
>  
> -    if (elf->e_ident[0] == 0x7f && strncmp((char *)elf->e_ident + 1, "ELF", 3) == 0) {
> +	if (elf->e_ident[0] == 0x7f &&
> +		str_has_prefix((char *)elf->e_ident + 1, "ELF")) {

While the original indentation didn't use tabs,
please do not make it worse by misaligning.


