Return-Path: <linux-alpha+bounces-1944-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2960A30082
	for <lists+linux-alpha@lfdr.de>; Tue, 11 Feb 2025 02:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3D551885AD8
	for <lists+linux-alpha@lfdr.de>; Tue, 11 Feb 2025 01:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BA91D5154;
	Tue, 11 Feb 2025 01:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tRJkQRTH"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4559EC5;
	Tue, 11 Feb 2025 01:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739237491; cv=none; b=JUTr+WqVVRT+dF22E6lIWIATQdwZ+i/U/HSCOfQcDYtMPJB8DzXGaKjk4AnAFYszmw+TlCxTDneMBLl8nU4I+/Zb9qkkcX3uRIDg0FwtpevYhXS2JyfrdK4WZ5H9pss6JkiUGhjb2Tt9L+34az5AwogoMpRMfOnaNT8vExh3IVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739237491; c=relaxed/simple;
	bh=Ig8qMJYAZQesBNaEZK5qBZeRt3E0wfZj2uGiS9IzUYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nEX5qvLrpxnB35fpSnre1W/B2UC9ZtWRi2u2kKo6BOP3d/vTA8WLkN6uEnVtxLmBQCLtjMMrJAmtwILoFkEWdPPNqKzGWBAVKf1sJQh4qTUnlfZtISvE1VU2FTw6+k9szBhyQzYeLpRVxiUFgdXvId1htB94TBbHKfyN84Op5YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tRJkQRTH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BA9C4CED1;
	Tue, 11 Feb 2025 01:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739237491;
	bh=Ig8qMJYAZQesBNaEZK5qBZeRt3E0wfZj2uGiS9IzUYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tRJkQRTHAURM9owh9TbWPruUwz96QVSbCA0oYnlfjTkSP/kF5GmP9Shwyi7z0jN0A
	 V7mFOp0XEZEhgBiZIbzf7yTVduaa3PWFEI5TuPuuSY0FMbSUOUTa2tofhGH2Qj+oiT
	 5gGNNmR7IYbcPMBQpU77Z1+o2YxXV0IHBPgPfjMnCcwK1Vy10obNMm4XIw1yIX5DCJ
	 J21/wJ9B89sOsnTq6nNHXQEYwrWPZb1RB23g2j0PinTinoeWjNZ8wupxGGjF/Vr5UA
	 XsC2TScd3n3RwD8Q//ADX7oYkUycyi+9FRNy4YB9pOO2MGU4yGYPMRvY19lpNqqd3Q
	 RWqm+gWqsgnHA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kees Cook <kees@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mattst88@gmail.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com,
	linux-alpha@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH AUTOSEL 6.12 17/19] alpha/elf: Fix misc/setarch test of util-linux by removing 32bit support
Date: Mon, 10 Feb 2025 20:30:45 -0500
Message-Id: <20250211013047.4096767-17-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211013047.4096767-1-sashal@kernel.org>
References: <20250211013047.4096767-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.13
Content-Transfer-Encoding: 8bit

From: "Eric W. Biederman" <ebiederm@xmission.com>

[ Upstream commit b029628be267cba3c7684ec684749fe3e4372398 ]

Richard Henderson <richard.henderson@linaro.org> writes[1]:

> There was a Spec benchmark (I forget which) which was memory bound and ran
> twice as fast with 32-bit pointers.
>
> I copied the idea from DEC to the ELF abi, but never did all the other work
> to allow the toolchain to take advantage.
>
> Amusingly, a later Spec changed the benchmark data sets to not fit into a
> 32-bit address space, specifically because of this.
>
> I expect one could delete the ELF bit and personality and no one would
> notice. Not even the 10 remaining Alpha users.

In [2] it was pointed out that parts of setarch weren't working
properly on alpha because it has it's own SET_PERSONALITY
implementation.  In the discussion that followed Richard Henderson
pointed out that the 32bit pointer support for alpha was never
completed.

Fix this by removing alpha's 32bit pointer support.

As a bit of paranoia refuse to execute any alpha binaries that have
the EF_ALPHA_32BIT flag set.  Just in case someone somewhere has
binaries that try to use alpha's 32bit pointer support.

