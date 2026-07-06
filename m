Return-Path: <linux-alpha+bounces-3734-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D4p8IgbzS2pHdgEAu9opvQ
	(envelope-from <linux-alpha+bounces-3734-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Mon, 06 Jul 2026 20:25:10 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ED2714795
	for <lists+linux-alpha@lfdr.de>; Mon, 06 Jul 2026 20:25:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bUf5KWfk;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-alpha+bounces-3734-lists+linux-alpha=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-alpha+bounces-3734-lists+linux-alpha=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19F53348AFB4
	for <lists+linux-alpha@lfdr.de>; Mon,  6 Jul 2026 17:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB362EF64F;
	Mon,  6 Jul 2026 17:00:37 +0000 (UTC)
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098C42EBDDE
	for <linux-alpha@vger.kernel.org>; Mon,  6 Jul 2026 17:00:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357237; cv=none; b=k/0GWgmyThGVFCahE6SlE+ruM84CiFVd5sRYI6gKvuddV+rAAZZ5awH72AzoX0QYA2Tp55SEG+huEtuIdISlHIeIebYKEC9w8I/YnDu4dJOMBKCXPqI+9MPNE9VFNmN/xCikMdEs5C5w6vx4HJavwp4pwj/9N1J2tv9sAyvJllI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357237; c=relaxed/simple;
	bh=AA3VKNGfHagQnQ2acuVSruJOiHuJZ/EsfXIZigb6zDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvuM/9CPLW6GFebTwCtJhSdhlm6ulHsdoDgZkyawkoALzXOX5PZeem/joGvh+R4voILSkBGj0wT9p1ECWg2URCx9MNhW6cHIZtuHFbW6lLLFw5KiyyzlhpG7pcglQ+ysdze3cq0Smq4w5ubujchwazkoIOVegRWV4pKAycPq+GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUf5KWfk; arc=none smtp.client-ip=209.85.167.48
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aec139da7eso16204e87.1
        for <linux-alpha@vger.kernel.org>; Mon, 06 Jul 2026 10:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783357234; x=1783962034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diJVQrERcgRnNnAaxdJ5H+lmMbirK3Q8oXfz9l7IVJc=;
        b=bUf5KWfkZHJ4RaVu76GGzKoNi1gCmQWrwHHXW/TMZDsk+OqZxsHHf0aZA53oG5Uk9B
         buYAV09NQ1BRMepGdmIZArAkwxEa8KRMxM2CrIlTtvB7rCe2srpQImSPfYBZ8CUdIwFY
         rcN1BXvjCqbt/w5i7uQ5sANXPhZII8VBKig8zxZyCZ/8kQy1Cb7dlyvDaRQEyj+1Oe4a
         jOywCVxoehw9nusLMWP+U2lIg97MbFVizAwifRr1+xuWn07nwzqfM4cWxO2JX8g8yrjK
         ygCdYSWrvtckdFS230UdUur+IoYjPLbrP1Dfsqhn6/q7PJfjKMQWp8YwlxltQq4lUUyS
         t+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357234; x=1783962034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=diJVQrERcgRnNnAaxdJ5H+lmMbirK3Q8oXfz9l7IVJc=;
        b=IH7TyjyOhUzW0NEQB+oHut0tNqNx6S7CHX4vW8NzkNUhncaRJzCU7H6xCPW2ct0ZbT
         76vmZAJuSE51eSkJskZLz1MAuDWBaUeguj/N3l/nqu6Uyi89wTmgNHYMIYkt7xesnMMO
         yHj9gIEJH1183oEuSAc5iL7iKTjQ1fqUNZ61QbW0pWo90ilWJiCk75z1q63Cz/kCMnw7
         H5hWw09N0qNf3djj7rCqgQCuFaqhSttn1CQqR+XCLvICnuZAP4aMZDhZ4FjYkB8/KdJ8
         +3VoQXJ4ZPdYKiE9ks46HDrl/vm41taGEZwrywm+Oa13AOArRLFTmqK7QQQZr2cbpRL3
         3/Wg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7ONsQkTQccSMjMJV8T6EpeqPxnCzKDRIIxSJoeTIJuUQL5UcA8vIC60Daps1tTUt5IhMFcd5u2Efvpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeJVrfioDw0wRKvXMhHEukIDNusNfwaKY7WZZ9/iBRbKXs0/M/
	fZCbdmE061V+9rIB7tAiFHN+gZCwKIjQ1Vmh94JgZi/LkJu6nMom69n/
X-Gm-Gg: AfdE7cm0Xm7cGAQKV0WGnkAdTlZOjXgCHVOVnxBxEoIaMLLBWAhH2UFNaz2TaoZDL/+
	tNVDOaLi9Umbnsmx9BQe/fWA6QvbXSiL5/tY+C5bDiZaSwgGKumsngsUICut8uBSYDlqGfGLV5d
	lsnWAd3+6RoIwP2kZipDJBT87IMjmgAW8Fb/XKBRP/It1991B9sB0cK6Acf8DVER0tk5CjflMIQ
	EXtr+863HPWfzih+rssxPXmB9iDjkaNONO1EksywIvWNjHucoi64zNyYDBZAn5cggr46QPQ/tWL
	NtNbSggz+Ei3ws+T1Hhp+mQT6TSLJjMnUnkbkPJ36H0cDH3KzSov/hYNuf82hgnTA7ehaEJViPJ
	kTKvT3tUf0ndF7knb52vzyHScmpkSz9yxRq9HF2R6D2dZOzcWmigO0E6bLLha+pyLzKww+Q0oAK
	oE+grDTJRClnaKsAG8uh/HW/4Pt2rNcAe80n6xvyKPsSc1o0WvaEbp6Mhs/1vtOXT+4gz2QdfHT
	UJewuJySoPzxkBx+9nmD+PSTBV8rOWklS5ITQ==
X-Received: by 2002:a05:6512:65ca:b0:5ae:b0aa:fbf5 with SMTP id 2adb3069b0e04-5b007869280mr292927e87.22.1783357234016;
        Mon, 06 Jul 2026 10:00:34 -0700 (PDT)
Received: from buildhost.darklands.se (h-158-174-102-211.A469.priv.bahnhof.se. [158.174.102.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bfd1fsm2961021e87.55.2026.07.06.10.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:00:33 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	macro@orcam.me.uk,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v4 4/7] alpha: provide ftrace return address support for lockdep
Date: Mon,  6 Jul 2026 18:56:45 +0200
Message-ID: <20260706170019.2941459-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706170019.2941459-1-linmag7@gmail.com>
References: <20260706170019.2941459-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[linmag7@gmail.com,linux-alpha@vger.kernel.org];
	FREEMAIL_CC(0.00)[physik.fu-berlin.de,orcon.net.nz,unseen.parts,orcam.me.uk,gmail.com];
	TAGGED_FROM(0.00)[bounces-3734-lists,linux-alpha=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-alpha@vger.kernel.org,m:glaubitz@physik.fu-berlin.de,m:mcree@orcon.net.nz,m:ink@unseen.parts,m:macro@orcam.me.uk,m:linmag7@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmag7@gmail.com,linux-alpha@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-alpha];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9ED2714795

Lockdep uses ftrace_return_address() to report useful call sites for
lock acquisition and IRQ-state tracking diagnostics. Provide the Alpha
architecture hook using the compiler return-address builtin when frame
pointers are available.

Return zero when frame pointers are disabled, matching the existing
fallback behavior of architectures that cannot provide a reliable return
address.

This is a preparatory change for enabling lockdep support on Alpha.

Reviewed-by: Matt Turner <mattst88@gmail.com>
Tested-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/ftrace.h | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/ftrace.h b/arch/alpha/include/asm/ftrace.h
index 40a8c178f10d..7ec44134c804 100644
--- a/arch/alpha/include/asm/ftrace.h
+++ b/arch/alpha/include/asm/ftrace.h
@@ -1 +1,29 @@
-/* empty */
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ALPHA_FTRACE_H
+#define _ASM_ALPHA_FTRACE_H
+
+#ifdef CONFIG_FRAME_POINTER
+
+static void *alpha_ftrace_return_address0(void)
+	noinline notrace;
+static void *alpha_ftrace_return_address0(void)
+{
+	return __builtin_return_address(0);
+}
+
+#define ftrace_return_address0 alpha_ftrace_return_address0()
+
+/*
+ * __builtin_return_address() requires a constant integer argument.
+ * Keep this as a macro so the value is seen at the callsite.
+ */
+#define ftrace_return_address(n) __builtin_return_address(n)
+
+#else  /* !CONFIG_FRAME_POINTER */
+
+#define ftrace_return_address0 0UL
+#define ftrace_return_address(n) ((void)(n), 0UL)
+
+#endif /* CONFIG_FRAME_POINTER */
+
+#endif /* _ASM_ALPHA_FTRACE_H */
-- 
2.53.0


