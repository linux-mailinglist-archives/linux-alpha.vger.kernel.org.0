Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69DDC4F21D0
	for <lists+linux-alpha@lfdr.de>; Tue,  5 Apr 2022 06:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiDECk0 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 4 Apr 2022 22:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiDECkS (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Mon, 4 Apr 2022 22:40:18 -0400
Received: from gherkin.frus.com (cpe-67-11-228-40.satx.res.rr.com [67.11.228.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 753D1294A3C
        for <linux-alpha@vger.kernel.org>; Mon,  4 Apr 2022 18:42:39 -0700 (PDT)
Received: by gherkin.frus.com (Postfix, from userid 500)
        id 10FFA61CD4; Mon,  4 Apr 2022 20:42:38 -0500 (CDT)
Date:   Mon, 4 Apr 2022 20:42:38 -0500
From:   Bob Tracy <rct@frus.com>
To:     Michael Cree <mcree@orcon.net.nz>, debian-alpha@lists.debian.org,
        linux-alpha@vger.kernel.org
Subject: Re: 5.17.0 boot issue on Miata
Message-ID: <YkuejknyPDJoQEDC@gherkin.frus.com>
References: <Yj0u150JJpsb9nj4@gherkin.frus.com>
 <20220326222157.GA13650@tower>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220326222157.GA13650@tower>
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_00,PDS_RDNS_DYNAMIC_FP,
        RCVD_IN_PBL,RCVD_IN_SORBS_DUL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sun, Mar 27, 2022 at 11:21:57AM +1300, Michael Cree wrote:
> On Thu, Mar 24, 2022 at 09:54:15PM -0500, Bob Tracy wrote:
> > When I attempt to boot a 5.17.0 kernel built from the kernel.org
> > sources, I see disk sector errors on my "sda" device, and the boot
> > process hangs at the point where "systemd-udevd.service" starts.
> > 
> > Rebooting on 5.16.0 works with no disk I/O errors of any kind.
> 
> Oh, you can run a 5.16.y kernel on Alpha?  I have had problems
> with everything since 5.9.y with rare, random, corruptions in
> memory in user space (exhibiting as glibc detected memory
> corruptions or segfaults).

Did we have this painted into the "SMP vs. not-SMP" corner at one point?
Miata is an automatic not-SMP case for hand-built kernels for that
architecture, which might explain why I'm not seeing the problems with
user space memory corruption.

Just successfully booted on v5.17-rc1 a little while ago.  Moving on to
"-rc2".

--Bob
