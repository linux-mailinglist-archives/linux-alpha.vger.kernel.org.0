Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A88B5AA54C
	for <lists+linux-alpha@lfdr.de>; Fri,  2 Sep 2022 03:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbiIBBuU (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 1 Sep 2022 21:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbiIBBuR (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Thu, 1 Sep 2022 21:50:17 -0400
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012424A819
        for <linux-alpha@vger.kernel.org>; Thu,  1 Sep 2022 18:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=BtUZg/CdIQsVW3UUeS4SX3+3PrXqLyJJdIBP1rCSoLc=; b=Z9LmjQFJCfr85gjm/vgPZsf3DN
        SyWEB0+pnPL4LOkMJhbnphFm+ps0A1icYenzBQ5TVSnilJrnHUy1Aa/XFhJLKqYkQru8eFLk2xH/0
        uv4J2Z5QF5/xsH2Dmri4fs7tUzQMtPmyUSJSQAnX8rSgQJSyXBpFtG3xVX4IuUGiXD7fZP49nsMSo
        0pG5hbyoz0r0t7+5eaiWeo8MucusOLt1khLj6XeaHClOok48gU/WLVwLvz+ZqkOqrvM8paR/eacCD
        h0JQsY96pX4NMw8poPeEU/LUbSe/qor90yGNofFZHR36TTv0DxQp6XPLnlKPcr6N0SbrBMr6nRMnt
        4x4wYjUg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat Linux))
        id 1oTvoz-00BBAe-DF;
        Fri, 02 Sep 2022 01:50:13 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     linux-alpha@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 7/7] alpha: lazy FPU switching
Date:   Fri,  2 Sep 2022 02:50:12 +0100
Message-Id: <20220902015012.2664521-7-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
References: <YxFhB4/cEXX5aHbn@ZenIV>
 <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,LOTS_OF_MONEY,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

	On each context switch we save the FPU registers on stack
of old process and restore FPU registers from the stack of new one.
That allows us to avoid doing that each time we enter/leave the
kernel mode; however, that can get suboptimal in some cases.

	For one thing, we don't need to bother saving anything
for kernel threads.  For another, if between entering and leaving
the kernel a thread gives CPU up more than once, it will do
useless work, saving the same values every time, only to discard
the saved copy as soon as it returns from switch_to().

	Alternative solution:

* move the array we save into from switch_stack to thread_info
* have a (thread-synchronous) flag set when we save them
* have another flag set when they should be restored on return to userland.
* do *NOT* save/restore them in do_switch_stack()/undo_switch_stack().
* restore on the exit to user mode if the restore flag had
been set.  Clear both flags.
* on context switch, entry to fork/clone/vfork, before entry into do_signal()
and on entry into straced syscall save the registers and set the 'saved' flag
unless it had been already set.
* on context switch set the 'restore' flag as well.
* have copy_thread() set both flags for child, so the registers would be
restored once the child returns to userland.
* use the saved data in setup_sigcontext(); have restore_sigcontext() set both flags
and copy from sigframe to save area.
* teach ptrace to look for FPU registers in thread_info instead of
switch_stack.
* teach isolated accesses to FPU registers (rdfpcr, wrfpcr, etc.)
to check the 'saved' flag (under preempt_disable()) and work with the save area
if it's been set; if 'saved' flag is found upon write access, set 'restore' flag
as well.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/include/asm/fpu.h         |  61 +++++++-----
 arch/alpha/include/asm/thread_info.h |  16 +++
 arch/alpha/include/uapi/asm/ptrace.h |   2 +
 arch/alpha/kernel/asm-offsets.c      |   2 +
 arch/alpha/kernel/entry.S            | 144 ++++++++++++++-------------
 arch/alpha/kernel/process.c          |   5 +-
 arch/alpha/kernel/ptrace.c           |  18 ++--
 arch/alpha/kernel/signal.c           |  20 ++--
 arch/alpha/lib/fpreg.c               |  43 ++++++--
 9 files changed, 192 insertions(+), 119 deletions(-)

