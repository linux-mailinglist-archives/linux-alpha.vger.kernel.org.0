Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 706E970B931
	for <lists+linux-alpha@lfdr.de>; Mon, 22 May 2023 11:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232449AbjEVJi0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-alpha@lfdr.de>); Mon, 22 May 2023 05:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbjEVJiU (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 22 May 2023 05:38:20 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D146AF
        for <linux-alpha@vger.kernel.org>; Mon, 22 May 2023 02:37:53 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1q11z1-000Lkf-BG; Mon, 22 May 2023 11:37:39 +0200
Received: from 87-77-169-107.mna.fu-berlin.de ([87.77.169.107])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1q11z1-003XoB-5o; Mon, 22 May 2023 11:37:39 +0200
Message-ID: <b9e52b7a6f68782707ca809a746823c0c752de5c.camel@physik.fu-berlin.de>
Subject: Re: Linux 6.1.27, cgroup: Instruction fault 4 with systemd
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Frank Scheiner <frank.scheiner@web.de>, linux-alpha@vger.kernel.org
Cc:     "debian-alpha@lists.debian.org" <debian-alpha@lists.debian.org>,
        Michael Cree <mcree@orcon.net.nz>
Date:   Mon, 22 May 2023 11:37:38 +0200
In-Reply-To: <57622252-b409-869e-7aae-81cf61e94fda@web.de>
References: <57622252-b409-869e-7aae-81cf61e94fda@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.77.169.107
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hello Frank!

On Mon, 2023-05-22 at 11:34 +0200, Frank Scheiner wrote:
> Maybe someone on linux-alpha has an idea what could be the reason?

Try reproducing it with libcgroup to see if it's a systemd or a kernel bug:

> https://wiki.archlinux.org/title/cgroups#Examples

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
