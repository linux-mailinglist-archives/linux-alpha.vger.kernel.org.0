Return-Path: <linux-alpha+bounces-2005-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B135A427BB
	for <lists+linux-alpha@lfdr.de>; Mon, 24 Feb 2025 17:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85644166F19
	for <lists+linux-alpha@lfdr.de>; Mon, 24 Feb 2025 16:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C892F262D21;
	Mon, 24 Feb 2025 16:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NQeAQWz7"
X-Original-To: linux-alpha@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC2F25A64D
	for <linux-alpha@vger.kernel.org>; Mon, 24 Feb 2025 16:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740414104; cv=none; b=Pz+AH8qcWOu8J80KSQixWWPMUjfLR3X7YEdZx9bpeZMuvI+4+jxzkxoj/IgyQIn4LAX1n65ecJvAf3so220NSD+HYkETFV3ZeilmZuWC9cdQ0W98deZ2jTvrcr5BT0KPqQbgbJpEEs3Rwu+f8njdLiw0/JUaJBpcN1kSGmTu34c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740414104; c=relaxed/simple;
	bh=Bcw1wDQoOeot8tpK5GRPmkl82bK+1+f4v0hjc/unh40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7evJbg5EriuV0r3mc7Sk3JHFmpGM7ZphcF+oT9H9AjShUOonl6X+uJk80f2n8+l+fAvnauXAc3m8QQmFHlnEnP9M/TWd1LX74F+6pir01Jmnora1Vuc1r83dJKOK6ff3G47ZGQfqaMxMOlYvEqNZ5FMDy64iyl8C9N3lkSlz0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NQeAQWz7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740414101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BbgONUWfgHLarcjp/Tl0GNlCJNdAiQjgaPgMeontBJk=;
	b=NQeAQWz76lRmy21bFaY/djIZdaF9iiNWPtHHd8aL9ReAlwUWNTnLdnGWa59c8YAHDQp3s9
	ZVrgm1b0TEjEPBBA+fFWJqT+/SMbef8rkmW/56QkmQ26WTPpQUinJD0nCQzi2XNXEuLHmJ
	gKN9gxNUFlSacRQwdDJeqKTEg9qzQvc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-R5tT1eMbP3yrp9fThU63Qw-1; Mon, 24 Feb 2025 11:21:40 -0500
X-MC-Unique: R5tT1eMbP3yrp9fThU63Qw-1
X-Mimecast-MFC-AGG-ID: R5tT1eMbP3yrp9fThU63Qw_1740414099
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-abb93de227dso430215766b.1
        for <linux-alpha@vger.kernel.org>; Mon, 24 Feb 2025 08:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740414099; x=1741018899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BbgONUWfgHLarcjp/Tl0GNlCJNdAiQjgaPgMeontBJk=;
        b=htHNmFCAA7GdadtDYR8U0fZ8fbe+LEUNOHamD1+jeugsopv3oPkxRhBAmJ344+dIiy
         26zC6NQoqpGfD+l84rZp74O+F4qUapJbZH2ecFEalS3HKFyNKuiRk8hnZpQD9A6O+hdy
         Q7mcoCeSLX+b8Navtptk8MkJz3GjWsuH//KlAw2e5qKm44UnJGJfhfJHsbK5l+sgbWvm
         QR7xEZSs91G5C5Xkxc/mBMsACzJ2d65DoRJaLaLK7ptIXLRR9DyR8Pn6CKPFZgA7i9KJ
         d8O0DkcEideY2Bv/lcu+Xh367MefFQC0Ts3PgXNxSkBKMe/d/wYtM1CH70PEVmCtRq8G
         XX1w==
X-Forwarded-Encrypted: i=1; AJvYcCUVMp7dsUvZ8jxe43mlAHo/XpNuTe83OWhAZvtyg2R/h1TwJadX1cD8Y9JUB6FYM4VZXBBfxJ6rw/2a8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyogWXWx9xCvu6ADxiRHoAMJ9az17BqMkyoolZHCcr9COLm/uRj
	S2llRUSYAH8Zb2e+RkQMfL1AksEVQku9tOhD/Uqrs45daIqIv6JPmIvFtnkS5EB6plbYDAxjH2L
	xvJaN/hEKRP7KDEgbe5ACLIKY9htKxaOWyB9kz1YzUUUFAWKPKV5JGT8XwbQ=
