Return-Path: <linux-alpha+bounces-3551-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id o4xIKc998mmmrwEAu9opvQ
	(envelope-from <linux-alpha+bounces-3551-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Wed, 29 Apr 2026 23:53:19 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 153B049ABBB
	for <lists+linux-alpha@lfdr.de>; Wed, 29 Apr 2026 23:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C424B30166FF
	for <lists+linux-alpha@lfdr.de>; Wed, 29 Apr 2026 21:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF09375F96;
	Wed, 29 Apr 2026 21:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DB9+kZPD"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195EC1F3B85;
	Wed, 29 Apr 2026 21:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777499596; cv=none; b=Vw03o9IiqoYBBSEzynz3ZG+RiGqJDlOjQ2mYRQOyU9+U5IhhROxN97oJNkji1rbXpJtIByfiXEESADElykKIND898Vh0a/t6F9umbuMcLAioAagAasX2HneOyHNHEA/hawwbidmwfMCZACtZNflQNwFnHLSNeXAk2PBW41OurIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777499596; c=relaxed/simple;
	bh=QMStOrC9ijSdcmZwpecCfj8cW7cjmtEWxaBR3/UpVls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjEYfoNvLQbFBAtk8xj+cLRC5TCM6fNulp8+Dmoq+nYm7uXzwyaeWH4/4uUIyscdWXaU1njcHE1ob1wgBXIOnemcC1PO5li+HgVSHr4TbCTqMfQl50ivEFbHbCNGRIdFmi4nuUOT9oZa+KIS12jawGj6tBjgJeir6j6+H1tD2Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DB9+kZPD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDA5C19425;
	Wed, 29 Apr 2026 21:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777499595;
	bh=QMStOrC9ijSdcmZwpecCfj8cW7cjmtEWxaBR3/UpVls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DB9+kZPDshUQej3kRybqEfvdwkk667Gm6CkHX5VlzJSsCkGdxN0SK66RBIbtcRQiX
	 oR5JEXAjnydRYcR1XVvWKjGNU0kKz3vRPzjlIIomF/G+LQ0IDnd+et2lboaOd8Qc/8
	 WcepsbyXQUbwF/WWXTIE11uuDVG6Vpu6lT02czNXEtD/0Z/ih1iJc/XNmBhnIpFn80
	 QN3DdAaMXmFzbd4t1ZLgozXRJ5n769qzHJuv/YZJfLpmpAt/Zud3+Eb4H963mf/p4+
	 rEdieLZ7HK7keBlOU6yHJ+A7kGjM7uCVMbX9JXbQubG0LkVt/W4rDPibeeifUAjchc
	 zVufsAqHwppjA==
Date: Thu, 30 Apr 2026 06:53:13 +0900
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
Message-ID: <20260429212749.GB3724801@rocinante>
References: <20260422161407.118748-25-kwilczynski@kernel.org>
 <20260429204932.GA318462@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429204932.GA318462@bhelgaas>
X-Rspamd-Queue-Id: 153B049ABBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3551-lists,linux-alpha=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,linux.intel.com,vger.kernel.org,lists.ozlabs.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hello,

> > The resourceN_resize sysfs attributes allow users to resize
> > Resizable BARs (ReBAR).  After a successful resize, the resource
> > attribute groups are removed and recreated so that the updated
> > BAR sizes are reflected in the sysfs files.
> 
> Out of curiosity, where does this removal/recreation happen?  I don't
> see it in pci_resize_resource() or
> pci_do_resource_release_and_resize().

The __resource_resize_store() helper carries the relevant code, per:

  sysfs_remove_groups(&pdev->dev.kobj, pci_dev_resource_attr_groups);

  ret = pci_resize_resource(pdev, n, size, 0);
  if (ret)
  	pci_warn(pdev, "Failed to resize BAR %d: %pe\n",
  		 n, ERR_PTR(ret));

  pci_assign_unassigned_bus_resources(bus);

  if (sysfs_create_groups(&pdev->dev.kobj, pci_dev_resource_attr_groups))
  	pci_warn(pdev, "Failed to recreate resource groups after BAR resizing\n");

  pci_write_config_word(pdev, PCI_COMMAND, cmd);

This takes place under the device_lock() with a given device woken up using
pci_config_pm_runtime_get().

See for reference:

  https://elixir.bootlin.com/linux/v7.0.1/source/drivers/pci/pci-sysfs.c#L1596

> > Resizable BARs are a PCI Express extended capability
> > (PCI_EXT_CAP_ID_REBAR), which requires PCIe extended config
> > space.
> 
> It sounds like the fact that ReBAR requires extended config space is
> important somehow (beyond just the fact that we can't discover ReBAR
> without it)?  Is there some connection between extended config space
> and mmap?

No, there is no connection between extended configuration space and mmap.

I was trying to establish two separate facts:

  - ReBAR requires PCI Express (for the extended configuration
    space support).
  - Every PCI Express-capable architecture defines either
    HAVE_PCI_MMAP or ARCH_GENERIC_PCI_MMAP_RESOURCE.

The commit message should have captured the reasoning better.
 
> > Every PCIe-capable architecture defines either HAVE_PCI_MMAP or
> > ARCH_GENERIC_PCI_MMAP_RESOURCE (via the relevant arch headers
> > or the generic asm-generic/pci.h fallback).  On platforms that
> > define neither, the resource files are not created and the sysfs
> > group remove and create calls in __resource_resize_store() are
> > no-ops.
> 
> What's the connection between ReBAR and mmap?

The connection is somewhat indirect, through the sysfs resource files.

The resourceN_resize attribute exists so userspace can resize a BAR and
then access it through the resourceN sysfs files.  Those resource files
only exist on platforms that define HAVE_PCI_MMAP or
ARCH_GENERIC_PCI_MMAP_RESOURCE.

On architectures without either of these defines, pci_dev_resource_attr_groups
array will be NULL and the sysfs_remove_groups() and sysfs_create_groups()
calls in __resource_resize_store() are no-ops.  And there will be no
resource files to tear down or recreate.

To add, there are some kernel drivers that need ReBAR call pci_resize_resource()
directly (e.g., amdgpu, xe, i915), not through the sysfs attribute.

The only platform without these aforementioned defines is Alpha, which is
conventional PCI only and cannot have ReBAR.  So this guard removes dead
sysfs code on platforms where it can never be executed.

Hope this helps.

Thank you!

	Krzysztof

