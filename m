Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90F535F7AB9
	for <lists+linux-alpha@lfdr.de>; Fri,  7 Oct 2022 17:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbiJGPms (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 7 Oct 2022 11:42:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbiJGPmr (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Fri, 7 Oct 2022 11:42:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9FDAD73C9
        for <linux-alpha@vger.kernel.org>; Fri,  7 Oct 2022 08:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665157364;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=1lKCnBjxRPjgpNNPlEylbLIMLTQ3r/0aTk3SgXwAPQE=;
        b=N7sQrgdSZPwOY3ZJUgISKw+SC3hBO/RHz6umRRQW4ie1INCaUWCjb3vy0v5wah0psYYkvz
        fQtvgtdRDTaigxwjQkRn1uZP3hrluP3fb7iiWMY8rSIeMGz5G5YT/6Bd6GNXLwQ+gPIakr
        kCmn7vL2fab3I6qWl+AKt1arkPoLJRk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-468-jr39P7C-Mu6xcET-5YNUog-1; Fri, 07 Oct 2022 11:42:43 -0400
X-MC-Unique: jr39P7C-Mu6xcET-5YNUog-1
Received: by mail-wm1-f71.google.com with SMTP id l15-20020a05600c4f0f00b003b4bec80edbso2835057wmq.9
        for <linux-alpha@vger.kernel.org>; Fri, 07 Oct 2022 08:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lKCnBjxRPjgpNNPlEylbLIMLTQ3r/0aTk3SgXwAPQE=;
        b=GlaleRJFuMDloE7SWven6BdNT1FZw1whGprOiOIt2p3SZqh4UuBK+bBdLCMcGRplAb
         4iqP1dGZol2J+C3ZzzJ5xIL+u+uNWGKHEeJBeMG3eFGzzkMiDloo/J3egqjHv108jIkO
         3ZT5WCFUbugSh3G56uPr8yICEQsh9uUai3k2gmi4DoiwEpyEGWM9dhaxGCInvhpjIDOg
         HOmso6dCnpgGrK1LAEuBdp90LiIIQOaPyoy7Ae5RXdSvAjWQ4mjjgwtOwo/UQqKn8HuF
         Aj1AHuWvwjL4xejOZFqgBak7xZ6moJf3oi8ykHObcweT8lqzW9mMX7T1Hi7o5vw7yM1S
         CDyg==
X-Gm-Message-State: ACrzQf1Xt9GHbGRKEWMNqDtut1DX1kbF9FY3cj6rNkpwMYLQk5qaMI8V
        X6B+FVSWcByJ74JPt+l1Ht1hfIqyAnehn3j+gB/7fGBzIoKEqaXrWgQxRLLsjlZW7YDXurFkYE2
        tIzRsfglWP2q3RT/ihOwyU8NALOtxrmEgHO0iPal0Hp/esdLJUClZdTYzs9XwA1galpM8b8umzX
        k=
X-Received: by 2002:a5d:5010:0:b0:22a:cb71:9493 with SMTP id e16-20020a5d5010000000b0022acb719493mr3770701wrt.514.1665157361964;
        Fri, 07 Oct 2022 08:42:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Tr05uM1rtU5aj/QWiT6cTirx56otcH3SojWjYuAUChmPHRHcJ6HatWEhyYipO7y3unWYaxQ==
X-Received: by 2002:a5d:5010:0:b0:22a:cb71:9493 with SMTP id e16-20020a5d5010000000b0022acb719493mr3770632wrt.514.1665157361532;
        Fri, 07 Oct 2022 08:42:41 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id e1-20020a5d5941000000b0022af865810esm2307021wri.75.2022.10.07.08.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 08:42:40 -0700 (PDT)
From:   Valentin Schneider <vschneid@redhat.com>
To:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        x86@kernel.org
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicholas Piggin <npiggin@gmail.com>,
        Guo Ren <guoren@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Subject: [RFC PATCH 0/5] Generic IPI sending tracepoint
Date:   Fri,  7 Oct 2022 16:41:40 +0100
Message-Id: <20221007154145.1877054-1-vschneid@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Background
==========

Detecting IPI *reception* is relatively easy, e.g. using
trace_irq_handler_{entry,exit} or even just function-trace
flush_smp_call_function_queue() for SMP calls.  

Figuring out their *origin*, is trickier as there is no generic tracepoint tied
to e.g. smp_call_function():

o AFAIA x86 has no tracepoint tied to sending IPIs, only receiving them
  (cf. trace_call_function{_single}_entry()).
o arm/arm64 do have trace_ipi_raise(), which gives us the target cpus but also a
  mostly useless string (smp_calls will all be "Function call interrupts").
o Other architectures don't seem to have any IPI-sending related tracepoint.  

I believe one reason those tracepoints used by arm/arm64 ended up as they were
is because these archs used to handle IPIs differently from regular interrupts
(the IRQ driver would directly invoke an IPI-handling routine), which meant they 
never showed up in trace_irq_handler_{entry, exit}. The trace_ipi_{entry,exit}
tracepoints gave a way to trace IPI reception but those have become redundant as
of: 

      56afcd3dbd19 ("ARM: Allow IPIs to be handled as normal interrupts")
      d3afc7f12987 ("arm64: Allow IPIs to be handled as normal interrupts")

which gave IPIs a "proper" handler function used through
generic_handle_domain_irq(), which makes them show up via
trace_irq_handler_{entry, exit}.

Changing stuff up
=================

Per the above, it would make sense to reshuffle trace_ipi_raise() and move it
into generic code. This also came up during Daniel's talk on Osnoise at the CPU
isolation MC of LPC 2022 [1]. 

Now, to be useful, such a tracepoint needs to export:
o targeted CPU(s)
o calling context

The only way to get the calling context with trace_ipi_raise() is to trigger a
stack dump, e.g. $(trace-cmd -e ipi* -T echo 42).

As for the targeted CPUs, the existing tracepoint does export them, albeit in
cpumask form, which is quite inconvenient from a tooling perspective. For
instance, as far as I'm aware, it's not possible to do event filtering on a
cpumask via trace-cmd.

Because of the above points, this is introducing a new tracepoint.

Patches
=======

This results in having trace events for:

o smp_call_function*()
o smp_send_reschedule()
o irq_work_queue*()

This is incomplete, just looking at arm64 there's more IPI types that aren't covered:

  IPI_CPU_STOP,
  IPI_CPU_CRASH_STOP,
  IPI_TIMER,
  IPI_WAKEUP,

... But it feels like a good starting point.

Another thing worth mentioning is that depending on the callsite, the _RET_IP_
fed to the tracepoint is not always useful - generic_exec_single() doesn't tell
you much about the actual callback being sent via IPI, so there might be value
in exploding the single tracepoint into at least one variant for smp_calls.

Links
=====

[1]: https://youtu.be/5gT57y4OzBM?t=14234

Valentin Schneider (5):
  trace: Add trace_ipi_send_{cpu, cpumask}
  sched, smp: Trace send_call_function_single_ipi()
  smp: Add a multi-CPU variant to send_call_function_single_ipi()
  irq_work: Trace calls to arch_irq_work_raise()
  treewide: Rename and trace arch-definitions of smp_send_reschedule()

 arch/alpha/kernel/smp.c          |  2 +-
 arch/arc/kernel/smp.c            |  2 +-
 arch/arm/kernel/smp.c            |  5 +----
 arch/arm64/kernel/smp.c          |  3 +--
 arch/csky/kernel/smp.c           |  2 +-
 arch/hexagon/kernel/smp.c        |  2 +-
 arch/ia64/kernel/smp.c           |  4 ++--
 arch/loongarch/include/asm/smp.h |  2 +-
 arch/mips/include/asm/smp.h      |  2 +-
 arch/openrisc/kernel/smp.c       |  2 +-
 arch/parisc/kernel/smp.c         |  4 ++--
 arch/powerpc/kernel/smp.c        |  4 ++--
 arch/riscv/kernel/smp.c          |  4 ++--
 arch/s390/kernel/smp.c           |  2 +-
 arch/sh/kernel/smp.c             |  2 +-
 arch/sparc/kernel/smp_32.c       |  2 +-
 arch/sparc/kernel/smp_64.c       |  2 +-
 arch/x86/include/asm/smp.h       |  2 +-
 arch/xtensa/kernel/smp.c         |  2 +-
 include/linux/smp.h              |  1 +
 include/trace/events/ipi.h       | 27 +++++++++++++++++++++++++++
 kernel/irq_work.c                | 12 +++++++++++-
 kernel/sched/core.c              |  7 +++++--
 kernel/smp.c                     | 18 +++++++++++++++++-
 24 files changed, 84 insertions(+), 31 deletions(-)

--
2.31.1

