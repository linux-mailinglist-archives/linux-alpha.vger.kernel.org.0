Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0B3B66A589
	for <lists+linux-alpha@lfdr.de>; Fri, 13 Jan 2023 23:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbjAMWAT (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 13 Jan 2023 17:00:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjAMWAT (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 13 Jan 2023 17:00:19 -0500
Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [95.217.213.242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F22913E2A
        for <linux-alpha@vger.kernel.org>; Fri, 13 Jan 2023 14:00:16 -0800 (PST)
Received: from 213.219.160.184.adsl.dyn.edpnet.net ([213.219.160.184] helo=deadeye)
        by maynard with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ben@decadent.org.uk>)
        id 1pGS5u-000269-97; Fri, 13 Jan 2023 23:00:14 +0100
Received: from ben by deadeye with local (Exim 4.96)
        (envelope-from <ben@decadent.org.uk>)
        id 1pGS5t-005Gcw-2N;
        Fri, 13 Jan 2023 23:00:13 +0100
Date:   Fri, 13 Jan 2023 23:00:13 +0100
From:   Ben Hutchings <ben@decadent.org.uk>
To:     linux-alpha@vger.kernel.org
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH] alpha: Fix missing symbol versions for str{,n}{cat,cpy}
Message-ID: <Y8HUbeQh51qLA1th@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ME91w2cl5VCmWMxg"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 213.219.160.184
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org


--ME91w2cl5VCmWMxg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Now that modpost extracts symbol versions from *.cmd files, it can't
find the versions for these 4 symbols.  This is due to the way we link
their objects together ahead of the full vmlinux link.  genksyms puts
their symbol CRCs in .str{,n}{cat,cpy}.o.cmd, but modpost only reads
the .sty{,n}cpy.o.cmd files.

Instead of using the linker for this, add assembly sources that
concatenate the appropriate routines with include directives.

Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Fixes: f292d875d0dc ("modpost: extract symbol versions from *.cmd files")
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 arch/alpha/lib/Makefile  | 14 --------------
 arch/alpha/lib/stycpy.S  | 13 +++++++++++++
 arch/alpha/lib/styncpy.S | 13 +++++++++++++
 3 files changed, 26 insertions(+), 14 deletions(-)
 create mode 100644 arch/alpha/lib/stycpy.S
 create mode 100644 arch/alpha/lib/styncpy.S

diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
index 1cc74f7b50ef..8f1c32a25a40 100644
--- a/arch/alpha/lib/Makefile
+++ b/arch/alpha/lib/Makefile
@@ -45,17 +45,3 @@ AFLAGS___remlu.o =       -DREM -DINTSIZE
 $(addprefix $(obj)/,__divqu.o __remqu.o __divlu.o __remlu.o): \
 						$(src)/$(ev6-y)divide.S FORCE
 	$(call if_changed_rule,as_o_S)
-
-# There are direct branches between {str*cpy,str*cat} and stx*cpy.
-# Ensure the branches are within range by merging these objects.
-
-LDFLAGS_stycpy.o := -r
-LDFLAGS_styncpy.o := -r
-
-$(obj)/stycpy.o: $(obj)/strcpy.o $(obj)/$(ev67-y)strcat.o \
-		 $(obj)/$(ev6-y)stxcpy.o FORCE
-	$(call if_changed,ld)
-
-$(obj)/styncpy.o: $(obj)/strncpy.o $(obj)/$(ev67-y)strncat.o \
-		 $(obj)/$(ev6-y)stxncpy.o FORCE
-	$(call if_changed,ld)
diff --git a/arch/alpha/lib/stycpy.S b/arch/alpha/lib/stycpy.S
new file mode 100644
index 000000000000..bf2b0238209e
--- /dev/null
+++ b/arch/alpha/lib/stycpy.S
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * There are direct branches between strcpy, strcat, and stxcpy.
+ * Ensure the branches are within range by concatenating their code.
+ */
+#include "strcpy.S"
+#ifdef CONFIG_ALPHA_EV6
+#include "ev6-strcat.S"
+#include "ev6-stxcpy.S"
+#else
+#include "strcat.S"
+#include "stxcpy.S"
+#endif
diff --git a/arch/alpha/lib/styncpy.S b/arch/alpha/lib/styncpy.S
new file mode 100644
index 000000000000..213d1678be2a
--- /dev/null
+++ b/arch/alpha/lib/styncpy.S
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * There are direct branches between strncpy, strncat, and stxncpy.
+ * Ensure the branches are within range by concatenating their code.
+ */
+#include "strncpy.S"
+#ifdef CONFIG_ALPHA_EV6
+#include "ev6-strncat.S"
+#include "ev6-stxncpy.S"
+#else
+#include "strncat.S"
+#include "stxncpy.S"
+#endif

--ME91w2cl5VCmWMxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmPB1GgACgkQ57/I7JWG
EQnAmQ/+JACBLNcRIeJ859bKZ3BVCoUsXwslrToD0306GXHZlI7h7ucVPN+eCHnF
ene/yqBWYjFJ7T/iPsBXGjhwX9NNVzLku2dfuh/Dat81PdwdMDZ/M5TIKp63FExC
nkqkCkDNAm1w0tZctbjsA9HM6sWPPmgXClPhiJMDz+v6db4mT9WSlqQHzElVHrlU
QlMJaWW9LFa13d2WPS2xP59/JpZBW6OUh4RI62l3CoyOq+uaGopADv5sS8OIWyNC
9FRNSLrJFHAURzyCKxY/HFGTIs9OT9xv+IODnNq3n8SE2RZQd+lRELFBSB8gkuNv
lqXtCQRyWMPWRmBTPfOSjo8AbEemNNiawBAGdQyaCmt0VkfEAF+KMeVyu6vUkC6s
ZE8+oEOtnwLmMRVNtd/khOIlWQlJizJbJsTwInV3JLk3ZQIot2ySrWe3sg+trbTi
bgIK0QfUsI2+z9W6gc6CUMYHA+Wusltb4DHrzQSLmH7/y2hG+fKvpuY3w3nzTKZ9
C/qm6SsPaUI8gGKavbu0spNGJIQyj13dBsEY40XkmxDbm801PP58J+phJcPP2f1z
z4/M4MsE5gwQxZhutEdcLwBzvu3GlAcvzlBbi5kEXy9OZfhFyYmwoNvWOrrx2dAR
UGYyhAUP6jYdTwbzpzTR0pXx6ForNmU+xQKhdFLvCr5fyfqpEGg=
=+cfg
-----END PGP SIGNATURE-----

--ME91w2cl5VCmWMxg--
