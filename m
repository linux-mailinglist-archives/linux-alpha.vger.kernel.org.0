Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF73142089
	for <lists+linux-alpha@lfdr.de>; Sun, 19 Jan 2020 23:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbgASWn0 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 19 Jan 2020 17:43:26 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:46872 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728819AbgASWn0 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sun, 19 Jan 2020 17:43:26 -0500
Received: by mail-il1-f193.google.com with SMTP id t17so25739226ilm.13
        for <linux-alpha@vger.kernel.org>; Sun, 19 Jan 2020 14:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rc9XKr+ebrXKOAW0KmHjQ8cfG01tqx6rVgon3ztCywg=;
        b=YqEM56hawo8vBZm9VbSTGrAF3IKcyJr7Rc3x1eG1dR0IUSR+3aBNzqfrKs7oiYU40i
         t/wNqG0gvNyamjNE0L2xm8rVO9Z/JcpVJsFAeNezerZvBkON3lMEnxGi7zOaPqg2h/Qz
         Nfw0GC2BoVNaML/e+/Vpa+N/ZULtVCoMbaeeEPOaNsElnko+FDJwOUQDsLvJy3NdRLe+
         2SAyFZ0GtlOYCOu3mOklJJ1fdblmutmEs+mnVZpQQBi7h+ETMLzF4DlwdBP2lQnKBjTg
         XNLWjI2SNh8EDPCVjUTVyCJeeZ8CooxxEYS8pmM8c2gOwzFk8fHs2GqJ13v/NIg++ixp
         g9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rc9XKr+ebrXKOAW0KmHjQ8cfG01tqx6rVgon3ztCywg=;
        b=ecAv3v89zpG62zTtxU2WLVxD0aogLhB48JhbbHmqmTZ4NlkZ8GieBGwwHMcbXeE77N
         rdChSpuI/Z14FiFc2NpOFvK56nd5VXns0yMq8dUBL26XnXYAqjwsW+Ei/7BNDAT4jG0I
         PZlGJHyKYtRZNjDtoIU9ENZYYIoFFPJRYioTIcTUhMe9je5xBSaAOMuzHg/xV83ysiZP
         Wy3JJVix3Q3DgRoXMAiFIvYER4n0Apn1d5RwXD3s+4VgMSLCUbbG73ZXR0FI6Jql8+X6
         LiYIBmJ4zRC6pu9dEHLXr6tGQg5ojvMfDn0Gw3zo9T92JebEKOAjgo+IHqKQD1mfX2uE
         IOEA==
X-Gm-Message-State: APjAAAWTDQstfDOGPoTgEct66WeZqVmMMQizaj9kHqIZqwNCqB89QApM
        B5wRzXSj+LrNUqvHQrszb8c7elqUcg939aHfqdE=
X-Google-Smtp-Source: APXvYqwzHPTYrMc0saKruVaqezxmOAbbw/yy59zK7IGhgSKrybserYGONaCp9ipTNjDHCmVEUasvIrvIdRXLwJKTKsQ=
X-Received: by 2002:a92:af4b:: with SMTP id n72mr8509486ili.288.1579473805356;
 Sun, 19 Jan 2020 14:43:25 -0800 (PST)
MIME-Version: 1.0
References: <20200118160623.GA2136@gherkin.frus.com> <b656550f-76aa-c437-d3d9-36a868b8f093@physik.fu-berlin.de>
 <CAEGMnwooY_KiNzdwUMnQ2k6GyK8884BYAw0-HjrdJGtbnz2PgA@mail.gmail.com> <20200119054916.GA7215@gherkin.frus.com>
In-Reply-To: <20200119054916.GA7215@gherkin.frus.com>
From:   Witold Baryluk <witold.baryluk@gmail.com>
Date:   Sun, 19 Jan 2020 22:42:49 +0000
Message-ID: <CAEGMnwr+FpftLRiEtctz1M62q3OV3PsDxm6V4B5e7CA+R0T8gg@mail.gmail.com>
Subject: Re: dbus-daemon unaligned accesses
To:     Bob Tracy <rct@frus.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Yes, it works.

The suggested one line change did work and fixed the issue for me.

I didn't have time to ask for it to be merged.

On Sun, 19 Jan 2020, 06:49 Bob Tracy, <rct@frus.com> wrote:
>
> On Sat, Jan 18, 2020 at 05:33:31PM +0000, Witold Baryluk wrote:
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=932381
>
> At first glance, that certainly appears to be the issue.  The
> conversation seems to have stalled-out as of July 2019.
>
> memcpy() looks to be a good way of handling the problem, for the
> reasons mentioned.  Did you try that fix?  If so, did it work for you?
>
> --Bob
