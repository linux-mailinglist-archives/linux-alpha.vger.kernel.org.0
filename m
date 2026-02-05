Return-Path: <linux-alpha+bounces-2946-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Pc5F6mbhGmI3wMAu9opvQ
	(envelope-from <linux-alpha+bounces-2946-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Thu, 05 Feb 2026 14:31:21 +0100
X-Original-To: lists+linux-alpha@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A467F349A
	for <lists+linux-alpha@lfdr.de>; Thu, 05 Feb 2026 14:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0CC23025F4B
	for <lists+linux-alpha@lfdr.de>; Thu,  5 Feb 2026 13:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA2620B810;
	Thu,  5 Feb 2026 13:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmtYRRa7"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2CF203710
	for <linux-alpha@vger.kernel.org>; Thu,  5 Feb 2026 13:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298270; cv=none; b=M7dgF/AUWB+x6CzWRiyq0nnhBqf4z4rBee5sejZs9K5JC2SHh91HDwt4cSGXMdIay47bgO2xtHe97n4Y9dj7wRHGMw9NW5UwaPUPXMMcnHAu/egx+NmptGT5VUbkPeMjjBeEZtR1+Iy3Rls4G0G8Cio5y/RMHYKFAs/CVZfBoO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298270; c=relaxed/simple;
	bh=Sc0Mvu4xGJVrhUtvyEpGspM9NT8oDTwbLnrdZbuVQ5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j3bkXAMPe75XNzzskw4sRsy2O0mGsgx0GoMHnwrJ7w6HMjvV3Kuqgrxl+tFANDwt5BmDOUDh6mzk6ZQW4giZw77RsaCmg6ZknebpSf/jbk6/U09+bEx3DUdTisi/mYjdXJuuFUi8LZi081n3UgN6rM7a0vVOm1ipr1XjnBq/mXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmtYRRa7; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-386714da2a2so6613701fa.1
        for <linux-alpha@vger.kernel.org>; Thu, 05 Feb 2026 05:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770298268; x=1770903068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fu2UnsUFO+u51/p0vJ6mIQ1IKDWayrFs6KeGusjWPU8=;
        b=HmtYRRa7BlnKGNPqpPIeKy3zJvsgeK1IuggnKbGSYk/Y+axPFYQZ9X+5fcTPTA6az8
         KUsYlmB+YDhjLKxj1I7GeEx7k6Eh9kALkVjms3sGbp1Xz+tBeIlEECuQwe/X9y6U6JGa
         +NMaPe33JaddJJq6QYOgv+SNo98E3QyZXHIk4s3G0m4OwpSuk9gsU7FO0M4TAxpdep6x
         5cDULbXY4ol5C/29aSPVdLOM4cqRQRYiLnfN9AxbebK2sf0EsAB/jpv4g2iG+9ToXtzI
         5SD7gKsO3RdNdI+YahDPtsQDLnLyFwoqTXK48pTeP62Rgrff8HwUBX9HhpyG/QoMLB3w
         gLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770298269; x=1770903069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fu2UnsUFO+u51/p0vJ6mIQ1IKDWayrFs6KeGusjWPU8=;
        b=WoGmEOxjDHLwFBt5plUkmW7jFDMB54qWzEnn2oAuQvKSjL8pmCNyxEIEPbNc4tLtip
         H1/MdMeIs3axyYXjYF46Mr7vvVntpKQbEzdtEhEGOGajG4XmGO8+auVLo9ZeVqZYbMvv
         h/U75jje9hR411spZjGxe659WU+RRLnqwqBcuCdESDl2rUWY6+rWK3csDK8PS6ZwAxHp
         JhgU4KrhrIweLuAU1zuWKGXV6nteccaxGroS7xvn5qj2acKm9RqkIF5b2Uog2EbWezKE
         pFL68z6/Bpp7S1JjMoyxjy+pCCH0jD74JjoVIYtE0knUBxtJpVDC/uCN3t0v8xiFxI0J
         fhKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhdVjzZNbLKwacapV/9ZSLKxERFXQXXPYgXPhCi7tCcICY15HBxU37S8CYAe6chdmEz6HUIgj1Ga2Q1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP1mIBlqyjdeF0tjKlWRsCxcLq3C81cLEx2Sj1bmUw+gTRuBVS
	MhIP2K4J43Je3T/kIXWHYymRptMgCCgfsW3k/NwQzDrSIe5tSSYUIuHN
X-Gm-Gg: AZuq6aJS4eyH3Uedn5PklzwyjU5jfDztwfUH3cgy5RB/v+Ss5LLDz8gDnXXbOKhRuGK
	a8iFiRUKPvquBkQ9veIMoAjZL9IkUCTsPOFiTzuYi4H+5iEs2csrY9+53Rr8ZxDo5786Le5cz1r
	T7z7bkFHvKaQFDA4FbMk1behKxPL91nQR+8YvvCdMRdkVnBMYSVZ6R41PmKFV3GC/WZJ8KBI/57
	lyA/65spMj+qlc5av2s3QRIpkqv4Lb6Y3cmkWzb/pPfwCr/t+T5MnFIz5kn1bo1mCEIWanonHJc
	miQCZypQ2mVeLl/fNI+yx2TDiXXJ/EyHu3VC5NIgFBTPks7niF6RKP5JJOE/Bmy//bUFnkCFdRo
	CQNqw2/wzw9oa9Mme3spKbPDbiA5nlo831z8cxxAZ2l3oA5A0/3RCt9K5mLVM7VhOrZv+mvAXvI
	f/wiZwlZ6TUQcuiBRvBu1amK5zxIaKys4i9c7TyHOZ06pr5can4UWvo02f8SainOx6tPU3bYaH2
	x7bzGy3aJmJofDIdIPlHMlHrEyKm6QPGQ==
X-Received: by 2002:a05:651c:30ca:b0:383:1832:9586 with SMTP id 38308e7fff4ca-38691c4e181mr23856971fa.1.1770298268219;
        Thu, 05 Feb 2026 05:31:08 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38691f6e2d6sm10151971fa.5.2026.02.05.05.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 05:31:07 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	glaubitz@physik.fu-berlin.de,
	macro@orcam.me.uk,
	macro@redhat.com,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	kees@kernel.org
Cc: Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 0/1] alpha: add support for SECCOMP and SECCOMP_FILTER
Date: Thu,  5 Feb 2026 14:29:14 +0100
Message-ID: <20260205133049.526-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2946-lists,linux-alpha=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,physik.fu-berlin.de,orcam.me.uk,redhat.com,orcon.net.nz,unseen.parts,vger.kernel.org,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmag7@gmail.com,linux-alpha@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-alpha];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0A467F349A
X-Rspamd-Action: no action

