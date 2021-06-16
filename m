Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B07B13AA569
	for <lists+linux-alpha@lfdr.de>; Wed, 16 Jun 2021 22:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbhFPUj5 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 16 Jun 2021 16:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233534AbhFPUj4 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 16 Jun 2021 16:39:56 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8711C061574
        for <linux-alpha@vger.kernel.org>; Wed, 16 Jun 2021 13:37:48 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id p17so6452934lfc.6
        for <linux-alpha@vger.kernel.org>; Wed, 16 Jun 2021 13:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UHEpO/p4mphV1bVFcaFoH3CcTJgorPlChGXXuQ9ZIXY=;
        b=F9u6gy/i0U+gAlXpRnOajPU0M92RhboG967hQIeJJOU/4+90HIPvkNWUdvQBVU9Vo9
         IhP7wBN3MCi7lwz8foxZo/pVTaE4Wpg0DDxRIzOns2pT3toJbU9hUVoesn9RWS+YJBRt
         vLodejI8Bk5yzwI3LFoNUijuDi+QyKzza8/R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UHEpO/p4mphV1bVFcaFoH3CcTJgorPlChGXXuQ9ZIXY=;
        b=ewQoroJ5RmJLrbiVwE/xKGEtuq3S2AKDfPPCha5sj/BbuDUdzt7CG6iA8uq/1Kvdgi
         d4k5CCoVMxZ79kqCEfmTY49zRTlDYU3/TuH5GDSxAJmhPPgCT0R1+7H+NoNnH9E2Frxn
         oqUKJmGKaj13P98sJXopYhnimZp6l+V6HwQi5KLdwi9R1Y+Etu7F8jNeqUSPlXLv4zMc
         BWpOxl8kzz7ssf9NKoURitGUaXuDAWLRi+1HGTQ371obs3HEF4ItXQ3w5SvWPq+9hHY7
         HNPToKLi/sI2I3LmaMVIOtYXKIbvoL/E8cNgC7AyGpxzs0nN34lyZNXHwNw57KA8JrAg
         6kuw==
X-Gm-Message-State: AOAM530C2C8mGea95MgUTsH3jjECFiizDDXQAS8xZdyrdhzGDkOS0O9W
        q+P5A+WB9NRn2JLwBks3gVq/OQr3MO/M6kbSJs0=
X-Google-Smtp-Source: ABdhPJwiS8+CLilMMDkkuN0QYvxoX/zS0p1CHpa8m/iFZRvoxKm49twN+pVziiPFZE0PLCBU3KLv/A==
X-Received: by 2002:a05:6512:472:: with SMTP id x18mr1149280lfd.386.1623875866785;
        Wed, 16 Jun 2021 13:37:46 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id p5sm352669lfg.79.2021.06.16.13.37.45
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 13:37:46 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id x14so5620837ljp.7
        for <linux-alpha@vger.kernel.org>; Wed, 16 Jun 2021 13:37:45 -0700 (PDT)
X-Received: by 2002:a2e:2ac6:: with SMTP id q189mr1436691ljq.61.1623875865511;
 Wed, 16 Jun 2021 13:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <87sg1p30a1.fsf@disp2133> <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133> <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <87zgvqor7d.fsf_-_@disp2133> <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
 <87mtrpg47k.fsf@disp2133> <87pmwlek8d.fsf_-_@disp2133> <87k0mtek4n.fsf_-_@disp2133>
 <CAHk-=wiTEZN_3ipf51sh-csdusW4uGzAXq9m1JcMHu_c8OJ+pQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiTEZN_3ipf51sh-csdusW4uGzAXq9m1JcMHu_c8OJ+pQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 16 Jun 2021 13:37:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=whvNaYffE8Eaa4-jjYbF_r1u1sh5LF5zXFhdEP8hxySMQ@mail.gmail.com>
Message-ID: <CAHk-=whvNaYffE8Eaa4-jjYbF_r1u1sh5LF5zXFhdEP8hxySMQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] alpha/ptrace: Record and handle the absence of switch_stack
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-arch <linux-arch@vger.kernel.org>,
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
        Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Wed, Jun 16, 2021 at 1:00 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And even for debugging, I think it would be both easier and cheaper to
> just add a magic word to the entry stack instead.

IOW, just add a

      unsigned long magic;

to "struct switch_stack", and then make the stack switch code push that value.

That would be cheap enough to be just unconditional, but you could
make it depend on a debug config option too, of course.

It helps if 'xyz' is some constant that is easyish to generate. It
might not be a constant - maybe it could be the address of that
'magic' field itself, so you'd just generate it with

    stq $r,($r)

and it would be equally easy to just validate at lookup for that WARN_ON_ONCE():

    WARN_ON_ONCE(switch_stack->magic != (unsigned long)&switch_stack->magic);

or whatever.

It's for debugging, not security. So it doesn't have to be some kind
of super-great magic number, just something easy to generate and check
(that isn't a common value like "0" that trivially exist on the stack
anyway).

             Linus
