Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 267B94E5A2A
	for <lists+linux-alpha@lfdr.de>; Wed, 23 Mar 2022 21:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344798AbiCWUwS (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 23 Mar 2022 16:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240768AbiCWUwR (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 23 Mar 2022 16:52:17 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8FB8710ED
        for <linux-alpha@vger.kernel.org>; Wed, 23 Mar 2022 13:50:46 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u3so3603592ljd.0
        for <linux-alpha@vger.kernel.org>; Wed, 23 Mar 2022 13:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=sfxo1dqqTrr7e28OuTBjrwUEPnrevaNVUdgTMF56Ktk=;
        b=Ad/xRyiaI89GbX+wXTngBd3h0g7Sz/smuTwRZ1ZeHjOkX1yokX5se9eeKeKv1KCqDL
         HYnAAYi6NZU+Z+0pASmwRGqwueORvjNfZimFn4z2k+dq4O/aKeBAahsc7IqfVEyD1wC1
         odmUHBx+6EcAPEhu13E7AB3GS/3vblnTFzb+IUwMrx1GagQ9YlejP/RfM6M7mc14f0hP
         5yKlkzZh3hNl7+0O2j8McDSfjjqurB83x98zOSGYvAiPPIIjtVz8i4BMPQixz315zn3X
         JZPBLA9WvGrpQYjIK8kwpod8tu+DXDwNH14Nz4X+2CMyr78YA0ioAWv7PZEGYGbmw4F4
         YxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=sfxo1dqqTrr7e28OuTBjrwUEPnrevaNVUdgTMF56Ktk=;
        b=Z0o8jwLu/Agb6DeSjUhEb2gHNvAoJ5E0dorpbnA9/H0BKKp028Rk0zJVfzCcY8DRNU
         7Vhe/qzXoznzsY2muf5Qyc4kPiUhjlPjilDgaP0eMi0oq8EqdzwAGD8IuRs1/IV9t08T
         l6yfZ35yYp5ymYf/vceVXWRURwog8zxsQCHRYDzoSpvpQLP69MbrkiLML+oqBZ3Tx9bc
         MQ2Gn9n/VexkqhyZVxuhhF8edEUH4XplvK/tjkhfbfhcJgbnjyXxmrRvKr+ATkJ5cJys
         5jTLOag/Xe0kQrF2MgAZDC895pkaxWiX0QfqbbGgNBeMS8osgmnXe4QGabyH49nSCAPW
         3QSw==
X-Gm-Message-State: AOAM532dkEZwKy1t2TA1lMwf3sELsoXtCI1rSG9IYM7ow7Tm1xuPiQxf
        c4sNT5eKeTcDiDnZyS7rWe8y1g2Ea7GRBA==
X-Google-Smtp-Source: ABdhPJzywlot0Iw+kvZCQ7XXbCunpH736l231c/De7TABgQh16ZZSXbj38pFMnwtcNNYe+MKdC4zFg==
X-Received: by 2002:a05:6000:18cd:b0:203:e960:d775 with SMTP id w13-20020a05600018cd00b00203e960d775mr1363147wrq.226.1648062895766;
        Wed, 23 Mar 2022 12:14:55 -0700 (PDT)
Received: from [192.168.0.101] ([105.112.40.167])
        by smtp.gmail.com with ESMTPSA id v8-20020a1cf708000000b0034d7b5f2da0sm550908wmh.33.2022.03.23.12.14.51
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2022 12:14:55 -0700 (PDT)
Message-ID: <623b71af.1c69fb81.c57ef.2b23@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: meine Spende
To:     hashimusabo3052@gmail.com
From:   hashimusabo3052@gmail.com
Date:   Wed, 23 Mar 2022 12:14:46 -0700
Reply-To: mariaelisabethschaeffler70@gmail.com
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

 Hallo,

 =


Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Gesch=E4ftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen, den Rest von 25% in diesem J=
ahr 2021 an Einzelpersonen zu verschenken. Ich habe beschlossen, Ihnen 1.50=
0.000,00 Euro zu spenden. Wenn Sie an meiner Spende interessiert sind, kont=
aktieren Sie mich f=FCr weitere Informationen.


Sie k=F6nnen auch mehr =FCber mich =FCber den unten stehenden Link lesen

https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Sch=F6ne Gr=FC=DFe

Gesch=E4ftsf=FChrer Wipro Limited

Maria Elisabeth Schaeffler

E-Mail: mariaelisabethschaeffler70@gmail.com
