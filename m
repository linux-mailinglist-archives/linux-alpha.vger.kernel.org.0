Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 223E8598E60
	for <lists+linux-alpha@lfdr.de>; Thu, 18 Aug 2022 22:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345681AbiHRU4N (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 18 Aug 2022 16:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344719AbiHRU4M (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 18 Aug 2022 16:56:12 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D41D023D
        for <linux-alpha@vger.kernel.org>; Thu, 18 Aug 2022 13:56:11 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id j8so5399092ejx.9
        for <linux-alpha@vger.kernel.org>; Thu, 18 Aug 2022 13:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=5AqMTUOafuor9bD+L7lV88ZEJ/jKLotcwTHvR2YIZ54=;
        b=d6rI5yBNn0HKXzLQQzJICy5/Ucwg1kVprijxc1ueN4xCG6rnpFDv2sJw4c9gn0pFb/
         oxK8vBM1d9KVBz3PmQobsROfOdNSb8ttqmJAF6coEGldZZ3YWfYgH8ajrUfSFLcf49sq
         5rXnDKt5muPjVmilXrq2WH8beyBFahPcNQUAi3eotyAiK69lQ3apFPLDgF+YadMzikP2
         J+8rQOuh3NuH8tqcivIj0DpVByKsZqLZ8G4bMeS1Rg5F/YFgJVLRhRqXCYHUgsLDvjHs
         dVGgifndGmF8hE7VnXfgNV4jRVZI1iGTkr2KV3iYNzWi1qtHmPzxHJ2awfJHqEKNHGTo
         yE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=5AqMTUOafuor9bD+L7lV88ZEJ/jKLotcwTHvR2YIZ54=;
        b=DdUSSdNG2hazrcKDPkAYLpFIsC5YRKh6+vT+7YwtjYekx+Kk4wgNBCaoZV/Zu0/9BW
         4pawnovbCTE8+j5NTUcBZ5Fb4vAGhbYOxICQ7NuaRJ6BL4OxY9sSTKQgk6k4TA+TMEti
         /27y3ZIjQhtf3VxBMnERW9d75T4XZYwdMcLI67ygzlhMup1bLMySceieGQtMYpFMQFWh
         eeMW7C3bImDQxl4fnt05YRK8Mzy/aEjMiVdJEl1JjxteSkIf26MH/T0Cz5D9AKAsWWca
         zQlw0A/HS2dSbjikuU0wadsKf98FI9k8HroNXZn/FxmSytlRjrQBAVSfosOhzeO7Yo1s
         Pqpw==
X-Gm-Message-State: ACgBeo0IwZ5F2h7Pjo7UryB2Fkz0uXl3xxUD1V3eAhcQU/EjOIj7kTiv
        BAwmEh8xrRac5YnnnAujZ85kP/q+7vSyN9QINKj5lw==
X-Google-Smtp-Source: AA6agR58/DAV1ANOlNLb25KqUSUGUGVdB5p/Jno2SsFbpj6puinYHLXnUxIYqTgyMu+ZChTf2K2ZM7EwYIdqRIxmDSI=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr3031706ejs.190.1660856169872; Thu, 18
 Aug 2022 13:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <Yv4hhoTTcRuk/2Kl@debian>
In-Reply-To: <Yv4hhoTTcRuk/2Kl@debian>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 18 Aug 2022 22:55:58 +0200
Message-ID: <CACRpkda1-FBa5Pg1WxaPYGYgaYWz-nEAiN01twouJ4AeKpnMWQ@mail.gmail.com>
Subject: Re: build failure of next-20220818 due to 81c0386c1376 ("regmap:
 mmio: Support accelerared noinc operations")
To:     "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        linux-alpha@vger.kernel.org,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, Aug 18, 2022 at 1:24 PM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:

> Not sure if it has been reported, builds of alpha allmodconfig have
> failed to build next-20220818 with the error:

Patch has been sent already:
https://lore.kernel.org/linux-arch/CAK8P3a1x52F8Ya3ShQ+v6x_jANfUsEq0E55u+pOBNaYniRO7cA@mail.gmail.com/T/#t

Yours,
Linus Walleij
