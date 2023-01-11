Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79BE56664ED
	for <lists+linux-alpha@lfdr.de>; Wed, 11 Jan 2023 21:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbjAKUnO (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 11 Jan 2023 15:43:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbjAKUnN (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 11 Jan 2023 15:43:13 -0500
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2700193F5
        for <linux-alpha@vger.kernel.org>; Wed, 11 Jan 2023 12:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Type:MIME-Version:
        Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=Ux8GgdBMl9eR/WogF8ePMNoWJGD1MCxK7CYf94mdnDc=; b=oFZ2XAysYh+LmsFGhlfAqOxdap
        7Qiw3DdxV3RJ2JdDmn29yAS7FC+Xba+OEFhni0lzJ8DZTv1wzkVlIPlana/io+jvnnuuFXbJd4ZWr
        YPaqgfszFDyr70NTJ1evhrqB2Qy7wiZor5yJ/PmHwdA6JJkPufzHGDKcrUeTA1PwPonz0fNYb5STz
        cTZRIJgn6c1QmRTdzUj4yL9/N6mwDdHfp7SNe0xbJPXmTBCWR+7uXoc5fdCzIwl40dOOb7E8IlV9c
        MwGiQ+e5Llj9vIm7hIMdR2CYVOXwIeFbPwNm6nVhz++A0S6tgdQsxsT8Ge3d1H91hRrgz6ftIuWRA
        wMjrN1Qg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
        id 1pFhwE-001MjF-0s
        for linux-alpha@vger.kernel.org;
        Wed, 11 Jan 2023 20:43:10 +0000
Date:   Wed, 11 Jan 2023 20:43:10 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     linux-alpha@vger.kernel.org
Subject: [PATCH] alpha/boot: fix the breakage from -isystem series...
Message-ID: <Y78fXnVzitfpX1Tm@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/boot/bootp.c  | 2 +-
 arch/alpha/boot/bootpz.c | 2 +-
 arch/alpha/boot/main.c   | 2 +-
 arch/alpha/boot/stdio.c  | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/boot/bootp.c b/arch/alpha/boot/bootp.c
index b4faba2432d5..842e85776cc0 100644
--- a/arch/alpha/boot/bootp.c
+++ b/arch/alpha/boot/bootp.c
@@ -18,7 +18,7 @@
 #include <asm/hwrpb.h>
 #include <asm/io.h>
 
-#include <stdarg.h>
+#include <linux/stdarg.h>
 
 #include "ksize.h"
 
diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index 90a2b341e9c0..c6079308eab3 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -20,7 +20,7 @@
 #include <asm/hwrpb.h>
 #include <asm/io.h>
 
-#include <stdarg.h>
+#include <linux/stdarg.h>
 
 #include "kzsize.h"
 
diff --git a/arch/alpha/boot/main.c b/arch/alpha/boot/main.c
index e5347a080008..22a1cb0264af 100644
--- a/arch/alpha/boot/main.c
+++ b/arch/alpha/boot/main.c
@@ -15,7 +15,7 @@
 #include <asm/console.h>
 #include <asm/hwrpb.h>
 
-#include <stdarg.h>
+#include <linux/stdarg.h>
 
 #include "ksize.h"
 
diff --git a/arch/alpha/boot/stdio.c b/arch/alpha/boot/stdio.c
index 60f73ccd2e89..a5abeaf94791 100644
--- a/arch/alpha/boot/stdio.c
+++ b/arch/alpha/boot/stdio.c
@@ -2,8 +2,8 @@
 /*
  * Copyright (C) Paul Mackerras 1997.
  */
-#include <stdarg.h>
-#include <stddef.h>
+#include <linux/string.h>
+#include <linux/stdarg.h>
 
 size_t strnlen(const char * s, size_t count)
 {
-- 
2.30.2

