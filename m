Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E5C418A4B
	for <lists+linux-alpha@lfdr.de>; Sun, 26 Sep 2021 19:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhIZRO0 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 26 Sep 2021 13:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbhIZROZ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sun, 26 Sep 2021 13:14:25 -0400
Received: from wp441.webpack.hosteurope.de (wp441.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:85d2::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 605EFC061570
        for <linux-alpha@vger.kernel.org>; Sun, 26 Sep 2021 10:12:49 -0700 (PDT)
Received: from [2a03:7846:b79f:101:21c:c4ff:fe1f:fd93] (helo=valdese.nms.ulrich-teichert.org); authenticated
        by wp441.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1mUXhm-0007gf-6S; Sun, 26 Sep 2021 19:12:46 +0200
Received: from valdese.nms.ulrich-teichert.org (localhost [127.0.0.1])
        by valdese.nms.ulrich-teichert.org (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPS id 18QHCjSb023401
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 26 Sep 2021 19:12:45 +0200
Received: (from ut@localhost)
        by valdese.nms.ulrich-teichert.org (8.15.2/8.15.2/Submit) id 18QHCj8L023400;
        Sun, 26 Sep 2021 19:12:45 +0200
Message-Id: <202109261712.18QHCj8L023400@valdese.nms.ulrich-teichert.org>
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
To:     glaubitz@physik.fu-berlin.de (John Paul Adrian Glaubitz)
Date:   Sun, 26 Sep 2021 19:12:45 +0200 (CEST)
Cc:     linux-alpha@vger.kernel.org (Linux Alpha), mattst88@gmail.com,
        torvalds@linux-foundation.org
In-Reply-To: <c6724a05-2174-46c6-aebe-a45c922d92f4@physik.fu-berlin.de>
From:   Ulrich Teichert <krypton@ulrich-teichert.org>
X-Mailer: ELM [version 2.5 PL8]
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;ut@ulrich-teichert.org;1632676369;f26f1d87;
X-HE-SMSGID: 1mUXhm-0007gf-6S
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hi Adrian,

> On 9/26/21 13:35, John Paul Adrian Glaubitz wrote:
> > This can be fixed, either by updating the kernel module package lists
> > or adding a missing firmware package - if needed.
> 
> OK, the problem is that the Alpha kernel in Debian is currently being built
> without ISA and EISA support. I will fix that for the next kernel upload.

Nice! I think I found out what my main problem is: my bootloader setup.
I copied the kernel from the CD-ROM (boot/vmlinuz), which booted, to my
hard drive - where it did not boot at all! Perhaps a newer aboot is needed
for newer kernels?

TIA,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, The Bellrays: Bad Reaction
