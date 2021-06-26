Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 483DC3B4C21
	for <lists+linux-alpha@lfdr.de>; Sat, 26 Jun 2021 05:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhFZDUQ (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 25 Jun 2021 23:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhFZDUQ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 25 Jun 2021 23:20:16 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894B0C061574
        for <linux-alpha@vger.kernel.org>; Fri, 25 Jun 2021 20:17:54 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id t9so9839666pgn.4
        for <linux-alpha@vger.kernel.org>; Fri, 25 Jun 2021 20:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aM4y0UrWCLTv7rcBz2RIFnjL7rxnHwV/LKZu/4UV0wk=;
        b=nH6MyPY34BEZoiZq9gMd9L04Gprl6YIaeAZoBnp0GSMt6LQrC+9wF5uB7Gs9IBvMc7
         YHwFB8GDL7VOOkWUb/0Ni1Z+5TYZZGjbbN6/MIr6MnfKoetN0ss2z+DZofF60z2LgDtF
         eWrJMT5xunVz9YpztTCkxHoQKtZEc1cqE6z1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aM4y0UrWCLTv7rcBz2RIFnjL7rxnHwV/LKZu/4UV0wk=;
        b=CNd11IXNdNdMkVh9JdYIYiJhCrHKB0RTNC0YDX/kwqD4D7RZAZIj/jFJAorOZrlpzG
         Db2EKfDKlrz7bEjHsFxGHWKAAcwDf3ArTcx7G5eVsDb0xR3XRka2WopX7XSla+Uvbd7a
         2YCAGQRD1TuZl54IujIT4nq14aQq93Qbo0fKAybLZYctZsWxY1gGtUTUlOuPmAvHsfOA
         I2ec2gnHiAZ3zu8L4ASnQ28Wq8t7gF1S0T4OfdsMs6RQeO3LytAi2RH50P9Lw+fI8pKQ
         IFBPiOfghGlsenus3nBXKXWdBSxEPe8LX5Aumqz9yu7g9ECL7AUmcykz2AuQo/W97m/G
         Tm5A==
X-Gm-Message-State: AOAM532zNygzO+kEyRsML27N8nASlssizqa7865pTVpKa3Xfi2qk1GOd
        MsQccLfDCFemTtyFvZZzubJGwQ==
X-Google-Smtp-Source: ABdhPJxUN9p2EsCZz7BIQjod4EcoDqz9OBJQC6bGOc2LMhvw/VqcEhhLzzrJgDkNPO2ksaq2j/1KWw==
X-Received: by 2002:a63:4c2:: with SMTP id 185mr12584370pge.236.1624677473974;
        Fri, 25 Jun 2021 20:17:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c2sm6473987pjv.10.2021.06.25.20.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 20:17:53 -0700 (PDT)
Date:   Fri, 25 Jun 2021 20:17:51 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Michael Schmitz <schmitzmic@gmail.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 2/9] signal/seccomp: Refactor seccomp signal and coredump
 generation
Message-ID: <202106252014.5AE600929@keescook>
References: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133>
 <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133>
 <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133>
 <875yy3850g.fsf_-_@disp2133>
 <87r1gr6qc4.fsf_-_@disp2133>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r1gr6qc4.fsf_-_@disp2133>
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, Jun 24, 2021 at 01:59:55PM -0500, Eric W. Biederman wrote:
> 
> Factor out force_sig_seccomp from the seccomp signal generation and
> place it in kernel/signal.c.  The function force_sig_seccomp takes a
> paramter force_coredump to indicate that the sigaction field should be
> reset to SIGDFL so that a coredump will be generated when the signal
> is delivered.

Ah! This is the part I missed when I was originally trying to figure
out the coredump stuff. It's the need for setting a default handler
(i.e. doing a coredump)?

> force_sig_seccomp is then used to replace both seccomp_send_sigsys
> and seccomp_init_siginfo.
> 
> force_sig_info_to_task gains an extra parameter to force using
> the default signal action.
> 
> With this change seccomp is no longer a special case and there
> becomes exactly one place do_coredump is called from.

Looks good to me. This may benefit from force_sig_seccomp() to be wrapped
in an #ifdef CONFIG_SECCOMP.

(This patch reminds me that the seccomp self tests don't check for core
dumps...)

-- 
Kees Cook
