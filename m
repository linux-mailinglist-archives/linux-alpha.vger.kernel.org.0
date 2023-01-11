Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4BF6664F1
	for <lists+linux-alpha@lfdr.de>; Wed, 11 Jan 2023 21:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbjAKUoD (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 11 Jan 2023 15:44:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232626AbjAKUoC (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 11 Jan 2023 15:44:02 -0500
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 619D5193F5
        for <linux-alpha@vger.kernel.org>; Wed, 11 Jan 2023 12:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=8tRf9V7rx+PjAhpSXrbCvyrfpVCDE16dk/zcrYVGCP8=; b=cBFzir3qWNVTmJ76ZxUDd+sPYf
        HVdYzCT4oClwjAejek3Xa2x820DtvOfUkPrbWRGILQPId1Kl9j5gg6mJJ290swGwIZdu5a51t9gVO
        CClyGp4N26rA2nHXv3dlPtVeYijMdxpTQAfALJwlQ6AfL2mExb91zAvA70KUEMN3UVHJGwDA9Hc5E
        TkdDVwU/1QFxy3ZWNENA8zVZaUCCLfx+fPXux6LUZvQdYFDtRMLOpINXzXMC/W7Nej+c0L0V5+2uC
        SREn1yQ5HmC1/uHGSXbOB6LuGzifBkiP+i13qvJOS+V44DXt73Oior3YSkJCxCLALRYc3oTMEpoZo
        6pCztRug==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
        id 1pFhx1-001Mke-2e
        for linux-alpha@vger.kernel.org;
        Wed, 11 Jan 2023 20:44:00 +0000
Date:   Wed, 11 Jan 2023 20:43:59 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     linux-alpha@vger.kernel.org
Subject: [PATCH] alpha/boot/tools/objstrip: fix the check for ELF header
Message-ID: <Y78fj4jXf5MtLU75@ZenIV>
References: <Y78fXnVzitfpX1Tm@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y78fXnVzitfpX1Tm@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Just memcmp() with ELFMAG - that's the normal way to do it in userland
code, which that thing is.  Besides, that has the benefit of actually
building - str_has_prefix() is *NOT* present in <string.h>.

Fixes: 5f14596e55de "alpha: Replace strncmp with str_has_prefix"
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/boot/tools/objstrip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/boot/tools/objstrip.c b/arch/alpha/boot/tools/objstrip.c
index 08b430d25a31..7cf92d172dce 100644
--- a/arch/alpha/boot/tools/objstrip.c
+++ b/arch/alpha/boot/tools/objstrip.c
@@ -148,7 +148,7 @@ main (int argc, char *argv[])
 #ifdef __ELF__
     elf = (struct elfhdr *) buf;
 
-    if (elf->e_ident[0] == 0x7f && str_has_prefix((char *)elf->e_ident + 1, "ELF")) {
+    if (memcmp(&elf->e_ident[EI_MAG0], ELFMAG, SELFMAG) == 0) {
 	if (elf->e_type != ET_EXEC) {
 	    fprintf(stderr, "%s: %s is not an ELF executable\n",
 		    prog_name, inname);
-- 
2.30.2

