Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03D865A7E9F
	for <lists+linux-alpha@lfdr.de>; Wed, 31 Aug 2022 15:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbiHaNWZ (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 31 Aug 2022 09:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiHaNWX (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 31 Aug 2022 09:22:23 -0400
Received: from mail-yw1-x1142.google.com (mail-yw1-x1142.google.com [IPv6:2607:f8b0:4864:20::1142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C05A2211
        for <linux-alpha@vger.kernel.org>; Wed, 31 Aug 2022 06:22:22 -0700 (PDT)
Received: by mail-yw1-x1142.google.com with SMTP id 00721157ae682-33dc31f25f9so306646977b3.11
        for <linux-alpha@vger.kernel.org>; Wed, 31 Aug 2022 06:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=DnjnZSajfNgAzpK5ym8unXyyAyM+qS8cquz4gOGGtuU=;
        b=notPEjO6RlvswNeZgjFA4JNi+kBi5Q8as91xA3OaU8zcnrhvEESUaaBLZUlI6kgQ6f
         ZLjd/E0LN9sCG6Wo2b47bPARLDeXKUIvMxKc4mrgwjqB0usJZRvfAtuo6UFpyeq/9jcZ
         6Z5VeiAV2QLbEMcILoXy1ajJga+gDprjXwRSLmVHV28bEyNRUuiEtUg2PIVuyBgomLjC
         XAVt+olZdHhd0ODczIabEAA5GpKPaCSV/+DLcfiWaoL9DGv2JT+78c+sqhxOG7FvkvMz
         YeZ6QPciiP9dD2xOQqoESTFl7M9Hg72lOI2pl0YdGTZ2SL0RtqRhuhV4R+TwWgZ04mob
         Ai4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=DnjnZSajfNgAzpK5ym8unXyyAyM+qS8cquz4gOGGtuU=;
        b=iesMc0HT4V9ZojLe50Q/0Z92Y6NP3y0vm6a16jLmm/tDOcFqCLD3pmNnKCHbyLW0Ip
         z0d2nk2ujOO9I0hu7YZK8qMmPDVcNfQQjAOlogDkw9kFGIvN9JunwintYAocmWLbr1xV
         c41v1lN2vJACg4b69XhobnAEtjgohuIQucqSA8hM8TK9IQmpgDZTMgf52P2Uyt20WsH/
         Xi1hxrScARl8vMjVHGTIfWykYyoCnM+pNqWLpI3lMC4zo/edOaJw7d+KKAzSxMc2Uu6g
         YC/h/+9kq1n1YtgmzA8+jczsAXFyZFkM2ZtFhgeeIJ1yt6M5oO2RaujjA0NxHXsBZSmQ
         g5eQ==
X-Gm-Message-State: ACgBeo27SaqOfH8yg2AAuhGERTrkFj9szTKzbKt+wHA26wxRtJn3s372
        AHUkKBayOMvAtG/F8VdEvps6/VTNq/SyirTznTg=
X-Google-Smtp-Source: AA6agR42d5b7j7t9B6hSq+yJ/rhpa/iVKuzByqrM+6txhOc/nOrMhIcSi1gkLQVVZ/IK9YmKipdgFXrSrMx41PDEebs=
X-Received: by 2002:a81:638a:0:b0:33c:922b:683b with SMTP id
 x132-20020a81638a000000b0033c922b683bmr17986055ywb.207.1661952142045; Wed, 31
 Aug 2022 06:22:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7108:74d3:0:0:0:0 with HTTP; Wed, 31 Aug 2022 06:22:21
 -0700 (PDT)
Reply-To: golsonfinancial@gmail.com
From:   OLSON FINANCIAL <khadijayusuf6876@gmail.com>
Date:   Wed, 31 Aug 2022 06:22:21 -0700
Message-ID: <CAEUDHmj0xQsKN-pEwdQyp11gnov+kQg7gjpZeCcR-w6xXbH5nw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1142 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [khadijayusuf6876[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [khadijayusuf6876[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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

--=20
Hallo Gr=C3=BC=C3=9Fe,
Ben=C3=B6tigen Sie dringend einen Kredit, um ein Haus oder ein Auto zu
kaufen? oder ben=C3=B6tigen Sie ein Gesch=C3=A4fts- oder Privatdarlehen, um=
 zu
investieren? ein neues Gesch=C3=A4ft er=C3=B6ffnen, Rechnungen bezahlen? Un=
d
zahlen Sie uns Installationen zur=C3=BCck? Wir sind ein zertifiziertes
Finanzunternehmen. Wir bieten Privatpersonen und Unternehmen Kredite
an. Wir bieten zuverl=C3=A4ssige Kredite zu einem sehr niedrigen Zinssatz
von 2 %. F=C3=BCr weitere Informationen
mailen Sie uns an: golsonfinancial@gmail.com..
