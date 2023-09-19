Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37D57A6996
	for <lists+linux-alpha@lfdr.de>; Tue, 19 Sep 2023 19:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbjISR0E (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 19 Sep 2023 13:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbjISR0D (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 19 Sep 2023 13:26:03 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 937DBED
        for <linux-alpha@vger.kernel.org>; Tue, 19 Sep 2023 10:25:57 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso112976366b.1
        for <linux-alpha@vger.kernel.org>; Tue, 19 Sep 2023 10:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1695144356; x=1695749156; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PUjFUwCVE5/xUduoxjL7lC1W3crAzRPXEbwf2O/yhew=;
        b=esyxep1wm9WTP2m5lM5JQ9sYjs+ivvuwWEyQAaHvrYOaugt7nvaeNpPDxK58zYcw3e
         6iO9OZaUBcAQy1q67Z2I8e6wJL1LhmnH4c1PBl/D9F19ZRu3bQWd5pAXqHXaaC8oaz+C
         oqm8Y9dNEAmEAZORVxROSEjIdF6KyuY5FKkT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695144356; x=1695749156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUjFUwCVE5/xUduoxjL7lC1W3crAzRPXEbwf2O/yhew=;
        b=fKaVDpW3iAGkmcES+QW/fU4nYNP1ibaoLwWRmAYejkdgiZjVIrEi+B2DbxzYuXThdV
         bjyTjn3CC3JczyCyN8UJXbo0cYmg3huhuEVvtnALyJyGzIG6SQMsO8jaE7/IQbFSMwUk
         hGfxJAsHTCkpCC2IN5GwtHMQa1mY0LEpDxX3ttATS7VxPEdnL3juQkIr/KkKoMY5XJWE
         r/+WrEl1BzvGhnETbYIFaZS5NLZ2cS8veg4dANaz/kW9CwnVe51OImf124WnvLucIhpY
         AE9HcS7VExM0fSqkUYxc7ux94FgPVdpxtwm5DALtA/HdPGTeFjC5mhgZf4EdOkTQ+Kfi
         nJgQ==
X-Gm-Message-State: AOJu0Yy9YyIO1hAqrnzzV32wLfX/mFpj8FhSVnQWdX4eqeTsJ26UBomy
        +HsbouDJYErJI6YV+HGJP3iehMg+zi2+uPsvxsmfEWsH
X-Google-Smtp-Source: AGHT+IF3pjArTmguuEqqxrXHo3nGpI2KHE1qvWRDg5LMYNRyU5Tx3eGcEgV1IXqmftGU8A/+cka72A==
X-Received: by 2002:a17:906:196:b0:99b:f58d:1c49 with SMTP id 22-20020a170906019600b0099bf58d1c49mr36341ejb.53.1695144355888;
        Tue, 19 Sep 2023 10:25:55 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id dk14-20020a170906f0ce00b00992b2c55c67sm8067791ejb.156.2023.09.19.10.25.55
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 10:25:55 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40434d284f7so62244305e9.3
        for <linux-alpha@vger.kernel.org>; Tue, 19 Sep 2023 10:25:55 -0700 (PDT)
X-Received: by 2002:a19:e04b:0:b0:4fe:3724:fdae with SMTP id
 g11-20020a19e04b000000b004fe3724fdaemr269206lfj.66.1695144333866; Tue, 19 Sep
 2023 10:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <87zg1u1h5t.fsf@oracle.com> <CAHk-=whMkp68vNxVn1H3qe_P7n=X2sWPL9kvW22dsvMFH8FcQQ@mail.gmail.com>
 <20230911150410.GC9098@noisy.programming.kicks-ass.net> <87h6o01w1a.fsf@oracle.com>
 <20230912082606.GB35261@noisy.programming.kicks-ass.net> <87cyyfxd4k.ffs@tglx>
 <CAHk-=whnwC01m_1f-gaM1xbvvwzwTiKitrWniA-ChZv+bM03dg@mail.gmail.com>
 <87led2wdj0.ffs@tglx> <ZQmbhoQIINs8rLHp@casper.infradead.org>
 <0e69f7df80dc5878071deb0d80938138d19de1d1.camel@physik.fu-berlin.de>
 <20230919134218.GA39281@noisy.programming.kicks-ass.net> <a6c84803274116ec827cd4bdd4e72a8d0c304c27.camel@physik.fu-berlin.de>
In-Reply-To: <a6c84803274116ec827cd4bdd4e72a8d0c304c27.camel@physik.fu-berlin.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 19 Sep 2023 10:25:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgUimqtF7PqFfRw4Ju5H1KYkp6+8F=hBz7amGQ8GaGKkA@mail.gmail.com>
Message-ID: <CAHk-=wgUimqtF7PqFfRw4Ju5H1KYkp6+8F=hBz7amGQ8GaGKkA@mail.gmail.com>
Subject: Re: Arches that don't support PREEMPT
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ankur Arora <ankur.a.arora@oracle.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        akpm@linux-foundation.org, luto@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, mgorman@suse.de,
        rostedt@goodmis.org, jon.grimm@amd.com, bharata@amd.com,
        raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, jgross@suse.com, andrew.cooper3@citrix.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org, Brian Cain <bcain@quicinc.com>,
        linux-hexagon@vger.kernel.org,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, 19 Sept 2023 at 06:48, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> As Geert poined out, I'm not seeing anything particular problematic with the
> architectures lacking CONFIG_PREEMPT at the moment. This seems to be more
> something about organizing KConfig files.

It can definitely be problematic.

Not the Kconfig file part, and not the preempt count part itself.

But the fact that it has never been used and tested means that there
might be tons of "this architecture code knows it's not preemptible,
because this architecture doesn't support preemption".

So you may have basic architecture code that simply doesn't have the
"preempt_disable()/enable()" pairs that it needs.

PeterZ mentioned the generic entry code, which does this for the entry
path. But it actually goes much deeper: just do a

    git grep preempt_disable arch/x86/kernel

and then do the same for some other architectures.

Looking at alpha, for example, there *are* hits for it, so at least
some of the code there clearly *tries* to do it. But does it cover all
the required parts? If it's never been tested, I'd be surprised if
it's all just ready to go.

I do think we'd need to basically continue to support ARCH_NO_PREEMPT
- and such architectures migth end up with the worst-cast latencies of
only scheduling at return to user space.

               Linus
