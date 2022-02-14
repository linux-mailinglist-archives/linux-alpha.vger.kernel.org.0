Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFE54B58C1
	for <lists+linux-alpha@lfdr.de>; Mon, 14 Feb 2022 18:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357200AbiBNRmV (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 14 Feb 2022 12:42:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357186AbiBNRmU (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 14 Feb 2022 12:42:20 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C26652F2
        for <linux-alpha@vger.kernel.org>; Mon, 14 Feb 2022 09:42:12 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id p14so14781515ejf.11
        for <linux-alpha@vger.kernel.org>; Mon, 14 Feb 2022 09:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hl2tx2/b0j1as4iPc8br7ak6VbssTN3Lkaa01qKImp4=;
        b=B3+89vMVlD+t/jr4Ir3J5heCAGLy+8O/Bfqv5DSjHS7vGRacFAUCCs0TF2tOD5+IOJ
         DARHbhMwmXg8IKTGNN5wyW1UIWJ3dy3zDkUXnMSy6euD4EH/SAawjrYbWaSs+0JtxWja
         ZBOb3OkzZ9V/CSYGxjkJVHb89skxzNvZve0yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hl2tx2/b0j1as4iPc8br7ak6VbssTN3Lkaa01qKImp4=;
        b=rPyFIWYcnNZc397DJhGO9320UfQRQ2jllbCNOXj95ZWPd1jNqHLZ3w3HHqS1KHylVK
         pLRpfyX7CYP5L8WBb5e2zYUnEALfaAMyO3LQasPQoKCuZfjkrZhhaduI6flP6CL4Zcrm
         F0mQG4rG4gdcK7x2D7UCtiBiCr0R0QmUGIjMuHdiSZevJHOELrqexGsgIVK+9iw1P/gm
         S1RnnGBcgxeg9G8Nxqvq3jbhCJqTaWQm6fgazkS3h2Dm6mln4awCGlrvTi2Epe6R3NHb
         Ma2kg7+Ed1TdKKZ1JBkIaeEkXYbvVafC2acExsD/Nzw0j/+1He7dldGT5ksEHo6m3zPm
         W/hA==
X-Gm-Message-State: AOAM530QL+aStw4TMkfns4nptR8hbNyhHnH8WA/AEbaXI0Je6YRyS5kB
        SX3eB9JcdvPe63R/h3tfhe0xSuHzhtp3Vea1iuc=
X-Google-Smtp-Source: ABdhPJze+XKNyLwjk6Zms02cdQqM+4uNXy5xO1asQxpbhby67a8Oz/DB1D38N1DHSXdB82jRnQD5DA==
X-Received: by 2002:a17:907:8a1d:: with SMTP id sc29mr587690ejc.314.1644860531004;
        Mon, 14 Feb 2022 09:42:11 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id y21sm1017455ejq.185.2022.02.14.09.42.10
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 09:42:10 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id hw13so10483085ejc.9
        for <linux-alpha@vger.kernel.org>; Mon, 14 Feb 2022 09:42:10 -0800 (PST)
X-Received: by 2002:a19:4302:: with SMTP id q2mr49672lfa.449.1644860131952;
 Mon, 14 Feb 2022 09:35:31 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
In-Reply-To: <20220214163452.1568807-1-arnd@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 14 Feb 2022 09:35:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=whXYWoP6of7js=f4zov62on97mNFRSVRWhY75WoGM6CoQ@mail.gmail.com>
Message-ID: <CAHk-=whXYWoP6of7js=f4zov62on97mNFRSVRWhY75WoGM6CoQ@mail.gmail.com>
Subject: Re: [PATCH 00/14] clean up asm/uaccess.h, kill set_fs for good
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@codeaurora.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Stafford Horne <shorne@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Rich Felker <dalias@libc.org>,
        David Miller <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        linux-hexagon <linux-hexagon@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        openrisc@lists.librecores.org,
        linux-parisc <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-sparc <sparclinux@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        linux-xtensa@linux-xtensa.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Mon, Feb 14, 2022 at 8:35 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> I did a patch for microblaze at some point, which turned out to be fairly
> generic, and now ported it to most other architectures, using new generic
> implementations of access_ok() and __{get,put}_kernel_nocheck().

Thanks for doing this.

Apart from the sparc64 issue with completely separate address spaces
(so access_ok() should always return true like Al pointed out), this
looks excellent to me.

Somebody should check that there aren't other cases like sparc64, but
let's merge this asap other than that.

              Linus
