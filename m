Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9874E1DF809
	for <lists+linux-alpha@lfdr.de>; Sat, 23 May 2020 17:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731298AbgEWPe7 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 23 May 2020 11:34:59 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24246 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728296AbgEWPe7 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 23 May 2020 11:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590248097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bDxZxuV7E3rZneUhWoOgRhvyhVH3uErtZvr2qHpWXrw=;
        b=iVHvkejS2P0jU/3v502+/x9OY5X2MfXrZF87FIgJQxT39RdjaTblGCmNrywnPR7XtZa8yP
        Ic9PHCnVQE89nMl4/sYErS0xL+oL989xm/2c+e8eAt4ZflkZKntu+fV4ftnSCwnbiPfp4w
        SI/5FTPFCiNft/Dtyh2KLkzWMCAnyMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-dLeZACSlM32ge6dDEpitwg-1; Sat, 23 May 2020 11:34:55 -0400
X-MC-Unique: dLeZACSlM32ge6dDEpitwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87CBC1005512;
        Sat, 23 May 2020 15:34:53 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 300EA60BE2;
        Sat, 23 May 2020 15:34:52 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 04NFYqUL011428;
        Sat, 23 May 2020 11:34:52 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 04NFYoVU011424;
        Sat, 23 May 2020 11:34:50 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Sat, 23 May 2020 11:34:50 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Ivan Kokshaysky <ink@jurassic.park.msu.ru>
cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4] alpha: fix memory barriers so that they conform to
 the specification
In-Reply-To: <20200523151027.GA10128@mail.rc.ru>
Message-ID: <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
 <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org> <20200513144128.GA16995@mail.rc.ru>
 <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com>
 <20200523151027.GA10128@mail.rc.ru>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org



On Sat, 23 May 2020, Ivan Kokshaysky wrote:

> On Sat, May 23, 2020 at 06:26:54AM -0400, Mikulas Patocka wrote:
> > The commits cd0e00c10672 and 92d7223a7423 broke boot on the Alpha Avanti
> > platform. The patches move memory barriers after a write before the write.
> > The result is that if there's iowrite followed by ioread, there is no
> > barrier between them.
> > 
> > The Alpha architecture allows reordering of the accesses to the I/O space,
> > and the missing barrier between write and read causes hang with serial
> > port and real time clock.
> > 
> > This patch makes barriers confiorm to the specification.
> > 
> > 1. We add mb() before readX_relaxed and writeX_relaxed -
> >    memory-barriers.txt claims that these functions must be ordered w.r.t.
> >    each other. Alpha doesn't order them, so we need an explicit barrier.
> > 2. We add mb() before reads from the I/O space - so that if there's a
> >    write followed by a read, there should be a barrier between them.
> 
> You missed the second mb() in extern inline u16 readw(). Otherwise,
> 
> Acked-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>

... and I also broke the *_relaxed macros and didn't notice it, because 
they are unused in my config. This won't compile, because mb() is a 
statement, not a function.

> > +#define readb_relaxed(addr)        (mb(), __raw_readb(addr))

I'll send a new version of the patch.

Mikulas

