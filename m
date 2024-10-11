Return-Path: <linux-alpha+bounces-1270-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFE599ADD3
	for <lists+linux-alpha@lfdr.de>; Fri, 11 Oct 2024 22:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD6DE1F25453
	for <lists+linux-alpha@lfdr.de>; Fri, 11 Oct 2024 20:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D4F1D151B;
	Fri, 11 Oct 2024 20:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OeleiByD"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FBC1D14FD
	for <linux-alpha@vger.kernel.org>; Fri, 11 Oct 2024 20:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728680159; cv=none; b=LYtmiOBIrB7Cy9X4XGkS5DAyMYniA76L4EVXFSdy8Dv0R+rpvQZGGl1Ub8TZst9DR211wZhzjqVghvtXWSVOqVXy5r3Usogh9gyfRLZSI+VPCLXW+8xBH0IaMH6bzKbsiN5fAWxX/9gfedSDKi8zVwKL5SiNeQQ/rYtOktWa8nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728680159; c=relaxed/simple;
	bh=uC2xLUGeBTKyYtCrbYvB49i/24wKqmENpfcl+kT6kII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhQbgx1/3UdGEHgT0RXBCKEccwcoFfbqn/kjmKXW/jE+h8QSeq3W3PNMkqr3nKeUWca0Ba7ICeI8tFSGE/OlpmbZlezSGV/MVOWAMLPZeTznd0LC9cjmu2/Ir3E4IMJ6nrdjn3e42lhdUhuRatOoySy7tV7NPNghBDpDvgXUN2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OeleiByD; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4603d3e0547so60401cf.0
        for <linux-alpha@vger.kernel.org>; Fri, 11 Oct 2024 13:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728680155; x=1729284955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBFPzh5NlZh+7Zd1K+MhC4XZXtWT2loiufG6vbfnB2M=;
        b=OeleiByDAP48vj8/ojIGt0ies1ajsLNjTX7T7hoO6BIRJE5PRHHa283ZsFgQOFid94
         nbc30+ahp0AGN1VOuJp1tO4i/WH07eG9/pqjIQd1A15Zzn4veFRGimI3yelmcHV6s8cm
         zOOF4DkTPqotg2EMT2W9qglnU4WG+skFARX8jYkbc7lfWwxQQk6jTBCUsHo/AjbhKrKG
         tz7nJmT5rseBuR4KSBnOlKXLOoA7PLVtzzZIK1N8PDIdabEdvR8Rjz75c0jWTKSFAbqF
         1Bpvtv5rjPOZ615jMpqRW9wbjDVCk8WGapbNKAFr6JiibYgOshIyKEKm9sK3L+Yc/4xd
         msTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728680155; x=1729284955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBFPzh5NlZh+7Zd1K+MhC4XZXtWT2loiufG6vbfnB2M=;
        b=qMQQdylDF3WFik4wQ85cfVaSPzcvvLSdrd5mWhmfj8nTlrx+2wAt3gN6EKewjwgS+D
         KOs+xa1N+MmGkTEbFXTZ469M9J7+5IUHMliEI/MjH5kdbhLZf3dkNMRNlIrZ0Y0dITGA
         zOqu8haU9RUmNV8QF3kCOPSQwyMv6aTO+m/S+crMaFRdpRN87BSIJho1pu5wacEj4eO3
         KW0aH701rz/y8BHV77veR1Bn8+GdXc375mlPlFoSWfvDWIxIwKTdQMUef+2V/EEFaazj
         tOPGAeABMbfe31hIEcPxHA2SPnnhrUq6evGUTtgc+WllmWVXgLSy6cANoQ7Nf3tcTlcj
         eSyA==
X-Forwarded-Encrypted: i=1; AJvYcCVeIzSgKpoe7OCzpA55iWiwIFclIukYmRei+2cPFRRcnURdog8SGSP/PRLdpGyn9QfYXMd0GR93sapqgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVmAlsjR/px871lzqw6TnJ124IZReVAiJjtOltEH/QNgfiLpt1
	OO+0nFuNi6avybUO9eQXyYPnABY/0JX2apnnd4+PxDcaI7e9s/dG2WJa9zcxtixaTZg1MCEfmAj
	WbEQsGZ1qoPM/zkNCHN9PtBVM0n4Rr4qSPQ7F
