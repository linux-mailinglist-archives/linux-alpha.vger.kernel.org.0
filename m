Return-Path: <linux-alpha+bounces-3475-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qER9J1eq52kM/AEAu9opvQ
	(envelope-from <linux-alpha+bounces-3475-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Apr 2026 18:48:23 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 569CA43D91B
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Apr 2026 18:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 006F03010EFC
	for <lists+linux-alpha@lfdr.de>; Tue, 21 Apr 2026 16:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535F237BE8C;
	Tue, 21 Apr 2026 16:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKtJb3k7"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306C2362156;
	Tue, 21 Apr 2026 16:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776790101; cv=none; b=bU+sFHfWDM1R/3xLJu6vVJJyW0Kk1dLUG6bA6vPtJw54Q9I65ZISCwe0F/ngH7M2LANoOHwW7ssUFAKtM+GZhMggMLbUxY+WZlO/6VhZPb3mpy1XdZ6+HRqsit2xWXqLSOy0VBLCnkrUaAj4swrBg7X64cQBd5G9Fhv4bgj/xkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776790101; c=relaxed/simple;
	bh=ldA8hS36Kur5HttaL1WpXfyvcIQX+S7LJTsP2yQx2P4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B017dOhfJTLrYGeGv8jtMMjURALu4ypV4tsKOUSDwHfL2UbQfI3w1nKqqcPjVFmtP3mU31vJXMsI0uISMB5NaOGZI7DpgPMOpCtaIyBKjUHjLowbUNH3bhymfsRXBX0nps6xc0pxpSMjFUVgP8pa5wUOEalkI99tPIg3g12GC9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKtJb3k7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE14AC2BCB0;
	Tue, 21 Apr 2026 16:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776790100;
	bh=ldA8hS36Kur5HttaL1WpXfyvcIQX+S7LJTsP2yQx2P4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TKtJb3k7Kay0MG3ISkg3LhbpGSrbheYJDtfOn1hBJOJTqqvEXGcA4e8F28IpW9+Jo
	 2e1+y2LY2FXtCvdpqYkUHo2SkupBDHaSbSlRZXfk3RJ5nk3rwUtHUsYR4J4Z59uav/
	 MN7oY6qixAvr2QPMaY5zXNoZk3COzEmmnpI0vxHmGa8wqkD31NTExm2JIHiA+ZqfZq
	 AgOS0407XOYifMEPE1snxcqbR5mQ53GKe4IvBKPloLp+GP0zJzzTVCPBxachC2lyu6
	 6g5IaTdLpRGJrjAxPCSdo6DhogIsI0cMhfvWm+elIHmCvR9M/dgmpkdzNXhd6MYAP9
	 0Ss/SpKjiCW5g==
Date: Tue, 21 Apr 2026 09:48:20 -0700
From: Kees Cook <kees@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: luto@amacapital.net, wad@chromium.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH] selftests/seccomp: add Alpha support to seccomp_bpf
Message-ID: <202604210947.C4D4020@keescook>
References: <20260203063357.14320-1-linmag7@gmail.com>
 <202602041817.3967F048D@keescook>
 <CA+=Fv5S=XxDyNFdqhR3p_wEPwGEpjfE+Rqk1h1JJhactWFib_Q@mail.gmail.com>
 <CA+=Fv5SZK0eaT5Y_a-eTdZacFEcp36rF1YE=tyooDuVpZW=uOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+=Fv5SZK0eaT5Y_a-eTdZacFEcp36rF1YE=tyooDuVpZW=uOw@mail.gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3475-lists,linux-alpha=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-alpha@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-alpha];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 569CA43D91B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 07:13:09AM +0200, Magnus Lindholm wrote:
> Hi,
> 
> Alpha support for SECCOMP and SECCOMP_FILTER was just merged into Linus' tree.
> 
> See: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/alpha?id=55b22075f7840ef48254886758976531fe146609

It looks like the selftest changes still need to be landed?

-Kees

-- 
Kees Cook

