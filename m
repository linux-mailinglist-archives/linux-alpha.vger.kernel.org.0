Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1008227FC7
	for <lists+linux-alpha@lfdr.de>; Thu, 23 May 2019 16:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730826AbfEWOcv (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 23 May 2019 10:32:51 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40429 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730866AbfEWOcl (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 23 May 2019 10:32:41 -0400
Received: by mail-ot1-f68.google.com with SMTP id u11so5600782otq.7
        for <linux-alpha@vger.kernel.org>; Thu, 23 May 2019 07:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UmCv77ojMXG+c1Fp7DLXkEEMvKlYSuA0abYrccWopi8=;
        b=BCy6Okmk8ktr4nwvd4MspoIxsNlhMgBNgut3lK3gji1Mo8ZK86sDQuXYRAM0aEzKt1
         l5h9Z162b8ZZvcy3+o2m7mOM8MFYONAclzGI9eGRFt+MvF5Vk7qd2XbUpuRtY3kwxigT
         TItqAHhT39/xzIdVfEVUYP6dbydvV9umwbP2vl+FxdLXFLSb9ACpWUQrIu3LG0CJGus3
         efSiM9X4tBhY2RglIlFRNgfOwB840H3gEzgClahgzgTog6Yv+6has8aNNHrrbEHD2p91
         f4b1gS1SqBJkPyuKpLmeXF29Yw4PJv/H5cHfQKgbABzZI5vn49C4VG2ZQkov7h619lB0
         cONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UmCv77ojMXG+c1Fp7DLXkEEMvKlYSuA0abYrccWopi8=;
        b=f3KeiGOL2RBDSeAGJfyJNFw+jD1sCofD3elz1h5GVyyIji3vQoc4VekVtYXj+tul/F
         K870fMGCZstSX3q+2+cTzWQF7ft3x222ItoHGI6B614ss47BkenhlCQWYw0xSkqPEK0l
         hKIsDvGR0GMlnT0x1SuXttk0onLwuxXJQqRWiR8mGDgo6J1n97XfouzJcaj7nAfToKyy
         SEohDXuzlRDPXafeWIM/nwW0C9Hm9002teB1P+j7na9+tuGxXjuhS3kwCfnhkfLYyAlK
         7Fp+jip4Cn1AcJGBb9BBkCEr8l0eAISMQDpMDu7NZr8ESVghhFQRm7eqBsiLF9cKB7qU
         My2g==
X-Gm-Message-State: APjAAAXN13WEjg5Ehqvgqk8wwk8UTaUKrtUWhPLW1edYxuGwRryRLffa
        YtQB0wToWTU4GynLeA4CBuIk6xnvWKtEqjP2/UDYuw==
X-Google-Smtp-Source: APXvYqzFh/C6cDrkSdzIHZQLhSVRwEaU4gGSzclCCpHMgWTGugVQoxN/zVlngGYGKq3CVngNXUCDkIhtZyPn6qxtEko=
X-Received: by 2002:a9d:7f8b:: with SMTP id t11mr72319otp.110.1558621960440;
 Thu, 23 May 2019 07:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190522155259.11174-1-christian@brauner.io> <20190522165737.GC4915@redhat.com>
 <20190523115118.pmscbd6kaqy37dym@brauner.io>
In-Reply-To: <20190523115118.pmscbd6kaqy37dym@brauner.io>
From:   Jann Horn <jannh@google.com>
Date:   Thu, 23 May 2019 16:32:14 +0200
Message-ID: <CAG48ez0Uq2GQnQsuPkNrDdJVku_6GPeZ_5F_-5J3iy2CULr0_Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] open: add close_range()
To:     Christian Brauner <christian@brauner.io>
Cc:     Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Florian Weimer <fweimer@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Todd Kjos <tkjos@android.com>,
        "Dmitry V. Levin" <ldv@altlinux.org>,
        Miklos Szeredi <miklos@szeredi.hu>,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, May 23, 2019 at 1:51 PM Christian Brauner <christian@brauner.io> wrote:
[...]
> I kept it dumb and was about to reply that your solution introduces more
> code when it seemed we wanted to keep this very simple for now.
> But then I saw that find_next_opened_fd() already exists as
> find_next_fd(). So it's actually not bad compared to what I sent in v1.
> So - with some small tweaks (need to test it and all now) - how do we
> feel about?:
[...]
> static int __close_next_open_fd(struct files_struct *files, unsigned *curfd, unsigned maxfd)
> {
>         struct file *file = NULL;
>         unsigned fd;
>         struct fdtable *fdt;
>
>         spin_lock(&files->file_lock);
>         fdt = files_fdtable(files);
>         fd = find_next_fd(fdt, *curfd);

find_next_fd() finds free fds, not used ones.

>         if (fd >= fdt->max_fds || fd > maxfd)
>                 goto out_unlock;
>
>         file = fdt->fd[fd];
>         rcu_assign_pointer(fdt->fd[fd], NULL);
>         __put_unused_fd(files, fd);

You can't do __put_unused_fd() if the old pointer in fdt->fd[fd] was
NULL - because that means that the fd has been reserved by another
thread that is about to put a file pointer in there, and if you
release the fd here, that messes up the refcounting (or hits the
BUG_ON() in __fd_install()).

> out_unlock:
>         spin_unlock(&files->file_lock);
>
>         if (!file)
>                 return -EBADF;
>
>         *curfd = fd;
>         filp_close(file, files);
>         return 0;
> }
>
> int __close_range(struct files_struct *files, unsigned fd, unsigned max_fd)
> {
>         if (fd > max_fd)
>                 return -EINVAL;
>
>         while (fd <= max_fd) {

Note that with a pattern like this, you have to be careful about what
happens if someone gives you max_fd==0xffffffff - then this condition
is always true and the loop can not terminate this way.

>                 if (__close_next_fd(files, &fd, maxfd))
>                         break;

(obviously it can still terminate this way)

>                 cond_resched();
>                 fd++;
>         }
>
>         return 0;
> }
