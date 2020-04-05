Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41DBD19ED6D
	for <lists+linux-alpha@lfdr.de>; Sun,  5 Apr 2020 20:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgDESt4 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 5 Apr 2020 14:49:56 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40011 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgDEStz (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Sun, 5 Apr 2020 14:49:55 -0400
Received: by mail-pg1-f195.google.com with SMTP id c5so591405pgi.7
        for <linux-alpha@vger.kernel.org>; Sun, 05 Apr 2020 11:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z2U36IISqiR++RgOtOmUdkahCg0qsGx0ff3vJaea/sA=;
        b=PU21hskpNExrXOcX1tjz5p2qLBW47yseY+oMwaONEvJkhGUpeSEFHPqK0FO8CuO5Ae
         jXooUzbIaejDRmakDet8XO2MP8kPjJ97KjL7leVC91KQ+I+8Dza5EuDf+p3NQphyYNyB
         U1dqsnxJWumHQV1M4HBWWwRVffB0fIWHxSRcdf/1Qzbs0u6OnIk5xBjGNoJAaSy9kouU
         xqqDG0JEt4RGt6Fz5YMAvb95aJ8FD7/Tx6wl3DUzAqBozD3YVHjuMGit1KZQ1TUAj7P7
         AfQwu2MwGGhOiDqm58p88UqLYhvpy4kb8ugPEqYVn9bDnzMuNIzaJ1NBXzVVp9bq3h07
         8skA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z2U36IISqiR++RgOtOmUdkahCg0qsGx0ff3vJaea/sA=;
        b=rtB76aMHP+WIdgLM2mz/BcMKLRepBF5UffPNQOyoDyDxClBcA1WhZ+RsaXRIl+yz7P
         0I8bWpPLqmfdUHhad6N9lTefVnSwDyQRYNeoEyVGXMa5E+BrUDiOi8KLUowz/VXo/0mz
         m83m65RNUjyjASaXEi4oq6Ch931mroeuKOyqQkxBawcMz2sMKjOcWOdKWiq2AeXQU26l
         4wL7khRmoXcYOxPdfmpXJGWdGppluE3TDmQgZrt1F0dlUyoJ36qS7jaYYkZUPuPG4fFY
         bM/z8Y+kLPbC2QZOiWz4Z1JWEyGbQLlQkuZT+8cJ7kLdZgo1HjADYRFqSC1b0infJDLa
         KChQ==
X-Gm-Message-State: AGi0PuYZwYylnDSl4lVWYyGup9HYU4WUfI0hQi4u4wzXyOpfwrhun8bx
        SEgXrSKWoyHr8Da5UItG5a2jQy/d
X-Google-Smtp-Source: APiQypJHOBlkzmUzH8398+l3cgGOJPAhafofKw71/W+IJ1vxk+d5pjPyR0pUuXVvGp26KIM1EuB2UQ==
X-Received: by 2002:a62:3487:: with SMTP id b129mr18275536pfa.150.1586112593860;
        Sun, 05 Apr 2020 11:49:53 -0700 (PDT)
Received: from localhost ([108.161.26.224])
        by smtp.gmail.com with ESMTPSA id p7sm10619452pjp.1.2020.04.05.11.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:49:53 -0700 (PDT)
From:   Matt Turner <mattst88@gmail.com>
To:     linux-alpha@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Matt Turner <mattst88@gmail.com>
Subject: [PATCH 2/5] silo: Build with -U_FORTIFY_SOURCE
Date:   Sun,  5 Apr 2020 11:48:55 -0700
Message-Id: <20200405184858.3963582-2-mattst88@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200405184858.3963582-1-mattst88@gmail.com>
References: <20200405184858.3963582-1-mattst88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Otherwise the build will fail:

| ld: decompnet.o: in function `error':
| decomp.c:(.text+0x4dc): undefined reference to `__longjmp_chk'

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 Rules.make | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Rules.make b/Rules.make
index 3d0efe7..9739f7a 100644
--- a/Rules.make
+++ b/Rules.make
@@ -19,7 +19,8 @@ cc-option-yn = $(shell if $(CC) $(CFLAGS) $(1) -S -o /dev/null -xc /dev/null \
 		> /dev/null 2>&1; then echo "y"; else echo "n"; fi;)
 
 CFLAGS = -Os -Wall -I. -I../include -fomit-frame-pointer \
-	-fno-strict-aliasing -fno-PIC -DSMALL_RELOC=$(SMALL_RELOC) \
+	-fno-strict-aliasing -fno-PIC -U_FORTIFY_SOURCE \
+	-DSMALL_RELOC=$(SMALL_RELOC) \
 	-DLARGE_RELOC=$(LARGE_RELOC)
 HOSTCFLAGS = -O2 -Wall
 
-- 
2.24.1

