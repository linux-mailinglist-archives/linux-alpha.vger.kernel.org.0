Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3DA040CD75
	for <lists+linux-alpha@lfdr.de>; Wed, 15 Sep 2021 21:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbhIOTwH (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 15 Sep 2021 15:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbhIOTwC (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 15 Sep 2021 15:52:02 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5484CC061764
        for <linux-alpha@vger.kernel.org>; Wed, 15 Sep 2021 12:50:43 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id m3so7019957lfu.2
        for <linux-alpha@vger.kernel.org>; Wed, 15 Sep 2021 12:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nI3oXjB5y7fgBDUAfkrt5Qjrdw7kij1HF6V7usZScd0=;
        b=dDkQ2iIzDzvrHagUv0HQt/yEqNuVlVfROtNamlO02CizTu2FICtXWd210Bes/CwlqB
         vjF/fdxzFxIz7v0M5Mc4QD77K9x8ec18TENbGfCqGbSG3HiLnbhqoA4lCtQEqvSsm3+w
         v6hYS+kH7FyOqPuDkRIGswKh56YqlIWBTmiYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nI3oXjB5y7fgBDUAfkrt5Qjrdw7kij1HF6V7usZScd0=;
        b=oMxw9EQ2A0SHJ6/dLBTY18EEcBkDmxW8dvgNmnEphp+aiFKR7Nq5CDEbjwvWyKjOk9
         dPrYl3AU19NKuCv0MKhN5LMnUxb0nDP+vgGsXnVTnKjEjEHvVGUaSCnCu8B14FFKw9nA
         zBBPC5fs+07unbPwITSHotDOZS6pHHNaL47KXdUqULQjWxJSWRu/nn41Pv1hvrXLlldT
         Ohdi7zyuUntJI16yMXfZa8hv7pChmCozp6mfaWm7Vvet03qu/Orf5D4CZ/U9e8FZTCO1
         jlgIVC0G/d51YMqC+NXQLYF+KkFOP7vKCyQ5r3fLvD7rm/pWK9ykV9A9+xo2w8kkiG5V
         lsEg==
X-Gm-Message-State: AOAM532WBljJ5AfW9bIZ/kRQ3UkEH7B9jL2AN/uNy5C4b08UhW8h7rFK
        RRjCXZauwt60oKkECe53TzHZAV8ba1nrqfNy/H8=
X-Google-Smtp-Source: ABdhPJy45teMbKOLJi54+LdEinrEUM2pzlzqJAXZS2QmqP6fMpgnc+xLoyU/jLxu7fiASAuby+aWGA==
X-Received: by 2002:a2e:6a03:: with SMTP id f3mr1457872ljc.487.1631735441273;
        Wed, 15 Sep 2021 12:50:41 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id m20sm94958ljc.20.2021.09.15.12.50.38
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 12:50:39 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id y28so8958557lfb.0
        for <linux-alpha@vger.kernel.org>; Wed, 15 Sep 2021 12:50:38 -0700 (PDT)
X-Received: by 2002:a05:6512:3991:: with SMTP id j17mr1268421lfu.280.1631735438424;
 Wed, 15 Sep 2021 12:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210915035227.630204-1-linux@roeck-us.net> <CAHk-=wjXr+NnNPTorhaW81eAbdF90foVo-5pQqRmXZi-ZGaX6Q@mail.gmail.com>
 <47fcc9cc-7d2e-bc79-122b-8eccfe00d8f3@roeck-us.net> <CAHk-=wgdEHPm6vGcJ_Zr-Q_p=Muv1Oby5H2+6QyPGxiZ7_Wv+w@mail.gmail.com>
In-Reply-To: <CAHk-=wgdEHPm6vGcJ_Zr-Q_p=Muv1Oby5H2+6QyPGxiZ7_Wv+w@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 15 Sep 2021 12:50:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=whSkMh9mc7+OSBZZvpoEEJmS6qY7kX3qixEXTLKGc=wgw@mail.gmail.com>
Message-ID: <CAHk-=whSkMh9mc7+OSBZZvpoEEJmS6qY7kX3qixEXTLKGc=wgw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
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

On Wed, Sep 15, 2021 at 12:47 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> What other notable issues end up being still live? I sent out that one
> patch for sparc, but didn't get any response to it. I'm inclined to
> just apply it (the 'struct mdesc_hdr' pointer misuse one).

Oh, I forgot about the qnx4 one. That happens on sparc, possibly
others, but not on x86-64.

I'll go look at that patch too.

          Linus