This patch adds SECCOMP and SECCOMP_FILTER support to the Alpha
architecture.

The seccomp-bpf selftests exercise syscall tracing, restart, and signal
interaction paths that were previously untested on Alpha. To support
these, the ptrace/strace syscall path is updated to reliably distinguish
internal skip-dispatch from userspace invalid syscall numbers, ensuring
that syscall(-1) continues to return -ENOSYS with correct r0/a3
semantics.

Supporting seccomp also requires correct syscall restart handling when
ptrace and signal delivery are involved. The traced syscall entry path
now consistently tracks syscall state using r0, r1, and r2 while
preserving Alpha's a3-based error reporting ABI:

  - r1 holds the mutable "current" syscall number
  - r2 preserves the original syscall number for restart
  - r0 and r19 (a3) retain their traditional roles as return value and
    error indicator

This separation allows syscall restarts to be gated strictly on valid
ERESTART* return codes in the ptrace/strace paths and prevents
kernel-internal restart values from leaking into userspace.

Alpha also lacked support for PTRACE_GETREGSET(NT_PRSTATUS), causing
ptrace-based seccomp tests to fail with -EIO. Minimal GETREGSET and
SETREGSET support is added to export struct pt_regs directly.

With these changes applied, the seccomp-bpf and ptrace syscall selftests
(seccomp_bpf, extended for Alpha) pass reliably on Alpha systems.

Magnus Lindholm (1):
  alpha: add support for SECCOMP and SECCOMP_FILTER

 arch/alpha/Kconfig                   |   2 +
 arch/alpha/include/asm/seccomp.h     |  13 +++
 arch/alpha/include/asm/syscall.h     |  90 +++++++++++++++++++-
 arch/alpha/include/asm/thread_info.h |  16 +++-
 arch/alpha/kernel/entry.S            | 123 +++++++++++++++++++++++----
 arch/alpha/kernel/ptrace.c           |  83 ++++++++++++++++--
 6 files changed, 304 insertions(+), 23 deletions(-)
 create mode 100644 arch/alpha/include/asm/seccomp.h

-- 
2.52.0


