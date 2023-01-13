Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 343F9669A3A
	for <lists+linux-alpha@lfdr.de>; Fri, 13 Jan 2023 15:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjAMObk (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 13 Jan 2023 09:31:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjAMOax (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 13 Jan 2023 09:30:53 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5D684BD7
        for <linux-alpha@vger.kernel.org>; Fri, 13 Jan 2023 06:23:56 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id a3so4903774ilp.6
        for <linux-alpha@vger.kernel.org>; Fri, 13 Jan 2023 06:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OF3VMKCJX/ixRNA7KETCaEsWyEBkIDVOlKWye/O0OA=;
        b=JojvgH8XT/5W3Z19zz/xJpsK+UtUfuLOajrP2bUiE0PZHJLaHxyVoS/gdwZ4j1nINn
         NAhLjtRw5JWhWpQP6cjr/K+IqEq6cG/swjHmgKkU8/bzhvwyjyHr6pxRihWxyvWQ7jH/
         ycXHQba8H8CGw08mZc2lRnHbsatDyaP7XSi3luhnXRDyANgc7SfZsYR/2kBx67sDkelt
         N009oKtaqxMaVcV5I8bJGY2a5+MgMpNdeDc6P09VU6v2oJr8B0zV2O/YER8mJLD4Mn1g
         U9CLRknFXD87iaVRlJkboh6IHCCrAxvZm9BuL/cccG7OGvOaJ6fm9314ARdKvJNPjG9a
         t4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+OF3VMKCJX/ixRNA7KETCaEsWyEBkIDVOlKWye/O0OA=;
        b=ohOQDlTBs5oOU0my4dO6/MW+WRh7GYpbNlYcYHxqDOXNxfQDOMcLteFVc69T3m+LL5
         u1JjZdJFhtnXqGEooqCF3zfsJivmIvJFKFYfoGS+2lkBGZwcQ70FX2Svo8H49X8FcJos
         x4zWa0vyUptzPhfA5bbn5Me5TXryAgPbcOLo2zTiqJ6ppR0KjlYYbdnVvByoFSg2gpNj
         7F9lWph4fyBFFsrKxru0wn9p51skcW4bZxRfBAvA6hg/RJsmXXJGmOt5i1DM2j991d97
         UytlsayNRJwuZFBEEulDGcZeKe9vk2xz9yjZ3d8iv+NWIhEyoFdFt6p7kRmExTS9quHs
         ODqw==
X-Gm-Message-State: AFqh2kq+JcboKCy5tKZ/lxYMSe7CccNRzgwuQhoV7MZaMtZ9/11yAn+Z
        443TOvkbRqoSKK90ewgYCA8decA7oSBaWP035F0=
X-Google-Smtp-Source: AMrXdXszWXnZUU3mDwuG0prmaP86rTFSkz0+fra775veb5Y7HNHpZxCjxPfSPiWnLxbY0i6yMoRbzmb1JvPTG9uROSM=
X-Received: by 2002:a92:3601:0:b0:30e:e57f:b106 with SMTP id
 d1-20020a923601000000b0030ee57fb106mr115968ila.304.1673619835751; Fri, 13 Jan
 2023 06:23:55 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6e02:1282:b0:30d:c36b:403c with HTTP; Fri, 13 Jan 2023
 06:23:55 -0800 (PST)
Reply-To: hitnodeby23@yahoo.com
From:   Hinda Itno Deby <atidigahcyril@gmail.com>
Date:   Fri, 13 Jan 2023 06:23:55 -0800
Message-ID: <CALHvQ-jffHwgwQxY7MVBOpZpcQX1hUnBOishkcFBMPm+SMZxqA@mail.gmail.com>
Subject: Reply
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM,UNDISC_MONEY,URG_BIZ autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:130 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5029]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [hitnodeby23[at]yahoo.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [atidigahcyril[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.6 URG_BIZ Contains urgent matter
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

-- 
My name is Hinda Itno Deby Please I want us to discuss Urgent Business
Proposal, if you are interested kindly reply to me so i can give you
all the details.

Thanks and God Bless You.
Ms Hinda Itno Deby
