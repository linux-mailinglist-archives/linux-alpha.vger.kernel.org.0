Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8216F33B270
	for <lists+linux-alpha@lfdr.de>; Mon, 15 Mar 2021 13:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbhCOMWi (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 15 Mar 2021 08:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbhCOMWL (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 15 Mar 2021 08:22:11 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A56C06175F
        for <linux-alpha@vger.kernel.org>; Mon, 15 Mar 2021 05:22:11 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id z25so15945116lja.3
        for <linux-alpha@vger.kernel.org>; Mon, 15 Mar 2021 05:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NTc0pSC6ULv7Oqo3W3BMnNj1V6ogGKFoV43UcdG1gw0=;
        b=pj9oJ7H41ug5yJ5S6H0nmrDTorRFP5qpfgv8i0hsLgLSj6j5PjG4r6CtBYKYzFwGQ7
         qUwbmG/8/o72CrhYOuy1punTJ8eK8uXtrdScLOXhZqHigyzjZUkihsGUq4xZefGGdJyJ
         275Qs7hRExo2D1+cRyIGrQJ6i4ctnY1t01+0PJ6CKUa2AlaACxmAEx0k8rYtovkkg4lP
         l1xe1r6L8Z9HbZcmF3rYR+SPpPKz6i2+3Ny1STnPMThtmy5e0onayZVYWo+QbcgfkMHc
         xxoSTqoI9G0vymB+Dbv7E8Hbo2tjTUaTbVKY7ml8UnFXGPXy5tYMAX1HVhaerXR5DKSJ
         d5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NTc0pSC6ULv7Oqo3W3BMnNj1V6ogGKFoV43UcdG1gw0=;
        b=V8mY2bBXFbYKeOjHyyBALEXE+k3SwmLMRU5IIfPFtZNxsZFPWrEQ5vpS+/u4nC+p2T
         ei06By5wrBBLqgR6UMl0l4gfw97eEC5wlU4uIQkTg1OpeBRbhwP1ifrhf0OG7CWAf+MJ
         wwfc3rk6iTM1s71wdv4SVmfuduX+Sfb95Yy1yhj3RDZUxtfvzr6Acc6Aw21Hc6g/YUi5
         q/M7vbHYbfqU6LwxFcA4M6oTB6GftaXeq7oLFb+YeUJmT+8qL1TrKcm9f6dHq1BkanwO
         G/ItkIFoZIMEJA9uzw7fZ2VIfPHaVKaX0yWw2rkPSZabz/3fcxbfBepls+z0MorcJZcy
         Cwew==
X-Gm-Message-State: AOAM530yIYku95ZnP5yvuswIkVCEiN+Ryf6z1IViIQzCnw1+FcyLUurh
        k1bwILpPzEvu5r39bga7L5YIvw==
X-Google-Smtp-Source: ABdhPJzu4p8O5vMCnNYyq9XJrAyKlX9q99oPAsslS1Z6FvBBad1lCG5p6v0yCrHOhq3WAkMZ4COeEA==
X-Received: by 2002:a2e:998d:: with SMTP id w13mr10078959lji.424.1615810929909;
        Mon, 15 Mar 2021 05:22:09 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id f8sm2688995lfs.143.2021.03.15.05.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 05:22:09 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 9FE7010246E; Mon, 15 Mar 2021 15:22:13 +0300 (+03)
Date:   Mon, 15 Mar 2021 15:22:13 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dave Hansen <dave.hansen@intel.com>,
        Hugh Dickins <hughd@google.com>,
        Rik van Riel <riel@surriel.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Peter Xu <peterx@redhat.com>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org, Linux API <linux-api@vger.kernel.org>
Subject: Re: [PATCH RFCv2] mm/madvise: introduce MADV_POPULATE_(READ|WRITE)
 to prefault/prealloc memory
Message-ID: <20210315122213.k52wtlbbhsw42pks@box>
References: <20210308164520.18323-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308164520.18323-1-david@redhat.com>
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Mon, Mar 08, 2021 at 05:45:20PM +0100, David Hildenbrand wrote:
> +			case -EHWPOISON: /* Skip over any poisoned pages. */
> +				start += PAGE_SIZE;
> +				continue;

Why is it good approach? It's not abvious to me.

-- 
 Kirill A. Shutemov
