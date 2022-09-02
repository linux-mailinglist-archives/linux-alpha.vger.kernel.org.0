Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9015AA723
	for <lists+linux-alpha@lfdr.de>; Fri,  2 Sep 2022 07:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiIBFOh (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 2 Sep 2022 01:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiIBFOg (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Fri, 2 Sep 2022 01:14:36 -0400
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3941B1BB5
        for <linux-alpha@vger.kernel.org>; Thu,  1 Sep 2022 22:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=w6b2UEHLmuGJTTnShaxMkc2M0eiHRzxueLF+Dp5bmzA=; b=nC8pyaelExlI8Ib37Xfc0OeFD2
        awdGLZ0dr0fXWbBJaO8BS7eceWxZ70Tg9qXXhDNFknG872Cck35CpOlRPTRVy3/B/wH4q999sYqWf
        tduo4b2q8MFPBmK5+qpHMTbu+lkJDCOmluxitfDrYuD6XZcD924uCpu1jECFqlo46Un/WcAsTIzsV
        Lx0pT5Zwmceh0XpLU3ed1A3T8Yhhajlkzj1j9qPm/7ApIxHFq9RBuIrmMZU2wvgmTCMIZGrGxGVkN
        y8TZri0IAqD4G1D3NwVlidpRbeGWs4dYMgFssbAru+C3cdYR5tUzJhq4jbjo8T/NC2/UYsIvS6Tdv
        AMClj/xA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat Linux))
        id 1oTz0j-00BE0T-N2;
        Fri, 02 Sep 2022 05:14:33 +0000
Date:   Fri, 2 Sep 2022 06:14:33 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-alpha@vger.kernel.org
Subject: Re: [PATCH v2 7/7] alpha: lazy FPU switching
Message-ID: <YxGROdeUQHG4XPH9@ZenIV>
References: <YxFhB4/cEXX5aHbn@ZenIV>
 <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
 <20220902015012.2664521-7-viro@zeniv.linux.org.uk>
 <CAHk-=wjfCBF_xYtKacU920YFMKNDnesTUy-gYq8qHucLDTWNHQ@mail.gmail.com>
 <YxGPk1dDyCP2AWul@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxGPk1dDyCP2AWul@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Fri, Sep 02, 2022 at 06:07:31AM +0100, Al Viro wrote:

> > With the asm even having a comment about how it only works because
> > alpha doesn't do preemption (ARCH_NO_PREEMPT), but then the C code
> > does do those preempt_disable/enable pairs, and I see an actual bug in
> > there too:
> > 
> > Both alpha_read_fp_reg() and alpha_read_fp_reg_s() do a
> > preempt_enable() -> preempt_enable() pair (ie the first one should be
> > a preempt_disable()).
> 
> Will fix.

	Done and pushed.  IIRC, that started as a similar comment re
"we'd need to disable preemption here if we ever grow one on alpha",
but I ended up looking at it and deciding that it's easier to just
go ahead and call preempt_disable()/preempt_enable() instead
of comments.
