Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3E45F35DA
	for <lists+linux-alpha@lfdr.de>; Mon,  3 Oct 2022 20:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbiJCStW (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 3 Oct 2022 14:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiJCStV (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Mon, 3 Oct 2022 14:49:21 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C0F422E2
        for <linux-alpha@vger.kernel.org>; Mon,  3 Oct 2022 11:49:20 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id au23so3364590ejc.1
        for <linux-alpha@vger.kernel.org>; Mon, 03 Oct 2022 11:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=mW0eP1euyTsPufJF3RY6mTasIPwML94yQM8WRieMZv8=;
        b=qQ3UFfhUG4hy4flmVEo19VHjI0ro2bfcPzLjrd7J0A0+0iR41B7TsRFHg4EuUp1DuV
         bCIg4RDg0XRoCnUT6HYlVm4Gv1MbJR2oM51uXQwsRXF2etP263r86D+0Q4bfBI5CYkcg
         wzGzXhrfq1d4eQxPMv7H5DTcDV6dZj+rXa09Xiex27xf9AXV3WiV0MthHDM7yNx6lnlY
         g/jocUTOuCWvRByQ1IgEtXfkcwXcvYu5THZFq8XSeiszjWlZzq+Uy4yx3qBeFItqpXtL
         U4os3n2rHOFEgNpXVXaJN1qvVxtR2iow/rbauane4zOtrYf8W3WEv296qKR0EVxPuSIL
         KslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=mW0eP1euyTsPufJF3RY6mTasIPwML94yQM8WRieMZv8=;
        b=AsSa5iUSH3ymjv3grfyx+JfPCef0P1tAvaAU8EfFBbGLOsef0b0oPdPp1BPQD7frFf
         qLVwO+pVJx7LBP6ZkG+/7Fnw1WrmBR782AyrWa8HnI23HVoy4PgvzD7w4tGVDVaRWlHU
         Un6BLLk0NmhkAjOJLnbbzk25ZLMpV6026B7xDaeYC8nMxd+UZE5izSAT132ZiHvrW/sN
         1bQ9QN9nOUu7DXUdBnVBOMyQs3Vy16UoQXrcwd4pmZ6U+zPjTSBY49xw3AMV01rXuvdT
         eKWZLfzXn4Y6uyuXZiJRga2MkQbaXKefaI3ju0vKsZIcMHYMZNqGG3e9XNojS4R7YqfR
         Pbtg==
X-Gm-Message-State: ACrzQf2i8j5+/oMAuhGFBxYijfe2wn0jsY8bfw70b6o4iWl8pFDpeCmt
        RT5/zaiQvQpJaavzzhy1X5LEq6bEbqN3S/qEz9DeUw==
X-Google-Smtp-Source: AMsMyM4EGN7PvngA7L7nQ7E/X5PeoHaomxOQ9gWu6opDyrMIudhEv+Qec41PaqLXR1Duz6qB3dy2sY7/fIazo4yZuUw=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr16368996ejs.190.1664822959207; Mon, 03
 Oct 2022 11:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220818092059.103884-1-linus.walleij@linaro.org>
 <20221002224521.GA968453@roeck-us.net> <fd905ca5-fe0d-4cfb-a0d0-aea8af539cc7@app.fastmail.com>
In-Reply-To: <fd905ca5-fe0d-4cfb-a0d0-aea8af539cc7@app.fastmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 Oct 2022 20:49:07 +0200
Message-ID: <CACRpkdbb7OVy7Vg1KGphw5zLLSTCR+hjJPdFyzs4HQBdw-iMow@mail.gmail.com>
Subject: Re: [PATCH] alpha: Use generic <asm-generic/io.h>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Mark Brown <broonie@kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Mon, Oct 3, 2022 at 3:04 PM Arnd Bergmann <arnd@arndb.de> wrote:

> From 258382f3ca77b0e50501a0010d8c9abc2d4c51c8 Mon Sep 17 00:00:00 2001
> From: Arnd Bergmann <arnd@arndb.de>
> Date: Mon, 3 Oct 2022 13:12:54 +0200
> Subject: [PATCH] alpha: add full ioread64/iowrite64 implementation
>
> The previous patch introduced ioread64/iowrite64 declarations, but
> this means we no longer get the io-64-nonatomic variant, and
> run into a long error when someone actually wants to use these:
>
> ERROR: modpost: "ioread64" [drivers/net/ethernet/freescale/enetc/fsl-enetc.ko] undefined!
>
> Add the (hopefully) correct implementation for each machine type,
> based on the 32-bit accessor. Since the 32-bit return type does
> not work for ioread64(), change the internal implementation to use
> the correct width consistently, but leave the external interface
> to match the asm-generic/iomap.h header that uses 32-bit or 64-bit
> return values.
>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 7e772dad9913 ("alpha: Use generic <asm-generic/io.h>")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

This patch was really sweet for Alpha, it makes all of the code
more complete and consistent.

Yours,
Linus Walleij