X-Google-Smtp-Source: AGHT+IG6IScrTSH9iJhbpLI7RLZRrQurOaPZvTBCGWMkP7mWaid454o5VBVq59wNWCmpMXfwr84ZSmZjgA3xj9fhNCc=
X-Received: by 2002:a05:622a:a28c:b0:45c:9d26:8f6e with SMTP id
 d75a77b69052e-46059c77ccdmr87721cf.21.1728680155167; Fri, 11 Oct 2024
 13:55:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1727440966.git.lorenzo.stoakes@oracle.com>
 <a578ee9bb656234d3a19bf9e97c3012378d31a19.1727440966.git.lorenzo.stoakes@oracle.com>
 <CAG48ez3ursoL-f=mYpV79Do18XPPt+MPPHNUBv6uFE1GhpOwSA@mail.gmail.com>
In-Reply-To: <CAG48ez3ursoL-f=mYpV79Do18XPPt+MPPHNUBv6uFE1GhpOwSA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 11 Oct 2024 13:55:42 -0700
Message-ID: <CAJuCfpFaHz-xW1Rh-+rJ8iLyV19JuG9Rm-eJsz3aOm8dUj3Ewg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] mm: madvise: implement lightweight guard page mechanism
To: Jann Horn <jannh@google.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Paul E . McKenney" <paulmck@kernel.org>, 
	David Hildenbrand <david@redhat.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Muchun Song <muchun.song@linux.dev>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-arch@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, linux-kselftest@vger.kernel.org, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, Vlastimil Babka <vbabka@suze.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 11:12=E2=80=AFAM Jann Horn <jannh@google.com> wrote=
:
>
> On Fri, Sep 27, 2024 at 2:51=E2=80=AFPM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> > Implement a new lightweight guard page feature, that is regions of user=
land
> > virtual memory that, when accessed, cause a fatal signal to arise.
> [...]
> > ---
> >  arch/alpha/include/uapi/asm/mman.h     |   3 +
> >  arch/mips/include/uapi/asm/mman.h      |   3 +
> >  arch/parisc/include/uapi/asm/mman.h    |   3 +
> >  arch/xtensa/include/uapi/asm/mman.h    |   3 +
> >  include/uapi/asm-generic/mman-common.h |   3 +
>
> I kinda wonder if we could start moving the parts of those headers
> that are the same for all architectures to include/uapi/linux/mman.h
> instead... but that's maybe out of scope for this series.
>
> [...]
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index e871a72a6c32..7216e10723ae 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -60,6 +60,7 @@ static int madvise_need_mmap_write(int behavior)
> >         case MADV_POPULATE_READ:
> >         case MADV_POPULATE_WRITE:
> >         case MADV_COLLAPSE:
> > +       case MADV_GUARD_UNPOISON: /* Only poisoning needs a write lock.=
 */
>
> What does poisoning need a write lock for? anon_vma_prepare() doesn't
> need it (it only needs mmap_lock held for reading),
> zap_page_range_single() doesn't need it, and pagewalk also doesn't
> need it as long as the range being walked is covered by a VMA, which
> it is...
>
> I see you set PGWALK_WRLOCK in guard_poison_walk_ops with a comment
> saying "We might need to install an anon_vma" - is that referring to
> an older version of the patch where the anon_vma_prepare() call was
> inside the pagewalk callback or something like that? Either way,
> anon_vma_prepare() doesn't need write locks (it can't, it has to work
> from the page fault handling path).

I was wondering about that too and I can't find any reason for
write-locking the mm for this operation. PGWALK_WRLOCK should also be
changed to PGWALK_RDLOCK as we are not modifying the VMA.

BTW, I'm testing your patchset on Android and so far it is stable!

