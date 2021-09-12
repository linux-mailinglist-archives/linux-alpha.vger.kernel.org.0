Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61575407FAB
	for <lists+linux-alpha@lfdr.de>; Sun, 12 Sep 2021 21:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235824AbhILTUC (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 12 Sep 2021 15:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234625AbhILTUC (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sun, 12 Sep 2021 15:20:02 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A82C061574
        for <linux-alpha@vger.kernel.org>; Sun, 12 Sep 2021 12:18:47 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id h1so13123414ljl.9
        for <linux-alpha@vger.kernel.org>; Sun, 12 Sep 2021 12:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E1PHZ6ydkqEkrZPVcY11k8G+o6nXM73c5JaOIi36jdM=;
        b=Mmh3TCnuXic/hCA6XvkP2osD5zmauEUtEa852ODITJl9q7DRJZnlYFaFYG+mxH6vf6
         Z+ggUrlsmP9EQRyIHakVw8bJD81GHQopdHiqd4QBP+UGydXePHYv5SH2cpjAaKjOE5af
         i5L6vjez7vZKGjXnjuCG5wVITdXtC1IYH3rOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E1PHZ6ydkqEkrZPVcY11k8G+o6nXM73c5JaOIi36jdM=;
        b=5LlLvE/nvvPnoDPhWmJyPN/rp+04RSWyynVQQDK3FsfvPQsbERJMmMyWfvdrPHdd+R
         vPBE170Trt9C+kzxwFAInMh0FbDWX97zHxpbjLFUq4OnbPzH2bXK+QWF9rp0BKv9aot4
         /d96glt0DXQMZNnGgdy1x4VftmyNVcJWwME2KtRC8pqI3SZag5Fj5n6Yj+1gcDLkssww
         ZYW8rKULHUPaUYFLovyZY6maj5t6j0iey4mXhNyoMCBx2VeUYAflx4oH3PWIRpDJufxU
         YnaCvn7x9kQI4gkDHqXf67mPpc1HcWiKNRe1/vfga3QIAMETypyvJM/EbUvCd9Ggo/aj
         XitQ==
X-Gm-Message-State: AOAM533k+QuXRnJ93fEfVGsJqXccQoGv9wmEbfXnc3eFZbSwPA4YrhWI
        N+OrR2/PUthDtZqfwgFInjd+UNe2MvTMRYaDhKo=
X-Google-Smtp-Source: ABdhPJy4YOTnwZMB6fFpY2dHzb0PH6UQDdHGvDBE+uTm1thp35Z1K1RAMfT48P5WkPp59JlJVXmbDA==
X-Received: by 2002:a05:651c:1b3:: with SMTP id c19mr7424749ljn.16.1631474325855;
        Sun, 12 Sep 2021 12:18:45 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id k10sm689431ljn.118.2021.09.12.12.18.45
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Sep 2021 12:18:45 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id k4so16266450lfj.7
        for <linux-alpha@vger.kernel.org>; Sun, 12 Sep 2021 12:18:45 -0700 (PDT)
X-Received: by 2002:a05:6512:3d04:: with SMTP id d4mr6147162lfv.474.1631473913911;
 Sun, 12 Sep 2021 12:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210912160149.2227137-1-linux@roeck-us.net> <20210912160149.2227137-4-linux@roeck-us.net>
In-Reply-To: <20210912160149.2227137-4-linux@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 12 Sep 2021 12:11:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi1TBvyk7SWX+5LLYN8ZnTJMut1keQbOrKCG=nb08hdiQ@mail.gmail.com>
Message-ID: <CAHk-=wi1TBvyk7SWX+5LLYN8ZnTJMut1keQbOrKCG=nb08hdiQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] parisc: Use absolute_pointer for memcmp on fixed
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
> -       running_on_qemu = (memcmp(&PAGE0->pad0, "SeaBIOS", 8) == 0);
> +       running_on_qemu = (memcmp(absolute_pointer(&PAGE0->pad0), "SeaBIOS", 8) == 0);

This seems entirely the wrong thing to do, and makes no sense. That
"&PAGE0->pad0" is a perfectly valid pointer, and that's not where the
problem is.

The problem is "PAGE0" itself:

    #define PAGE0   ((struct zeropage *)__PAGE_OFFSET)

which takes that absolute offset and creates a pointer out of it.

IOW, _that_ is what should have the "absolute_pointer()" thing, and in
that context the name of that macro and its use actually makes sense.

No?

An alternative - and possibly cleaner - approach that doesn't need
absolute_pointer() at all might be to just do

        extern struct zeropage PAGE0;

and then make that PAGE0 be defined to __PAGE_OFFSET in the parisc
vmlinux.lds.S file.

Then doing things like

        running_on_qemu = !memcmp(&PAGE0.pad0, "SeaBIOS", 8);

would JustWork(tm).

Hmm?

             Linus
