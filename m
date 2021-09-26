Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76BD0418870
	for <lists+linux-alpha@lfdr.de>; Sun, 26 Sep 2021 13:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhIZL5T (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 26 Sep 2021 07:57:19 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:43101 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230200AbhIZL5T (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sun, 26 Sep 2021 07:57:19 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1mUSkw-00277I-4O; Sun, 26 Sep 2021 13:55:42 +0200
Received: from p57bd97e9.dip0.t-ipconnect.de ([87.189.151.233] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1mUSkv-00077S-U5; Sun, 26 Sep 2021 13:55:42 +0200
Message-ID: <c6724a05-2174-46c6-aebe-a45c922d92f4@physik.fu-berlin.de>
Date:   Sun, 26 Sep 2021 13:55:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
Content-Language: en-US
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Ulrich Teichert <krypton@ulrich-teichert.org>
Cc:     Linux Alpha <linux-alpha@vger.kernel.org>, mattst88@gmail.com,
        torvalds@linux-foundation.org
References: <202109261126.18QBQQWp003766@valdese.nms.ulrich-teichert.org>
 <38fd780c-bc15-d47c-cc57-30ec63c5c0bf@physik.fu-berlin.de>
In-Reply-To: <38fd780c-bc15-d47c-cc57-30ec63c5c0bf@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.151.233
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hi Ulrich!

On 9/26/21 13:35, John Paul Adrian Glaubitz wrote:
> This can be fixed, either by updating the kernel module package lists
> or adding a missing firmware package - if needed.

OK, the problem is that the Alpha kernel in Debian is currently being built
without ISA and EISA support. I will fix that for the next kernel upload.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