X-Gm-Gg: ASbGncsSUcoq+mlK0yuJlwNbOGymqNx7AcvMpr03BxgC4R64FTMIK80TeJopOuVp3dB
	DGBX1iZ3fJILvbrPXZFI3aycjG+HKLCBUhEf+VEcCRcvHxV/v7sK/8jz02s3vS2EK3XtJL88yqP
	eyWpxKQrX7P88yNIcNNO68JjBuVWJh+Yv//mjRsumv2sSTPz6UbBtKagm19ISQcBCJVRwNHzqEO
	ucD4Y0F62RolQ7Cmv8O4E2w4EoDWsI5tmEpOxxT8HpzI/aFZLEnES2X9njTFmiv5Wbl0ijg00Lb
	gwr511sV1pvrxm9n1Z16t4nlApC75MPBVjM=
X-Received: by 2002:a17:907:1b26:b0:abb:b0c0:5b6b with SMTP id a640c23a62f3a-abc099b386dmr1391793166b.7.1740414098588;
        Mon, 24 Feb 2025 08:21:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVIc+JAiSWQcjvyNYMJZbdBLdYt9qKN3p7wrynJ8JvTXd/WAhRLvwN0eiscAH5n9vkRsMuqA==
X-Received: by 2002:a17:907:1b26:b0:abb:b0c0:5b6b with SMTP id a640c23a62f3a-abc099b386dmr1391785866b.7.1740414098057;
        Mon, 24 Feb 2025 08:21:38 -0800 (PST)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abec4c14a27sm95755766b.45.2025.02.24.08.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 08:21:37 -0800 (PST)
Date: Mon, 24 Feb 2025 17:21:36 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Amir Goldstein <amir73il@gmail.com>, 
	"Darrick J. Wong" <djwong@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Theodore Tso <tytso@mit.edu>
Subject: Re: [PATCH v3] fs: introduce getfsxattrat and setfsxattrat syscalls
Message-ID: <snfyyqhdzevotzcivrcd7uqpaobnslxgddd26s6nc3bb7ey3g4@posoztx4qrtm>
References: <20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org>
 <20250221181135.GW21808@frogsfrogsfrogs>
 <CAOQ4uxgyYBFqkq6cQsso4LxJsPJ4uECOdskXmz-nmGhhV5BQWg@mail.gmail.com>
 <20250224-klinke-hochdekoriert-3f6be89005a8@brauner>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224-klinke-hochdekoriert-3f6be89005a8@brauner>

