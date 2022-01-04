Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31044484AB8
	for <lists+linux-alpha@lfdr.de>; Tue,  4 Jan 2022 23:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235520AbiADWb6 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 4 Jan 2022 17:31:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234768AbiADWb6 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Tue, 4 Jan 2022 17:31:58 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A287DC061785
        for <linux-alpha@vger.kernel.org>; Tue,  4 Jan 2022 14:31:57 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id x6so32060387lfa.5
        for <linux-alpha@vger.kernel.org>; Tue, 04 Jan 2022 14:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=drummond.us; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WCROm2fnDVp3gJHoFF4FSh0CLwqqTwPGgd5WC3cykAE=;
        b=SpNAIy18+a+BDF8ohbOhhPTgn+rzzWGPHdpXue1Z95/qQvcACFPfls+EhsBOb9bJ5I
         J4obAOpt6rzp6Cc6ysV/HzbOKr1fr3e+TeLO6bRMnYdo3Gyh9nb1rzv1ICxH2cvlIvP1
         O7zLwOaJVfjhHVFevNE78XtRHOJLnOt4OvZNOrtO4+Qth9yQuKO3Y0zMqJxHhe1sPN68
         AsVbfWMCG2xnfSZ0gRMgCWFuQi9faGM0w08EmIWjCfBZLojXQfuuYl5i08TleIW/7b/n
         nzMZzBq9PSmCXV2xi+HfGLAjucKoCMHpfD9Bcb6PeCRSN1t/e4GZt0e33JDtOpwXUI3r
         +ijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WCROm2fnDVp3gJHoFF4FSh0CLwqqTwPGgd5WC3cykAE=;
        b=qRrHioi75JYBdUzr/vLi76LUknGSDSDZ74VrnHw2XVqDWErUXw7/3d5YZDFPFUMnSU
         RkUrvgouL1jl7uyIeXJDH8RoVHNXXZHuzPDsY57CF3sWs8HM7Mz7ZS1XAU1X/QTpG/9g
         kRAYMSE67s46Bm2mHIDyY2bB3xxi5+nc2s3nWCKakSCHTmna6bWwxpQsxFVfDIdEYpUo
         b3JYFt7kaweIiv2sl5KrOBstD2LgxFrL5gRO4y1dMNzFe8C2xHEPYInL1E6IiaK7AJ1Z
         L9CSbyE5EO+d51wRyQd0wsuLry4fl6SF4bWqsLgF+flYzEmSYcVdNWakOQ4BlGbJsCPR
         GMdA==
X-Gm-Message-State: AOAM532MrNuLwOUCT7f9fru31ES3J6f9YNVr5NPcbn1gWpcXgA0FJzw6
        QMvV+RY2uCU8/+KtCGuQdIWsf3jTFAtDJRSeyTDo+w==
X-Google-Smtp-Source: ABdhPJx1kX6sFLTseOkg2YWGeBhi1W6ClRmDNwQ/+U2YIr6vghHpml3Y6bKghVPjgaFOMW5MDitHq9bLobHNxLYmId8=
X-Received: by 2002:a05:6512:ba9:: with SMTP id b41mr43938123lfv.529.1641335515666;
 Tue, 04 Jan 2022 14:31:55 -0800 (PST)
MIME-Version: 1.0
References: <20220103181956.983342-1-walt@drummond.us> <87iluzidod.fsf@email.froward.int.ebiederm.org>
 <YdSzjPbVDVGKT4km@mit.edu> <87pmp79mxl.fsf@email.froward.int.ebiederm.org> <YdTI16ZxFFNco7rH@mit.edu>
