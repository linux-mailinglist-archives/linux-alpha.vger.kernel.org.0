Return-Path: <linux-alpha+bounces-3416-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKZlKyfZ3GmcWQkAu9opvQ
	(envelope-from <linux-alpha+bounces-3416-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Mon, 13 Apr 2026 13:53:11 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3B83EB940
	for <lists+linux-alpha@lfdr.de>; Mon, 13 Apr 2026 13:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 354A83001841
	for <lists+linux-alpha@lfdr.de>; Mon, 13 Apr 2026 11:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536D635F8B7;
	Mon, 13 Apr 2026 11:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FO0sOFOn"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E068722424C;
	Mon, 13 Apr 2026 11:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776081186; cv=none; b=S1TXWANIwNr7ah0x8nCajA+xDmS/QjoO3g8P4pXLOmMdOB5wmUDg+nYfSuFIUU1VmsNNEGaNtRFRHTQZ2IFtXUff+nMR16hd4jvzPivSwFsvn9SgwH2zCd6e+ieEn+uVq53fXIs59nyG4JHlSCa+wfXJhht0RFAzuqczYOJHtpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776081186; c=relaxed/simple;
	bh=dJVGufupuRzhM0xublRPUyKnOZZPoagICx16HUyrYow=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nuarDtAKtLZUApipO92PaHkLmBRBpQm6MK5EKtDcn8JpFH/yEnr0ZV8uFn0woDGCiAKuYJ8S3DxXRhZnSEG0hQBajJlANA91LHmu16pKqFv/Ry1q2+zNki6NWGPbrlQI36p7UoXgsrtsaOL4+ywHLZSRsq81wTNDRNsp4quk9Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FO0sOFOn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776081185; x=1807617185;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=dJVGufupuRzhM0xublRPUyKnOZZPoagICx16HUyrYow=;
  b=FO0sOFOnggLoPmrot5QCZXFFZ/Sbx6oBXcaFBTDjJKOxJO4FA1pCymCG
   ziQN9RboWQq+gdu2JTU/Fze1LDzddesNe8VmM5J/n2lero6Ar8JqkA1lL
   Z7RbCllk+qfLyKsgb6pdbIs2S6GGDuN+H/DsVJICmtkIveYRNc07S2hQS
   fE8J/bxdwZxcFv8AaEFd2tIapvEqXAH8NQOXRyusFcE0z+C7ODjH5yeCf
   YEALeXoyPdAxWwXT9wD1CzO2gNarDkJDIIOBK5QQ/hg06PyhNGdJKovH3
   Ca4KlhBvJQgb235o8+UW6/NTa+uTC7oe/uE7LnQRjWfNWVb9u8aDWzdXu
   Q==;
X-CSE-ConnectionGUID: Tz/GlsPXSc+rmA9LDXQ8cQ==
X-CSE-MsgGUID: H4JckUwhSt6FBvz+Rhp5HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76046430"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="76046430"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 04:53:04 -0700
X-CSE-ConnectionGUID: Qi86xDZ0TgiVjehP4JCm2w==
X-CSE-MsgGUID: nvS2V3eiR/y1R3IE9KDruQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="253165075"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.63])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 04:52:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 Apr 2026 14:52:49 +0300 (EEST)
To: =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>
cc: Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas <helgaas@kernel.org>, 
    Manivannan Sadhasivam <mani@kernel.org>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Christophe Leroy <chleroy@kernel.org>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
    Dexuan Cui <decui@microsoft.com>, 
    =?ISO-8859-2?Q?Krzysztof_Ha=B3asa?= <khalasa@piap.pl>, 
    Lukas Wunner <lukas@wunner.de>, Oliver O'Halloran <oohall@gmail.com>, 
    Saurabh Singh Sengar <ssengar@microsoft.com>, 
    Shuan He <heshuan@bytedance.com>, 
    Srivatsa Bhat <srivatsabhat@microsoft.com>, linux-pci@vger.kernel.org, 
    linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 13/24] alpha/PCI: Use PCI resource accessor macros
In-Reply-To: <20260411080148.471335-14-kwilczynski@kernel.org>
Message-ID: <5c4f32d1-0648-31d1-d7c0-661ccec4f8bc@linux.intel.com>
References: <20260411080148.471335-1-kwilczynski@kernel.org> <20260411080148.471335-14-kwilczynski@kernel.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1935294158-1776081169=:962"
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3416-lists,linux-alpha=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+,1:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-alpha@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-alpha];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 5E3B83EB940
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1935294158-1776081169=:962
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 11 Apr 2026, Krzysztof Wilczy=C5=84ski wrote:

> Replace direct pdev->resource[] accesses with pci_resource_n(),
> and pdev->resource[].flags accesses with pci_resource_flags().
>=20
> No functional changes intended.
>=20
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
> ---
>  arch/alpha/kernel/pci-sysfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.=
c
> index c84867ce31f5..7aac5e76dcd6 100644
> --- a/arch/alpha/kernel/pci-sysfs.c
> +++ b/arch/alpha/kernel/pci-sysfs.c
> @@ -141,7 +141,7 @@ static int sparse_mem_mmap_fits(struct pci_dev *pdev,=
 int num)
>  =09long dense_offset;
>  =09unsigned long sparse_size;
> =20
> -=09pcibios_resource_to_bus(pdev->bus, &bar, &pdev->resource[num]);
> +=09pcibios_resource_to_bus(pdev->bus, &bar, pci_resource_n(pdev, num));
> =20
>  =09/* All core logic chips have 4G sparse address space, except
>  =09   CIA which has 16G (see xxx_SPARSE_MEM and xxx_DENSE_MEM
> @@ -181,7 +181,7 @@ static int pci_create_attr(struct pci_dev *pdev, int =
num)
>  =09suffix =3D "";=09/* Assume bwx machine, normal resourceN files. */
>  =09nlen1 =3D 10;
> =20
> -=09if (pdev->resource[num].flags & IORESOURCE_MEM) {
> +=09if (pci_resource_flags(pdev, num) & IORESOURCE_MEM) {

This could have used the new helper but since this code is going away=20
anyway in a later patch it doesn't matter,

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>


--=20
 i.

--8323328-1935294158-1776081169=:962--