>
> >                 return 0;
> >         default:
> >                 /* be safe, default to 1. list exceptions explicitly */
> [...]
> > +static long madvise_guard_poison(struct vm_area_struct *vma,
> > +                                struct vm_area_struct **prev,
> > +                                unsigned long start, unsigned long end=
)
> > +{
> > +       long err;
> > +       bool retried =3D false;
> > +
> > +       *prev =3D vma;
> > +       if (!is_valid_guard_vma(vma, /* allow_locked =3D */false))
> > +               return -EINVAL;
> > +
> > +       /*
> > +        * Optimistically try to install the guard poison pages first. =
If any
> > +        * non-guard pages are encountered, give up and zap the range b=
efore
> > +        * trying again.
> > +        */
> > +       while (true) {
> > +               unsigned long num_installed =3D 0;
> > +
> > +               /* Returns < 0 on error, =3D=3D 0 if success, > 0 if za=
p needed. */
> > +               err =3D walk_page_range_mm(vma->vm_mm, start, end,
> > +                                        &guard_poison_walk_ops,
> > +                                        &num_installed);
> > +               /*
> > +                * If we install poison markers, then the range is no l=
onger
> > +                * empty from a page table perspective and therefore it=
's
> > +                * appropriate to have an anon_vma.
> > +                *
> > +                * This ensures that on fork, we copy page tables corre=
ctly.
> > +                */
> > +               if (err >=3D 0 && num_installed > 0) {
> > +                       int err_anon =3D anon_vma_prepare(vma);
>
> I'd move this up, to before we create poison PTEs. There's no harm in
> attaching an anon_vma to the VMA even if the rest of the operation
> fails; and I think it would be weird to have error paths that don't
> attach an anon_vma even though they .
>
> > +                       if (err_anon)
> > +                               err =3D err_anon;
> > +               }
> > +
> > +               if (err <=3D 0)
> > +                       return err;
> > +
> > +               if (!retried)
> > +                       /*
> > +                        * OK some of the range have non-guard pages ma=
pped, zap
> > +                        * them. This leaves existing guard pages in pl=
ace.
> > +                        */
> > +                       zap_page_range_single(vma, start, end - start, =
NULL);
> > +               else
> > +                       /*
> > +                        * If we reach here, then there is a racing fau=
lt that
> > +                        * has populated the PTE after we zapped. Give =
up and
> > +                        * let the user know to try again.
> > +                        */
> > +                       return -EAGAIN;
>
> Hmm, yeah, it would be nice if we could avoid telling userspace to
> loop on -EAGAIN but I guess we don't have any particularly good
> options here? Well, we could bail out with -EINTR if a (fatal?) signal
> is pending and otherwise keep looping... if we'd tell userspace "try
> again on -EAGAIN", we might as well do that in the kernel...
>
> (Personally I would put curly braces around these branches because
> they occupy multiple lines, though the coding style doesn't explicitly
> say that, so I guess maybe it's a matter of personal preference...
> adding curly braces here would match what is done, for example, in
> relocate_vma_down().)
>
> > +               retried =3D true;
> > +       }
> > +}
> > +
> > +static int guard_unpoison_pte_entry(pte_t *pte, unsigned long addr,
> > +                                   unsigned long next, struct mm_walk =
*walk)
> > +{
> > +       pte_t ptent =3D ptep_get(pte);
> > +
> > +       if (is_guard_pte_marker(ptent)) {
> > +               /* Simply clear the PTE marker. */
> > +               pte_clear_not_present_full(walk->mm, addr, pte, true);
>
> I think that last parameter probably should be "false"? The sparc code
> calls it "fullmm", which is a term the MM code uses when talking about
> operations that remove all mappings in the entire mm_struct because
> the process has died, which allows using some faster special-case
> version of TLB shootdown or something along those lines.
>
> > +               update_mmu_cache(walk->vma, addr, pte);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct mm_walk_ops guard_unpoison_walk_ops =3D {
> > +       .pte_entry              =3D guard_unpoison_pte_entry,
> > +       .walk_lock              =3D PGWALK_RDLOCK,
> > +};
>
> It is a _little_ weird that unpoisoning creates page tables when they
> don't already exist, which will also prevent creating THP entries on
> fault in such areas afterwards... but I guess it doesn't really matter
> given that poisoning has that effect, too, and you probably usually
> won't call MADV_GUARD_UNPOISON on an area that hasn't been poisoned
> before... so I guess this is not an actionable comment.

