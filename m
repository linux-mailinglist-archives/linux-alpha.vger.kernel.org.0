Return-Path: <linux-alpha+bounces-3739-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hzGcBezwS2qIdQEAu9opvQ
	(envelope-from <linux-alpha+bounces-3739-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Mon, 06 Jul 2026 20:16:12 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DB07145F4
	for <lists+linux-alpha@lfdr.de>; Mon, 06 Jul 2026 20:16:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="e14/gzWo";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-alpha+bounces-3739-lists+linux-alpha=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-alpha+bounces-3739-lists+linux-alpha=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD751308FFBB
	for <lists+linux-alpha@lfdr.de>; Mon,  6 Jul 2026 17:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EDC41DEDC;
	Mon,  6 Jul 2026 17:59:40 +0000 (UTC)
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7DD3BADA2;
	Mon,  6 Jul 2026 17:59:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360780; cv=none; b=NGp+KYPQ5sWecfyUl7iJJw4VCzzL0+DW7e0lvRPr1dkP0ZyM2dV29yDBJSQcxeEvtL53MKJJis5KqDtnff8cqCFe9vZQEenI1Dxbu1jStnklr6UgJkHL9AHehx/Dm3+DGTS74FrVpiqHZUsDKq60v7pPG2cSfTFX0rY4tN+wwac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360780; c=relaxed/simple;
	bh=WIYEhUw3d4RKjlE0gxYRgjzRAxb2z61qwjDGfTaBUZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPpY7cmdK+sLP77jMh7XreVcpomXm5AaXH1j2Xad6JSKifof3H+wx+xLspGH5qTvWQSlwY1hI9mUSPp2mpJ5rY0t57AyaSb/GA0YMR8Rqm/MqC8Itjc9gcOh96TT5mLjD8jE6TRxyT19TRgSV4d6B6dvJTurTwX4F72tLUnSgn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e14/gzWo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCFF1F000E9;
	Mon,  6 Jul 2026 17:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360778;
	bh=HmJC/8vvDL2HoOKSt77yU01Xd8+oFpwXQVS5MUC1ip4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e14/gzWo6xW3YOVH51Kits+m+wP2GGjgCPTFCZzuQY2e4zbXL/oW0CbOJFthhXV6W
	 TH/fIo4ygI1HJ2OEZJ+m8tmUalcJDi+rjiPiAAU6xkaqavP3GELwrAB/tugOUc6nm0
	 pOxxaO6ql7oe0jGraejMO3iq+bl2FyOjkcYRL6+/8L7Z8WD78Kp+gHBD8R5kCGA0xM
	 W0u6YoEvDio+HO1z6tbnV8plCvPwugzTqZFAzPUPINGUlOSK1DU4mEJIpV6awT4/2M
	 rXLjKkIyroNo3Q5IPiKbUzUThbfBGIa7YUUeW513KasCfefHfz065nMGrxrDPQfjs3
	 aQJA7FFNz4K3Q==
Date: Tue, 7 Jul 2026 02:59:36 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Christophe Leroy <chleroy@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Dexuan Cui <decui@microsoft.com>, Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, 
	Lukas Wunner <lukas@wunner.de>, Oliver O'Halloran <oohall@gmail.com>, 
	Saurabh Singh Sengar <ssengar@microsoft.com>, Shuan He <heshuan@bytedance.com>, 
	Srivatsa Bhat <srivatsabhat@microsoft.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 00/25] PCI: Convert all dynamic sysfs attributes to
 static
Message-ID: <20260706175653.GB265195@rocinante>
References: <20260619085200.3729431-1-kwilczynski@kernel.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619085200.3729431-1-kwilczynski@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:helgaas@kernel.org,m:mani@kernel.org,m:lpieralisi@kernel.org,m:alex@shazbot.org,m:linmag7@gmail.com,m:mattst88@gmail.com,m:richard.henderson@linaro.org,m:chleroy@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:decui@microsoft.com,m:khalasa@piap.pl,m:lukas@wunner.de,m:oohall@gmail.com,m:ssengar@microsoft.com,m:heshuan@bytedance.com,m:srivatsabhat@microsoft.com,m:ilpo.jarvinen@linux.intel.com,m:linux-pci@vger.kernel.org,m:linux-alpha@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[kwilczynski@kernel.org,linux-alpha@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-3739-lists,linux-alpha=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kwilczynski@kernel.org,linux-alpha@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,shazbot.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,linux.intel.com,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-alpha];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rocinante:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06DB07145F4

Hello,

> Changes in v8:
>   https://lore.kernel.org/linux-pci/20260508043543.217179-1-kwilczynski@kernel.org/
> 
>   - Renamed the generic resource attributes from dev_resourceN_{io,uc,wc}_attr
>     to pci_dev_resourceN_{io,uc,wc}_attr, for consistency, and cleaned up
>     resource macros definitions.
>   - Changed resource macros argument order to fix checkpatch.pl
>     complaint.
>   - Added two new macros, pci_legacy_resource_io_attr() and
>     pci_legacy_resource_mem_attr(), used for the legacy I/O and memory
>     conversion instead of open-coding each struct bin_attribute.  No
>     functional changes intended.

I will send a follow-up patch with the above changed, mainly to
clean the code up, as v8 didn't made it in time before the merge
window closed.  There were no functional changes.

Thank you!

	Krzysztof