diff --git a/arch/alpha/include/asm/fpu.h b/arch/alpha/include/asm/fpu.h
index b9691405e56b..30b24135dd7a 100644
--- a/arch/alpha/include/asm/fpu.h
+++ b/arch/alpha/include/asm/fpu.h
@@ -15,21 +15,27 @@ rdfpcr(void)
 {
 	unsigned long tmp, ret;
 
+	preempt_disable();
+	if (current_thread_info()->status & TS_SAVED_FP) {
+		ret = current_thread_info()->fp[31];
+	} else {
 #if defined(CONFIG_ALPHA_EV6) || defined(CONFIG_ALPHA_EV67)
-	__asm__ __volatile__ (
-		"ftoit $f0,%0\n\t"
-		"mf_fpcr $f0\n\t"
-		"ftoit $f0,%1\n\t"
-		"itoft %0,$f0"
-		: "=r"(tmp), "=r"(ret));
+		__asm__ __volatile__ (
+			"ftoit $f0,%0\n\t"
+			"mf_fpcr $f0\n\t"
+			"ftoit $f0,%1\n\t"
+			"itoft %0,$f0"
+			: "=r"(tmp), "=r"(ret));
 #else
-	__asm__ __volatile__ (
-		"stt $f0,%0\n\t"
-		"mf_fpcr $f0\n\t"
-		"stt $f0,%1\n\t"
-		"ldt $f0,%0"
-		: "=m"(tmp), "=m"(ret));
+		__asm__ __volatile__ (
+			"stt $f0,%0\n\t"
+			"mf_fpcr $f0\n\t"
+			"stt $f0,%1\n\t"
+			"ldt $f0,%0"
+			: "=m"(tmp), "=m"(ret));
 #endif
+	}
+	preempt_enable();
 
 	return ret;
 }
@@ -39,21 +45,28 @@ wrfpcr(unsigned long val)
 {
 	unsigned long tmp;
 
+	preempt_disable();
+	if (current_thread_info()->status & TS_SAVED_FP) {
+		current_thread_info()->status |= TS_RESTORE_FP;
+		current_thread_info()->fp[31] = val;
+	} else {
 #if defined(CONFIG_ALPHA_EV6) || defined(CONFIG_ALPHA_EV67)
-	__asm__ __volatile__ (
-		"ftoit $f0,%0\n\t"
-		"itoft %1,$f0\n\t"
-		"mt_fpcr $f0\n\t"
-		"itoft %0,$f0"
-		: "=&r"(tmp) : "r"(val));
+		__asm__ __volatile__ (
+			"ftoit $f0,%0\n\t"
+			"itoft %1,$f0\n\t"
+			"mt_fpcr $f0\n\t"
+			"itoft %0,$f0"
+			: "=&r"(tmp) : "r"(val));
 #else
-	__asm__ __volatile__ (
-		"stt $f0,%0\n\t"
-		"ldt $f0,%1\n\t"
-		"mt_fpcr $f0\n\t"
-		"ldt $f0,%0"
-		: "=m"(tmp) : "m"(val));
+		__asm__ __volatile__ (
+			"stt $f0,%0\n\t"
+			"ldt $f0,%1\n\t"
+			"mt_fpcr $f0\n\t"
+			"ldt $f0,%0"
+			: "=m"(tmp) : "m"(val));
 #endif
+	}
+	preempt_enable();
 }
 
 static inline unsigned long
diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index 082631465074..531855caa50b 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -26,6 +26,7 @@ struct thread_info {
 	int bpt_nsaved;
 	unsigned long bpt_addr[2];		/* breakpoint handling  */
 	unsigned int bpt_insn[2];
+	unsigned long fp[32];
 };
 
 /*
@@ -81,6 +82,9 @@ register struct thread_info *__current_thread_info __asm__("$8");
 #define TS_UAC_NOFIX		0x0002	/* ! flags as they match          */
 #define TS_UAC_SIGBUS		0x0004	/* ! userspace part of 'osf_sysinfo' */
 
