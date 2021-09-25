Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEFDF418412
	for <lists+linux-alpha@lfdr.de>; Sat, 25 Sep 2021 21:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhIYTJL (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 25 Sep 2021 15:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhIYTJL (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 25 Sep 2021 15:09:11 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D527C061570
        for <linux-alpha@vger.kernel.org>; Sat, 25 Sep 2021 12:07:36 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t10so55786291lfd.8
        for <linux-alpha@vger.kernel.org>; Sat, 25 Sep 2021 12:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XsW8W77uk1stibLZy1i0WuwqlVgYv+eU53F9QoWyYCo=;
        b=bC5ZIfglTQX/fqeYMrs58FzUn1tSkdAcfdliUN+zIbY5oh0F8hJ8N/i+pH58mVeabF
         m0qLCzUCuKBE3dwyd4ZEe4Rrq3GLOvS5/PaNhP3szisu/eBsBZWZ7KapWZHEgz8RVRDt
         cmaOzvngk/O7/hWG6lE7p20exnYGHn/GUJXcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XsW8W77uk1stibLZy1i0WuwqlVgYv+eU53F9QoWyYCo=;
        b=7hyTy2FbKMhi7GWPx2unoT1SNvBJBKl0fEfD1jZ6EDvixSAdt3hRfQUJRIw0MrpT7A
         CZKf7lZmgIVbr2lD7IMvCnrpA+0M9j4xTnzP+Oiv+l3QvwAY/aoc+I+t18aoOCVI8wDo
         NMFWY+K0CWRWiCTuCcnzdKc3rP8voKBAhXKhULjI0JPMWdAWevZSyOdCBhm6sNYde40G
         HHQBiQXaR2y9/dUbUNZIyOkV9NBN+4FhM0hasQJUj4wJ9505uOeax6h35cMS/kRrtqFx
         NUkY5eU1mKkqZ/7u4gBCPV7U12RBgxu49lYzd0vrZnBh62mq5t9xMhaPE6Di4Wts301a
         wUsw==
X-Gm-Message-State: AOAM530amQ6+ReHwQDFqoIkEZAEBEtbJlrDvOFRJgmT4FWBstmNPtYoD
        dneNwF4vi2vbMOkzj5g31DftVF969CQZv1Bn
X-Google-Smtp-Source: ABdhPJyZQcm1ojuTis1hwoSIbO+bB1oj8Tj8S75fJWZPyD93rXZoHrHhGIqDWaVX0KatIT05R7Tidw==
X-Received: by 2002:a05:6512:224b:: with SMTP id i11mr15479315lfu.281.1632596854235;
        Sat, 25 Sep 2021 12:07:34 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id q2sm1100702lfo.174.2021.09.25.12.07.33
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Sep 2021 12:07:33 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id u18so54394963lfd.12
        for <linux-alpha@vger.kernel.org>; Sat, 25 Sep 2021 12:07:33 -0700 (PDT)
X-Received: by 2002:a05:6512:984:: with SMTP id w4mr14773734lft.141.1632596853515;
 Sat, 25 Sep 2021 12:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk> <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
 <20210925025548.1694143-7-viro@zeniv.linux.org.uk>
In-Reply-To: <20210925025548.1694143-7-viro@zeniv.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 25 Sep 2021 12:07:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com>
Message-ID: <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com>
Subject: Re: [PATCH 7/7] alpha: lazy FPU switching
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     alpha <linux-alpha@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Fri, Sep 24, 2021 at 7:55 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>         On each context switch we save the FPU registers on stack
> of old process and restore FPU registers from the stack of new one.
> That allows us to avoid doing that each time we enter/leave the
> kernel mode; however, that can get suboptimal in some cases.

Do you actually have a system or virtual image to test this all out on?

I'm not saying this doesn't look like an improvement, I'm more
questioning whether it's worth it...

          Linus
