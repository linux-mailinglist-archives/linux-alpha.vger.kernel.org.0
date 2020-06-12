Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF391F7349
	for <lists+linux-alpha@lfdr.de>; Fri, 12 Jun 2020 07:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgFLFHI (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 12 Jun 2020 01:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgFLFHH (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 12 Jun 2020 01:07:07 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC4AC03E96F
        for <linux-alpha@vger.kernel.org>; Thu, 11 Jun 2020 22:07:07 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id s10so3602749pgm.0
        for <linux-alpha@vger.kernel.org>; Thu, 11 Jun 2020 22:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E/c/tVNZnZXtqPcvM/cRJXYwg6T3yZDLqtUKUDRTdt4=;
        b=O6iMlj7M7cPlzLPmVV55ccyxdmoDkLHEjx9YGi+rTx/SuEeA8L0Kjs9Ne+dGwMTwbq
         rc2ZpA3N/oYNyMbp1V99/7JChJws0nqKJfN0shrkRwbPVuIUABRpkiMLhLyjJLxaGdmP
         ovUHtZjYkmhLf2+ypJUlrY0Jy3jRXFdlAQ+h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E/c/tVNZnZXtqPcvM/cRJXYwg6T3yZDLqtUKUDRTdt4=;
        b=R3rJGniNhwu+DyOAa2No05LmeEFqZ4YlepWCgl69mbHMLL9lJPmDXl/+51YfxlrNNH
         icmOxsGQqb7kof63zEg0Cc/muHwAi/0FgTdXObCn5JNkhve4pxNU3rhP/3kDywjtstxa
         IBqpia+woCFuOp+LkG+axK782oCqHHBh72o/eyLPrsiipLSyQU2zSA6Xi8c8ubT0g3TH
         B7MWplGPEjzp58q5gA8DnqT+scXyEvEwgJ+pmupqqtOqsdUIOg5QrTrOaCW7OMFSbVBf
         0enZlgvGSaMNhwdsrXX9+kfpOTb2hHGcQVSWzDpAjulGun3EU4lYL0Ab6urYwXBYDG67
         35cA==
X-Gm-Message-State: AOAM5300RX6xF2718aiOvaQHA0Yu3rI13QC7eCEgSl0WgsG0je/imARp
        l63GEOvzWqju2q8xcqBTs5t8lw==
X-Google-Smtp-Source: ABdhPJyFBSPyYUPRAZIz7sEMo6uAmEjOuign7oI0Sc1zUD3PayBJbV8oAMHdaVR5RPSIOnhngmXDQg==
X-Received: by 2002:a65:6883:: with SMTP id e3mr9569317pgt.5.1591938427251;
        Thu, 11 Jun 2020 22:07:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x126sm4664416pfc.36.2020.06.11.22.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 22:07:06 -0700 (PDT)
Date:   Thu, 11 Jun 2020 22:07:05 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Michael Cree <mcree@orcon.net.nz>,
        Matt Turner <mattst88@gmail.com>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-alpha <linux-alpha@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: Regression bisected to f2f84b05e02b (bug: consolidate
 warn_slowpath_fmt() usage)
Message-ID: <202006112201.3B20AB28DC@keescook>
References: <20200602024804.GA3776630@p50-ethernet.mattst88.com>
 <202006021052.E52618F@keescook>
 <CAEdQ38F2GP92xB2gMXTrEo-Adbbc9Cy1DWHU9yveGLzJNd2HrA@mail.gmail.com>
 <20200612044757.GA10703@tower>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612044757.GA10703@tower>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Fri, Jun 12, 2020 at 04:47:57PM +1200, Michael Cree wrote:
> On Thu, Jun 11, 2020 at 09:23:52PM -0700, Matt Turner wrote:
> > Since I noticed earlier that using maxcpus=1 on a 2-CPU system
> > prevented the system from hanging, I tried disabling CONFIG_SMP on my
> > 1-CPU system as well. In doing so, I discovered that the RCU torture
> > module (RCU_TORTURE_TEST) triggers some null pointer dereferences on
> > Alpha when CONFIG_SMP is set, but works successfully when CONFIG_SMP
> > is unset.
> > 
> > That seems likely to be a symptom of the same underlying problem that
> > started this thread, don't you think? If so, I'll focus my attention
> > on that.
> 
> I wonder if that is related to user space segfaults we are now seeing
> on SMP systems but not UP systems while building Alpha debian-ports.
> It's happening in the test-suites of builds of certain software
> (such as autogen and guile) but they always build successfully with
> the test suite passing on a UP system.
> 
> When investigating I seem to recall it was a NULL (or near NULL)
> pointer dereference but couldn't make any sense of how it might
> have got into such an obviously wrong state.

By some miracle, I have avoided any experience with RCU bugs. ;) If
the RCU_TORTURE_TEST Oopses or the segfaults are repeatable and don't
go away with the WARN patch reverted, then perhaps it might be used to
bisect to something closer to the root cause?

Given the similarity to the SMP vs UP stuff and the RCU tests, I'd agree
that does seem like the best path to investigate.

-- 
Kees Cook
