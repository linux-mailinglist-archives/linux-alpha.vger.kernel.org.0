Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE4F77D6C1
	for <lists+linux-alpha@lfdr.de>; Wed, 16 Aug 2023 01:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240694AbjHOXoh (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 15 Aug 2023 19:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240697AbjHOXoW (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 15 Aug 2023 19:44:22 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AAF81B5
        for <linux-alpha@vger.kernel.org>; Tue, 15 Aug 2023 16:44:21 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6887480109bso691875b3a.0
        for <linux-alpha@vger.kernel.org>; Tue, 15 Aug 2023 16:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692143061; x=1692747861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vG5YLVC3eDKirzY40GTGyFbIQV7NMpfOOW8qjICzL9g=;
        b=oBXtosF0pp2dlR76dRPteSznb7v90y3c6+QKAWDhL0B6LTQLODDst9tl3HBtqXjUA8
         EybyR9mmvR+KQNYPEAvYX8oupycUhhaQu1sCAeF4KwKh7OicB3Mo0FjopdJ0TG+2HhQb
         qyGQY2g3xsuvhVaqH+E/g9x60PXAhkkqYZIEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692143061; x=1692747861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vG5YLVC3eDKirzY40GTGyFbIQV7NMpfOOW8qjICzL9g=;
        b=WMfROhtPvdpoSi/gr4ASGvAEVhq4TMoSpzVm0vQXJgaUe9t5ICtg03vH7HIJ2V7X//
         icoHMcl1GCPyLW7dt+JNQEM8twyaL09C48FPKZwf0+8pDaBAV773XMEik5jvxNIr+lWY
         Qb3X8LfYlavyt1Afzie+qDTR1/d7cYCnYesYGCEMhTCMBHqcXfEGuU6C7+mjfzlWPcuD
         CgDzbVFgVlzuFoSx1kDvUW4njVlNW7HgZU48/B9SIuQowbgBCnw4X5X+d/p+xKi8ZOWH
         Mic26b5+v9je8YJg8rFup7cGpZJ840HVDyuHg/fucx7drQkEsX84RKUsJTPVs7lMHwFF
         xgEA==
X-Gm-Message-State: AOJu0YyhjC4FItM5Rin4s8v28S+SYbnG/l96GQx8Le2iq5MRBYn4mGyG
        IajbsV02+aTxx4WWJ1LcUEPdWg==
X-Google-Smtp-Source: AGHT+IG8Qw+6jUTPGs1F8o/6hKdeLl9A+ocEC7eGLPrbZ6ZXpvHBmVQO4M3yBWHEjJZizziKMOuRSA==
X-Received: by 2002:a05:6a21:61a:b0:12b:fe14:907e with SMTP id ll26-20020a056a21061a00b0012bfe14907emr378877pzb.20.1692143061097;
        Tue, 15 Aug 2023 16:44:21 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s11-20020aa78d4b000000b006878f50d071sm9735097pfe.203.2023.08.15.16.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 16:44:20 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] alpha: Replace one-element array with flexible-array member
Date:   Tue, 15 Aug 2023 16:44:12 -0700
Message-Id: <169214305098.657491.4672688597029199904.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZMpZZBShlLqyD3ax@work>
References: <ZMpZZBShlLqyD3ax@work>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Wed, 02 Aug 2023 07:25:56 -0600, Gustavo A. R. Silva wrote:
> One-element and zero-length arrays are deprecated. So, replace
> one-element array in struct osf_dirent with flexible-array
> member.
> 
> This results in no differences in binary output.
> [...]

Applied to for-next/hardening, thanks!

[1/1] alpha: Replace one-element array with flexible-array member
      https://git.kernel.org/kees/c/967afdf808cf

Take care,

-- 
Kees Cook

