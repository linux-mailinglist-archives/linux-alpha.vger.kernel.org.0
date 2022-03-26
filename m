Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA274E849B
	for <lists+linux-alpha@lfdr.de>; Sat, 26 Mar 2022 23:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbiCZW6t (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 26 Mar 2022 18:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiCZW6s (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 26 Mar 2022 18:58:48 -0400
X-Greylist: delayed 2099 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 26 Mar 2022 15:57:10 PDT
Received: from smtp-4.orcon.net.nz (smtp-4.orcon.net.nz [60.234.4.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27443BBE8
        for <linux-alpha@vger.kernel.org>; Sat, 26 Mar 2022 15:57:10 -0700 (PDT)
Received: from [121.99.247.178] (port=59312 helo=tower)
        by smtp-4.orcon.net.nz with esmtpa (Exim 4.90_1)
        (envelope-from <mcree@orcon.net.nz>)
        id 1nYEnM-0000QM-9i; Sun, 27 Mar 2022 11:22:04 +1300
Date:   Sun, 27 Mar 2022 11:21:57 +1300
From:   Michael Cree <mcree@orcon.net.nz>
To:     Bob Tracy <rct@frus.com>
Cc:     debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
Subject: Re: 5.17.0 boot issue on Miata
Message-ID: <20220326222157.GA13650@tower>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
        Bob Tracy <rct@frus.com>, debian-alpha@lists.debian.org,
        linux-alpha@vger.kernel.org
References: <Yj0u150JJpsb9nj4@gherkin.frus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yj0u150JJpsb9nj4@gherkin.frus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, Mar 24, 2022 at 09:54:15PM -0500, Bob Tracy wrote:
> When I attempt to boot a 5.17.0 kernel built from the kernel.org
> sources, I see disk sector errors on my "sda" device, and the boot
> process hangs at the point where "systemd-udevd.service" starts.
> 
> Rebooting on 5.16.0 works with no disk I/O errors of any kind.

Oh, you can run a 5.16.y kernel on Alpha?  I have had problems
with everything since 5.9.y with rare, random, corruptions in
memory in user space (exhibiting as glibc detected memory
corruptions or segfaults).

This is why I am still running a 5.8.y kernel on the Debian
Ports buildd.

I just compiled up a 5.16.y kernel and the problem is still there.
It did take a bit to trigger the bug (about 10 hours of testing
before it happened).

I had done a bisection between 5.8.0 and 5.9.0 last year but I
think it went astray (as testing is difficult and not fool proof).
You email has prompted me to go back to it and see if I can nail
down the offending commit.  We really want to get it fixed.

Cheers,
Michael.
