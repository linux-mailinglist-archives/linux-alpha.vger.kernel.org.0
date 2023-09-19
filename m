Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9630B7A6AEB
	for <lists+linux-alpha@lfdr.de>; Tue, 19 Sep 2023 20:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbjISSxM (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 19 Sep 2023 14:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232574AbjISSxI (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 19 Sep 2023 14:53:08 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 719B1E5
        for <linux-alpha@vger.kernel.org>; Tue, 19 Sep 2023 11:53:02 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-502153ae36cso9773534e87.3
        for <linux-alpha@vger.kernel.org>; Tue, 19 Sep 2023 11:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1695149580; x=1695754380; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qoumeRTE+qtQQI/kZW10ezE5GjBnHd3+HNtP5YPVTpo=;
        b=Rujq/ZamUKmGy94xf4wfqVgYRUEerJPbg7z/qV3jslJWkG5PLTeLTqm8z5jo6PUtdh
         FrlMig9bPcPipXsj2QIe3cB8CcuoCiLApJt+QVD6NXuNzNhzd+iyoNQtJkiKx+Pm9v2+
         sZltzR1SV1aaQx0nH73otNxc0T63fN8PEycic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695149580; x=1695754380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoumeRTE+qtQQI/kZW10ezE5GjBnHd3+HNtP5YPVTpo=;
        b=qtATlWn0nhX0P9R/e58AXFn5uNM5Aaoub0wtLlR3xcDBQHMReov60uOZHAUwUU9jXx
         44qfHfeg+WKB8TcvcY377meblxnhxF2rRhnTSKvuo25/v8qLITJB00vLO+VepqwYf2QQ
         qiDNXlVErum1fBCY+VkEIZKl9HPoGGVcdKS/37JWnqh8N7kBDYHhU+XSQ4/CSyTLcc/y
         hO3XQHkC7ui0g1Ui9ly5xT8rCL7aHFyY9zBS//igvxI5nH/HKO6/sY//gsDF65EmtxMn
         qVkspEBc9KFqi6iVrfuxREGKONo8Vduh/xNugOc4t4n9x7ILyfHhL7qwP/PlG+esNa1D
         nxgg==
X-Gm-Message-State: AOJu0YyMbjD/LaMT45ZE/tQnbayMhFh3H8etRmZVEgbXAIig5lpdmB1u
        ixUU0svOhcacdHZe08+H8KVypuMyul31RM3voJcgSmcd
X-Google-Smtp-Source: AGHT+IFCkYKh4G2zUOT2hva2K+YWesx5f8ykIP2AUF8DyeRGoW0Q8vTUG76PngQDrjw7HSZPCQ+dhA==
X-Received: by 2002:a05:6512:3b8d:b0:503:38bc:e318 with SMTP id g13-20020a0565123b8d00b0050338bce318mr462849lfv.55.1695149580428;
        Tue, 19 Sep 2023 11:53:00 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id cn10-20020a0564020caa00b00530be302f08sm5135042edb.49.2023.09.19.11.53.00
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 11:53:00 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9adcb89b48bso596646166b.2
        for <linux-alpha@vger.kernel.org>; Tue, 19 Sep 2023 11:53:00 -0700 (PDT)
X-Received: by 2002:a50:fc0e:0:b0:532:e71b:5ead with SMTP id
 i14-20020a50fc0e000000b00532e71b5eadmr258934edr.32.1695149559235; Tue, 19 Sep
 2023 11:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <87zg1u1h5t.fsf@oracle.com> <CAHk-=whMkp68vNxVn1H3qe_P7n=X2sWPL9kvW22dsvMFH8FcQQ@mail.gmail.com>
 <20230911150410.GC9098@noisy.programming.kicks-ass.net> <87h6o01w1a.fsf@oracle.com>
 <20230912082606.GB35261@noisy.programming.kicks-ass.net> <87cyyfxd4k.ffs@tglx>
 <CAHk-=whnwC01m_1f-gaM1xbvvwzwTiKitrWniA-ChZv+bM03dg@mail.gmail.com>
 <87led2wdj0.ffs@tglx> <ZQmbhoQIINs8rLHp@casper.infradead.org>
 <0e69f7df80dc5878071deb0d80938138d19de1d1.camel@physik.fu-berlin.de>
 <20230919134218.GA39281@noisy.programming.kicks-ass.net> <a6c84803274116ec827cd4bdd4e72a8d0c304c27.camel@physik.fu-berlin.de>
 <CAHk-=wgUimqtF7PqFfRw4Ju5H1KYkp6+8F=hBz7amGQ8GaGKkA@mail.gmail.com>
 <87pm2eui95.ffs@tglx> <20230919143816.1741760a@gandalf.local.home>
In-Reply-To: <20230919143816.1741760a@gandalf.local.home>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 19 Sep 2023 11:52:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wizB-G40OxALNnz3-uNxuEAPf95H9hubAPeG2r2mrhwHA@mail.gmail.com>
Message-ID: <CAHk-=wizB-G40OxALNnz3-uNxuEAPf95H9hubAPeG2r2mrhwHA@mail.gmail.com>
Subject: Re: Arches that don't support PREEMPT
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        Ankur Arora <ankur.a.arora@oracle.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        akpm@linux-foundation.org, luto@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, mgorman@suse.de,
        jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
        jgross@suse.com, andrew.cooper3@citrix.com,
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

On Tue, 19 Sept 2023 at 11:37, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> We could simply leave the cond_resched() around but defined as nops for
> everything but the "nostalgia club" to keep them from having any regressions.

I doubt the nostalgia club cares about some latencies (that are
usually only noticeable under extreme loads anyway).

And if they do, maybe that would make somebody sit down and look into
doing it right.

So I think keeping it around would actually be both useless and
counter-productive.

              Linus
