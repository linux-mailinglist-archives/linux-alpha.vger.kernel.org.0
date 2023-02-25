Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3E356A26E9
	for <lists+linux-alpha@lfdr.de>; Sat, 25 Feb 2023 04:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjBYDRj (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 24 Feb 2023 22:17:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBYDRi (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 24 Feb 2023 22:17:38 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087D3231F5
        for <linux-alpha@vger.kernel.org>; Fri, 24 Feb 2023 19:17:37 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id d30so4871908eda.4
        for <linux-alpha@vger.kernel.org>; Fri, 24 Feb 2023 19:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LmNBVo7uMw1aKq2gIrda4qCIdgm1A6fpKV1+5VP6zB8=;
        b=CNsccW8tA+8ig58sm067TPguHm1dqrGdvdIfAPEzz6ALh36vuJuyTUG5qKT+eU4uM/
         7fMH3gXsZbB4TC8buks/zia2MSzAQQ6lVZy35U+/aMqF/7piRqQ0lU6oHnGJQfOSwGLu
         QjsHiGsYCvsFkN/7u71yE9bcCEGRxqLZw1Vwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmNBVo7uMw1aKq2gIrda4qCIdgm1A6fpKV1+5VP6zB8=;
        b=xX5SkApYYEBIZPBIFTfz7KCxWyb+OpN1m5pYNPGWmaPZErgdmIRuKmw2jbbIaSLh00
         U/QY2ELpNgRRBK/XXoQlFGOIf5d45YhIgq7r9K9Abdo9IBVat+nmvRS9MRK1F2UqT/ix
         WPbhyLBF//PNXQT1rc87H9+xvFEr4lbBkN2kHYd05kiTIvYA4dtFxYtKbEmktUuiRZt0
         /M4uHTjUn6e7MOYbrjhKSCDrI4LsXCis7SDfAqKWVTnJB0VlLerea5AaUhwYRHND4ttl
         gvbprfue9zLX2KvwhIenX2VMnQEioZkdnQHTH6SyIYCg/pnZGHc28vF6w2rnt226nMu6
         k9cw==
X-Gm-Message-State: AO0yUKVgCo33aF2IJFi3E+E/HKo4Yx/tFXfezDpm02+NaKsW/iDNEzIk
        x5DgQFyQOTLfg44fvR0/yYqstU8xEtbNH1KoUl4Nwg==
X-Google-Smtp-Source: AK7set/brpbu2xAh2Xz+wNZOAKD86o5xvxvS9soMnScBQQ17G+Qm8BG7FQzHwlaNYUGNtDs6l+AS4Q==
X-Received: by 2002:a17:907:2bd2:b0:889:d998:1576 with SMTP id gv18-20020a1709072bd200b00889d9981576mr24555324ejc.66.1677295054142;
        Fri, 24 Feb 2023 19:17:34 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id o5-20020a17090611c500b008b907006d5dsm315299eja.173.2023.02.24.19.17.33
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 19:17:33 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id h16so4742190edz.10
        for <linux-alpha@vger.kernel.org>; Fri, 24 Feb 2023 19:17:33 -0800 (PST)
X-Received: by 2002:a17:907:988c:b0:877:747e:f076 with SMTP id
 ja12-20020a170907988c00b00877747ef076mr11483974ejc.0.1677295053168; Fri, 24
 Feb 2023 19:17:33 -0800 (PST)
MIME-Version: 1.0
References: <Y/gvQh5+4k8y+IdF@ZenIV>
In-Reply-To: <Y/gvQh5+4k8y+IdF@ZenIV>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 24 Feb 2023 19:17:16 -0800
X-Gmail-Original-Message-ID: <CAHk-=whwFeuahxGxCidcaaZ-Xawh2drJV6WFwhs7ujDZGNGV4Q@mail.gmail.com>
Message-ID: <CAHk-=whwFeuahxGxCidcaaZ-Xawh2drJV6WFwhs7ujDZGNGV4Q@mail.gmail.com>
Subject: Re: [git pill] vfs.git alpha fixes
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org
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

On Thu, Feb 23, 2023 at 7:30 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>  FEN fault fix deals with a really old oopsable braino

My old alpha architecture manual doesn't even list "clrfen" as a
PAL-code instruction.

It does have "wrfen", but that's privileged.

I have no idea when clrfen became a thing. But it's clearly a later
addition that somebody didn't think through.

             Linus
