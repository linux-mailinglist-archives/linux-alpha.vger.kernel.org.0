Return-Path: <linux-alpha+bounces-3467-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sINnBU8Q4mkg1AAAu9opvQ
	(envelope-from <linux-alpha+bounces-3467-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Fri, 17 Apr 2026 12:49:51 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CE041A6D6
	for <lists+linux-alpha@lfdr.de>; Fri, 17 Apr 2026 12:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1F8B300340C
	for <lists+linux-alpha@lfdr.de>; Fri, 17 Apr 2026 10:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7257D39B959;
	Fri, 17 Apr 2026 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1BOBzqu"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E96B3750AC;
	Fri, 17 Apr 2026 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776422920; cv=none; b=f2qxKiZcPOweLEAaVZS0IAlsScM7FvZ/TppTThQ7XT7HFkQ/gH7mf/Sp+O7TT9RsQdAJY87XdTgePTkK0JkgewCwD3tjKcaaBoQwg8cSVjSv3WfsT03pzXRMQCvvjrpP3LbdSqAakUoT/2Rr8oEgodjEaFgKtsSYk928n392q4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776422920; c=relaxed/simple;
	bh=NZ4L5TbaryQyemnvmTo0G7UCfCM0zTYTfU0gMp+J5zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MClP0ShdRXbkJp8FClCOZNydGaTS7bVCohzowdW/L8evRJIij3rheFyh4d26Q3S/i3tG6f0HxOae0KlpIRK+wmp/ws/P1tfGb1LQcYpWPm/5TAtFMgLV+arc+9suVxr0bLhn8lzhS0fGn+kkGfMTHtXHKYTeeVlDmdMWz3T8hUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1BOBzqu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE93CC19425;
	Fri, 17 Apr 2026 10:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776422920;
	bh=NZ4L5TbaryQyemnvmTo0G7UCfCM0zTYTfU0gMp+J5zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1BOBzquaNxV3WPHm/o4jp4vDitleIK+cdy0/Bx5aIGXy3iKZsLYRTF883ul1SQ3h
	 v4Co5SpnbaEGEs0dad17Pc7L74SMR8QB6wdqBPcaE3ySu/WWplvgctNaDsDmoWBPdg
	 RRrDN6lPu05Kub391Mr1YIP6vBFrbaGofifgVoesvdYpwYSpTP0kaOXcHRB4NdmP10
	 l5B4U1luxObFMziVO9xXlDFWx8m/vQj2T9VsbjKmtHCEFEJk9qLvzxhTcA7GsND3F4
	 TKmet+i/EWVu5+glrHgNMvgvIi0iTyWNPns6RzIjFa1F6h179mRpssDGjrpIBtp7Qr
	 lF67Bv4Q2INcg==
Date: Fri, 17 Apr 2026 19:48:38 +0900
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
Subject: Re: [PATCH v4 12/24] alpha/PCI: Use BAR index in sysfs attr->private
 instead of resource pointer
Message-ID: <20260417104838.GC1625998@rocinante>
References: <20260411080148.471335-1-kwilczynski@kernel.org>
 <20260411080148.471335-13-kwilczynski@kernel.org>
 <36cdf28b-281f-46c7-d4b5-083675b61660@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36cdf28b-281f-46c7-d4b5-083675b61660@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-3467-lists,linux-alpha=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: A5CE041A6D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

> > While at it, add parentheses around the bitwise flag test in
> > pci_mmap_resource() to make the precedence explicit, and to
> > match the preferred style.
> 
> Probably not necessary to touch this line now at all as you're going to 
> replace it two patches later anyway so it just adds noise.
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Makes sense.  Taken care of this in v5.

Thank you!

	Krzysztof

