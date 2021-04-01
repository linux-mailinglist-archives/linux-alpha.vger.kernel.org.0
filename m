Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62EA235208D
	for <lists+linux-alpha@lfdr.de>; Thu,  1 Apr 2021 22:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234831AbhDAUZj (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 1 Apr 2021 16:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234287AbhDAUZi (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Thu, 1 Apr 2021 16:25:38 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE13CC0613E6
        for <linux-alpha@vger.kernel.org>; Thu,  1 Apr 2021 13:25:38 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id t14so3121533ilu.3
        for <linux-alpha@vger.kernel.org>; Thu, 01 Apr 2021 13:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D9pPnGfDemhcam0jMg7ahtrXvDDeJXDuIzJjdn/CBqY=;
        b=Tp8Ke9BKCULw6yltQvnYkmv2QThjBCXVafzs+Ia/6Q7krHR99BCm3bYyic2o5YkFbr
         3gfeB9enL3wwTt5B4J9fhsXdX8nfTvZGH241U4QQP53Hg6K4hbIYltcy1mTpFRkMmuJD
         7ELOAE5nxnxE1SLwr7zP5G1tTZVjYr0ZqmJtz4gkecRkxoFvJ6dmyh7l5L5gc7AHFt9n
         ShDDLDBN+DUpzgVgN9NSPmt1l291rdHgEY3lp/PqTsPuAHQGy0tlQs5PYZ+BtUYmlJFC
         sZea3AoEklBUGQ+0G+Ttag4mGF/k5xDmMmgM7X9T4zBMbaDc/o0XhC2ax3pjgFi9uLuY
         Zz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D9pPnGfDemhcam0jMg7ahtrXvDDeJXDuIzJjdn/CBqY=;
        b=NHGXYtLV1UUTQk6MUcM5BWEMrke0AlZdouKsv5l1/d4CxS198f/WWJHAwM65bLvzVc
         yq+XZOwHPkIPvPXSODZbHG3mHay24zQ7eb+VxSZVuVh5oRw8CZiAu+krSRE2zxnn9aQA
         fAp6gjKB661sQeqFTKu9XNtt0J11Tq093ho6qu0ngptwka4vaJAvFkhZnxTJSVTqYY1d
         2JkNWXxFINqr8csjrETlM5MYFTPB+eFSch3jtc8uN6OIxkzf6nN51ReIWfyHQY6/M+zE
         2p52DIlzdhzaCTAh6GaEKnvTPwTN8rUnG/MyChWomeugTwsr/ulln5zq3N4bzxTvC7Cb
         gqQg==
X-Gm-Message-State: AOAM532O5vKqh9cRJWXQXIwDx26tEsfrO6b/79JaQHyAkn+Rl98ciFyZ
        JPKjYzwleWBaqPs7EfQS5Dk1G269/dGkrMsX7vC2Fgx5T3s=
X-Google-Smtp-Source: ABdhPJwKCwpFpaPYJxlfBmivkc/q3NFjpBTnb5GuLFN7BcQzQw74+BE64fUhtv7H9GsRHzF7Kvm5zS7b661zLifjQFs=
X-Received: by 2002:a92:d68e:: with SMTP id p14mr7912916iln.0.1617308738313;
 Thu, 01 Apr 2021 13:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210401195138.2895285-1-Liam.Howlett@Oracle.com>
In-Reply-To: <20210401195138.2895285-1-Liam.Howlett@Oracle.com>
From:   Michel Lespinasse <walken@google.com>
Date:   Thu, 1 Apr 2021 13:25:25 -0700
Message-ID: <CANN689GC8jXbzFb_HL-vpoBxuD4-By029=PMsi4Vs9ufik4RhQ@mail.gmail.com>
Subject: Re: [PATCH] alpha/kernel/traps: Use find_vma_intersection() in traps
 for setting si_code
To:     Liam Howlett <liam.howlett@oracle.com>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

You are correct that find_vma is insufficient for what's intended
here, and that find_vma_intersection fixes it.

I'll let the arch maintainers speak of what the consequences of the
changed si_code would be - the bug has been here so long, that I would
worry some userspace might have come to depend on it (the old "common
law feature" issue).
 Just a concern I have, with 0 evidence behind it, so I hope it turns
out not to be an actual issue.

Acked-by: Michel Lespinasse <walken@google.com>

On Thu, Apr 1, 2021 at 12:51 PM Liam Howlett <liam.howlett@oracle.com> wrote:
>
> find_vma() will continue to search upwards until the end of the virtual
> memory space.  This means the si_code would almost never be set to
> SEGV_MAPERR even when the address falls outside of any VMA.
>
> Using find_vma_intersection() allows for what is intended by only
> returning a VMA if it falls within the range provided, in this case a
> window of 1.
>
> Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
> ---
>  arch/alpha/kernel/traps.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> index 921d4b6e4d95..7f51386c06d0 100644
> --- a/arch/alpha/kernel/traps.c
> +++ b/arch/alpha/kernel/traps.c
> @@ -957,8 +957,10 @@ do_entUnaUser(void __user * va, unsigned long opcode,
>                 si_code = SEGV_ACCERR;
>         else {
>                 struct mm_struct *mm = current->mm;
> +               unsigned long addr = (unsigned long)va;
> +
>                 mmap_read_lock(mm);
> -               if (find_vma(mm, (unsigned long)va))
> +               if (find_vma_intersection(mm, addr, addr + 1))
>                         si_code = SEGV_ACCERR;
>                 else
>                         si_code = SEGV_MAPERR;
> --
> 2.30.0



-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.
