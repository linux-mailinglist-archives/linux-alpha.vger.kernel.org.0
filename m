Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABB62B29D6
	for <lists+linux-alpha@lfdr.de>; Sat, 14 Nov 2020 01:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgKNAZg (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 13 Nov 2020 19:25:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:34392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725981AbgKNAZg (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 13 Nov 2020 19:25:36 -0500
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A77592224D;
        Sat, 14 Nov 2020 00:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605313535;
        bh=G4wbIA6U5sagP0DSycw0J5zEgOwYyErMorMIAwSJync=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tJGU2tTaLn9JZy+bWM0x4SWs9lj6PBmf/6ZAv+XrsRnBj4Mgf/kaiIX5GJNDk72fd
         k0HiytGrsNE0Q54WcVQ1Wnb544RLgEv9SA/sQdYzV8iJq9Va5QodhRYtWa0pj5/bdl
         xaTzz5flOGYyGiIDKds4p/eQojRay2m2z0UhSva0=
Date:   Fri, 13 Nov 2020 16:25:35 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-alpha@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: [PATCH REPOST] alpha: Replace bogus in_interrupt()
Message-Id: <20201113162535.92435b319c69b435f379ddbe@linux-foundation.org>
In-Reply-To: <20201113135832.2202833-1-bigeasy@linutronix.de>
References: <20201113135832.2202833-1-bigeasy@linutronix.de>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Fri, 13 Nov 2020 14:58:32 +0100 Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> From: Thomas Gleixner <tglx@linutronix.de>
> 
> in_interrupt() is true for a variety of things including bottom half
> disabled regions. Deducing hard interrupt context from it is dubious at
> best.
> 
> Use in_irq() which is true if called in hard interrupt context. Otherwise
> calling irq_exit() would do more harm than good.
> 

Gee, how to test it.  Does anyone run current kernels on alpha?
