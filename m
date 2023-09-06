Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E43979336E
	for <lists+linux-alpha@lfdr.de>; Wed,  6 Sep 2023 03:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbjIFBkH (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 5 Sep 2023 21:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbjIFBkH (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Tue, 5 Sep 2023 21:40:07 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F61185
        for <linux-alpha@vger.kernel.org>; Tue,  5 Sep 2023 18:40:01 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d7820f9449bso2791680276.1
        for <linux-alpha@vger.kernel.org>; Tue, 05 Sep 2023 18:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693964400; x=1694569200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3T8m3TY7FUvO3BK98DLgXPwDieu76OqWlRdMIt7mq9o=;
        b=BT2m6qpmilqsEYuAN5AJen0DKJ3YLS8nR0vr0HiOL8RJkrODXege7BKZxaWf8qWFnp
         /1m5xGnoyOX4PXd/a9s0SBdTc8kOyPAc7lIOxp81MxAa0zT99viDEVqap/P2eKJvRTWO
         eGQZZh+D0Az/yGNtAtvnGuVl5sJTnmXOxqonpQxQl6zIENJlRqmJ2bGQy4Xp2A+jdddU
         G46lYzdCRX2JgLYB4xgnn65o20AjdZpRAKxHLsk11E/adxmwNi3CQMS8amAUjnQmlYB3
         zblmtFKm/o7OE69YvgOuAP96LYMlKyFayYD/mtJQpvGXQvSXVOM6pQY15FgTm5dll6Xh
         4B0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693964400; x=1694569200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3T8m3TY7FUvO3BK98DLgXPwDieu76OqWlRdMIt7mq9o=;
        b=T5Cq+xnYnZfnM4NLlqHpgyj6D4AN8jBaRDrr9sjrHKafAqq5ryDBqMPNYqlmKenCjs
         cQfdC/qHeuPM57S6l3p7WXsIr1ru78fy0eU75z7MEYWeGGgpj1xRxli490094aRyUo4G
         Kk3rLgHiq8DkhMIxAXWoJS0b4A0/vJQMaIj6A3VkunyQJ3gKeATkjOj7Q5HaNb/PASqL
         w7OhIzycyD1wBj4VneZVa+EtpQu8XyEBpItQBgc1/sc+e/OA9O5I3V6/5hVRoIUJ1dul
         sJWw2X3bxUDIwF5rhGwqAyNZZuHaKc/UeOIf1G1GbwpaHu65nutQ0lQpEynz63ZPaQR5
         8HRQ==
X-Gm-Message-State: AOJu0YwwH3rDVQ4uwCzV0BU+k3JuNScukcwTlznTdI37hK0Loz0qZAcH
        RXA0o+IVcmyVZCC8zBBmnyB+ST0m4EAjM6bANaA=
X-Google-Smtp-Source: AGHT+IEuRQuw6DhZIshwWmIpFecFcWM4hfTO7OphIxreldigdns2h9Yn1Jq0xsBxXzvqbah7PuBi63kZBitZCFobpNI=
X-Received: by 2002:a25:e802:0:b0:d58:105b:55cb with SMTP id
 k2-20020a25e802000000b00d58105b55cbmr14124817ybd.26.1693964400674; Tue, 05
 Sep 2023 18:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230524171822.177133-1-npiggin@gmail.com> <20230524171822.177133-5-npiggin@gmail.com>
 <CAEdQ38F6LqYbmAt+-NeV0gmsC+bYynmgBb8CPhHFNDzhcwC3Kg@mail.gmail.com>
In-Reply-To: <CAEdQ38F6LqYbmAt+-NeV0gmsC+bYynmgBb8CPhHFNDzhcwC3Kg@mail.gmail.com>
From:   Matt Turner <mattst88@gmail.com>
Date:   Tue, 5 Sep 2023 21:39:49 -0400
Message-ID: <CAEdQ38EXOpqxKhqH=AN3uLnbJX2S5d+2sXS0EXU38H6exD=nUQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/6] alpha: clean mm_cpumask when flushing TLBs
To:     Nicholas Piggin <npiggin@gmail.com>
Cc:     linux-alpha@vger.kernel.org,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Fri, Jun 2, 2023 at 6:33=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> On Wed, May 24, 2023 at 1:18=E2=80=AFPM Nicholas Piggin <npiggin@gmail.co=
m> wrote:
> >
> > mm_cpumask is a map of the CPUs which must be IPIed to flush TLBs,
> > and/or IPIed to shootdown lazy TLB mms at exit time.
> >
> > When flushing TLBs on the CPU, trim it from mm_cpumask if the mm is not
> > currently active on the CPU. TLBs will have been flush, and the mm is
> > not active, so there is no more reason to get IPIs.
> >
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  arch/alpha/include/asm/tlbflush.h |  3 +++
> >  arch/alpha/kernel/smp.c           | 29 +++++++++++++++++++++++++++--
> >  2 files changed, 30 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/alpha/include/asm/tlbflush.h b/arch/alpha/include/asm=
/tlbflush.h
> > index 94dc37cf873a..7c4e719ac9e7 100644
> > --- a/arch/alpha/include/asm/tlbflush.h
> > +++ b/arch/alpha/include/asm/tlbflush.h
> > @@ -12,6 +12,7 @@
> >  #endif
> >
> >  extern void __load_new_mm_context(struct mm_struct *);
> > +extern void try_clear_mm_cpumask(struct mm_struct *);
> >
> >
> >  /* Use a few helper functions to hide the ugly broken ASN
> > @@ -106,6 +107,7 @@ static inline void flush_tlb_all(void)
> >  static inline void
> >  flush_tlb_mm(struct mm_struct *mm)
> >  {
> > +       try_clear_mm_cpumask(mm);
> >         if (mm =3D=3D current->active_mm)
> >                 flush_tlb_current(mm);
> >         else
> > @@ -118,6 +120,7 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned=
 long addr)
> >  {
> >         struct mm_struct *mm =3D vma->vm_mm;
> >
> > +       try_clear_mm_cpumask(mm);
> >         if (mm =3D=3D current->active_mm)
> >                 flush_tlb_current_page(mm, vma, addr);
> >         else
> > diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
> > index e436c056267d..d668b9d319af 100644
> > --- a/arch/alpha/kernel/smp.c
> > +++ b/arch/alpha/kernel/smp.c
> > @@ -610,6 +610,28 @@ smp_imb(void)
> >  }
> >  EXPORT_SYMBOL(smp_imb);
> >
> > +#define asn_locked() (cpu_data[smp_processor_id()].asn_lock)
> > +
> > +/*
> > + * If the mm_cpumask bit is cleared, the caller *must* flush the TLB f=
or the
> > + * mm on this CPU. It is only cleared when the mm is not active, in wh=
ich
> > + * case the flushing always performs flush_tlb_other that flushes ever=
ything.
> > + * If that changes in callers, they will have to arrange to always do =
a full
> > + * flush if mm_cpumask is cleared by this function.
> > + */
> > +void
> > +try_clear_mm_cpumask(struct mm_struct *mm)
> > +{
> > +       int cpu;
> > +
> > +       if (current->active_mm =3D=3D mm || asn_locked())
> > +               return;
> > +
> > +       cpu =3D smp_processor_id();
> > +       if (cpumask_test_cpu(cpu, mm_cpumask(mm)))
> > +               cpumask_clear_cpu(cpu, mm_cpumask(mm));
> > +}
>
> Since this is implemented in smp.c, the function is not available in
> !CONFIG_SMP:
>
> ld: kernel/fork.o: in function `dup_mmap':
> (.text+0x1734): undefined reference to `try_clear_mm_cpumask'
> ld: (.text+0x1738): undefined reference to `try_clear_mm_cpumask'
> ld: mm/memory.o: in function `unmap_page_range':
> (.text+0x1934): undefined reference to `try_clear_mm_cpumask'
> ld: (.text+0x193c): undefined reference to `try_clear_mm_cpumask'
> ld: (.text+0x1a28): undefined reference to `try_clear_mm_cpumask'
> ld: mm/memory.o:(.text+0x1a30): more undefined references to
> `try_clear_mm_cpumask' follow
> make[1]: *** [scripts/Makefile.vmlinux:35: vmlinux] Error 1
> make: *** [Makefile:1249: vmlinux] Error 2

Anything I can do to help?
