Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22A131418C1
	for <lists+linux-alpha@lfdr.de>; Sat, 18 Jan 2020 18:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgARReI (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 18 Jan 2020 12:34:08 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:43555 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbgARReI (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 18 Jan 2020 12:34:08 -0500
Received: by mail-il1-f196.google.com with SMTP id v69so23961496ili.10
        for <linux-alpha@vger.kernel.org>; Sat, 18 Jan 2020 09:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9tUAoCwhp0dfYV2D/9/Oxal+PAva8/9zH6uW3Dt8MGw=;
        b=WJoWHrQnVmKbzVVBrZiYUDP7sfl2ugf5FGCxaBajE0Gr3KTrdzfRJbDsA1LXE3nzKS
         Tugy4NrrFPjZcSO4vhsNxgpdVtxQYyBZHqaUhJ3Gme6PYVmZtUSIbeMlpA3NxK1/O/OF
         EhiFe5NKQk4pRNaICqPCsOK+lOFB04AvIrxNkggmnB0blivy5+TUlYVjrVgKVPhnUv6t
         63bGVODhCk2buL9OZuIaJfrop34MonXT8UZeeXBJJ1bzi2kvqS2Nfb0NYePpyfwWpOb1
         UuxAEIJ4QkN1tUSlaXP4/RujQB0p+tymUpSjh1ghO9TeH6I+9wg5rxrwugVcIJde9GOr
         7fyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9tUAoCwhp0dfYV2D/9/Oxal+PAva8/9zH6uW3Dt8MGw=;
        b=exfrM7DV2ZhOnt6eecUekQW780RHzYPCNZf6yoICMhjRv9BLASIAH35E4e1b6WxBP3
         nZu/grMRt94WpLIC96JbhMt9+Q7Eo8gXWqRHr1X/rJtbddiVwTM/lcGjzNxZwS4ryJsO
         gcQJJsTZ4NhMlg7Sixev79LxDWQ+UjrXljqxBeo1YSNRQEGy7J2xSWcQz/TvCChsf1Cs
         Bde+zTyGFkyweSixi7sMG55cC7BxV/M7kr7BbObUNrJ477PUpv7mKdtBxr5r2O97owXD
         JsXCIl38yyR7o8nOabLn61D7dZQqrACshHPRMzUPRbMX0FJecocdaX5Lfp+ikbxR38Tf
         HmpQ==
X-Gm-Message-State: APjAAAV7Ulq0poXGixf7MIpzXXZ3MWHDRYgJyPo9T2M7mN7wJCQ6FDyB
        tbNlcWojD6ga6eOUWlC3vjoRnsn4RqgzjvRkt254pQeb
X-Google-Smtp-Source: APXvYqyHCMAPFBTUkVa7+Lah/9ityuJvL4hS/O2ERg15z+BKw0Tag818o9477PUh+SiU6FhtKTCpuIlqZ/jaHIsQMao=
X-Received: by 2002:a92:7787:: with SMTP id s129mr3816214ilc.129.1579368847344;
 Sat, 18 Jan 2020 09:34:07 -0800 (PST)
MIME-Version: 1.0
References: <20200118160623.GA2136@gherkin.frus.com> <b656550f-76aa-c437-d3d9-36a868b8f093@physik.fu-berlin.de>
In-Reply-To: <b656550f-76aa-c437-d3d9-36a868b8f093@physik.fu-berlin.de>
From:   Witold Baryluk <witold.baryluk@gmail.com>
Date:   Sat, 18 Jan 2020 17:33:31 +0000
Message-ID: <CAEGMnwooY_KiNzdwUMnQ2k6GyK8884BYAw0-HjrdJGtbnz2PgA@mail.gmail.com>
Subject: Re: dbus-daemon unaligned accesses
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Bob Tracy <rct@frus.com>, debian-alpha@lists.debian.org,
        linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=932381


On Sat, 18 Jan 2020 at 16:36, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Bob!
>
> On 1/18/20 5:06 PM, Bob Tracy wrote:
> > If no one else is actively working to fix this annoyance, I'll see what
> > I can do.  For me, it's mostly a matter of finding the time to download
> > the source package and its dependencies, build a debug version with
> > symbols in it that "gdb" can use, and then *maybe* figure out the best
> > way to code around the unaligned access.
>
> I'm busy with a lot of other things but I am well aware of this issue. You
> can silence the noise with "dmesg -n1".
>
> Otherwise, it would be greatly appreciated if you could work on a patch to
> fix this issue.
>
> Adrian
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer - glaubitz@debian.org
> `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
>
