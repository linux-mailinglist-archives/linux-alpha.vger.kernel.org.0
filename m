Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE3786C02D7
	for <lists+linux-alpha@lfdr.de>; Sun, 19 Mar 2023 16:35:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjCSPf3 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 19 Mar 2023 11:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjCSPf3 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sun, 19 Mar 2023 11:35:29 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3DC1B30B
        for <linux-alpha@vger.kernel.org>; Sun, 19 Mar 2023 08:35:28 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id q30so47398oiw.13
        for <linux-alpha@vger.kernel.org>; Sun, 19 Mar 2023 08:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679240127;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZeK4ZJ1o6tGrUVsDjmi+mms9O6S9hGyBZoeD/hC1EM=;
        b=j4m5CG6k+h5y3qxrTasxpJ5cA6wjHZ3sJ76jyzJRFW/oe6XG3/1OA5Q1e96qCfB4r2
         IVS59kinzlxfCa6amSL/yeALWjaVikzEaBT6DXCy/ualJ7wlATTzKmzAOXa3zQvP2ZJ4
         itwG7NwOx2OCgzJEYy0ZcNbOuvI9mKzGx4FP2z5IKJ/WH6x2vt720g7m2B+e59LMrEBi
         mjpzxuPRM0GOH1ngYKJotLC9yJtQAVmsdtQF8ufmyy7KyRnWMDURzRIW55fSq82DsGYO
         nHFaBmb8bptfXS+duoPADamNmeerbyxfk08d5Jr91pW+tQrbwlgivhwWqSPRoM2/VG9s
         QB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679240127;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZeK4ZJ1o6tGrUVsDjmi+mms9O6S9hGyBZoeD/hC1EM=;
        b=A1zGDoF1fYHBtnUIp1M2FQmpXCB7207KjBn72JtwY05w3XffqgCxnSoKWidOUeMR5j
         2F5Ee9ZYaNIAK4ggqH8N72bveCZG2MUihidwFm8EaCSXfonceM86+mFJ5EUDTrvqEtZ5
         7Nz4pVQqzYOBSrW/PrS7Tss8aWIczmrHhQBkWNBD7sX53XZ9QI4GBnhoNG1PuvVy7PWj
         9dZFUMDrM9AhNK2NikNC6/i/jBMsoqf+lr2DXJjhrtPvX/i7rqQsL6Nin/OOAj5mptSR
         /YG1iRuaxsIhFI23fWVzuLqY1lVor11nYgH2tm+2dICP4YPsQ9YBdX03LCBLqR3c4cXV
         fjgQ==
X-Gm-Message-State: AO0yUKW4kCRNNTJCtTTYXiozRDxPl5RcWKx23ivNGD0du1r0K4Q2uut+
        sQhZkAw3UxXT/dBKXBlmGHMTZ5HH+geLkGQKUTM=
X-Google-Smtp-Source: AK7set9kpyp35DFfsAz7KJvVBxe5vr5TUIwsRpMZUK2GuNpFOYUYhAiqx2KVwUc65xwKiRvyPb4KHpsnmwytjAN+ksA=
X-Received: by 2002:a05:6808:298c:b0:384:1f7c:b1f3 with SMTP id
 ex12-20020a056808298c00b003841f7cb1f3mr4403681oib.6.1679240127578; Sun, 19
 Mar 2023 08:35:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:9ac7:b0:104:5efc:1f4 with HTTP; Sun, 19 Mar 2023
 08:35:27 -0700 (PDT)
Reply-To: fiona.hill.2023@outlook.com
From:   Fion Hill <youngm8819@gmail.com>
Date:   Sun, 19 Mar 2023 08:35:27 -0700
Message-ID: <CAKE2LTYkFrTx0jTB6HScsbbjd4CVdYcS6yXtdAk_fGL0XAoWMA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:235 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5683]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [youngm8819[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [youngm8819[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [fiona.hill.2023[at]outlook.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

-- 
Hello friend did you receive my message i send to you? please get back to me
