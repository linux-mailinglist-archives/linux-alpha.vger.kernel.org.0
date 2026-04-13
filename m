Return-Path: <linux-alpha+bounces-3415-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDSnE+LY3GmcWQkAu9opvQ
	(envelope-from <linux-alpha+bounces-3415-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Mon, 13 Apr 2026 13:52:02 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E7E3EB922
	for <lists+linux-alpha@lfdr.de>; Mon, 13 Apr 2026 13:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5448830065F5
	for <lists+linux-alpha@lfdr.de>; Mon, 13 Apr 2026 11:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CFF35F8B7;
	Mon, 13 Apr 2026 11:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXqQa73I"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C99358385;
	Mon, 13 Apr 2026 11:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776081120; cv=none; b=ni1Ty0q+7/X7HY4afko2dWXTr2NE9Ivqm+8Tam1GRm6IxuuSQG/RkZY0jSLtTCDzYU+VMbMnWX2uuDAzEvtAh0kGdhQqrvgopr/WSKAnwb4PqANUyYxz9UIsSU6xdtK2JoS2zmQR3vFp/rSy01IJAPUimx0OI0lWmXi1sABatC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776081120; c=relaxed/simple;
	bh=fpOAaZKfotFu8HPdtyLtTcGQEsJqFpCbjJlbK0uwLl4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LvlFvD/SscZ+SSTIXcSLsNTnGzzhXJTMzrAlIbeQ2C17W7iQhWBNPvJKpqRfu6o/HWanbBbd5CPXMlBYN5fY5uVHuGzDo7MuwpkjEewAFJ7FTWvRdXjF4hSay9wqdKOxvjL9a05UqaqqmSQqpXgC454xeRN/CbXgVPaDyATM1wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXqQa73I; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776081119; x=1807617119;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fpOAaZKfotFu8HPdtyLtTcGQEsJqFpCbjJlbK0uwLl4=;
  b=iXqQa73IIKOaNa39iysbl5EJneaJoX089Tn1w23Ua8X4Ik+UFr7rL/J9
   eKT2+K+rDJomobgnHX2xorM7QeL1Uqhid3a462asSNubts1ASYKc4G7/0
   CiU2YVGidC6bycafRd0+BvNcJv2Af5O2ohhef7o5w2SHQ06rfhBYq/IEv
   NrJykghRnhdgUFKMj4Zv+J9vEpRXnqJxndbgFMpRupMFHsygqNZjB4eiE
   ON0DqY4EkaTJKzeC/5FB2QsNyWAftGqq0YK/wdut/1owd/dUZRSdsTtof
   HUhM3TBxQWa6LtNLQbh6KHRZkGg7c39fGNgIb1gltcwFnuG9l41oDiODW
   Q==;
X-CSE-ConnectionGUID: Q4pnBVOISpOu4tvqywU9UQ==
X-CSE-MsgGUID: rP90NjLIS2ykqB3rkzgHGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="79594855"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="79594855"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 04:51:58 -0700
X-CSE-ConnectionGUID: i/Lq7BnxRFiQWIqqO/VyQw==
X-CSE-MsgGUID: lhiRzlaYThGfHhcJw4GQnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="234182329"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.63])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 04:51:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 Apr 2026 14:51:47 +0300 (EEST)
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
Subject: Re: [PATCH v4 12/24] alpha/PCI: Use BAR index in sysfs attr->private
 instead of resource pointer
In-Reply-To: <20260411080148.471335-13-kwilczynski@kernel.org>
Message-ID: <36cdf28b-281f-46c7-d4b5-083675b61660@linux.intel.com>
References: <20260411080148.471335-1-kwilczynski@kernel.org> <20260411080148.471335-13-kwilczynski@kernel.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1179895439-1776081107=:962"
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3415-lists,linux-alpha=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E1E7E3EB922
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1179895439-1776081107=:962
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 11 Apr 2026, Krzysztof Wilczy=C5=84ski wrote:

> Currently, Alpha's pci_create_one_attr() stores a resource pointer in
> attr->private, and pci_mmap_resource() loops through all BARs to find
> the matching index.
>=20
> Thus, store the BAR index directly in attr->private and retrieve the
> resource via pci_resource_n().  This eliminates the loop and aligns
> with the convention used by the generic PCI sysfs code.
>=20
> While at it, add parentheses around the bitwise flag test in
> pci_mmap_resource() to make the precedence explicit, and to
> match the preferred style.

Probably not necessary to touch this line now at all as you're going to=20
replace it two patches later anyway so it just adds noise.

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

> The PCI core change was first added in the commit dca40b186b75 ("PCI:
> Use BAR index in sysfs attr->private instead of resource pointer").
>=20
> Signed-off-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
> ---
>  arch/alpha/kernel/pci-sysfs.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.=
c
> index 2324720c3e83..c84867ce31f5 100644
> --- a/arch/alpha/kernel/pci-sysfs.c
> +++ b/arch/alpha/kernel/pci-sysfs.c
> @@ -69,25 +69,20 @@ static int pci_mmap_resource(struct kobject *kobj,
>  =09=09=09     struct vm_area_struct *vma, int sparse)
>  {
>  =09struct pci_dev *pdev =3D to_pci_dev(kobj_to_dev(kobj));
> -=09struct resource *res =3D attr->private;
> +=09int barno =3D (unsigned long)attr->private;
> +=09struct resource *res =3D pci_resource_n(pdev, barno);
>  =09enum pci_mmap_state mmap_type;
>  =09struct pci_bus_region bar;
> -=09int i, ret;
> +=09int ret;
> =20
>  =09ret =3D security_locked_down(LOCKDOWN_PCI_ACCESS);
>  =09if (ret)
>  =09=09return ret;
> =20
> -=09for (i =3D 0; i < PCI_STD_NUM_BARS; i++)
> -=09=09if (res =3D=3D &pdev->resource[i])
> -=09=09=09break;
> -=09if (i >=3D PCI_STD_NUM_BARS)
> -=09=09return -ENODEV;
> -
> -=09if (res->flags & IORESOURCE_MEM && iomem_is_exclusive(res->start))
> +=09if ((res->flags & IORESOURCE_MEM) && iomem_is_exclusive(res->start))
>  =09=09return -EINVAL;
> =20
> -=09if (!__pci_mmap_fits(pdev, i, vma, sparse))
> +=09if (!__pci_mmap_fits(pdev, barno, vma, sparse))
>  =09=09return -EINVAL;
> =20
>  =09pcibios_resource_to_bus(pdev->bus, &bar, res);
> @@ -170,7 +165,7 @@ static int pci_create_one_attr(struct pci_dev *pdev, =
int num, char *name,
>  =09res_attr->attr.name =3D name;
>  =09res_attr->attr.mode =3D S_IRUSR | S_IWUSR;
>  =09res_attr->size =3D sparse ? size << 5 : size;
> -=09res_attr->private =3D &pdev->resource[num];
> +=09res_attr->private =3D (void *)(unsigned long)num;
>  =09return sysfs_create_bin_file(&pdev->dev.kobj, res_attr);
>  }
> =20
>=20

--=20
 i.


--8323328-1179895439-1776081107=:962--

