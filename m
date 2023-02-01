Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE98E683ADF
	for <lists+linux-alpha@lfdr.de>; Wed,  1 Feb 2023 01:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbjBAAA6 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 31 Jan 2023 19:00:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbjBAAAv (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 31 Jan 2023 19:00:51 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E89E1024B
        for <linux-alpha@vger.kernel.org>; Tue, 31 Jan 2023 16:00:43 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id me3so46543156ejb.7
        for <linux-alpha@vger.kernel.org>; Tue, 31 Jan 2023 16:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lRCOdD9CD/IiFJ43pipYPy+q1tidOpGH1rcqkIGuMSQ=;
        b=fL59Ab7RHJP0bfIYtovRgam/bmLVqgi/HuOZuRtvXpi8XPCKPsz19TVQkwQ/4pcElK
         nbpNee2j9nRk73RFGNcIlDQDDv7dgJ9GC8xvsYkG1wEa43drPEZkLrJIAfsAF0ElYFBV
         ZenNmi1Qr0FBP87JP4qtwax7RH2E68mH3aIp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRCOdD9CD/IiFJ43pipYPy+q1tidOpGH1rcqkIGuMSQ=;
        b=YM8uETocQGiGiO9a81jSYb3ir5iQyE1RARBVoGaE97dxERb3QGZ1d3e/tu0gy8ur9h
         Wgn2HtpOAnFpONTLDvz4LB2zFR1jiI2m7dL9ooXYgjpDaeei4qIdPyWC2MKxDNXCnHDq
         iqUDPmFIlHZZ+w7+AaZNgSHnTMw5XKp0CrYV/gpHwd8U/Q25AWICmCE9ydRQO0ChVy2i
         YJLKXSkcXbVb7zne+AXapmcUh2tNJ3a99sgfJRLCDQb8h9zAoLkVn3CL+1874IJBQ76M
         drvqXgTkyRV89BNQ9LDC6OwI+vR5h5yFDeX88Dtyz8IpyTKkqZd9bDPi9uo/TctHN5E3
         j1WQ==
X-Gm-Message-State: AO0yUKWgO2Ob7AtnMQHrMt2E69wIS6m7Mcy6vxOrSj6YODVU+neQyWJI
        OnRagYe8qcql+5cQcFmSppvDtJrPV+210iN5QEY=
X-Google-Smtp-Source: AK7set9+EYXtnN9nTjUsybnb8sBGdjUZJ0EBogZzKmU6/fKazCpzwNpe2nyUqwduzMamRQMA4cGgPg==
X-Received: by 2002:a17:906:d7ab:b0:878:7c18:8fd9 with SMTP id pk11-20020a170906d7ab00b008787c188fd9mr236201ejb.44.1675209641143;
        Tue, 31 Jan 2023 16:00:41 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id t4-20020a170906948400b0084c4b87aa18sm9026616ejx.37.2023.01.31.16.00.40
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 16:00:40 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id me3so46542938ejb.7
        for <linux-alpha@vger.kernel.org>; Tue, 31 Jan 2023 16:00:40 -0800 (PST)
X-Received: by 2002:a17:906:184a:b0:878:70c8:14f0 with SMTP id
 w10-20020a170906184a00b0087870c814f0mr84229eje.20.1675209639791; Tue, 31 Jan
 2023 16:00:39 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV> <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
 <Y9mM5wiEhepjJcN0@ZenIV>
In-Reply-To: <Y9mM5wiEhepjJcN0@ZenIV>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 31 Jan 2023 16:00:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjNwwnBckTo8HLSdsd1ndoAR=5RBoZhdOyzhsnDAYWL9g@mail.gmail.com>
Message-ID: <CAHk-=wjNwwnBckTo8HLSdsd1ndoAR=5RBoZhdOyzhsnDAYWL9g@mail.gmail.com>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Peter Xu <peterx@redhat.com>, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, Jan 31, 2023 at 1:49 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Everything else seems to be going with EFAULT.

So I think fo kernel faults it's always basically up to the exception
handler, and sending a signal regardless of that is just wrong.

Of course, an exception handler might choose to send a signal, but it
just shouldn't be the do_page_fault() handler that does it.

For user faults, I think the rule ends up being that "if there's no
mapping, or if there is a protection fault, then we should do
SIGSEGV".

If there's an actual mapping in place, and the mapping has the right
permissions for the access, but fails for some *other* reason, then we
send SIGBUS.

So a shared mmap past the end of the file (but within the area that
was used for mmap) would SIGBUS, while a write to a read-only mapping
would SIGSEGV.

Things like unaligned accesses also might SIGBUS rather than SIGSEGV.

And I'm not surprised that there are exceptions to the rule, because
almost nothing really cares. In most situations, it's a fatal error.
And even when catching them, the end result is generally the same
(either "print out helpful message and die", or "longjump to some safe
code").

So most of the time it's probably not going to matter all that much
which signal gets sent in practice.

            Linus