Link: https://lkml.kernel.org/r/CAFXwXrkgu=4Qn-v1PjnOR4SG0oUb9LSa0g6QXpBq4ttm52pJOQ@mail.gmail.com [1]
Link: https://lkml.kernel.org/r/20250103140148.370368-1-glaubitz@physik.fu-berlin.de [2]
Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Link: https://lore.kernel.org/r/87y0zfs26i.fsf_-_@email.froward.int.ebiederm.org
Signed-off-by: Kees Cook <kees@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/alpha/include/asm/elf.h       |  6 +-----
 arch/alpha/include/asm/pgtable.h   |  2 +-
 arch/alpha/include/asm/processor.h |  8 ++------
 arch/alpha/kernel/osf_sys.c        | 11 ++---------
 4 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/arch/alpha/include/asm/elf.h b/arch/alpha/include/asm/elf.h
index 4d7c46f50382e..50c82187e60ec 100644
--- a/arch/alpha/include/asm/elf.h
+++ b/arch/alpha/include/asm/elf.h
@@ -74,7 +74,7 @@ typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
 /*
  * This is used to ensure we don't load something for the wrong architecture.
  */
-#define elf_check_arch(x) ((x)->e_machine == EM_ALPHA)
+#define elf_check_arch(x) (((x)->e_machine == EM_ALPHA) && !((x)->e_flags & EF_ALPHA_32BIT))
 
 /*
  * These are used to set parameters in the core dumps.
@@ -137,10 +137,6 @@ extern int dump_elf_task(elf_greg_t *dest, struct task_struct *task);
 	: amask (AMASK_CIX) ? "ev6" : "ev67");	\
 })
 
-#define SET_PERSONALITY(EX)					\
-	set_personality(((EX).e_flags & EF_ALPHA_32BIT)		\
-	   ? PER_LINUX_32BIT : PER_LINUX)
-
 extern int alpha_l1i_cacheshape;
 extern int alpha_l1d_cacheshape;
 extern int alpha_l2_cacheshape;
diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 635f0a5f5bbde..02e8817a89212 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -360,7 +360,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 
 extern void paging_init(void);
 
-/* We have our own get_unmapped_area to cope with ADDR_LIMIT_32BIT.  */
+/* We have our own get_unmapped_area */
 #define HAVE_ARCH_UNMAPPED_AREA
 
 #endif /* _ALPHA_PGTABLE_H */
diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/processor.h
index 55bb1c09fd39d..5dce5518a2111 100644
--- a/arch/alpha/include/asm/processor.h
+++ b/arch/alpha/include/asm/processor.h
@@ -8,23 +8,19 @@
 #ifndef __ASM_ALPHA_PROCESSOR_H
 #define __ASM_ALPHA_PROCESSOR_H
 
-#include <linux/personality.h>	/* for ADDR_LIMIT_32BIT */
-
 /*
  * We have a 42-bit user address space: 4TB user VM...
  */
 #define TASK_SIZE (0x40000000000UL)
 
-#define STACK_TOP \
-  (current->personality & ADDR_LIMIT_32BIT ? 0x80000000 : 0x00120000000UL)
+#define STACK_TOP (0x00120000000UL)
 
 #define STACK_TOP_MAX	0x00120000000UL
 
 /* This decides where the kernel will search for a free chunk of vm
  * space during mmap's.
  */
-#define TASK_UNMAPPED_BASE \
-  ((current->personality & ADDR_LIMIT_32BIT) ? 0x40000000 : TASK_SIZE / 2)
+#define TASK_UNMAPPED_BASE (TASK_SIZE / 2)
 
 /* This is dead.  Everything has been moved to thread_info.  */
 struct thread_struct { };
diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index c0424de9e7cda..077a1407be6d7 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1211,8 +1211,7 @@ SYSCALL_DEFINE1(old_adjtimex, struct timex32 __user *, txc_p)
 	return ret;
 }
 
-/* Get an address range which is currently unmapped.  Similar to the
-   generic version except that we know how to honor ADDR_LIMIT_32BIT.  */
+/* Get an address range which is currently unmapped. */
 
 static unsigned long
 arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
@@ -1231,13 +1230,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		       unsigned long len, unsigned long pgoff,
 		       unsigned long flags, vm_flags_t vm_flags)
 {
-	unsigned long limit;
-
-	/* "32 bit" actually means 31 bit, since pointers sign extend.  */
-	if (current->personality & ADDR_LIMIT_32BIT)
-		limit = 0x80000000;
-	else
-		limit = TASK_SIZE;
+	unsigned long limit = TASK_SIZE;
 
 	if (len > limit)
 		return -ENOMEM;
-- 
2.39.5


