Return-Path: <linux-alpha+bounces-2998-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFjKOO9Bl2lXwAIAu9opvQ
	(envelope-from <linux-alpha+bounces-2998-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Thu, 19 Feb 2026 18:01:35 +0100
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56566160E35
	for <lists+linux-alpha@lfdr.de>; Thu, 19 Feb 2026 18:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAFDF302A2F4
	for <lists+linux-alpha@lfdr.de>; Thu, 19 Feb 2026 17:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8195F2C21D3;
	Thu, 19 Feb 2026 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTB+s/3y"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1945534A3AC
	for <linux-alpha@vger.kernel.org>; Thu, 19 Feb 2026 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771520435; cv=none; b=Yhrs4fwmPRNmqYNIRmWvI8UqwQCl3SOCXQjn1P+i8Hhq/4+WXxGSRtd0jITOkbGHEdP9UBAms24WoASfrRUNnrlE80E5lu6ttSobSU9MfmjdrhiKIj9b+Lual3zcx5yXZQEV5aWnslgVq6TFrqyzHbfw72jL5PZhwC+IIRbyV4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771520435; c=relaxed/simple;
	bh=rdaKtry86/IM4QZB2HtJKQKabxX9u5xLmrTh8hZHOWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cYNshLNdlCXYaTcVxEw4p/b0TLkqaLbm82gOqAWJDbLmv+RzezWw/IDKdzW/lEiQHlH5ioWeCQjYqF/r+ysxTVv6QAF1l1vuGGWFIJOXEf5T8fViXIToUzqqVitadpsNjwGnpePVA7bEDuG0bnYKkJisrS1W7oBA3PY/Rhy/slI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTB+s/3y; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so1193655e87.1
        for <linux-alpha@vger.kernel.org>; Thu, 19 Feb 2026 09:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771520432; x=1772125232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ax6hxysPDCJIFDsFMfjVQIik4hdtHQIW1zEvdhWDvys=;
        b=hTB+s/3yq6jNQkbmzMl4HVvGpcUVdUzE+pFWeqrSHd24fU9PW32x+ZxTGVKbVgS5df
         OoMBx9G4cqWuYQ4IIqCtRLXNKck61FJFl1nMEVaoZ4Qfrj1OOMcJXefAwmPDJkWwK6bf
         GipyXqAyCcwlGYruJV0QXk3ibHmOOcL6gmNPVb7SiQG06nEwstIu0OcaJJ32MqaO/6k1
         SvKneSkK1lTexY8bV4HBGAORORECT9R6N5J3G0+075YYfqAtO6ssjwNgkBE4mm4zwhZL
         mRrEs9KBA9PbBBmqhV9985/hgcz2IIgx3144u/ijTjIwe0pnkSSYVGpRypLSeclziq4O
         OX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771520432; x=1772125232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ax6hxysPDCJIFDsFMfjVQIik4hdtHQIW1zEvdhWDvys=;
        b=w90i/Ig1NklrYJH0j8DT54awLBkluVm5hrOCnBVW45oSl8WmWGojrUucLO4XYAzxn0
         BogClqWU/5RV69vUuqPvJFhrpoTyMhNHFyiYMRcbPSuTdP8oQ5hzk+pxIbjDkaNTobJb
         uSueBzNJH6EUp+KpNXY0W/UgIr30/8ucUF954UFH0AfvZWt1IL/GgQVQYuEG8LL25j6P
         ug1Ou9/FBNeeCHQEOD3thZUY9q9JPVCme8CozRcP8OqvkBrL2RilfJZHulGkEzHagkT9
         4i2TIssKNElRTaWYt7f4RGBZWW60H6Mox4MSUq9tjVq7x9RFoaQS+Gym6pRsxdY8PdwI
         Ba8A==
X-Forwarded-Encrypted: i=1; AJvYcCXuA+/2SJ+8a2yeC7np/s9lUMuA4jXPBqEeNFX7NplxSt1NF0vYEVID71tVEZZMtpUjZ+/ccedOlWXGTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwkzCE20qjtXsYf8E08WkINP0xXB+4qD2w+EErluV8ZaTZcaML
	FMrbJYZzAkGRbOaPSuEYOvJfZl47nwwEoWZWWqhKGe2EDJP6AstkSdQK
X-Gm-Gg: AZuq6aIddjfdkR6geEgHH2K+LOW4UZGGBhztd1T1DBA8mIwinTGEXQe6gpj/ypaWdg0
	d5NVkLrEe3GpqW6aveshRruWlO771ROLuhzjufK5sU/xJKWr9y7wa5UfoIFq3wpa5C/F6gcM+LP
	iZ21jjqdrxgf2MwjYWwtjEx4KiKIzfk+HkBXyceRgKYQeauXq1/3ZSMlhWGgcWtB6aU8+OWcspf
	H/HMgVWgDiEssqfynR5KTB5PYfb4RBXL/MDuRaD9/NNTv27DS9p9rbGIeXpGMz8OqyC1xqbyBRS
	B/rjNrtT3R+M94/693hR66+B4onve4oydXlnUfQDxiTmAZfu1hxbWfD9nA4F4QY3P905QKyLIfC
	dLo9PEAb4AoyaVrCdzUSeUh32tyo7ChO5KgG/jTcfbLFn4EiCLYC+pL3BrRQ7N5t2TnBauRxFND
	yVDfAUyt5fX/Nozt3L0LSJPJxN/dlRjpWhCz2wHJoh7NFEJd5gn75SztOTRsmx/ub5q6j7NGsZK
	zdoD62KpROnrOw287+YP6VP5OhKZndyjXw=
X-Received: by 2002:a05:6512:1150:b0:59e:6c24:3f91 with SMTP id 2adb3069b0e04-59f83bbcd19mr2094188e87.34.1771520431799;
        Thu, 19 Feb 2026 09:00:31 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b222esm5435943e87.80.2026.02.19.09.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:00:31 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	glaubitz@physik.fu-berlin.de,
	macro@orcam.me.uk,
	macro@redhat.com,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 0/1] Add support for HAVE_ARCH_JUMP_LABEL