+#define TS_SAVED_FP		0x0008
+#define TS_RESTORE_FP		0x0010
+
 #define SET_UNALIGN_CTL(task,value)	({				\
 	__u32 status = task_thread_info(task)->status & ~UAC_BITMASK;	\
 	if (value & PR_UNALIGN_NOPRINT)					\
@@ -104,5 +108,17 @@ register struct thread_info *__current_thread_info __asm__("$8");
 	put_user(res, (int __user *)(value));				\
 	})
 
+#ifndef __ASSEMBLY__
+extern void __save_fpu(void);
+
+static inline void save_fpu(void)
+{
+	if (!(current_thread_info()->status & TS_SAVED_FP)) {
+		current_thread_info()->status |= TS_SAVED_FP;
+		__save_fpu();
+	}
+}
+#endif
+
 #endif /* __KERNEL__ */
 #endif /* _ALPHA_THREAD_INFO_H */
diff --git a/arch/alpha/include/uapi/asm/ptrace.h b/arch/alpha/include/uapi/asm/ptrace.h
index c29194181025..5ca45934fcbb 100644
--- a/arch/alpha/include/uapi/asm/ptrace.h
+++ b/arch/alpha/include/uapi/asm/ptrace.h
@@ -64,7 +64,9 @@ struct switch_stack {
 	unsigned long r14;
 	unsigned long r15;
 	unsigned long r26;
+#ifndef __KERNEL__
 	unsigned long fp[32];	/* fp[31] is fpcr */
+#endif
 };
 
 
diff --git a/arch/alpha/kernel/asm-offsets.c b/arch/alpha/kernel/asm-offsets.c
index 2e125e5c1508..b121294bee26 100644
--- a/arch/alpha/kernel/asm-offsets.c
+++ b/arch/alpha/kernel/asm-offsets.c
@@ -17,6 +17,8 @@ void foo(void)
 	DEFINE(TI_TASK, offsetof(struct thread_info, task));
 	DEFINE(TI_FLAGS, offsetof(struct thread_info, flags));
 	DEFINE(TI_CPU, offsetof(struct thread_info, cpu));
+	DEFINE(TI_FP, offsetof(struct thread_info, fp));
+	DEFINE(TI_STATUS, offsetof(struct thread_info, status));
 	BLANK();
 
         DEFINE(TASK_BLOCKED, offsetof(struct task_struct, blocked));
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index a6207c47f089..e4e142cb9a82 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -17,7 +17,7 @@
 
 /* Stack offsets.  */
 #define SP_OFF			184
-#define SWITCH_STACK_SIZE	320
+#define SWITCH_STACK_SIZE	64
 
 .macro	CFI_START_OSF_FRAME	func
 	.align	4
@@ -159,7 +159,6 @@
 	.cfi_rel_offset	$13, 32
 	.cfi_rel_offset	$14, 40
 	.cfi_rel_offset	$15, 48
-	/* We don't really care about the FP registers for debugging.  */
 .endm
 
 .macro	UNDO_SWITCH_STACK
@@ -498,6 +497,10 @@ ret_to_user:
 	and	$17, _TIF_WORK_MASK, $2
 	bne	$2, work_pending
 restore_all:
+	ldl	$2, TI_STATUS($8)
+	and	$2, TS_SAVED_FP | TS_RESTORE_FP, $3
+	bne	$3, restore_fpu
+restore_other:
 	.cfi_remember_state
 	RESTORE_ALL
 	call_pal PAL_rti
@@ -506,7 +509,7 @@ ret_to_kernel:
 	.cfi_restore_state
 	lda	$16, 7
 	call_pal PAL_swpipl
-	br restore_all
+	br restore_other
 
 	.align 3
 $syscall_error:
@@ -570,6 +573,14 @@ $work_notifysig:
 	.type	strace, @function
 strace:
 	/* set up signal stack, call syscall_trace */
+	// NB: if anyone adds preemption, this block will need to be protected
+	ldl	$1, TI_STATUS($8)
+	and	$1, TS_SAVED_FP, $3
+	or	$1, TS_SAVED_FP, $2
+	bne	$3, 1f
+	stl	$2, TI_STATUS($8)
+	bsr	$26, __save_fpu
+1:
 	DO_SWITCH_STACK
 	jsr	$26, syscall_trace_enter /* returns the syscall number */
 	UNDO_SWITCH_STACK
@@ -649,40 +660,6 @@ do_switch_stack:
 	stq	$14, 40($sp)
 	stq	$15, 48($sp)
 	stq	$26, 56($sp)
-	stt	$f0, 64($sp)
-	stt	$f1, 72($sp)
-	stt	$f2, 80($sp)
-	stt	$f3, 88($sp)
-	stt	$f4, 96($sp)
-	stt	$f5, 104($sp)
-	stt	$f6, 112($sp)
-	stt	$f7, 120($sp)
-	stt	$f8, 128($sp)
-	stt	$f9, 136($sp)
-	stt	$f10, 144($sp)
-	stt	$f11, 152($sp)
-	stt	$f12, 160($sp)
-	stt	$f13, 168($sp)
-	stt	$f14, 176($sp)
-	stt	$f15, 184($sp)
-	stt	$f16, 192($sp)
-	stt	$f17, 200($sp)
-	stt	$f18, 208($sp)
-	stt	$f19, 216($sp)
-	stt	$f20, 224($sp)
-	stt	$f21, 232($sp)
-	stt	$f22, 240($sp)
-	stt	$f23, 248($sp)
-	stt	$f24, 256($sp)
-	stt	$f25, 264($sp)
-	stt	$f26, 272($sp)
-	stt	$f27, 280($sp)
-	mf_fpcr	$f0		# get fpcr
-	stt	$f28, 288($sp)
-	stt	$f29, 296($sp)
-	stt	$f30, 304($sp)
-	stt	$f0, 312($sp)	# save fpcr in slot of $f31
-	ldt	$f0, 64($sp)	# dont let "do_switch_stack" change fp state.
 	ret	$31, ($1), 1
 	.cfi_endproc
 	.size	do_switch_stack, .-do_switch_stack
@@ -701,54 +678,71 @@ undo_switch_stack:
 	ldq	$14, 40($sp)
 	ldq	$15, 48($sp)
 	ldq	$26, 56($sp)
-	ldt	$f30, 312($sp)	# get saved fpcr
-	ldt	$f0, 64($sp)
-	ldt	$f1, 72($sp)
-	ldt	$f2, 80($sp)
-	ldt	$f3, 88($sp)
-	mt_fpcr	$f30		# install saved fpcr
-	ldt	$f4, 96($sp)
-	ldt	$f5, 104($sp)
-	ldt	$f6, 112($sp)
-	ldt	$f7, 120($sp)
-	ldt	$f8, 128($sp)
-	ldt	$f9, 136($sp)
-	ldt	$f10, 144($sp)
-	ldt	$f11, 152($sp)
-	ldt	$f12, 160($sp)
-	ldt	$f13, 168($sp)
-	ldt	$f14, 176($sp)
-	ldt	$f15, 184($sp)
-	ldt	$f16, 192($sp)
-	ldt	$f17, 200($sp)
-	ldt	$f18, 208($sp)
-	ldt	$f19, 216($sp)
-	ldt	$f20, 224($sp)
-	ldt	$f21, 232($sp)
-	ldt	$f22, 240($sp)
-	ldt	$f23, 248($sp)
-	ldt	$f24, 256($sp)
-	ldt	$f25, 264($sp)
-	ldt	$f26, 272($sp)
-	ldt	$f27, 280($sp)
-	ldt	$f28, 288($sp)
-	ldt	$f29, 296($sp)
-	ldt	$f30, 304($sp)
 	lda	$sp, SWITCH_STACK_SIZE($sp)
 	ret	$31, ($1), 1
 	.cfi_endproc
 	.size	undo_switch_stack, .-undo_switch_stack
