Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75F13534414
	for <lists+linux-alpha@lfdr.de>; Wed, 25 May 2022 21:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344261AbiEYTQT (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 25 May 2022 15:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344419AbiEYTOu (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 25 May 2022 15:14:50 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15819BC6CA
        for <linux-alpha@vger.kernel.org>; Wed, 25 May 2022 12:12:18 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id x11so9831270vkn.11
        for <linux-alpha@vger.kernel.org>; Wed, 25 May 2022 12:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=V3ilouT9genmWgVMdUNI5P/LrIsW5jIirCBfI8vk+4c=;
        b=CpgtaprQbMj1xJ9q/g7AzYVZ3ajo0sXfyksRFo86GZlwM1t0uFaU9QNCOhmB99CXHC
         xCpp/wDjkaGUtQ9QLU/QAmFjUXXF3UuCA51NesoAvjFPB3gK2mgjIjfoN7YzfAH6ctEr
         4Rv2Y9wDp75nayhd1qMWFpvUo3glfC+WHGzPlPY4uQHbWDQuxWYGHPvsjsY/t3dBpqb4
         4NKS2X75DFhboAksfSLkLSimb9be0KMHnKnT/AwTLNodijsnaibDsuUjzhLT5zVbxocf
         19UdmgEEvoPLAMrJ+vToR7Q4R01xgS+V5wk6nAahED0a8iZGmKuwXASe8hQlDc1/xa3x
         Sf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=V3ilouT9genmWgVMdUNI5P/LrIsW5jIirCBfI8vk+4c=;
        b=1oinSsfi6s4Aapypji88oFuJahUbeZHAlcQrddeO8qcNns7l5aceVDn8e4/tTNAjpC
         JZXkfNzWGQaQH2RFfaYLifXrKSTVpFgornb++OczJBGFk2tD27GOn9Tz9NoHfSGkDrLD
         VUUYY3c6YVzU/6A3lfW360xK7APTaSc344TES3qdrrdO8KEZsd/YMXxDIS/2Gs1TArmb
         N71dkUm2utWhFbVr3ha/I4cCr51FESw1Uo9lRTiSIohNkmghJaT3j6+0wQArElH8AUdI
         rPMxlfOr4SRfWte2PDeLdey78Iz2GCMArI3/ywxPVErdgIAwqU3EaTEzCDim9pNKrypr
         5Z3A==
X-Gm-Message-State: AOAM530vGAC3AEErWOz/Vtl62ZItsS03orUnEkL72SBI4sfz5I3Newzm
        QpoFmDxcqxdCV7eQiQ3j5pEBYxxGN/EfRyjFIRA=
X-Google-Smtp-Source: ABdhPJwolyS+hRM1IVpDd+xLKypZetZvkHEhi/Yyto/eEktF6Jru2YaAJdjXnicvGHQPXwRjQs1Zauc5hSMfr4CTauY=
X-Received: by 2002:a1f:a6cc:0:b0:357:45e4:153e with SMTP id
 p195-20020a1fa6cc000000b0035745e4153emr11120692vke.40.1653505937225; Wed, 25
 May 2022 12:12:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:d484:0:b0:2bc:cae4:6d22 with HTTP; Wed, 25 May 2022
 12:12:16 -0700 (PDT)
From:   Rolf Benra <olfbenra@gmail.com>
Date:   Wed, 25 May 2022 21:12:16 +0200
Message-ID: <CA+z==VuEaDqsXYibV8QYJSk6M-LX4AG7Y_LznZBXwFqNnQcaOA@mail.gmail.com>
Subject: Bitte kontaktaufnahme Erforderlich !!! Please Contact Required !!!
To:     contact@firstdiamondbk.com
Cc:     info@firstdiamondbk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Guten Tag,

Ich habe mich nur gefragt, ob Sie meine vorherige E-Mail bekommen

haben ?

Ich habe versucht, Sie per E-Mail zu erreichen.

Kommen Sie bitte schnell zu mir zur=C3=BCck, es ist sehr wichtig.

Danke

Rolf Benra

olfbenra@gmail.com







----------------------------------




Good Afternoon,

I was just wondering if you got my Previous E-mail
have ?

I tried to reach you by E-mail.

Please come back to me quickly, it is very Important.

Thanks

Rolf Benra

olfbenra@gmail.com
