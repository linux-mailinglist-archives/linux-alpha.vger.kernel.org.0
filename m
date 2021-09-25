Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4FC4183FD
	for <lists+linux-alpha@lfdr.de>; Sat, 25 Sep 2021 20:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbhIYScx (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 25 Sep 2021 14:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbhIYScw (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 25 Sep 2021 14:32:52 -0400
Received: from wp441.webpack.hosteurope.de (wp441.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:85d2::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EA4C061570
        for <linux-alpha@vger.kernel.org>; Sat, 25 Sep 2021 11:31:17 -0700 (PDT)
Received: from [2a03:7846:b79f:101:21c:c4ff:fe1f:fd93] (helo=valdese.nms.ulrich-teichert.org); authenticated
        by wp441.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1mUCSA-0002et-3e; Sat, 25 Sep 2021 20:31:14 +0200
Received: from valdese.nms.ulrich-teichert.org (localhost [127.0.0.1])
        by valdese.nms.ulrich-teichert.org (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPS id 18PIVDn8004392
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 25 Sep 2021 20:31:13 +0200
Received: (from ut@localhost)
        by valdese.nms.ulrich-teichert.org (8.15.2/8.15.2/Submit) id 18PIVAD8004391;
        Sat, 25 Sep 2021 20:31:11 +0200
Message-Id: <202109251831.18PIVAD8004391@valdese.nms.ulrich-teichert.org>
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and use absolute_pointer macro)
To:     linux-alpha@vger.kernel.org (Linux Alpha)
Date:   Sat, 25 Sep 2021 20:31:10 +0200 (CEST)
Cc:     torvalds@linux-foundation.org (Linus Torvalds), mattst88@gmail.com,
        rth@twiddle.net, ink@jurassic.park.msu.ru
In-Reply-To: <no.id>
From:   Ulrich Teichert <krypton@ulrich-teichert.org>
X-Mailer: ELM [version 2.5 PL8]
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;ut@ulrich-teichert.org;1632594677;7c53a866;
X-HE-SMSGID: 1mUCSA-0002et-3e
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hi,

> I'll try booting from CDROM with a serial line attached at the weekend,
> perhaps that will give us a hint.

[You can call the Alpha a dead architecture and the Jensen and antiquated
machine, but there are features which modern PCs *still* don't have,
like the automatic switch over to the serial line console when no keyboard
is connected. I'm still impressed how well that works.]

Well...whatever that means, but you can call it a hint. Booting from
CD-ROM stopps with:

>>> boot dka500 -fl i
INIT-S-CPU...
AUDIT_BOOT_STARTS ... 
AUDIT_CHECKSUM_GOOD
AUDIT_LOAD_BEGINS
AUDIT_LOAD_DONE

Linux/AXP bootloader for Linux 5.15.0-rc2-00045-gcf1d2c3e7e2f-dirty
Switching to OSF PAL-code .. Ok (rev 20123)
Loading vmlinux ...Failed (200000000067a000)

?05 HLT INSTR
  PC= 00000000.20000014 PSL= 00000000.00000007

Anyone an idea what 200000000067a000 may mean in this context?

TIA,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, The Bellrays: Bad Reaction
