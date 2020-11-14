Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD192B2FC5
	for <lists+linux-alpha@lfdr.de>; Sat, 14 Nov 2020 19:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgKNSjh (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 14 Nov 2020 13:39:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:46884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726070AbgKNSjh (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 14 Nov 2020 13:39:37 -0500
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5F18722254;
        Sat, 14 Nov 2020 18:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605379176;
        bh=gKAwNLWav5Eg7IQnxrKeTRXqeDZpQaBu8bjAgQtXDO0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=1S+inGsCwRDTW3naJurs3oQAW++Ij9XarhAOHrOA2296cVIyD0tCo/xhzqCm0ha5v
         RnVYWXhP3dhXv3tnH/YF29a0uW8UZS7q2KigAtRwpEtQn7qI1p5radW9YSyo7ZlsxC
         tUvHiXL06YQQ7/O9BtuHDBXV3KLlDbeiOaAglq78=
Date:   Sat, 14 Nov 2020 10:39:35 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Serge Belyshev <belyshev@depni.sinp.msu.ru>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-alpha@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: [PATCH REPOST] alpha: Replace bogus in_interrupt()
Message-Id: <20201114103935.6b7d0f55e2cd6dce536d304f@linux-foundation.org>
In-Reply-To: <87o8k0icsr.fsf@depni.sinp.msu.ru>
References: <20201113135832.2202833-1-bigeasy@linutronix.de>
        <20201113162535.92435b319c69b435f379ddbe@linux-foundation.org>
        <87o8k0icsr.fsf@depni.sinp.msu.ru>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sat, 14 Nov 2020 11:05:08 +0300 Serge Belyshev <belyshev@depni.sinp.msu.ru> wrote:

> Andrew Morton <akpm@linux-foundation.org> writes:
> 
> > On Fri, 13 Nov 2020 14:58:32 +0100 Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
> >
> >> From: Thomas Gleixner <tglx@linutronix.de>
> >> 
> >> in_interrupt() is true for a variety of things including bottom half
> >> disabled regions. Deducing hard interrupt context from it is dubious at
> >> best.
> >> 
> >> Use in_irq() which is true if called in hard interrupt context. Otherwise
> >> calling irq_exit() would do more harm than good.
> >> 
> >
> > Gee, how to test it.  Does anyone run current kernels on alpha?
> 
> Hold my beer:
> 
> --- a/arch/alpha/kernel/process.c
> +++ b/arch/alpha/kernel/process.c
> @@ -134,8 +134,10 @@ common_shutdown_1(void *generic_ptr)
>  #ifdef CONFIG_DUMMY_CONSOLE
>                 /* If we've gotten here after SysRq-b, leave interrupt
>                    context before taking over the console. */
> -               if (in_irq())
> +               if (in_irq()) {
> +                       printk ("in_irq(): true\n");
>                         irq_exit();
> +               }
>                 /* This has the effect of resetting the VGA video origin.  */
>                 console_lock();
>                 do_take_over_console(&dummy_con, 0, MAX_NR_CONSOLES-1, 1);
> 
> 
> and then sysrq-b over serial console:
> 
> [   56.531250] sysrq: Resetting
> [   56.531250] in_irq(): true
> [   56.531250] Console: switching to colour dummy device 80x25
> 
> halted CPU 0
> 
> halt code = 5
> HALT instruction executed
> PC = fffffc0000310040
> Resetting I/O buses...
> >>>
> 
> Tested-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>

Thanks ;)

Here, have that beer back - I kept some for you.

