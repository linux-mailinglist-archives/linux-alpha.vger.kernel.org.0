Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 190C862178C
	for <lists+linux-alpha@lfdr.de>; Tue,  8 Nov 2022 15:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233877AbiKHO6O (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 8 Nov 2022 09:58:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233727AbiKHO6N (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Tue, 8 Nov 2022 09:58:13 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE97CE1B
        for <linux-alpha@vger.kernel.org>; Tue,  8 Nov 2022 06:58:13 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id m22so2083767eji.10
        for <linux-alpha@vger.kernel.org>; Tue, 08 Nov 2022 06:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=BqeZVk2okD70BbGW7OFgrxfcEv0tyUQYcfE1KmPlYlTIDxSjT+9gmnyKw4bdI0uJ9Z
         tVi8Gy7LyxaaT620lQm6YGTEGWLnoI46/Ris8Jxa4qDjAeKHgl8jM9tE9B2gGluFhmUN
         HGLM2aki4rSG+VnS8VOESkW+fxgw3g0t5Vcy/tmemgJcozwOqBpgRzWdfcHeOSxtvpNP
         Jhae7DwQrxOkzeRYHu2KVBGYUkd+ADNF61eH+hzJpxG4xiqkryfMrK8fJW4DmddLXuGQ
         nY7zXKmt/g4yk8iBtnJNETzxXHNZn2Pf00GNvoLlsEovYsvjUX2N/1dIM8JV9MZS0U1u
         iM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=ksWH1YCTD6acg+c07Mewos0Gl0H4vwD8z1ozDh1KOsZSY8tv2SJ80r3vre7Eh5zHo6
         E/74XxD3Fzivg5CsBAHNZmDNKp+PkpWGe+uQAN2fv5RpTTOxryt66tedPMkperoTO/7O
         195CdyfRjG1NDwx7kF7EJ+xTrPrwp92vuXaWl/wISdYGrwxdo5gHrRPJh5nJUKsxGGCK
         qt8pp+rbQ6Pvp31aQBPm0+U1wEZPGTuZIE6MyI7NqSIxl8nq57MMEszzPPzr2XAN4xYD
         WvYukx7yy0bdfzQJ+02iD0w46CKPhkbQlUfETuivwrHlqnrHku+MTvf3nIbGIyNHyvnV
         H2Nw==
X-Gm-Message-State: ACrzQf0gQPf2vu0hqP6ac/gdMVyscVFXUrXyL93qCvcEXJsRAqV0XRbF
        pMMUJqlTh1YlFwRpVzQh7zg4nZv1RfTu2CzXm5k=
X-Google-Smtp-Source: AMsMyM7mh/B0eJ7TIpP0zpf1Jw6tnUaCUVpgpOzGW2KM+0ZWr0ZucpkBAIetJk8w/mem4/olO838WX8w7mepXSYXysg=
X-Received: by 2002:a17:906:9bc8:b0:7ad:7e6a:50ac with SMTP id
 de8-20020a1709069bc800b007ad7e6a50acmr54893410ejc.66.1667919491551; Tue, 08
 Nov 2022 06:58:11 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a55:d68d:0:b0:1be:d0eb:76e2 with HTTP; Tue, 8 Nov 2022
 06:58:10 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <joykekeli3@gmail.com>
Date:   Tue, 8 Nov 2022 14:58:10 +0000
Message-ID: <CAKaeHTcSTvWSiwGfS5d0smriod=8VAL2Zrhm0z5=qpmC6Ui+MA@mail.gmail.com>
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
        *      [2a00:1450:4864:20:0:0:0:62d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4851]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [joykekeli3[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [joykekeli3[at]gmail.com]
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
