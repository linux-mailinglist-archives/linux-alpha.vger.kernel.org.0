Return-Path: <linux-alpha+bounces-3319-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFRLCu3g2GnHjAgAu9opvQ
	(envelope-from <linux-alpha+bounces-3319-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 13:37:17 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C983D6415
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 13:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04EB33021E56
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 11:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFC41862A;
	Fri, 10 Apr 2026 11:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlMSkELI"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DB428F935;
	Fri, 10 Apr 2026 11:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775820782; cv=none; b=emdafTVOi0yxNYZMzE9VceSJ+lVO3vprnX2MGtyRArQsHDGqPUA0R+QrYMxrI8w57O9+2SXzvRkoZ8VYSDYJI0rdH6t8bIYiKpazgfFAESPaxFaTSTWFKyv1w5hPAVpbwXkiuYmhF17eWBUfqu4ahP90hgvYEp/PiplIsKXv3bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775820782; c=relaxed/simple;
	bh=e4U7N25hchQ0OTw8zCGZ+OMwYFRYHOMJzZ6QqDxdozE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XarF4OP0Euu+shD6cymXOz2TXEmfIARqf6uvknB/q8cIOxCPfqKgx/qhfqmVmXrm5bJh4pD6MJXODcpiX+Y+pw/hGjM4VuiHBgEp7JGJubstbl+6Cr+o48wYrLrjPHmJA6TIcw/mQ3X1jZ/E5frgzSk/xiqWXDUyoR/4XBPr9i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlMSkELI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775820781; x=1807356781;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=e4U7N25hchQ0OTw8zCGZ+OMwYFRYHOMJzZ6QqDxdozE=;
  b=hlMSkELIHmpLY7lpdl2+rvq651fZMZ/6tMmDQ/C0BPkJObskK6qCy+qz
   qHg66XI6qRIZhsG5fAl0tQLfaE98L0HzpuAJa19kPCJ70thmmxrs8hcvS
   kvD3M4nRLG7eIJ6AwqKc52rf/cNDSdL5m3FgyuPdXUOtbhkec2hHmqsSt
   JDDnFt71Ip5Kx8aXIcPLgVIpCyMxywVPoj2A7M7VhbNX4m729CLRJi0bA
   wSinhbwade1vecdC9eM4dficzK5ZTmpZHVcl8QwSjyXV3iX9JMNp9YR4/
   osIUo/TWmqXck5mav3Ltt01XUs0wIOfYKIJiXSS3QfsEWwdCQ3jlrYPrF
   g==;
X-CSE-ConnectionGUID: +uDqoYznR+Gqe15ca2QZ5w==
X-CSE-MsgGUID: bpwis0JDQ6mDMALJFqu0wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="99472912"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="99472912"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 04:33:00 -0700
X-CSE-ConnectionGUID: pq0LdvgKRNOveewCKjRzXA==
X-CSE-MsgGUID: NCur4HzvQIiHzQCbo1QxPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="228225436"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.118])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 04:32:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Apr 2026 14:32:43 +0300 (EEST)
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
Subject: Re: [PATCH 13/20] alpha/PCI: Clean up __pci_mmap_fits()
In-Reply-To: <20260410112132.GA1756033@rocinante>
Message-ID: <f6c036e1-9145-e784-8a37-2486fc72978e@linux.intel.com>
References: <20260410055040.39233-1-kwilczynski@kernel.org> <20260410055040.39233-14-kwilczynski@kernel.org> <66eb23bf-1995-363f-78e6-f5a397a063a2@linux.intel.com> <20260410112132.GA1756033@rocinante>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-135863821-1775820198=:1195"
Content-ID: <35660afc-f9b7-2ff0-7765-d108aab98c34@linux.intel.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3319-lists,linux-alpha=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 89C983D6415
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-135863821-1775820198=:1195
Content-Type: text/plain; CHARSET=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <f0b0baec-2251-7aef-bc88-33c6227c1d57@linux.intel.com>

On Fri, 10 Apr 2026, Krzysztof Wilczy=F1ski wrote:

> Hello,
>=20
> > > Currently, __pci_mmap_fits() computes the BAR size using
> > > pci_resource_len() - 1, which wraps to a large value when the
> > > BAR length is zero, causing the bounds check to incorrectly
> > > succeed.
> > >=20
> > > Thus, add an early return for empty resources.
> > >=20
> > > Also, remove the WARN() that fires when userspace attempts to
> > > mmap beyond the BAR bounds.  The check still returns 0 to reject
> > > the mapping, but the warning is excessive for normal operation.
> > >=20
> > > A similar warning was removed from the PCI core in the commit
> > > 3b519e4ea618 ("PCI: fix size checks for mmap() on /proc/bus/pci files=
").
> >=20
> > This looks like entirely separate two changes to me which just happen=
=20
> > within the same context.
>=20
> True.  I could split this into two separate patches.  However, the early
> return is so trivial, that I decided to keep it here, in lieu of that the
> linked patch did, too.
>=20
> Thoughts?

It's not just adding the early return that would go to the first patch but=
=20
you also need to rearrange the len for that. Effectively, the change is=20
split in half, each becoming cleaner and more focused (both diff and the=20
changelog text).

As is I'm left on the borderline, while I can see it's "correct" after=20
splitting those changes inside my head, I also know it could have been=20
done better. I'd easily given rev-by for both if they'd have been done=20
individually, saved the time writing these emails about it, and=20
effectively "forgotten" the patches (including upcoming versions of the=20
series).

--=20
 i.
--8323328-135863821-1775820198=:1195--

