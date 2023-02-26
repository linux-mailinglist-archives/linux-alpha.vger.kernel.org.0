Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9DC66A2D08
	for <lists+linux-alpha@lfdr.de>; Sun, 26 Feb 2023 03:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjBZCF1 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 25 Feb 2023 21:05:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjBZCF0 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 25 Feb 2023 21:05:26 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A170510AAD
        for <linux-alpha@vger.kernel.org>; Sat, 25 Feb 2023 18:05:25 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id t129so1194457iof.12
        for <linux-alpha@vger.kernel.org>; Sat, 25 Feb 2023 18:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0L8r3cRKnMGy4Y82nwO2/l5Qawyc49ENJXAV167Z7Yk=;
        b=NdnIxmRGf1OVCSJ73bW7SlG0J+VV24DzAMzHh8uhA1OrlvMeFnjAufCeMgpmYnStdl
         OYwvfZtqLPibMsxewZcCCTl3OFE3gducfshgPmaEpt8Lqgc1xkJ9I/qKtCTasrVFkTIc
         0P8t5EFgQXiaMmEMRNV0ejgtWyGzflZbbzsDoxb82gM9Mq4pp9QWpqh1W+b5Zv0N6SKX
         WtbjCDb47N6nHPIq40oU2ZA3BUEOs8K4i1YVb9RA34SiAM42mSc7/A6qZmPl6mXCzeHr
         9108SHx3kvAmXUuSn7/Fyzpz1UCZemvxT6X35iCIewUfjc7/yO+2gmBlD1Is/3S8SS6w
         BtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0L8r3cRKnMGy4Y82nwO2/l5Qawyc49ENJXAV167Z7Yk=;
        b=ceaLHDfIJDU5ZAU0RKEavqOoH/QMM142kSFsQYPY2z2o2h49/1Y7uCgh+0QdM75luY
         QxSjWW5HsuAjnoXabMjFKkodSTfZfIYCIPMVUB6Q4BEuyFOeRQzU+Jhyif795uP9W8nn
         80EKepsKK2TZ8XIf3ugbuKzWjY6i5lXRizA9K2Nz6J29azCaYi2v2vjR58sedP+75YgJ
         mUVb8EKaRx86uMtO3fz3rDRHm8go40A6SGxmF/EYS1b13ErBM8DHvwalbAZpgj77HUjS
         kQ9katPhdK5OnNs9yegkkK61ijuVc/yyECUyTT4oTzn5CjQfU/2O+fknIqLRYeDotCln
         TYPg==
X-Gm-Message-State: AO0yUKVL858j0M+gdTNzSzThslK24t84GEesPy2HLq9Tdnlpevvn0oJm
        dhHGbK7tGPm0j1g3CoTvTqfr3K0nyacPJGNKm7k=
X-Google-Smtp-Source: AK7set/SerfVY4gJwwpSw8I5li0s/4RwFO6N/n87vPtx/OfugYkkuwCsdrwXXYZ3uxZJfXpcgr2O6QfBlgjABlibZVo=
X-Received: by 2002:a6b:b28c:0:b0:745:68a2:1ec1 with SMTP id
 b134-20020a6bb28c000000b0074568a21ec1mr4154050iof.0.1677377125006; Sat, 25
 Feb 2023 18:05:25 -0800 (PST)
MIME-Version: 1.0
References: <20230204004702.692906-1-rj1@riseup.net>
In-Reply-To: <20230204004702.692906-1-rj1@riseup.net>
From:   Matt Turner <mattst88@gmail.com>
Date:   Sat, 25 Feb 2023 21:05:13 -0500
Message-ID: <CAEdQ38EPhkgD65hk0yybD34gczUS49xMxDjnebRXGbTdEPbcaA@mail.gmail.com>
Subject: Re: [PATCH] fixed a typo in core_cia.c
To:     rj1 <rj1@riseup.net>
Cc:     linux-alpha@vger.kernel.org, richard.henderson@linaro.org,
        ink@jurassic.park.msu.ru
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Fri, Feb 3, 2023 at 7:48 PM rj1 <rj1@riseup.net> wrote:
>
> ---
>  arch/alpha/kernel/core_cia.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/core_cia.c b/arch/alpha/kernel/core_cia.c
> index f489170201c3..12926e9538b8 100644
> --- a/arch/alpha/kernel/core_cia.c
> +++ b/arch/alpha/kernel/core_cia.c
> @@ -527,7 +527,7 @@ verify_tb_operation(void)
>         if (use_tbia_try2) {
>                 alpha_mv.mv_pci_tbi = cia_pci_tbi_try2;
>
> -               /* Tags 0-3 must be disabled if we use this workaraund. */
> +               /* Tags 0-3 must be disabled if we use this workaround. */
>                 wmb();
>                 *(vip)CIA_IOC_TB_TAGn(0) = 2;
>                 *(vip)CIA_IOC_TB_TAGn(1) = 2;
> --
> 2.39.1
>

Thanks for the patch! This was included in my pull request today and
is now upstream in Linus' tree.
