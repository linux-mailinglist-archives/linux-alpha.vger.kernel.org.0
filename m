Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5228A41663D
	for <lists+linux-alpha@lfdr.de>; Thu, 23 Sep 2021 21:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243024AbhIWT6k (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 23 Sep 2021 15:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242955AbhIWT6j (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 23 Sep 2021 15:58:39 -0400
Received: from wp441.webpack.hosteurope.de (wp441.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:85d2::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5BFC061574
        for <linux-alpha@vger.kernel.org>; Thu, 23 Sep 2021 12:57:07 -0700 (PDT)
Received: from [2a03:7846:b79f:101:21c:c4ff:fe1f:fd93] (helo=valdese.nms.ulrich-teichert.org); authenticated
        by wp441.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1mTUq9-00038G-OU; Thu, 23 Sep 2021 21:57:05 +0200
Received: from valdese.nms.ulrich-teichert.org (localhost [127.0.0.1])
        by valdese.nms.ulrich-teichert.org (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPS id 18NJv5VI004672
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Sep 2021 21:57:05 +0200
Received: (from ut@localhost)
        by valdese.nms.ulrich-teichert.org (8.15.2/8.15.2/Submit) id 18NJv4ar004671;
        Thu, 23 Sep 2021 21:57:04 +0200
Message-Id: <202109231957.18NJv4ar004671@valdese.nms.ulrich-teichert.org>
Subject: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and use absolute_pointer macro)
To:     linux-alpha@vger.kernel.org (Linux Alpha)
Date:   Thu, 23 Sep 2021 21:57:04 +0200 (CEST)
Cc:     torvalds@linux-foundation.org (Linus Torvalds), mattst88@gmail.com
In-Reply-To: <202109222050.18MKoNUh007272@valdese.nms.ulrich-teichert.org>
From:   Ulrich Teichert <krypton@ulrich-teichert.org>
X-Mailer: ELM [version 2.5 PL8]
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;ut@ulrich-teichert.org;1632427028;2e31d230;
X-HE-SMSGID: 1mTUq9-00038G-OU
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hi,

I've narrowed the distribution quite a bit, as we've drifted
away from the orginal subject quite a lot ;-)

Just a quick update: I got the 128MB of RAM and after consulting the
Jensen hardware manual at:

http://www.home.unix-ag.org/nils/Alpha/Architectures/Jensen.html

and putting the four SIMMs into bank 0 only, I was able to boot my ancient
kernel with 128 MB of ram. So far so good, but I failed to boot the
5.15-rc2 kernel over aboot or from the CDROM, with exactly the same
behavior as before (uncompressing.... forever or machine check with HALT).

I'll try booting from CDROM with a serial line attached at the weekend,
perhaps that will give us a hint. I found the aboot sources at GitHub
and I'll set up another disk to play around with them after reading the
documentation on my old set of Debian Alpha CDROMs: I saw that they provided
two different kernels way back: one for the Jensen and a generic one,
so there *was* something definitely different...

CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, The Bellrays: Bad Reaction
