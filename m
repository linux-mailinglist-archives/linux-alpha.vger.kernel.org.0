Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03BE1BC4A6
	for <lists+linux-alpha@lfdr.de>; Tue, 24 Sep 2019 11:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387879AbfIXJSS (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 24 Sep 2019 05:18:18 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43950 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727531AbfIXJSR (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 24 Sep 2019 05:18:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=YSjhyC1lKRB8fubVQEKHM7jmo9vsi65UYntnwYqseFQ=; b=EU4LTSeTtqxV9VDJrpZZt3ruH
        RnUeZYjlATkQ+o+C5+ROiZN27BBCfJWvlJpGuODkYxVTtV62XtX5u+/TfEtKgPtYuC1803wzuLpmo
        2NRs9TVIz3ep1Zn+JQmSdFozMjFEhHRxbvq6pJ8YgKJQi1fnRNB5AVgendjVY4EWEXJowjIdPUNCR
        WZaGzFSLI4kXTXE7qfdf1cSuSQDZmjTppV6oJ3/si42aaiLKltB1HLzzHaiUrFMFRHaV79PqFrXdK
        IIp4fjZa25loT69yYYRij/2g28K/hwTv9jO6JUBcBR5pKvlor6U9wf3iG2lizQwQog4BTjN5YHPBa
        CXn6Y9B3w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iCgwi-0007gZ-I9; Tue, 24 Sep 2019 09:17:20 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 61313305E35;
        Tue, 24 Sep 2019 11:16:29 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id E73F720D80D41; Tue, 24 Sep 2019 11:17:14 +0200 (CEST)
Date:   Tue, 24 Sep 2019 11:17:14 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Michal Hocko <mhocko@kernel.org>
Cc:     Yunsheng Lin <linyunsheng@huawei.com>, catalin.marinas@arm.com,
        will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net,
        ink@jurassic.park.msu.ru, mattst88@gmail.com,
        benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
        heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        borntraeger@de.ibm.com, ysato@users.sourceforge.jp,
        dalias@libc.org, davem@davemloft.net, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com,
        chenhc@lemote.com, akpm@linux-foundation.org, rppt@linux.ibm.com,
        anshuman.khandual@arm.com, tglx@linutronix.de, cai@lca.pw,
        robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org,
        dave.hansen@linux.intel.com, luto@kernel.org, len.brown@intel.com,
        axboe@kernel.dk, dledford@redhat.com, jeffrey.t.kirsher@intel.com,
        linux-alpha@vger.kernel.org, naveen.n.rao@linux.vnet.ibm.com,
        mwb@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, tbogendoerfer@suse.de,
        linux-mips@vger.kernel.org, rafael@kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190924091714.GJ2369@hirez.programming.kicks-ass.net>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
 <20190923151519.GE2369@hirez.programming.kicks-ass.net>
 <20190923152856.GB17206@dhcp22.suse.cz>
 <20190923154852.GG2369@hirez.programming.kicks-ass.net>
 <20190923165235.GD17206@dhcp22.suse.cz>
 <20190923203410.GI2369@hirez.programming.kicks-ass.net>
 <20190924074751.GB23050@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924074751.GB23050@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, Sep 24, 2019 at 09:47:51AM +0200, Michal Hocko wrote:
> On Mon 23-09-19 22:34:10, Peter Zijlstra wrote:
> > On Mon, Sep 23, 2019 at 06:52:35PM +0200, Michal Hocko wrote:
> [...]
> > > I even the
> > > ACPI standard is considering this optional. Yunsheng Lin has referred to
> > > the specific part of the standard in one of the earlier discussions.
> > > Trying to guess the node affinity is worse than providing all CPUs IMHO.
> > 
> > I'm saying the ACPI standard is wrong.
> 
> Even if you were right on this the reality is that a HW is likely to
> follow that standard and we cannot rule out NUMA_NO_NODE being
> specified. As of now we would access beyond the defined array and that
> is clearly a bug.

Right, because the device node is wrong, so we fix _that_!

> Let's assume that this is really a bug for a moment. What are you going
> to do about that? BUG_ON? I do not really see any solution besides to either
> provide something sensible or BUG_ON. If you are worried about a
> conditional then this should be pretty easy to solve by starting the
> array at -1 index and associate it with the online cpu mask.

The same thing I proposed earlier; force the device node to 0 (or any
other convenient random valid value) and issue a FW_BUG message to the
console.

