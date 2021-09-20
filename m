Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED9D412A80
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Sep 2021 03:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhIUBmy (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 20 Sep 2021 21:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbhIUBio (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 20 Sep 2021 21:38:44 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635C5C128ED8
        for <linux-alpha@vger.kernel.org>; Mon, 20 Sep 2021 12:46:14 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x27so72257595lfu.5
        for <linux-alpha@vger.kernel.org>; Mon, 20 Sep 2021 12:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z/4d6QJeGZCj2JNd8r06qB/o4KuGi6QEUdTRkNveq3w=;
        b=Q3LhEPOHc010gdfUc6e/0+OwWkLDILQAryxm4+BRnojSGhKUZx3i2JKpwpPFiraRMu
         E/I72DGNYfViGt4X8Hw5CpE7Nktij+mVRH+dEpKmPPQIoMBi3/lKCUfxw61t1pARyUwe
         w3uR28CSEpRp+LIB6b1M9E+jNUiv+vNeaFNjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z/4d6QJeGZCj2JNd8r06qB/o4KuGi6QEUdTRkNveq3w=;
        b=ILqaBK0gY+1h/3lKPs/OieO28ayiG94hjY1S+fXSn4McgRDLze8jWtqJy98R34lF8A
         3K9IkZd2/xBUnGWU0Mi32Rpm09TYsalLQB/5UTOhM6tcJH85qWeaz6Ygd8OhX8iiaari
         7LLjFLQGmsprdQzNr8OKQFWZbwhMb83Z7crzo90NmPbvoiAkxa7wX7QtU6IoPL8nhRwy
         gKO1dSwMv+KaGtDq39GMbsp312xv6R0pvcTHTw1ugD6OlS8cvyZOKD8HN/UVHgKLsChT
         C6EEErqH50REZ91MIiRVjBJ9/gdCEmqsXyXgikorEXyOZlTxpa5YzfWaPNBqFvOas/G9
         YUoA==
X-Gm-Message-State: AOAM530b6jSv1iUaA+h29BXv/LSUO6ta1KTNtPkon4N/Gscw0Hgnw8In
        UunKGRU6+bnOD0/29CjcpkFD32pBg3ybFNh/
X-Google-Smtp-Source: ABdhPJz/Vu9zzPcE6xbl0wilhwz9Z4eaWxrYoa/ok6jNaw/IScrIB9yezqgffEKT0FBQSPYuSOQ5Ew==
X-Received: by 2002:a2e:3518:: with SMTP id z24mr4461298ljz.312.1632167170634;
        Mon, 20 Sep 2021 12:46:10 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id z6sm1338256lfh.25.2021.09.20.12.46.09
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 12:46:09 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id u8so20827853lff.9
        for <linux-alpha@vger.kernel.org>; Mon, 20 Sep 2021 12:46:09 -0700 (PDT)
X-Received: by 2002:a2e:3309:: with SMTP id d9mr12166105ljc.249.1632167169161;
 Mon, 20 Sep 2021 12:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wh-=tMO9iCA4v+WgPSd+Gbowe5kptwo+okahihnO2fAOA@mail.gmail.com>
 <202109201825.18KIPsV4026066@valdese.nms.ulrich-teichert.org>
 <CAHk-=wibRWoy4-ZkSVXUoGsUw5wKovPvRhS7r6VM+_GeBYZw1A@mail.gmail.com> <CAEdQ38HeUPDyiZhhriHqdA+Qeyrb3M=FoKWKgs0dZaEjbcpVUQ@mail.gmail.com>
In-Reply-To: <CAEdQ38HeUPDyiZhhriHqdA+Qeyrb3M=FoKWKgs0dZaEjbcpVUQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 20 Sep 2021 12:45:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj1JWZ3sCrGz16nxEj7=0O+srMg6Ah3iPTDXSPKEws_SA@mail.gmail.com>
Message-ID: <CAHk-=wj1JWZ3sCrGz16nxEj7=0O+srMg6Ah3iPTDXSPKEws_SA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
To:     Matt Turner <mattst88@gmail.com>
Cc:     Ulrich Teichert <krypton@ulrich-teichert.org>,
        Michael Cree <mcree@orcon.net.nz>,
        Guenter Roeck <linux@roeck-us.net>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Mon, Sep 20, 2021 at 11:59 AM Matt Turner <mattst88@gmail.com> wrote:
>
> In the decade plus I've been around Linux on alpha I've don't actually
> recall hearing of anyone using Linux on a Jensen system before :)

Looking around, I'm pretty sure the system I did all my initial work
on was a Jensen.

This is from the linux-.1.1.83 patch:

- * I don't have any good documentation on the EISA hardware interrupt
- * stuff: I don't know the mapping between the interrupt vector and the
- * EISA interrupt number.
- *
- * It *seems* to be 0x8X0 for EISA interrupt X, and 0x9X0 for the
- * local motherboard interrupts..
+ * The vector is 0x8X0 for EISA interrupt X, and 0x9X0 for the local
+ * motherboard interrupts.. This is for the Jensen.

So yup, my initial bringup machine was that DECpc AXP 150, aka "Jensen".

The IO subsystem on that thing was absolutely horrendous. Largely
because of the lack of byte/word accesses, so doing any PCI accesses
had to be encoded on the address bus. Nasty nasty nasty.

The original design with only 32-bit and 64-bit memory accesses really
was horribly horribly wrong, and all the arguments for it were
garbage. Even outside of IO issues, it blew up code size enormously,
but the IO side became truly horrendous.

Oh well. Water under the bridge.

I did have another alpha at some point - going from the original
150HMz EV4 to a 275MHz EV45. I forget what system that was.

               Linus