Date: Thu, 19 Feb 2026 17:58:31 +0100
Message-ID: <20260219170013.15884-1-linmag7@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2998-lists,linux-alpha=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,physik.fu-berlin.de,orcam.me.uk,redhat.com,orcon.net.nz,unseen.parts,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmag7@gmail.com,linux-alpha@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-alpha];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 56566160E35
X-Rspamd-Action: no action

This patch adds jump label (static key) support for Alpha.
Testing and verification were performed on an UP2000+ system.

Verification steps:

  - Confirmed __jump_table section is present at runtime via
    /proc/kallsyms and contains a non-zero number of entries.

  - Instrumented arch_jump_label_transform() to log patch
    operations and verified instruction sites toggle between:

        NOP (bis $31,$31,$31, 0x47ff041f)
        BR  (br $31,target)

  - Added temporary instrumentation in
    arch_jump_label_transform() to log old/new instruction
    values at each patch site, and used a Python script to
    validate correct NOP/BR transitions and branch encoding,
    confirming functional runtime patching.

Instruction stream synchronization uses imb()/smp_imb() via
flush_icache_range(), and runtime behavior confirms correct
I-cache coherency.

The system remained stable throughout all testing.

Magnus Lindholm (1):
  alpha: Add support for HAVE_ARCH_JUMP_LABEL

 arch/alpha/Kconfig                  |  1 +
 arch/alpha/include/asm/jump_label.h | 66 +++++++++++++++++++++++
 arch/alpha/kernel/Makefile          |  1 +
 arch/alpha/kernel/jump_label.c      | 81 +++++++++++++++++++++++++++++
 4 files changed, 149 insertions(+)
 create mode 100644 arch/alpha/include/asm/jump_label.h
 create mode 100644 arch/alpha/kernel/jump_label.c

-- 
2.52.0


