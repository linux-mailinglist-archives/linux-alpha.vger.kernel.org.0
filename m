Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAA0E620E66
	for <lists+linux-alpha@lfdr.de>; Tue,  8 Nov 2022 12:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233544AbiKHLRM (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 8 Nov 2022 06:17:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232929AbiKHLRL (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Tue, 8 Nov 2022 06:17:11 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA5617422
        for <linux-alpha@vger.kernel.org>; Tue,  8 Nov 2022 03:17:10 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id z3so11175370iof.3
        for <linux-alpha@vger.kernel.org>; Tue, 08 Nov 2022 03:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1oIX0Lu3jFWZXVxNPQntM2Fj3qbMNn8z1UsbYrWkRo=;
        b=qnp3RA68RZxCw5btATTL5aENMTU8PNXTCv5o4kDRrA62Bbt5yl4kTLVwk7CUUr8dOo
         TcaHp/AVoMBrImccCYamHrcb+E9wr0QenGSKMIo61YpYUcPiOR1K612kZ/SfahFuZo3r
         oIah0+DlKAlQ2C4s8KRDkKQaDi7IAPJl9EQ7Y98dCYsd/1ot/b+0El45x31aLUxIR+p2
         iDj+RjGp73CQS2da8CeIXaHxd/pV8N3BRod6mb/evRkp7EEIanndKTfVJg59d3S00WvV
         g7x7ZgVVMQdLlUXJ3CwTh3JWhJ6S7GXLF8/SBbPaWGGSj+k9wlwUiDIbwqH86uTGWYgA
         h+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1oIX0Lu3jFWZXVxNPQntM2Fj3qbMNn8z1UsbYrWkRo=;
        b=q+v6hJrtUfDYaghc9h6/tPVKb60UjAmclFqQYDWOrT8+BkRdPGrbcNbjKHMoHK0Pot
         YDL7rj71bsMi5oi2o2LCjWSO8OxVRQd7m0UOBRuFWGd/LGB0dhMTJtAjggqMm06D2AB5
         EzgdVia+YX7Hka9psaDRyOxuelZbb8OkTG6eiVyOAW6IFut+8SqDt5rYp/LlhhnYcSZg
         G/6NpmGoO04uPM+5PUoR8JB3uBi0uWSdtukuNQQDkRDcGmUNCmgsUJc85qJ0knlhvHjT
         GKCEVpM/ETUKr5j7/fKKT+O1ClvRzR6xz0JWJomCjObldWaMWRXWksnTMiCCmD4OpkPl
         fzEQ==
X-Gm-Message-State: ACrzQf0r0drpbB/lZmpo4cl84eyE+vKp4ya6Z9jd2jp3xyKx7BuDxIH+
        aoYz8fPX/JI//30Ohs7dZqX3zSdJMj5VeEfwnqU=
X-Google-Smtp-Source: AMsMyM5r8ekKagMrW1PAI5KSzctgVpV/fuu8hrx/9+x+Kz5jTB49U/sAShQsvI/SfEz9WYzspfxZhNyZLxiyB45v06c=
X-Received: by 2002:a05:6638:d84:b0:373:2ad5:232d with SMTP id
 l4-20020a0566380d8400b003732ad5232dmr32554867jaj.251.1667906229535; Tue, 08
 Nov 2022 03:17:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6638:38a9:b0:375:4a9b:180d with HTTP; Tue, 8 Nov 2022
 03:17:09 -0800 (PST)
Reply-To: mrinvest1010@gmail.com
From:   "K. A. Mr. Kairi" <ctocik1@gmail.com>
Date:   Tue, 8 Nov 2022 03:17:09 -0800
Message-ID: <CAKfr4JW=qKGoLBZyC_VTMMC4tQjgH=zf1DyPFu7BgT9Jc-c_Ww@mail.gmail.com>
Subject: Re: My Response..
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d2c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5056]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrinvest1010[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ctocik1[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ctocik1[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
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
Dear

How are you with your family, I have a serious client, whom will be
interested to invest in your country, I got your Details through the
Investment Network and world Global Business directory.

Let me know, If you are interested for more details.....

Regards,
Andrew
