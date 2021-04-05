Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1801B35411E
	for <lists+linux-alpha@lfdr.de>; Mon,  5 Apr 2021 12:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241679AbhDEKPK (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 5 Apr 2021 06:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241211AbhDEKON (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Mon, 5 Apr 2021 06:14:13 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FB2C061756
        for <linux-alpha@vger.kernel.org>; Mon,  5 Apr 2021 03:14:06 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id p19so5505312wmq.1
        for <linux-alpha@vger.kernel.org>; Mon, 05 Apr 2021 03:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=9p3Jf8Ine9TvooPOd47fVVdvEKHZBGtQWRdNNiSbfFc=;
        b=t12MN01c9zudhsmng6TU54zKZH2XuurET49Hk1h3jnTU/S523/JquKGRZGBvyHNy/j
         nBN/zc3jcf0ddbaX0bZytkXJt57eAhKvssCn2hqX90tS7RkV+9IshC9k0EddZ2iYSlgS
         1v+sa7IN1hH0+moTnn/kM/GdAi081d+qj/01KxLx9n6P1cTYyH3okNmXKpnTX8dEYyV2
         lMp9hnpZO/RsQKWpoZWGxl1N5Id99W7mTIQ7g0csdpv6ckbbF5s7y6xE+svJJNcKuMQE
         PRn42juIBR/KjoQYt+UCT/HJbf62FC0YfxXw1St7wzJ7mPZhpziNQwaM0l9/eTvbMdh3
         4N/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=9p3Jf8Ine9TvooPOd47fVVdvEKHZBGtQWRdNNiSbfFc=;
        b=lDgk9u+5pD7B8xWrCzcCFe6CNW57Tm3Vsxxy86amUbhJDS8rRfLAP5w54YT0NHb12U
         ASXheU+BmTiTKwzqPVj9yDYC2htyxV03X3VuOfcBYYfrCMm1dtjNDxCLub7V7fPCIzZU
         lY/kCqV8zLGoJMczyN0h/1yR728Y+VXWE+5FLZXeCT7jEx39XMlpBrsvXugg4xnAJKxU
         aHupiuKlXA636tVFOf33ldBKsK9QAgKEQTUViKRM0QTc3MzppD0aVnir/Ek7bndqpIFX
         lG96qtKBmm4ZX7qA3BIga1ioOeOWOn24jEufbIw9/d8kbry8W9HAKodkYLi7ZVYv1bmh
         BSvA==
X-Gm-Message-State: AOAM533s2Vv+P9kn/TlMN85DiFYFCrl5h9brQB8YWMPmywSswIluRfnr
        bHMwFD9Jfb9PwLiC2yFBSa8LHBN4IU4=
X-Google-Smtp-Source: ABdhPJy7nWyaqZaxZWbCv213LeVqv8qFmKQKHBypuw/0lE+EQyI6j9jfqpqwKbgDQrLmAuZT6xf+PA==
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr25181785wma.94.1617617644878;
        Mon, 05 Apr 2021 03:14:04 -0700 (PDT)
Received: from ?IPv6:2a01:4c8:461:bfee:e5a1:38e7:8db0:7109? ([2a01:4c8:461:bfee:e5a1:38e7:8db0:7109])
        by smtp.gmail.com with ESMTPSA id 4sm6298776wrf.5.2021.04.05.03.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 03:14:04 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Kirsten Bromilow <kirsten1@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: X11 system lockup with 5.11.0 kernel
Date:   Mon, 5 Apr 2021 11:14:03 +0100
Message-Id: <B0175326-CB7E-4D3B-AED5-D00EF3C1080D@gmail.com>
References: <20210405095825.GA17443@tower>
Cc:     Bob Tracy <rct@frus.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org,
        =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20210405095825.GA17443@tower>
To:     Michael Cree <mcree@orcon.net.nz>
X-Mailer: iPhone Mail (18D70)
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Please stop sending these emails! You have the wrong email address=20

Sent from my iPhone

> On 5 Apr 2021, at 10:58, Michael Cree <mcree@orcon.net.nz> wrote:
>=20
> =EF=BB=BFOn Mon, Apr 05, 2021 at 04:55:15PM +1200, Michael Cree wrote:
>>> On Sun, Apr 04, 2021 at 11:47:58PM -0500, Bob Tracy wrote:
>>> On Wed, Mar 31, 2021 at 11:04:42AM +0200, Maciej W. Rozycki wrote:
>>>> I think the only feasible way of determining what has happened here is=20=

>>>> that you track the offending change down by bisecting the upstream kern=
el=20
>>>> repository with `git bisect'.
>>>=20
>>> That would normally be what I would do, and it may yet happen.  Problem
>>> is, I don't have a 64-bit system with enough disk space to do the kernel=

>>> builds with a cross-compiler, and local (native) builds on the PWS are
>>> taking 36+ hours each these days.  Unless I get *really* lucky with the
>>> bisects, the task will take a couple of weeks.
>>=20
>> Confirmed that v5.11.0 hard locks up on presenting the X-Desktop
>> login screen whereas v5.10.0 is fine. This is on a XP1000 with
>> a Radeon HD4350.
>=20
> And the first bad commit is:
>=20
> 0fe3cf3a53b5c1205ec7d321be1185b075dff205 is the first bad commit
> commit 0fe3cf3a53b5c1205ec7d321be1185b075dff205
> Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> Date:   Sat Oct 24 13:12:23 2020 +0200
>=20
>    drm/radeon: switch to new allocator v2
>=20
>    It should be able to handle all cases here.
>=20
>    v2: fix debugfs as well
>=20
>    Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>    Reviewed-by: Dave Airlie <airlied@redhat.com>
>    Reviewed-by: Madhav Chauhan <madhav.chauhan@amd.com>
>    Tested-by: Huang Rui <ray.huang@amd.com>
>    Link: https://patchwork.freedesktop.org/patch/397088/?series=3D83051&re=
v=3D1
>=20
> :040000 040000 4e643ef861b921392bc67be21a42298c91c7ff7a b36453567c3176a3cd=
50fa0b23886b0fd642560d M    drivers
>=20
> Cheers
> Michael.
>=20
