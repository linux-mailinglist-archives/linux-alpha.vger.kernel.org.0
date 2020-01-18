Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D913141861
	for <lists+linux-alpha@lfdr.de>; Sat, 18 Jan 2020 17:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgARQ1Z (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 18 Jan 2020 11:27:25 -0500
Received: from cpe-67-11-230-143.satx.res.rr.com ([67.11.230.143]:60686 "EHLO
        gherkin.frus.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbgARQ1Z (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 18 Jan 2020 11:27:25 -0500
X-Greylist: delayed 1261 seconds by postgrey-1.27 at vger.kernel.org; Sat, 18 Jan 2020 11:27:25 EST
Received: by gherkin.frus.com (Postfix, from userid 500)
        id 71A7369C61; Sat, 18 Jan 2020 10:06:23 -0600 (CST)
Date:   Sat, 18 Jan 2020 10:06:23 -0600
From:   Bob Tracy <rct@frus.com>
To:     debian-alpha@lists.debian.org
Cc:     linux-alpha@vger.kernel.org
Subject: dbus-daemon unaligned accesses
Message-ID: <20200118160623.GA2136@gherkin.frus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On my alpha, the system logs are getting spammed with unaligned trap
errors as follows:

[34656.586748] dbus-daemon(700): unaligned trap at 00000200000a9720: 00000000d68c7222 28 18
[34656.599443] dbus-daemon(700): unaligned trap at 00000200000a9720: 00000000d68c7222 28 18
[34656.612138] dbus-daemon(700): unaligned trap at 00000200000a9720: 00000000d68c7222 28 18
[34656.617021] dbus-daemon(700): unaligned trap at 00000200000a9720: 00000000d68c7222 28 18
[34656.624833] dbus-daemon(700): unaligned trap at 00000200000a9720: 00000000d68c7222 28 18

The current "dbus" package version is 1.12.16-2.

If no one else is actively working to fix this annoyance, I'll see what
I can do.  For me, it's mostly a matter of finding the time to download
the source package and its dependencies, build a debug version with
symbols in it that "gdb" can use, and then *maybe* figure out the best
way to code around the unaligned access.

If anyone else has the time and would like to have a go at it, the
following two links might be useful:

https://wiki.gentoo.org/wiki/Project:Alpha/Porting_guide#Unaligned_accesses

https://www.redhat.com/archives/axp-list/2000-May/msg00151.html

(Yes, the problem has been around at least as long as the alpha
architecture :-) ).

Michael Cree et al.: do we have a working "gdb" on alpha these days?
I seem to recall brokenness there in the not-too-distant past.

--Bob
