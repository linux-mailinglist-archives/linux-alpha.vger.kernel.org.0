Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 934DD683893
	for <lists+linux-alpha@lfdr.de>; Tue, 31 Jan 2023 22:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbjAaV1C (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 31 Jan 2023 16:27:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbjAaV1B (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 31 Jan 2023 16:27:01 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E6E14226
        for <linux-alpha@vger.kernel.org>; Tue, 31 Jan 2023 13:27:00 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id hx15so26076556ejc.11
        for <linux-alpha@vger.kernel.org>; Tue, 31 Jan 2023 13:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lhMaGcwmHnowthLDK6+cq9UUV5li22+d5YjfiOKs0xk=;
        b=Dpi5P8qHqM77HLr6Rm7qlkY2hnNNuC+GOleUP2NCen/4mi28taFHpUtYN0cOaJeZqx
         TB+exnjSVIKaLaZsJwKH3MCWKlHsO2N7zm25f17K7ur8C/IEegLECG6U0Z6AXLDaZrfK
         1kGvyREHSxwc1BrFIiYNgaqGXrqrtBtRmci5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhMaGcwmHnowthLDK6+cq9UUV5li22+d5YjfiOKs0xk=;
        b=P/y6qboW0FMQTbV0W+kHYcuABYOECPvesUloFWgImq1hnwi4hl+P9RwUFaYxviTuEN
         zXju9imrVwd272TntdAT3f8636IMxMZy5nlzSY5zlCSfIb/kT46ZzHgdCGI63GOGB1M/
         3SkYbSxx6Bfsf6X1QmkI31FynZIQULyWRy6SV6co0M87tRxRogFO6waNHVaGB5Fz1eCg
         LifknqbqJsphpyg6VszY7srsOOVFZyHmSFEg4/4kXTReUqv50EmCw5XdJL2WkwjOjov0
         p3kUuKC2yf5hTC9Sq2+gwSbk9j9BddbhvvJVuKkVB3D1P0jApfy4YeEGWOlrWjFhDw9Q
         uvMw==
X-Gm-Message-State: AO0yUKWazzow2/RMzhE4PAqOnojnrfX7c6WmZzeWlnh139Wc/w99xwII
        054qS7v5bOg5Cv3onDcb8Fr1GrQLmUh4XjmmCZM=
X-Google-Smtp-Source: AK7set9RMN3nSM+EWrUcvoGQV1ZLdygLOzYR+t4nQ7aYEoNFY5uKwG+4957mX6/3mvNI9MUpui531A==
X-Received: by 2002:a17:907:d10:b0:84d:4be4:aa2b with SMTP id gn16-20020a1709070d1000b0084d4be4aa2bmr5909866ejc.68.1675200418751;
        Tue, 31 Jan 2023 13:26:58 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id g18-20020a170906595200b00888d593ce76sm3617991ejr.72.2023.01.31.13.26.58
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 13:26:58 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id dr8so24034275ejc.12
        for <linux-alpha@vger.kernel.org>; Tue, 31 Jan 2023 13:26:58 -0800 (PST)
X-Received: by 2002:a17:906:1e94:b0:889:2908:a9c8 with SMTP id
 e20-20020a1709061e9400b008892908a9c8mr2233010ejj.82.1675200015978; Tue, 31
 Jan 2023 13:20:15 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV>
In-Reply-To: <Y9mD1qp/6zm+jOME@ZenIV>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 31 Jan 2023 13:19:59 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
Message-ID: <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Peter Xu <peterx@redhat.com>, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, Jan 31, 2023 at 1:10 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Umm...  What about the semantics of get_user() of unmapped address?
> Some architectures do quiet EFAULT; some (including alpha) hit
> the sucker with SIGBUS, no matter what.

I think we should strive to just make this all common.

The reason alpha is different is almost certainly not intentional, but
a combination of "pure accident" and "nobody actually cares".

> Are we free to modify that behaviour, or is that part of arch-specific
> ABI?

I'd just unify this all, probably with a preference for existing
semantics on x86 (because of "biggest and most varied user base").

That whole "send SIGBUS even for kernel faults" is certainly bogus and
against the usual rules. And I may well be to blame for it (I have
this memory of disliking how EFAULT as a return code didn't actually
return the faulting address). And realistically, it's also just not
something that any normal application will ever hit.  Giving invalid
addresses to system calls is basically always a bug, although there
are always special software that do all the crazy corner cases (ie
things like emulators tend to do odd things).

I doubt such special software exists on Linux/alpha, though.

So I wouldn't worry about those kinds of oddities overmuch.

*If* somebody then finds a load that cares, we can always fix it
later, and I'll go "mea culpa, I didn't think it would matter, and I
was wrong".

         Linus
