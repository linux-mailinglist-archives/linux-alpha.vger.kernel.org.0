Return-Path: <linux-alpha+bounces-3479-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDjWDZTV52nTBQIAu9opvQ
	(envelope-from <linux-alpha+bounces-3479-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Apr 2026 21:52:52 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 915B443F1B1
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Apr 2026 21:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1027305C8D1
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Apr 2026 19:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781E91FBEBC;
	Tue, 21 Apr 2026 19:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCYXlXCD"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541071AAE17;
	Tue, 21 Apr 2026 19:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776801044; cv=none; b=XQ+ox+WpMLEfaj5c9GPQBO+8HG973FRozOhyCf4Ot3wYl2aFO9ASd4Oe/nS2TKbjWpzrw33PV31F6+Xg/594gWXLNNzKuDp86DhSETJV9w/ThmmbfHbGoqb55tOM56tmSpw8UoAoIH8i43+cbskeVBTs1XfD1dOlR4mTjMdA8fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776801044; c=relaxed/simple;
	bh=ooUX033PRSor4DZZcfiE5ZgW5rEzRajyd8nkM8cfXwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQqj4irJYza6QHUwD6oHW5hb0d7d5sEGWnrBs5sc+y5Zw3y/b99p079uQy65kc4aERQQ8ieseTkVnXo77Ny7C4ePCKrbUmBL9YKBQQHk70bMtrEHr2zxlP7Ato6R5w6FI84emHO2v8cAV8PJ5mPCDUgME1LlSvZsWEL9JQ+OAjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCYXlXCD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40D7C2BCB4;
	Tue, 21 Apr 2026 19:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776801044;
	bh=ooUX033PRSor4DZZcfiE5ZgW5rEzRajyd8nkM8cfXwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCYXlXCD5ncatsOJrtdenK4w6lbDvos2aOvw1Vk0DVjK9s1BJl+4Yh6nhtCD21UtX
	 8Aj+jgcfHe7bMH0TJ2A1fuhrgOrVc98OKspi1hYSNiDXiIiTh2NpZ6sR7hga2m7WZD
	 Jf1tUW33tnqt+sKJvc+Ap0ut/TAsl9S+nza2U+lyoKpDN6zKk1UZ9Z4UJKx7wZIPv9
	 NrQhx1+I04JOQ8tzkj56EudFABZqJY0SH6KxkOpwy0iiHexCeWwmyT328QwzyPX9fK
	 7HI4JT4EmPdwn0qnOtYTgeWILzZNoGhCIOc6nQY2448nY4xnBw4Mk8bwW6WXMXMI9N
	 CqS5bIo6A0CEg==
Date: Wed, 22 Apr 2026 04:50:42 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Christophe Leroy <chleroy@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Dexuan Cui <decui@microsoft.com>,
	Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Lukas Wunner <lukas@wunner.de>,
	Oliver O'Halloran <oohall@gmail.com>,
	Saurabh Singh Sengar <ssengar@microsoft.com>,
	Shuan He <heshuan@bytedance.com>,
	Srivatsa Bhat <srivatsabhat@microsoft.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 11/23] alpha/PCI: Add security_locked_down() check to
 pci_mmap_resource()
Message-ID: <20260421195042.GD1684602@rocinante>
References: <20260416180107.777065-1-kwilczynski@kernel.org>
 <20260416180107.777065-12-kwilczynski@kernel.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416180107.777065-12-kwilczynski@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3479-lists,linux-alpha=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,linux.intel.com,vger.kernel.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kwilczynski@kernel.org,linux-alpha@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-alpha];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 915B443F1B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

> @@ -71,7 +72,11 @@ static int pci_mmap_resource(struct kobject *kobj,
>  	struct resource *res = attr->private;
>  	enum pci_mmap_state mmap_type;
>  	struct pci_bus_region bar;
> -	int i;
> +	int i, ret;
> +
> +	ret = security_locked_down(LOCKDOWN_PCI_ACCESS);
> +	if (ret)
> +		return ret;

There is feedback from Sashiko about this:

  https://sashiko.dev/#/patchset/20260416180107.777065-1-kwilczynski%40kernel.org?part=11

Might be something to look into later.  Out of scope for this series.

Thank you!

	Krzysztof

