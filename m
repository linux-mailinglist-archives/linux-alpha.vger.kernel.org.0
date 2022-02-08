Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1E654AD3DD
	for <lists+linux-alpha@lfdr.de>; Tue,  8 Feb 2022 09:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351081AbiBHIoc (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 8 Feb 2022 03:44:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352004AbiBHIoC (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Tue, 8 Feb 2022 03:44:02 -0500
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0821FC03FEF8
        for <linux-alpha@vger.kernel.org>; Tue,  8 Feb 2022 00:44:01 -0800 (PST)
Received: by mail-ua1-x943.google.com with SMTP id e17so24626851uad.9
        for <linux-alpha@vger.kernel.org>; Tue, 08 Feb 2022 00:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=edeevZ54MxyNr2ONaDsC9jI+UtdZjrCL/LCuSFC70Ao=;
        b=qzcA3K52de9EhxIhzDkkmYbbQbKaihztEhpxunYq2GbraMA2FahupsNjdrEQdl+2Xo
         x8jS+FGEUTCMk4tDTYOrkEiAnHXAkXcvH7RvY2aCKbp+IjLQ3Bp7h8T/UGTTv6cbvQJx
         UDaJ+EExkU2Hp+cSSYRA9eBK9kaPiYVEdlhpEIKA2WBzvL9GDh4CBhV+D7H2jS5hbt2m
         8LtLW4gnxvDWL+oX1Mu+PuIaS25Xny7KZOl+qnwzrY5EU6w8EDQE49bsI3Zvp3xnEqz9
         DCUxVi2bJ97Z5XO1ifHRoy2QV3wbBOmeBX5qA9XMxLaJLZCuYBlb/QVcJLQKQ1TiYL1W
         HBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=edeevZ54MxyNr2ONaDsC9jI+UtdZjrCL/LCuSFC70Ao=;
        b=HQL+nB8AJD5H3iL++4ZiC0qeXZgA0DJTdsOM2Pr0I7LEaVoiRagicHbtvxj4MJdLUG
         iCg9gjuCxpIAn6sv9JKkBtO0g98i+zUbgrnKIGu725t5C97FlwkzEohSrunhHM9lgHJB
         SlDp+qRNb2njOq1J3FM8/21jeQ2fela+uNZfGd8ZI9zvlpFyVDg9uFGDNtsK5xf215uI
         KAshowjGHZ4RCoODysLcfc3vXRGRtc2RvmSl1JFrCQUPL9qFIa7CgOU/L24xuUUdfRU/
         QDQhxO/FNEDj4ohaHbcDTnesnK7Jq8cEBx9Ap85fF9JcglhVou+SvOqZIdn/KGFN87Zu
         A2Vg==
X-Gm-Message-State: AOAM530BEKQrA2Zg6XsxRyDMkl2YbE/V6f0pWoyKtQrqHOU61uaoC1Hh
        RXM7QagWLQQu/PFeZWrqXT650WaQAO9FlxlKXzk=
X-Google-Smtp-Source: ABdhPJwabOZCYr3WB5MAVlhPccZ8TF1Tp/Jgj7lvaHsfCshVug2Z/NGcswi/yGz08altCfIkGJhgE6VUV2eXkpdV8Qk=
X-Received: by 2002:ab0:72c2:: with SMTP id g2mr1148800uap.15.1644309840067;
 Tue, 08 Feb 2022 00:44:00 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab0:2bc5:0:0:0:0:0 with HTTP; Tue, 8 Feb 2022 00:43:59 -0800 (PST)
Reply-To: saeedmohammedsaeed085@gmail.com
From:   Mohammed Saeed <nzubewwwww@gmail.com>
Date:   Tue, 8 Feb 2022 11:43:59 +0300
Message-ID: <CAMj4HvQnWsfFGFOGV12hnhn1-7ggyDY5TkaLTvG3KD73KTrShQ@mail.gmail.com>
Subject: Proposal
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:943 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  1.0 HK_RANDOM_ENVFROM Envelope sender username looks random
        *  0.6 HK_RANDOM_FROM From username looks random
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [nzubewwwww[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [saeedmohammedsaeed085[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Salam alaikum,

I am the investment officer of UAE based investment company who are
ready to fund projects outside UAE, in the form of debt finance. We
grant loan to both Corporate and private entities at a low interest
rate of 2% ROI per annum. The terms are very flexible and
interesting.Kindly revert back if you have projects that needs funding
for further discussion and negotiation.

Thanks

investment officer
