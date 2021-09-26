Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E562641885C
	for <lists+linux-alpha@lfdr.de>; Sun, 26 Sep 2021 13:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhIZLhM (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 26 Sep 2021 07:37:12 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:55693 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230200AbhIZLhL (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sun, 26 Sep 2021 07:37:11 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1mUSRS-0023fX-OU; Sun, 26 Sep 2021 13:35:34 +0200
Received: from p57bd97e9.dip0.t-ipconnect.de ([87.189.151.233] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1mUSRS-0005Hd-H2; Sun, 26 Sep 2021 13:35:34 +0200
Message-ID: <38fd780c-bc15-d47c-cc57-30ec63c5c0bf@physik.fu-berlin.de>
Date:   Sun, 26 Sep 2021 13:35:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
Content-Language: en-US
To:     Ulrich Teichert <krypton@ulrich-teichert.org>
Cc:     Linux Alpha <linux-alpha@vger.kernel.org>, mattst88@gmail.com,
        torvalds@linux-foundation.org
References: <202109261126.18QBQQWp003766@valdese.nms.ulrich-teichert.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <202109261126.18QBQQWp003766@valdese.nms.ulrich-teichert.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.151.233
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hello Ulrich!

On 9/26/21 13:26, Ulrich Teichert wrote:
> After that the installer starts, but does not find the CD-ROM, most
> probably because the AHA174x SCSI driver wasn't loaded or included in
> the initrd image, but this is definitely more than I ever expected!

This can be fixed, either by updating the kernel module package lists
or adding a missing firmware package - if needed.

I will look into it.

> Could you please point me to the kernel build script you are using? I must
> be doing something completely wrong.

The kernel configuration for the Debian kernel is constructed from here:

> https://salsa.debian.org/kernel-team/linux/-/tree/master/debian/config

> I assume the installer build instructions on
> 
> https://wiki.debian.org/PortsDocs/CreateDebianInstallerImages
> 
> are still valid? In that case, I should be able to create a debian ports
> installer image with a custom kernel?

Yes, that's roughly what you need to do. I don't know whether it's still
100% accurate, but feel free to join the #debian-ports IRC channel on
OFTC or post your questions on the debian-alpha mailing list.

> Thanks for suggesting the debian ports images and of course for your
> maintenance work!

You're welcome. FWIW, if you have the possibility to have an Alpha machine
running to build some Debian packages automatically, that would be great
although I know that electricity prices in Germany are quite prohibitive :(.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

