Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 374BABAC10
	for <lists+linux-alpha@lfdr.de>; Mon, 23 Sep 2019 00:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729092AbfIVW4O (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 22 Sep 2019 18:56:14 -0400
Received: from [192.158.254.49] ([192.158.254.49]:43750 "EHLO gherkin.frus.com"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S1728670AbfIVW4O (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Sun, 22 Sep 2019 18:56:14 -0400
X-Greylist: delayed 7320 seconds by postgrey-1.27 at vger.kernel.org; Sun, 22 Sep 2019 18:56:13 EDT
Received: by gherkin.frus.com (Postfix, from userid 500)
        id A93973D059; Sun, 22 Sep 2019 15:53:42 -0500 (CDT)
Date:   Sun, 22 Sep 2019 15:53:42 -0500
From:   Bob Tracy <rct@gherkin.frus.com>
To:     debian-alpha@lists.debian.org
Cc:     linux-alpha@vger.kernel.org, mattst88@gmail.com, mcree@orcon.net.nz
Subject: vmlinux.o linker warning
Message-ID: <20190922205342.GA7209@gherkin.frus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Using gcc 9.2 to build current 5.X kernel.org source trees, I'm seeing
several warnings like the following during the linking of "vmlinux.o":

WARNING: vmlinux.o(__ex_table+0x11d0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .alphalib:(unknown)
The relocation at __ex_table+0x11d0 references
section ".alphalib" which is not in the list of
authorized sections.  If you're adding a new section
and/or if this reference is valid, add ".alphalib" to the
list of authorized sections to jump to on fault.
This can be achieved by adding ".alphalib" to 
OTHER_TEXT_SECTIONS in scripts/mod/modpost.c.

This is directly due to the workarounds we put in place on alpha for
dealing with relocation errors during the linking of large executables
(such as "firefox" :-)).

These are warnings, but sending a fix upstream sooner rather than later
would probably be a good idea.

--Bob
