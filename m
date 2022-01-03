Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBC5482DA3
	for <lists+linux-alpha@lfdr.de>; Mon,  3 Jan 2022 04:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiACDii (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 2 Jan 2022 22:38:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiACDii (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Sun, 2 Jan 2022 22:38:38 -0500
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86672C061761
        for <linux-alpha@vger.kernel.org>; Sun,  2 Jan 2022 19:38:37 -0800 (PST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id 046B1100AF851;
        Mon,  3 Jan 2022 04:38:34 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id C67083EC3A; Mon,  3 Jan 2022 04:38:33 +0100 (CET)
Date:   Mon, 3 Jan 2022 04:38:33 +0100
From:   Lukas Wunner <lukas@wunner.de>
To:     Ulrich Teichert <krypton@ulrich-teichert.org>
Cc:     Linux Alpha <linux-alpha@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@debian.org>
Subject: Re: Booting newer kernels on the Jensen...update
Message-ID: <20220103033833.GA8637@wunner.de>
References: <202201021948.202JmC7h015740@valdese.nms.ulrich-teichert.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202201021948.202JmC7h015740@valdese.nms.ulrich-teichert.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sun, Jan 02, 2022 at 08:48:12PM +0100, Ulrich Teichert wrote:
> but I simply fail to understand why it tries to unzip a gzipped kernel.

The compressed kernel needs to start with 0x1f8b or 0x1f9e,
else you'll get the "unknown compression method" error:

https://github.com/wgwoods/aboot/blob/master/zip/misc.c#L131

Use "hexdump -C" on the compressed kernel image to double check
that it starts with the proper magic bytes.


> I hope I'm not too annoying,

Not at all.  But I've never owned an Alpha, so am totally
unfamiliar with its boot process.

Thanks,

Lukas
