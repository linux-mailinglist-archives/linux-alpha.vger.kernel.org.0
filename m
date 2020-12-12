Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68C22D8750
	for <lists+linux-alpha@lfdr.de>; Sat, 12 Dec 2020 16:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388395AbgLLPf5 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 12 Dec 2020 10:35:57 -0500
Received: from gproxy5-pub.mail.unifiedlayer.com ([67.222.38.55]:58927 "EHLO
        gproxy5-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727513AbgLLPf5 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 12 Dec 2020 10:35:57 -0500
Received: from cmgw14.unifiedlayer.com (unknown [10.9.0.14])
        by gproxy5.mail.unifiedlayer.com (Postfix) with ESMTP id A9D071404C6
        for <linux-alpha@vger.kernel.org>; Sat, 12 Dec 2020 08:35:16 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id o6vUkz94LwNNlo6vUk9d5N; Sat, 12 Dec 2020 08:35:16 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=C+zHNzH+ c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=VwQbUJbxAAAA:8
 a=_N_qNhaSy4ZqAeyhv9IA:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:
        To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=9Un3ww/7W/No9l18pClV/LJRznqez7VBBMPQINwNKQ8=; b=KdTYmdQG/zNxQEUK41hQiG+dDq
        PYslk46HVsbt40Cqw4PNpBkKDRatn6CgxaE/X5Ub+XaCnkxORQUSyJKDCOOPf2UykNkNK9cLnuj0v
        6uHJVoqGaebWJaH9XLBi9Ry/qds06usQmiC6vVbR1WM3vx62ytdKjdqsUeNpjQKJ5xMzwy7hJUAvM
        qVF7sDcsQ/J0JKbGKxbsHAu9EBQdunm9Vpse9ljlmeNFFV/it/KcvSdOxttXT+p2zzQCX5QnWo8Lf
        TVPC33N3Qent8mzrnPoLoa/1eikrlPsDserchGkIxceK9bOuQiSLI8Q6Du9HYHv7DZQHIRiVR5AbO
        M1acpqeg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:49626 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1ko6vT-002do8-Lo; Sat, 12 Dec 2020 15:35:15 +0000
Date:   Sat, 12 Dec 2020 07:35:14 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: [PATCH] alpha: add support for TIF_NOTIFY_SIGNAL
Message-ID: <20201212153514.GA108207@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1ko6vT-002do8-Lo
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:49626
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, Oct 08, 2020 at 09:11:42AM -0600, Jens Axboe wrote:
> Wire up TIF_NOTIFY_SIGNAL handling for alpha.
> 
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---
...
>  work_pending:
> -	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING, $2
> +	and	$17, _TIF_NOTIFY_RESUME | _TIF_SIGPENDING, | _TIF_NOTIFY_SIGNAL, $2
                                                         ^^^^^

Does this compile anywhere ?

Guenter
