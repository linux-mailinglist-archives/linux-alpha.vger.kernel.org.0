Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E48B8695E2D
	for <lists+linux-alpha@lfdr.de>; Tue, 14 Feb 2023 10:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbjBNJHq (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 14 Feb 2023 04:07:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjBNJHd (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 14 Feb 2023 04:07:33 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB5962411F
        for <linux-alpha@vger.kernel.org>; Tue, 14 Feb 2023 01:06:38 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id he5so2655210wmb.3
        for <linux-alpha@vger.kernel.org>; Tue, 14 Feb 2023 01:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mrd61pIHrQzmg4nsVKgkd/XXpTIpHaY6sSTMHOrhSXA=;
        b=OjxC7QQwmF9zY3g/4GkOU2LzN1229KFU+q2E5z/etnUt3sKGkRcmafL3Y8YGfN8UoH
         /hA0Og6bQxUjDsLcLUBFud+jhM3hpqUQChsTdeXNp0tkKdVh8tevnFLlHKLxoOYq+5xL
         Hi6CbSJ5kXMYb2q6/nwBbXnClXiYdCGxqUZS8ITbAu8oILSq9JbNtSn9tIwtBoSPdAYs
         kOnqVm3rrx3zCADZ0mYNb2ZWJ5WCMVL/uJVdwicgJyr5x/KPBBOtEjuDsBeA9K3W7Qrz
         TMZBc98TRM7eH3aNDw0+OEuw1gtcuxCOkgs2RDAkkGjl9mAAfAf7OaWzL1J9MXbvPMm7
         tVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mrd61pIHrQzmg4nsVKgkd/XXpTIpHaY6sSTMHOrhSXA=;
        b=8ROgeuJ6aVMv3/7++keLHR4APGWHUXf/peW6+jgIG8SWSlg4aVLXiiZc1hNJXgIQsA
         tKA5Q6hlhsGqNEk5bRCWHTSrTrxVagwEfsdsLWtQFw4jeY3s0ncUn1JZ6g7MMSXof/7k
         2nFmaVlujxjNpTclxjmvzjZYm7pnvCN731Qp0TYANIKtf8T2w03bbrn4d4KSIdOjFDiS
         igMyfEqCJAjOEJOiXTwcl87HkRAUUEvMyNvgd4XSyGNVL/wASpkMOhE8XP/DBp5pTrc+
         101eF5tDL8W1MzjJ/0w8zNtMGl2zXb2bCoE+fbTCLxjYL8uaL8pcUjavHkpLen5pwaWs
         G6Eg==
X-Gm-Message-State: AO0yUKVb8bfpH5lWhzwDORxE/STQkplCJAg8CQ4fOs67xycuKrouhFG9
        fVJAPnmanEHIRPb2niRoADW0oQ==
X-Google-Smtp-Source: AK7set9MiM4/caZ+oETuVXovz1fIhowKvB35m6VhOBkhclAa3qSu0wh7KMvERZsT3+tjLvnUvDpWqA==
X-Received: by 2002:a05:600c:708:b0:3e1:577:80f4 with SMTP id i8-20020a05600c070800b003e1057780f4mr1429963wmn.18.1676365598212;
        Tue, 14 Feb 2023 01:06:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c468600b003dc36981727sm21222346wmo.14.2023.02.14.01.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:06:37 -0800 (PST)
Message-ID: <30e92251-cd6a-f1d9-a952-7c2fc427cb7f@linaro.org>
Date:   Tue, 14 Feb 2023 10:06:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 07/24] mips: Remove COMMAND_LINE_SIZE from uapi
Content-Language: en-US
To:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-8-alexghiti@rivosinc.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214074925.228106-8-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On 14/2/23 08:49, Alexandre Ghiti wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>   arch/mips/include/asm/setup.h      | 3 ++-
>   arch/mips/include/uapi/asm/setup.h | 3 ---
>   2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

