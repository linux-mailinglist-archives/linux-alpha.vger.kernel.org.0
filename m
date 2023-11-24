Return-Path: <linux-alpha+bounces-88-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD6E7F7F98
	for <lists+linux-alpha@lfdr.de>; Fri, 24 Nov 2023 19:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDEF0B212A8
	for <lists+linux-alpha@lfdr.de>; Fri, 24 Nov 2023 18:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC562D787
	for <lists+linux-alpha@lfdr.de>; Fri, 24 Nov 2023 18:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="pMWbDcn7"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 041E81BE5
	for <linux-alpha@vger.kernel.org>; Fri, 24 Nov 2023 10:06:49 -0800 (PST)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E9EEE40C53
	for <linux-alpha@vger.kernel.org>; Fri, 24 Nov 2023 18:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1700849204;
	bh=wRMP5+CB/dWRsPDJAQ8POMTdSPTZSzfH20JVuPZ9m1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=pMWbDcn7eeJ8e8/r4dbt3hqWE59HUyHhLULteobjTYzytJinVX99TeSkO3Cj3DGOD
	 r31I5LIO9BiT2r2ro22v2yXEJirZ6W4RzlIXfGKxSWLyB+d/fZDdNBBl/8p1p2MnR5
	 dNLiOn2pvKQbegyohCzcfcn9zE7K+F3stK1g6NqcP9UWe6ScX1ghzWSUv8a8Aa3kdJ
	 uluXqskIvGxVeyX22RBMvlwPpMkMj/2jZ5vxE0rS0tIDhqQFUafsyMtxfb0EWiTNkV
	 9fV6r+taGnZ8E0Zau7MRmWazP4t1PxiK1RsaIhQSphzTIiFDOmDb2CPLaJy54KKqCC
	 R/sogx9N2JZvw==
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-332e2e0b98bso1257335f8f.1
        for <linux-alpha@vger.kernel.org>; Fri, 24 Nov 2023 10:06:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700849200; x=1701454000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRMP5+CB/dWRsPDJAQ8POMTdSPTZSzfH20JVuPZ9m1g=;
        b=T3THhq5TMMUIOP9D5fYj0+VDNtDE2DH3a9i7gDiKxeTc0NHxNHBepF8uBiB7cuODTv
         xzVbelnRnHOuzpMRqzrr1ShBJRzcYax67OQzqlLsjzPRxp/7ZDIXMh40NrDdY9xRNtPu
         T6BBarcvh6u3jWwa5gvLqMRVeCMAlZ8zqGfDPvTU6m9VIt+MSnMtdt4oQhGhnYum6Odi
         NJfwIntFWgjW47I8aUzwO+xVuPoLEjvrqDa5y0Tom7473ZOwldduN0P82opdkv4Za2PL
         sRdnfuymx5REkVQ7sXdo8ld9UyTfMs7W+vzi1CyqCsRePfNODKGa4C6nAwMGwklPWQpv
         i4cg==
X-Gm-Message-State: AOJu0YwTo/lXjePFByGvbVDgTNmclyOS0oh2LxUIveMfsuCWezMG3inf
	0VuzzqL/BJz3GgrqC8ugAfYy3J4n5s9iE90vFuZBcr7/FF0xzjEJFPkare5BcpN7e5riZm0QxWc
	dn7KnoK0sNxh3v0MF8Vi3H9Iq7xSK/zy54/0HtrFbjL6so/ntln9eBhix
X-Received: by 2002:adf:e4c4:0:b0:32f:ba72:e80b with SMTP id v4-20020adfe4c4000000b0032fba72e80bmr2555617wrm.54.1700849199954;
        Fri, 24 Nov 2023 10:06:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjjhk9ilxFYEdI3zNXLTLtpEuyy484YBP3DWTEtTNey4GktUKCsLm9WTtCLVimfQV66FRye8TE1WobE7MhFX8=
X-Received: by 2002:adf:e4c4:0:b0:32f:ba72:e80b with SMTP id
 v4-20020adfe4c4000000b0032fba72e80bmr2555585wrm.54.1700849199548; Fri, 24 Nov
 2023 10:06:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231123180246.750674-1-dimitri.ledkov@canonical.com>
 <87plzzu1w0.fsf@email.froward.int.ebiederm.org> <CADWks+aY0jOq6erApu7i0wNVX3uXPbs=Zj7o3XHPMudOkYyeVA@mail.gmail.com>
In-Reply-To: <CADWks+aY0jOq6erApu7i0wNVX3uXPbs=Zj7o3XHPMudOkYyeVA@mail.gmail.com>
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date: Fri, 24 Nov 2023 18:06:01 +0000
Message-ID: <CADWks+YUm+kCfZZkrCHE+x1ygdqLawyk+h4_ahac9+7b_AvbUw@mail.gmail.com>
Subject: Re: [PATCH 0/5] remove the last bits of a.out support
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Nov 2023 at 14:36, Dimitri John Ledkov
<dimitri.ledkov@canonical.com> wrote:
>
> On Fri, 24 Nov 2023 at 06:01, Eric W. Biederman <ebiederm@xmission.com> wrote:
> >
> > Dimitri John Ledkov <dimitri.ledkov@canonical.com> writes:
> >
> > > I was working on how linux-libc-dev headers are shipped in Ubuntu and
> > > stumbled upon seemingly unused and useless linux/a.out.h header. It
> > > seems like it is an accidental leftover at this point.
> >
> > How do you see that they are unused?

