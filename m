Return-Path: <linux-alpha+bounces-2957-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHa/Istjh2knXgQAu9opvQ
	(envelope-from <linux-alpha+bounces-2957-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Sat, 07 Feb 2026 17:09:47 +0100
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B49106781
	for <lists+linux-alpha@lfdr.de>; Sat, 07 Feb 2026 17:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 26D573003BDF
	for <lists+linux-alpha@lfdr.de>; Sat,  7 Feb 2026 16:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D71279908;
	Sat,  7 Feb 2026 16:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWwRA8u9"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAF229D26C
	for <linux-alpha@vger.kernel.org>; Sat,  7 Feb 2026 16:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770480578; cv=none; b=UoOBLaOSr0WutVGPksVI8oAvZxICxsOEV+15jFEAZLIlZoTPADCqz599CFOHuTcMZ4OcCd78pWa/vqpP6TLySxMY4OkoYkW5LdLTHheHJLjUOqaOXq7wJMtC4iGLBlDYv9Ptxnqs79AZATS2MQmTpKbZ/yOm+oIkrsXEElUcPKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770480578; c=relaxed/simple;
	bh=Go6o+fPW2vfcvS7DHrVPUB1C51P0F8I280rZ9fGZJFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ee0CwMNIim3VQxxIj+9GhHKoHeFY32ukwl4uNdIbxhgBUNgbJwX7fATawJaKA5nHICTU7NkCpXemXVUlY4JxdZHgZ4GmY1mh7pvizty77Tz42b17I2cL+zeKbH2L712wgIDdJRbymYvnqtmYKT5atDO+iTCbN/Qbf2d4ZA9jJwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWwRA8u9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so47326115e9.0
        for <linux-alpha@vger.kernel.org>; Sat, 07 Feb 2026 08:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770480576; x=1771085376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zh0gpgjFwNimG3qav3V/O/Bh53M5i2Ji+XR/lDx+9ZI=;
        b=RWwRA8u9yflEh7ctzWU4XW/z29rIJeU9I6iAXB4qow5IofvLXzKSoOmrDOxu28BjCI
         +ubZe4SVGDfA2N9Tvjly3wlp+XIlXLkuJg55zFLAIsVl19V5ixz1MFSgllf28spUyNL8
         Kw3HqzQUGMxIwa1JUgtVWDtjEmj4u6Aj1t3pp7adtwd9Plm2nMxdNhbniYBeXAmQMr1i
         ccYGZ57RMYq68WiplSd6MscI/qYYmwdQmAs1TPjSSdLNev+rKFrjR0bDeDtCX6cVHV9h
         pQHwEgEC4rr/ueFwV7dSNa6+YR+4rtobwEqBpK/F8VQCQu8Mc0bC1oWJTTsRnDIEJrRD
         xTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770480576; x=1771085376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zh0gpgjFwNimG3qav3V/O/Bh53M5i2Ji+XR/lDx+9ZI=;
        b=scFND4APTkEQMFCKywE6/eQwe/HVc3NdITRTyfrmQ45IZlBLK5tA+I2oZ2Bk5UCH64
         4fyah7Oy6EnlwYoEJ5PiZ0CvT4fq0ltmWlIZ1u/eX1DJa8K+F1OQ5TRrpPLeZEDhwPko
         sV+LtztuhFFJxtH/NXIzKxKHM7k7Rql12M+Wnv2AYDHQaeearktUIGWGeStp2Bv0Ar/b
         O8CFgS/G6jCD1XihwGMHR2MnJU22jbRDwv+FswzbnDxQ+cO8H9eFTeXdOMW4yvY4XUsA
         mLOJp689ZQevOlOPxdkG14zYew+kzoR/y/8a754sNo0zWg4+LMEBSKUzkaIV9G40ssM7
         gZKA==
X-Gm-Message-State: AOJu0YwC5EFJ5Vd+NkGJkehiOxbuhB/L7W2sGH1UJ/L2O7j0w5HL4HTr
	ZbnHu9ZSgWBcc2TArXLuwudWxF43RmFJyKnlX8HT7JqTA4jLJg3Nh5MyHFkZZA==
X-Gm-Gg: AZuq6aJxiqNqOoKI+JgNCQQtJ+4iP0379oZMZzsoDY8CWrrsuUyYhMDAyukXLOjxCme
	JhTzhi9BqHtnHya1Vl9rmkOkzANK9LRcWOR8gNO1mwU11lyPaFnFIgM4kd2gd1s76KgmVXZgpNM
	CocyjjSoR2Y4uwwJ9jwoOUDws6ymfdv2GIvjSv4z5YIeJnMXdMTp7epuvV218kqOAjeXNCVJRd7
	0qbsB89A5K51xsLvwfR6Ck0y+v64ftEorSCbqlNf2dFbpljXn69P1DMqJN/mmMmRPomAaSzXvyv
	t26ghcq6OKMay0xNrYUhN07dNNkqWviPr3BYhqegcMUvBJ768yLD9Kq8wvSST0bY6mvnt8XSGY6
	pa4xlwU0Nen2gpwCKWvPhNh8aERX0Vs9KfRA0Y9fRVAcQNCM4FlGyzCwPvxxcVtrRk+aZipEXe5
	jmg59lSQ4=
X-Received: by 2002:a05:600c:3b20:b0:47a:9560:ec28 with SMTP id 5b1f17b1804b1-4832020df6amr83848325e9.13.1770480575641;
        Sat, 07 Feb 2026 08:09:35 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48323c12d74sm77930395e9.2.2026.02.07.08.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 08:09:34 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linmag7@gmail.com,
	linux-kernel@vger.kernel.org,
	macro@orcam.me.uk,
	mattst88@gmail.com,
	patches@lists.linux.dev,
	richard.henderson@linaro.org
Subject: Re: [PATCH v2 0/1] alpha: trivial: remove ^L chars
Date: Sat,  7 Feb 2026 19:09:16 +0300
Message-ID: <20260207160929.705315-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260111112217.2126872-1-safinaskar@gmail.com>
References: <20260111112217.2126872-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2957-lists,linux-alpha=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,orcam.me.uk,lists.linux.dev,linaro.org];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[safinaskar@gmail.com,linux-alpha@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-alpha];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 97B49106781
X-Rspamd-Action: no action

Askar Safin <safinaskar@gmail.com>:
> Remove ^L (a. k. a. \f a. k. a. form feed a. k. a. \x0c) from arch/alpha.

So? You missed this patch?

-- 
Askar Safin

