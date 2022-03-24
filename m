Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF9AB4E60DF
	for <lists+linux-alpha@lfdr.de>; Thu, 24 Mar 2022 10:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349137AbiCXJK3 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 24 Mar 2022 05:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349131AbiCXJKZ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 24 Mar 2022 05:10:25 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68F81D0E2
        for <linux-alpha@vger.kernel.org>; Thu, 24 Mar 2022 02:08:51 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id r64-20020a1c4443000000b0038ccb70e239so149721wma.3
        for <linux-alpha@vger.kernel.org>; Thu, 24 Mar 2022 02:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=sfxo1dqqTrr7e28OuTBjrwUEPnrevaNVUdgTMF56Ktk=;
        b=bFSwGGBeqZMmjxx165RNcAYYRo49Jx27gdpJ8VRcZ9NWWh9xf0SDsbsQmovOKoOd6X
         ZoZWladiDLyi2E+GIYB3AMD1+I277ksHOiW66wXWd5g2MYhl2mUS29KBuI2kbpIXKaEz
         tsVxdF1r9/9RT3zp0cTA0uz/PYUPPNCtlmcpfu+HmsjOoZwGhDzncMjdU+E5EnNxYgC+
         qjgt3OqgZBs1S5EbjzHqoBT6vMl7wXoxUdQADmNwoihSbq6rv5KcCKhcuXW2xvuWAHe3
         DQSgE6rmy/DROrqkJA/FedNznpmhPsChMZrZu62/5tPb5801Z3NtSOpBXdWat0hfkNYM
         XVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=sfxo1dqqTrr7e28OuTBjrwUEPnrevaNVUdgTMF56Ktk=;
        b=50fAYlVAmdofp7dNfMzPTIbjK0USOZyDhhCxxaQNazJ9Xn7eKTMFONid00nmj6Z5fG
         GwOz8DHC/MX47troKYLFr6S5pScPjLe/HKamvN+xmosKdsPe1w72ObHEN3yFG7Y63X0m
         s62cQo3V0jrpzA9UwBceBrPqPU4c5nZopT2dHFulJmp0HLrugdycgIJap+1jMohevj7c
         Qoo/a2sdw0BtgNc4zM9GXo9TI4ssTwXeAnDbF7txVkonJWeYyF24FI1GX/Bp0pFkHxrl
         jo/iiyLfJiuaYfrCTXY6s9nYhzYgEgxLryX7jR0VRgBHgzMaA/ArVZlqK+7SmhZKtJ9k
         ibYg==
X-Gm-Message-State: AOAM533nN9ZJ4+WZFv8DDMhQzmkyOJ4PcX3KHA5ZYi09nFKQpvrubHfW
        g77xDoG81YfXakqtH4zjJch5VXtjs98UfcJ5
X-Google-Smtp-Source: ABdhPJwCMdl5b2yiKMb99uitE7toWh99pOZEiHhMlOZcE44McVq+fLMugSrDpIoauryCoYuV4CzDoQ==
X-Received: by 2002:a05:600c:3588:b0:38c:6d7f:6fd8 with SMTP id p8-20020a05600c358800b0038c6d7f6fd8mr3380336wmq.25.1648106426480;
        Thu, 24 Mar 2022 00:20:26 -0700 (PDT)
Received: from [192.168.0.101] ([105.112.209.185])
        by smtp.gmail.com with ESMTPSA id e10-20020a056000178a00b0020414f27a58sm1910099wrg.35.2022.03.24.00.20.22
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2022 00:20:26 -0700 (PDT)
Message-ID: <623c1bba.1c69fb81.9a6f0.7e6f@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: meine Spende
To:     ihemadusantus@gmail.com
From:   ihemadusantus@gmail.com
Date:   Thu, 24 Mar 2022 00:20:16 -0700
Reply-To: mariaelisabethschaeffler70@gmail.com
X-Spam-Status: No, score=1.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
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
