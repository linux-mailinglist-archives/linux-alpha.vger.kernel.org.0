Return-Path: <linux-alpha+bounces-2967-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Pp0Gpu9immmNQAAu9opvQ
	(envelope-from <linux-alpha+bounces-2967-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Tue, 10 Feb 2026 06:09:47 +0100
X-Original-To: lists+linux-alpha@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2A4116F84
	for <lists+linux-alpha@lfdr.de>; Tue, 10 Feb 2026 06:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B998302FE8D
	for <lists+linux-alpha@lfdr.de>; Tue, 10 Feb 2026 05:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4DA32B9B1;
	Tue, 10 Feb 2026 05:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJFD0SzL"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177762F5A1F;
	Tue, 10 Feb 2026 05:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770700114; cv=none; b=dgSMsCiNIKPWoN4bOX4Jnls1oEXqXSxqxCtZn0r/NdfCF2fm14r7RUUrpN7q/LHxCTippnHcP3s5Sq3POCe1mqCTi3hZjOxQz7UkXNzKEfpBu2JizgnJN9ucMrQwKhDSJOJdRQqqidVZsRLUWLJi3Ysv75KawxlkCD1r7q0GR4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770700114; c=relaxed/simple;
	bh=fvuUSWqPVHW2wY09VmebaeyWRdMRPzs4l53+Ybq3e74=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=gVr8HnxwfGiiBKLAbBPU4ijBNbTlfnnROQrR2WK1kPukgFC5nDRMEx15XwB4o2iEVoHGy5i0SnlnpvsOKU+qjWhFh23Pwv0FDk6dopww003kB7qvigm+r8/LqNTxHsnuSUHSOhR3CK+eZ4UyjZjaWafnLJsEhcAG1hU9MrDHMn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJFD0SzL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E7BC116C6;
	Tue, 10 Feb 2026 05:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770700113;
	bh=fvuUSWqPVHW2wY09VmebaeyWRdMRPzs4l53+Ybq3e74=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KJFD0SzL2ufryCd6GbSa40eeg/40/CmxQca88yaFHi/13wrC3Ey8Rd8kygThN0m8O
	 Uu1wMqQ/oLRzYQJGJdQOWxGRmgEHrHSBcDijAIGptKJa7vPOItU+6aUJvSKf0k5vKP
	 HsMDwSRpkQ2v5Xek6bRcwDw7+kq+R9RJTXfa2zhwtu9bTRDp31xVOM2olMf57tB4xV
	 iuzqJ3uwPQQzUQIAEhHBCnVUzs419kSTCuzLiNZ3R3ifahc+p7ZU2IuB6d0+YA35gD
	 E4zZx/0jc4A4CeE5wOIPaFR6NQ2y4W96h9sbtPJyM6NzHZQ55tyx1OCbtsaSd3uYhu
	 gikLkAlJsEgfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 851EC380AA5E;
	Tue, 10 Feb 2026 05:08:30 +0000 (UTC)
Subject: Re: [GIT PULL] alpha updates for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <aYno7V_aAa27Oxdt@z440.darklands.se>
References: <aYno7V_aAa27Oxdt@z440.darklands.se>
X-PR-Tracked-List-Id: <linux-alpha.vger.kernel.org>
X-PR-Tracked-Message-Id: <aYno7V_aAa27Oxdt@z440.darklands.se>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v7.0-tag
X-PR-Tracked-Commit-Id: dd5712f3379cfe760267cdd28ff957d9ab4e51c7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9f722cb7304f63d8be7164c15ebc278f54d14357
Message-Id: <177070010909.3352335.15865012526956614392.pr-tracker-bot@kernel.org>
Date: Tue, 10 Feb 2026 05:08:29 +0000
To: Magnus Lindholm <linmag7@gmail.com>
Cc: torvalds@linux-foundation.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, richard.henderson@linaro.org, mattst88@gmail.com, lindholm@kernel.org, glaubitz@physik.fu-berlin.de
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,vger.kernel.org,linaro.org,gmail.com,kernel.org,physik.fu-berlin.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2967-lists,linux-alpha=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-alpha@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-alpha];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DB2A4116F84
X-Rspamd-Action: no action

The pull request you sent on Mon, 9 Feb 2026 15:02:21 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v7.0-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9f722cb7304f63d8be7164c15ebc278f54d14357

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

