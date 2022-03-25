Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8420D4E6CD3
	for <lists+linux-alpha@lfdr.de>; Fri, 25 Mar 2022 04:22:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343898AbiCYDYL (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 24 Mar 2022 23:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbiCYDYJ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 24 Mar 2022 23:24:09 -0400
X-Greylist: delayed 1698 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 24 Mar 2022 20:22:36 PDT
Received: from gherkin.frus.com (cpe-67-11-228-40.satx.res.rr.com [67.11.228.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8B5B919C09
        for <linux-alpha@vger.kernel.org>; Thu, 24 Mar 2022 20:22:36 -0700 (PDT)
Received: by gherkin.frus.com (Postfix, from userid 500)
        id 9608B61CD3; Thu, 24 Mar 2022 21:54:15 -0500 (CDT)
Date:   Thu, 24 Mar 2022 21:54:15 -0500
From:   Bob Tracy <rct@frus.com>
To:     debian-alpha@lists.debian.org
Cc:     mcree@orcon.net.nz, linux-alpha@vger.kernel.org
Subject: 5.17.0 boot issue on Miata
Message-ID: <Yj0u150JJpsb9nj4@gherkin.frus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_20,RCVD_IN_PBL,
        RCVD_IN_SORBS_DUL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

When I attempt to boot a 5.17.0 kernel built from the kernel.org
sources, I see disk sector errors on my "sda" device, and the boot
process hangs at the point where "systemd-udevd.service" starts.

Rebooting on 5.16.0 works with no disk I/O errors of any kind.

Assuming the 5.17.0 kernel or its associated initrd had bad sectors, I
rebuilt both and saw no I/O errors during the build nor afterward when
copying the new kernel into place under "/boot".

Even tried a cross-compile build of a 5.17.0 alpha kernel on my x86_64
platform to save build time (34 hours for a native build on a PWS 433au
vs. 2 hours on the x86_64 platform).  That build produced identical
results when I tried booting on it.

If anyone else is seeing this and can get a head-start on bisecting,
that would be very much appreciated.  I won't be able to get to it for
about a week and a half :-(.  5.16.0 works.  5.17.0 doesn't.  Might get
lucky and find that the offending changes happened in the first 5.17.0
release candidate.

As always, sincere thanks in advance.

--Bob
