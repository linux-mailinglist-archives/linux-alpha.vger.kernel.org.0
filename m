Return-Path: <linux-alpha+bounces-2250-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED64BAD957D
	for <lists+linux-alpha@lfdr.de>; Fri, 13 Jun 2025 21:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 701423A47AA
	for <lists+linux-alpha@lfdr.de>; Fri, 13 Jun 2025 19:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C77A293C7C;
	Fri, 13 Jun 2025 19:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ObXxzX29"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3AB24BBE4
	for <linux-alpha@vger.kernel.org>; Fri, 13 Jun 2025 19:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749842507; cv=none; b=rCskce/zw834KtWGHaiIYRjJ3I66uyq0uCcUKOKG8C9EsIKwHKTaAEKpw5R/9FZZ4nBgUgMIdE/nyGADLNEqgNZUSbXEk9pEfwtxP/x6ygRJ2AWy1sdkX2Mqwy6KpEsdDzzXVPoXx/sNdFf4gzRd4NyQObuZslBZe76s18VVNfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749842507; c=relaxed/simple;
	bh=YLKpZILOwVtOfA0AbaKsPcVtXLdl14+iX8YDYOFnlek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlfkzByLiy/9lVGj7zIqMOsPVoyKbUDaxtv99hoAWHV6MFdGGwmGsnfea4P8uhfv86PksDzrh+4uH5WyoPO/zfWDr7kSbj4HbYWTUCfA7CH18vckN5FHALV95Hf338o4LViohzeXfHercBt078MKTY6f9491Q8kRwy1YTuxMyLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ObXxzX29; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47e9fea29easo72761cf.1
        for <linux-alpha@vger.kernel.org>; Fri, 13 Jun 2025 12:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749842503; x=1750447303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwsnYZZ63LvvlkMeoABDBQxLgrkaQY4fLJ1Enbyh2EY=;
        b=ObXxzX29rZndd1MbjB6+7vqnl/35j6kXZZSxI803hD3AlyUcxnG4uoUeZ2BMbch15U
         dZQfU1FIitEgdFJb+8FkQvqWoH4IhH6IX+jNPdFNnSSdqmSyhuqVwZTXgZdTTUpu+tOT
         8Ya5f75I3Nqfi4N9gnv5+khvSLMMgjpQDNROa5maDl/yI/WuzTLsb8rBD1S5vXiNVP+O
         V7SLh8PDQcodamaBmnAx9ioXgNtCb2OoFakp1cPw5EuGcMChNsz7kAGxOjn6BLfuZBGs
         ldLuU8DmvcMc82QIQuWc3CWnyRu5AuvxIgUxFymCe2c1YKZIEujUm3a41SI4G1UzNUwT
         8JJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749842503; x=1750447303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwsnYZZ63LvvlkMeoABDBQxLgrkaQY4fLJ1Enbyh2EY=;
        b=QKGSU+cCMbOzKgER062PURU51c16er8Ouige3QGKARVjgAvmAOKPDs71wsf5nS0F7V
         5DJVzFNlCh48yE6ma+YMCBEXfTpIeb1zuYL8sUs2SUnBwhaG3mntlww6ASed7bPRAeiE
         KrlolvboDr8k7J7j1ka5818A2PNANnW2zrN13z27C065fHHxmh/mDRSyuqKrzDzuFY7W
         qBkMrrdPzfytxsKGFTuec/iCAF80saiOXI9HX2meB73594U/9P2dYSQ6iD4SLmiwFdv2
         /lnXwbqUpZdjF6yJSqxkLBOBxVfzjrU41ltTBHaTEUmrpandXdN/OHGf7Y7rEWrOBizj
         i0Lw==
