Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49BAC3AA4E2
	for <lists+linux-alpha@lfdr.de>; Wed, 16 Jun 2021 22:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbhFPUDT (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 16 Jun 2021 16:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbhFPUDS (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 16 Jun 2021 16:03:18 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033D1C061760
        for <linux-alpha@vger.kernel.org>; Wed, 16 Jun 2021 13:01:11 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 131so5529661ljj.3
        for <linux-alpha@vger.kernel.org>; Wed, 16 Jun 2021 13:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y0sGanNeM+6nVMH7hMipVVh7kfFvtaj9v71nplXpGOQ=;
        b=W2AITzayliTdBtw+P2eGCat6m1fvimytrfbjpYp3F+ZqA7U78mdL6p9s1QlqYnA0Cu
         HmuuCHptbwVi95FtTdSDCMlLPBnLl9I3IjPOnYExv6QFeCUpcrP5yEPGt2AUEAL6rQRa
         AVA3P5mSOxUsuokFD59yB5+vElkaqAzJ+n8vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y0sGanNeM+6nVMH7hMipVVh7kfFvtaj9v71nplXpGOQ=;
        b=f552oEXvQ5RgeWis4m12lp5FaD3X5JzT0jQBQF/tXa//iJmGNNjXn9roejn8KE7zMN
         0y/LLAfpA2r/VcIjfn2hXvOj4QlMNOporUBETJbm+GB3RyPoP+kSLk7waeun8lRxntic
         fBIwPpeVQSFNt/n9G1TdaTGwkPZFG8Dx9fqnSwK6hbTA0v6PkXYWpQ+jGK1nTmamem6D
         AvVqqVkIqbmf7+LZCB0sq0g2PptFAJmA6Fh0XzHSpsBR/2vbSR3nxP2VW0ZDx6bD2OnA
         DOdZ/r8wspd0F+jBm+rfgxeRufHh2FMZ5sisu1WOZupeEsjdKfV8/LhVroY42G8a8tJI
         yN1g==
X-Gm-Message-State: AOAM530MT6t7olLtRZxceh6i8HXpOO2Ngb8nIi4Ap6SC4BY2wfrHWUg1
        ggPTAnVdVSG1cizE7pnIHkTv2QeOT5/iULVv30w=
X-Google-Smtp-Source: ABdhPJwk9RvxzybZk3lWFXxufX+fSZekVHD4G3vgEFTpUCIcebPokZWs3LOWlvDqdITne4BjwD9A0A==
X-Received: by 2002:a2e:81cb:: with SMTP id s11mr1370740ljg.466.1623873669445;
        Wed, 16 Jun 2021 13:01:09 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id f14sm389474ljk.42.2021.06.16.13.01.09
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 13:01:09 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id a1so6146199lfr.12
        for <linux-alpha@vger.kernel.org>; Wed, 16 Jun 2021 13:01:09 -0700 (PDT)
X-Received: by 2002:a05:6512:3d13:: with SMTP id d19mr1037501lfv.41.1623873668703;
 Wed, 16 Jun 2021 13:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <87sg1p30a1.fsf@disp2133> <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133> <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <87zgvqor7d.fsf_-_@disp2133> <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
 <87mtrpg47k.fsf@disp2133> <87pmwlek8d.fsf_-_@disp2133> <87k0mtek4n.fsf_-_@disp2133>
In-Reply-To: <87k0mtek4n.fsf_-_@disp2133>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 16 Jun 2021 13:00:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiTEZN_3ipf51sh-csdusW4uGzAXq9m1JcMHu_c8OJ+pQ@mail.gmail.com>
Message-ID: <CAHk-=wiTEZN_3ipf51sh-csdusW4uGzAXq9m1JcMHu_c8OJ+pQ@mail.gmail.com>
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

On Wed, Jun 16, 2021 at 11:32 AM Eric W. Biederman
<ebiederm@xmission.com> wrote:
>
> Prevent security holes by recording when all of the registers are
> available so generic code changes do not result in security holes
> on alpha.

Please no, not this way. ldl/stc is extremely expensive on some alpha cpus.

I really think thatTIF_ALLREGS_SAVED bit isn't worth it, except
perhaps for debugging.

And even for debugging, I think it would be both easier and cheaper to
just add a magic word to the entry stack instead.

              Linus
