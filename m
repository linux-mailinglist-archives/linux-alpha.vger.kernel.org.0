Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6D056185FF
	for <lists+linux-alpha@lfdr.de>; Thu,  3 Nov 2022 18:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbiKCRQW (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 3 Nov 2022 13:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbiKCRQU (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Thu, 3 Nov 2022 13:16:20 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C61D92
        for <linux-alpha@vger.kernel.org>; Thu,  3 Nov 2022 10:16:20 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id y67so2689866oiy.1
        for <linux-alpha@vger.kernel.org>; Thu, 03 Nov 2022 10:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0VJEofFMv38BHH8O2mAmaQTotsMGoFX1NiiWvy0HEw=;
        b=Crg4+wxluGN5W2+Pbh//aE01f8TxmKIRWxjdt44mWJB4iHX4MF2Jm0NzTmHYKwrhI5
         fdq8jSk2+EHhs+DRietZpLjLw1DvhC/dbaIPW3dHFmUw6QIhQd9sdOfZTlbuFu99tz2K
         2buRhCERNJSsDXQhRshpjRhwmQnHy/DL70uL95t5bj8JMI+wPxJDS/iYh+ShjwWNDsxl
         f6KXPYEUEleCGkEG5E+KIbVnfg01IWKjntM5D/bIQlBHKlzSHHodlq56Nj+kfdcrvL/y
         iPq0DrdghBeZa1XXp3BYbRqpCc/bIgchw379iNUb1nQ/8/ME9Luv0+6G2OQx/+8T7Z3/
         wS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0VJEofFMv38BHH8O2mAmaQTotsMGoFX1NiiWvy0HEw=;
        b=E3jwDRIXaibmnvnDgn8O6Mq5i9sKt2KqHa9/vgFwZoSp47mwo0DhuTeudOiQTx10+2
         Fveugp6LNYX+5NB4vazf5eU6kHP2x2Sr5+Q6amcTQgZTnXOPjyYiaHJdNhhTFE5Q3OAa
         OI/V8tr0Jey+6B1Kah0UwNgTc5+A1ofHaMadJIJNtzcfXVWgGOxW0RJQqWVWBKqt7Nc5
         3+xdbvgsJ23JMBvaIsljSNGkmhb5xLhVg9StjU5aobmUF4HSUyfz/KTuKN92nfNBjOLY
         Dmy65+ykePJ0ivaTthH/loL5Y/mYRyo1pBjWiRth3ydL+gIX2jcqS8vavHUwn5VW7C2o
         2vig==
X-Gm-Message-State: ACrzQf3dsh7UxCt105ERv6IpnLhVDjFbOlET+aRIoLJUZSLiqWg76Vu5
        6k9HYe3K6PtSI9RxCHnAFwqV01UUvQ7vh3SE+Uw=
X-Google-Smtp-Source: AMsMyM5ZOhIEdEUKJy/neHFi1yRU6JqdlgCxvlGZNgu+QuflFO/08ESa0IwPlflPhlBiuVHFG/EcEswQ8NsNY+JYVSQ=
X-Received: by 2002:a05:6808:2023:b0:359:c826:8085 with SMTP id
 q35-20020a056808202300b00359c8268085mr17034943oiw.156.1667495779489; Thu, 03
 Nov 2022 10:16:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:280d:b0:b3:b9ef:da8d with HTTP; Thu, 3 Nov 2022
 10:16:19 -0700 (PDT)
Reply-To: kelvinjones0214@gmail.com
From:   kelvin Jones <wilsomroman911@gmail.com>
Date:   Thu, 3 Nov 2022 17:16:19 +0000
Message-ID: <CA+L5qL13NVU3bTXoSgT8iNRFm20GPwg_zr=8z=tVSa+q=jU4HA@mail.gmail.com>
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
        *      [2607:f8b0:4864:20:0:0:0:229 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5880]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [wilsomroman911[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [kelvinjones0214[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [wilsomroman911[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
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
Dear Friend,

How are you today, I have an important message for you just get back
for more details.

Sincerely,
Mr. Kelvin Jones
