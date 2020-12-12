Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B962D87E2
	for <lists+linux-alpha@lfdr.de>; Sat, 12 Dec 2020 17:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407510AbgLLQSQ (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 12 Dec 2020 11:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392473AbgLLQRZ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 12 Dec 2020 11:17:25 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741B6C0613CF
        for <linux-alpha@vger.kernel.org>; Sat, 12 Dec 2020 08:16:45 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id x12so5842747plr.10
        for <linux-alpha@vger.kernel.org>; Sat, 12 Dec 2020 08:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b0rAOZsxZdjcq1aaJb1C05KPrkqpKvcEQxgTLsgMxKU=;
        b=CrR07OntPIZTR7d4wnZ9J5UOuDZq6gLOR5OIJYSjeEuAp8KtWt3+7GsvQEeD1PLDN0
         kw5pg8sdwEcDBGENZKJbon36gZNQ/dH5oJEr1For6xRNmkF9rVDkTISTbjrxy40KkOcb
         PgjbhM2Pji+OZCFbF+DKvC+wxz+unHR68g+NYenZbtxiSGcCMing0QlnXgCCJWEoJGBz
         WyU1PI236NBc8ygH5YlefXYPdy/TNIxTaEyV086+DRKGdiW6PaDV9I0e16SWDpsX2HQm
         hlyy4lV+SE38CsrNSKtKvGpnOrRN/mU/tNWmnP7DXbUPLhni+SakkD/pagRCznZTfAvG
         Et0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b0rAOZsxZdjcq1aaJb1C05KPrkqpKvcEQxgTLsgMxKU=;
        b=SBuejudl5qrB5moBQ6HK7wnkZTRWmaBh5izkEE+Vtq5k+V7FZVY7OwmIJ/U8icJJ1o
         f4v788UF7fWYLb9hq2X+rNRnnYBhpQQopt8VvQ+hzMxlRi7vlcMTZg+nUnbdly39Z291
         OfQvwk95uP9tZX83OWMFd3a051rDtgeiqzD/kpzkqIB6TcKIKe5QaIL5P4ursmOO6pF5
         yTsBXrWJbPsGoxS3xcamFeyxW+gwG8WStiYdlxLk7IiGglIr0jI8ApyNsl8GexslLxum
         8MR+osPJxaOw1H0XcMYamXLx1kWDt0FPTeWrfjZ2D3z0S42rhmaU/FTdv+WvOMcy2I5T
         67nw==
X-Gm-Message-State: AOAM5327QvCn3YLACmXAKjb1LEWSe4qXs0+Cc53aT4okkjQjNAbRe66W
        oZtJD/oEmiS4fu9frv5or+NDAg==
X-Google-Smtp-Source: ABdhPJwbgyulSYVGxK5wutxsYcY6/o5J1K01Cyr0carGapyBJww5CkFZJKiR/zLIQneq8z1NaskzsQ==
X-Received: by 2002:a17:902:7001:b029:da:bbb6:c7e2 with SMTP id y1-20020a1709027001b02900dabbb6c7e2mr15676291plk.50.1607789805012;
        Sat, 12 Dec 2020 08:16:45 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id u124sm15312511pfb.171.2020.12.12.08.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Dec 2020 08:16:44 -0800 (PST)
Subject: Re: [PATCH] alpha: add support for TIF_NOTIFY_SIGNAL
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>
References: <20201212153514.GA108207@roeck-us.net>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <0c2dabaa-4bc5-fda2-6317-a5c273d2caf5@kernel.dk>
Date:   Sat, 12 Dec 2020 09:16:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201212153514.GA108207@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On 12/12/20 8:35 AM, Guenter Roeck wrote:
> On Thu, Oct 08, 2020 at 09:11:42AM -0600, Jens Axboe wrote:
>> Wire up TIF_NOTIFY_SIGNAL handling for alpha.
>>
>> Cc: linux-alpha@vger.kernel.org
>> Signed-off-by: Jens Axboe <axboe@kernel.dk>
>> ---
> ...
>>  work_pending:
>> -	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING, $2
>> +	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING, | _TIF_NOTIFY_SIGNAL, $2
>                                                          ^^^^^
> 
> Does this compile anywhere ?

Fixed up, thanks.

-- 
Jens Axboe

