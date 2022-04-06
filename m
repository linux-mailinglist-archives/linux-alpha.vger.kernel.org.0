Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 783584F6DF0
	for <lists+linux-alpha@lfdr.de>; Thu,  7 Apr 2022 00:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234522AbiDFWqD (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 6 Apr 2022 18:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237179AbiDFWqC (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Wed, 6 Apr 2022 18:46:02 -0400
Received: from gherkin.frus.com (cpe-67-11-228-40.satx.res.rr.com [67.11.228.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E0DA3194FFF
        for <linux-alpha@vger.kernel.org>; Wed,  6 Apr 2022 15:44:03 -0700 (PDT)
Received: by gherkin.frus.com (Postfix, from userid 500)
        id 8E3D161CD4; Wed,  6 Apr 2022 17:44:01 -0500 (CDT)
Date:   Wed, 6 Apr 2022 17:44:01 -0500
From:   Bob Tracy <rct@frus.com>
To:     Helge Deller <deller@gmx.de>
Cc:     Michael Cree <mcree@orcon.net.nz>, debian-alpha@lists.debian.org,
        linux-alpha@vger.kernel.org
Subject: Re: 5.17.0 boot issue on Miata
Message-ID: <Yk4XsdHvjrLqN1LR@gherkin.frus.com>
References: <Yj0u150JJpsb9nj4@gherkin.frus.com>
 <20220326222157.GA13650@tower>
 <YkuejknyPDJoQEDC@gherkin.frus.com>
 <20220405050125.GA25969@tower>
 <YkxKRElYUhMgOOCN@gherkin.frus.com>
 <10d61d8f-edfc-fc39-0936-233692464dbd@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10d61d8f-edfc-fc39-0936-233692464dbd@gmx.de>
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_00,PDS_RDNS_DYNAMIC_FP,
        RCVD_IN_PBL,RCVD_IN_SORBS_DUL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, Apr 05, 2022 at 08:22:48PM +0200, Helge Deller wrote:
> You don't need to enable it, but for alpha it's probably beneficial to enable it.
> When enabled, you will see a big speed improvement when logging in to a graphics text
> console and printing info.  E.g. try "time dmesg" with and without that option...
> The "dmesg" will scroll the screen, and that's what it accelerates (only if the driver
> has such hardware bitblt-support).

v5.17-rc2 ok.  v5.17-rc3 I get the disk sector errors and hang that I
reported in the first message in this thread.

(Unrelated, I *did* enable the framebuffer option, and that part of the
boot worked just fine.)

I'm going to try a native build of '-rc3' just to rule out any
cross-compiler strangeness.  Should have something to report in another
34 hours or so :-(.

--Bob