+
+#define FR(n) n * 8 + TI_FP($8)
+	.align	4
+	.globl	__save_fpu
+	.type	__save_fpu, @function
+__save_fpu:
+#define V(n) stt	$f##n, FR(n)
+	V( 0); V( 1); V( 2); V( 3)
+	V( 4); V( 5); V( 6); V( 7)
+	V( 8); V( 9); V(10); V(11)
+	V(12); V(13); V(14); V(15)
+	V(16); V(17); V(18); V(19)
+	V(20); V(21); V(22); V(23)
+	V(24); V(25); V(26); V(27)
+	mf_fpcr	$f0		# get fpcr
+	V(28); V(29); V(30)
+	stt	$f0, FR(31)	# save fpcr in slot of $f31
+	ldt	$f0, FR(0)	# don't let "__save_fpu" change fp state.
+	ret
+#undef V
+	.size	__save_fpu, .-__save_fpu
+
+	.align	4
+restore_fpu:
+	and	$3, TS_RESTORE_FP, $3
+	bic	$2, TS_SAVED_FP | TS_RESTORE_FP, $2
+	beq	$3, 1f
+#define V(n) ldt	$f##n, FR(n)
+	ldt	$f30, FR(31)	# get saved fpcr
+	V( 0); V( 1); V( 2); V( 3)
+	mt_fpcr	$f30		# install saved fpcr
+	V( 4); V( 5); V( 6); V( 7)
+	V( 8); V( 9); V(10); V(11)
+	V(12); V(13); V(14); V(15)
+	V(16); V(17); V(18); V(19)
+	V(20); V(21); V(22); V(23)
+	V(24); V(25); V(26); V(27)
+	V(28); V(29); V(30)
+1:	stl $2, TI_STATUS($8)
+	br restore_other
+#undef V
+
 
 /*
  * The meat of the context switch code.
  */
-
 	.align	4
 	.globl	alpha_switch_to
 	.type	alpha_switch_to, @function
 	.cfi_startproc
 alpha_switch_to:
 	DO_SWITCH_STACK
+	ldl	$1, TI_STATUS($8)
+	and	$1, TS_RESTORE_FP, $3
+	bne	$3, 1f
+	or	$1, TS_RESTORE_FP | TS_SAVED_FP, $2
+	and	$1, TS_SAVED_FP, $3
+	stl	$2, TI_STATUS($8)
+	bne	$3, 1f
+	bsr	$26, __save_fpu
+1:
 	call_pal PAL_swpctx
 	lda	$8, 0x3fff
 	UNDO_SWITCH_STACK
@@ -799,6 +793,14 @@ ret_from_kernel_thread:
 alpha_\name:
 	.prologue 0
 	bsr	$1, do_switch_stack
+	// NB: if anyone adds preemption, this block will need to be protected
+	ldl	$1, TI_STATUS($8)
+	and	$1, TS_SAVED_FP, $3
+	or	$1, TS_SAVED_FP, $2
+	bne	$3, 1f
+	stl	$2, TI_STATUS($8)
+	bsr	$26, __save_fpu
+1:
 	jsr	$26, sys_\name
 	ldq	$26, 56($sp)
 	lda	$sp, SWITCH_STACK_SIZE($sp)
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index e2e25f8b5e76..ae89739226c2 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -249,6 +249,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	childstack = ((struct switch_stack *) childregs) - 1;
 	childti->pcb.ksp = (unsigned long) childstack;
 	childti->pcb.flags = 1;	/* set FEN, clear everything else */