In-Reply-To: <YdTI16ZxFFNco7rH@mit.edu>
From:   Walt Drummond <walt@drummond.us>
Date:   Tue, 4 Jan 2022 14:31:44 -0800
Message-ID: <CADCN6nzT-Dw-AabtwWrfVRDd5HzMS3EOy8WkeomicJF07nQyoA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] signals: Support more than 64 signals
To:     "Theodore Ts'o" <tytso@mit.edu>
Cc:     "Eric W. Biederman" <ebiederm@xmission.com>, aacraid@microsemi.com,
        viro@zeniv.linux.org.uk, anna.schumaker@netapp.com, arnd@arndb.de,
        bsegall@google.com, bp@alien8.de, chuck.lever@oracle.com,
        bristot@redhat.com, dave.hansen@linux.intel.com,
        dwmw2@infradead.org, dietmar.eggemann@arm.com, dinguyen@kernel.org,
        geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com,
        idryomov@gmail.com, mingo@redhat.com, yzaikin@google.com,
        ink@jurassic.park.msu.ru, jejb@linux.ibm.com, jmorris@namei.org,
        bfields@fieldses.org, jlayton@kernel.org, jirislaby@kernel.org,
        john.johansen@canonical.com, juri.lelli@redhat.com,
        keescook@chromium.org, mcgrof@kernel.org,
        martin.petersen@oracle.com, mattst88@gmail.com, mgorman@suse.de,
        oleg@redhat.com, pbonzini@redhat.com, peterz@infradead.org,
        rth@twiddle.net, richard@nod.at, serge@hallyn.com,
        rostedt@goodmis.org, tglx@linutronix.de,
        trond.myklebust@hammerspace.com, vincent.guittot@linaro.org,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        ceph-devel@vger.kernel.org, kvm@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-m68k@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

The only standard tools that support SIGINFO are sleep, dd and ping,
(and kill, for obvious reasons) so it's not like there's a vast hole
in the tooling or something, nor is there a large legacy software base
just waiting for SIGINFO to appear.   So while I very much enjoyed
figuring out how to make SIGINFO work ...

I'll have the VSTATUS patch out in a little bit.

I also think there might be some merit in consolidating the 10
'sigsetsize != sizeof(sigset_t)' checks in a macro and adding comments
that wave people off on trying to do what I did.  If that would be
useful, happy to provide the patch.

On Tue, Jan 4, 2022 at 2:23 PM Theodore Ts'o <tytso@mit.edu> wrote:
>
> On Tue, Jan 04, 2022 at 04:05:26PM -0600, Eric W. Biederman wrote:
> >
> > That is all as expected, and does not demonstrate a regression would
> > happen if SIGPWR were to treat SIG_DFL as SIG_IGN, as SIGWINCH, SIGCONT,
> > SIGCHLD, SIGURG do.  It does show there is the possibility of problems.
> >
> > The practical question is does anything send SIGPWR to anything besides
> > init, and expect the process to handle SIGPWR or terminate?
>
> So if I *cared* about SIGINFO, what I'd do is ask the systemd
> developers and users list if there are any users of the sigpwr.target
> feature that they know of.  And I'd also download all of the open
> source UPS monitoring applications (and perhaps documentation of
> closed-source UPS applications, such as for example APC's program) and
> see if any of them are trying to send the SIGPWR signal.
>
> I don't personally think it's worth the effort to do that research,
> but maybe other people care enough to do the work.
>
> > > I claim, though, that we could implement VSTATUS without implenting
> > > the SIGINFO part of the feature.
> >
> > I agree that is the place to start.  And if we aren't going to use
> > SIGINFO perhaps we could have an equally good notification method
> > if anyone wants one.  Say call an ioctl and get an fd that can
> > be read when a VSTATUS request comes in.
> >
> > SIGINFO vs SIGCONT vs a fd vs something else is something we can sort
> > out when people get interested in modifying userspace.
>
>
> Once VSTATUS support lands in the kernel, we can wait and see if there
> is anyone who shows up wanting the SIGINFO functionality.  Certainly
> we have no shortage of userspace notification interfaces in Linux.  :-)
>
>                                               - Ted
