Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 567435F3A4B
	for <lists+linux-alpha@lfdr.de>; Tue,  4 Oct 2022 02:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbiJDAC5 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 3 Oct 2022 20:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiJDACz (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Mon, 3 Oct 2022 20:02:55 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 241B117599
        for <linux-alpha@vger.kernel.org>; Mon,  3 Oct 2022 17:02:53 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id c81so12926731oif.3
        for <linux-alpha@vger.kernel.org>; Mon, 03 Oct 2022 17:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=cueZVs+JemlUrpCma8cU2MoonpwhlFUlNsIey5jOwDk=;
        b=XImYLaeVrdpGlNz131QskDLw57oShRWzKlWl05q7GZnGP4fmLn3bLvHYlOU50VM4qE
         TrQfrXYjC1XKLtzwwbG6eTPBPk1J5zgX5EeI1ih1razMkvCmB7KCJ/sG2aTDHxxXW6kE
         cEFUO07c0IZLTZFRJTYwoErMenDJhy5VrY4EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=cueZVs+JemlUrpCma8cU2MoonpwhlFUlNsIey5jOwDk=;
        b=m4SuOLJsF07veWqJigFH5q93LJxHsQxz6FTrrkJWEEUyKvCdt+ynVU+u7u/SHa1kZi
         1ZEavl51vcoQe1DOaefzLbX5A9lGI821DkbJCn+Iz7McU4CLaANzUVZC8064P+EHIM5s
         TJmOQDcXzXnUoDj/jRC3NlY8uqvUC/Kom21fsghEdMiLz7E9889KfrwmQGE63G+hP1AM
         P3DGkTXIjW0BLPwL2ee5lhfWmAn8v6xlaM6Z2bmFVXrLg8r06P/IorYWQr0Y0bGoIu4M
         BZfEwjaBAbLqS35AmFW3O26k/qfvs92f6UGO/RXj4doHjttQbPpE4bXeFGZuhPTpielp
         0JIg==
X-Gm-Message-State: ACrzQf0pkTu2W3BtFEy0CzgEjqksSzLHeOa5Akat7/d+AR8iRdbjOT6A
        AcKyBn2TXSH3XAColNOUqxRoIDHqAVMNyw==
X-Google-Smtp-Source: AMsMyM6vLf0fLVc1OXZorBjv+3o9zHMRPGHAGscfr6g8gtLHMF3l4ggqc4oIGgHC+uH6i+F3UrPL6g==
X-Received: by 2002:a05:6808:21a3:b0:350:cca1:9f40 with SMTP id be35-20020a05680821a300b00350cca19f40mr5253195oib.205.1664841771618;
        Mon, 03 Oct 2022 17:02:51 -0700 (PDT)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com. [209.85.160.52])
        by smtp.gmail.com with ESMTPSA id g10-20020a056870340a00b00127c03b39cesm3312583oah.35.2022.10.03.17.02.49
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 17:02:49 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1322fa1cf6fso7534522fac.6
        for <linux-alpha@vger.kernel.org>; Mon, 03 Oct 2022 17:02:49 -0700 (PDT)
X-Received: by 2002:a05:6870:c0c9:b0:127:c4df:5b50 with SMTP id
 e9-20020a056870c0c900b00127c4df5b50mr6593752oad.126.1664841769263; Mon, 03
 Oct 2022 17:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <202210010938.3922D4DCE@keescook>
In-Reply-To: <202210010938.3922D4DCE@keescook>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 3 Oct 2022 17:02:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjwvBc3VQMNtUVUrMBVoMPSPu26OuatZ_+1gZ2m-PmmRA@mail.gmail.com>
Message-ID: <CAHk-=wjwvBc3VQMNtUVUrMBVoMPSPu26OuatZ_+1gZ2m-PmmRA@mail.gmail.com>
Subject: Re: [GIT PULL] execve updates for v6.1-rc1
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>
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

On Sat, Oct 1, 2022 at 9:40 AM Kees Cook <keescook@chromium.org> wrote:
>
> Please pull these execve updates for v6.1-rc1. This removes a.out
> support globally; it has been disabled for a while now.

Pulled.

And I think some of the alpha side could be cleaned up a bit further,
in that I think this ends up making the osf_readv/writev system calls
be the exact same as the standard readv/writev, since the legacy OSF/1
hackery is now gone with CONFIG_OSF4_COMPAT being a thing of the past.

But it's not a big deal - cc'ing linux-alpha just in case somebody
feels inspired.

               Linus
