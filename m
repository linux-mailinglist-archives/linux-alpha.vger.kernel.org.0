Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0FB3AA58B
	for <lists+linux-alpha@lfdr.de>; Wed, 16 Jun 2021 22:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233644AbhFPUto (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 16 Jun 2021 16:49:44 -0400
Received: from out02.mta.xmission.com ([166.70.13.232]:59024 "EHLO
        out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233632AbhFPUtn (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 16 Jun 2021 16:49:43 -0400
Received: from in01.mta.xmission.com ([166.70.13.51])
        by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1ltcRk-000xec-Iv; Wed, 16 Jun 2021 14:47:36 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95] helo=email.xmission.com)
        by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1ltcRj-00HATZ-LL; Wed, 16 Jun 2021 14:47:36 -0600
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
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
References: <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
        <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
        <87eed4v2dc.fsf@disp2133>
        <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
        <87fsxjorgs.fsf@disp2133> <87zgvqor7d.fsf_-_@disp2133>
        <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
        <87mtrpg47k.fsf@disp2133> <87pmwlek8d.fsf_-_@disp2133>
        <87eed1ek31.fsf_-_@disp2133> <YMpeP0CrRUVKIysE@zeniv-ca.linux.org.uk>
Date:   Wed, 16 Jun 2021 15:47:28 -0500
In-Reply-To: <YMpeP0CrRUVKIysE@zeniv-ca.linux.org.uk> (Al Viro's message of
        "Wed, 16 Jun 2021 20:25:35 +0000")
Message-ID: <87zgvp8rkv.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1ltcRj-00HATZ-LL;;;mid=<87zgvp8rkv.fsf@disp2133>;;;hst=in01.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX195d1760MtpbygweJjBXaa4JV6iKT/cpgY=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa04.xmission.com
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=8.0 tests=ALL_TRUSTED,BAYES_50,
        DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,XMNoVowels,
        XMSubLong autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.7 XMSubLong Long Subject
        *  1.5 XMNoVowels Alpha-numberic number with no vowels
        *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
        * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
        *      [sa04 1397; Body=1 Fuz1=1 Fuz2=1]
        *  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa04 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Al Viro <viro@zeniv.linux.org.uk>
X-Spam-Relay-Country: 
X-Spam-Timing: total 288 ms - load_scoreonly_sql: 0.08 (0.0%),
        signal_user_changed: 10 (3.6%), b_tie_ro: 9 (3.1%), parse: 0.82 (0.3%),
         extract_message_metadata: 12 (4.2%), get_uri_detail_list: 0.92 (0.3%),
         tests_pri_-1000: 13 (4.6%), tests_pri_-950: 1.08 (0.4%),
        tests_pri_-900: 0.89 (0.3%), tests_pri_-90: 54 (18.9%), check_bayes:
        53 (18.5%), b_tokenize: 6 (2.0%), b_tok_get_all: 6 (2.2%),
        b_comp_prob: 1.95 (0.7%), b_tok_touch_all: 36 (12.6%), b_finish: 0.79
        (0.3%), tests_pri_0: 184 (63.7%), check_dkim_signature: 0.55 (0.2%),
        check_dkim_adsp: 2.9 (1.0%), poll_dns_idle: 0.55 (0.2%), tests_pri_10:
        1.75 (0.6%), tests_pri_500: 7 (2.4%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH 2/2] alpha/ptrace: Add missing switch_stack frames
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Al Viro <viro@zeniv.linux.org.uk> writes:

> On Wed, Jun 16, 2021 at 01:32:50PM -0500, Eric W. Biederman wrote:
>
>> -.macro	fork_like name
>> +.macro	allregs name
>>  	.align	4
>>  	.globl	alpha_\name
>>  	.ent	alpha_\name
>> +	.cfi_startproc
>>  alpha_\name:
>>  	.prologue 0
>> -	bsr	$1, do_switch_stack
>> +	SAVE_SWITCH_STACK
>>  	jsr	$26, sys_\name
>> -	ldq	$26, 56($sp)
>> -	lda	$sp, SWITCH_STACK_SIZE($sp)
>> +	RESTORE_SWITCH_STACK
>
> 	No.  You've just added one hell of an overhead to fork(2),
> for no reason whatsoever.  sys_fork() et.al. does *NOT* modify the
> callee-saved registers; it's plain C.  So this change is complete
> BS.

Fork already saves the registers, all I did was restore them.  Which
makes a debugger that modifies them in
PTRACE_EVENT_{FORK,VFORK,CLONE,VFORK_DONE} work.

>> +allregs exit
>> +allregs exit_group
>
> 	Details, please - what exactly makes exit(2) different from
> e.g. open(2)?

PTRACE_EVENT_EXIT.


Eric



