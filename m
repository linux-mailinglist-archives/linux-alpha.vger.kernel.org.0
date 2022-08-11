Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E91E58FF7F
	for <lists+linux-alpha@lfdr.de>; Thu, 11 Aug 2022 17:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235583AbiHKPas (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 11 Aug 2022 11:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235789AbiHKPaI (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 11 Aug 2022 11:30:08 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2899568D
        for <linux-alpha@vger.kernel.org>; Thu, 11 Aug 2022 08:29:42 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id q9-20020a17090a2dc900b001f58bcaca95so5717014pjm.3
        for <linux-alpha@vger.kernel.org>; Thu, 11 Aug 2022 08:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=k4cTJcWzw8+6axf00iGx7biHKXUEGT3Ofca07ePg5B0=;
        b=e8WRD+IbMXLxt0XX5XAhvJBvN5jLNJ8ZUx93+YW8cz7r7GCpyryYTdJ+UJNUPY223r
         zzoPmw6xUn3VMbJuI2F2ZSeOhIbrKmiX3G9mhH6iyovCbNm2Puhe2oTBwUlY5OL7qfj2
         sQGEp1yOeNmSmYqyuuyL7LSmz37k/frFxM+oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=k4cTJcWzw8+6axf00iGx7biHKXUEGT3Ofca07ePg5B0=;
        b=1gLub+TNb0BK9oan3vX94L9ZHu0zkeMi+NnkMUPIyBR4gi9G0sC0Qujii2NHYIOqVJ
         +ib3jKoelyFkMywEmP+syg3L9v2OjjKn1Kiv2m1TaI8HS0A/dfKMdvQlwWAAkOZuEk8o
         U1W2N9fs+eh4+BLHoBRxZB43BeKwk9A1eOQpDs6wGhsMbzxh78huEVzr5BV7fZnUTwrR
         lot7iKfO0vk5wUjdWHLQ2MqaVbGNp4uOAVAlE3EncmZL03hYkKEV4/frcB56ThIc5MKE
         PIxaJDwsgd0mQOF0f/ifJknRbXJq7yESoZLN9VAxcyx0IVW+70KmtPRjltjZZx9MA8Wf
         WavA==
X-Gm-Message-State: ACgBeo2QizodADrKIQzKN0HRfVRb2EmO5fScoaAmQrhRAniQL3zjDDmg
        eziJMM5I/5VlbxMEfi4tKHBpYQ==
X-Google-Smtp-Source: AA6agR5MDAoWj07mo8Re6bJHCK/lTI2S9VYB/kjpRf71aZeSVUXPPLyCezVqfrd1Gs3g5Ty8PSMb+A==
X-Received: by 2002:a17:90a:55:b0:1f7:4513:8cac with SMTP id 21-20020a17090a005500b001f745138cacmr9192293pjb.93.1660231781372;
        Thu, 11 Aug 2022 08:29:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w9-20020a1709026f0900b0016f1204cde8sm1985339plk.301.2022.08.11.08.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 08:29:40 -0700 (PDT)
Date:   Thu, 11 Aug 2022 08:29:39 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH] treewide: defconfig: address renamed CONFIG_DEBUG_INFO=y
Message-ID: <202208110829.F82D003490@keescook>
References: <20220811114609.2097335-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220811114609.2097335-1-arnd@kernel.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, Aug 11, 2022 at 01:44:34PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> CONFIG_DEBUG_INFO is now implicitly selected if one picks one of the
> explicit options that could be DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT,
> DEBUG_INFO_DWARF4, DEBUG_INFO_DWARF5.
> 
> This was actually not what I had in mind when I suggested making
> it a 'choice' statement, but it's too late to change again now,
> and the Kconfig logic is more sensible in the new form.
> 
> Change any defconfig file that had CONFIG_DEBUG_INFO enabled
> but did not pick DWARF4 or DWARF5 explicitly to now pick the toolchain
> default.
> 
> Fixes: f9b3cd245784 ("Kconfig.debug: make DEBUG_INFO selectable from a choice")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
