Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE08621834
	for <lists+linux-alpha@lfdr.de>; Tue,  8 Nov 2022 16:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbiKHP1o (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 8 Nov 2022 10:27:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231815AbiKHP1n (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Tue, 8 Nov 2022 10:27:43 -0500
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE231528B9
        for <linux-alpha@vger.kernel.org>; Tue,  8 Nov 2022 07:27:42 -0800 (PST)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-12c8312131fso16598273fac.4
        for <linux-alpha@vger.kernel.org>; Tue, 08 Nov 2022 07:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=dIyZf3dThsxIsg+semC7/AGuKbizxfPGl1TQJ+Nxq30NcH+8UxV4a39IPScCYPstej
         yn8+1Hrpez1eMPGPfu0oaNGoRWe7s7bdZqHfjqwaDvXVdz4W2qaHAOoSo2MiZfSI3Y2m
         R65Qsjtq4kVXUVVdmhCDwEvnhECjVcP4rW38BC1V87ug855FadAwh7q+Kt0GdMKYEn51
         kPax10gi+/P424e3cPciOYc5kB6feeUFkaNtwdNbiBn7Ku9eT1fBYRvtqK2kcp7kTMLS
         C8ZZRd1tO1kvUOb4jZEFErjmjXJN97o8II38DDsgM1EXpXdIs+yl2rYBvZBl6BZPyB7k
         Vb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=R5HmDKaqyenqeRDs32mVMvAOnwxRkPQ8MTGN5biu3vXmFrtUm3OW0LXPeTZVq1dOjL
         weN3gVvwfVLWptTJXW+UL5Ic6jr509muSjxvqA+lpAmTb1I1SVd5ZjcX75L7AchsX6lK
         a4pp15tJY36Oq9OqnwioBi+241THJ4yJCMtZTnQQMqC5I2YpIpnV5DXVmDunmDR5mb+p
         rvWQcH1ysGVSDW2AcapbkWk2y3xNiee9iRajO11JShUJ61EdIzM+gF3XRm9ZDS4tuMyQ
         pZ+qAE4wypmAqSo5fo1YivOO2OBVJtneoFx/Oo5tExAXs9q/zNAvyr6ua8VtEo87eUwS
         puJw==
X-Gm-Message-State: ACrzQf0Se4/0T9DcsRplBVDENAn91bmGUopfhsRsMPhpb+6IAaluA/Sr
        UCCvTgwdClAUDFdWt5gP1m4p92NkY73eVEuz5uQ=
X-Google-Smtp-Source: AMsMyM5PlHPjzghdmVcu1xLAdsc3KX0qSgnZT92T7h+x0QOTT4AsU4xI0HURjFHudav1+MqIaDugMH+IXGamDDEK0fc=
X-Received: by 2002:a05:6871:152:b0:13c:c1a9:e96e with SMTP id
 z18-20020a056871015200b0013cc1a9e96emr30811115oab.258.1667921261690; Tue, 08
 Nov 2022 07:27:41 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6808:2029:0:0:0:0 with HTTP; Tue, 8 Nov 2022 07:27:40
 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <joykekeli4@gmail.com>
Date:   Tue, 8 Nov 2022 15:27:40 +0000
Message-ID: <CAO4V9UEtmsW+f2aSrznRJrKe4Lo78znxd-V_JB5S6UGwwsCFOg@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:2a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4982]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [joykekeli4[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [joykekeli4[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
