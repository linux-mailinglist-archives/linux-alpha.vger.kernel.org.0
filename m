Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3C966A2D07
	for <lists+linux-alpha@lfdr.de>; Sun, 26 Feb 2023 03:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjBZCFJ (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 25 Feb 2023 21:05:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjBZCFI (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 25 Feb 2023 21:05:08 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B561AD3B
        for <linux-alpha@vger.kernel.org>; Sat, 25 Feb 2023 18:05:07 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id i202so1213040ioa.3
        for <linux-alpha@vger.kernel.org>; Sat, 25 Feb 2023 18:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N2OCqEMPQ8qAUblLybxvKPB1KcvQKq3wt9E6sXvPAGQ=;
        b=K+ZFa91xdiFyNq5t9Wo+HrNVpOVXR3WusKDLvmYP0huv17kIKiYsm47AfTTYblPybr
         73jsI2y9KVmHmy6nckRRS/BuHaRj3lECdXhuk36M906Wknh2g0hoDpjbmmPKhzxne9XD
         eTamr51WJdnmAHfONMjLLWgO6rX8C+qMmqdZBWeY+BmmALWy+9pl7PWmZZc0MPhpIEI8
         JQ3IdFo2r7QFBXtvA/Gd/+Km+YqtjK7CqI7azk5Lcfnp+tzMj21MGOJRZWR3Ovo4PetN
         4CZFNmkCQqkqFaAFNqVCbUJpHRdcSAVyUDewS6kHxFlbIg/X4OGf2JpAdTG67R4kyVYz
         I5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2OCqEMPQ8qAUblLybxvKPB1KcvQKq3wt9E6sXvPAGQ=;
        b=4m2J0X/DbTTcj+nL1T1VN/UpbNDM/nVTbk8amBjbvql1KkRQijQQ1UmYZd9wnjdHXD
         YSw+QvJtdGeeMBikolI+93i2DP83V8D0MOCIW91h7mcgY2Fv8ZC+HYlf8ehsMer2nxoz
         4TDJ1JT+AwOmRbkyNXvITTP81+bwCQwQUUY8RnJgmDGZtmrZxRMRqvBB6pYnsuTlw2e4
         mkO1TwdyWYWhXu75VZC1JJtqSCh5mmmVJXUKm06FSFSsXn9ac5D24LY2f/WIeW4bP/Tn
         kOw/0AjCeLNtQ7fLT+uwCwpJxYpGqgerMUm3+LJdt7DkoPnJb53CG3ATomUw5cyFYlG6
         ZNlg==
X-Gm-Message-State: AO0yUKXAGUdG8u0BxJZYqat7nRwOMqhPqCEF+nrp9qJc7WQV7n/f0z8y
        INA3eLdqsM2wfWOgZCrPCuLC+XWtAHYtKgzRKa3oBUQuNlM=
X-Google-Smtp-Source: AK7set+LH1RzOROE8AyaDN3M/1cld8Mi3eXZUYFFHV1h92q2TSmWkEsJQpRgjr6om+ODzbRtsz9SlgqCwaGA3Z2QWUM=
X-Received: by 2002:a6b:140a:0:b0:73a:397b:e310 with SMTP id
 10-20020a6b140a000000b0073a397be310mr3902687iou.0.1677377106484; Sat, 25 Feb
 2023 18:05:06 -0800 (PST)
MIME-Version: 1.0
References: <20220827064939.461790-1-aurxenon@lunos.org>
In-Reply-To: <20220827064939.461790-1-aurxenon@lunos.org>
From:   Matt Turner <mattst88@gmail.com>
Date:   Sat, 25 Feb 2023 21:04:55 -0500
Message-ID: <CAEdQ38Hw2b2RG0-v2=+sZ5pLdzGwBsWRNyTKsnFC6nPFPvEcyA@mail.gmail.com>
Subject: Re: [PATCH] alpha: fix R_ALPHA_LITERAL reloc for large modules
To:     Edward Humes <aurxenon@lunos.org>
Cc:     linux-alpha@vger.kernel.org, ink@jurassic.park.msu.ru,
        richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sat, Aug 27, 2022 at 2:49 AM Edward Humes <aurxenon@lunos.org> wrote:
>
> Previously, R_ALPHA_LITERAL relocations would overflow for large kernel
> modules.
>
> This was because the Alpha's apply_relocate_add was relying on the kernel's
> module loader to have sorted the GOT towards the very end of the module as it
> was mapped into memory in order to correctly assign the global pointer. While
> this behavior would mostly work fine for small kernel modules, this approach
> would overflow on kernel modules with large GOT's since the global pointer
> would be very far away from the GOT, and thus, certain entries would be out of
> range.
>
> This patch fixes this by instead using the Tru64 behavior of assigning the
> global pointer to be 32KB away from the start of the GOT. The change made
> in this patch won't work for multi-GOT kernel modules as it makes the
> assumption the module only has one GOT located at the beginning of .got,
> although for the vast majority kernel modules, this should be fine. Of the
> kernel modules that would previously result in a relocation error, none of
> them, even modules like nouveau, have even come close to filling up a single
> GOT, and they've all worked fine under this patch.
>
> Signed-off-by: Edward Humes <aurxenon@lunos.org>
> ---
>  arch/alpha/kernel/module.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/alpha/kernel/module.c b/arch/alpha/kernel/module.c
> index 5b60c248de9e..cbefa5a77384 100644
> --- a/arch/alpha/kernel/module.c
> +++ b/arch/alpha/kernel/module.c
> @@ -146,10 +146,8 @@ apply_relocate_add(Elf64_Shdr *sechdrs, const char *strtab,
>         base = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr;
>         symtab = (Elf64_Sym *)sechdrs[symindex].sh_addr;
>
> -       /* The small sections were sorted to the end of the segment.
> -          The following should definitely cover them.  */
> -       gp = (u64)me->core_layout.base + me->core_layout.size - 0x8000;
>         got = sechdrs[me->arch.gotsecindex].sh_addr;
> +       gp = got + 0x8000;
>
>         for (i = 0; i < n; i++) {
>                 unsigned long r_sym = ELF64_R_SYM (rela[i].r_info);
> --
> 2.34.1
>

Thanks for the patch! This was included in my pull request today and
is now upstream in Linus' tree.
