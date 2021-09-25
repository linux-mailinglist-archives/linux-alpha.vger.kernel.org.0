Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B850418490
	for <lists+linux-alpha@lfdr.de>; Sat, 25 Sep 2021 23:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhIYVDB (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 25 Sep 2021 17:03:01 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:44849 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229842AbhIYVDA (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 25 Sep 2021 17:03:00 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1mUEnU-0048ax-HE; Sat, 25 Sep 2021 23:01:24 +0200
Received: from p57bd97e9.dip0.t-ipconnect.de ([87.189.151.233] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1mUEnS-002jkd-QL; Sat, 25 Sep 2021 23:01:24 +0200
Message-ID: <fb334b31-9b06-615d-189b-bf7909906752@physik.fu-berlin.de>
Date:   Sat, 25 Sep 2021 23:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
 use absolute_pointer macro)
Content-Language: en-US
To:     Ulrich Teichert <krypton@ulrich-teichert.org>,
        Linux Alpha <linux-alpha@vger.kernel.org>
Cc:     mattst88@gmail.com
References: <202109231957.18NJv4ar004671@valdese.nms.ulrich-teichert.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <202109231957.18NJv4ar004671@valdese.nms.ulrich-teichert.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.151.233
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hi Ulrich!

On 9/23/21 21:57, Ulrich Teichert wrote:
> and putting the four SIMMs into bank 0 only, I was able to boot my ancient
> kernel with 128 MB of ram. So far so good, but I failed to boot the
> 5.15-rc2 kernel over aboot or from the CDROM, with exactly the same
> behavior as before (uncompressing.... forever or machine check with HALT).

Out of curiosity, have you tried a recent Debian ISO for Alpha?

> https://cdimage.debian.org/cdimage/ports/current/

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

