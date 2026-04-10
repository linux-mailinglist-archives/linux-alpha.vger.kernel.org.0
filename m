Return-Path: <linux-alpha+bounces-3322-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM0uKUfl2GmZjggAu9opvQ
	(envelope-from <linux-alpha+bounces-3322-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 13:55:51 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 658293D671C
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 13:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2035130201A4
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Apr 2026 11:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC83F3BE16C;
	Fri, 10 Apr 2026 11:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lb/ZmOTV"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9952C3BE167;
	Fri, 10 Apr 2026 11:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775822143; cv=none; b=kEBfWFebAkDCa4qz/1j92a1w4M2pv/Y41BPn3judM2idXrZH6beshAQ/tqwEwsuJLvTtX2O2cpgPWV7yc5kGGFlMmZAh1BYGeYJhIcbyyqe6Lho+O5z+1vJI+63KLVNOEPTDbY4/Z3eDuRnsX2MMMRSTXijb8MQ+ShydEC9Ahaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775822143; c=relaxed/simple;
	bh=mdpaoKvaXfKLinXjUDc/IbjJOXSHqFvXpOvUOnu9NX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+jbEnR2ZNHT1wXbrtt9H2vm+n2WT+F66DJHEcXhjeINNnqDWTE67cXbw+UcsGEiaCkSfuQA6pGI5pRnHgEuxMS9g1y1iaijUJO4xguW2/O0fewXGpgdn+8X3VcV+xlYVlOVYsdhWs7mNWH7Mo98piHNcUBeMTePXGZ8KECHDgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lb/ZmOTV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08420C19421;
	Fri, 10 Apr 2026 11:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775822143;
	bh=mdpaoKvaXfKLinXjUDc/IbjJOXSHqFvXpOvUOnu9NX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lb/ZmOTV/EI6r89sYKM9ULJyJetsrcgzEuFMg/9jkdKVHDvnAJGfhz6XABBV42pDE
	 tuDb+vDldQsgNNwYLOcZrBTikPs+k+KF+a7tGZuf4JesL90OlRBkKnyY9ttXH7PRhF
	 KMyZZBGUe7CHTFHem+Axjaq2pR3+kzKnCTPcWTdbknpkbY9bpWLqpkgQ//cSi7z7dW
	 JM9Z8kVYEjhEG/YrGw6zPJvyp3StfSjwyeG0Kz/ApB6/aG5lYpqf47YpvGvGF4AG1v
	 aj/jBzvtsjynVD3A0L6z5orp4L3dsfkgbRa0IwgajGiEEx72Ab5cFsooy/inKLAk6Q
	 sRx53daBp+a7Q==
Date: Fri, 10 Apr 2026 20:55:41 +0900
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
Message-ID: <20260410115541.GA1770099@rocinante>
References: <20260410055040.39233-1-kwilczynski@kernel.org>
 <20260410055040.39233-14-kwilczynski@kernel.org>
 <66eb23bf-1995-363f-78e6-f5a397a063a2@linux.intel.com>
 <20260410112132.GA1756033@rocinante>
 <f6c036e1-9145-e784-8a37-2486fc72978e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6c036e1-9145-e784-8a37-2486fc72978e@linux.intel.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3322-lists,linux-alpha=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 658293D671C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

> > > This looks like entirely separate two changes to me which just happen 
> > > within the same context.
> > 
> > True.  I could split this into two separate patches.  However, the early
> > return is so trivial, that I decided to keep it here, in lieu of that the
> > linked patch did, too.
> > 
> > Thoughts?
> 
> It's not just adding the early return that would go to the first patch but 
> you also need to rearrange the len for that. Effectively, the change is 
> split in half, each becoming cleaner and more focused (both diff and the 
> changelog text).
> 
> As is I'm left on the borderline, while I can see it's "correct" after 
> splitting those changes inside my head, I also know it could have been 
> done better. I'd easily given rev-by for both if they'd have been done 
> individually, saved the time writing these emails about it, and 
> effectively "forgotten" the patches (including upcoming versions of the 
> series).

A simple "yes, please split" would suffice. :)  For future reference.

Thank you!

	Krzysztof

