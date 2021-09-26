Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9DA74187D4
	for <lists+linux-alpha@lfdr.de>; Sun, 26 Sep 2021 11:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbhIZJKK (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 26 Sep 2021 05:10:10 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:55481 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231463AbhIZJJv (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sun, 26 Sep 2021 05:09:51 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1mUQ8p-001b6E-Ut; Sun, 26 Sep 2021 11:08:11 +0200
Received: from p57bd97e9.dip0.t-ipconnect.de ([87.189.151.233] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1mUQ8p-0040sK-OO; Sun, 26 Sep 2021 11:08:11 +0200
Message-ID: <bfdfeb42-759e-b659-39ed-af73f48722f1@physik.fu-berlin.de>
Date:   Sun, 26 Sep 2021 11:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 7/7] alpha: lazy FPU switching
Content-Language: en-US
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Cc:     alpha <linux-alpha@vger.kernel.org>,
        Michael Cree <mcree@orcon.net.nz>,
        Matt Turner <mattst88@gmail.com>
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk>
 <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
 <20210925025548.1694143-7-viro@zeniv.linux.org.uk>
 <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.151.233
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hi Linus!

On 9/25/21 21:07, Linus Torvalds wrote:
> On Fri, Sep 24, 2021 at 7:55 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>>
>>         On each context switch we save the FPU registers on stack
>> of old process and restore FPU registers from the stack of new one.
>> That allows us to avoid doing that each time we enter/leave the
>> kernel mode; however, that can get suboptimal in some cases.
> 
> Do you actually have a system or virtual image to test this all out on?

I have a system for testing and I can also create a QEMU VM image for tesing
using the Debian Ports installation ISO for Alpha [1].

I assume Matt and Michael (CC'ed) would be able to test these improvements
as well as they're working on Alpha support in the kernel.

> I'm not saying this doesn't look like an improvement, I'm more
> questioning whether it's worth it...

Since we're still maintaining Alpha ports in Debian and Gentoo, it should
be worth it, I would say.

Adrian

> [1] https://cdimage.debian.org/cdimage/ports/snapshots/2021-09-23/

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

