Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73137696638
	for <lists+linux-alpha@lfdr.de>; Tue, 14 Feb 2023 15:13:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233300AbjBNONT (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 14 Feb 2023 09:13:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233284AbjBNOM7 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 14 Feb 2023 09:12:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B1E2B606
        for <linux-alpha@vger.kernel.org>; Tue, 14 Feb 2023 06:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676383851;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7edBYp6qpX/SlmDw/QknJtcx6m2SrqGm1x4V+hfCBb4=;
        b=WmQ+c04Gcde7tfL1HjXnrE6KaSjUWOjYR/AHgAlD9TMhkuuIUlaAo2nu2uK6sCu+m10sIL
        66/DWDKJZxbFziiTRnj9SXh8yQrlZWjxwXRN6SK0vMqzVYD+achIC93iHQY507XBmNFgP9
        XluJDmAGy+cxzx6sfXzCnbrGJSOAz3A=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-282-LYVSI7ccNqaQmas6RJjGHA-1; Tue, 14 Feb 2023 09:10:50 -0500
X-MC-Unique: LYVSI7ccNqaQmas6RJjGHA-1
Received: by mail-qv1-f70.google.com with SMTP id lt2-20020a056214570200b0056eb0500ee1so3379314qvb.18
        for <linux-alpha@vger.kernel.org>; Tue, 14 Feb 2023 06:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7edBYp6qpX/SlmDw/QknJtcx6m2SrqGm1x4V+hfCBb4=;
        b=yTxiPVRbbJTwEd436ALYImcocENxmQ8z9bdZgmebRnz7CLmpuTjES8TEthlSNi17Qo
         3ETI+CPVbTq0Rj/8kOk6D8W27DgXEYmrFMW3MuFF6aCfs4NVWRndSP5GNKgMJL308N4Y
         b7pyRWPTp7BhQrtNkfRKj/8tiT47T1ffvql4b0M4lis42gcI422Nvro9y3Bh3LRIWaXi
         DfRqh24NasgvXNTs/F4fcvmWlQqVbkJ/GLoGIlQgGUIuEeuQlcCrZe2QwIOtDdCZdOu+
         qy4rNSBfLy4VL+hkjB7FjljbXDhuncvTf5YvoIbKwq1E46QxAhWvCJLlJHWIlxKHmQa5
         6caQ==
X-Gm-Message-State: AO0yUKUseiiAIBMgdqRh72LCnL/TUtBStGe1Q1Q4DJSAcRGXcwp6F6hI
        6bzj+YonLrKX24yO/YB+FbYWHJHYcF+Xq4zTTto3fBCiQPh225qYmDX8VHd4mqqq+y42vbOABsL
        wy+1aTreNsV/eSxujxVqKt1o=
X-Received: by 2002:a05:622a:50:b0:3b8:691f:271 with SMTP id y16-20020a05622a005000b003b8691f0271mr3386008qtw.63.1676383850307;
        Tue, 14 Feb 2023 06:10:50 -0800 (PST)
X-Google-Smtp-Source: AK7set98OEMKfsGkU19OgnlE6heJ9O6LLo1g6QDlcHkAXfWHsX591p7/3MvgrPqMUwlWB9z0tPx4tA==
X-Received: by 2002:a05:622a:50:b0:3b8:691f:271 with SMTP id y16-20020a05622a005000b003b8691f0271mr3385969qtw.63.1676383849978;
        Tue, 14 Feb 2023 06:10:49 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id s184-20020ae9dec1000000b0073b38652b9csm4892065qkf.122.2023.02.14.06.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 06:10:49 -0800 (PST)
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
Subject: Re: [PATCH v4 0/7] Generic IPI sending tracepoint
In-Reply-To: <20230119143619.2733236-1-vschneid@redhat.com>
References: <20230119143619.2733236-1-vschneid@redhat.com>
Date:   Tue, 14 Feb 2023 14:10:43 +0000
Message-ID: <xhsmhh6voqqvw.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org


Hey folks,

On 19/01/23 14:36, Valentin Schneider wrote:
> Patches
> =======
>
> o Patches 1-5 spread out the tracepoint across relevant sites.
>   Patch 5 ends up sprinkling lots of #include <trace/events/ipi.h> which I'm not
>   the biggest fan of, but is the least horrible solution I've been able to come
>   up with so far.
>
> o Patch 7 is trying to be smart about tracing the callback associated with the
>   IPI.
>
> This results in having IPI trace events for:
>
> o smp_call_function*()
> o smp_send_reschedule()
> o irq_work_queue*()
> o standalone uses of __smp_call_single_queue()
>

This still rebases cleanly on top of the latest tip/sched/core, any
objections to parking it there?

