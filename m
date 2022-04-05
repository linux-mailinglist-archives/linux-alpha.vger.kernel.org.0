Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF924F4E82
	for <lists+linux-alpha@lfdr.de>; Wed,  6 Apr 2022 03:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbiDFA2S (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 5 Apr 2022 20:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573215AbiDESZE (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Tue, 5 Apr 2022 14:25:04 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37418419A4
        for <linux-alpha@vger.kernel.org>; Tue,  5 Apr 2022 11:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1649182972;
        bh=LKPlKBDuDZXddfhNt05rnAYMj4SXtMRzmFkmSV/6fPU=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=Z4NSAWTszi/AZwfIFSIz9gZ3V8gKsN7gPBqTqzeFCcGDhEhNEMlMTEPIk+PJl6+vA
         mG5KrRV1M1MmJg0C1NqZlYw0Q9LDvWYBzyIZ6tj7F0ZO976mRWqjbpej/Mc+T1gNN8
         TaN5sqVWtPufveOsTdL0ZCGX/6kX+ID2I+oYQZH4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.146.134]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhD6W-1oFpba1aja-00eJ56; Tue, 05
 Apr 2022 20:22:52 +0200
Message-ID: <10d61d8f-edfc-fc39-0936-233692464dbd@gmx.de>
Date:   Tue, 5 Apr 2022 20:22:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: 5.17.0 boot issue on Miata
Content-Language: en-US
To:     Bob Tracy <rct@frus.com>, Michael Cree <mcree@orcon.net.nz>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
References: <Yj0u150JJpsb9nj4@gherkin.frus.com> <20220326222157.GA13650@tower>
 <YkuejknyPDJoQEDC@gherkin.frus.com> <20220405050125.GA25969@tower>
 <YkxKRElYUhMgOOCN@gherkin.frus.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <YkxKRElYUhMgOOCN@gherkin.frus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+QOTpAg/UqEoEkf0sNYbLLtz5s4rO9sR2MkQDqKDCBrFE3zxI4y
 wQGMOeAwoSuJpkhi+3fX+OmvhPD5O2NnqZDyFZ2E+F1uVn9LICd9LdOXj0fSz7fWINyLIn9
 imY3ErUqyw2iA3dp/Wm1SJN2r1jN3ePlewrLw9pGogSItTxD+72hJ+iTkKoh/eoUauCqj1P
 RDgOkSidlYxUC0XE+nCuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6pVWuBa3pm0=:MoMHjxzxwbvQfa6GXzQw2D
 M6cnXdWczJJA7FjTx5zgMYpz2nuPCz0DblGha9Bkhj/5VVEw8bOX2cRzfV8DuOLcbV4YQfkxD
 0pENWmN9z1LDymHtq/nQpbC91HaEluNhR9g8TY5MONASjDftaJ8yA5J/pSl9TBn3/eSkW7m3F
 umLuuxLx/XaTGRxkIvuSkhD5DGa/1x4i35Bc/D+iJ+7T/FGD5+MDlfOC2JaF3WW8H4dh3GNhy
 ke7HUtxOtIISnjduHaLiaijoxFP29SYV3JUaoh05xNorIHXW8g8ELCEDpQnO/zRiBVyjBwvot
 Nds0vckMM0OhS0ghZqWcoa7C7eGYPB+wAPqvurvAewUXU7Lg2yrdZY5rmG22iVQcs4SLX206h
 I5F01suc62p/0hGeIG0bAkmj7+T6cjrXwYtwim65FlV7EOxzXSkHJmKd5GM1tm+8NGjvO/mV6
 rWKwvzeqSbQtvKRUW3hArygyn/BnX7MrLWzoAx2CBu0QH0Z0kda2OYNQf1WBcSoLdGym8k3A0
 lEsVmo9+ikE1FDpxwOVlu0Ya2UTww7sN8FjvVngKrwWt4icoSW3hXWe472S5dKagU6qMZUt6W
 VKArBoc5qMHNOyCjD5G0fFrU9iTeSr75UrZdstu6uhrzn8H5eUptBdSYr+xqX/1jtrIrwXjem
 NXSSxuqPu/VHWHamVMV5yC1MXMLE4/Gk9/qJpSGVBEeLVjm+Sd9p8r4jjpFmhKmgFt9FbWPwT
 GuATkGM5mh0zulZiw2BUuXjwRozfFzuktYAnXM8jNAnT+Wvl9wjKB9/GRDsQlJrOoit5UPJU7
 Pawz6EY76168Rx6t/x47ja7CGq+N5E+osUe5S4bxtA7L8bxgFeruU+VIRgLE5txm2/WzJBZCy
 8zXl1R/U2t91t7fnlEmMkL33lp5cXztnToyzZ0ODgwOKuVKuQ0ywgR3PjkTTtXW8PTFmOWeW/
 GwWVt+kK/2nPncLmUghep0xAEH4hvGqxnrzHLKm6FDk+fWzSfjikk/BNGYlv0MRr5C2YwJu9v
 EQfg0j7ymgZpRQNLvHMaR/zAiv7/5gZR0FlPwRiqelJwaWCv2XkqpUoRQsm7EoQ4PII5rTi8v
 xURtza0e3kmCDY=
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On 4/5/22 15:55, Bob Tracy wrote:
> On Tue, Apr 05, 2022 at 05:01:25PM +1200, Michael Cree wrote:
>> On Mon, Apr 04, 2022 at 08:42:38PM -0500, Bob Tracy wrote:
>>> On Sun, Mar 27, 2022 at 11:21:57AM +1300, Michael Cree wrote:
>>>> On Thu, Mar 24, 2022 at 09:54:15PM -0500, Bob Tracy wrote:
>>>>> When I attempt to boot a 5.17.0 kernel built from the kernel.org
>>>>> sources, I see disk sector errors on my "sda" device, and the boot
>>>>> process hangs at the point where "systemd-udevd.service" starts.
>>>>>
>>>>> Rebooting on 5.16.0 works with no disk I/O errors of any kind.
>>>>
>>>> Oh, you can run a 5.16.y kernel on Alpha?  I have had problems
>>>> with everything since 5.9.y with rare, random, corruptions in
>>>> memory in user space (exhibiting as glibc detected memory
>>>> corruptions or segfaults).
>>>
>>> Did we have this painted into the "SMP vs. not-SMP" corner at one poin=
t?
>>
>> No, this affects both ES45 (with 3 cpus) and XP1000 (one cpu).
>>
>> The problem is rare. I often have to run tests for 12 hours on
>> the XP1000 before I see a problem.  On miata it might occur even
>> less often.
>>
>> I hope I am getting close to the bad commit, but it is taking
>> time when I run testing for a whole day before I feel confident
>> enough to mark the kernel as good.  And I have been wrong on
>> that one a couple of times now, having to repeat part of the
>> bisection.
>
> Stupid question, but possibly related to what I'm seeing in v5.17-final.
> Beginning with "-rc3" there's a new FRAMEBUFFER_CONSOLE_LEGACY_ACCELERAT=
ION
> configuration option.  Do I need this enabled on Miata if I normally
> boot in a video mode that displays a logo?  I'll try "no" for the "-rc3"
> build if/when "-rc2" boots properly.

You don't need to enable it, but for alpha it's probably beneficial to ena=
ble it.
When enabled, you will see a big speed improvement when logging in to a gr=
aphics text
console and printing info.  E.g. try "time dmesg" with and without that op=
tion...
The "dmesg" will scroll the screen, and that's what it accelerates (only i=
f the driver
has such hardware bitblt-support).

Helge
