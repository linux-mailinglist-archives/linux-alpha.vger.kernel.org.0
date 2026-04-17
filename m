Return-Path: <linux-alpha+bounces-3465-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLJtF6sP4mkg1AAAu9opvQ
	(envelope-from <linux-alpha+bounces-3465-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Fri, 17 Apr 2026 12:47:07 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4A141A5D8
	for <lists+linux-alpha@lfdr.de>; Fri, 17 Apr 2026 12:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EC44300E03A
	for <lists+linux-alpha@lfdr.de>; Fri, 17 Apr 2026 10:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CF43783D3;
	Fri, 17 Apr 2026 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbioxR5P"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5174D373C13;
	Fri, 17 Apr 2026 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776422821; cv=none; b=f9cyCZ9u8XFfpI+EQSrCWncPggKm4H/3+8adHBOMhqiTrXNXSKBu526hCeO50U1HwjkHJ3lgP/UBc0dSNUQnNV+5iDVzdpRqMARVY81Mr9GaeFt1Hwj7BHxc1XXgZmC/hrHo6E+7zotTEKHcqQrDecjOubEGht4oIEoSECj2XhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776422821; c=relaxed/simple;
	bh=UvXWZOvTnm0NWz5LK6R3oW+P9THcCFDgcoMJOmweRAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lt7VD2jJok29HrqTtviyhMomzDVJDl+XDEo+urWon/F99cXrbmmGyWsDGuP4IpiKEqOg9Xm5hRZYY3r9x6uuAtsmvfJlDHm2iRDpC7MzeQBNRugU2QTRXBGtSI2zR26aBOBK3ngavDFK0M6Y3l0P59d0e5mxYtPXlpla5+c05VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbioxR5P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84137C19425;
	Fri, 17 Apr 2026 10:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776422820;
	bh=UvXWZOvTnm0NWz5LK6R3oW+P9THcCFDgcoMJOmweRAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbioxR5P1H0eF61qBn8Ob0PRTqf0B9BgcBoGvCOTg04M2A//ev5+VYJo7I34HDr1H
	 NAkPEB0XOaKIyy+nIOG15M285LES5Qfix3M/58yNHhe1+tc41NPjmqLO9arGKANGMx
	 TnGh8Zhtryjc05fOxnUvgP7IJHyJmT/Ip8LUNrR1Zym8q7Dwh94aTst8QV8DJjuBil
	 s/O9rUjVMIBmptz4Wp9kl8vPH0LdfHMHgZPjdI21c6d/c7/O0clSYIV2zwRHPNXMAK
	 LBGq7LBW9Cl7W6WkopP7gKKrWocPs3G71Ak7YUDbxnciZZeDhyoXB6xBAvf7R268ZC
	 xK7xWNdsuTctA==
Date: Fri, 17 Apr 2026 19:46:58 +0900
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
Subject: Re: [PATCH v4 20/24] PCI: Add macros for legacy I/O and memory
 address space sizes
Message-ID: <20260417104658.GA1625998@rocinante>
References: <20260411080148.471335-1-kwilczynski@kernel.org>
 <20260411080148.471335-21-kwilczynski@kernel.org>
 <a73af6f4-9f9a-cff8-e00e-042dcf934708@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a73af6f4-9f9a-cff8-e00e-042dcf934708@linux.intel.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3465-lists,linux-alpha=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1E4A141A5D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

> > +/* PCI legacy I/O port and memory address space sizes. */
> > +#define PCI_LEGACY_IO_SIZE	(SZ_64K - 1)
> > +#define PCI_LEGACY_MEM_SIZE	SZ_1M
> > +
> >  extern unsigned int pci_flags;
> >  
> >  static inline void pci_set_flags(int flags) { pci_flags = flags; }
> > 
> 
> Shouldn't this also convert the use in pci-sysfs.c (which you now mixed 
> into the static attrs conversion patch)?

I took care of this in v5.

Thank you!

	Krzysztof

