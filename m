Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2106636220
	for <lists+linux-alpha@lfdr.de>; Wed, 23 Nov 2022 15:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236755AbiKWOnj (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 23 Nov 2022 09:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237340AbiKWOnS (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 23 Nov 2022 09:43:18 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF1C4046B
        for <linux-alpha@vger.kernel.org>; Wed, 23 Nov 2022 06:42:47 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id n21so43199180ejb.9
        for <linux-alpha@vger.kernel.org>; Wed, 23 Nov 2022 06:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2TzIZ6xHjbIeFdhCqmg0PjYdWwfTp54Oif1Ik3qZKiw=;
        b=CF+bTeon2TPdIMEJe+xgCbUcbx0l3EQxNd8BShboRbuz3qjB9bD9HJaI0nbuF2q/dJ
         7g1Li5/OnXFbUsFVxmmn86Y5JQ5qiUAkWOasiC0wvIaxlzys7LSGzB/YJ95ztrK63FRE
         PbFkFpX25/cWK8Dr22rlQYHQR83xaP9asf8vk1PGbyuwxshWv2wHCSAGonYrBKZ/7bdi
         J+KmEQMjBRbA2ldbB5aguBk6YCDgRjBglaOSm1TDtKK75kKbpcQVrI7iKVLqa++wnPNq
         5mOkU+tvUiPU/QNmBdxmNDz3zY87cjkUmfyAJLbTWmvB8ueOUCWVLkfluSyUXUmhyglf
         zHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TzIZ6xHjbIeFdhCqmg0PjYdWwfTp54Oif1Ik3qZKiw=;
        b=JcfHbfOS1UqJIazuMbTDza/w9AV5YWb12uUnt7pKVfcACfCOLMAlZ6ZX4WcFXyXiG2
         ztjHV0od4xax0OEe4XPfGy871z5cCCGGbkOJLW7j7J/7WudWKx/xV4pBxB9ZHDwQfmw+
         /mCy7Xs6nIisa4JT1p6+mkjMMmuwOxjiZyndd+WUDB8FacmYSNUcBdDkgeUlzErnQsWd
         TmvzuT+Re9ixcsMPLbyxUFjxvoOXd+G0t5qloAwoPRlsLJ6WUg6DsjkFv5nYg0qRoG4Y
         NmRqBr8LeHgxZrqFNH2bhDGe4ZG3DYS0VhDJx5p6TeUwRyG8xDP4H/62L+UqrWoCfLFk
         zGGg==
X-Gm-Message-State: ANoB5pn3WlIHRRSgZaMLWwxiH9uI/wxMF5l0KMj32ch8alrmb+8+5dIC
        ZzQaqHNEmR+auQuJ7rO+qnR5AioFUS0YWV/yrJQ=
X-Google-Smtp-Source: AA0mqf6Z9dqsT0K+uc4LNJqnjGXmGfuCnXa+0zo0xQMIz8UQWGdpqZGqP7iPutAes7PYCgeHP0mHEo4Qdzha1JC8vvc=
X-Received: by 2002:a17:906:50f:b0:78d:ad5d:75e with SMTP id
 j15-20020a170906050f00b0078dad5d075emr24123368eja.172.1669214565569; Wed, 23
 Nov 2022 06:42:45 -0800 (PST)
MIME-Version: 1.0
Sender: nournoura283@gmail.com
Received: by 2002:a05:6402:524a:b0:462:e523:5345 with HTTP; Wed, 23 Nov 2022
 06:42:45 -0800 (PST)
From:   Miss Reacheal <Reacheal4u@gmail.com>
Date:   Wed, 23 Nov 2022 14:42:45 +0000
X-Google-Sender-Auth: _g-gGptndrwqa7Q63sHSmUBqFy4
Message-ID: <CAEQzSBasSFzicZDtMNqAwCd8ugEr6mmkfm-Cea77PH3U5=BDiQ@mail.gmail.com>
Subject: RE: HELLO DEAR
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_HK_NAME_FM_MR_MRS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Szia,

Megkaptad az el=C5=91z=C5=91 =C3=BCzenetem? M=C3=A1r kor=C3=A1bban felvette=
m =C3=96nnel a
kapcsolatot, de az =C3=BCzenet nem siker=C3=BClt visszak=C3=BCldeni, ez=C3=
=A9rt =C3=BAgy
d=C3=B6nt=C3=B6ttem, hogy =C3=BAjra =C3=ADrok. K=C3=A9rem, er=C5=91s=C3=ADt=
se meg, ha megkapja ezt, hogy
folytathassam.

V=C3=A1rok a v=C3=A1laszodra.

=C3=9Cdv=C3=B6zlettel,
Reacheal kisasszony
