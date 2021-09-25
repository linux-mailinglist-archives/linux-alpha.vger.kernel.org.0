Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459BA418529
	for <lists+linux-alpha@lfdr.de>; Sun, 26 Sep 2021 01:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhIYXUJ (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 25 Sep 2021 19:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhIYXUJ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 25 Sep 2021 19:20:09 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F018AC061570
        for <linux-alpha@vger.kernel.org>; Sat, 25 Sep 2021 16:18:33 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i4so57660298lfv.4
        for <linux-alpha@vger.kernel.org>; Sat, 25 Sep 2021 16:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PaI8r8LZE3Qc9hDr4uY+V8+SQJczkLUjipeLe96hY/E=;
        b=BfppYlAzxMmrlGYUwoGDSlAwVwIUL1UQdOpwXcUJZIpUgf7+DixxRwTz7+xKGk1zG+
         Mlf5G2XkmHHQDs8bcoSBbg0+oPvkfobzwXbLVi7J3n1AK9O4gwR6une98zLpv5LtkDLV
         8WpnNp9IYKJuHerFSJXyEDf7a+D8tnQ/H+1JA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PaI8r8LZE3Qc9hDr4uY+V8+SQJczkLUjipeLe96hY/E=;
        b=h0odF500O4Ooz7ooOuZ2HOmuyMMWbdR3nHbM2xxpjtWkedYOrFlMYEDrIa65QZ7HfW
         EjBbBF9xzMHgby1nNLeduiQ5BxoFwmNA6SCDTmSYgCr6NNHIAg5CIJknYJ3MFGCuaHmw
         oEGe6Ha5GaJ/V/DrFcuAGRJbANfs9Tt1RGvgw4uQ2VpFeeK7xpcYobrUrwsLW4hHV+FC
         iYHnOm49cNFKARLLwh57Ivkga5jLMPEOZ7UmmVtejn/CgwS3EGDH+dWNqq8BhgD1F61O
         LG714KrAFsFOxg3v3Sqv+WNlbLGDV+G5XH13wGQtwmm73EKZICYTq3wnPHSmZVi68Fd/
         GzeA==
X-Gm-Message-State: AOAM532PgqU2+XjlL3vxM1mG6E17FhnHNEEQx32x4YduLs5ul2NegmCe
        9p2fswJ4xKks09lbdqokh5YWsngJw3i+KSjh
X-Google-Smtp-Source: ABdhPJz/vpDbUVKalmCW2pUPASkkGiNxUomkrTGE2Hnz49klnOaRkIrgyQBad61udztzgwXY7RVtAQ==
X-Received: by 2002:ac2:561c:: with SMTP id v28mr16647889lfd.457.1632611912039;
        Sat, 25 Sep 2021 16:18:32 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id l7sm1140092lfk.52.2021.09.25.16.18.31
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Sep 2021 16:18:31 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id u18so56186777lfd.12
        for <linux-alpha@vger.kernel.org>; Sat, 25 Sep 2021 16:18:31 -0700 (PDT)
X-Received: by 2002:a05:651c:1250:: with SMTP id h16mr20395065ljh.68.1632611911059;
 Sat, 25 Sep 2021 16:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk> <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
 <20210925025548.1694143-7-viro@zeniv.linux.org.uk> <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com>
 <YU+J1b2jA8ZZZpv/@zeniv-ca.linux.org.uk>
In-Reply-To: <YU+J1b2jA8ZZZpv/@zeniv-ca.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 25 Sep 2021 16:18:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wihd78UK4wGfsNi_ofa_Zt=h-5swV=a=YQEj4Nvm_C4nA@mail.gmail.com>
Message-ID: <CAHk-=wihd78UK4wGfsNi_ofa_Zt=h-5swV=a=YQEj4Nvm_C4nA@mail.gmail.com>
Subject: Re: [PATCH 7/7] alpha: lazy FPU switching
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     alpha <linux-alpha@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sat, Sep 25, 2021 at 1:43 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Umm...  Bootable AS200 (EV45), bootable DS10 (EV6), theoretically
> resurrectable UP1000 (EV67, fans on CPU module are in horrible state
> and southbridge is unreliable, so the life is more interesting than
> it's worth), working qemu-system-alpha (EV67).  No SMP boxen and
> I've no idea if qemu can do SMP alpha these days...

Well, the way we traditionally did lazy x87 state save/restore on x86
was very much smp-sensitive, so that lack of test coverage is a bit
sad.

That said, this approach doesn't really seem to have _those_ kinds of
issues, since you always save things at 'switch_to()', so I guess it
doesn't matter.

> Whether it's worth it... beginning of the series or this one?

This last one was the one I reacted to.

I don't think it's wrong (although please, use a more descriptive name
that "V" for that asm macro shorthand), but it does strike me as
somewhat special.

And if we do want to do this (I'm open to it, I just want to make sure
it's tested), please just make those alpha_{read|write}_fp_reg()
functions always do the save_fpu() thing, and then alway sjust access
the array.

IOW, something like

        preempt_disable();
        save_fpu(current);
        preempt_disable();
        .. now access the array that is easy to index ..

and just remove the silly "switch (reg)" things that access the raw
registers. We couldn't do that before, but with that save state area
it's trivial and much cleaner.

            Linus
