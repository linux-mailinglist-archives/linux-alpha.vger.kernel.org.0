Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 016C45A0E6F
	for <lists+linux-alpha@lfdr.de>; Thu, 25 Aug 2022 12:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241308AbiHYKux (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 25 Aug 2022 06:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241238AbiHYKuw (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 25 Aug 2022 06:50:52 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E211AAB06D
        for <linux-alpha@vger.kernel.org>; Thu, 25 Aug 2022 03:50:50 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-11dca1c9c01so7481454fac.2
        for <linux-alpha@vger.kernel.org>; Thu, 25 Aug 2022 03:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=NcQgfGWmNtGVcmYOkqhvmNWuEth66CXwSKmPdJfqqgM=;
        b=Y0ifEySLSRe2Ty6okjWaZ7N1nS2TKMazz0c+VFYfSran1naEoUH8dMsYHt+jzn+uw2
         xe2HwvZFcSluwgEuYA95uTlwBI0V7DfLOKzm8DY/wRQelYJR3JmBUn0O9IJYOgsOjpuE
         lvpCfpSoaoAlSW1VnZTwVQX07l2PiqOF+dxtpqm5/gVfwlxaTlKG4EJuj6YNmew97zbF
         WtX400jeSbdsQW5vPy9SxRi9pYYSut45DyqhkIlnmlKFBcVuPpHkv4YSsz58k0+xgGbV
         Xmyfw1jRyvjsuDlgyJyef/EHPB14cmEgZOyF0u8Rct5LCMp0/V0LAvVd2otsQGGAc5Op
         PCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=NcQgfGWmNtGVcmYOkqhvmNWuEth66CXwSKmPdJfqqgM=;
        b=c3ALIXJOy0XxSnoNN7/7RCyYvXGNQguRcpxA/p4Fie1JP9Hgfl6WmbNcv4HwIyf9Vq
         1AdC2xFqswsHh6BGzAHLuLmrUZS9wlhQBirSS/5lGfm4P0wXg4ynRHf0KDfytTQKlvUp
         B6jefJ2XoFgnH3MbuXKptFow0wBuU/a5Lx8whweOyqrmPZ0rs3HNqlyopftcHwTink2F
         6rO3yFxOMP5oDBgBy/kkcGugFKG5PVLYGDCaYQ2htcmo9LV4EOmUEYmV+pK+TftaMQi2
         khxC+9aLhpRPR9gsVfwvpgEn0L7CJeqEzgQf7vXdjgNhcWdavOIGee1qRM3OSRhV3YY3
         oPFw==
X-Gm-Message-State: ACgBeo3fOGsEc/cD9gFXm2iGISsj3/7ZqvRy3ny83c51v+SUq3CUgD0a
        qRoEkH+jdT8f0VTPyMyiSySnFRedLGvsZDtBQ7I=
X-Google-Smtp-Source: AA6agR5LmNVfyt6WiVkxi/LhRO2UqI5bcvb2/Gr+SV9ByXTZlBfq6JAEC5W6J++nyRwzZwG0M2KVry3miwthdRQZhzQ=
X-Received: by 2002:a05:6870:4302:b0:10d:c587:d30e with SMTP id
 w2-20020a056870430200b0010dc587d30emr1689843oah.28.1661424650003; Thu, 25 Aug
 2022 03:50:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:5ec3:0:0:0:0:0 with HTTP; Thu, 25 Aug 2022 03:50:47
 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   kayla manthey <tadjokes@gmail.com>
Date:   Thu, 25 Aug 2022 10:50:47 +0000
Message-ID: <CAHi6=KaZA2=ZXGpJhz2qGHncWTGti0YFo_90Nw0VXSbwBpK-LA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:31 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4932]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tadjokes[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [sgtkaylla202[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Bok draga, mogu li razgovarati s tobom, molim te?
