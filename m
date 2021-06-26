Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6413B4CE8
	for <lists+linux-alpha@lfdr.de>; Sat, 26 Jun 2021 07:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbhFZF6s (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 26 Jun 2021 01:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbhFZF6q (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 26 Jun 2021 01:58:46 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 599F8C061574
        for <linux-alpha@vger.kernel.org>; Fri, 25 Jun 2021 22:56:23 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id w15so5515071pgk.13
        for <linux-alpha@vger.kernel.org>; Fri, 25 Jun 2021 22:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PnTryFwi50YPbqJtIMnYSzHf4Qnr9714ggy6hZgJqDU=;
        b=A0yt7bNf9bzrq08PyG2aWZjlGPFVe0ZpT3tW8adQohWogD9fk2WCcLhhkas3T6XpYM
         5zw7na5G33E3mATJXbN88ODE3XlfK/wvPQPp30QBD0XIcitdPyC4az4AnuLWNRZwkDCb
         rIXHvb2WHF2H5nrZiw0p4AH0mwXyLrBfZw8ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PnTryFwi50YPbqJtIMnYSzHf4Qnr9714ggy6hZgJqDU=;
        b=HYOp4qwvuU4r3DQnUmhhWcjB4Ab+CzGbjpkMHYOnb60g6gvwoFqhvoiSWtsVfF4sBU
         /kBFd4PfJRcIKytVNP6+w8WgnhdgPgAEPJEjzfhX1jELoVAq5ziE9BcPma1LF2371qIR
         KvlQnHZgIhakCr3ydk+PcjqnDAB1Si1YL3Z9x85FLa3+U0frfC2G159qlhWp4rL4NCfW
         27BX4TpNENkj6nuVycR1BL1Cn3ipX58RcGjWjO5tbUwhN+2nNmHtX5cljl4IO6/iPTBI
         uFSf7KglN/ujUXT8tjZqN3fgLncSnGv1CKGH+1WvOGiy8j7l2pPubjnAjvujQi+cxWpk
         9VWg==
X-Gm-Message-State: AOAM532+spGRwaMi7cVZLxbrZMZVnoX16c+oMUjMZByZXyFFQy8SQr3n
        k+RAIk4wRekgeVTf88gXTFirvw==
X-Google-Smtp-Source: ABdhPJzv/1HY9hsQM4WghbagiFbCcefyqd4jDNtq/4dPy/G575HLa46mXqbb9A/VOKW/6Ajxv5mTbw==
X-Received: by 2002:a63:f20a:: with SMTP id v10mr647186pgh.415.1624686982817;
        Fri, 25 Jun 2021 22:56:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v129sm7662740pfc.31.2021.06.25.22.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 22:56:22 -0700 (PDT)
Date:   Fri, 25 Jun 2021 22:56:21 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
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
        Arnd Bergmann <arnd@kernel.org>, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 8/9] signal/task_exit: Use start_task_exit in place of
 do_exit
Message-ID: <202106252255.32CE2711@keescook>
References: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133>
 <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133>
 <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133>
 <875yy3850g.fsf_-_@disp2133>
 <87pmwb5blu.fsf_-_@disp2133>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmwb5blu.fsf_-_@disp2133>
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, Jun 24, 2021 at 02:03:25PM -0500, Eric W. Biederman wrote:
> 
> Reuse start_task_exit_locked to implement start_task_exit.
> 
> Simplify the exit logic by having all exits go through get_signal.
> This simplifies the analysis of syncrhonization during exit and
> gurantees a full set of registers will be available for ptrace to
> examine at PTRACE_EVENT_EXIT.
> 
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> ---
>  include/linux/sched/signal.h |  1 +
>  kernel/exit.c                |  4 +++-
>  kernel/seccomp.c             |  2 +-
>  kernel/signal.c              | 12 ++++++++++++
>  4 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/sched/signal.h b/include/linux/sched/signal.h
> index a958381ba4a9..3f4e69c019b7 100644
> --- a/include/linux/sched/signal.h
> +++ b/include/linux/sched/signal.h
> @@ -430,6 +430,7 @@ static inline void ptrace_signal_wake_up(struct task_struct *t, bool resume)
>  
>  void start_group_exit(int exit_code);
>  void start_task_exit_locked(struct task_struct *task, int exit_code);
> +void start_task_exit(int exit_code);
>  
>  void task_join_group_stop(struct task_struct *task);
>  
> diff --git a/kernel/exit.c b/kernel/exit.c
> index 635f434122b7..51e0c82b3f7d 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -889,7 +889,9 @@ EXPORT_SYMBOL(complete_and_exit);
>  
>  SYSCALL_DEFINE1(exit, int, error_code)
>  {
> -	do_exit((error_code&0xff)<<8);
> +	start_task_exit((error_code&0xff)<<8);
> +	/* get_signal will call do_exit */
> +	return 0;
>  }
>  
>  
> diff --git a/kernel/seccomp.c b/kernel/seccomp.c
> index b1c06fd1b205..e0c4c123a8bf 100644
> --- a/kernel/seccomp.c
> +++ b/kernel/seccomp.c
> @@ -1248,7 +1248,7 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
>  			force_sig_seccomp(this_syscall, data, true);
>  		} else {
>  			if (action == SECCOMP_RET_KILL_THREAD)
> -				do_exit(SIGSYS);
> +				start_task_exit(SIGSYS);
>  			else
>  				start_group_exit(SIGSYS);
>  		}

Looks good, yeah.

> diff --git a/kernel/signal.c b/kernel/signal.c
> index afbc001220dd..63fda9b6bbf9 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -1424,6 +1424,18 @@ void start_task_exit_locked(struct task_struct *task, int exit_code)
>  	}
>  }
>  
> +void start_task_exit(int exit_code)
> +{
> +	struct task_struct *task = current;
> +	if (!fatal_signal_pending(task)) {
> +		struct sighand_struct *const sighand = task->sighand;
> +		spin_lock_irq(&sighand->siglock);
> +		if (!fatal_signal_pending(current))

efficiency nit: "task" instead of "current" here, yes?

> +			start_task_exit_locked(task, exit_code);
> +		spin_unlock_irq(&sighand->siglock);
> +	}
> +}
> +
>  struct sighand_struct *__lock_task_sighand(struct task_struct *tsk,
>  					   unsigned long *flags)
>  {
> -- 
> 2.20.1
> 

-- 
Kees Cook
