Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0A005AA6FF
	for <lists+linux-alpha@lfdr.de>; Fri,  2 Sep 2022 06:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiIBEZP (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 2 Sep 2022 00:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiIBEZO (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Fri, 2 Sep 2022 00:25:14 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C4172559A
        for <linux-alpha@vger.kernel.org>; Thu,  1 Sep 2022 21:25:12 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id m1so1124529edb.7
        for <linux-alpha@vger.kernel.org>; Thu, 01 Sep 2022 21:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=DNMV9IFQkgeSNCmDnVXBpUsVGpL/AV76Y6Bz/ERRPxE=;
        b=M54WbbUJ66QWCtytfwr6nfi7weprv1gdbbFSx2j7OZD3CiQex/eJv4ff0haKCow2UH
         aF1DblgbmhW0jJWnX1xu97zDyHEFx2OjD+mmnwg0z5oTWKF5CT1fdc2sin2KW3akYWsE
         wuYXpd4MnnNIpuAUUsisbKyWENR+MyXnCiGCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=DNMV9IFQkgeSNCmDnVXBpUsVGpL/AV76Y6Bz/ERRPxE=;
        b=YDXXoMPg/Amu7lulwRdXaQAfmYPWoYq8QWgMXG0o+eUFlgX1IvYvDP7bXlfE74syLS
         1vISoZbMdRFBo+5gM36c1rgr8gEz3GMzQHwsuGnoqwqisQoVQpykyRkH9c1f1/uvbboj
         CE/N5L3BrhdGGUpLRqlgSUOwyJ3evk5hZmbyUjaLhZk8euCNIOUgXT57E0azgtBtzMnb
         RO4k+n5e+gLlR/0nptftQ3Bzb2ZXZl2LBN0daEOk4RoedGQm0Fe3sbYtMbibB6GJD/Vr
         t/C40ecWBV9zUO1OFIGbd5dizAvvcunVO0eS7I7BbPvwJJ/qRJSBK8w6WICAmJq5axVJ
         mWZQ==
X-Gm-Message-State: ACgBeo0cz8htvRhv+2LDfyjnV1oPKRqLSHGAORwCaNJq5uut8V/fuZZv
        Xr+ijJHy5Xt6CZhUKVZRkygrQ8wA7B7hvEq9
X-Google-Smtp-Source: AA6agR5ZbCrjHd1iwdOiJ+dQxizmuvAOdXlTAxS0LV1+/WaEvpw6YcTpmOTnS7K+N+nUGO3YAXrT9w==
X-Received: by 2002:aa7:ca46:0:b0:447:af0a:be68 with SMTP id j6-20020aa7ca46000000b00447af0abe68mr30961148edt.327.1662092710349;
        Thu, 01 Sep 2022 21:25:10 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id e13-20020a170906314d00b0073d71792c8dsm606334eje.180.2022.09.01.21.25.09
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 21:25:09 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id k9so825279wri.0
        for <linux-alpha@vger.kernel.org>; Thu, 01 Sep 2022 21:25:09 -0700 (PDT)
X-Received: by 2002:a5d:6045:0:b0:226:d21d:947b with SMTP id
 j5-20020a5d6045000000b00226d21d947bmr15460363wrt.274.1662092709334; Thu, 01
 Sep 2022 21:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <YxFhB4/cEXX5aHbn@ZenIV> <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
 <20220902015012.2664521-7-viro@zeniv.linux.org.uk>
In-Reply-To: <20220902015012.2664521-7-viro@zeniv.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 1 Sep 2022 21:24:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjfCBF_xYtKacU920YFMKNDnesTUy-gYq8qHucLDTWNHQ@mail.gmail.com>
Message-ID: <CAHk-=wjfCBF_xYtKacU920YFMKNDnesTUy-gYq8qHucLDTWNHQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] alpha: lazy FPU switching
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, Sep 1, 2022 at 6:50 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>         On each context switch we save the FPU registers on stack
> of old process and restore FPU registers from the stack of new one.
> That allows us to avoid doing that each time we enter/leave the
> kernel mode; however, that can get suboptimal in some cases.

Do we really care, for what is effectively a dead architecture?

This patch feels like something that might have made sense 25 years
ago. Does it make sense today?

I guess I don't care (for the same reason), but just how much testing
has this gotten, and what subtle bugs might this have?

With the asm even having a comment about how it only works because
alpha doesn't do preemption (ARCH_NO_PREEMPT), but then the C code
does do those preempt_disable/enable pairs, and I see an actual bug in
there too:

Both alpha_read_fp_reg() and alpha_read_fp_reg_s() do a
preempt_enable() -> preempt_enable() pair (ie the first one should be
a preempt_disable()).

Does that bug matter? No. ARCH_NO_PREEMPT means that it's all no-ops
anyway. But it's wrong and I think shows the status of this patch -
well-meaning, but maybe not really fully thought out.

           Linus
