Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDFED5A0DA8
	for <lists+linux-alpha@lfdr.de>; Thu, 25 Aug 2022 12:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238015AbiHYKPB (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 25 Aug 2022 06:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238181AbiHYKO4 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 25 Aug 2022 06:14:56 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D142C38BB
        for <linux-alpha@vger.kernel.org>; Thu, 25 Aug 2022 03:14:53 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id v125so22707925oie.0
        for <linux-alpha@vger.kernel.org>; Thu, 25 Aug 2022 03:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=NcQgfGWmNtGVcmYOkqhvmNWuEth66CXwSKmPdJfqqgM=;
        b=L3+Zw6JnH+rejR36xHQsbJ5GJPCLdv96EVXRYRA2yLvLh6iqLOBrwpMcefmek4YJDM
         iu44uszxLuWfkHQktNjegQdF+WxQ60OAl/gxdnnyy2WRcEIoUHjWKFOBSeguEOEcMdTR
         wdnV+3AAh31M5qgvTRgfmtQYjueQYd0/e7uhHx28oK48uyPdrR5IkFq5O+SB+fKs56D1
         Z1R1+gOHcSlBrTxC+E9c0Fscgs1D/RU5DLYorFaQMRvBYXkAllvhOcC3zUBAFPKyjBZT
         z4BOYGJ5q3A8jSx9lPBcW1oVbpBPPQtsv+CM4+iXmn+bOVUgKAOj3MBUb5q/oKUdN5zT
         ELig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=NcQgfGWmNtGVcmYOkqhvmNWuEth66CXwSKmPdJfqqgM=;
        b=NvjSacZvg1GNCy9KjSeo3ff1xZFtGigE1GgAVwhY5sxYR6ZUH6pS7zR2Tl3NMfKK/6
         Wc8UADhSII9e5VmCX3GiGluRLRLsrbCioLYJ3ujrxtspqYXB09/sDaJMNqokcWNOlh8J
         ZzCOeZweokNc/ROTNKp9uh/Ef4zHc4GZOMLeiMVpnfACXKRmWU+KrWbTYu8CyUu733NU
         AV3HW2SNLohmrIdoRHnLaX7sbPaGJxmVupI/FcGrkH2uREIgcUKP9dIzqgPuQQstqPbq
         NI3AptE2gNBmOfgdySHGK87n9LAlmC4ktWYs/VKerSXns1p+DnVxCD0PLsy5GVzbgBXI
         kUZg==
X-Gm-Message-State: ACgBeo3QUYErGGcYjFkrHY/lcocXFNYBiArGBJSRWJZH/zLZ6vfueEWz
        J/QEFC7H0786OgsAWQ/in8SV7WNVnHLT8xvR0/8=
X-Google-Smtp-Source: AA6agR5ElIoop78XR3aialKr6edWrkmHD648lupW5xL95lN/OVBAaBo2F4Q7kutQG8QuuTr+VTU2wozc/iFSN7KTRls=
X-Received: by 2002:aca:b01:0:b0:345:4295:e9b2 with SMTP id
 1-20020aca0b01000000b003454295e9b2mr1460916oil.28.1661422492787; Thu, 25 Aug
 2022 03:14:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:5ec3:0:0:0:0:0 with HTTP; Thu, 25 Aug 2022 03:14:52
 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   kayla manthey <tadjokes@gmail.com>
Date:   Thu, 25 Aug 2022 10:14:52 +0000
Message-ID: <CAHi6=KZXhCX1fYifazddx+NYbd_aNOr7nsL7DfT1GE8gEg+mVQ@mail.gmail.com>
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
        *      [2607:f8b0:4864:20:0:0:0:231 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4963]
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