When I did my code search the only and last remaining userspace code
that imports linux/a.out.h it is the objtool that is patched in these
patch series.
It is also vendored as copy in aboot tool, which has been patched in
many downstreams to use a.out.h instead of linux/a.out.h.

> >
> > Are they never exported to userspace?
> >

Yes it is exported for user-code to compile against. The question is
if any of them import it, or use it.

> > Are there any userspace programs that care?

Just the alpha objstrip tool in these series.

> >
> > Performing a quick debian code search I see chromium, qt6, ruby-rogue, hurd,
> > bazel_bootstrap, aboot, cde.
> >

chromium qt6 bazel cde - vendor a full linux source tree with
manifests, to build actual linux kernel as offered by a vendored
project or for bootstrapping toolchains. These are all unused by the
resulting userspace.

aboot - has the copy of arch/alpha/boot/tools/objstrip.c which is
patched in these series, to support booting a.out based alpha which is
gone. So self-referencing.

ruby-rogue is syntax highlight for Syzlang which is kernel syscall
fuzzing language, by definition it highlights things inside kernel,
and thus will be unused highlight code for kernel sources that dropped
a.out.h support and will do correctly syntax highlight for syszlang
source code that targets a.out.h capable kernels.

hurd - it is a pfinet server based on a vendored copy of linux source
tree, with its own copy of linux/a.out.h and its own copy of
affs_fs_i.h. It is based on the linux 2.2.12 partial tree. If they
upgrade networking code to a newer linux copy, it will be gone there
too.

> > I can imagine all kinds of reasons old code could be using headers for a
> > historical format.  Some of them are quite legitimate, and some of them
> > are quite silly.  If it is old code like aboot it may be that it is
> > difficult to test any changes.  If memory serves you have to flash your
> > firmware to change/test aboot.
> >
> > Because showing userspace does not care about the definitions in a file
> > is a completely different problem then showing the kernel does not care
> > about the definitions I left them, last time I was working in this area.
> > Keeping headers that will never change is not cost to the kernel so it
> > doesn't hurt us to be nice to historical userspace.
> >
> > My quick debian code search suggests that there are pieces of userspace
> > that still use linux/a.out.h.  Are you seeing something I am not?

Was your search
https://codesearch.debian.net/search?q=linux%2Fa.out.h&literal=1&perpkg=1
?

In which case none of them are header imports as compiled into any of
the userspace code. They are all vendored copies of linux code, either
unused or compiled as a kernel.

> > Do all of those pieces of code compile just fine with a.out.h missing?
> >

Yes, as none of them import it =) with objstrip being the last one.

>
> I will recheck the above mentioned things again, but as far as I could
> tell up to this point, is that things mostly use a.out.h provided by
> glibc.
>
> Separately, I can do this change in a test-rebuild of ubuntu archive
> of all packages on amd64,. as that's the only Ubuntu arch that ships
> linux/a.out.h.
>
> As far as I can tell, the legacy userspace access to linux/a.out.h can
> use glibc's a.out.h instead. But yes, it would be pain, if code
> changes are required to things.
>
> > Eric
> >
> >
> > > Dimitri John Ledkov (5):
> > >   alpha: remove a.out support from tools/objstrip
> > >   alpha: stop shipping a.out.h uapi headers
> > >   m68k: stop shipping a.out.h uapi headers
>
> I think above three patches still can be merged in m68k & alpha trees.
>
> > >   x86: stop shipping a.out.h uapi headers
> > >   uapi: remove a.out.h uapi header
> > >
>
> And these two need further validation now, based on Eric's input.

I believe all examples Eric pointed out are false-positives of Linux
source tree itself dating back to copies of 2.1.22.
Thus this should all be merged.

>
> > >  arch/alpha/boot/tools/objstrip.c    |  52 +-----
> > >  arch/alpha/include/uapi/asm/a.out.h |  92 ----------
> > >  arch/m68k/include/uapi/asm/a.out.h  |  21 ---
> > >  arch/x86/include/uapi/asm/a.out.h   |  21 ---
> > >  include/uapi/Kbuild                 |   4 -
> > >  include/uapi/linux/a.out.h          | 251 ----------------------------
> > >  6 files changed, 6 insertions(+), 435 deletions(-)
> > >  delete mode 100644 arch/alpha/include/uapi/asm/a.out.h
> > >  delete mode 100644 arch/m68k/include/uapi/asm/a.out.h
> > >  delete mode 100644 arch/x86/include/uapi/asm/a.out.h
> > >  delete mode 100644 include/uapi/linux/a.out.h

-- 
okurrr,

Dimitri

