Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABBCD43230E
	for <lists+linux-alpha@lfdr.de>; Mon, 18 Oct 2021 17:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232933AbhJRPjg (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 18 Oct 2021 11:39:36 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:52455 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229696AbhJRPje (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 18 Oct 2021 11:39:34 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1mcUhW-003v5s-3W; Mon, 18 Oct 2021 17:37:22 +0200
Received: from p57bd9797.dip0.t-ipconnect.de ([87.189.151.151] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1mcUhV-0012sV-T9; Mon, 18 Oct 2021 17:37:22 +0200
Message-ID: <232a0956-fe78-5169-4637-25679baa887f@physik.fu-berlin.de>
Date:   Mon, 18 Oct 2021 17:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
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
X-Originating-IP: 87.189.151.151
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hi Ulrich!

On 9/26/21 13:26, Ulrich Teichert wrote:
> Awesome! This boots right away, here's the full boot log from the serial
> console until init starts:
> (...)
> After that the installer starts, but does not find the CD-ROM, most
> probably because the AHA174x SCSI driver wasn't loaded or included in
> the initrd image, but this is definitely more than I ever expected!

Could you try the installation image for Alpha that I built today and see if that
fixes the CD-ROM detection issue for you?

> https://cdimage.debian.org/cdimage/ports/snapshots/2021-10-18/

Thanks,
Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

