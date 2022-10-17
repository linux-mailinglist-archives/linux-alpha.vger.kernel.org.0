Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B537600D4A
	for <lists+linux-alpha@lfdr.de>; Mon, 17 Oct 2022 13:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbiJQLCL (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 17 Oct 2022 07:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbiJQLBh (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 17 Oct 2022 07:01:37 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A4E61138
        for <linux-alpha@vger.kernel.org>; Mon, 17 Oct 2022 04:00:39 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id b2so24027255eja.6
        for <linux-alpha@vger.kernel.org>; Mon, 17 Oct 2022 04:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h6TAvh2KhlPwZbZl975on9cPhNtC4Qh0FGtOTBu2EFs=;
        b=DT8N1zHgLUhSB1amgTlfFh83oizvxuJI1bIsoUxMqxVUs6HsG0Bk31WC7B8BnwOprK
         D6mdVNtCiEnV4TxaF3j3hPCQmnySY0FuitZ4lFHuqDs+/kz0yR8Y/IolCLGy5i1rKQI3
         zIQ9eQ1LxaFe9lvQWiyywxDOPpb+CK+epF6ABZTS+DkW9f5mZh20AcvFA4KMwVps5ZB8
         JXe4Y91AttcyJgHMjZFO7ABKX8twjogHMbgukFek7fDiU2DepYLjOSV/SrNgT2eaKZfc
         BmNVu2eUWCWIP4AT6DQBUh/oyB3Fiw4B2pP72PaHrf82HVgxEmWrD8TF75gUsj5psKlF
         cI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h6TAvh2KhlPwZbZl975on9cPhNtC4Qh0FGtOTBu2EFs=;
        b=TZa3S4Ga8ZmwxU0oB6/npHZIzOXULwNnY2lw/+eY9W2nOpBi0oAQ65ORJuXjG7GwqL
         NBGbt1tx2/bX2FEUg9ThFbQVX2HXIH6LhMqVkeSqBRA6pB2Vf1/VbtyXku8EQqgJ9NxL
         pEcgpL0jLMXQQ4gSyARtr3DsltcaL+Q0AW2TpIa36kJRX6bJbzXfyCPY0dZyaLOiMbhK
         y76abebU8itQYPv7r+uqpyTcSEY7ZApCM+PPNB4GpXCXLSCBj+2cgJXgSOA2OEZeXJgS
         vRJpUpuBg06A1acpYnhdDPoGkgX6Wze8HTk3AWybtAq8xsU+UEz6cowOaNDRHmPO6/aJ
         JxOg==
X-Gm-Message-State: ACrzQf3MS1AnUJ6xjQjcbGWGU8ZuB5EWDPg4kZNESIocsOZfeQqYtrXs
        jC8fQI2VuYtIJ5A7ws/yix9UgPgWEgxTDUUCIDM=
X-Google-Smtp-Source: AMsMyM74yHjVKIntIP82c1RevnU7nAjR2UNpS5Lb2GuXZmne+62tWsGsOvV77WZgR2y3iOGN4qsJp/C78bwdlkN2CtY=
X-Received: by 2002:a17:906:eecb:b0:73c:5bcb:8eb3 with SMTP id
 wu11-20020a170906eecb00b0073c5bcb8eb3mr7860270ejb.284.1666004425820; Mon, 17
 Oct 2022 04:00:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:71a:0:b0:1df:c5cd:1b43 with HTTP; Mon, 17 Oct 2022
 04:00:25 -0700 (PDT)
From:   M Cheickna Toure <metraoretk5@gmail.com>
Date:   Mon, 17 Oct 2022 12:00:25 +0100
Message-ID: <CACw7F=bKmq3FB6uTbtMRGMKD2i_mzwTSayyUxgyDT06qYbcJNw@mail.gmail.com>
Subject: Hello, Good morning
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hello,
Good morning and how are you?
I have an important and favourable information/proposal which might
interest you to know,
let me hear from you to detail you, it's important
Sincerely,
M.Cheickna
tourecheickna@consultant.com
