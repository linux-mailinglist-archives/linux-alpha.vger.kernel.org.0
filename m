Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 007F84108CB
	for <lists+linux-alpha@lfdr.de>; Sun, 19 Sep 2021 00:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240391AbhIRWK6 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 18 Sep 2021 18:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238312AbhIRWK5 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 18 Sep 2021 18:10:57 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08967C061574
        for <linux-alpha@vger.kernel.org>; Sat, 18 Sep 2021 15:09:33 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g1so49490967lfj.12
        for <linux-alpha@vger.kernel.org>; Sat, 18 Sep 2021 15:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hhzplMeBODusyr1H2stA0puUgPSaTtOBgK77tHO282k=;
        b=JTYIBPqLj92nNTxPKVgSXgrpmcBI0kIM1GLPs6qJei5SauEXmL4YjUER2rr88W6PSq
         1DyThW7PUpCkaPaRUzGHd63izjL4GOav/VKQujZg/VmlgUEkUA00v11NnnZZ74r1NHxh
         4wDTaM/CdGI1g53lKb6vt1ECENxdljnyVleYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hhzplMeBODusyr1H2stA0puUgPSaTtOBgK77tHO282k=;
        b=hatardKXDhljyYn3PGNagSE9ZtUS6LHppuBJGDjtzDZiaY25TsWGz1mtngdg8CVruz
         n8iL4tm3BH2X89HzM4u11HKX2TzuocrYwjkmv42GtjCaJITJJKq0J05v1s84UHuEIYZL
         U9KjHwoziEMQE7OnS6dOLaWDIu7b/l7Qy3GTr1P4ASDgkIwwemwsjDxKqH/OPsV4A3ik
         qsZKGUkZV/32t2C4304HGOyTAiN5uCQyENX5XhLIneqm39Xq/btKbplWV88zx1i9q55v
         9GFl7K/isJC/XYy3vsHBAVLWnJsQOHV36LEEK57XYuVTW7EiWFihgXkhl24PXC9NT7eq
         DfiQ==
X-Gm-Message-State: AOAM532Se+hR9KZVs8YxEifCMjXsbWoDBfvqAnSEu3dfSJRePX38Kvck
        7iTYzs1TXxmA5A7m6/WYEz4BxtTUVDiagT8vwlg=
X-Google-Smtp-Source: ABdhPJw1tbc8WsU9BTOFsem4DvhL2+m0fPZMlI431FDvJZHDhCzGvwrxcDvT5loGeeiMwip04Vi9iw==
X-Received: by 2002:a2e:7605:: with SMTP id r5mr4406246ljc.107.1632002970620;
        Sat, 18 Sep 2021 15:09:30 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id br21sm861607lfb.223.2021.09.18.15.09.28
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 15:09:29 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id g1so49490660lfj.12
        for <linux-alpha@vger.kernel.org>; Sat, 18 Sep 2021 15:09:28 -0700 (PDT)
X-Received: by 2002:a05:6512:3d29:: with SMTP id d41mr2659681lfv.474.1632002968346;
 Sat, 18 Sep 2021 15:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whY5mLggPSr2U00mqgUbRJYnYSxtNZm4FnEtQrHftYr8Q@mail.gmail.com>
 <202109182026.18IKQLng003683@valdese.nms.ulrich-teichert.org>
In-Reply-To: <202109182026.18IKQLng003683@valdese.nms.ulrich-teichert.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 18 Sep 2021 15:09:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh-=tMO9iCA4v+WgPSd+Gbowe5kptwo+okahihnO2fAOA@mail.gmail.com>
Message-ID: <CAHk-=wh-=tMO9iCA4v+WgPSd+Gbowe5kptwo+okahihnO2fAOA@mail.gmail.com>
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
> I was just tinkering with it to get it compiled without warning,
> I certainly didn't get the big picture :-/

Ok, you shamed me into some tinkering too, and I fixed a couple of
issues with the alpha build.

The whole "pci_iounmap()" mess is not something I solved (you were
cc'd on the email I sent out about that), but I did test a few
different Jensen configurations and fixed a couple of uglies.

So at least _some_ Jensen configurations build cleanly once more, and
I re-enabled JENSEN as a valid machine target.

But if it doesn't boot, it's all fairly moot. And those things are a
pain to debug, and if the last booting kernel was years and years ago,
I don't think it realistically will necessarily ever be fixed.

Oh well. I have an odd love-hate relationship with alpha.

I think it's one of the worst architectures ever designed (memory
ordering is completely broken, and the lack of byte operations in the
original specs were a big reason for the initial problems and eventual
failure).

But at the same time, I really did enjoy it back in the day, and it
_was_ the first port I did, and the first truly integrated kernel
architecture (the original Linux m68k port that preceded it was a
"hack up and replace" job rather than "integrate")

           Linus
