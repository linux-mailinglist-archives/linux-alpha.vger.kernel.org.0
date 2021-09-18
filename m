Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 361D241089F
	for <lists+linux-alpha@lfdr.de>; Sat, 18 Sep 2021 22:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239399AbhIRUr6 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 18 Sep 2021 16:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239290AbhIRUrz (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 18 Sep 2021 16:47:55 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC3CC061757
        for <linux-alpha@vger.kernel.org>; Sat, 18 Sep 2021 13:46:31 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id y28so47524241lfb.0
        for <linux-alpha@vger.kernel.org>; Sat, 18 Sep 2021 13:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EgyQSOoQGXbqZDY5vmTdmtdWclji1aa8k4Dg+pV0f0o=;
        b=SEpYwuptd5hG3QJm95kYyoOdykEPWmWM41H04iYKD9x+gej2hvZLmI9MuQSd8s9QNq
         BFtt8Khl1a0U7BIzOb2mMeUeYORXvw3f1yoKo69QHfJASnbgDxK63qWoaCvmswBFSfMk
         A/FZp+Rl5zIq56YhAZEa2tHT6K7SetPgVBSjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EgyQSOoQGXbqZDY5vmTdmtdWclji1aa8k4Dg+pV0f0o=;
        b=elFPji3Jj3l1JWHkeWgk+s5xxJ09fvBtyKtUKZgstUpdBxgvLqq41S8/vhQuK5FUSD
         A9DfJYnzTFJNc4jqVVLbZF51jAt8RPh7z5MdSCSnaBSth+ikiApRAgMNskiOGNha8adz
         CJHIYxY4KoK0O0aVSPcYT2wbZMEZFeUguwsI9LhHK6a6Q+/ZrIvlMcvwXDdvXvhpDPUX
         Y+WNT2Q30OqMTFGlolKoi85WhcpKQGri5CdS1+rWL7chtvzxd1dVfanu/goJxYHKBhAz
         uZpQste2C9Fv87eDSahyud7lF55c3rTbjVDNF7f/SqSe4BZGYOOaB219JzVPhh2PRfn4
         qNaA==
X-Gm-Message-State: AOAM533JhLNKVmCErUiwM28kLHPOlDmj4qHydxIul9zhem/o7wwqvDDy
        dQcDz6s5BMXpxlEIntkmvypsyufoRPWf8u5cwRk=
X-Google-Smtp-Source: ABdhPJzI8UhJAT6/whtoSv7+X60EhFE1QptgSxMBsFfNhO/6u0v0arzsXQYCQcNG1LTrE99ttz/F6w==
X-Received: by 2002:ac2:4297:: with SMTP id m23mr12918364lfh.487.1631997988686;
        Sat, 18 Sep 2021 13:46:28 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id y6sm851098lfa.122.2021.09.18.13.46.26
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 13:46:26 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id y28so47523845lfb.0
        for <linux-alpha@vger.kernel.org>; Sat, 18 Sep 2021 13:46:26 -0700 (PDT)
X-Received: by 2002:a05:6512:2611:: with SMTP id bt17mr13595935lfb.141.1631997986070;
 Sat, 18 Sep 2021 13:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whY5mLggPSr2U00mqgUbRJYnYSxtNZm4FnEtQrHftYr8Q@mail.gmail.com>
 <202109182026.18IKQLng003683@valdese.nms.ulrich-teichert.org>
In-Reply-To: <202109182026.18IKQLng003683@valdese.nms.ulrich-teichert.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 18 Sep 2021 13:46:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjZukwHDpm6PUP=cFTi8wWQs6Z5Np7xv7SRphNqvm0FPw@mail.gmail.com>
Message-ID: <CAHk-=wjZukwHDpm6PUP=cFTi8wWQs6Z5Np7xv7SRphNqvm0FPw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
To:     Ulrich Teichert <krypton@ulrich-teichert.org>
Cc:     Michael Cree <mcree@orcon.net.nz>,
        Guenter Roeck <linux@roeck-us.net>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sat, Sep 18, 2021 at 1:26 PM Ulrich Teichert
<krypton@ulrich-teichert.org> wrote:
>
> >
> > (I forget which alpha I had. For some reason I want to think I had an
> > EISA machine and probably Jensen. Maybe upgraded to a 164 later?)
>
> Well, as this was way back in 1995, it was perhaps a Multia? Also
> named UDB, a small "booksize" model.

No, that came later. I had one of the very original ones.

I'm pretty sure it was that Jensen platform, but I'm too lazy to go
back and look.

> > Can you send me your Jensen config?
>
> Sure, attached here. I don't know if it helps - I can't tell you why I
> used 4.18-rc5 for it, that was in 2018... Oh man, I am spending too much
> time at work...

I ended up hacking something up which was enough to show the build
problems, and then some.

But your config shows _other_ errors with the IO functions, so I guess
I'll need to look at that one too.

There's clearly a reason that Jensen was marked BROKEN in the Kconfig,
the whole situation with the IO accessor functions on that platform is
a disaster.

              Linus
