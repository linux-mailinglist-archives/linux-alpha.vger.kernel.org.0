Return-Path: <linux-alpha+bounces-2141-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D1AA92BA7
	for <lists+linux-alpha@lfdr.de>; Thu, 17 Apr 2025 21:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCC47466EF8
	for <lists+linux-alpha@lfdr.de>; Thu, 17 Apr 2025 19:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA7C20013A;
	Thu, 17 Apr 2025 19:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BWHZHfaI"
X-Original-To: linux-alpha@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7F1A926
	for <linux-alpha@vger.kernel.org>; Thu, 17 Apr 2025 19:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744917704; cv=none; b=YooXuMHdYDJFBrEUtbTZOuuMYXJJUvRI5Lr9s9cLbrK4RtIcVhiMI8BSTgsEXCQLg3uLSwCZPATdsgOAj4kQKYtpzV1qVQikXl6+DLxoJ4A4+LtCng+E/rrE1VAk9uL5HNN9nOH7SFK6vjo4QZxYYJmjORuM2VeekQSIKS4Ktxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744917704; c=relaxed/simple;
	bh=QEDo5h9HZXac5uo5Oxegl4cZxwuq6drwyTIoNXKUOW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fHRIac2awycr12jJ8camoDTjpM50k9StnE1b7EZmUD374jsttMHZr5sVXaL7UXkjGgDeN1aOJQSm+ZP30/F8qPipXFCIGlAfjGOAYILrUjxc42BjONLRKXKyeMhQEx5DxYeBYimv31UhpsboOKykQPt844vZOw6U12rbQQlwwAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BWHZHfaI; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744917688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m4nhPsAXq16l8mLZ2dp76RiRIb0Pdz76My5DfrqpHO0=;
	b=BWHZHfaIMXwcSms3RZgM9SPl7nhvp3t7K6eG02JK+9YkLr2+/ItWbAzB3ynV+FZHTybERv
	3N4fflNbIglkt5lFr/q1x3rg9cZvH3uxTNiiRnwKGKOeph3OJ1yA6VgdKs4U6WCWQVMtYd
	/iWO2wvuK2ZqMKPknR8fIhmY6NMf5sk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-hardening@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] smp: Replace deprecated strcpy() with strscpy()
Date: Thu, 17 Apr 2025 21:20:52 +0200
Message-ID: <20250417192054.69663-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() is deprecated; use strscpy() instead.

Link: https://github.com/KSPP/linux/issues/88
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/alpha/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index ed06367ece57..56155b988b9c 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -262,7 +262,7 @@ recv_secondary_console_msg(void)
 
 		cnt = cpu->ipc_buffer[0] >> 32;
 		if (cnt <= 0 || cnt >= 80)
-			strcpy(buf, "<<< BOGUS MSG >>>");
+			strscpy(buf, "<<< BOGUS MSG >>>");
 		else {
 			cp1 = (char *) &cpu->ipc_buffer[1];
 			cp2 = buf;
-- 
2.49.0


