Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61BAA5AA721
	for <lists+linux-alpha@lfdr.de>; Fri,  2 Sep 2022 07:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbiIBFHf (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 2 Sep 2022 01:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232787AbiIBFHe (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Fri, 2 Sep 2022 01:07:34 -0400
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 853AEB6560
        for <linux-alpha@vger.kernel.org>; Thu,  1 Sep 2022 22:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=IrxLyUCuHVYdeXyhz9uZok3MAQ43QAdmpIFfIgB32j8=; b=Gzvq9R8M/AyAHeWk2Exrjb5fOd
        k0Qe0cuN3KGJGvCwPLH8fDglxSEFFPiDjFEYMJJrxIgmFQzoZkprFOomn1juaXx/AdpcLmcp7KdIg
        iot4JG4N+t1ll9r+f0TiImosttwmcxGlLKN7Ly533KF1xVmAnZqwf9KA5eFHugiNzlPRCCDnJAxDs
        bD4rzCrpAHS6u0oNdSAhjGHkjZVgBEViEKAjutj0t16cyFb74YJwc7mJ6a20w2GvFPVJu4hdy6CEu
        QyjxkeqGZkJU5HiZspPmlgP6P2w4VkRz11kO5ttsiqD+9zcIryvKSgLfqwvv2ZftnPDGwa2juCaDr
        h+0uja4g==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat Linux))
        id 1oTytv-00BDxN-Fj;
        Fri, 02 Sep 2022 05:07:31 +0000
Date:   Fri, 2 Sep 2022 06:07:31 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-alpha@vger.kernel.org
Subject: Re: [PATCH v2 7/7] alpha: lazy FPU switching
Message-ID: <YxGPk1dDyCP2AWul@ZenIV>
References: <YxFhB4/cEXX5aHbn@ZenIV>
 <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
 <20220902015012.2664521-7-viro@zeniv.linux.org.uk>
 <CAHk-=wjfCBF_xYtKacU920YFMKNDnesTUy-gYq8qHucLDTWNHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjfCBF_xYtKacU920YFMKNDnesTUy-gYq8qHucLDTWNHQ@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, Sep 01, 2022 at 09:24:52PM -0700, Linus Torvalds wrote:
> On Thu, Sep 1, 2022 at 6:50 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> >         On each context switch we save the FPU registers on stack
> > of old process and restore FPU registers from the stack of new one.
> > That allows us to avoid doing that each time we enter/leave the
> > kernel mode; however, that can get suboptimal in some cases.
> 
> Do we really care, for what is effectively a dead architecture?

Umm...  To an extent we do - remember the fun bugs Eric had caught
wrt kernel threads that end up running with unusual stack layout?
That's where this series had come from - alpha is the worst offender
in that respect; it has batshit crazy amount of extras on top of
pt_regs and while the rest of that stuff could be dealt with, the
full set of FP registers is well beyond anything we could reasonably
save on each syscall entry.  And that also happens to be a killer
for ever switching to generic syscall glue.

So I wanted to see if such stuff could be dealt with; alpha FPU registers
were the worst example in the entire tree...
 
> This patch feels like something that might have made sense 25 years
> ago. Does it make sense today?
> 
> I guess I don't care (for the same reason), but just how much testing
> has this gotten, and what subtle bugs might this have?

Umm... kernel builds, libc builds (and self-tests), xfstests (qemu only;
sorry, but doing that on DS10 with IDE disk is just fucking awful).  Debian
updates, to an extent...
 
> With the asm even having a comment about how it only works because
> alpha doesn't do preemption (ARCH_NO_PREEMPT), but then the C code
> does do those preempt_disable/enable pairs, and I see an actual bug in
> there too:
> 
> Both alpha_read_fp_reg() and alpha_read_fp_reg_s() do a
> preempt_enable() -> preempt_enable() pair (ie the first one should be
> a preempt_disable()).

Will fix.

> Does that bug matter? No. ARCH_NO_PREEMPT means that it's all no-ops
> anyway. But it's wrong and I think shows the status of this patch -
> well-meaning, but maybe not really fully thought out.

Any review would obviously be welcome.  Again, as far as I'm concerned,
it's more of figuring out how painful does that kind of work end up
being.

Beginning of the series is a different story (and a good example of the
reasons for taking as much as possible out of asm glue into generic
C helpers - look at the first patch and note that TIF_NOTIFY_SIGNAL
is going to grow more uses in generic kernel).  TBH, I'm really sick
and tired of crawling through asm glue every year or so and coming
up with new piles of fun bugs ;-/  And it's not as if it had only
affected dead and stillborn architectures - riscv development is quite
alive...
