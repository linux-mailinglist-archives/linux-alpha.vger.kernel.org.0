Return-Path: <linux-alpha+bounces-3661-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NNu3GXIQLmqxpAQAu9opvQ
	(envelope-from <linux-alpha+bounces-3661-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Sun, 14 Jun 2026 04:22:42 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C5D680405
	for <lists+linux-alpha@lfdr.de>; Sun, 14 Jun 2026 04:22:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=orcon.net.nz header.s=s1 header.b=jyQ6ZAyW;
	spf=pass (mail.lfdr.de: domain of "linux-alpha+bounces-3661-lists+linux-alpha=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-alpha+bounces-3661-lists+linux-alpha=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=orcon.net.nz (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05FDB30039BC
	for <lists+linux-alpha@lfdr.de>; Sun, 14 Jun 2026 02:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F04084039;
	Sun, 14 Jun 2026 02:22:36 +0000 (UTC)
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp-3.orcon.net.nz (smtp-3.orcon.net.nz [60.234.4.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB42C212566;
	Sun, 14 Jun 2026 02:22:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781403756; cv=none; b=pneDK++dFgQduP56ms4v/V2JadbwtoK8IiZJSageRzpQEWc6Vnqeu/GF0/Mgz7RJNMi6Z3lC8nV2IgecxTGnrUcj+GG3t3I7NmCeLltgIhf7uay2p9/LPwms584H44LoXFJWoMZtV6SfyCMiAP5GtXS6qCI1RangUl5uWRqHzDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781403756; c=relaxed/simple;
	bh=v/+NupT1tX8UuyPxdFZ6ESTy3ZuqZcSbCDJ6JvaDy5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3Sg/IuDefzcqVjJ7MtU3PF9e8OXbYsCKr0IxLsUApalSYFAFwrT4OlFe/OFIKM8WscqwABUgSeHVbpqRgDJe/TXHbDvJ5qAM7qDt8K8Ovn7yP7F6SheMyOiYrE3f+XbXnGnZq1TG+u4rqoEp0RjYexVcJsWZBZoiQ0ds92tEVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz; spf=pass smtp.mailfrom=orcon.net.nz; dkim=pass (2048-bit key) header.d=orcon.net.nz header.i=@orcon.net.nz header.b=jyQ6ZAyW; arc=none smtp.client-ip=60.234.4.44
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=orcon.net.nz; s=s1; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Fv/T+krM1NU6y0WWahYchqiFV5uKIKb1LnSrxym/Wnw=; b=jyQ6ZAyW1eZnZvTTIf3lhurfRa
	cerVS2vXpGwSTSdEBAOiaVzwvF9VjzYh594kR0Q2Yf2wVKlMYMBbgxj3y8itJ2/GEXOmI81YmB05K
	jTIoQFL44WH/SprQzhfnBwy/5Jri1xr9KOo4OLnjmFo1SvqIi2NQwCuPB0Ew7AE4eAbQRQ25uPyju
	/k8JTCFVaII6jYLDXscK+96yCAvZe873Fumtyg/diY/WXXgjw1tLmLCM7pmBE4+/Z//dLI2qUC+CW
	PNCyxYqg72Cw0odRk1AeDRx0qaL7fQhKZTjn6My3sfK2m/79rKpuCi2vcC8u7kasuEMKyGA4JRP9v
	pBYRhxmQ==;
Received: from [121.99.247.178] (port=58657 helo=creeky)
	by smtp-3.orcon.net.nz with esmtpa (Exim 4.90_1)
	(envelope-from <mcree@orcon.net.nz>)
	id 1wYZoR-0005R7-BA; Sun, 14 Jun 2026 13:38:59 +1200
Date: Sun, 14 Jun 2026 13:38:54 +1200
From: Michael Cree <mcree@orcon.net.nz>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, mattst88@gmail.com,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	glaubitz@physik.fu-berlin.de, ink@unseen.parts, macro@orcam.me.uk
Subject: Re: [PATCH v3 0/8] alpha: enable generic entry infrastructure
Message-ID: <ai4GLtp1Iaqz_aVK@creeky>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
	Magnus Lindholm <linmag7@gmail.com>, richard.henderson@linaro.org,
	mattst88@gmail.com, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de,
	ink@unseen.parts, macro@orcam.me.uk
References: <20260612203006.2265557-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612203006.2265557-1-linmag7@gmail.com>
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	R_DKIM_REJECT(1.00)[orcon.net.nz:s=s1];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[orcon.net.nz : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3661-lists,linux-alpha=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linmag7@gmail.com,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-alpha@vger.kernel.org,m:glaubitz@physik.fu-berlin.de,m:ink@unseen.parts,m:macro@orcam.me.uk,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mcree@orcon.net.nz,linux-alpha@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,vger.kernel.org,physik.fu-berlin.de,unseen.parts,orcam.me.uk];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcree@orcon.net.nz,linux-alpha@vger.kernel.org];
	DKIM_TRACE(0.00)[orcon.net.nz:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-alpha];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1C5D680405

On Fri, Jun 12, 2026 at 10:26:48PM +0200, Magnus Lindholm wrote:
> This series moves Alpha closer to the common architecture infrastructure
> and enables GENERIC_ENTRY and GENERIC_IRQ_ENTRY. This is v3 of this patch
> series, please see below for changes since v1 and v2.

I am seeing sporadic Xorg crashes with this patchset applied to a 7.0
stable series kernel, usually within a minute of logging into the
desktop. The rest of system keeps running fine and there are no
messsages in the kernel log.  I am testing on an XP1000 with Radeon
HD4350 graphics card.  The same kernel without this patchset works
fine -- no Xorg crashes.  Indeed, it has been playing the dulcet
tones of Pink Floyd through my sound system for the last hour without
a problem.

Example Xorg backtrace follows.  In this case it is a fp exception
but sometimes it is a segfault:

[   307.748] (EE) 
[   307.748] (EE) Backtrace:
[   307.750] (EE) 0: /usr/lib/xorg/Xorg (xorg_backtrace+0x7c) [0x12022b3dc]
[   307.750] (EE) 1: /usr/lib/xorg/Xorg (0x120000000+0x230ae8) [0x120230ae8]
[   307.751] (EE) 2: /usr/lib/alpha-linux-gnu/libc.so.6.1 (0x20000720000+0x49e70) [0x20000769e70]
[   307.753] (EE) 3: /usr/lib/alpha-linux-gnu/libc.so.6.1 (0x20000720000+0x1a02e0) [0x200008c02e0]
[   307.753] (EE) 4: /usr/lib/alpha-linux-gnu/libpixman-1.so.0 (pixman_sample_ceil_y+0xbc) [0x200003472fc]
[   307.755] (EE) 5: /usr/lib/alpha-linux-gnu/libpixman-1.so.0 (pixman_rasterize_trapezoid+0xec) [0x20000347abc]
[   307.755] (EE) 6: /usr/lib/xorg/modules/libglamoregl.so (0x20003d30000+0x6c5bc) [0x20003d9c5bc]
[   307.755] (EE) 7: /usr/lib/xorg/Xorg (CompositeTrapezoids+0xb0) [0x12016a290]
[   307.756] (EE) 8: /usr/lib/xorg/Xorg (0x120000000+0x16fa04) [0x12016fa04]
[   307.758] (EE) 9: /usr/lib/xorg/Xorg (0x120000000+0x16a6c8) [0x12016a6c8]
[   307.758] (EE) 10: /usr/lib/xorg/Xorg (0x120000000+0x58578) [0x120058578]
[   307.758] (EE) 11: /usr/lib/xorg/Xorg (0x120000000+0x5d978) [0x12005d978]
[   307.760] (EE) 12: /usr/lib/xorg/Xorg (0x120000000+0x3f9b8) [0x12003f9b8]
[   307.762] (EE) 13: /usr/lib/alpha-linux-gnu/libc.so.6.1 (0x20000720000+0x2e490) [0x2000074e490]
[   307.763] (EE) 14: /usr/lib/alpha-linux-gnu/libc.so.6.1 (__libc_start_main+0xc4) [0x2000074e5d4]
[   307.763] (EE) 15: /usr/lib/xorg/Xorg (__start+0x38) [0x12003fa08]
[   307.763] (EE) 
[   307.765] (EE) Floating point exception at address 0x200008c02e0
[   307.765] (EE) 
Fatal server error:
[   307.765] (EE) Caught signal 8 (Floating point exception). Server aborting

Cheers,
Michael.

