Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E873B3665
	for <lists+linux-alpha@lfdr.de>; Thu, 24 Jun 2021 20:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbhFXTBB (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 24 Jun 2021 15:01:01 -0400
Received: from out02.mta.xmission.com ([166.70.13.232]:55430 "EHLO
        out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhFXTBA (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 24 Jun 2021 15:01:00 -0400
Received: from in02.mta.xmission.com ([166.70.13.52])
        by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1lwUYe-00GPo3-3g; Thu, 24 Jun 2021 12:58:36 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:46976 helo=email.xmission.com)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1lwUYb-003Gdf-NH; Thu, 24 Jun 2021 12:58:35 -0600
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Michael Schmitz <schmitzmic@gmail.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>
References: <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
        <87sg1lwhvm.fsf@disp2133>
        <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
        <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
        <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
        <87eed4v2dc.fsf@disp2133>
        <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
        <87fsxjorgs.fsf@disp2133>
        <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
        <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
        <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
        <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
        <87a6njf0ia.fsf@disp2133>
        <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
        <87tulpbp19.fsf@disp2133>
        <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
        <87zgvgabw1.fsf@disp2133>
Date:   Thu, 24 Jun 2021 13:57:35 -0500
In-Reply-To: <87zgvgabw1.fsf@disp2133> (Eric W. Biederman's message of "Wed,
        23 Jun 2021 09:33:50 -0500")
Message-ID: <875yy3850g.fsf_-_@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1lwUYb-003Gdf-NH;;;mid=<875yy3850g.fsf_-_@disp2133>;;;hst=in02.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX1/U76JadBwWKTlmHkHUkxGlFtBDXVbu+Hg=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa03.xmission.com
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
        DCC_CHECK_NEGATIVE,XMNoVowels,XM_B_SpammyWords autolearn=disabled
        version=3.4.2
X-Spam-Virus: No
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4995]
        *  1.5 XMNoVowels Alpha-numberic number with no vowels
        * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
        *      [sa03 1397; Body=1 Fuz1=1 Fuz2=1]
        *  0.2 XM_B_SpammyWords One or more commonly used spammy words
X-Spam-DCC: XMission; sa03 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;Linus Torvalds <torvalds@linux-foundation.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1412 ms - load_scoreonly_sql: 0.03 (0.0%),
        signal_user_changed: 4.4 (0.3%), b_tie_ro: 3.0 (0.2%), parse: 1.18
        (0.1%), extract_message_metadata: 4.2 (0.3%), get_uri_detail_list:
        1.99 (0.1%), tests_pri_-1000: 3.6 (0.3%), tests_pri_-950: 1.03 (0.1%),
        tests_pri_-900: 0.88 (0.1%), tests_pri_-90: 82 (5.8%), check_bayes: 81
        (5.7%), b_tokenize: 7 (0.5%), b_tok_get_all: 9 (0.6%), b_comp_prob:
        2.1 (0.1%), b_tok_touch_all: 60 (4.2%), b_finish: 0.80 (0.1%),
        tests_pri_0: 1300 (92.1%), check_dkim_signature: 0.39 (0.0%),
        check_dkim_adsp: 1.86 (0.1%), poll_dns_idle: 0.49 (0.0%),
        tests_pri_10: 1.84 (0.1%), tests_pri_500: 6 (0.4%), rewrite_mail: 0.00
        (0.0%)
Subject: [PATCH 0/9] Refactoring exit
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org


I dug into exit because PTRACE_EVENT_EXIT not being guaranteed to be
called with a stack where ptrace read and write all of the userspace
registers can lead to unfiltered reads and writes of kernel stack
contents.

While looking into it I realized that there are a lot of little races
between all of the ways an exit can be initiated.  I don't know of a way
those races are harmful, but they make the code difficult to reason about.

The solution this set of changes adopts is to implement good primitives
for asynchronous exit and exit_group requests and modifies exit(2) and
exit_group(2) to use those primitives.

The result should be more consistent determination of the reason for an
exit, as well as PTRACE_EVENT_EXIT always being called from a context
(get_signal) where ptrace is guaranteed to be able to read and write
all of the registers.

I believe the set of changes could be justified for the cleanups alone
even if PTRACE_EVENT_EXIT did not need to be moved.  Which makes me
feel good about this approach.

If a way can be found that coredumps can be started from complete_signal
(needed for timely handling of fatal signals) instead of needing to
start in do_coredump for proper synchronization force_siginfo_to_task
and get_signal can be significantly simplified.  As it is a lot of
checks are duplicated to ensure that everything works properly in the
presence of do_coredump.

So far the code has been lightly tested, and the descriptions of some
of the patches are a bit light, but I think this shows the direction
I am aiming to travel for sorting out exit(2) and exit_group(2).

Eric W. Biederman (9):
      signal/sh: Use force_sig(SIGKILL) instead of do_group_exit(SIGKILL)
      signal/seccomp: Refactor seccomp signal and coredump generation
      signal/seccomp: Dump core when there is only one live thread
      signal: Factor start_group_exit out of complete_signal
      signal/group_exit: Use start_group_exit in place of do_group_exit
      signal: Fold do_group_exit into get_signal fixing io_uring threads
      signal: Make individual tasks exiting a first class concept.
      signal/task_exit: Use start_task_exit in place of do_exit
      signal: Move PTRACE_EVENT_EXIT into get_signal

 arch/sh/kernel/cpu/fpu.c     |  10 +--
 fs/exec.c                    |  10 ++-
 include/linux/sched/jobctl.h |   2 +
 include/linux/sched/signal.h |   5 ++
 include/linux/sched/task.h   |   1 -
 kernel/exit.c                |  41 ++---------
 kernel/seccomp.c             |  45 +++---------
 kernel/signal.c              | 166 ++++++++++++++++++++++++++++++-------------
 8 files changed, 154 insertions(+), 126 deletions(-)
