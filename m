Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1676E4373D8
	for <lists+linux-alpha@lfdr.de>; Fri, 22 Oct 2021 10:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbhJVIs5 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 22 Oct 2021 04:48:57 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:34733 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232261AbhJVIs4 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 22 Oct 2021 04:48:56 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1mdqCE-000Fxx-F8; Fri, 22 Oct 2021 10:46:38 +0200
Received: from p57bd9c1a.dip0.t-ipconnect.de ([87.189.156.26] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1mdqCE-002qpa-8m; Fri, 22 Oct 2021 10:46:38 +0200
Message-ID: <5a774482-5a0e-a06d-2ef0-d1727bb41be5@physik.fu-berlin.de>
Date:   Fri, 22 Oct 2021 10:46:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
Content-Language: en-US
To:     Ulrich Teichert <krypton@ulrich-teichert.org>
Cc:     Linux Alpha <linux-alpha@vger.kernel.org>
References: <202110191946.19JJkeut004465@valdese.nms.ulrich-teichert.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <202110191946.19JJkeut004465@valdese.nms.ulrich-teichert.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.156.26
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hi Ulrich!

On 10/19/21 21:46, Ulrich Teichert wrote:
> I've also tried booting from the CD-ROM on my Jensen and that worked insofar
> as the installer starts up, which is cool, but no SCSI devices were detected.
> EISA support seems to be activated, though:
> ...
> [    0.193359] thermal_sys: Registered thermal governor 'user_space'
> [    0.195312] EISA bus registered
> [    0.249999] random: fast init done
> ...
> 
> I've modprobe'd the AHA174x kernel module by hand, as it was not inserted
> automatically, but all I got was this line in the syslog:
> ...
> Oct 19 17:07:28 main-menu[245]: INFO: Menu item 'di-utils-shell' selected
> Oct 19 17:11:43 kernel: [  535.043671] SCSI subsystem initialized
> ...
> Nothing more. According to the documentation the module needs no arguments
> and should auto-probe, but it did not detect any devices.

I'm currently out of ideas what could be the reason for the device detection not
working, so I'll have to rely on your own debugging work. Either the driver is
missing the hardware IDs for your particular card (maybe it was patched out?!)
or there is an additional module that needs to enabled in the Debian kernel.

> I apologize for not doing more digging ATM,
> full bootlogs from the serial line as attachments,

No problem. If you find out anything more, please let me know.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

