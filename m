Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD5AEAC883
	for <lists+linux-alpha@lfdr.de>; Sat,  7 Sep 2019 19:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfIGRwI (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 7 Sep 2019 13:52:08 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40648 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388396AbfIGRwI (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Sat, 7 Sep 2019 13:52:08 -0400
Received: by mail-lf1-f68.google.com with SMTP id u29so7479803lfk.7
        for <linux-alpha@vger.kernel.org>; Sat, 07 Sep 2019 10:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JJRFoANDdA7LVjR/dXOt13NCYJCwAkkvMBjFRYL2CJk=;
        b=O0k0d7lqzfAmPEYFzDlOGgQsR12LVtrvxo5oTKj/qTWwdx05EQgXW+UipRXAFcHY7l
         NJSN5sB8Bd0GzZnsutsLrlnHa03N+sVzppgC400AeuuF3leAik8ua94YYTL1N/jeDSEY
         p0NLqzIjW/MddvLJPDdxPws4zfzc5nCUgJ+sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JJRFoANDdA7LVjR/dXOt13NCYJCwAkkvMBjFRYL2CJk=;
        b=lSI8/NkQmFNNH7FNbYwYu1TYak4FupyckjeLPXzyxUPI723EcCRmgWOAPpPujJD+c6
         Ndg6dObVTLugFHtIioj5geiXiuryI4C0zsjfujtmBo1VRjhjxstd+U8Vxk4Wxbg91g61
         8yVEsWndULfnye7RX6IF5JdrBIbA2RwszVuYk7JdcmPjUqEPrsAfdFRcn+vYIgV0ToA9
         iiIscQ2OrG8XMcpqwDc9Vc0vxP5nZC5Gf6Kena+MThK46KPlTjJHG0X6y+PgDFd8XMwo
         xFyTsVePHNCqqwIOp2wPxnX9bWmDLHHLVCmb6ftxCl+KZ7tpWTbPXSeQZiEI0lFXCIR+
         8zDg==
X-Gm-Message-State: APjAAAXl03ib5ab/Zk3VEhqlE5rIM2OyGLZdkRGhwlHAvJ/l0/H2Ry8/
        BNhy5YM/MzSHgMsLd7Kcz2ixRzTGO5s=
X-Google-Smtp-Source: APXvYqxAVhkaqIx2E4N6axGScjk/r+cR1OurUiCprCHCZWdAubS9NHBPinqQmf3b3P20U/c+4LpWpg==
X-Received: by 2002:ac2:54a9:: with SMTP id w9mr11249265lfk.49.1567878726017;
        Sat, 07 Sep 2019 10:52:06 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id v1sm1817720lfa.87.2019.09.07.10.52.05
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Sep 2019 10:52:05 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id q22so4330824ljj.2
        for <linux-alpha@vger.kernel.org>; Sat, 07 Sep 2019 10:52:05 -0700 (PDT)
X-Received: by 2002:a2e:8645:: with SMTP id i5mr9691835ljj.165.1567878349245;
 Sat, 07 Sep 2019 10:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190904201933.10736-1-cyphar@cyphar.com> <20190904201933.10736-12-cyphar@cyphar.com>
 <7236f382d72130f2afbbe8940e72cc67e5c6dce0.camel@kernel.org>
 <CAHk-=whZx97Nm-gUK0ppofj2RA2LLz2vmaDUTKSSV-+yYB9q_Q@mail.gmail.com> <C81D6D29-F6BF-48E6-A15E-3ABCB2C992E5@amacapital.net>
In-Reply-To: <C81D6D29-F6BF-48E6-A15E-3ABCB2C992E5@amacapital.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 7 Sep 2019 10:45:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=whe90Ec_RRrMRLE0=bJOHNS9YmVwcytVxmrfK3oCuZF6A@mail.gmail.com>
Message-ID: <CAHk-=whe90Ec_RRrMRLE0=bJOHNS9YmVwcytVxmrfK3oCuZF6A@mail.gmail.com>
Subject: Re: [PATCH v12 11/12] open: openat2(2) syscall
To:     Andy Lutomirski <luto@amacapital.net>
Cc:     Jeff Layton <jlayton@kernel.org>, Aleksa Sarai <cyphar@cyphar.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Christian Brauner <christian@brauner.io>,
        Eric Biederman <ebiederm@xmission.com>,
        Andy Lutomirski <luto@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Jann Horn <jannh@google.com>, Tycho Andersen <tycho@tycho.ws>,
        David Drysdale <drysdale@google.com>,
        Chanho Min <chanho.min@lge.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Aleksa Sarai <asarai@suse.de>,
        Linux Containers <containers@lists.linux-foundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sat, Sep 7, 2019 at 10:42 AM Andy Lutomirski <luto@amacapital.net> wrote:
>
> Linus, you rejected resolveat() because you wanted a *nice* API

No. I rejected resoveat() because it was a completely broken garbage
API that couldn't do even basic stuff right (like O_CREAT).

We have a ton of flag space in the new openat2() model, we might as
well leave the old flags alone that people are (a) used to and (b) we
have code to support _anyway_.

Making up a new flag namespace is only going to cause us - and users -
more work, and more confusion. For no actual advantage. It's not going
to be "cleaner". It's just going to be worse.

                 Linus
