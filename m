Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 214867141BB
	for <lists+linux-alpha@lfdr.de>; Mon, 29 May 2023 03:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjE2Bp7 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 28 May 2023 21:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjE2Bp6 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sun, 28 May 2023 21:45:58 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A375B1
        for <linux-alpha@vger.kernel.org>; Sun, 28 May 2023 18:45:57 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1ae3fe67980so25344745ad.3
        for <linux-alpha@vger.kernel.org>; Sun, 28 May 2023 18:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685324757; x=1687916757;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQkbWL+3Ev4nMwJJ7UFzRpYF9hOTVDMnYEMUVrkmMnA=;
        b=MKKjYM3tC123uLigsG3vu+S+cjQhXdJbyj4SpSUD5oihrc9ak7SDpxWYAtxPDjJoMo
         SW868iZGKqAaFcJRtqdw5L/sjvJ8NX7P4FNh8o1iCRzrhJnLquhuXUZY00Mh2gq2T8ht
         J7Aj/GeBFoK/HOFOcap947xleDFz6P2yOJ9q/NHYkDt3FRomuQCoDnbmuvqjMfU053Ge
         fT9GmacYaS+4q/JZ8ajbkZ8YNZg0yQpl52CvdTM79vLDdtWjHoW0jCKjLb7dfbm37pAg
         5qaexZt2kQapDkItpl2olrZymiPJ3hXzps98r2/jeB7Fcdpk/uhErlzNLjtcpxLsMNIe
         1CHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685324757; x=1687916757;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FQkbWL+3Ev4nMwJJ7UFzRpYF9hOTVDMnYEMUVrkmMnA=;
        b=PmJIOmTSWNtPO63RTlS9/KugHtSu3rEdxNkOSDjmhCY784b0WhmFxjso4+WuPTnwNX
         9BRYzidFi1PR9mt347E3y+NeOsuhP5qfffXEKGU48Npg31kfKwb0WDd7vl9Lm2SKtPEB
         Vj0giRC/j3VMdzEjMkdf2S+Noy3WXWHdYbj7Uo/+M1Ctt9HWhzynZ0K4gP/ALzGC+xl2
         c5zQyuaPf+gAEttdEsX+xlh1g7wUn8c5CqIHXAhjxKXNGBFP+m/Ej4iqgaJ/gPv7El9n
         WAu7H70QM0GrSMg5FaE8imXhGt3hy9MO82Pmwrlg0RUy2PufgiZuyTugg4yYPQFEY2NT
         +m1g==
X-Gm-Message-State: AC+VfDxlCeta1hIWHKEFNjoiI5ME6PUTeXGUrYpm2iF5DH0TU8egw5/J
        F9i1BKu3mNQ93Cwwvp7rt89OqSyx9b0=
X-Google-Smtp-Source: ACHHUZ49gEGkOq/dIcNnsiJ47+DsA328qZUKF3v9ulwMggITxuxyzXL60ydm9rcV4CwCHLTraIxhYQ==
X-Received: by 2002:a17:902:d4c8:b0:1ac:6b92:70c8 with SMTP id o8-20020a170902d4c800b001ac6b9270c8mr12993390plg.48.1685324756778;
        Sun, 28 May 2023 18:45:56 -0700 (PDT)
Received: from localhost ([203.221.142.9])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902dac300b001b0499bee11sm100889plx.240.2023.05.28.18.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 May 2023 18:45:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 29 May 2023 11:45:50 +1000
Message-Id: <CSYDRI4DZR8L.3JREZ0ONNHOLN@wheely>
Cc:     <linux-alpha@vger.kernel.org>,
        "Richard Henderson" <richard.henderson@linaro.org>,
        "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>
Subject: Re: [RFC PATCH 0/6] Implement MMU_LAZY_TLB_SHOOTDOWN for alpha
From:   "Nicholas Piggin" <npiggin@gmail.com>
To:     "Matt Turner" <mattst88@gmail.com>,
        "Linus Torvalds" <torvalds@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230524171822.177133-1-npiggin@gmail.com>
 <CAHk-=wjdRm=0kHEAByy5FdV0TsnWt270Yi55RmoOdsPB6qSwzw@mail.gmail.com>
 <CAEdQ38Gj8WC0X6vSEogLXhkBMtQD0a-pON2rbK2ZjKoEc69LVA@mail.gmail.com>
In-Reply-To: <CAEdQ38Gj8WC0X6vSEogLXhkBMtQD0a-pON2rbK2ZjKoEc69LVA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu May 25, 2023 at 3:52 AM AEST, Matt Turner wrote:
> On Wed, May 24, 2023 at 1:28=E2=80=AFPM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, May 24, 2023 at 10:18=E2=80=AFAM Nicholas Piggin <npiggin@gmail=
.com> wrote:
> > >
> > > Any thoughts about the series would be interesting to hear.
> >
> > Well, alpha is in a deathmatch with ia64 on "least relevant
> > architecture ever, and next to be removed".
> >
> > There are no winners in that match.

Except that I don't get yelled at by so many people when things break.
Why do you think I work on powerpc? (/s, kind of).

At least it's a reference, hopefully we can get a bit more interest. If
we get a few converted then we could find some common patterns and pull
them into generic code or at least a simpler recipe as we try to convert
everything and just make this the only way it's implemented. Of course
we need the big archs on board at some point.

> > I still have the alpha architecture manual somewhere here, but I
> > haven't touched any actual hardware in decades.
> >
> > But I certainly don't see anything _wrong_ with your series from a
> > quick read-through.  It would be nice to hear that it works on real
> > hardware, of course, but from previous attempts, there's only a couple
> > of people that still occasionally run it.
>
> I'll be happy to test.

Thanks Matt, I'll put a git tree up and ping you.

Thanks,
Nick
