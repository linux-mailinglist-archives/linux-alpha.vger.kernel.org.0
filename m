Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63A6A58758D
	for <lists+linux-alpha@lfdr.de>; Tue,  2 Aug 2022 04:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231565AbiHBCgO (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 1 Aug 2022 22:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbiHBCgN (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Mon, 1 Aug 2022 22:36:13 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A704B41D02
        for <linux-alpha@vger.kernel.org>; Mon,  1 Aug 2022 19:36:11 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-10ea30a098bso10879841fac.8
        for <linux-alpha@vger.kernel.org>; Mon, 01 Aug 2022 19:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=IniFjyVHQ6lWflzIsICmJ5JUtVB9MkE1WWkHF07cmBg=;
        b=iUPOGah4GMsckuIGER49hF42YxliYvMNEuhVH7Yx4cNTaZE+ZoLOIn/RxQ6Dpvqh1N
         zFksZfNvfP+qGPVhKtEwe8Cu7YUfx2XpFIUtJPDBMn8fuqRdvsWWlul7SJjCIZWEyywx
         uTjdydnBADmcpzyfOyXpFVsQ9r3LOgyfPt+dkgazKvAvK63RcYV0+ev7DlqCFBah9UvF
         9z4xtMcUcqmaQShmXYUVl1ScXm8FE+zyPIEJvrzMmUsnbC5mHCxrrbGD6wyQIgm4OmxF
         YoNc1iSsFPfdaL8bYvBcuKMspX2uCYKIfVAG0z8BdwGAJDcr8gVn7hOILzTogt+3nRpM
         NUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=IniFjyVHQ6lWflzIsICmJ5JUtVB9MkE1WWkHF07cmBg=;
        b=DLQvG4+qOuvgVU+BwXc+IPQXH/gD1VfiElK5LOnd4YxWodaeeOj//pMsiZ1bsSocq7
         YgjsiRhciGmk7GhoANausJvfAutzqDXnWJ2mVj6R+csc4HKHLJguNe9cQPhyQlgt+oIy
         OkWFg93nRuTKXKlTm9eyQcdAhbvjcdxlcU2qF48Mtc3MfQuW/W+mBoBogdybEh3gWyEu
         e5T/HOUSFhyYRW+xEnVFn+3NfKq1Gyn/POiH8B6TmHaocR4oFjE7xHYk2MpmAmiJJMO6
         aDkVK7gEvxHWNEV84tgMqmBGAHhTMxUMI0Y6bv8NXGWHux9RYM76x5MiJgXPjFOZVW/h
         gJPQ==
X-Gm-Message-State: AJIora93I4Q+lFSwaQffTqXCPKJELoWtelGl02Kj2II6sD50AFpxfaUT
        SsD6ISZRrFS0Xao4/So1NMf2X9n6KT55tS9+axM=
X-Google-Smtp-Source: AGRyM1vqNe2esg3zmbGAQxcWlL2KBu8TT/uUaV90xSkdIVP6ko8zxTcFkyclcAW0APPuiPDD+EaS8EH9JAQAjdS4VTI=
X-Received: by 2002:a05:6870:f610:b0:10d:fb8f:f06e with SMTP id
 ek16-20020a056870f61000b0010dfb8ff06emr8841180oab.138.1659407771048; Mon, 01
 Aug 2022 19:36:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:5241:b0:af:f1c2:bc3e with HTTP; Mon, 1 Aug 2022
 19:36:10 -0700 (PDT)
Reply-To: usdepartmenttreasury63@gmail.com
From:   "U.S DEPARTMENT TREASURY" <ayanounodo@gmail.com>
Date:   Tue, 2 Aug 2022 02:36:10 +0000
Message-ID: <CAGHdffNJxqyXW3rtSQZyMykvXAKq6R4YLHVL4vx3YN9zOPh5OA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

-- 
Hello,

You have an important message get back to me for more information.

Mr. Marcus Hamlin
Deputy U.S. Department of the Treasury
