Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92C7D73F5FB
	for <lists+linux-alpha@lfdr.de>; Tue, 27 Jun 2023 09:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbjF0HsF (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 27 Jun 2023 03:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbjF0HsD (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 27 Jun 2023 03:48:03 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A04710D5
        for <linux-alpha@vger.kernel.org>; Tue, 27 Jun 2023 00:48:02 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso12306145e9.0
        for <linux-alpha@vger.kernel.org>; Tue, 27 Jun 2023 00:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687852081; x=1690444081;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAing+I/WmJBiZyy188CX0BvD6Vd7cHvbUtAkxFC1zs=;
        b=X7786zu8s9EeTeFEbeAKnWT9qI4QxpBHm/jovB9lKkpmvGWsImlOHgSlsmRunqVS6U
         WuHaDDNTKJ8QBu/wBqAE+XksvgHJPZVMk0QlDFYOS4OOwcqZrozQTDmLDeCPY24PEb45
         Ne4ed+Ial79LjeZNCreOX2Q3HE6gnWHSjVUZYqog/eOjbhwNbehytxXtFm1KD24N5UXU
         U6J+eeKEJMgQPscmd8vYZ42y8Rdu/zNEdcnYgMbFjWxO3JDsq5dZ6kpwJmXja2OscYch
         /b4xrkHgso3CRg7/yJdGJq8NPS/4SHZx+S1pAaUtaQnfsJaqWlRzl1aW8cBKIFH4DIeQ
         T19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687852081; x=1690444081;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vAing+I/WmJBiZyy188CX0BvD6Vd7cHvbUtAkxFC1zs=;
        b=OeEbfFgYzo1T15yMy612sw51mEDiKS/VKNwiMca8/Cztreluxd6Jpm8rP1XZ+GNLTn
         IpRPFhmtbM0AxhvEzVR2uEgbdRC4Q3vHVwccoeUpdT3bY9DtN0Q7uwCMBGGRXpAvmFrH
         jQY9EdQ2HSLRJD/modps9d3tUUOlLRUAMVLKm6ozCymiAgB1p1CiXfpB9tc3CvdpKjbU
         NtsrMdVf4wNckpJoNYMB0PeGY9W+3amuUXDoAs4clGTDvJ5Zfl/yk7xPtKSNVchzJuQp
         BqCFqOIdWqqh77S4b3BoiUrZDWcwjBxlyntZmTkP/jEiH7Z1kA18fJ39wQtm63VY5vi2
         ekZw==
X-Gm-Message-State: AC+VfDyBDZEy7B+j4DJl1AP+hRA3DdJEMhl/ZtjcybzUsUSCC0LA9MTp
        lRuX+fhaibIhqnUZBjykfjIwnB0Vlj2pYTbJV3k=
X-Google-Smtp-Source: ACHHUZ7/c1S5D9tjivj/1caeYmwgx1qRUFkUn2QGfQqnIEwuiYOyh4OGmUpCzK1M2+9zyx1VZa0EJRPeRtmBDX9faHE=
X-Received: by 2002:a05:600c:2147:b0:3f9:ba47:a199 with SMTP id
 v7-20020a05600c214700b003f9ba47a199mr14933624wml.26.1687852080636; Tue, 27
 Jun 2023 00:48:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7412:a39c:b0:d4:4508:168c with HTTP; Tue, 27 Jun 2023
 00:48:00 -0700 (PDT)
Reply-To: qu26668@proton.me
From:   Dongyu Qu <huyuuggyeyue@gmail.com>
Date:   Tue, 27 Jun 2023 09:48:00 +0200
Message-ID: <CAPA1J+XgZbsojErDVJ2m9LCPjVcnVc-kOUcvmJYcvtzu70TGyw@mail.gmail.com>
Subject: COVID-19 COMPENSATION FUND BY THE UNITED NATIONS ORGANIZATION.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

COVID-19 COMPENSATION FUND BY THE UNITED NATIONS ORGANIZATION.

Your COVID-19 compensation fund of 6 million dollars is ready for
payment contact me for more details.

Thanks
