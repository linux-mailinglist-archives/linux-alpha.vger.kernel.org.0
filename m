Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC83E41E35B
	for <lists+linux-alpha@lfdr.de>; Thu, 30 Sep 2021 23:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbhI3V3H (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 30 Sep 2021 17:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbhI3V3E (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 30 Sep 2021 17:29:04 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD40DC06176A
        for <linux-alpha@vger.kernel.org>; Thu, 30 Sep 2021 14:27:21 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id f18so9109757vsp.2
        for <linux-alpha@vger.kernel.org>; Thu, 30 Sep 2021 14:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h/TBKn03dF9IntMFcuDE9WlvX4rnNMcxTnYaxfj4f3M=;
        b=BlxMYaM/OWq2QOg73mmSIuZReJqS9WDVJwYpygBxYlCdpjQvMPkG8JUUJuWMEfe7VW
         Kc4xJOkMskHk8O+awxj6C0zYig/iRuEgT85zngr4j5VHau1O2THU+xT3x/AlUo4/mD7V
         wX52wLkXcsoyoK8aKbnCd70Ljj6pEqXvKGjjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h/TBKn03dF9IntMFcuDE9WlvX4rnNMcxTnYaxfj4f3M=;
        b=n9EpIheu4lNNNXuLJYDnYHY5k5HCV+MrUIIrKYo2fPESzNx/BMIiTASw67VllFc91w
         PmYu1K8qnBPMRMrTCdgY1t/tJTAdCImzGsM45Rc8T6ejjUNUHGibZhepCaCjOqmoWq2C
         JKFf6uFafwNMNDE/K4TCNMmzLL1w8wyJR53KVPERuiiYpyRZT3ySZdSO2/MTZG1w0X5m
         pXs2phE4uxbml02cWXcK4tUfocF8tmN7w/HOHDij4XKE1ErE7d98nNxo+0lg1NG9bIBq
         nJWVO5zpcbPsxUd3KVCGSDFJ8QUqgjQU9pPnx8oOCWZfWVzH2HbXJvR5uOJp2tVBVjn8
         +HxA==
X-Gm-Message-State: AOAM530VHo8QmUbCJVJdbvgzW3JgRibIGeHGWV5ToDdnHb9pKOdSAqeV
        t7mHwT+dmYbA5/PF5O3vNmsx1w4Ayc707iufVSTuXQ==
X-Google-Smtp-Source: ABdhPJw746NhQ0ORjdgN7DJYf8As2I3fKOwyk4AGF5O4uA7ApOniAbw6zEwRPF1TrdvxOaaCUC/P0w==
X-Received: by 2002:a05:6102:2130:: with SMTP id f16mr1664561vsg.8.1633037240590;
        Thu, 30 Sep 2021 14:27:20 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id b17sm2350340vka.27.2021.09.30.14.27.20
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 14:27:20 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id 10so5257680uae.10
        for <linux-alpha@vger.kernel.org>; Thu, 30 Sep 2021 14:27:20 -0700 (PDT)
X-Received: by 2002:a25:df06:: with SMTP id w6mr1562849ybg.459.1633036849801;
 Thu, 30 Sep 2021 14:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210930185031.18648-1-rppt@kernel.org>
In-Reply-To: <20210930185031.18648-1-rppt@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 30 Sep 2021 14:20:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjS76My8aJLWJAHd-5GnMEVC1D+kV7DgtV9GjcbtqZdig@mail.gmail.com>
Message-ID: <CAHk-=wjS76My8aJLWJAHd-5GnMEVC1D+kV7DgtV9GjcbtqZdig@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] memblock: cleanup memblock_free interface
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Juergen Gross <jgross@suse.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
        devicetree <devicetree@vger.kernel.org>,
        iommu <iommu@lists.linux-foundation.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        KVM list <kvm@vger.kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        linux-um <linux-um@lists.infradead.org>,
        linux-usb@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-sparc <sparclinux@vger.kernel.org>,
        xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, Sep 30, 2021 at 11:50 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> The first patch is a cleanup of numa_distance allocation in arch_numa I've
> spotted during the conversion.
> The second patch is a fix for Xen memory freeing on some of the error
> paths.

Well, at least patch 2 looks like something that should go into 5.15
and be marked for stable.

Patch 1 looks like a trivial local cleanup, and could go in
immediately. Patch 4 might be in that same category.

The rest look like "next merge window" to me, since they are spread
out and neither bugfixes nor tiny localized cleanups (iow renaming
functions, global resulting search-and-replace things).

So my gut feel is that two (maybe three) of these patches should go in
asap, with three (maybe four) be left for 5.16.

IOW, not trat this as a single series.

Hmm?

             Linus