+	childti->status |= TS_SAVED_FP | TS_RESTORE_FP;
 
 	if (unlikely(args->fn)) {
 		/* kernel thread */
@@ -258,6 +259,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		childstack->r9 = (unsigned long) args->fn;
 		childstack->r10 = (unsigned long) args->fn_arg;
 		childregs->hae = alpha_mv.hae_cache;
+		memset(childti->fp, '\0', sizeof(childti->fp));
 		childti->pcb.usp = 0;
 		return 0;
 	}
@@ -341,8 +343,7 @@ EXPORT_SYMBOL(dump_elf_task);
 int
 dump_elf_task_fp(elf_fpreg_t *dest, struct task_struct *task)
 {
-	struct switch_stack *sw = (struct switch_stack *)task_pt_regs(task) - 1;
-	memcpy(dest, sw->fp, 32 * 8);
+	memcpy(dest, task_thread_info(task)->fp, 32 * 8);
 	return 1;
 }
 EXPORT_SYMBOL(dump_elf_task_fp);
diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
index a1a239ea002d..fde4c68e7a0b 100644
--- a/arch/alpha/kernel/ptrace.c
+++ b/arch/alpha/kernel/ptrace.c
@@ -78,6 +78,8 @@ enum {
  (PAGE_SIZE*2 - sizeof(struct pt_regs) - sizeof(struct switch_stack) \
   + offsetof(struct switch_stack, reg))
 
+#define FP_REG(reg) (offsetof(struct thread_info, reg))
+
 static int regoff[] = {
 	PT_REG(	   r0), PT_REG(	   r1), PT_REG(	   r2), PT_REG(	  r3),
 	PT_REG(	   r4), PT_REG(	   r5), PT_REG(	   r6), PT_REG(	  r7),
@@ -87,14 +89,14 @@ static int regoff[] = {
 	PT_REG(	  r20), PT_REG(	  r21), PT_REG(	  r22), PT_REG(	 r23),
 	PT_REG(	  r24), PT_REG(	  r25), PT_REG(	  r26), PT_REG(	 r27),
 	PT_REG(	  r28), PT_REG(	   gp),		   -1,		   -1,
-	SW_REG(fp[ 0]), SW_REG(fp[ 1]), SW_REG(fp[ 2]), SW_REG(fp[ 3]),
-	SW_REG(fp[ 4]), SW_REG(fp[ 5]), SW_REG(fp[ 6]), SW_REG(fp[ 7]),
-	SW_REG(fp[ 8]), SW_REG(fp[ 9]), SW_REG(fp[10]), SW_REG(fp[11]),
-	SW_REG(fp[12]), SW_REG(fp[13]), SW_REG(fp[14]), SW_REG(fp[15]),
-	SW_REG(fp[16]), SW_REG(fp[17]), SW_REG(fp[18]), SW_REG(fp[19]),
-	SW_REG(fp[20]), SW_REG(fp[21]), SW_REG(fp[22]), SW_REG(fp[23]),
-	SW_REG(fp[24]), SW_REG(fp[25]), SW_REG(fp[26]), SW_REG(fp[27]),
-	SW_REG(fp[28]), SW_REG(fp[29]), SW_REG(fp[30]), SW_REG(fp[31]),
+	FP_REG(fp[ 0]), FP_REG(fp[ 1]), FP_REG(fp[ 2]), FP_REG(fp[ 3]),
+	FP_REG(fp[ 4]), FP_REG(fp[ 5]), FP_REG(fp[ 6]), FP_REG(fp[ 7]),
+	FP_REG(fp[ 8]), FP_REG(fp[ 9]), FP_REG(fp[10]), FP_REG(fp[11]),
+	FP_REG(fp[12]), FP_REG(fp[13]), FP_REG(fp[14]), FP_REG(fp[15]),
+	FP_REG(fp[16]), FP_REG(fp[17]), FP_REG(fp[18]), FP_REG(fp[19]),
+	FP_REG(fp[20]), FP_REG(fp[21]), FP_REG(fp[22]), FP_REG(fp[23]),
+	FP_REG(fp[24]), FP_REG(fp[25]), FP_REG(fp[26]), FP_REG(fp[27]),
+	FP_REG(fp[28]), FP_REG(fp[29]), FP_REG(fp[30]), FP_REG(fp[31]),
 	PT_REG(	   pc)
 };
 
diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index 6f47f256fe80..e62d1d461b1f 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -150,9 +150,10 @@ restore_sigcontext(struct sigcontext __user *sc, struct pt_regs *regs)
 {
 	unsigned long usp;
 	struct switch_stack *sw = (struct switch_stack *)regs - 1;
-	long i, err = __get_user(regs->pc, &sc->sc_pc);
+	long err = __get_user(regs->pc, &sc->sc_pc);
 
 	current->restart_block.fn = do_no_restart_syscall;
+	current_thread_info()->status |= TS_SAVED_FP | TS_RESTORE_FP;
 
 	sw->r26 = (unsigned long) ret_from_sys_call;
 
@@ -189,9 +190,9 @@ restore_sigcontext(struct sigcontext __user *sc, struct pt_regs *regs)
 	err |= __get_user(usp, sc->sc_regs+30);
 	wrusp(usp);
 
-	for (i = 0; i < 31; i++)
-		err |= __get_user(sw->fp[i], sc->sc_fpregs+i);
-	err |= __get_user(sw->fp[31], &sc->sc_fpcr);
+	err |= __copy_from_user(current_thread_info()->fp,
+				sc->sc_fpregs, 31 * 8);
+	err |= __get_user(current_thread_info()->fp[31], &sc->sc_fpcr);
 
 	return err;
 }
@@ -272,7 +273,7 @@ setup_sigcontext(struct sigcontext __user *sc, struct pt_regs *regs,
 		 unsigned long mask, unsigned long sp)
 {
 	struct switch_stack *sw = (struct switch_stack *)regs - 1;
-	long i, err = 0;
+	long err = 0;
 
 	err |= __put_user(on_sig_stack((unsigned long)sc), &sc->sc_onstack);
 	err |= __put_user(mask, &sc->sc_mask);
@@ -312,10 +313,10 @@ setup_sigcontext(struct sigcontext __user *sc, struct pt_regs *regs,
 	err |= __put_user(sp, sc->sc_regs+30);
 	err |= __put_user(0, sc->sc_regs+31);
 
-	for (i = 0; i < 31; i++)
-		err |= __put_user(sw->fp[i], sc->sc_fpregs+i);
+	err |= __copy_to_user(sc->sc_fpregs,
+			      current_thread_info()->fp, 31 * 8);
 	err |= __put_user(0, sc->sc_fpregs+31);
-	err |= __put_user(sw->fp[31], &sc->sc_fpcr);
+	err |= __put_user(current_thread_info()->fp[31], &sc->sc_fpcr);
 
 	err |= __put_user(regs->trap_a0, &sc->sc_traparg_a0);
 	err |= __put_user(regs->trap_a1, &sc->sc_traparg_a1);
@@ -528,6 +529,9 @@ do_work_pending(struct pt_regs *regs, unsigned long thread_flags,
 		} else {
 			local_irq_enable();
 			if (thread_flags & (_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)) {
+				preempt_disable();
+				save_fpu();
+				preempt_enable();
 				do_signal(regs, r0, r19);
 				r0 = 0;
 			} else {
diff --git a/arch/alpha/lib/fpreg.c b/arch/alpha/lib/fpreg.c
index 34fea465645b..612c5eca71bc 100644
--- a/arch/alpha/lib/fpreg.c
+++ b/arch/alpha/lib/fpreg.c
@@ -7,6 +7,8 @@
 
 #include <linux/compiler.h>
 #include <linux/export.h>
+#include <linux/preempt.h>
+#include <asm/thread_info.h>
 
 #if defined(CONFIG_ALPHA_EV6) || defined(CONFIG_ALPHA_EV67)
 #define STT(reg,val)  asm volatile ("ftoit $f"#reg",%0" : "=r"(val));
@@ -19,7 +21,12 @@ alpha_read_fp_reg (unsigned long reg)
 {
 	unsigned long val;
 
-	switch (reg) {
+	if (unlikely(reg >= 32))
+		return 0;
+	preempt_enable();
+	if (current_thread_info()->status & TS_SAVED_FP)
+		val = current_thread_info()->fp[reg];
+	else switch (reg) {
 	      case  0: STT( 0, val); break;
 	      case  1: STT( 1, val); break;
 	      case  2: STT( 2, val); break;
@@ -52,8 +59,8 @@ alpha_read_fp_reg (unsigned long reg)
 	      case 29: STT(29, val); break;
 	      case 30: STT(30, val); break;
 	      case 31: STT(31, val); break;
-	      default: return 0;
 	}
+	preempt_enable();
 	return val;
 }
 EXPORT_SYMBOL(alpha_read_fp_reg);
@@ -67,7 +74,14 @@ EXPORT_SYMBOL(alpha_read_fp_reg);
 void
 alpha_write_fp_reg (unsigned long reg, unsigned long val)
 {
-	switch (reg) {
+	if (unlikely(reg >= 32))
+		return;
+
+	preempt_disable();
+	if (current_thread_info()->status & TS_SAVED_FP) {
+		current_thread_info()->status |= TS_RESTORE_FP;
+		current_thread_info()->fp[reg] = val;
+	} else switch (reg) {
 	      case  0: LDT( 0, val); break;
 	      case  1: LDT( 1, val); break;
 	      case  2: LDT( 2, val); break;
@@ -101,6 +115,7 @@ alpha_write_fp_reg (unsigned long reg, unsigned long val)
 	      case 30: LDT(30, val); break;
 	      case 31: LDT(31, val); break;
 	}
+	preempt_enable();
 }
 EXPORT_SYMBOL(alpha_write_fp_reg);
 
@@ -115,7 +130,14 @@ alpha_read_fp_reg_s (unsigned long reg)
 {
 	unsigned long val;
 
-	switch (reg) {
+	if (unlikely(reg >= 32))
+		return 0;
+
+	preempt_enable();
+	if (current_thread_info()->status & TS_SAVED_FP) {
+		LDT(0, current_thread_info()->fp[reg]);
+		STS(0, val);
+	} else switch (reg) {
 	      case  0: STS( 0, val); break;
 	      case  1: STS( 1, val); break;
 	      case  2: STS( 2, val); break;
@@ -148,8 +170,8 @@ alpha_read_fp_reg_s (unsigned long reg)
 	      case 29: STS(29, val); break;
 	      case 30: STS(30, val); break;
 	      case 31: STS(31, val); break;
-	      default: return 0;
 	}
+	preempt_enable();
 	return val;
 }
 EXPORT_SYMBOL(alpha_read_fp_reg_s);
@@ -163,7 +185,15 @@ EXPORT_SYMBOL(alpha_read_fp_reg_s);
 void
 alpha_write_fp_reg_s (unsigned long reg, unsigned long val)
 {
-	switch (reg) {
+	if (unlikely(reg >= 32))
+		return;
+
+	preempt_disable();
+	if (current_thread_info()->status & TS_SAVED_FP) {
+		current_thread_info()->status |= TS_RESTORE_FP;
+		LDS(0, val);
+		STT(0, current_thread_info()->fp[reg]);
+	} else switch (reg) {
 	      case  0: LDS( 0, val); break;
 	      case  1: LDS( 1, val); break;
 	      case  2: LDS( 2, val); break;
@@ -197,5 +227,6 @@ alpha_write_fp_reg_s (unsigned long reg, unsigned long val)
 	      case 30: LDS(30, val); break;
 	      case 31: LDS(31, val); break;
 	}
+	preempt_enable();
 }
 EXPORT_SYMBOL(alpha_write_fp_reg_s);
-- 
2.30.2

