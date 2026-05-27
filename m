Return-Path: <linux-alpha+bounces-3620-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAfMNqfbFmq2twcAu9opvQ
	(envelope-from <linux-alpha+bounces-3620-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Wed, 27 May 2026 13:55:19 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE6E5E3B8E
	for <lists+linux-alpha@lfdr.de>; Wed, 27 May 2026 13:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37FF33039681
	for <lists+linux-alpha@lfdr.de>; Wed, 27 May 2026 11:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33ADD3D6473;
	Wed, 27 May 2026 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=flyingpenguins.org header.i=@flyingpenguins.org header.b="RQEoWe2f"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-108-mta220.mxroute.com (mail-108-mta220.mxroute.com [136.175.108.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04293BADB4
	for <linux-alpha@vger.kernel.org>; Wed, 27 May 2026 11:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882826; cv=none; b=A3DKSkPid0Yb64L9ftDM+wgb44ueb8V5t6RBwjxhEXHF9SwBcCrqx2Zj+eeuee9bYlEh/HbK7ZGryCECKswO9wNalVeEAd8gFtjWlGvwKvQ2INPTqdc7G3IfEwvd+6Ho9hAbtOhF7ypET08+P3Gd545/aDTYl9iSWRfF3iK8PCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882826; c=relaxed/simple;
	bh=bufws8GZPsUycuvqQbQYM3Dxeu3ssQDIzyzO7EG0OmQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=AJVGOOOpeDN9OzNvBXgvXlYxzb1SNipcVJo0kuRAABBKUPpSF0yYSBnsF2dc7yD5pBzVIY267MW8PeP698rUD5/odTlmFjhzjR7dInURFZIIZHaHn98rczdV5jVInkjy5Z1j9m/UT6m7iy/zhCu5hcZHEOcYh8dhyJRcBoQ7G0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flyingpenguins.org; spf=pass smtp.mailfrom=flyingpenguins.org; dkim=pass (2048-bit key) header.d=flyingpenguins.org header.i=@flyingpenguins.org header.b=RQEoWe2f; arc=none smtp.client-ip=136.175.108.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flyingpenguins.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flyingpenguins.org
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta220.mxroute.com (ZoneMTA) with ESMTPSA id 19e6943c55f00067f7.002
 for <linux-alpha@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 May 2026 11:48:29 +0000
X-Zone-Loop: 304bbc949ad312900b524fc2d6acda21cfd41d5c7e7a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=flyingpenguins.org; s=x; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3N9h/hMjV0+DaALlfOe1P6kSlDXRzwrPqvPgRXIqwqo=; b=RQEoWe2fgO9/9UHb4P4+TTJkom
	O5usR7HESPfvA8LlGUfjtYxswh0HMuQQrXZPRs9eggEXW6YlH2OBoUAhYMPu11HPuf7xfSnF5Whc6
	HFT/JBdp0wLXk67APd/0lYD9Ohs7AwhhBS55dYCAzEnwmXlZY7B8NKQomKjOwHf236BKNtKUMrvFb
	mxwAsoPgCTYqUXz278ywo9eDrbupjQrGDLdU4Snb/uEZRbP8rTMmQ5C83obnQz7HcKzsefx4OlG0U
	L7WSfJ1rZrJg1nJhB0xj+rzVHxCr811lQmABede0hJlJtgrmIjQVe5j+cCPGTXj5myhmWP9N9NCUe
	0uTze+Jw==;
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.10\))
Subject: Re: [PATCH] fix typo in alpha/lib Makefile comment
From: Mike Hlavac <mike@flyingpenguins.org>
In-Reply-To: <ahZGbHHNVIuYyx9t@creeky>
Date: Wed, 27 May 2026 07:48:27 -0400
Cc: linux-alpha@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2AE6EDF5-0D8F-47F9-B9ED-717E666AA193@flyingpenguins.org>
References: <077B8D13-7C98-467C-A6AF-56A8F372B547@flyingpenguins.org>
 <ahZGbHHNVIuYyx9t@creeky>
To: Michael Cree <mcree@orcon.net.nz>
X-Authenticated-Id: mike@flyingpenguins.org
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[flyingpenguins.org : SPF not aligned (relaxed),quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[flyingpenguins.org:s=x];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[flyingpenguins.org:-];
	TAGGED_FROM(0.00)[bounces-3620-lists,linux-alpha=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike@flyingpenguins.org,linux-alpha@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.734];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-alpha];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7DE6E5E3B8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> On May 26, 2026, at 9:18 PM, Michael Cree <mcree@orcon.net.nz> wrote:
>=20
> On Tue, May 26, 2026 at 07:00:34PM -0400, Mike Hlavac wrote:
>> Fix a typo in a comment in arch/alpha/lib/Makefile.  =E2=80=9CIff=E2=80=
=9D -> =E2=80=9Cif"
>>=20
>> Signed-off-by:   Mike Hlavac (Mike@flyingpenguins.org)
>>=20
>> --- /home/griffin/kernel-hacking/alpha-lib-typo/Makefile-orig	=
2026-05-26 14:49:18.246555089 -0400
>> +++ arch/alpha/lib/Makefile	2026-05-26 14:50:32.805555377 -0400
>> @@ -6,7 +6,7 @@
>> asflags-y :=3D $(KBUILD_CFLAGS)
>>=20
>> # Many of these routines have implementations tuned for ev6.
>> -# Choose them iff we're targeting ev6 specifically.
>> +# Choose them if we're targeting ev6 specifically.
>=20
> I wouldn't have called that a typo.  I would take it to be shorthand
> for "if and only if".
>=20
> Cheers,
> Michael.

Interesting.  I withdraw my patch request.=

