Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35E3F355085
	for <lists+linux-alpha@lfdr.de>; Tue,  6 Apr 2021 12:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242367AbhDFKI1 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 6 Apr 2021 06:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237305AbhDFKI1 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Tue, 6 Apr 2021 06:08:27 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5B8C06174A
        for <linux-alpha@vger.kernel.org>; Tue,  6 Apr 2021 03:08:19 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id u11so1133633wrp.4
        for <linux-alpha@vger.kernel.org>; Tue, 06 Apr 2021 03:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=lehe72gbOHrZXXhHKC8Mkz9mp936GbJVH3bHWsr04A8=;
        b=CJx1wwRyqHvkXjvJESAa1MV4lY5b9LbGsAqU0qrFxJ8BYJNRoEa6aNwJoHWaQ1ZV7a
         aY8ifuDY9MWROEkWydzI2CUVZEmoyBpSr2x7ggFqCQX3D+5u8mrkixE1+qHUG+D1u5Cj
         4gw52a9HL7dB71utF2DInk4/iXDnJa1GJ/4/HBjxXwDkgINAEDm119o+c5jHmzrJCyNC
         OgzV9x4n9B7YI0kjV9OrDphy94oFp+4kOCwVkHKbU55pXVNqt6sFmmpChwLaGwmWiw80
         v3dplFEsSFhpCGLeeyWGHBxxiIXEKzPz1w53G6Qh7VkenPwSDkdJFe6ImID/4lbbovPK
         x5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=lehe72gbOHrZXXhHKC8Mkz9mp936GbJVH3bHWsr04A8=;
        b=Z/oH1ZITO4zMfgqvNp++1w3IAVVuJWUbUEsUCJAS28BMUir+jC5QXDyckTsxE28tLj
         g8Gh9dHK4sySa82yJRCw2nTs6/Q6h+oXBP1ZhqzPOQmg1JdayXDXjBxRxmTzSRauxpc4
         nCPR6su4ob0RZ5g2063ZSacIioatwZZmnnrQxG1F1tjaRXQ+xoF8Dd/4761+mOuYMVJt
         F14rUpr5hEal0QSffu6wcSFYC5HVIVySVScR+c8fpQJtHHR0VvqQApCVwAWzN8n/WumV
         fJb6TU4cExAvW/rYUO+/p/rleslEmXkMy51KdjFUq6FcZ2AA7QuG1RVNS2amrAJ8Ef2q
         4+iw==
X-Gm-Message-State: AOAM5332GKFyDovAFXr2V2UYGB23skKgn5Y+5CzEuLSRfjEWn9qz6jgS
        onuxzvo8e9KV15RUFWEl7qxx2TERQtg=
X-Google-Smtp-Source: ABdhPJwsAOG+45S2Vm3mw1JXXcrXIhnHS5WF8fs2uXRVPc2Cuyf31uNlTFIG6F0SgpiR9NP+YGVziA==
X-Received: by 2002:adf:a406:: with SMTP id d6mr6888494wra.74.1617703698106;
        Tue, 06 Apr 2021 03:08:18 -0700 (PDT)
Received: from ?IPv6:2a01:4c8:419:9b11:5c35:b378:8624:1398? ([2a01:4c8:419:9b11:5c35:b378:8624:1398])
        by smtp.gmail.com with ESMTPSA id s83sm2262773wms.16.2021.04.06.03.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 03:08:17 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Kirsten Bromilow <kirsten1@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: X11 system lockup with 5.11.0 kernel
Date:   Tue, 6 Apr 2021 11:08:16 +0100
Message-Id: <77FD5DD3-70D5-4AF3-B84F-D32C5E21AB2D@gmail.com>
References: <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
Cc:     Michael Cree <mcree@orcon.net.nz>, Bob Tracy <rct@frus.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
In-Reply-To: <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
To:     =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailer: iPhone Mail (18D70)
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Please stop sending these emails. They are not Relevant to me. Thanks=20

Sent from my iPhone

> On 6 Apr 2021, at 10:57, Christian K=C3=B6nig <christian.koenig@amd.com> w=
rote:
>=20
> =EF=BB=BFThat is a known issue fixed in follow up 5.11.x kernels.
>=20
> Regards,
> Christian.
>=20
>> Am 05.04.21 um 11:58 schrieb Michael Cree:
>>> On Mon, Apr 05, 2021 at 04:55:15PM +1200, Michael Cree wrote:
>>> On Sun, Apr 04, 2021 at 11:47:58PM -0500, Bob Tracy wrote:
>>>> On Wed, Mar 31, 2021 at 11:04:42AM +0200, Maciej W. Rozycki wrote:
>>>>>  I think the only feasible way of determining what has happened here i=
s
>>>>> that you track the offending change down by bisecting the upstream ker=
nel
>>>>> repository with `git bisect'.
>>>> That would normally be what I would do, and it may yet happen.  Problem=

>>>> is, I don't have a 64-bit system with enough disk space to do the kerne=
l
>>>> builds with a cross-compiler, and local (native) builds on the PWS are
>>>> taking 36+ hours each these days.  Unless I get *really* lucky with the=

>>>> bisects, the task will take a couple of weeks.
>>> Confirmed that v5.11.0 hard locks up on presenting the X-Desktop
>>> login screen whereas v5.10.0 is fine. This is on a XP1000 with
>>> a Radeon HD4350.
>> And the first bad commit is:
>>=20
>> 0fe3cf3a53b5c1205ec7d321be1185b075dff205 is the first bad commit
>> commit 0fe3cf3a53b5c1205ec7d321be1185b075dff205
>> Author: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Date:   Sat Oct 24 13:12:23 2020 +0200
>>=20
>>     drm/radeon: switch to new allocator v2
>>          It should be able to handle all cases here.
>>          v2: fix debugfs as well
>>          Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>>     Reviewed-by: Dave Airlie <airlied@redhat.com>
>>     Reviewed-by: Madhav Chauhan <madhav.chauhan@amd.com>
>>     Tested-by: Huang Rui <ray.huang@amd.com>
>>     Link: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fpatchwork.freedesktop.org%2Fpatch%2F397088%2F%3Fseries%3D83051%26rev%3D=
1&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Ce271ea2552a640dfec1408d8=
f81964a3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637532135545775310%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C2000&amp;sdata=3DUYwXgn6lAsES4q8p944kP0Y%2BGzqHRwSMXgrQvZXwXzM=
%3D&amp;reserved=3D0
>>=20
>> :040000 040000 4e643ef861b921392bc67be21a42298c91c7ff7a b36453567c3176a3c=
d50fa0b23886b0fd642560d M    drivers
>>=20
>> Cheers
>> Michael.
>=20
