Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F414108A9
	for <lists+linux-alpha@lfdr.de>; Sat, 18 Sep 2021 23:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239351AbhIRVOB (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 18 Sep 2021 17:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233074AbhIRVOA (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 18 Sep 2021 17:14:00 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D9CC061574
        for <linux-alpha@vger.kernel.org>; Sat, 18 Sep 2021 14:12:36 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id p29so47769862lfa.11
        for <linux-alpha@vger.kernel.org>; Sat, 18 Sep 2021 14:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yVZJu4t/IugUGV+W6kU+ykKkbEaLVPP4RIQU42du5mE=;
        b=NO0esR917j83JwTOpZQWYClId3457L6NJIf6fJ7Evei4pDJ6w9tdhLXDN3IinOEvW+
         VMthkeYirKlrzLR7LCf4USQHGLJ9wmo5a/QkxpfY9+CPatz4XjsnDZX+q2dIqcXYIANe
         4/RbL5IIz9wKXWQ+bU6E9Y8mF2Wc3GAB8iq/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yVZJu4t/IugUGV+W6kU+ykKkbEaLVPP4RIQU42du5mE=;
        b=V6fm9hTGwiJOS8xYsNgZUVvpxTd9oKVoJvaWWins/a7Hq5IbDi3Q+WiLgBAs3FfteR
         BcKYooXTQNO/PBEt7/MUcALyMPZbm0cdQ3qWTRm/oWC+7LBxXbW5Jd4UFp5ndrqUGhjQ
         zimDOi/k+HNAZQH8U3+2wNT5LmU+7ZpS+lhr/FAG7p1YTj7xbYEKfZiPB2dr0ijwbYxA
         XDKrbTZD6LV/XMezAxzJDGTRFeEL1kk11ONBwiWXZwO2TzKrpp5TPfYCvkki3imfVPse
         CAwSDgK185etYudUnUr50peW4ORXzWTK0lyMXcm8sPnThODWI427SKt+P98sLhRqK3LK
         jYXw==
X-Gm-Message-State: AOAM530oFZdSeCzAaoaUiwnN/V5Hjty5d+UsE7Uhxv3Bsah7oaskqmy3
        eFBdFy0LV6F5Kk0rdcVRYyv/pyy4WGJnIGDfXWI=
X-Google-Smtp-Source: ABdhPJxMwQ8wOpLzMBvh3KpeFGLqBSA50bNT5FGqJ486uPkq96wyEm6y2ojmvzC+YB0n7VCYFIY6Lw==
X-Received: by 2002:ac2:5ca4:: with SMTP id e4mr12989319lfq.534.1631999554660;
        Sat, 18 Sep 2021 14:12:34 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id bt2sm853819lfb.118.2021.09.18.14.12.32
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 14:12:32 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id i25so49074338lfg.6
        for <linux-alpha@vger.kernel.org>; Sat, 18 Sep 2021 14:12:32 -0700 (PDT)
X-Received: by 2002:a2e:8107:: with SMTP id d7mr16412051ljg.68.1631999551766;
 Sat, 18 Sep 2021 14:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whY5mLggPSr2U00mqgUbRJYnYSxtNZm4FnEtQrHftYr8Q@mail.gmail.com>
 <202109182026.18IKQLng003683@valdese.nms.ulrich-teichert.org> <CAHk-=wjZukwHDpm6PUP=cFTi8wWQs6Z5Np7xv7SRphNqvm0FPw@mail.gmail.com>
In-Reply-To: <CAHk-=wjZukwHDpm6PUP=cFTi8wWQs6Z5Np7xv7SRphNqvm0FPw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 18 Sep 2021 14:12:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=whswL8vPtdVphebUwdDd2Y-9j2d8XAd35bB+mqrhc0YTA@mail.gmail.com>
Message-ID: <CAHk-=whswL8vPtdVphebUwdDd2Y-9j2d8XAd35bB+mqrhc0YTA@mail.gmail.com>
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

On Sat, Sep 18, 2021 at 1:46 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But your config shows _other_ errors with the IO functions, so I guess
> I'll need to look at that one too.

Oh, and all those games with

   #define __EXTERN_INLINE
   #include <asm/io.h>
   #include <asm/jensen.h>
   #undef  __EXTERN_INLINE

don't actually work, because there's the usual multiple-inclusion
protection on top of asm/jensen.h:

   #ifndef __ALPHA_JENSEN_H
   #define __ALPHA_JENSEN_H

and this include of <asm/jensen.h> is entirely unused, because we
ended up getting the one *without* that empty __EXTERN_INLINE #define
from an earlier include of

  #include <linux/interrupt.h>

that caused asm/io.h and asm/jensen.h to be included earlier.

The *other* machine files know to do their includes at the top of the file.

But then I end up getting

     ERROR: modpost: "__udiv_qrnnd" [lib/mpi/mpi.ko] undefined!

because CONFIG_MATHEMU wasn't set and the crypto stuff wants the MPI code.

So there seems to be other alpha Kconfig issues in there, and they
aren't all actually Jensen-specific.

Oh well. I guess can fix things up, since I did get tthe
cross-compiler environment..

          Linus
