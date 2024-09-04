Return-Path: <linux-alpha+bounces-1042-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E07096C71A
	for <lists+linux-alpha@lfdr.de>; Wed,  4 Sep 2024 21:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE15F1C21142
	for <lists+linux-alpha@lfdr.de>; Wed,  4 Sep 2024 19:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC5714535E;
	Wed,  4 Sep 2024 19:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="O83/Gbf8"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF8912CDB0
	for <linux-alpha@vger.kernel.org>; Wed,  4 Sep 2024 19:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725476839; cv=none; b=M/G/uwujztuwSYr0LIz+lfHWQCFUt3+d/YO13YL3/gcdsPUHEP/DxTwOURO+XqH51CjGg/hEx86l/7bD7rocCIyCTejlHGE6IjoCRt5AQLCYKpkqqTJEmz4ijt7xDHc9B9IBhgbQRnfl4UGpC/BmhK9uKUsazaSk1l7X6HzL4ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725476839; c=relaxed/simple;
	bh=hLtrV9fo2ENFsppI3EM5//2a1v6xLdR6UciGmLp3E0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAjn+6z914rrce6MLO3Xq+T91w5t54fccLBHV/Y5CAD/A9KBTQAe2vnZoYb695i1PSfFF4Rdvh3MoBUsqRU5skF+Hz9ueb2FIk9GQVFn+HgDqB4lxAd+t+5Urj/245FUqNurrc0HxWPRTth71EBoonpIlVsQ1h0WNgZnTidXlu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=O83/Gbf8; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2da55ea8163so1940147a91.1
        for <linux-alpha@vger.kernel.org>; Wed, 04 Sep 2024 12:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725476837; x=1726081637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o2U7wgEbLS4i4a8ingcWCBDQrhNmwXrz+ffgx64j+qE=;
        b=O83/Gbf8QHytDjtKBC2VP1NHGE69K97QzsnnPLhood4y27NcYWvbRpAYJZHt9lWN5L
         piIbJArzYN5Qf7SPBI49vUE2VjW4GYvYSSeWevifsRIo2JwxWESaOWjUw9KNQUlcAOjW
         M57C0o6ln8DywnEEETUAFokbAoSyohPtRCDiZcplIwBMyuz2tior5wk9DBWcDqSCynVu
         jAvaHC4YqJY0ofPBytPoIllLrn/HiP7br0fsxdsL6Iq9qfvJZ6jQmTfrZAaTKNkj8iqz
         t2z+vruq/jHHUU7ujoGLdO82BtEDxwSzFDLuOmaaNt8DQwT2aKkt8z2EJBcsRPlrEHcB
         kXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725476837; x=1726081637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2U7wgEbLS4i4a8ingcWCBDQrhNmwXrz+ffgx64j+qE=;
        b=DiuebWdYZ+iRile86sC6H8ax9e+vA7sI+jGQ66+mQEZ+FaZ3NkO9O06y5HNLL9C4rn
         5anpiFefnIPwNmJRbEPUtSPcR/LCJ/JEW0s9SIrpzwnrcYsXkHzNeTv+1QrfJ+ParMLn
         9g9/AoAA5uDVwiu/4NKwtCmcAwODJkOy+FqKJuWrsdd/XO/G+6zP2Czw5//xfdsyGjb5
         rnc6Z4orp4f/NTgh4NLpcEP9N55X+S9HUvBHOW0LURGUL871+H/37iClt/P0zOM8bUVv
         lmw66mTIe6BcEncERcziBoYErqf8wSyA1Mblu1tu0lSFcVvyBLisqa2rOkCJPXcWcaOv
         c7Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUWQ2qmULWP9OTuFwpthPEAZ3sdZDRqfvUUVaCu0CEhMnyvMWBsBlGR0KcafitWvZLktgdY77lTAhTvMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk5cBxuxmCBg/2bHGw7qX+bgcHWHw5tOskQ5WvAFMbmiuDnrkX
	w/H8hvs41movewAuPz0BwE2tT1XuuYdPeVyKC8ZfvWPxh8Y069+Se9geuiar99k=
X-Google-Smtp-Source: AGHT+IGRXMFw8eODDeHuSZGixob1QmbWy894YR3dac/q8kTYt2afjYPzXJiDq5qdDnRm4AHLgT4d4Q==
X-Received: by 2002:a17:90b:300e:b0:2d8:27c3:87d7 with SMTP id 98e67ed59e1d1-2d893284ebdmr13545892a91.8.1725476836620;
        Wed, 04 Sep 2024 12:07:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2da53740084sm4858056a91.32.2024.09.04.12.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 12:07:16 -0700 (PDT)
Date: Wed, 4 Sep 2024 12:07:12 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-mm@kvack.org, Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 3/3] mm: Care about shadow stack guard gap when getting
 an unmapped area
Message-ID: <Ztiv4NtsIkKnyiLO@debug.ba.rivosinc.com>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-3-9acda38b3dd3@kernel.org>
 <is6ewj3bhtqy3zadj6lbdv6maupx4kmduvhny66ntifkji6hoj@xmhcf5jt4o66>
 <dbaf5653-df46-4e17-bce1-aec7fb168197@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <dbaf5653-df46-4e17-bce1-aec7fb168197@sirena.org.uk>

On Tue, Sep 03, 2024 at 08:57:20PM +0100, Mark Brown wrote:
>On Tue, Sep 03, 2024 at 03:41:49PM -0400, Liam R. Howlett wrote:
>> * Mark Brown <broonie@kernel.org> [240902 15:09]:
>
>> > +static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
>> > +{
>> > +	if (vm_flags & VM_SHADOW_STACK)
>> > +		return PAGE_SIZE;
>
>> Is PAGE_SIZE is enough?
>
>It's what x86 currently uses so it'll be no worse off if it gets moved
>to the generic code (there's a comment in the arch code explaing what's
>needed there) and it's enough for arm64, we only do single record
>pushes/pops or (optionally) writes to unconstrained addresses.

It's enough for RISC-V too.


