Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDC9E57A5F7
	for <lists+linux-alpha@lfdr.de>; Tue, 19 Jul 2022 20:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234457AbiGSSCX (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 19 Jul 2022 14:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234344AbiGSSCV (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 19 Jul 2022 14:02:21 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908B152DEF
        for <linux-alpha@vger.kernel.org>; Tue, 19 Jul 2022 11:02:20 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id r9so26163353lfp.10
        for <linux-alpha@vger.kernel.org>; Tue, 19 Jul 2022 11:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=MRmj8l99c2O7PdiyVn26Tftqaot1uHzMd7MQVDOANP4=;
        b=F7ZDck+3GLig5jkUnBBV1NDp7BukS+CejNGbJzkT/BR7H1mZlb2A+DZ0aHdybnBpOH
         BOOKz8jcBsG9Iz6rR+CN116mMGiBLahYMQ51Tem+JPDJjYtFXrydNuk1cs9Nps1uwXZh
         Bp0GeHJVBc27ACZIqGTPwb69aIpyy6OD0NOApvmljTBBIr8EoJImskG6JAm8CmidXP3J
         ZUH+kZOWm8ZLK/3RM5kTJDvu2P37xkLSFSN1HA1TbcNszEhurX1XwYrs+wPPRQ2BVhvs
         Djrn8LZ9+G2mnbtQGThLYIVZBfSQZ3+ASxC+jBiHuS8rbHzaOFmhSZf4VUquwuolgxeM
         vyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=MRmj8l99c2O7PdiyVn26Tftqaot1uHzMd7MQVDOANP4=;
        b=k/024e2SlocfIsFh6VKZb0O1ZgwqVFZeMMq5DmfuzO3YQu4Au4fp9irqUg5l/VF06Y
         FLt55qYVIaiIldvBkN9PWDThd8Qo8zP6iL3aaP+oQ9U7aaZIMIXb9JobQKKKWQQsuyv2
         fHdsMcbTEFn2wxhTALsisfqDGRJzoYRi89u45tFNBPvci9DVPRBpkyRsndk0Rccdj1Kz
         ifvll5uyi7vL/0WOAMYz7BRw1PUxxI604mngnBLCtJ8MdUnyanQmVmxxiyd0ZRwMqBTo
         xwk13fpokyIusxyyVoC5d5jo1LwuBm+yHFccDDpepdvq/CurkYa7DntdJWO0sg2e0Jxy
         EX4g==
X-Gm-Message-State: AJIora9IQsXGetIMihFQfmD2DaIaWHDFwUe8LyK8XNmlnK2CPS0ZfGfN
        KbzIe5Zb8hNKLcPz9zxVuAV5efLI/qqt7ConqeY=
X-Google-Smtp-Source: AGRyM1tKwNAsmUjxFhYyOqz/SnuEi5e2PEQVukPtpWuSa4cniOAnm6wM9jkG2kviJp5RxqiDUUbwxXjz0EYQNfLSu0M=
X-Received: by 2002:a05:6512:3da2:b0:48a:1b79:6d5a with SMTP id
 k34-20020a0565123da200b0048a1b796d5amr14994931lfv.471.1658253738501; Tue, 19
 Jul 2022 11:02:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:6f82:0:b0:1d7:9235:94da with HTTP; Tue, 19 Jul 2022
 11:02:16 -0700 (PDT)
Reply-To: royandersonCCB@outlook.com
From:   ROY ANDERSON <hk1113058@gmail.com>
Date:   Tue, 19 Jul 2022 14:02:16 -0400
Message-ID: <CAO3=PdpOmvNbNa_F6UWWZMo=6CKzYAryLcbEM+cETMrGbH-Rtg@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hello,
My name is Roy Anderson. I came across your contact and noticed we can
be of value to each other. I have a proposal that i want to share with
you.
Your prompt response will be appreciated for more details.
Send reply to email : roy.an.erson@outlook.com
Sincerely,
Roy Anderson
