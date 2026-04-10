Return-Path: <linux-alpha+bounces-3309-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFDJCMTQ2GngiQgAu9opvQ
	(envelope-from <linux-alpha+bounces-3309-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 12:28:20 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F233D5AB1
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 12:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4D3D3054F19
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 10:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881C837AA8B;
	Fri, 10 Apr 2026 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBlTK0Tj"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423592FE05C;
	Fri, 10 Apr 2026 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816459; cv=none; b=sf7cektQWjlSiKzpVyBX+kG8yPE13//rpthfde894QJDScfv8jevHdfriGm1LLQ1LTYKiuG5A9rIDPmrMsIvW9XImKZ+7h0URNNSztoqE/sNnr6q5x8jHDB598EazavShG0XpcJWTHi46dYJiqd2sjcDERuX1Xc/Yw3ZpBSqsCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816459; c=relaxed/simple;
	bh=N7SkzmsbvwjvxbIwFnYfZTQzj2yOdMq5pJu+/jX/36o=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QaF5Py3auk7kTIvx3WMV1BvedQexej320+K1cUw1EJj6IaIBt8w/ae7N+8GaTjMNQhAHAjjo0UrEumOTDbz6VZJolzbqNDkuZBLy6UDSQqTY3GDSUMwXPoAjwtxuBLFM1wfa007FJ4X3qnH9AmvgYBL49IjufP+3mbCIvmJP7JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBlTK0Tj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775816458; x=1807352458;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=N7SkzmsbvwjvxbIwFnYfZTQzj2yOdMq5pJu+/jX/36o=;
  b=eBlTK0TjBvhtsZwd+EWIuHSRl4BjfvLUaVeWksOZi4mdEt+tyBUErBfc
   1ocEZYZo59VtCddcXW5qFslp35ybt36D2iV2bI10jbFo/f+F6juZXsYMF
   tARzdRnM9lcJJrKNCb7yrHCfbZtntYlZTeA9Y1/HRBi9VeqJrCt2396to
   t4L+A0nVsN+txXg6QKAMdPB488+6OgknH/cEL6NuxOlv6ntw1sHFsThVG
   Vt+uLnp+HLWTV3epPGddpqZXpHCo16Cpq+r0KE+GkaEyUcYYpddwl+NS4
   eai79aA1iA4SuZmv4otyVDUUqfxWa5eKXH6Ex/HYz91Zp2COHvUgaEPOs
   w==;
X-CSE-ConnectionGUID: EyNBjPbGQaCBgSheif1RHA==
X-CSE-MsgGUID: L+nU4D0HTLOYd/5M4tKLhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80723447"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="80723447"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 03:20:57 -0700
X-CSE-ConnectionGUID: b1xv5qhxQKewR1yTv/q0Pw==
X-CSE-MsgGUID: CBvJAwIOR3+IrzUnbUoSAg==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.118])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 03:20:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Apr 2026 13:20:44 +0300 (EEST)
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
Subject: Re: [PATCH 01/20] PCI/sysfs: Use PCI resource accessor macros
In-Reply-To: <20260410055040.39233-2-kwilczynski@kernel.org>
Message-ID: <a1a53dfb-ec7b-ac2e-0384-7f294b02596e@linux.intel.com>
References: <20260410055040.39233-1-kwilczynski@kernel.org> <20260410055040.39233-2-kwilczynski@kernel.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-511166342-1775816444=:1195"
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3309-lists,linux-alpha=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: B5F233D5AB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-511166342-1775816444=:1195
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 10 Apr 2026, Krzysztof Wilczy=C5=84ski wrote:

> Replace direct pdev->resource[] accesses with pci_resource_n(),
> and pdev->resource[].flags accesses with pci_resource_flags().
>=20
> No functional changes intended.
>=20
> Signed-off-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
> ---
>  drivers/pci/pci-sysfs.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 16eaaf749ba9..ad3c17f86c7f 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -177,7 +177,7 @@ static ssize_t resource_show(struct device *dev, stru=
ct device_attribute *attr,
>  =09=09max =3D PCI_BRIDGE_RESOURCES;
> =20
>  =09for (i =3D 0; i < max; i++) {
> -=09=09struct resource *res =3D  &pci_dev->resource[i];
> +=09=09struct resource *res =3D pci_resource_n(pci_dev, i);
>  =09=09struct resource zerores =3D {};
> =20
>  =09=09/* For backwards compatibility */
> @@ -715,7 +715,7 @@ static ssize_t boot_vga_show(struct device *dev, stru=
ct device_attribute *attr,
>  =09=09return sysfs_emit(buf, "%u\n", (pdev =3D=3D vga_dev));
> =20
>  =09return sysfs_emit(buf, "%u\n",
> -=09=09=09  !!(pdev->resource[PCI_ROM_RESOURCE].flags &
> +=09=09=09  !!(pci_resource_flags(pdev, PCI_ROM_RESOURCE) &
>  =09=09=09     IORESOURCE_ROM_SHADOW));
>  }
>  static DEVICE_ATTR_RO(boot_vga);
> @@ -1108,7 +1108,7 @@ static int pci_mmap_resource(struct kobject *kobj, =
const struct bin_attribute *a
>  =09struct pci_dev *pdev =3D to_pci_dev(kobj_to_dev(kobj));
>  =09int bar =3D (unsigned long)attr->private;
>  =09enum pci_mmap_state mmap_type;
> -=09struct resource *res =3D &pdev->resource[bar];
> +=09struct resource *res =3D pci_resource_n(pdev, bar);
>  =09int ret;
> =20
>  =09ret =3D security_locked_down(LOCKDOWN_PCI_ACCESS);
> @@ -1312,7 +1312,7 @@ static int pci_create_resource_files(struct pci_dev=
 *pdev)
>  =09=09retval =3D pci_create_attr(pdev, i, 0);
>  =09=09/* for prefetchable resources, create a WC mappable file */
>  =09=09if (!retval && arch_can_pci_mmap_wc() &&
> -=09=09    pdev->resource[i].flags & IORESOURCE_PREFETCH)
> +=09=09    pci_resource_flags(pdev, i) & IORESOURCE_PREFETCH)
>  =09=09=09retval =3D pci_create_attr(pdev, i, 1);
>  =09=09if (retval) {
>  =09=09=09pci_remove_resource_files(pdev);
>=20

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-511166342-1775816444=:1195--

