Return-Path: <linux-alpha+bounces-3840-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w/rdDOxXUWp1CwMAu9opvQ
	(envelope-from <linux-alpha+bounces-3840-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Jul 2026 22:37:00 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A681D73E6A1
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Jul 2026 22:36:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IrvND1j+;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-alpha+bounces-3840-lists+linux-alpha=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-alpha+bounces-3840-lists+linux-alpha=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8B293040CB2
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Jul 2026 20:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5A6386C0C;
	Fri, 10 Jul 2026 20:32:56 +0000 (UTC)
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB8A1C3BF7;
	Fri, 10 Jul 2026 20:32:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783715576; cv=none; b=rK43TXsO1Nw8xziFEMyABq+aZEauyVA7M6vQcDsWZfCY7BtdHw6lAHk4kTsXxSKWuiGSUqp7eOLnSG8Dtk0qtzfiX8+ubEtLA6fGkq3tLlSPsUYVAgZFKBi+eDNNRmm1HU3OtYazLoJoDw1e1qEX/ObA4dnphWdtE1MK3VeCauA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783715576; c=relaxed/simple;
	bh=FSy4jwxyQ59esSyBRhQmrEfTjzZcMjXq41qYxVIJ5QA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=iIfOxLuACT8ztbZHUGx/bcElbJvhFbG7W9VMNv/BZTVaYrAZl+hdes55POuci6YxEVggSvE+JI1dFA2Z30tij7hslLbdmZxbMGwrK0EgHZ0uWYCi+0/e7aNimE2+6tsG1kPzwxeLFj19Eb1eToOww5ThswdI6fJV25bNN1MTaiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IrvND1j+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F15E1F000E9;
	Fri, 10 Jul 2026 20:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783715575;
	bh=b11VeVAjomHNx2suD7mMVJxmSoUMdq9YZhyW8JZN954=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=IrvND1j+0x6bspf50eB7800KJZ+zfhPj6fLZkVRLzEPTPfqhGrmPPGL+oWwSUx1Yt
	 uvJKuHoH40HgbaaC+wIeo9TDx7KXrBU7EEfikQXho7Y5hx5LgGMRVgCl2TwIem1C9d
	 i29rlcyFWdLTH5r7rDUdaHzathV0YTipmThI96rjU+UP2q1CMDJD4q0aRTpHen80Oj
	 QfeD+bjqGwwBwmhJlSSWx5TvWS6TU5fB86zBriOtPoik8DkR7WVNUNh0wN/FmwxP0B
	 tfG3aa3Au7q0j8VM72LGjcn0FfN/qM2D+r+i3KLNmQGiya4WysCwjqas+Hu4KhlyJa
	 OBToKH/4FpSnQ==
Date: Fri, 10 Jul 2026 15:32:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Jesse Barnes <jbarnes@virtuousgeek.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-alpha@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] alpha/PCI: Fix I/O port accessor argument order in
 pci_legacy_write()
Message-ID: <20260710203254.GA993990@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706175423.98305-1-kwilczynski@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3840-lists,linux-alpha=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,jurassic.park.msu.ru,virtuousgeek.org,google.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kwilczynski@kernel.org,m:richard.henderson@linaro.org,m:linmag7@gmail.com,m:mattst88@gmail.com,m:ink@jurassic.park.msu.ru,m:jbarnes@virtuousgeek.org,m:bhelgaas@google.com,m:linux-alpha@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linux-alpha@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-alpha@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-alpha];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bhelgaas:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A681D73E6A1

On Mon, Jul 06, 2026 at 05:54:23PM +0000, Krzysztof Wilczyński wrote:
> pci_legacy_write() in arch/alpha/kernel/pci-sysfs.c passes its arguments
> to outb(), outw() and outl() in the wrong order:
> 
>   outb(port, val);
> 
> The Alpha I/O accessors in arch/alpha/include/asm/io.h take the value
> first and the port second:
> 
>   extern void outb(u8 b, unsigned long port);
> 
> So the port number is written as data to the I/O address taken from the
> user-supplied value, and the intended write to the requested port never
> happens.
> 
> The arguments have been reversed since the file was added, and the
> function returns the access size regardless, so the caller sees success
> while the requested port is left untouched.
> 
> Fixes: 10a0ef39fbd1 ("PCI/alpha: pci sysfs resources")
> Tested-by: Magnus Lindholm <linmag7@gmail.com>
> Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>

Applied to pci/sysfs for v7.3, thank you!

> ---
> Changes in v2:
>  https://lore.kernel.org/linux-pci/20260612232400.585195-1-kwilczynski@kernel.org/
> 
>  - Collected Reviewed-by and Tested-by tags from Magnus Lindholm.
> 
>  arch/alpha/kernel/pci-sysfs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.c
> index 94dbc470cd6c..7050f0f7fe3d 100644
> --- a/arch/alpha/kernel/pci-sysfs.c
> +++ b/arch/alpha/kernel/pci-sysfs.c
> @@ -224,17 +224,17 @@ int pci_legacy_write(struct pci_bus *bus, loff_t port, u32 val, size_t size)
>  
>  	switch(size) {
>  	case 1:
> -		outb(port, val);
> +		outb(val, port);
>  		return 1;
>  	case 2:
>  		if (port & 1)
>  			return -EINVAL;
> -		outw(port, val);
> +		outw(val, port);
>  		return 2;
>  	case 4:
>  		if (port & 3)
>  			return -EINVAL;
> -		outl(port, val);
> +		outl(val, port);
>  		return 4;
>  	}
>  	return -EINVAL;
> -- 
> 2.55.0
> 

