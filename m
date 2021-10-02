Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09D7641FCBE
	for <lists+linux-alpha@lfdr.de>; Sat,  2 Oct 2021 17:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233274AbhJBPcl (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 2 Oct 2021 11:32:41 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:42201 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232575AbhJBPcl (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 2 Oct 2021 11:32:41 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1mWgyU-001cEN-El; Sat, 02 Oct 2021 17:30:54 +0200
Received: from p57bd97e9.dip0.t-ipconnect.de ([87.189.151.233] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1mWgyU-003wpe-8D; Sat, 02 Oct 2021 17:30:54 +0200
Message-ID: <2b9935f1-da3a-e858-77e5-c88e8b578e0d@physik.fu-berlin.de>
Date:   Sat, 2 Oct 2021 17:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
Content-Language: en-US
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Ulrich Teichert <krypton@ulrich-teichert.org>
Cc:     Linux Alpha <linux-alpha@vger.kernel.org>, mattst88@gmail.com,
        "debian-alpha@lists.debian.org" <debian-alpha@lists.debian.org>
References: <202109261712.18QHCj8L023400@valdese.nms.ulrich-teichert.org>
 <75c41301-8467-0e44-c5b0-fcc47a113e31@physik.fu-berlin.de>
In-Reply-To: <75c41301-8467-0e44-c5b0-fcc47a113e31@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.151.233
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hi Ulrich!

On 9/26/21 19:16, John Paul Adrian Glaubitz wrote:
> That might be possible but I'm not sure whether there are any limitations with
> a-boot in this regard. Either way, you helped me find another kernel configuration
> issue in Debian that I am going to fix, so thanks for that.

I have opened a merge request for the Debian kernel configuration now to enable
EISA support in the Debian kernel package on alpha [1].

Thus, the installer images should fully work on your machine once this change
has been merged.

Thanks,
Adrian

> [1] https://salsa.debian.org/kernel-team/linux/-/merge_requests/401

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

