Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 747DBA975D
	for <lists+linux-alpha@lfdr.de>; Thu,  5 Sep 2019 01:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729919AbfIDXwD (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 4 Sep 2019 19:52:03 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35823 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729635AbfIDXwD (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Wed, 4 Sep 2019 19:52:03 -0400
Received: by mail-lj1-f194.google.com with SMTP id l14so484425lje.2
        for <linux-alpha@vger.kernel.org>; Wed, 04 Sep 2019 16:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lkW/YWLZKFkaRlur1cRxiMMOTA0gNhHwo+TbpZCC63g=;
        b=Cnu5WYs/aAthmsXfnwtWzL5CNjpaY23sMnhFtcX1zve3r2rc/Ho+dRzPF32HPRMBnj
         gveXLtTDU7YHSGctyOcfke7l1YNaudqputmw6AJ3ZcUOsNYmqHCIu9DY9WHGlywCQ4Su
         iCCcCFmwH9f6fkeMSqS83pY7B6dx4aSlHZljU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lkW/YWLZKFkaRlur1cRxiMMOTA0gNhHwo+TbpZCC63g=;
        b=Y0Ra7FqZDVkDuCB6TDz83gBXBYoiN2eTzhptTWRhMX+NqpwC3u8gmOVsmgKhXNB3t1
         QXFLFBrpNZ2k240XnsZ6JHsvXWGsGSFvjmo4O0pNCgm+sykDNSk7vTNCA6Y5JBUPjh0F
         AXCipozQ3RzuuXvHuUvDJCcQZoDV6z4/YSr7+Wrc+TIt6hZsD8D6i2d3w8eda73ZwuvD
         rlJPAuTfGL6mMn8AQotNyc+6/UEdoYfHp+I6/UfYBL3OC7QtZOUvhk+sckQUIgxpaxIo
         KFMwehgRgo7pD/XhI7CkZ2wFjNJTEWcv9ZIGBS8Ym/HBDdEuSJkRLge6p01PxFkGfUbC
         UhGQ==
X-Gm-Message-State: APjAAAWHtnfRd1DLfYwQfoCAiSfcAz3tvlB1TkuNmz6FC/IADh2Mnzx4
        uFMkhfi0iV9JMa5Zz/uQAN/htq6R1ms=
X-Google-Smtp-Source: APXvYqwpAjpdm6k/pAjk77l+dTp63GjkP/9sXASi4Kw7FDF9bRZHmjYjRWJvbqgdljY9UC2QkelGeA==
X-Received: by 2002:a2e:3109:: with SMTP id x9mr127823ljx.19.1567641120587;
        Wed, 04 Sep 2019 16:52:00 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id c69sm49555ljf.32.2019.09.04.16.52.00
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2019 16:52:00 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id t14so471112lji.4
        for <linux-alpha@vger.kernel.org>; Wed, 04 Sep 2019 16:52:00 -0700 (PDT)
X-Received: by 2002:a2e:3a0e:: with SMTP id h14mr127121lja.180.1567640710863;
 Wed, 04 Sep 2019 16:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190904201933.10736-1-cyphar@cyphar.com> <20190904201933.10736-11-cyphar@cyphar.com>
 <CAHk-=wiod1rQMU+6Zew=cLE8uX4tUdf42bM5eKngMnNVS2My7g@mail.gmail.com>
 <20190904214856.vnvom7h5xontvngq@yavin.dot.cyphar.com> <CAHk-=wgcJq21Hydh7Tx5-o8empoPp7ULDBw0Am-du_Pa+fcftQ@mail.gmail.com>
 <20592.1567636276@warthog.procyon.org.uk> <CAHk-=wg7Wq1kj8kZ+SSpfU_o991woW60NWca9yBA2ccs2eNx8Q@mail.gmail.com>
 <20190904232911.GN1131@ZenIV.linux.org.uk>
In-Reply-To: <20190904232911.GN1131@ZenIV.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 4 Sep 2019 16:44:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjx3y1Y7iE6T0yiERc8G5iT1sTABWbX_nFxw9NVHCFCPA@mail.gmail.com>
Message-ID: <CAHk-=wjx3y1Y7iE6T0yiERc8G5iT1sTABWbX_nFxw9NVHCFCPA@mail.gmail.com>
Subject: Re: [PATCH v12 10/12] namei: aggressively check for nd->root escape
 on ".." resolution
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     David Howells <dhowells@redhat.com>,
        Aleksa Sarai <cyphar@cyphar.com>,
        Jeff Layton <jlayton@kernel.org>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Christian Brauner <christian@brauner.io>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Eric Biederman <ebiederm@xmission.com>,
        Andy Lutomirski <luto@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Tycho Andersen <tycho@tycho.ws>,
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

On Wed, Sep 4, 2019 at 4:29 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Wed, Sep 04, 2019 at 03:38:20PM -0700, Linus Torvalds wrote:
> > On Wed, Sep 4, 2019 at 3:31 PM David Howells <dhowells@redhat.com> wrote:
> > >
> > > It ought to be reasonably easy to make them per-sb at least, I think.  We
> > > don't allow cross-super rename, right?
> >
> > Right now the sequence count handling very much depends on it being a
> > global entity on the reader side, at least.
> >
> > And while the rename sequence count could (and probably should) be
> > per-sb, the same is very much not true of the mount one.
>
> Huh?  That will cost us having to have a per-superblock dentry
> hash table; recall that lockless lockup can give false negatives
> if something gets moved from chain to chain, and rename_lock is
> first and foremost used to catch those and retry.  If we split
> it on per-superblock basis, we can't have dentries from different
> superblocks in the same chain anymore...

That's exactly the "very much depends on it being a global entity on
the reader side" thing.

I'm not convinced that's the _only_ way to handle things. Maybe a
combination of (wild handwaving) per-hashqueue sequence count and some
clever scheme for pathname handling could work.

I've not personally seen a load where the global rename lock has been
a problem (very few things really do a lot of renames), but
system-wide locks do make me nervous.

We have other (and worse) ones. tasklist_lock comes to mind.

             Linus
