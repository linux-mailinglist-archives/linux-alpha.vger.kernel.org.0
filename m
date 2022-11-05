Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6AF361D9E3
	for <lists+linux-alpha@lfdr.de>; Sat,  5 Nov 2022 13:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbiKEMfi (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 5 Nov 2022 08:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbiKEMfi (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Sat, 5 Nov 2022 08:35:38 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF1015726
        for <linux-alpha@vger.kernel.org>; Sat,  5 Nov 2022 05:35:37 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id u24so11087619edd.13
        for <linux-alpha@vger.kernel.org>; Sat, 05 Nov 2022 05:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=cBRQ6Y8RpefIRHVQrLMSbFXJhzjFVhKUVpWiqphfFD7ZpdDCO4bkiuF3D/wQA8szCV
         N9/bn9IHCh7XDMLbhEEGrfqiLIOEs4dJxsB83TL3DNqg7MfoEPuluMIpDp6ZBO90y4DD
         fWKUOs/7GSTK6BhMWPmhNXEAq6hohjAMxPiWpy1hZI9WsxxcpRo2Yb+NBHr+rq8EXy5G
         MP37jw6howTDBU0pbP6pioWqE/qZyyX+SMTGB3BuhtQMIjk4NfTxtGc7ZD/jM6B1zSTJ
         SG+flxql5YVXo/GQ+GhmgMs26VLfUnwwzfizS49eehXvsuQO1umllX/v9vFFdjUUHgmE
         ubNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=xV5DYiM93OO2ZASOlPjc24nMnADvknIdMeD2xL5ncIrhNvseXy8yswhvF/4DjkixfP
         L2qmN/5s18trdwKDTCduVPWYrn2a8Hw3BXmMG47tboXeoJ18iqcntYiSuau5Z1xas34R
         DZOifG+I3nM6HsnNScXARvicd7XxtGb4Lm904nBXkak+1EGxMqiRGPunPfkom3OscuuB
         6BcEK8+ACJkXEKFK1ljr500Tfk2kpXiu1xGvIBOr75qpNCzXAuXQAm8OGhZqTE7ujzWq
         io13FoP/Bvg2RIcwJl+JOEJoblYrs6C8wQ/Uy7wsviSs/8o16a9p29YIfhL4ToPrtBFq
         9n9Q==
X-Gm-Message-State: ACrzQf0XdcgKsxOWAv5Bu+aTfjZeFPwhk/oVYeiyefmevTnj+I26fsYp
        yFKLuDOZj0JLsBInZoKM+uqHprMLh/5DGWYz2iA=
X-Google-Smtp-Source: AMsMyM7ov6riUwC0zZeruMWfTOWyLCbUC37ops/VJH6Iz0RYno+LBVMMQ4SF3SwUDowxxmVLzV5y8vk580CQgz/obwk=
X-Received: by 2002:a05:6402:2947:b0:451:32a:2222 with SMTP id
 ed7-20020a056402294700b00451032a2222mr39283693edb.376.1667651735582; Sat, 05
 Nov 2022 05:35:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:3c41:b0:78d:b654:8aec with HTTP; Sat, 5 Nov 2022
 05:35:34 -0700 (PDT)
Reply-To: stefanopessia755@hotmail.com
From:   Stefano Pessina <annastaciamutuku87@gmail.com>
Date:   Sat, 5 Nov 2022 15:35:34 +0300
Message-ID: <CA+Rj53bd_Xp1QaoObL4LCwiUdRsk7BNXS8hYLLL5HqpCEx86qg@mail.gmail.com>
Subject: Geldspende
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

--=20
Die Summe von 500.000,00 =E2=82=AC wurde Ihnen von STEFANO PESSINA gespende=
t.
Bitte kontaktieren Sie uns f=C3=BCr weitere Informationen =C3=BCber
stefanopessia755@hotmail.com
