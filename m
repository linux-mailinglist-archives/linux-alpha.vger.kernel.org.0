Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA61A587C6D
	for <lists+linux-alpha@lfdr.de>; Tue,  2 Aug 2022 14:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236406AbiHBM22 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 2 Aug 2022 08:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232045AbiHBM21 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Tue, 2 Aug 2022 08:28:27 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4925018A
        for <linux-alpha@vger.kernel.org>; Tue,  2 Aug 2022 05:28:26 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id iw1so13295279plb.6
        for <linux-alpha@vger.kernel.org>; Tue, 02 Aug 2022 05:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=K9aCivmd3pOhXO+7wSe24RMSLcWBP61HE/hhO1yg1yw=;
        b=KnGk8/D1+NJgUpLMsfzig6ylUeZQg8uZU+Qh+WF2rnfgqQ4fFcyJvRQmKIlaSoisXD
         n/Ty7X4Q/eenPVwzlRjLwhOxtkIPawH/9NV5d4IDK8mIMFjRmKJBxXZytgJ7DdZ700Yy
         Qfnnz0TAGd7AAwT+9127HC7ddCWRasiU1F5pbtqSGrpU+Zh/kvWL7TJVfjZ27iGRNnnn
         qqWV1ZZD1kcybnzjdwYj5+FCOZIHO6LqGLJl5ESbGyLkHhKt+N/3954YpqxPnnYJCYbA
         quDhEqEkh45mbd6Epxi4uj/IddfVv5JtHO/Ap988NrCZDmetqIMpyFQT4BU13ULyY7Na
         qIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=K9aCivmd3pOhXO+7wSe24RMSLcWBP61HE/hhO1yg1yw=;
        b=CZwBJiyb6YPq2eRAjzZaCjH/zhFj+jViY7RRcWcgOPriNvPLS1l/YZSbTrtXSIboJm
         BKXxggzYQgfBje6q2h1nmr2Fgewfbp2wAL4xuvE9WvXfn+JZ2S7DIvPkRRR3/clwBWRU
         p+agDFNXWvvVYRlHR+0li2FEbCBzoTtQrWp2W8R9FhBwt3ZmIQ+nbEqJDjw7YH6eSGGH
         gOyNzdgeOYiDNVRed+0rYYAHf8gt/VXpxVoIq4aaX1ZUaZeN5aeu/ynIqxUGmduIMvnX
         kv9DfwubeiXxCMLHnOQIBCOJn7xqpN14jEPFWUWI3xZ7PiRrFXvH1u+pik1zk5GLJ52O
         tz7w==
X-Gm-Message-State: ACgBeo2qcLVkZk9qsHc8P6ieOTivOdbGPD5M4cqIJGzu8xx0sJsqhjBQ
        9zB2bwPg/S8xbX7vaf+ciTBw8M0ERzyc1f3BT8s=
X-Google-Smtp-Source: AA6agR45Nu2oda2TCE1Zx46UTYKTn/F5neYfQqvS+5Uqgwcg0RjncKDlWjN/SaUrIHKDcq3Tjh1TR7fiwHEVBvRxsW4=
X-Received: by 2002:a17:902:7e84:b0:16d:be50:f729 with SMTP id
 z4-20020a1709027e8400b0016dbe50f729mr21298433pla.16.1659443305533; Tue, 02
 Aug 2022 05:28:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:681:b0:42:5586:8c14 with HTTP; Tue, 2 Aug 2022
 05:28:24 -0700 (PDT)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <davidkekeli04@gmail.com>
Date:   Tue, 2 Aug 2022 12:28:24 +0000
Message-ID: <CAA88ExK_NjY0T8Xc8z_CCVj36haWxuShtccYrr24GFK52wJ4cw@mail.gmail.com>
Subject: Hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:635 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4948]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davidkekeli04[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davidkekeli04[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Best Regard,Mr.Abraham,
