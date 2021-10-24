Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C217438674
	for <lists+linux-alpha@lfdr.de>; Sun, 24 Oct 2021 05:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhJXDoZ (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 23 Oct 2021 23:44:25 -0400
Received: from angie.orcam.me.uk ([78.133.224.34]:34368 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbhJXDoY (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 23 Oct 2021 23:44:24 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 2CAC392009C; Sun, 24 Oct 2021 05:41:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 1FD5592009B;
        Sun, 24 Oct 2021 05:41:59 +0200 (CEST)
Date:   Sun, 24 Oct 2021 05:41:59 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc:     Ulrich Teichert <krypton@ulrich-teichert.org>,
        Linux Alpha <linux-alpha@vger.kernel.org>
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
In-Reply-To: <5a774482-5a0e-a06d-2ef0-d1727bb41be5@physik.fu-berlin.de>
Message-ID: <alpine.DEB.2.21.2110240528130.45807@angie.orcam.me.uk>
References: <202110191946.19JJkeut004465@valdese.nms.ulrich-teichert.org> <5a774482-5a0e-a06d-2ef0-d1727bb41be5@physik.fu-berlin.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Fri, 22 Oct 2021, John Paul Adrian Glaubitz wrote:

> > I've modprobe'd the AHA174x kernel module by hand, as it was not inserted
> > automatically, but all I got was this line in the syslog:
> > ...
> > Oct 19 17:07:28 main-menu[245]: INFO: Menu item 'di-utils-shell' selected
> > Oct 19 17:11:43 kernel: [  535.043671] SCSI subsystem initialized
> > ...
> > Nothing more. According to the documentation the module needs no arguments
> > and should auto-probe, but it did not detect any devices.
> 
> I'm currently out of ideas what could be the reason for the device detection not
> working, so I'll have to rely on your own debugging work. Either the driver is
> missing the hardware IDs for your particular card (maybe it was patched out?!)
> or there is an additional module that needs to enabled in the Debian kernel.

 Device IDs are supposed to be reported for any EISA devices present as 
the bus is probed, regardless of whether there is a driver available for 
the particular piece of hardware or not, so it should be possible to see 
if the expected device is recognised.

 For example with my EISA box (albeit an x86 one, but this part should be
generic, and like the Jensen this is a pure-EISA system, no PCI) I get the 
following devices listed (and some, but not all claimed by Linux drivers) 
as the system boots:

platform eisa.0: Probing EISA bus 0
eisa 00:00: EISA: Mainboard AEI0401 detected
eisa 00:05: EISA: slot 5: DEC3002 detected
defxx: v1.12 2021/03/10  Lawrence V. Stefani and others
00:05: DEFEA at I/O addr = 0x5000, IRQ = 10, Hardware addr = 00-00-f8-c8-b3-b6
00:05: registered as fddi0
eisa 00:06: EISA: slot 6: NPI0303 detected
eisa 00:08: EISA: slot 8: TCM5094 detected
eth0: 3c5x9 found at 0x8000, 10baseT port, address 00:a0:24:b6:8b:db, IRQ 12.
platform eisa.0: EISA: Detected 3 cards

I can see for AHA174x devices the following IDs have been defined: 
ADP0000, ADP0001, ADP0002, ADP0400, so check if any are listed in the 
kernel log.

  Maciej
