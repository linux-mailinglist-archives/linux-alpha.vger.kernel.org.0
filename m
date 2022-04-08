Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25B054F9648
	for <lists+linux-alpha@lfdr.de>; Fri,  8 Apr 2022 15:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232562AbiDHNEh (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 8 Apr 2022 09:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232621AbiDHNEg (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Fri, 8 Apr 2022 09:04:36 -0400
Received: from gherkin.frus.com (cpe-67-11-228-40.satx.res.rr.com [67.11.228.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5BAC6100745
        for <linux-alpha@vger.kernel.org>; Fri,  8 Apr 2022 06:02:30 -0700 (PDT)
Received: by gherkin.frus.com (Postfix, from userid 500)
        id 73D7A61DAD; Fri,  8 Apr 2022 08:02:29 -0500 (CDT)
Date:   Fri, 8 Apr 2022 08:02:29 -0500
From:   Bob Tracy <rct@frus.com>
To:     debian-alpha@lists.debian.org
Cc:     Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org
Subject: Re: 5.17.0 boot issue on Miata
Message-ID: <YlAyZdZ6afL58Ege@gherkin.frus.com>
References: <Yj0u150JJpsb9nj4@gherkin.frus.com>
 <20220326222157.GA13650@tower>
 <YkuejknyPDJoQEDC@gherkin.frus.com>
 <20220405050125.GA25969@tower>
 <YkxKRElYUhMgOOCN@gherkin.frus.com>
 <10d61d8f-edfc-fc39-0936-233692464dbd@gmx.de>
 <Yk4XsdHvjrLqN1LR@gherkin.frus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yk4XsdHvjrLqN1LR@gherkin.frus.com>
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_00,PDS_RDNS_DYNAMIC_FP,
        RCVD_IN_PBL,RCVD_IN_SORBS_DUL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Wed, Apr 06, 2022 at 05:44:01PM -0500, Bob Tracy wrote:
> v5.17-rc2 ok.  v5.17-rc3 I get the disk sector errors and hang that I
> reported in the first message in this thread.
> 
> I'm going to try a native build of '-rc3' just to rule out any
> cross-compiler strangeness.  Should have something to report in another
> 34 hours or so :-(.

Confirmed: the native build was just as broken as the cross build.  The bug
was introduced somewhere between v5.17-rc2 and v5.17-rc3.  But at least I
have a bit more confidence in the integrity of what the cross tools build.

Interesting aside: the cross build's vmlinux.gz was approx. 200k larger.
That might be due to gcc version differences (native toolchain is 11.2,
and the cross toolchain is 11.1).

I'll start the actual bisection process today.  If I don't finish today,
it will be at least another week before I can get back to this, so
apologies in advance.

--Bob