X-Forwarded-Encrypted: i=1; AJvYcCW0xE72I1fP6Tfh1PUX70zeUvoZcppiLEWYj7r6jC/LW8adVvPYFT/zM25MnWyKsa1mWncDKMyobXcMMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpoKgmlW78AzhdHUWg3f5ZrNFJ2q7otO/44FkemsSmGBpRPYgE
	jeOZjj1Fqw3ioe1KEg9AskSZDlSH+mlihRpd0ZnsQ0b790JOSGSluYp2ImHvmRyf6EMxOOuKQaF
	9sVik+Xiho3cB3Z/ubxAnkcFh8ucDU0ZLy3nZmQIc
X-Gm-Gg: ASbGnctOp5eHtj01bOhPsHk4xMBMxubBEImWUmpU/b06s+OT9m0HUcZSRgxsZux+ZNt
	ePbApvmEf/BY4KB1O20YF328uMosx1g6oaSK+Q4H4hSdO+by1FT2XAqMvLA5mqHcrb2YYOK7JSN
	/YGh4yAiwnxb29bZwkMVMHrTvjOE69XRWomNwveeKvZQ==
X-Google-Smtp-Source: AGHT+IEO+7tih5cXcAlJg0Vw2/Sois18XRurWIS2/frgQdC8+3vTxmNKORl6AWRcNFb2EewoNPpA6PIVNKd9BEEx0hI=
X-Received: by 2002:ac8:5883:0:b0:47b:840:7f5b with SMTP id
 d75a77b69052e-4a73c763a87mr516731cf.29.1749842503097; Fri, 13 Jun 2025
 12:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749779391.git.gehao@kylinos.cn> <099651f46b0b57f6c7890a64608dc7ca44df7764.1749779391.git.gehao@kylinos.cn>
In-Reply-To: <099651f46b0b57f6c7890a64608dc7ca44df7764.1749779391.git.gehao@kylinos.cn>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 13 Jun 2025 12:21:32 -0700
X-Gm-Features: AX0GCFu-OOwfRLFxcwNjR_GNWx_Buv2sRyKB524WUep1Vz9r7UOBtNhv2b7PdpU
Message-ID: <CAJuCfpGkUk5RXm-HDLB2mr_mRbSxPV+kx116FFBhyYsf6pXNCg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mm/alloc_tag: add the CONFIG_ARCH_NEEDS_WEAK_PER_CPU
 macro when statically defining the percpu variable _shared_alloc_tag
To: Hao Ge <hao.ge@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Kent Overstreet <kent.overstreet@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, Hao Ge <gehao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 8:06=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> From: Hao Ge <gehao@kylinos.cn>
>
> Recently discovered this entry while checking kallsyms on ARM64:
> ffff800083e509c0 D _shared_alloc_tag
>
> If CONFIG_ARCH_NEEDS_WEAK_PER_CPU is not defined(it is only defined for
> s390 and alpha architectures),there's no need to statically define
> the percpu variable _shared_alloc_tag. As the number of CPUs
> increases,the wasted memory will grow correspondingly.

I don't think this patch needs all this background. Just say that
_shared_alloc_tag is not used when CONFIG_ARCH_NEEDS_WEAK_PER_CPU=3Dn,
so you want to compile it out.

>
> Enclose the definition of _shared_alloc_tag within the
> CONFIG_ARCH_NEEDS_WEAK_PER_CPU condition.
>
> Suggested-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Hao Ge <gehao@kylinos.cn>
> ---
>  lib/alloc_tag.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index c7f602fa7b23..14fd66f26e42 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -24,8 +24,10 @@ static bool mem_profiling_support;
>
>  static struct codetag_type *alloc_tag_cttype;
>
> +#ifdef CONFIG_ARCH_NEEDS_WEAK_PER_CPU
>  DEFINE_PER_CPU(struct alloc_tag_counters, _shared_alloc_tag);
>  EXPORT_SYMBOL(_shared_alloc_tag);
> +#endif
>
>  DEFINE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT,
>                         mem_alloc_profiling_key);
> --
> 2.25.1
>