On 2025-02-24 12:32:17, Christian Brauner wrote:
> On Fri, Feb 21, 2025 at 08:15:24PM +0100, Amir Goldstein wrote:
> > On Fri, Feb 21, 2025 at 7:13 PM Darrick J. Wong <djwong@kernel.org> wrote:
> > >
> > > On Tue, Feb 11, 2025 at 06:22:47PM +0100, Andrey Albershteyn wrote:
> > > > From: Andrey Albershteyn <aalbersh@redhat.com>
> > > >
> > > > Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> > > > extended attributes/flags. The syscalls take parent directory fd and
> > > > path to the child together with struct fsxattr.
> > > >
> > > > This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> > > > that file don't need to be open as we can reference it with a path
> > > > instead of fd. By having this we can manipulated inode extended
> > > > attributes not only on regular files but also on special ones. This
> > > > is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> > > > we can not call ioctl() directly on the filesystem inode using fd.
> > > >
> > > > This patch adds two new syscalls which allows userspace to get/set
> > > > extended inode attributes on special files by using parent directory
> > > > and a path - *at() like syscall.
> > > >
> > > > Also, as vfs_fileattr_set() is now will be called on special files
> > > > too, let's forbid any other attributes except projid and nextents
> > > > (symlink can have an extent).
> > > >
> > > > CC: linux-api@vger.kernel.org
> > > > CC: linux-fsdevel@vger.kernel.org
> > > > CC: linux-xfs@vger.kernel.org
> > > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > > > ---
> > > > v1:
> > > > https://lore.kernel.org/linuxppc-dev/20250109174540.893098-1-aalbersh@kernel.org/
> > > >
> > > > Previous discussion:
> > > > https://lore.kernel.org/linux-xfs/20240520164624.665269-2-aalbersh@redhat.com/
> > > >
> > > > XFS has project quotas which could be attached to a directory. All
> > > > new inodes in these directories inherit project ID set on parent
> > > > directory.
> > > >
> > > > The project is created from userspace by opening and calling
> > > > FS_IOC_FSSETXATTR on each inode. This is not possible for special
> > > > files such as FIFO, SOCK, BLK etc. Therefore, some inodes are left
> > > > with empty project ID. Those inodes then are not shown in the quota
> > > > accounting but still exist in the directory. Moreover, in the case
> > > > when special files are created in the directory with already
> > > > existing project quota, these inode inherit extended attributes.
> > > > This than leaves them with these attributes without the possibility
> > > > to clear them out. This, in turn, prevents userspace from
> > > > re-creating quota project on these existing files.
> > > > ---
> > > > Changes in v3:
> > > > - Remove unnecessary "dfd is dir" check as it checked in user_path_at()
> > > > - Remove unnecessary "same filesystem" check
> > > > - Use CLASS() instead of directly calling fdget/fdput
> > > > - Link to v2: https://lore.kernel.org/r/20250122-xattrat-syscall-v2-1-5b360d4fbcb2@kernel.org
> > > > ---
> > > >  arch/alpha/kernel/syscalls/syscall.tbl      |  2 +
> > > >  arch/arm/tools/syscall.tbl                  |  2 +
> > > >  arch/arm64/tools/syscall_32.tbl             |  2 +
> > > >  arch/m68k/kernel/syscalls/syscall.tbl       |  2 +
> > > >  arch/microblaze/kernel/syscalls/syscall.tbl |  2 +
> > > >  arch/mips/kernel/syscalls/syscall_n32.tbl   |  2 +
> > > >  arch/mips/kernel/syscalls/syscall_n64.tbl   |  2 +
> > > >  arch/mips/kernel/syscalls/syscall_o32.tbl   |  2 +
> > > >  arch/parisc/kernel/syscalls/syscall.tbl     |  2 +
> > > >  arch/powerpc/kernel/syscalls/syscall.tbl    |  2 +
> > > >  arch/s390/kernel/syscalls/syscall.tbl       |  2 +
> > > >  arch/sh/kernel/syscalls/syscall.tbl         |  2 +
> > > >  arch/sparc/kernel/syscalls/syscall.tbl      |  2 +
> > > >  arch/x86/entry/syscalls/syscall_32.tbl      |  2 +
> > > >  arch/x86/entry/syscalls/syscall_64.tbl      |  2 +
> > > >  arch/xtensa/kernel/syscalls/syscall.tbl     |  2 +
> > > >  fs/inode.c                                  | 75 +++++++++++++++++++++++++++++
> > > >  fs/ioctl.c                                  | 16 +++++-
> > > >  include/linux/fileattr.h                    |  1 +
> > > >  include/linux/syscalls.h                    |  4 ++
> > > >  include/uapi/asm-generic/unistd.h           |  8 ++-
> > > >  21 files changed, 133 insertions(+), 3 deletions(-)
> > > >
> > >
> > > <cut to the syscall definitions>
> > >
> > > > diff --git a/fs/inode.c b/fs/inode.c
> > > > index 6b4c77268fc0ecace4ac78a9ca777fbffc277f4a..b2dddd9db4fabaf67a6cbf541a86978b290411ec 100644
> > > > --- a/fs/inode.c
> > > > +++ b/fs/inode.c
> > > > @@ -23,6 +23,9 @@
> > > >  #include <linux/rw_hint.h>
> > > >  #include <linux/seq_file.h>
> > > >  #include <linux/debugfs.h>
> > > > +#include <linux/syscalls.h>
> > > > +#include <linux/fileattr.h>
> > > > +#include <linux/namei.h>
> > > >  #include <trace/events/writeback.h>
> > > >  #define CREATE_TRACE_POINTS
> > > >  #include <trace/events/timestamp.h>
> > > > @@ -2953,3 +2956,75 @@ umode_t mode_strip_sgid(struct mnt_idmap *idmap,
> > > >       return mode & ~S_ISGID;
> > > >  }
> > > >  EXPORT_SYMBOL(mode_strip_sgid);
> > > > +
> > > > +SYSCALL_DEFINE4(getfsxattrat, int, dfd, const char __user *, filename,
> > > > +             struct fsxattr __user *, fsx, unsigned int, at_flags)
> > >
> > > Should the kernel require userspace to pass the size of the fsx buffer?
> > > That way we avoid needing to rev the interface when we decide to grow
> > > the structure.
> 
> Please version the struct by size as we do for clone3(),
> mount_setattr(), listmount()'s struct mnt_id_req, sched_setattr(), all
> the new xattrat*() system calls and a host of others. So laying out the
> struct 64bit and passing a size alongside it.
> 
> This is all handled by copy_struct_from_user() and copy_struct_to_user()
> so nothing to reinvent. And it's easy to copy from existing system
> calls.
> 

Oh, thanks for pointing to these, will use them.

-- 
- Andrey


