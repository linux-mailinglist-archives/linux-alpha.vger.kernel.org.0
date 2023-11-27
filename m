Return-Path: <linux-alpha+bounces-96-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E097FA6AC
	for <lists+linux-alpha@lfdr.de>; Mon, 27 Nov 2023 17:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52DB61F20D3C
	for <lists+linux-alpha@lfdr.de>; Mon, 27 Nov 2023 16:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCAC364D7
	for <lists+linux-alpha@lfdr.de>; Mon, 27 Nov 2023 16:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Z87GTetn"
X-Original-To: linux-alpha@vger.kernel.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6AD2CD4E;
	Mon, 27 Nov 2023 06:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=kcr3CAPjvM7RAzYgAV
	J54nu7H1Z0vqjPoUncJfKtUjM=; b=Z87GTetnWsEoVgdzWVhIOC2S0xI0mIKwcC
	LYgbo9nV4S38m82QLn2hy7IZxji1h1HvL3o0jio0U/OGl4VBo9u090Ubmu6yLuM6
	xqjQY7Jxda1IpIGL0v/ckl/Y87eikaDAKENAyhddNS8vq4JLi4yypOluxza2K+nc
	uI1GLDP1k=
Received: from localhost.localdomain (unknown [39.144.190.126])
	by zwqz-smtp-mta-g3-2 (Coremail) with SMTP id _____wCHrzLarGRlak9rEA--.27728S2;
	Mon, 27 Nov 2023 22:51:07 +0800 (CST)
From: Haoran Liu <liuhaoran14@163.com>
To: richard.henderson@linaro.org
Cc: ink@jurassic.park.msu.ru,
	mattst88@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoran Liu <liuhaoran14@163.com>
Subject: [PATCH] alpha: Improve error handling in alpha_rtc_init
Date: Mon, 27 Nov 2023 06:51:03 -0800
Message-Id: <20231127145103.29912-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wCHrzLarGRlak9rEA--.27728S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr4DAry5Zw4kWr1UGFyxGrg_yoW3Gwc_Kr
	1Sv34kWFyxCF4qvF45Aw43Zr4Sya95Krs5tw12qFWjy34fXF1rZ398JF13Xr15GF48CFZ2
	grn8Gryvyr1xKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRZuciUUUUUU==
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/xtbBcgE1gletj1OaTgABs3
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>

This patch enhances the alpha_rtc_init function in
arch/alpha/kernel/rtc.c by adding error handling for the
platform_device_register_simple call.

Signed-off-by: Haoran Liu <liuhaoran14@163.com>
---
 arch/alpha/kernel/rtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/rtc.c b/arch/alpha/kernel/rtc.c
index fb3025396ac9..576397b1fac2 100644
--- a/arch/alpha/kernel/rtc.c
+++ b/arch/alpha/kernel/rtc.c
@@ -209,6 +209,9 @@ alpha_rtc_init(void)
 	init_rtc_epoch();
 
 	pdev = platform_device_register_simple("rtc-alpha", -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
 	rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
-- 
2.17.1


