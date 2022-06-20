Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57E075514C4
	for <lists+linux-alpha@lfdr.de>; Mon, 20 Jun 2022 11:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238715AbiFTJtv (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 20 Jun 2022 05:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239550AbiFTJtt (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 20 Jun 2022 05:49:49 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFD513DFF
        for <linux-alpha@vger.kernel.org>; Mon, 20 Jun 2022 02:49:47 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id w6so18007017ybl.4
        for <linux-alpha@vger.kernel.org>; Mon, 20 Jun 2022 02:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=InWhdMf1/1em6G6O59SWmdHx+HjozBGTG/fUpLSL4zs=;
        b=L8P3UDB0r+kAWE8ATh497BZTGQg81XYY0qj0SbphWTu5GommNgfmi9tnHEGwhe2ecS
         UsCbkZ8Rn8SpfKxA4li41PVrwHH4gH7IOZAm4EizS/AOv5qTHrOozfVoWa0Tf4ge3ytO
         b4tHyimm4DVyec3OSdbeITsYTvzITBkxCXTCiwJSzIGVi9V248iEt1owGPupRTb9fx94
         WOTdxRWqtzf77IJWFApiDAt8U1P/RLa6aG5CmxmmTS281Oo288QRiFKr5FjTlSD4NFzI
         u0wfm8eV8DtoAK1YYJlreAQK2NKHP/VH1Bx2dH7j4QDbz1MpNP14DRsDhp8zdyrbfNu/
         Tymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=InWhdMf1/1em6G6O59SWmdHx+HjozBGTG/fUpLSL4zs=;
        b=VuPt0BBpnMerFzP7A2hoyPJbfMxAFoTxDsT9oIEr6ODOKWP+vARltqfKLDGbQ+bENZ
         nYNh5KNZ/REG65UotyqPJEakJe+k3ySCgyX5vLLjQxMe0X8wdpUTxFUMRTHGQNKgIRBj
         m9zhf8h1IWcJR+T89bAz9qr2z68+1WtCD9U+vgqqbSdRrH3lrkFI4i8dCZNtVHGg+ihN
         7DjBaeb6LyLVnV237NmXHM93+ph/ZP/oqCVudNAGIkOsOQv1/4O6GQrDtE5XxUfFmAoY
         skyliJosILMnp3925nKjjcmI0FBU5YTYOQ+t/8Q9ug8JX2kfTGPVj/yI2P7cnC9RF28B
         6v3w==
X-Gm-Message-State: AJIora/nF4yVTbYIYYCJ8ZLHUhPR2afi4uAgolf8KQGlit1gDMAOWKQ8
        e9mgKo5xc93pkSu9qGQ/xqKz0WHbsaVNgo/rcLVz5A==
X-Google-Smtp-Source: AGRyM1tvbAo9S4uHlP+A69f2j4SA6cJ/Xh/ZyowhsHkksgYqo5tQeU+Y/t9sprsxLv9Zx30mZP53j+np0Uo/GIDn0Ss=
X-Received: by 2002:a25:3242:0:b0:668:ce6d:b820 with SMTP id
 y63-20020a253242000000b00668ce6db820mr12388945yby.87.1655718586439; Mon, 20
 Jun 2022 02:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220617144031.2549432-1-alexandr.lobakin@intel.com> <20220617144031.2549432-3-alexandr.lobakin@intel.com>
In-Reply-To: <20220617144031.2549432-3-alexandr.lobakin@intel.com>
From:   Marco Elver <elver@google.com>
Date:   Mon, 20 Jun 2022 11:49:10 +0200
Message-ID: <CANpmjNMoM1K1GhWpiHu+WvEeOqOW1NMw0ii7Npup2PD-y+Ratw@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] bitops: always define asm-generic non-atomic bitops
To:     Alexander Lobakin <alexandr.lobakin@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matt Turner <mattst88@gmail.com>,
        Brian Cain <bcain@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Borislav Petkov <bp@suse.de>, Tony Luck <tony.luck@intel.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-alpha@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Fri, 17 Jun 2022 at 19:19, Alexander Lobakin
<alexandr.lobakin@intel.com> wrote:
>
> Move generic non-atomic bitops from the asm-generic header which
> gets included only when there are no architecture-specific
> alternatives, to a separate independent file to make them always
> available.
> Almost no actual code changes, only one comment added to
> generic_test_bit() saying that it's an atomic operation itself
> and thus `volatile` must always stay there with no cast-aways.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> # comment
> Suggested-by: Marco Elver <elver@google.com> # reference to kernel-doc
> Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Marco Elver <elver@google.com>

> ---
>  .../asm-generic/bitops/generic-non-atomic.h   | 130 ++++++++++++++++++
>  include/asm-generic/bitops/non-atomic.h       | 110 ++-------------
>  2 files changed, 138 insertions(+), 102 deletions(-)
>  create mode 100644 include/asm-generic/bitops/generic-non-atomic.h
>
> diff --git a/include/asm-generic/bitops/generic-non-atomic.h b/include/asm-generic/bitops/generic-non-atomic.h
> new file mode 100644
> index 000000000000..7226488810e5
> --- /dev/null
> +++ b/include/asm-generic/bitops/generic-non-atomic.h
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_GENERIC_BITOPS_GENERIC_NON_ATOMIC_H
> +#define __ASM_GENERIC_BITOPS_GENERIC_NON_ATOMIC_H
> +
> +#include <linux/bits.h>
> +
> +#ifndef _LINUX_BITOPS_H
> +#error only <linux/bitops.h> can be included directly
> +#endif
> +
> +/*
> + * Generic definitions for bit operations, should not be used in regular code
> + * directly.
> + */
> +
> +/**
> + * generic___set_bit - Set a bit in memory
> + * @nr: the bit to set
> + * @addr: the address to start counting from
> + *
> + * Unlike set_bit(), this function is non-atomic and may be reordered.
> + * If it's called on the same region of memory simultaneously, the effect
> + * may be that only one operation succeeds.
> + */
> +static __always_inline void
> +generic___set_bit(unsigned int nr, volatile unsigned long *addr)
> +{
> +       unsigned long mask = BIT_MASK(nr);
> +       unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
> +
> +       *p  |= mask;
> +}
> +
> +static __always_inline void
> +generic___clear_bit(unsigned int nr, volatile unsigned long *addr)
> +{
> +       unsigned long mask = BIT_MASK(nr);
> +       unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
> +
> +       *p &= ~mask;
> +}
> +
> +/**
> + * generic___change_bit - Toggle a bit in memory
> + * @nr: the bit to change
> + * @addr: the address to start counting from
> + *
> + * Unlike change_bit(), this function is non-atomic and may be reordered.
> + * If it's called on the same region of memory simultaneously, the effect
> + * may be that only one operation succeeds.
> + */
> +static __always_inline
> +void generic___change_bit(unsigned int nr, volatile unsigned long *addr)
> +{
> +       unsigned long mask = BIT_MASK(nr);
> +       unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
> +
> +       *p ^= mask;
> +}
> +
> +/**
> + * generic___test_and_set_bit - Set a bit and return its old value
> + * @nr: Bit to set
> + * @addr: Address to count from
> + *
> + * This operation is non-atomic and can be reordered.
> + * If two examples of this operation race, one can appear to succeed
> + * but actually fail.  You must protect multiple accesses with a lock.
> + */
> +static __always_inline int
> +generic___test_and_set_bit(unsigned int nr, volatile unsigned long *addr)
> +{
> +       unsigned long mask = BIT_MASK(nr);
> +       unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
> +       unsigned long old = *p;
> +
> +       *p = old | mask;
> +       return (old & mask) != 0;
> +}
> +
> +/**
> + * generic___test_and_clear_bit - Clear a bit and return its old value
> + * @nr: Bit to clear
> + * @addr: Address to count from
> + *
> + * This operation is non-atomic and can be reordered.
> + * If two examples of this operation race, one can appear to succeed
> + * but actually fail.  You must protect multiple accesses with a lock.
> + */
> +static __always_inline int
> +generic___test_and_clear_bit(unsigned int nr, volatile unsigned long *addr)
> +{
> +       unsigned long mask = BIT_MASK(nr);
> +       unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
> +       unsigned long old = *p;
> +
> +       *p = old & ~mask;
> +       return (old & mask) != 0;
> +}
> +
> +/* WARNING: non atomic and it can be reordered! */
> +static __always_inline int
> +generic___test_and_change_bit(unsigned int nr, volatile unsigned long *addr)
> +{
> +       unsigned long mask = BIT_MASK(nr);
> +       unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
> +       unsigned long old = *p;
> +
> +       *p = old ^ mask;
> +       return (old & mask) != 0;
> +}
> +
> +/**
> + * generic_test_bit - Determine whether a bit is set
> + * @nr: bit number to test
> + * @addr: Address to start counting from
> + */
> +static __always_inline int
> +generic_test_bit(unsigned int nr, const volatile unsigned long *addr)
> +{
> +       /*
> +        * Unlike the bitops with the '__' prefix above, this one *is* atomic,
> +        * so `volatile` must always stay here with no cast-aways. See
> +        * `Documentation/atomic_bitops.txt` for the details.
> +        */
> +       return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
> +}
> +
> +#endif /* __ASM_GENERIC_BITOPS_GENERIC_NON_ATOMIC_H */
> diff --git a/include/asm-generic/bitops/non-atomic.h b/include/asm-generic/bitops/non-atomic.h
> index 078cc68be2f1..23d3abc1e10d 100644
> --- a/include/asm-generic/bitops/non-atomic.h
> +++ b/include/asm-generic/bitops/non-atomic.h
> @@ -2,121 +2,27 @@
>  #ifndef _ASM_GENERIC_BITOPS_NON_ATOMIC_H_
>  #define _ASM_GENERIC_BITOPS_NON_ATOMIC_H_
>
> -#include <asm/types.h>
> +#include <asm-generic/bitops/generic-non-atomic.h>
>
> -/**
> - * arch___set_bit - Set a bit in memory
> - * @nr: the bit to set
> - * @addr: the address to start counting from
> - *
> - * Unlike set_bit(), this function is non-atomic and may be reordered.
> - * If it's called on the same region of memory simultaneously, the effect
> - * may be that only one operation succeeds.
> - */
> -static __always_inline void
> -arch___set_bit(unsigned int nr, volatile unsigned long *addr)
> -{
> -       unsigned long mask = BIT_MASK(nr);
> -       unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
> -
> -       *p  |= mask;
> -}
> +#define arch___set_bit generic___set_bit
>  #define __set_bit arch___set_bit
>
> -static __always_inline void
> -arch___clear_bit(unsigned int nr, volatile unsigned long *addr)
> -{
> -       unsigned long mask = BIT_MASK(nr);
> -       unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
> -
> -       *p &= ~mask;
> -}
> +#define arch___clear_bit generic___clear_bit
>  #define __clear_bit arch___clear_bit
>
> -/**
> - * arch___change_bit - Toggle a bit in memory
> - * @nr: the bit to change
> - * @addr: the address to start counting from
> - *
> - * Unlike change_bit(), this function is non-atomic and may be reordered.
> - * If it's called on the same region of memory simultaneously, the effect
> - * may be that only one operation succeeds.
> - */
> -static __always_inline
> -void arch___change_bit(unsigned int nr, volatile unsigned long *addr)
> -{
> -       unsigned long mask = BIT_MASK(nr);
> -       unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
> -
> -       *p ^= mask;
> -}
> +#define arch___change_bit generic___change_bit
>  #define __change_bit arch___change_bit
>
> -/**
> - * arch___test_and_set_bit - Set a bit and return its old value
> - * @nr: Bit to set
> - * @addr: Address to count from
> - *
> - * This operation is non-atomic and can be reordered.
> - * If two examples of this operation race, one can appear to succeed
> - * but actually fail.  You must protect multiple accesses with a lock.
> - */
> -static __always_inline int
> -arch___test_and_set_bit(unsigned int nr, volatile unsigned long *addr)
> -{
> -       unsigned long mask = BIT_MASK(nr);
> -       unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
> -       unsigned long old = *p;
> -
> -       *p = old | mask;
> -       return (old & mask) != 0;
> -}
> +#define arch___test_and_set_bit generic___test_and_set_bit
>  #define __test_and_set_bit arch___test_and_set_bit
>
> -/**
> - * arch___test_and_clear_bit - Clear a bit and return its old value
> - * @nr: Bit to clear
> - * @addr: Address to count from
> - *
> - * This operation is non-atomic and can be reordered.
> - * If two examples of this operation race, one can appear to succeed
> - * but actually fail.  You must protect multiple accesses with a lock.
> - */
> -static __always_inline int
> -arch___test_and_clear_bit(unsigned int nr, volatile unsigned long *addr)
> -{
> -       unsigned long mask = BIT_MASK(nr);
> -       unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
> -       unsigned long old = *p;
> -
> -       *p = old & ~mask;
> -       return (old & mask) != 0;
> -}
> +#define arch___test_and_clear_bit generic___test_and_clear_bit
>  #define __test_and_clear_bit arch___test_and_clear_bit
>
> -/* WARNING: non atomic and it can be reordered! */
> -static __always_inline int
> -arch___test_and_change_bit(unsigned int nr, volatile unsigned long *addr)
> -{
> -       unsigned long mask = BIT_MASK(nr);
> -       unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
> -       unsigned long old = *p;
> -
> -       *p = old ^ mask;
> -       return (old & mask) != 0;
> -}
> +#define arch___test_and_change_bit generic___test_and_change_bit
>  #define __test_and_change_bit arch___test_and_change_bit
>
> -/**
> - * arch_test_bit - Determine whether a bit is set
> - * @nr: bit number to test
> - * @addr: Address to start counting from
> - */
> -static __always_inline int
> -arch_test_bit(unsigned int nr, const volatile unsigned long *addr)
> -{
> -       return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
> -}
> +#define arch_test_bit generic_test_bit
>  #define test_bit arch_test_bit
>
>  #endif /* _ASM_GENERIC_BITOPS_NON_ATOMIC_H_ */
> --
> 2.36.1
>
