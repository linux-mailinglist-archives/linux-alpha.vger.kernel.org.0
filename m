Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDD0407FA0
	for <lists+linux-alpha@lfdr.de>; Sun, 12 Sep 2021 21:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235826AbhILTOs (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 12 Sep 2021 15:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235622AbhILTOr (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sun, 12 Sep 2021 15:14:47 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C16C061574
        for <linux-alpha@vger.kernel.org>; Sun, 12 Sep 2021 12:13:33 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id k13so16258106lfv.2
        for <linux-alpha@vger.kernel.org>; Sun, 12 Sep 2021 12:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tzZRty5syTefvslqvSNH1KyI4p4ePIHehKrpq3jNHak=;
        b=UhV7ZB03lfxtT+Ye8FzC9W6hmCQoAxoCGQimJcLY7prrx8mbKe9DIiT4SGaXesQFeB
         bwrVZJdZaPGgx4eSKLVt3nOkqcznQcyPpP9BRmCWBP8k038tMJltDQ1VrUpAU3aNMwNA
         gTOxiP2LUi8KOIoIT19q3qZx861ljKejcehZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tzZRty5syTefvslqvSNH1KyI4p4ePIHehKrpq3jNHak=;
        b=VV9QDS7XjdwwmXFPVkGMg5Mb2HQcAjValetp/HvrMj+BFIoeNMM6/uWz9yxidR+5DT
         ong6HWNaMi5aABkPgW3G+pFolL+PdQtG3jXPsLi77w37rWp73AIfh4dllUKH8pEGiIFr
         x5TvPYO1fuvwB59kzf/acoiswv4Qil8pp+t9hh1pkNFTq8FLcD2YHoGPi9USFPCki/ux
         0BVsKqs7AdZur/m5tmqubBJeLQ3DfY34t76Qtl3bccumtwTTJkQdWpeLRApF3MzffN1x
         /a3FmPXNqdVASau6f/UiUBLL84yQweLsGes2tJzpLs2+CZQI5GqdxSKicp8jxayUJrnX
         XVBw==
X-Gm-Message-State: AOAM533UUANby9rCDeT5oKKk6QXF2GOpDXAR8jzbz1eKojxeoVSW42Ru
        KMT3Gb/FWY+9+2uLO/9c2fcj8IFSKx4Owm8gNC4=
X-Google-Smtp-Source: ABdhPJylFNCS3hvUuy5DUMxhjlKo4daxWq05MaWj0+gXRDIBDpaimJW7pl+s0+CYfaZFCG4pIsZF+Q==
X-Received: by 2002:a05:6512:2017:: with SMTP id a23mr6456412lfb.686.1631474010788;
        Sun, 12 Sep 2021 12:13:30 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id v66sm357193lfa.84.2021.09.12.12.13.27
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Sep 2021 12:13:27 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id n2so16323152lfk.0
        for <linux-alpha@vger.kernel.org>; Sun, 12 Sep 2021 12:13:27 -0700 (PDT)
X-Received: by 2002:a05:6512:3da5:: with SMTP id k37mr6351605lfv.655.1631474006987;
 Sun, 12 Sep 2021 12:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210912160149.2227137-1-linux@roeck-us.net> <20210912160149.2227137-5-linux@roeck-us.net>
In-Reply-To: <20210912160149.2227137-5-linux@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 12 Sep 2021 12:13:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi1=8shingNuo1CtfJ7eDByDsmwsz750Nbxq=7q0Gs+zg@mail.gmail.com>
Message-ID: <CAHk-=wi1=8shingNuo1CtfJ7eDByDsmwsz750Nbxq=7q0Gs+zg@mail.gmail.com>
Subject: Re: [PATCH 4/4] alpha: Use absolute_pointer for strcmp on fixed
 memory location
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Richard Henderson <rth@twiddle.net>,
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

On Sun, Sep 12, 2021 at 9:02 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> -       if (strcmp(COMMAND_LINE, "INSTALL") == 0) {
> +       if (strcmp(absolute_pointer(COMMAND_LINE), "INSTALL") == 0) {

Again, this feels very much like treating the symptoms, not actually
fixing the real issue.

It's COMMAND_LINE itself that should have been fixed up, not that one use of it.

Because the only reason you didn't get a warning from later uses is
that 'strcmp()' is doing compiler-specific magic. You're just delaying
the inevitable warnings about the other uses of that thing.

            Linus
