Return-Path: <linux-alpha+bounces-3308-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIhoBlPQ2GngiQgAu9opvQ
	(envelope-from <linux-alpha+bounces-3308-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 12:26:27 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7235E3D5A7A
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 12:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CFF03009F8A
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 10:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378B435F191;
	Fri, 10 Apr 2026 10:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9qftu5R"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BCF2E63C;
	Fri, 10 Apr 2026 10:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816341; cv=none; b=Rk/AeHBeXsV+73vhZpa7SayrFa+TK6HaG3BL3QbF4BFz9YY3tQOsSd5fifJGiM6oe5zh+3NStQuAutty+dtFc6y1kTEuI68eMY98ypq184LACu7snp7orZfaHP9bRREyHSw7HwrCT8nN+feRJLgFA9nwCzYdu1RQrzJRGZwjdtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816341; c=relaxed/simple;
	bh=sJjahAyArFT38iar0FyVHZtbbpGo+U5iy6pPkK42kPc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Kw+hw4DYIK/0xhnUnN7TG6TzTUoSQWBL8wmDMtPdKS3NtxhXdLpE0M7LWCAg7tECfUXQh106i8z4e4G4+GuMxG+DWkkRGU/JgDZnZGF7LT7n1uGUkKrfiBmEkkj3X1P/IqXHhCi4CsNItnvL6oPlsLEwMRpYsgiM69Ne5ouVQZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9qftu5R; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775816340; x=1807352340;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=sJjahAyArFT38iar0FyVHZtbbpGo+U5iy6pPkK42kPc=;
  b=e9qftu5RIehFO20cuwVplezN6PCakuRMJlCiAGIwz+lBVpgN7Wm4JNdK
   cuNP1J7JPWB2KgCOmrKNk5QfSAnF/yQLtHplh0StcFwRfHS2wVLzZapmC
   TM3fBsSbVbzIqPs8D0Ai1Rsawz/fb7uAHjeNjUGx7HSJe2OXyOz93UW6I
   G7afNe3sjdQr0bxijUrn/qBLymA2SBw2/2Y9qO6OMJxZd1/0NQo7lDsUa
   Zxrtsg0GUr8T1Y8ZxKWzc2OJqEJg9DMWJnFkGmB9zbH7h0eJBFcKVubba
   oOPMXx1+6xjWjJX6QmOLpsRyYNRkgKR3uhTw55YEfF2NV53GX3VAuBoJM
   Q==;
X-CSE-ConnectionGUID: aN7lLnGfQyq4MptTwkv8mw==
X-CSE-MsgGUID: +UAc0gqOS9C/K9Af3RKEug==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80723099"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="80723099"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 03:18:59 -0700
X-CSE-ConnectionGUID: 0SVrldBuSXepU1rqThYmYw==
X-CSE-MsgGUID: ei3zn7N0QJCCee3wDOarkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="222559193"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.118])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 03:18:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Apr 2026 13:18:43 +0300 (EEST)
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
Subject: Re: [PATCH 04/20] PCI/sysfs: Add CAP_SYS_ADMIN check to
 __resource_resize_store()
In-Reply-To: <20260410055040.39233-5-kwilczynski@kernel.org>
Message-ID: <37f2e32a-804d-7c59-d3d0-7148ef2cd95a@linux.intel.com>
References: <20260410055040.39233-1-kwilczynski@kernel.org> <20260410055040.39233-5-kwilczynski@kernel.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-297789617-1775816323=:1195"
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3308-lists,linux-alpha=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: 7235E3D5A7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-297789617-1775816323=:1195
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 10 Apr 2026, Krzysztof Wilczy=C5=84ski wrote:

> Currently, the __resource_resize_store() allows writing to the
> resourceN_resize sysfs attribute to change a BAR's size without
> checking for capabilities, currently relying only on the file
> access check.
>=20
> Resizing a BAR modifies PCI device configuration and can disrupt
> active drivers.  After the upcoming conversion to static attributes,
> it will also trigger resource file updates via sysfs_update_groups().
>=20
> Thus, add a CAP_SYS_ADMIN check to prevent unprivileged users from
> performing BAR resize operations.
>=20
> Signed-off-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
> ---
>  drivers/pci/pci-sysfs.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index ac4e7c516e78..6b8c8e62f68a 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -1619,6 +1619,9 @@ static ssize_t __resource_resize_store(struct devic=
e *dev, int n,
>  =09int ret;
>  =09u16 cmd;
> =20
> +=09if (!capable(CAP_SYS_ADMIN))
> +=09=09return -EPERM;
> +
>  =09if (kstrtoul(buf, 0, &size) < 0)
>  =09=09return -EINVAL;
> =20
>=20

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-297789617-1775816323=:1195--

