Return-Path: <linux-alpha+bounces-3558-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dZVBL8Vo+mlXOwMAu9opvQ
	(envelope-from <linux-alpha+bounces-3558-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Wed, 06 May 2026 00:01:41 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB2B4D427E
	for <lists+linux-alpha@lfdr.de>; Wed, 06 May 2026 00:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71C6A300F1A7
	for <lists+linux-alpha@lfdr.de>; Tue,  5 May 2026 22:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8D41DED5C;
	Tue,  5 May 2026 22:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rbn9wVta"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5EE15FA81;
	Tue,  5 May 2026 22:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778018497; cv=none; b=f/Lg8szbykBnT8nbX6NC1xlBnICBn7JRqW+xbX2u0s627mOsABQBVrHihLos7m/qaCPAtbgJvp95CwtzIZDpmignOXCUSQ7/MMIEzYGGWr2lIRUcsPtQCeG7NGtiQ3eODrfupz9jlHbwnA23S6TgHgh9w4gsamKRJO7M4+Hv1H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778018497; c=relaxed/simple;
	bh=yoBr7Mc6YP4qh9ut6jZz/k1ucywWcKVN90W+9f643uc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=j+8pKlAWEuLZW6Gtpm+N8QbY6eRGR7CtOgqPgCOFtvTSr7d0Pa0Y9xPokENOeoAft5HHirXTK3Y3VsX2z8tB2dudcnv9rJ7wR3WR+m3KQG7XNno9hS8xyklKXOT5A8ALwPk78X4EAnrKZWfaGar8WrZNJw8C1wYyXZvweiMQY0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rbn9wVta; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC37EC2BCB4;
	Tue,  5 May 2026 22:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778018496;
	bh=yoBr7Mc6YP4qh9ut6jZz/k1ucywWcKVN90W+9f643uc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Rbn9wVta9ZpFa3gloLjf8OG00h+Ic96IkFvu93L7ctXC5FF0RpGCZNidThuaa0rr/
	 rGNBNcVlkxEg1LlmiGrwBAKKF9F9uesOligMCEm/cWzo3itw0T9Xm1zGueC/sIMpN7
	 WmVIeDdKPxbjtKzMJKHZB4xMeCBlFz2ujFMq2maXFousSJk7P/aiA5W1csqtcB6cDL
	 Gj3A4KNfTeNT5MhOBJTydLrEsaR5ffZSMGoJCYHg1+AALROdw80fqX7F6wA4GZPUzZ
	 /IfWC+F7NFP4PxAIZeMdhyVFKE2iOVwVvvo2o/xmF0yjit1v+LBSkudPvlywbvnI3M
	 6P+YZQKv97dlg==
Date: Tue, 5 May 2026 17:01:35 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: Re: [PATCH v6 24/24] PCI/sysfs: Limit BAR resize attribute scope to
 platforms with PCI mmap
Message-ID: <20260505220135.GA752411@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260430020648.GA3923076@rocinante>
X-Rspamd-Queue-Id: 2DB2B4D427E
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
	TAGGED_FROM(0.00)[bounces-3558-lists,linux-alpha=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,linux.intel.com,vger.kernel.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-alpha@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-alpha];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]

On Thu, Apr 30, 2026 at 11:51:28AM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> > The only platform without these aforementioned defines is Alpha, which is
> > conventional PCI only and cannot have ReBAR.  So this guard removes dead
> > sysfs code on platforms where it can never be executed.
> 
> Having a closer look:
> 
>   resource_resize_attr_is_visible()
>     pci_rebar_get_current_size()      <- returns -ENOTSUPP, so is_visible callback returns 0
>       pci_rebar_find_pos()
>         pos = pdev->rebar_cap         <- set to 0 on a conventional PCI
>         if (!pos)
>           return -ENOTSUPP            <- no ReBAR support
> 
> The pdev->rebar_cap is set during PCI enumeration:
> 
>   pci_init_capabilities()
>     pci_rebar_init()
>       pdev->rebar_cap = pci_find_ext_capability()
>         pci_find_next_ext_capability()
>           if (dev->cfg_size <= PCI_CFG_SPACE_SIZE)
>             return 0;                 <- dev->cfg_size set to 256 here for conventional PCI
> 
> The PCI_CFG_SPACE_SIZE is 256 here.
> 
> When the platform has support for PCI Express, the dev->cfg_size is then
> set to 4096.  On an architecture that supports conventional PCI only (such
> as Alpha), the pdev->rebar_cap will be set to 0, the is_visible callback
> will then return 0, and the resize sysfs attribute is never created, as
> such, the __resource_resize_store() callback will never be executed.
> 
> To make the connetion here to the #ifdef guards:
> 
> For the pci_rebar_get_current_size() to return >= 0, the device needs
> PCI Express and extended configuration space support.  As of today,
> every architecture with PCI Express support defines HAVE_PCI_MMAP or
> ARCH_GENERIC_PCI_MMAP_RESOURCE.
> 
> I hope the reasoning here works.

We're talking about this #ifdef:

  +#if defined(HAVE_PCI_MMAP) || defined(ARCH_GENERIC_PCI_MMAP_RESOURCE)
   static ssize_t __resource_resize_show(struct device *dev, int n, char *buf)
   ...
  +#endif

I follow the reasoning now but by next week I won't, so I think it
requires too much background knowledge.  Future changes involving
HAVE_PCI_MMAP or ARCH_GENERIC_PCI_MMAP_RESOURCE could easily break
this.

IIUC it's basically doing what "#ifdef CONFIG_PCI_REBAR" or even
"#ifdef CONFIG_PCI_EXPRESS" would do, if we had such a thing.

How terrible would it be if we just accepted this dead code on Alpha?

