Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1096A2744
	for <lists+linux-alpha@lfdr.de>; Sat, 25 Feb 2023 05:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjBYEcf (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 24 Feb 2023 23:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjBYEce (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 24 Feb 2023 23:32:34 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C40B21A2C
        for <linux-alpha@vger.kernel.org>; Fri, 24 Feb 2023 20:32:33 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id b5so461964iow.0
        for <linux-alpha@vger.kernel.org>; Fri, 24 Feb 2023 20:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tJDwjiUbjmMyCjW5l7WmXBECkt1SZeq/g8ufbu3qyPQ=;
        b=jXLHET5muMtZ82OvfNcnBK6VWkLDU2ujR6I83ljffslyTphoUGhckUtgKrGkiNm45h
         wyb5nY5UHkzk6Rz25POJnP2Epn50C5h0ZHe/0dV+l2BF6z/Z/uamvr2s+F4COzxtpzcb
         +6SMo9ktmBEJfOsTvYyz+BYXpSTShePhwV3i+QigwvHN1wQOPL4rHJEybymzfwlQTknn
         0Sp6iV4XaYfCZcQliY5CcpuQKd5V3T7BWS0hK7aUlNxgxDyzhartm48nCtoGvF0eVqk1
         S00eywUNZVtwsOLwpklf2fh5kptEa186n5PrLpI5ng8QX2V2aEENEO87j+dXsZGyonwR
         X/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJDwjiUbjmMyCjW5l7WmXBECkt1SZeq/g8ufbu3qyPQ=;
        b=h1VLOG232k1qYb3PP3UGPkxniiRT6YTEGcoaKkc3MBwGf3Upcgn5lE5VUEcUDeJzet
         9hAk7SK7hHTaQsFNQNmmGcp3Ph0kMSQathwiYhrFGcMQ6vApEGEpfVwALuszBRI1c7ro
         OMoz7vsjwg007qv22Osa9Fca15RSM3yzLNCmayXbEpp7E61ijSm5ElQCIqFAommClMi0
         QY5t4ekokoaZKmER1CXDgPEIonFOV1bFeosNmcDwzg4w5lvTdk+sXOuETdQptZbgDd30
         PDd5KpbU+4/Xetq2EiSEl+ZJB/99+Z835+It5dG+GvTlRlcNBShSLE3hf8Fg73qrGhvv
         mcDw==
X-Gm-Message-State: AO0yUKVIY2m3yYxaAICmqQXugMB5Ownn9E9PJRmtBtV4d+tCFm2Z3j2+
        TEHo+6aXScDO5KlvIR4j0RM/o2vZIJt906NjNXeA03DYdVedNA==
X-Google-Smtp-Source: AK7set+1auXE+d/y9+B13BW2ybnht3d4GAdNemIe92+PU4QwnOzWpv+halMRe8WnG3pOMqaPSk6PVjGh6Clq5Jy0z58=
X-Received: by 2002:a6b:b756:0:b0:745:68ef:e410 with SMTP id
 h83-20020a6bb756000000b0074568efe410mr3140142iof.0.1677299552392; Fri, 24 Feb
 2023 20:32:32 -0800 (PST)
MIME-Version: 1.0
References: <Y8HUbeQh51qLA1th@decadent.org.uk>
In-Reply-To: <Y8HUbeQh51qLA1th@decadent.org.uk>
From:   Matt Turner <mattst88@gmail.com>
Date:   Fri, 24 Feb 2023 23:32:21 -0500
Message-ID: <CAEdQ38FE6-DNmXL9yayUq1NhryS898JgVbKKi7EFaRA41VD=ig@mail.gmail.com>
Subject: Re: [PATCH] alpha: Fix missing symbol versions for str{,n}{cat,cpy}
To:     Ben Hutchings <ben@decadent.org.uk>
Cc:     linux-alpha@vger.kernel.org,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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

On Fri, Jan 13, 2023 at 5:02 PM Ben Hutchings <ben@decadent.org.uk> wrote:
>
> Now that modpost extracts symbol versions from *.cmd files, it can't
> find the versions for these 4 symbols.  This is due to the way we link
> their objects together ahead of the full vmlinux link.  genksyms puts
> their symbol CRCs in .str{,n}{cat,cpy}.o.cmd, but modpost only reads
> the .sty{,n}cpy.o.cmd files.
>
> Instead of using the linker for this, add assembly sources that
> concatenate the appropriate routines with include directives.
>
> Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Fixes: f292d875d0dc ("modpost: extract symbol versions from *.cmd files")
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>

Thanks a bunch for the patch!

> ---
>  arch/alpha/lib/Makefile  | 14 --------------
>  arch/alpha/lib/stycpy.S  | 13 +++++++++++++
>  arch/alpha/lib/styncpy.S | 13 +++++++++++++
>  3 files changed, 26 insertions(+), 14 deletions(-)
>  create mode 100644 arch/alpha/lib/stycpy.S
>  create mode 100644 arch/alpha/lib/styncpy.S
>
> diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
> index 1cc74f7b50ef..8f1c32a25a40 100644
> --- a/arch/alpha/lib/Makefile
> +++ b/arch/alpha/lib/Makefile
> @@ -45,17 +45,3 @@ AFLAGS___remlu.o =       -DREM -DINTSIZE
>  $(addprefix $(obj)/,__divqu.o __remqu.o __divlu.o __remlu.o): \
>                                                 $(src)/$(ev6-y)divide.S FORCE
>         $(call if_changed_rule,as_o_S)
> -
> -# There are direct branches between {str*cpy,str*cat} and stx*cpy.
> -# Ensure the branches are within range by merging these objects.
> -
> -LDFLAGS_stycpy.o := -r
> -LDFLAGS_styncpy.o := -r
> -
> -$(obj)/stycpy.o: $(obj)/strcpy.o $(obj)/$(ev67-y)strcat.o \
> -                $(obj)/$(ev6-y)stxcpy.o FORCE
> -       $(call if_changed,ld)
> -
> -$(obj)/styncpy.o: $(obj)/strncpy.o $(obj)/$(ev67-y)strncat.o \
> -                $(obj)/$(ev6-y)stxncpy.o FORCE
> -       $(call if_changed,ld)
> diff --git a/arch/alpha/lib/stycpy.S b/arch/alpha/lib/stycpy.S
> new file mode 100644
> index 000000000000..bf2b0238209e
> --- /dev/null
> +++ b/arch/alpha/lib/stycpy.S
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * There are direct branches between strcpy, strcat, and stxcpy.
> + * Ensure the branches are within range by concatenating their code.
> + */
> +#include "strcpy.S"
> +#ifdef CONFIG_ALPHA_EV6
> +#include "ev6-strcat.S"

  AS      arch/alpha/lib/stycpy.o
arch/alpha/lib/stycpy.S:8:10: fatal error: ev6-strcat.S: No such file
or directory
    8 | #include "ev6-strcat.S"
      |          ^~~~~~~~~~~~~~

There's no ev6-strcat.S, but there is an ev67-strcat.S. I guess that's
what we want here, along with s/CONFIG_ALPHA_EV6/CONFIG_ALPHA_EV67'.

It's EV67-only because of the cttz instruction.

> +#include "ev6-stxcpy.S"
> +#else
> +#include "strcat.S"
> +#include "stxcpy.S"
> +#endif
> diff --git a/arch/alpha/lib/styncpy.S b/arch/alpha/lib/styncpy.S
> new file mode 100644
> index 000000000000..213d1678be2a
> --- /dev/null
> +++ b/arch/alpha/lib/styncpy.S
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * There are direct branches between strncpy, strncat, and stxncpy.
> + * Ensure the branches are within range by concatenating their code.
> + */
> +#include "strncpy.S"
> +#ifdef CONFIG_ALPHA_EV6
> +#include "ev6-strncat.S"

  AS      arch/alpha/lib/styncpy.o
arch/alpha/lib/styncpy.S:8:10: fatal error: ev6-strncat.S: No such
file or directory
    8 | #include "ev6-strncat.S"
      |          ^~~~~~~~~~~~~~~
compilation terminated.

Same thing here. ev67-strncat.S. s/CONFIG_ALPHA_EV6/CONFIG_ALPHA_EV67'
above as well.

> +#include "ev6-stxncpy.S"
> +#else
> +#include "strncat.S"
> +#include "stxncpy.S"
> +#endif
