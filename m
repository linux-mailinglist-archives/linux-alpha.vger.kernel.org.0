Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E05161D9E0
	for <lists+linux-alpha@lfdr.de>; Sat,  5 Nov 2022 13:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbiKEMfj (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 5 Nov 2022 08:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiKEMfi (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Sat, 5 Nov 2022 08:35:38 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B59A1573E
        for <linux-alpha@vger.kernel.org>; Sat,  5 Nov 2022 05:35:37 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id k2so19547296ejr.2
        for <linux-alpha@vger.kernel.org>; Sat, 05 Nov 2022 05:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=Ctqsy9Dvgk/+kopdSKw2nakJOaKYWc5Px4miv5nrUbdakPXmKrawMSMWlIhnhSZHC8
         R0/518emIgiajDoRL7YB5Jl3uTsJdnB5gC9CnBzRfBnWjv7o/pyniVgj/ZzgpbLIh9QZ
         QpeQs9y2vMzRXYCDLG0R/HEV6OxKVEj9QRj3r80BFxUUZX0AnYA04RDNPoHqnfFU+TSm
         Z1p5HCqPwndgKPGsygRgl5K7ElmAyPI2V4NipaqIMk5tNxNkYttL/R20iJtfO5u2xG9L
         fLWAEdiByX+i6WGqDUlH7NkpjuIAQL0vBnmXUgFFAyQMFF++Gv0rytOFQ+j52bZUjCiY
         SXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=txX+A7yPi0D6tawpxcwGdCA0x5hbPv6pdl7oiYKl8howd8aB8nXIImGNSzlbvYvR6b
         MOlm0fMQcTZ+nN3zVbTC5xyGC9gBWd7bbWGfc1vRmQGqIa7i6GmrVGMAVaFHcHK7FE4U
         6hyv/J8mQEq53p9LJvS12fJahiWOOas9tKs+USMF2sW38i65QUWUGFWteKY1X1Q3TEN6
         fP5/6OQ0jO7SbSQNFTvjTWKXTXiWrDs1oW/j6/UXRcmV8XZFGFDCl3Bdnz6VdHDURdLc
         kvLgxoziCdJ1qlntGkxFRO5vCzpnNTfeekWviJH0kTGud3KrfQkblzeDuvq0Nmg94+q9
         vYyw==
X-Gm-Message-State: ACrzQf1JCf3N/jdhRCUEzT8jmpS8Odyc0Ixqt/O19zW6ZSGiMH48bGST
        D+oW4Ewud1p1dgCXwqsgABKXwA++tzzSeasi1Ks=
X-Google-Smtp-Source: AMsMyM6qPi3qJDaqHdw9ngZIf6avAD7uo37qcDdp19fBrBvOL1V8ZU8jb2g7fSJPZOGWRI9YAqSs7kWTq9VCbBamscs=
X-Received: by 2002:a17:907:9602:b0:780:8c9f:f99a with SMTP id
 gb2-20020a170907960200b007808c9ff99amr39509397ejc.465.1667651735938; Sat, 05
 Nov 2022 05:35:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:3c41:b0:78d:b654:8aec with HTTP; Sat, 5 Nov 2022
 05:35:34 -0700 (PDT)
Reply-To: stefanopessia755@hotmail.com
From:   Stefano Pessina <annastaciamutuku87@gmail.com>
Date:   Sat, 5 Nov 2022 15:35:34 +0300
Message-ID: <CA+Rj53aCL5HHANbc6QiN28zTBijy3jqgqON7jOGOF=Gq4RqF5A@mail.gmail.com>
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
