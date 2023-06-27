Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4366273F124
	for <lists+linux-alpha@lfdr.de>; Tue, 27 Jun 2023 05:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbjF0DHB (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 26 Jun 2023 23:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjF0DG7 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 26 Jun 2023 23:06:59 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7930E122
        for <linux-alpha@vger.kernel.org>; Mon, 26 Jun 2023 20:06:58 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-401f4408955so92911cf.1
        for <linux-alpha@vger.kernel.org>; Mon, 26 Jun 2023 20:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687835217; x=1690427217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHjDKRRl/15ekTuy08miOOxy3w0/yhMNRIiKSHMWeKc=;
        b=U+XAZ3T2dIrYSDRflvSR1rmzQYNaCDWIXrwa1SuzZyMaNy4R1Z9M7iKbPChbnEUUcN
         HbNR42w6rgICSGyutbOx3FUPFNrEn/y7PrelQZJmyCIivX/xaF9v3GFiJpnhAtYeu4RI
         /ZCmbFdAX8t40oXyMcprKrsltgmdVNvgUKpuOluQcm4IA1tHAnjOewZE9hAeGjLHQPzC
         F4j8dAcFO/tUYsA1CRgw8DhT52AI7ytP29bgeMTekvzrlL0PghVPLmiES2dlOXNuNOv9
         MjlQKW2/dQnNI81iD4ySLmnOu8yM7NHqS0Y6SWD1+C1voL+3X694zE5VmhYQ+Sl+KeBK
         q2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835217; x=1690427217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vHjDKRRl/15ekTuy08miOOxy3w0/yhMNRIiKSHMWeKc=;
        b=FpnUqvurSObDsQOAHxZ23emzWe7OzbLSywXHEgi1RWuHXHHewSROOdeny6g9Qbro4E
         +L0sU2rIfRc6S5jaLclg1aJ3jQK72HQqka1ccwK7xjOZdTdEEPnHsifF47uPq3V3bXZz
         JrrmUDhu/9oLh/Cv+Ztv1VLX1nZRAbvUibz/C8rNa+fF422JOW/ekmwVVl4Eb4J0nK7q
         xmng+c4lCdc4yhf5p91+fMOqaYQa3qX1ldh6q98No/0RVlx4Kbl0UZ5HB894BoSk7ihs
         V4fIJ5XC7kBGFNJ0PDEvSE71OBkVr3YgDkVepHImBLOfuKq2F7D8O/jKAf/oCCRW9qtq
         2KDg==
X-Gm-Message-State: AC+VfDwWR32MWoNGP3doH11nQPC01Q7ml45Cs3DhPLeFQ6OP5pPc8In0
        0AKvIQB3fe++4b6YKWJiIRQSE0GloOs+IGsInrWAMg==
X-Google-Smtp-Source: ACHHUZ5p5sW4PXCHzSz3Bi+SKvcosf62y2SJQOFc8Eaih/xwzKdQqVu4Rv48gDYQD7M4asyor1cgbPKZvcH6CWAHIzY=
X-Received: by 2002:ac8:59c1:0:b0:3e8:684b:195d with SMTP id
 f1-20020ac859c1000000b003e8684b195dmr619236qtf.10.1687835217476; Mon, 26 Jun
 2023 20:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230626171430.3167004-1-ryan.roberts@arm.com> <20230626171430.3167004-6-ryan.roberts@arm.com>
In-Reply-To: <20230626171430.3167004-6-ryan.roberts@arm.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Mon, 26 Jun 2023 21:06:21 -0600
Message-ID: <CAOUHufZB=E5jW2O_ASuGUP=X-PfVUSFxOCvC=YU1_WwJiQCibA@mail.gmail.com>
Subject: Re: [PATCH v1 05/10] mm: Implement folio_remove_rmap_range()
To:     Ryan Roberts <ryan.roberts@arm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Yin Fengwei <fengwei.yin@intel.com>,
        David Hildenbrand <david@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Mon, Jun 26, 2023 at 11:14=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com=
> wrote:
>
> Like page_remove_rmap() but batch-removes the rmap for a range of pages
> belonging to a folio, for effciency savings. All pages are accounted as
> small pages.
>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  include/linux/rmap.h |  2 ++
>  mm/rmap.c            | 62 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 64 insertions(+)

Sorry for nagging: this can be included in a followup series.
