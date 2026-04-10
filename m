Return-Path: <linux-alpha+bounces-3317-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMC6E0Xd2GnHjAgAu9opvQ
	(envelope-from <linux-alpha+bounces-3317-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 13:21:41 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F983D6186
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 13:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B2C3300861E
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 11:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2366C39BFFF;
	Fri, 10 Apr 2026 11:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNkWsMkv"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0005C3368AD;
	Fri, 10 Apr 2026 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775820095; cv=none; b=HjKXygDybq0KpnZQQqyjvL7bWPSN21IAtLT1ZNE7zbjyj5AJaIn7MD1BhycCEua9NZAB4bVwT3pESXwMuGz3umruqzCgzH1Kv64LIqRZ6LuTcvsoPAakKTxn+FA7Bq/gspiO4JalMgBZ2dkjaGFbBX5uDhe/9cYpb8vWqIxUQm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775820095; c=relaxed/simple;
	bh=xLa+rJ9E7aCqjS27Iq/hgGnSH2oHxIMaRffEJnqkauE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sm1KW/uU1dJ3gVKwVaACrSkz1HBrH2hL+tUEzAhbuS8JK14ywbLgjAhInU8fPgP9nbsF/yik27sXRfsEKoV+iJTHO/TajJOwpVmZDrpUb2/rquMQJUew2p+HuUY920J3tgIcPGgso1A13DgiVhGpkVYx2jMgLMJzFUtUb3dHfNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNkWsMkv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC07C19421;
	Fri, 10 Apr 2026 11:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775820094;
	bh=xLa+rJ9E7aCqjS27Iq/hgGnSH2oHxIMaRffEJnqkauE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aNkWsMkvMG+Va6sAFKXUZym1llx13MYasPeV+K/sG2YsNB5fhSi1QGBWHW0lr8cEe
	 Ev40On4E48kLxL4u5xdErZMqk8eBFmaEvlczXiYn844NLVvbOf+5VF6GQjp83Cd6RR
	 URaOH6uyIvSnEz0s89g95P5FSEndyI6GSpvz+kofOapbCZ+SqnRpgUxmlcj+BjRr6d
	 tUF3nGYNEh0ST+8xFRk7Kvo5dNDV1K+Mm4nyz7O3WrJ93GDtGkKwnZnfK/X17X7k2b
	 f0faK0yZgmPX7lfc4nMqHmxbcB/3MooRWPwhpnkEtpGRlxGcqByVvM4/hDJUcHMRuX
	 9X5aOtHCv4PlQ==
Date: Fri, 10 Apr 2026 20:21:32 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas <helgaas@kernel.org>,
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
	linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 13/20] alpha/PCI: Clean up __pci_mmap_fits()
Message-ID: <20260410112132.GA1756033@rocinante>
References: <20260410055040.39233-1-kwilczynski@kernel.org>
 <20260410055040.39233-14-kwilczynski@kernel.org>
 <66eb23bf-1995-363f-78e6-f5a397a063a2@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66eb23bf-1995-363f-78e6-f5a397a063a2@linux.intel.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3317-lists,linux-alpha=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,linaro.org,linux.ibm.com,ellerman.id.au,microsoft.com,piap.pl,wunner.de,bytedance.com,vger.kernel.org,lists.ozlabs.org];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 52F983D6186
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

> > Currently, __pci_mmap_fits() computes the BAR size using
> > pci_resource_len() - 1, which wraps to a large value when the
> > BAR length is zero, causing the bounds check to incorrectly
> > succeed.
> > 
> > Thus, add an early return for empty resources.
> > 
> > Also, remove the WARN() that fires when userspace attempts to
> > mmap beyond the BAR bounds.  The check still returns 0 to reject
> > the mapping, but the warning is excessive for normal operation.
> > 
> > A similar warning was removed from the PCI core in the commit
> > 3b519e4ea618 ("PCI: fix size checks for mmap() on /proc/bus/pci files").
> 
> This looks like entirely separate two changes to me which just happen 
> within the same context.

True.  I could split this into two separate patches.  However, the early
return is so trivial, that I decided to keep it here, in lieu of that the
linked patch did, too.

Thoughts?

Thank you!

	Krzysztof

