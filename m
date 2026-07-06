Return-Path: <linux-alpha+bounces-3731-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XTRuALv3S2pDdwEAu9opvQ
	(envelope-from <linux-alpha+bounces-3731-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Mon, 06 Jul 2026 20:45:15 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98073714A17
	for <lists+linux-alpha@lfdr.de>; Mon, 06 Jul 2026 20:45:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=o6BqMngv;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-alpha+bounces-3731-lists+linux-alpha=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-alpha+bounces-3731-lists+linux-alpha=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40FA9346BA77
	for <lists+linux-alpha@lfdr.de>; Mon,  6 Jul 2026 17:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A39A2EC54A;
	Mon,  6 Jul 2026 17:00:36 +0000 (UTC)
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E45213DDAA
	for <linux-alpha@vger.kernel.org>; Mon,  6 Jul 2026 17:00:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357235; cv=none; b=nkS/nYSEOcENSx4p3KYi74Q+wRnvnARG6XNraN3r/ZFH30rtKzOpXH+Uo3deAaxTTQ5q1TgBk1H6Ir9JgbMJHcMtBK6OUt7DCucXo3b0RnF1VO4/Jjs+2xBWUfTntb7dXnJ2GiWV3gUy5rtstIVL6mKb6HIldL+zBRB7J/ZSvRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357235; c=relaxed/simple;
	bh=sxmyOWeTHHxi3XZ7/n/lZPH/SI1SxJQvJMP+vMzWDwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bRATjf8ZWFJ5xtqDmC5zAHvfCFhA6nmJleXRpJUsPxRAUA0OZ8SX69+fVogeC5YdUVkcWqu2aQZfdQztXNxvtPKhIY2ZG14PAr0iEFMkM5B2XiXWm8taHcDxfxf4+Fp2zT+5EA0slQDUx7589WF7ps76gCCtisyoXZGIBIw9A0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6BqMngv; arc=none smtp.client-ip=209.85.167.52
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aebd52488cso3485939e87.2
        for <linux-alpha@vger.kernel.org>; Mon, 06 Jul 2026 10:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783357232; x=1783962032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyvz3ufjy6ivfzF2sNltt0RdDD9Xm6yL7j4zOBoOGug=;
        b=o6BqMngvfAxkajx65TNKKeUOKIRYOPyLYldsB+w5bCCK2NYNXcMvsPsKMcO5nppyzt
         6LPE3eRniUL4P0jaIY9mbbOihtWeugqwmCvhgPQA6mbMKo+n/UCI6PNlSqTBomJoo6zu
         PRuB4EWg9PXOOWFQJGtISkKwdhHJhHQvp1iZktO2CqigRPid09/Mz8AYW5UfUMSUzU8/
         sj6f51RBXhjXLHUMzifRuq86602ILOShXpdjkOxMmEomZK/yFJgPUtEv0FlIkprUEeti
         KBUQB+F4ZeU1z/WhZ7L9znAYprWVmiN0eEMkTD5g7xBQDkR9596pd7IwS9xi5OXN3eyv
         f70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357232; x=1783962032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zyvz3ufjy6ivfzF2sNltt0RdDD9Xm6yL7j4zOBoOGug=;
        b=mAgyuE7zh32J8rHn424dgQWwkvWcKsANlfSnn1esTZ/cZ+x+qaucjYnE9H10LtMXTN
         ZO0B5RJQvCPtxiXqPU3+D77DN7X5uJB+Lsr+c4LqjbdphLtL4JNmr9lWOS0hofOorA2J
         09ABMz1JuxGg6tjJiPmfGFU0/y4kKdcj63JxAZUiOMjHOhm6hmxsweGgs6nuk08PbgDM
         6qAfFCTWu6JTu5AvaWY+h3uo6yIQWeEa0Hg2AAQqayth3y1MukeByrDAMSvYtzSuttbO
         gI4GLuIR92ynNhrnje7IJ3tdqbsplCuzCFHlW0ldxxNBrF3q8VDJsj4UCCoGMMqEO6s/
         f2XQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZPs2fxOL+EfCk7xOLC0kSHLd61TjVjK29pHGG2Ucpox9KXNKz1tNwtu8d9YavkdntiwipENbERCJKgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa5K1hdDYUfw2gTOushotiU4oIa1Lnz2kEExQGp6Ix7EMDuq3W
	sPSWuSHldQg/7vnFaSyF3xflGj2q4R5EGvMQl27H+vOU+fDbC1PPn8Qy
X-Gm-Gg: AfdE7cnESyZij3+m92fd5FL4YY0lX2aD0bal21JMih6/y967+3LUF+MpdofWaZCHqN9
	FAy0FY5M0Q+Zgoh121ggYYennCQVT54+ovbOj372UQcEOa5MLT9Hv57ol3UKg1RnDoX+mD/fvr7
	+brsNj9NK5Tvodm0fLjd9Jefj4CwiQBodnzKetZuz7+9gQkDVSEtT9p0jgIFpnsan+mZtK8Tkrk
	MHHrvmjU75rN0uExXP1Rw3pp14PeqO1f3RLovzFOkNarx7PL6TCTEM18T8Kjfrqgpc1kaGtTKJn
	r5I0du6/INLgNZ+5KsTp8B5rSnAbx3H9SjUK9pd1ZHXu4K6MV4VcgVowK66qKj5EVltrV68p3Me
	Q0b0oXbIr9ue2ugiHgZ7e52wQctzSi+QnUILAxBez7dBnFF/bF67rMQ9FVJOe6frJBu7lP0JhSs
	t1kGgxTHEPhFgIYxoxGEM6dem5GoARAeIKJ57K/R/hBdw+ihZL1BuA+xTI78bUcsbvhZwjnTO41
	SOFkO+U1CiMSWIvUqBDqGkAYDw=
X-Received: by 2002:ac2:4199:0:b0:5ae:be30:ecb1 with SMTP id 2adb3069b0e04-5b007bca543mr215907e87.65.1783357232043;
        Mon, 06 Jul 2026 10:00:32 -0700 (PDT)
Received: from buildhost.darklands.se (h-158-174-102-211.A469.priv.bahnhof.se. [158.174.102.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bfd1fsm2961021e87.55.2026.07.06.10.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:00:31 -0700 (PDT)
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
Subject: [PATCH v4 2/7] alpha: add ARCH_STACKWALK-based stacktrace support
Date: Mon,  6 Jul 2026 18:56:43 +0200
Message-ID: <20260706170019.2941459-3-linmag7@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[linmag7@gmail.com,linux-alpha@vger.kernel.org];
	FREEMAIL_CC(0.00)[physik.fu-berlin.de,orcon.net.nz,unseen.parts,orcam.me.uk,gmail.com];
	TAGGED_FROM(0.00)[bounces-3731-lists,linux-alpha=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-alpha@vger.kernel.org,m:glaubitz@physik.fu-berlin.de,m:mcree@orcon.net.nz,m:ink@unseen.parts,m:macro@orcam.me.uk,m:linmag7@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98073714A17

Implement arch_stack_walk() for Alpha using a simple kernel
stack scanning walker. Start from regs+1 for current tasks
to skip pt_regs and use pcb.ksp for blocked tasks. Filter
candidates with __kernel_text_address() and stop at stack
bounds via kstack_end().

Enable CONFIG_STACKTRACE_SUPPORT and CONFIG_ARCH_STACKWALK
so generic stacktrace users (dump_stack(), /proc/*/stack,
SysRq backtraces, etc.) work on Alpha.

This provides functional in-kernel stack traces without
requiring frame pointer unwinding.

Reviewed-by: Matt Turner <mattst88@gmail.com>
Tested-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig              |  4 +++
 arch/alpha/kernel/Makefile      |  3 +-
 arch/alpha/kernel/stacktrace.c  | 61 +++++++++++++++++++++++++++++++++
 arch/alpha/kernel/vmlinux.lds.S |  2 ++
 4 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 arch/alpha/kernel/stacktrace.c

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index f3b882835617..7ac435c56845 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -39,6 +39,7 @@ config ALPHA
 	select MODULES_USE_ELF_RELA
 	select ODD_RT_SIGACTION
 	select OLD_SIGSUSPEND
+	select ARCH_STACKWALK
 	select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
 	select MMU_GATHER_NO_RANGE
 	select MMU_GATHER_RCU_TABLE_FREE
@@ -80,6 +81,9 @@ config PGTABLE_LEVELS
 config AUDIT_ARCH
 	bool
 
+config STACKTRACE_SUPPORT
+	def_bool y
+
 menu "System setup"
 
 choice
diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index 187cd8df2faf..4ea5c189e60e 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -9,7 +9,8 @@ ccflags-y	:= -Wno-sign-compare
 
 obj-y    := head.o entry.o traps.o process.o osf_sys.o irq.o \
 	    irq_alpha.o signal.o setup.o ptrace.o time.o \
-	    systbls.o err_common.o io.o bugs.o termios.o
+	    systbls.o err_common.o io.o bugs.o termios.o \
+	    stacktrace.o
 
 obj-$(CONFIG_VGA_HOSE)	+= console.o
 obj-$(CONFIG_SMP)	+= smp.o
diff --git a/arch/alpha/kernel/stacktrace.c b/arch/alpha/kernel/stacktrace.c
new file mode 100644
index 000000000000..74d95f591039
--- /dev/null
+++ b/arch/alpha/kernel/stacktrace.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/sched.h>
+#include <linux/sched/task_stack.h>
+#include <linux/stacktrace.h>
+#include <linux/kallsyms.h>
+
+#include <asm/thread_info.h>
+#include <asm/ptrace.h>
+
+static __always_inline unsigned long alpha_get_current_ksp(void)
+{
+	unsigned long sp;
+
+	asm volatile("mov $30, %0" : "=r"(sp));
+	return sp;
+}
+
+static void alpha_scan_kernel_stack(unsigned long ksp,
+				    stack_trace_consume_fn consume_entry,
+				    void *cookie)
+{
+	unsigned long *p = (unsigned long *)ksp;
+
+	if (unlikely(ksp & (sizeof(unsigned long) - 1)))
+		return;
+
+	while (!kstack_end(p)) {
+		unsigned long addr = READ_ONCE_NOCHECK(*p++);
+
+		if (!__kernel_text_address(addr))
+			continue;
+
+		if (!consume_entry(cookie, addr))
+			break;
+	}
+}
+
+noinline void arch_stack_walk(stack_trace_consume_fn consume_entry,
+				      void *cookie,
+				      struct task_struct *task,
+				      struct pt_regs *regs)
+{
+	unsigned long ksp;
+
+	if (!task)
+		task = current;
+
+	if (regs && task == current) {
+		/*
+		 * pt_regs is stored on the kernel stack; regs+1 matches
+		 * what arch/alpha/kernel/traps.c uses as the trace start.
+		 */
+		ksp = (unsigned long)(regs + 1);
+	} else if (task == current) {
+		ksp = alpha_get_current_ksp();
+	} else {
+		ksp = task_thread_info(task)->pcb.ksp;
+	}
+
+	alpha_scan_kernel_stack(ksp, consume_entry, cookie);
+}
diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index 2d136c63db16..95704e64b6a6 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -28,6 +28,8 @@ SECTIONS
 		TEXT_TEXT
 		SCHED_TEXT
 		LOCK_TEXT
+		IRQENTRY_TEXT
+		SOFTIRQENTRY_TEXT
 		*(.fixup)
 		*(.gnu.warning)
 	} :text
-- 
2.53.0


