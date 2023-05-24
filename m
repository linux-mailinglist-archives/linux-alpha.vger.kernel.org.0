Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF9670FD3B
	for <lists+linux-alpha@lfdr.de>; Wed, 24 May 2023 19:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233755AbjEXRwf (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 24 May 2023 13:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235406AbjEXRwe (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 24 May 2023 13:52:34 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF66D3
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:52:32 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-ba94605bcd5so2512263276.2
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684950752; x=1687542752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeLtVr4UO4JMNxK/AXKvfZvGOwBAANDQcSgKdemNgvA=;
        b=Ld1qt5/ZES5bjJsnDJ6647Z/VvYRUKZsx7NnddzH1W2J0Ew8UBRcLTl0q+AE9/4FMl
         MtGzjlpbKQfY/FMIj7xOTz+bt4YXR3Q39q4lojH0BC4WEleSHCZ1rbaB0EYBzQHJ67uR
         J0Wg6p5zX9QNfFebLMPD4Z8m1f5h8H3jvNlEmvv+Wl4KpWlGtkEroe3Wp0o7xEYct741
         vdh3OvRdyZ2on4hjS7qqDzI2sB2kaT+hoRVv7BGhAkTurOn9YUk+bZ+oPt0plDIQxJKK
         2UPXpWAHXYo7bzP3klaJcUMtHkQF5wwFsR4VCpbgVbnCBGwvZOh4AlLo9f1nqFVMRL/X
         XEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684950752; x=1687542752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SeLtVr4UO4JMNxK/AXKvfZvGOwBAANDQcSgKdemNgvA=;
        b=l6r9ehnYIr7/hlEkRop1TBikyftv/Bgcv1NnyWO1/rPYcNHj1oWoK0QiNkJZgr5jLl
         T332+WQvMGYoQYLA98bO+UKrkIuBDIob0MvdjY3s/U7vRYsAEIPTwlAXkaF77GBoyMQL
         xODFt9MJ0IAQgW97lwbfDMku7upOMGT6rmRQp91B2mOFcKt+ezDvJk4ctNAlkY2qn4YJ
         66m3+hoPAOXXsRmBiTPzJ1wl67GVRWpLUpQENz/Fqa7xvl/DEucQzWhvsxvHfZ9beJJX
         rCXc7YziqP8cixqT+Vl3/u3KParlvw90Gf7FI2Ihnxwwkyfw1g8xU1xjtVa3p+CIpZi5
         x1KA==
X-Gm-Message-State: AC+VfDwb5KP1J0sgzZ2P7VY/+xl1wBX5LjBfQjZjD1C0czzIUV2vmPmW
        oZ5e9KkY2YLhzYFs9u6yqJBOOrOJ4ReBSD2apA1MKimB
X-Google-Smtp-Source: ACHHUZ6hlvwFMGQVW/45PmEUR6Kyiligmg2c5Ysz8y8y3nNVmQZhlD3OzkeUXHqiBbUxBguc6z/SNOUkyOnf0Ax6RXE=
X-Received: by 2002:a25:1ec5:0:b0:b9d:8a4e:e79f with SMTP id
 e188-20020a251ec5000000b00b9d8a4ee79fmr625246ybe.40.1684950752159; Wed, 24
 May 2023 10:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230524171822.177133-1-npiggin@gmail.com> <CAHk-=wjdRm=0kHEAByy5FdV0TsnWt270Yi55RmoOdsPB6qSwzw@mail.gmail.com>
In-Reply-To: <CAHk-=wjdRm=0kHEAByy5FdV0TsnWt270Yi55RmoOdsPB6qSwzw@mail.gmail.com>
From:   Matt Turner <mattst88@gmail.com>
Date:   Wed, 24 May 2023 13:52:21 -0400
Message-ID: <CAEdQ38Gj8WC0X6vSEogLXhkBMtQD0a-pON2rbK2ZjKoEc69LVA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Implement MMU_LAZY_TLB_SHOOTDOWN for alpha
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nicholas Piggin <npiggin@gmail.com>, linux-alpha@vger.kernel.org,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Wed, May 24, 2023 at 1:28=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, May 24, 2023 at 10:18=E2=80=AFAM Nicholas Piggin <npiggin@gmail.c=
om> wrote:
> >
> > Any thoughts about the series would be interesting to hear.
>
> Well, alpha is in a deathmatch with ia64 on "least relevant
> architecture ever, and next to be removed".
>
> There are no winners in that match.
>
> I still have the alpha architecture manual somewhere here, but I
> haven't touched any actual hardware in decades.
>
> But I certainly don't see anything _wrong_ with your series from a
> quick read-through.  It would be nice to hear that it works on real
> hardware, of course, but from previous attempts, there's only a couple
> of people that still occasionally run it.

I'll be happy to test.
