Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B593A36DE
	for <lists+linux-alpha@lfdr.de>; Fri, 11 Jun 2021 00:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhFJWOu (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 10 Jun 2021 18:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbhFJWOt (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 10 Jun 2021 18:14:49 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 652E9C061574
        for <linux-alpha@vger.kernel.org>; Thu, 10 Jun 2021 15:12:39 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id k25so1430064eja.9
        for <linux-alpha@vger.kernel.org>; Thu, 10 Jun 2021 15:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IH1SveIFJ5wJ6kocsX0s8v3WiB0uqtridXReuF2KUMY=;
        b=Qzof8FNEW2Ba5XPZGpDfZSR6rdtd6WGsu717h8Er0yjM+Qrz/xmDEYF47olKQxMaDV
         /WuPvFIxyme1vchmGP1HhMrAqH5OzNDJ6D669STTMCTBS8PPP8U2SeAmmSAiNv3xHWUT
         sYS5gTDilCKxc+IrHBQDdFNyeZ8axOedobMUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IH1SveIFJ5wJ6kocsX0s8v3WiB0uqtridXReuF2KUMY=;
        b=n5DWR4q4sUhFmHwt9VZ8P1AlvzuOi5fm7MVO6Noj8NLhXXrVR1d90g023wFbL7jtTD
         1WCyQRATP0fBqlIT4Yw3ATYLOR50uGQhdORK3iisizi/7YZZywSn109pxBVHUBO1D7oc
         xTpxSJK/pKjrZcWRZemdogAa7po1OdC+4qdbtTDZaHB7mKkCTu1Z2Y2BacwilkspX0Qi
         oMdBxZrkspa4NCu6ZdX/vUHBMwDKBJ2gjOHsD947HUSOLSRqyUNouHLiQzO7L9eo+YJz
         pVO6Z/iPQ4FSoCUz51GtQsAk9jiTLHdw3Os19f4O7nY7r30nqyMFr9Hkcmzbs8/ABFQx
         tquw==
X-Gm-Message-State: AOAM531Vwn+FPkukCX3MgWukC3EUqTz5+/09fCOqyQnOQtNjeF5U6wv8
        79H1uprJAmqgjrKuFuhTsWkxpAqtR+j1DIxDZLk=
X-Google-Smtp-Source: ABdhPJxH0zSkvAQoHSsRNZAdgULxU1k2cj2GVnMXcUCD4ZGgM+GezKywhzI0NCE0QkMWimBC+2R49A==
X-Received: by 2002:a17:906:d85:: with SMTP id m5mr595857eji.55.1623363157712;
        Thu, 10 Jun 2021 15:12:37 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id l8sm1922690eds.79.2021.06.10.15.12.37
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 15:12:37 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id cb9so34915404edb.1
        for <linux-alpha@vger.kernel.org>; Thu, 10 Jun 2021 15:12:37 -0700 (PDT)
X-Received: by 2002:ac2:43b9:: with SMTP id t25mr578806lfl.253.1623362689248;
 Thu, 10 Jun 2021 15:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <87sg1p30a1.fsf@disp2133>
In-Reply-To: <87sg1p30a1.fsf@disp2133>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 10 Jun 2021 15:04:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
Message-ID: <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     linux-arch <linux-arch@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Tejun Heo <tj@kernel.org>,
        Daniel Jacobowitz <drow@nevyn.them.org>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, Jun 10, 2021 at 1:58 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> The problem is sometimes we read all of the registers from
> a context where they are not all saved.

Ouch. Yes. And this is really painful because none of the *normal*
architectures do this, so it gets absolutely no coverage.

> I think at this point we need to say that the architectures that have a
> do this need to be fixed to at least call do_exit and the kernel
> function in create_io_thread with the deeper stack.

Yeah. We traditionally have that requirement for fork() and friends
too (vfork/clone), so adding exit and io_uring to do so seems like the
most straightforward thing.

But I really wish we had some way to test and trigger this so that we
wouldn't get caught on this before. Something in task_pt_regs() that
catches "this doesn't actually work" and does a WARN_ON_ONCE() on the
affected architectures?

               Linus
