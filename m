Return-Path: <linux-alpha+bounces-3553-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNiECcnD8mkjuAEAu9opvQ
	(envelope-from <linux-alpha+bounces-3553-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Thu, 30 Apr 2026 04:51:53 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 991CF49C90D
	for <lists+linux-alpha@lfdr.de>; Thu, 30 Apr 2026 04:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85FE93023DA8
	for <lists+linux-alpha@lfdr.de>; Thu, 30 Apr 2026 02:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32312332EAC;
	Thu, 30 Apr 2026 02:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DnDKlg3e"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1EC27CB35;
	Thu, 30 Apr 2026 02:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777517491; cv=none; b=a0oQH4uWl6G0dCadsQAHN2LhBag044OpQZZTQ25vbs2NTbtZuvMtPkNykxlroPhuCHLVlzu13QmEEMSLtgG7Dp7F4+FtuA0tHUeoBhBozmjUE7nbTM23khEkUk2RRnaK9nPRIuC0OhuovuHHqh+NNgUnB3QzGuK66JT5MM8Sdn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777517491; c=relaxed/simple;
	bh=rIRCNcazwtx/16LQtiNpVTsW/tJ6F6VdllcASy+OcwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzYZYQ4EX/XCVNYYN6k/iMLurGrhgVoO5/uU83r+XBYp/UR101ucXP9HFyj40KZF3kbM6ouUTU3PWTwmjdF5u6CtG1TGNPSdNdTXzA/0Y4o/c/IpTmfnMtHxj6myY1/ixggqoYbpW5kA792G9Vh8CnoBpazEzXDdwW37qkG41PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DnDKlg3e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6B0C19425;
	Thu, 30 Apr 2026 02:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777517490;
	bh=rIRCNcazwtx/16LQtiNpVTsW/tJ6F6VdllcASy+OcwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DnDKlg3eXCjhTyZNnSikiqYO9CladC/9RYhcZIUp/WOWJx2QSjoyXMiDS0IvVFmMu
	 RAYvV/p/0ssidiphG7YgFpHqMlnFY9TIMqyJ0u+lMmGkHzrJp8w1OdfBaBXE8UMRu4
	 FmpwK5HVtlqHFrsXS3bFv0yTh9ZyBguA/GIGuj9Sppeo1PFvETXF0jwp9wIpU6LtmV
	 UOb0vka5BrX2x2lQkpSMWXqk5BVBIX/U8K5S3zVjKa9jCpagkkT0KhUV861EX9Wsks
	 NlkMZ3RbQ7pdRPGhwESVDf38PBSM6lH0xpuaCbagRrVEREGO8oCJ4GQF4lkiQFcq8w
	 +ctrgendZ886w==
Date: Thu, 30 Apr 2026 11:51:28 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Christophe Leroy <chleroy@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Dexuan Cui <decui@microsoft.com>, 
	Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, Lukas Wunner <lukas@wunner.de>, 
	Oliver O'Halloran <oohall@gmail.com>, Saurabh Singh Sengar <ssengar@microsoft.com>, 
	Shuan He <heshuan@bytedance.com>, Srivatsa Bhat <srivatsabhat@microsoft.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 24/24] PCI/sysfs: Limit BAR resize attribute scope to
 platforms with PCI mmap
Message-ID: <20260430020648.GA3923076@rocinante>
References: <20260422161407.118748-25-kwilczynski@kernel.org>
 <20260429204932.GA318462@bhelgaas>
 <20260429212749.GB3724801@rocinante>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429212749.GB3724801@rocinante>
X-Rspamd-Queue-Id: 991CF49C90D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3553-lists,linux-alpha=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,linux.intel.com,vger.kernel.org,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kwilczynski@kernel.org,linux-alpha@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-alpha];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_DN_SOME(0.00)[]

Hello,

> The only platform without these aforementioned defines is Alpha, which is
> conventional PCI only and cannot have ReBAR.  So this guard removes dead
> sysfs code on platforms where it can never be executed.

Having a closer look:

  resource_resize_attr_is_visible()
    pci_rebar_get_current_size()      <- returns -ENOTSUPP, so is_visible callback returns 0
      pci_rebar_find_pos()
        pos = pdev->rebar_cap         <- set to 0 on a conventional PCI
        if (!pos)
          return -ENOTSUPP            <- no ReBAR support

The pdev->rebar_cap is set during PCI enumeration:

  pci_init_capabilities()
    pci_rebar_init()
      pdev->rebar_cap = pci_find_ext_capability()
        pci_find_next_ext_capability()
          if (dev->cfg_size <= PCI_CFG_SPACE_SIZE)
            return 0;                 <- dev->cfg_size set to 256 here for conventional PCI

The PCI_CFG_SPACE_SIZE is 256 here.

When the platform has support for PCI Express, the dev->cfg_size is then
set to 4096.  On an architecture that supports conventional PCI only (such
as Alpha), the pdev->rebar_cap will be set to 0, the is_visible callback
will then return 0, and the resize sysfs attribute is never created, as
such, the __resource_resize_store() callback will never be executed.

To make the connetion here to the #ifdef guards:

For the pci_rebar_get_current_size() to return >= 0, the device needs
PCI Express and extended configuration space support.  As of today,
every architecture with PCI Express support defines HAVE_PCI_MMAP or
ARCH_GENERIC_PCI_MMAP_RESOURCE.

I hope the reasoning here works.

Thank you!

	Krzysztof

