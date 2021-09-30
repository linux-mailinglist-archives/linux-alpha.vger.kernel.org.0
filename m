Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943CC41DDE5
	for <lists+linux-alpha@lfdr.de>; Thu, 30 Sep 2021 17:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346003AbhI3Prz (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 30 Sep 2021 11:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345184AbhI3Prz (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 30 Sep 2021 11:47:55 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7C5C06176A
        for <linux-alpha@vger.kernel.org>; Thu, 30 Sep 2021 08:46:12 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id a13so6078077qtw.10
        for <linux-alpha@vger.kernel.org>; Thu, 30 Sep 2021 08:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8d6xo5L9QevHc/0Sduv9NQkae1fLgboqRLN/cOlHL94=;
        b=iR/rfVgiWHq5rw4NLK5OT9v5lYhcLGBGwNqvqBTHa8uM0K3LSI6Qds40sZdhqy343D
         nKF1AalapkTkhy/ypRBVypdug7o8/xaqtmHaWv9UPFEGjb1UhHpm/4rTjAiBbtASwfKx
         3JH/kVbQPqPEjk5/0bNv7k1/Y2BIonRHJ0vWOSQM3zvPY70Uxrv2rSgTrqGgUv6GDu7E
         chrKKhinXiSRYk/xsds2GtV3wz6HxpGI4jq2FDoKpBIlG6t+6bi34LoQK0m5uh10NjJQ
         5mDPrpUbvxQNLMegc4nJJFYKUu1kf5g3ZYgnxHtFO6ahoMuizo6fqj2+osS40oUSZmZK
         mhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8d6xo5L9QevHc/0Sduv9NQkae1fLgboqRLN/cOlHL94=;
        b=69Obs29H5mxFtg1M2z5+xnrCcNOLiuS3qtyZ0G/lcwOXQbvsXoUiVejfZY0wSpzDJE
         mWIb4kZFfVneu4qM7jt7Y/vOMs8ErHiQA/AH1QRzlcn30rc7/mtm5ghcbF5hIR1fSwX6
         Qnat9katImiXfdz9kROBJEURLsVkF+8X6Pgk9lfJxuAGVjVC6DkJpjga5ol8g3XYZ0Y7
         6jISJt5zqMXT+aIlh1hxb/B9EQT0qrNBMGzVMF2pKsStYPHUWZ+HGyvtud6OSo+6Tam3
         556xWsBYnl6nrTI2NxFUe5GwDTRMyqxbsV1XIhX2Ck6SXuNih5OsA3PUDEAftHD2L3YN
         dkeg==
X-Gm-Message-State: AOAM532Oqnb4gU9TREuOvPFq38uYo8t8zletAYd6NmZN26sW7/2okSNp
        mA1/FkCFjDclDPztKJ6vrMgNzafGK73WuiYnGSMq4w==
X-Google-Smtp-Source: ABdhPJwZ3uxL8AigS1SCTssbBbBxtSyTYvRLlSFXF7X1iRF0BIcI7ZsH6TQi0ZjmX4wm1iehH5EIvAVb3aaD1X5z2aM=
X-Received: by 2002:ac8:5ed1:: with SMTP id s17mr7389237qtx.196.1633016771378;
 Thu, 30 Sep 2021 08:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210930071143.63410-1-wangkefeng.wang@huawei.com> <20210930071143.63410-8-wangkefeng.wang@huawei.com>
In-Reply-To: <20210930071143.63410-8-wangkefeng.wang@huawei.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Thu, 30 Sep 2021 17:45:35 +0200
Message-ID: <CAG_fn=XD+nVgVRgj7KFsPWSuia+gZzpA3KAdqucjKodOvxSF6w@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] mm: kasan: Use is_kernel() helper
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        David Miller <davem@davemloft.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>, bpf@vger.kernel.org,
        linux-alpha@vger.kernel.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, Sep 30, 2021 at 9:09 AM Kefeng Wang <wangkefeng.wang@huawei.com> wr=
ote:
>
> Directly use is_kernel() helper in kernel_or_module_addr().
>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Reviewed-by: Alexander Potapenko <glider@google.com>

> ---
>  mm/kasan/report.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 3239fd8f8747..1c955e1c98d5 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -226,7 +226,7 @@ static void describe_object(struct kmem_cache *cache,=
 void *object,
>
>  static inline bool kernel_or_module_addr(const void *addr)
>  {
> -       if (addr >=3D (void *)_stext && addr < (void *)_end)
> +       if (is_kernel((unsigned long)addr))
>                 return true;
>         if (is_module_address((unsigned long)addr))
>                 return true;
> --
> 2.26.2
>


--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
