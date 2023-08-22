Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D99FF784E54
	for <lists+linux-alpha@lfdr.de>; Wed, 23 Aug 2023 03:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjHWBld (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 22 Aug 2023 21:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbjHWBld (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 22 Aug 2023 21:41:33 -0400
X-Greylist: delayed 918 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 18:41:30 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6DE3E4A
        for <linux-alpha@vger.kernel.org>; Tue, 22 Aug 2023 18:41:30 -0700 (PDT)
X-AuditID: cb7c291e-06dff70000002aeb-55-64e54b4bd91a
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id C9.6B.10987.B4B45E46; Wed, 23 Aug 2023 04:56:59 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=KsoLJGBHhmsBi8p6Lcw66U8X9cv3UnAHcngqMpAA8dFZFq+NAHM8W1FhD7AKf0EJ5
          vr4uBs495ajQS0gVqvU28pC0/jDkCVT5zT0Qy8UnyEpuFmQAXLLKyF36K3yW8o9US
          nz+vmXp+w0u348hq52zJxwx3ylDOVIaADoeCmmAJ4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=bORwhfN7auS5/sDvaqMr4/duQSSBS9t9YGxA2rheSHP39m3Ss4kG86t8u7mjdrALe
          0xZWn4o74vsRc4RDjT2ENjaFHjY0Mm6Ty9OCjr0UrCEDhJMj2xv/JbSVQDHZhDwEP
          3UZjkm1zZ9upehHvO514EbkJeIiIJVv2xwjCawt+s=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:30:57 +0500
Message-ID: <C9.6B.10987.B4B45E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-alpha@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:12 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsVyyUKGW9fb+2mKwZYHMhbv7h5hdGD0+LxJ
        LoAxissmJTUnsyy1SN8ugStjyboLLAW7mSva+hexNDA+Zupi5OSQEDCROHzyAiuILSSwh0mi
        8URFFyMXB4vAamaJfV3fmSCch8wSzx99ZARxhASaGSU+3p8A1sIrYC0xs/8pO4jNLKAncWPq
        FDaIuKDEyZlPWCDi2hLLFr5m7mLkALLVJL52lYCEhQXEJD5NWwbWKiIgLzHl4gJmEJtNQF9i
        xddmRhCbRUBV4sCNeVDXSUlsvLKebQIj/ywk22Yh2TYLybZZCNsWMLKsYpQorsxNBIZasole
        cn5ucWJJsV5eaoleQfYmRmAYnq7RlNvBuPRS4iFGAQ5GJR7en+uepAixJpYBdR1ilOBgVhLh
        lf7+MEWINyWxsiq1KD++qDQntfgQozQHi5I4r63Qs2QhgfTEktTs1NSC1CKYLBMHp1QD433v
        Asee/0nRXzvW+wSlbTboPLXzxZHsOfvUXx9ueVKz+1nlTLNfYTMnbJRTqhavSHfYM/V3z6N9
        75+sV2CUC3m+UMVH++LO49MPu+xz7te7weS0Y1GB2pPL50oqMpddcsvXuTjvocmiheqrqhh4
        V71Zu8dv3bTfW2RPVp80mqwcdjJWcuk2s11KLMUZiYZazEXFiQBExbAmPwIAAA==
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

