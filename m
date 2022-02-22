Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71A264BF3AF
	for <lists+linux-alpha@lfdr.de>; Tue, 22 Feb 2022 09:32:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbiBVIcb (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 22 Feb 2022 03:32:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiBVIcb (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 22 Feb 2022 03:32:31 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E759AD93
        for <linux-alpha@vger.kernel.org>; Tue, 22 Feb 2022 00:32:06 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id n18-20020a05600c4f9200b003806ce86c6dso1132691wmq.5
        for <linux-alpha@vger.kernel.org>; Tue, 22 Feb 2022 00:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=FyG0ATSkb5fmrso4VuDc0KiEUJrvvMWML2pstdAYUxY=;
        b=HAjZVKOnZkpB4mw3AFjbxe8eRaam8+JCyPqGX3k7caS1d3Fs/kcfR5NTBfjVbm5viz
         qANm3F3C+jvmNkDP8VFBjDQuv+lcexBh9tP/MlpCHtKh2arqhvzqD7iLGTfqHQwvYSR9
         qhGG13GUCeaTPC25/TpcBba9F7JQ9qosz2KNqugrFlyfOgPUYAt7sfwVI29saQqBqy0N
         gHgevYOL+POiKvW8jEJRTOelY/jpcDp3+tmspFXOwrVQP+IxjS9ejckdqwEVXs7x/2hs
         dFd+vgM1V2PmbSS7EoH+vk5hOAgPf0pxyq37+j+b6Q/kAjYLp0e4sKeG6/oDzJe1xuMU
         ZvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=FyG0ATSkb5fmrso4VuDc0KiEUJrvvMWML2pstdAYUxY=;
        b=Noevv1sNWl/LqF3dv4VER4SCSw9nBwvikF5lqf0T7vSIVH3g5lF7Vw7aQn6hQgCGf8
         uHx7FBQwaNCCEoL0eMN18wpWlp2BFqup7U5zx75AU7bdDfWiX2Wgl/C+CmpZia9W5W1l
         C5LJ6ePiVkVFFYoyzLPN/+V6u9lAOBbozGXNfLHrxiDvDmvNdUSFQdQj3Fah5jLACnMF
         bbob3ZtgAurfDZtvaAgAq1i8AxX1iDxj52dfqa27uilNmld/HFkF2yH0ogYnki/U7xLW
         XgwKx+L+2TEIEIVFdtesOn+WJHGLzGEUBhE8E46KD/eEveM3xyAJYKYpWeIh0ZmbrOQC
         YKKw==
X-Gm-Message-State: AOAM531OgJDpdV6auIgSvY1XdIejtPLPsSQuyWFoe8VvzjEqb5JT922M
        jLPXaYpDuRsRQHJZEQEuKkusbTn+tyad8ht+
X-Google-Smtp-Source: ABdhPJwMu5knnGi1BG5v0QV4leQ6nnDtmXThIGi30uAAI4WE9DuS6eDs3ivy6FlKjWQOv9NUDF4skA==
X-Received: by 2002:a1c:4d0e:0:b0:37c:b85:5404 with SMTP id o14-20020a1c4d0e000000b0037c0b855404mr2248226wmh.184.1645518725063;
        Tue, 22 Feb 2022 00:32:05 -0800 (PST)
Received: from [192.168.0.133] ([5.193.8.34])
        by smtp.gmail.com with ESMTPSA id z17sm1683969wmf.11.2022.02.22.00.32.00
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Feb 2022 00:32:04 -0800 (PST)
Message-ID: <62149f84.1c69fb81.cad6f.58e1@mx.google.com>
From:   Mrs Maria Elisabeth Schaeffler <briankevin154@gmail.com>
X-Google-Original-From: Mrs Maria Elisabeth Schaeffler
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Spende
To:     Recipients <Mrs@vger.kernel.org>
Date:   Tue, 22 Feb 2022 12:31:56 +0400
Reply-To: mariaeisaeth001@gmail.com
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,TO_MALFORMED,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hallo,

Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Wirtschaftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen zu geben
der Rest von 25% geht dieses Jahr 2021 an Einzelpersonen. Ich habe mich ent=
schlossen, Ihnen 1.500.000,00 Euro zu spenden. Wenn Sie an meiner Spende in=
teressiert sind, kontaktieren Sie mich f=FCr weitere Informationen.

Sie k=F6nnen auch =FCber den untenstehenden Link mehr =FCber mich lesen


https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Sch=F6ne Gr=FC=DFe
Gesch=E4ftsf=FChrer Wipro Limited
Maria-Elisabeth_Schaeffler
Email: mariaeisaeth001@gmail.com=20
