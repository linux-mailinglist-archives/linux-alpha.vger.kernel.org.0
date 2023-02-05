Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 157F868B1A4
	for <lists+linux-alpha@lfdr.de>; Sun,  5 Feb 2023 21:41:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjBEUln (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 5 Feb 2023 15:41:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjBEUln (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Sun, 5 Feb 2023 15:41:43 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D07B1C33F
        for <linux-alpha@vger.kernel.org>; Sun,  5 Feb 2023 12:41:38 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id ml19so29136966ejb.0
        for <linux-alpha@vger.kernel.org>; Sun, 05 Feb 2023 12:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nA/a76A+HUu/p3q1j/ksBjPXLniSmCFkRwLsRUtoauc=;
        b=RAXg4fKD/6SPLwBhZz74xHccwCI6WZIYpGpGHWQ9ObJeCvGoohTSAtwCqfiD+ZaDQ1
         aIRLI8OL+avYEEBlM4uINCdq7A3GKoZhraxTCpB9pYCimwQ4kIElEWhkml7G/7PEKTT6
         Vy21ly1st4HkkM+1bI4kXV+bK57J6A6HvWAas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nA/a76A+HUu/p3q1j/ksBjPXLniSmCFkRwLsRUtoauc=;
        b=nq7Q93eTcUd0i1kVl5qUEDCaNd9JyqjuTCIh/W/yFxgLPHGCiNY3CbpQZkQ2cuJ9ZC
         7QB+pweWC0PpDXvsR5oegzju5wSd7u27cGgpCLMI5aUwt9vC5A4Cwsj2XzeR5UIwx1mz
         P2Jqmofh/7c2PTVXFz6Ml2i1MnqbyVuNf5Cks/JKLdM9X+r6v4SZvYdss7kjqaWvii8P
         gHHkCZlu0ovE3CpBbqHPxcipHteZeeUVLUvzx8cKqPRjSADo07Zx6R9tqe+yRR94jrEw
         UTRnbcuMcmd+SgHU+DJPtuRL1TVO6xnGN1PVMsVO1A+h9JQMP7exV+BGiZOwbF+WY2ns
         Ie4w==
X-Gm-Message-State: AO0yUKV+mkrbViyR/WzQaP7e1mknigI7YWu7UsgY7INggyB/6UFhdxx3
        oFZCRG465Azq5/g2q3HPha9Dgcp7s25zFnSW1OI=
X-Google-Smtp-Source: AK7set/uL1IwcmE4t0zu/P9Axj5A2iPcngJ4x85UF4ypWKT3EmPUefJ/mSu/l/wjiUGP/5zbXRhZLQ==
X-Received: by 2002:a17:907:9382:b0:878:4c4e:1c6a with SMTP id cm2-20020a170907938200b008784c4e1c6amr13977625ejc.3.1675629696774;
        Sun, 05 Feb 2023 12:41:36 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id u23-20020a1709063b9700b0088ba2de323csm4533319ejf.181.2023.02.05.12.41.35
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 12:41:36 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id mc11so28920776ejb.10
        for <linux-alpha@vger.kernel.org>; Sun, 05 Feb 2023 12:41:35 -0800 (PST)
X-Received: by 2002:a17:906:892:b0:87a:7098:ca09 with SMTP id
 n18-20020a170906089200b0087a7098ca09mr4402604eje.78.1675629695651; Sun, 05
 Feb 2023 12:41:35 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9l0aBPUEpf1bci9@ZenIV>
 <92a4aa45-0a7c-a389-798a-2f3e3cfa516f@linux-m68k.org> <Y+AUEJpWYdUzW0OD@ZenIV>
In-Reply-To: <Y+AUEJpWYdUzW0OD@ZenIV>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 5 Feb 2023 12:41:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh8+LsDDd8AFMwaYHAA+eLT8O2ziEJfpoeo_H6MCg2NKg@mail.gmail.com>
Message-ID: <CAHk-=wh8+LsDDd8AFMwaYHAA+eLT8O2ziEJfpoeo_H6MCg2NKg@mail.gmail.com>
Subject: Re: [PATCH 04/10] m68k: fix livelock in uaccess
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Finn Thain <fthain@linux-m68k.org>, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        sparclinux@vger.kernel.org
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

On Sun, Feb 5, 2023 at 12:39 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> BTW, since these patches would be much easier to backport than any unification
> work, I think the right thing to do would be to have further unification done on
> top of them.

Ack. I'm not NAKing the patches, I was just hoping that we also have
some way forward.

So "fix the issues, then unify" sounds like the right thing to do to me.

               Linus
