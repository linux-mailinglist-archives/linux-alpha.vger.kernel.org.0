Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1FC6664F3
	for <lists+linux-alpha@lfdr.de>; Wed, 11 Jan 2023 21:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbjAKUo3 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 11 Jan 2023 15:44:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232233AbjAKUo1 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 11 Jan 2023 15:44:27 -0500
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71388193F5
        for <linux-alpha@vger.kernel.org>; Wed, 11 Jan 2023 12:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=+FHbMOlIlsp5eH3GhFLAgB53zv/sJzBS5sCRMc8EflM=; b=h6ZYKv+4pC7upad7snxOSIuj8i
        tzEJNACMZNqgRjJBTfX0IdqH/VS0c6RmMd9CN0it94DByTFozoRVTMyPlPCrDkzhs2sGAT/SiFeWZ
        gtr5Edi4JIZM0nnwn4ddvk8W2ahWFakvHN3dW0S2Kvs2Gb1hxTYPAegeywkMeKFaIpIdp2/VLKScO
        bNqQ3H8vqur7ZxIcfhgmjbb2K6SBUIV7YvNfvNjbzItHSRn6WMT47OmrpG/CX0Wm5gpin6n68ChQj
        Pg0Pu8HeA1v3JbnGnG+FepfZw1fW5IiL4Ri/OfPSN3UhNaw5UDO/Mbs/8Hrp3pHTyvnYMV6U25P0t
        nlSBI6vQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
        id 1pFhxR-001Mks-35
        for linux-alpha@vger.kernel.org;
        Wed, 11 Jan 2023 20:44:26 +0000
Date:   Wed, 11 Jan 2023 20:44:25 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     linux-alpha@vger.kernel.org
Subject: alpha/boot/misc: trim unused declarations
Message-ID: <Y78fqZ8BqNWiJC/a@ZenIV>
References: <Y78fXnVzitfpX1Tm@ZenIV>
 <Y78fj4jXf5MtLU75@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y78fj4jXf5MtLU75@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

gzip_mark() and gzip_release() are gone; there used to be two
forward declarations of each and the patch removing those suckers
had left one of each behind...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/boot/misc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/boot/misc.c b/arch/alpha/boot/misc.c
index 325d4dd4f904..1ab91852d9f7 100644
--- a/arch/alpha/boot/misc.c
+++ b/arch/alpha/boot/misc.c
@@ -89,8 +89,6 @@ static ulg output_ptr;
 static ulg bytes_out;
 
 static void error(char *m);
-static void gzip_mark(void **);
-static void gzip_release(void **);
 
 extern int end;
 static ulg free_mem_ptr;
-- 
2.30.2

