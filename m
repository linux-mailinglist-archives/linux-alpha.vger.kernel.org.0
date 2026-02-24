Return-Path: <linux-alpha+bounces-3013-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMq0ET9wnWk9QAQAu9opvQ
	(envelope-from <linux-alpha+bounces-3013-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Tue, 24 Feb 2026 10:32:47 +0100
X-Original-To: lists+linux-alpha@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B37EB184A78
	for <lists+linux-alpha@lfdr.de>; Tue, 24 Feb 2026 10:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CE68301939F
	for <lists+linux-alpha@lfdr.de>; Tue, 24 Feb 2026 09:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0AE36BCF1;
	Tue, 24 Feb 2026 09:32:44 +0000 (UTC)
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp-4.orcon.net.nz (smtp-4.orcon.net.nz [60.234.4.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DB8369982;
	Tue, 24 Feb 2026 09:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.234.4.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925564; cv=none; b=JuQ9fS/fP3qkEq1VND7rUtiIqCrLRf3Dk7cijIGIiicRJUhQTo8Eegw7NK1QR3TjDkzyj5aMMmE6YE7094haOoZuFi4O7kgEJRTlsUNYOoIODY8QFD9WqEe6EEDub325w3KcqOo6nxRtOrPxvUpNVt1+5Isi4ij3cEsIvReNobo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925564; c=relaxed/simple;
	bh=IOJgxaam+EX1KGnYY0VduJPKBbOwGW6h09urZlUbJOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Be4sov9JBvhfOw+j3sE3JPaa6Dzby+L6Nh+Dlb5mmeO7Mhd50qwDLKwfj2b4p9MhZ2ts3aDdaZAB4jhtpaLrBAaPnAXYeZFR1bmdJBpdbd8UmREgrNPQwBz3v3qI/u18m6ooi9pOS7pgNgcEgqyaN0TM1MI+r8vohyjAJ3bm0bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz; spf=pass smtp.mailfrom=orcon.net.nz; arc=none smtp.client-ip=60.234.4.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orcon.net.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orcon.net.nz
Received: from [121.99.247.178] (port=50414 helo=creeky)
	by smtp-4.orcon.net.nz with esmtpa (Exim 4.90_1)
	(envelope-from <mcree@orcon.net.nz>)
	id 1vuoAV-0002yB-L4; Tue, 24 Feb 2026 21:53:24 +1300
Date: Tue, 24 Feb 2026 21:53:15 +1300
From: Michael Cree <mcree@orcon.net.nz>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, mattst88@gmail.com,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	corbet@lwn.net, linux-doc@vger.kernel.org,
	glaubitz@physik.fu-berlin.de, macro@orcam.me.uk, macro@redhat.com,
	ink@unseen.parts
Subject: Re: [PATCH v2 0/1] alpha: add support for SECCOMP and SECCOMP_FILTER
Message-ID: <aZ1m-3sKgvvwDQFZ@creeky>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
	Magnus Lindholm <linmag7@gmail.com>, richard.henderson@linaro.org,
	mattst88@gmail.com, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, corbet@lwn.net,
	linux-doc@vger.kernel.org, glaubitz@physik.fu-berlin.de,
	macro@orcam.me.uk, macro@redhat.com, ink@unseen.parts
References: <20260220105757.25104-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220105757.25104-1-linmag7@gmail.com>
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[orcon.net.nz : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3013-lists,linux-alpha=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,vger.kernel.org,lwn.net,physik.fu-berlin.de,orcam.me.uk,redhat.com,unseen.parts];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcree@orcon.net.nz,linux-alpha@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-alpha];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,orcon.net.nz:email]
X-Rspamd-Queue-Id: B37EB184A78
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 11:50:09AM +0100, Magnus Lindholm wrote:
> This patch adds SECCOMP and SECCOMP_FILTER support to the Alpha
> architecture.
> 
> The seccomp-bpf selftests exercise syscall tracing, restart, and signal
> interaction paths that were previously untested on Alpha. To support
> these, the ptrace/strace syscall path is updated to reliably distinguish
> internal skip-dispatch from userspace invalid syscall numbers, ensuring
> that syscall(-1) continues to return -ENOSYS with correct r0/a3
> semantics.
> 
> Supporting seccomp also requires correct syscall restart handling when
> ptrace and signal delivery are involved. The traced syscall entry path
> now consistently tracks syscall state using r0, r1, and r2 while
> preserving Alpha's a3-based error reporting ABI:
> 
>   - r1 holds the mutable "current" syscall number
>   - r2 preserves the original syscall number for restart
>   - r0 and r19 (a3) retain their traditional roles as return value and
>     error indicator
> 
> This separation allows syscall restarts to be gated strictly on valid
> ERESTART* return codes in the ptrace/strace paths and prevents
> kernel-internal restart values from leaking into userspace.
> 
> Alpha also lacked support for PTRACE_GETREGSET(NT_PRSTATUS), causing
> ptrace-based seccomp tests to fail with -EIO. Minimal GETREGSET and
> SETREGSET support is added to export struct pt_regs directly.
> 
> With these changes applied, the seccomp-bpf and ptrace syscall selftests
> (seccomp_bpf, extended for Alpha) pass reliably on Alpha systems.
> 
> ---
> Changes since v1:
>  - Update features documentation for seccomp-filter/alpha
> Link: https://lore.kernel.org/linux-alpha/20260205133049.526-1-linmag7@gmail.com/T/#t
> 
> Magnus Lindholm (1):
>   alpha: add support for SECCOMP and SECCOMP_FILTER
> 

Passes the seccomp-bpf selftests and the live tests of Adrian's
alpha-support branch of libseccomp on my ES45.

Tested-by: Michael Cree <mcree@orcon.net.nz>

Cheers,
Michael.

