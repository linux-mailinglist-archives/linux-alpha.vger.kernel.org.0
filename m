Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB8B06A2BBE
	for <lists+linux-alpha@lfdr.de>; Sat, 25 Feb 2023 21:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjBYUwK (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 25 Feb 2023 15:52:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjBYUwJ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 25 Feb 2023 15:52:09 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6146612598
        for <linux-alpha@vger.kernel.org>; Sat, 25 Feb 2023 12:52:08 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id cq23so10839760edb.1
        for <linux-alpha@vger.kernel.org>; Sat, 25 Feb 2023 12:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8djA6j0kZiFMB42aE6l5auvpuY5SqYMA0wy5MPfcCVQ=;
        b=M0sPJWPjAfoHB0n+VWVMJdfhSR10t830dJeFHLJkRDKijAYEdPDKAyXHiOiG+iRVuE
         drlWhRDz4zUAv/zp9PYzAZBemgZ8p2wB8YE09bRsTZpM4YMi0rEVz0R1F/+cSX2V/yAw
         53CnXDZx9bClrgAHRY1+cgW9PCgUCxOOOhK/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8djA6j0kZiFMB42aE6l5auvpuY5SqYMA0wy5MPfcCVQ=;
        b=Jyfz3MvXx528kUCChmtAys51llPnseZcI4SQqbuIayN4pzWiNh0z7vIJBsel06m+LY
         G9UdfIDpg86oE/8dDDvmRYjd8NYtBrIwKq1Rj9EuGpVNJ4LCiM2h4S1e0ai9BRQqTpvW
         elnE3JU7VmCKZNRYeJcVSXS6ABbssR1h7R0EjYZubxroQplO2uhTPxuBmd1w5GwG/ciG
         X+RO0dnwOtJCLyxwC+640ceBIn+GyBQXaM8U6byNLNd4OJtEAMbBppswm0OQBjyHCihR
         378sJvUoUc/lxQFKg0sj5YWWLfXHr+4br1chuTh9xSe8D52Z61PB/RkAxrX51fsZmo19
         4xlw==
X-Gm-Message-State: AO0yUKVP9nOsp4D+f8EHALIyl3pJR7r1xuwC3NVFmoGfSV/rzT1VFUKz
        A6nkHkyo9vxQe/iRGaFr0D7FMK+x9Ikb9DY8X6M=
X-Google-Smtp-Source: AK7set/O2r3aSJad06x8aRr//EWGiW9ljhfPOoSvur29W1ignUNFvyJe6jKU7WXvQCMMR+QmoLTrDg==
X-Received: by 2002:a17:906:f0ca:b0:8b2:37b5:cc4 with SMTP id dk10-20020a170906f0ca00b008b237b50cc4mr32630175ejb.7.1677358326302;
        Sat, 25 Feb 2023 12:52:06 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 27-20020a508e1b000000b004aef609f747sm1252038edw.3.2023.02.25.12.52.05
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Feb 2023 12:52:05 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id d30so10763962eda.4
        for <linux-alpha@vger.kernel.org>; Sat, 25 Feb 2023 12:52:05 -0800 (PST)
X-Received: by 2002:a17:906:ae54:b0:8b8:aef3:f2a9 with SMTP id
 lf20-20020a170906ae5400b008b8aef3f2a9mr11921217ejb.0.1677358324819; Sat, 25
 Feb 2023 12:52:04 -0800 (PST)
MIME-Version: 1.0
References: <20230225204001.eostfx5mcba5vaiq@framework.mattst88.com>
In-Reply-To: <20230225204001.eostfx5mcba5vaiq@framework.mattst88.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 25 Feb 2023 12:51:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjsLh9KONXRQvPW85fNx=0i=GsCz7Pb93b6Oy=bndOYGg@mail.gmail.com>
Message-ID: <CAHk-=wjsLh9KONXRQvPW85fNx=0i=GsCz7Pb93b6Oy=bndOYGg@mail.gmail.com>
Subject: Re: [PULL] alpha.git
To:     Matt Turner <mattst88@gmail.com>
Cc:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Sat, Feb 25, 2023 at 12:40 PM Matt Turner <mattst88@gmail.com> wrote:
>
> Please pull a few changes for alpha. They're mostly small janitorial
> fixes but there's also more important ones: a patch to fix loading large
> modules from Edward Humes, and some fixes from Al Viro.

Tssk tssk. Much (all?) of this hasn't been in linux-next, and some of
it ends up being duplicate from Al already sending his parts.

I've taken it, because.. alpha. But please stop doing this to me.

              Linus
