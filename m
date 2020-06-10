Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F56D1F5974
	for <lists+linux-alpha@lfdr.de>; Wed, 10 Jun 2020 18:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729104AbgFJQul (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 10 Jun 2020 12:50:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45046 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729072AbgFJQuk (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 10 Jun 2020 12:50:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591807839;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EMwUauau342Zml1K34QLPe12sp1DuwpV44r+JLoVGLk=;
        b=bAlB9IWRYrTNZTFrMn7pcoE2jUGjnl7OX6Gvvnr0WFx8gDX1YJ7BKrKk2wQqO1rNbtJVbn
        nZr34n7Hg465CM1l12cTLT1ao0/BfAH/XI3ygnX2DPuW2q0LHstaft/HfVLiy73hfB3AQz
        kOgQl/fxmeAaWc0tFRVaTNMi9XE8+ig=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-_XqO1o5HMTeoOq-QZasJDw-1; Wed, 10 Jun 2020 12:50:28 -0400
X-MC-Unique: _XqO1o5HMTeoOq-QZasJDw-1
Received: by mail-qv1-f71.google.com with SMTP id d5so2326617qvo.3
        for <linux-alpha@vger.kernel.org>; Wed, 10 Jun 2020 09:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EMwUauau342Zml1K34QLPe12sp1DuwpV44r+JLoVGLk=;
        b=L7Ih8Jt5n6G5jw5D5vJvdCOkIUXwIFZF62cIO39zBJHGlJCO52g+eGcYR0avlEb17V
         slXvJa6QXyztukU+jPkPy6DP5/OYzyVPKJH9j2gWc2H1taQAZvK2jSZcOqFhmtcR4MB1
         LhKAA+ZWJvSmFh5lMAT/l0eRst7IDUgR06wKkNWl4NmVEvfNa4z4t3dVpRj2K4wHh/T5
         TcF3ntaegXuc8x8ONY3R14N3Df9NiCTkA8KticCu41NJ3aKnzPHQB+/C9L9eZxd+HkAS
         21HBr5r3TSThvUkeSrOh/hYi2GBOV86sF64pLjXsRz1wlTiAhc1MHwTTOutmq3bRNTUP
         nF6Q==
X-Gm-Message-State: AOAM532iH69DQm/eqF4g3hN8c1I0zAcMysC6uS5wVn0rlPXEpX58JQaB
        7KkRfW2oUQyu0SVK9xkCmS3ZGYDETRrO8a4gLTrSSYLBpQVkxfBNxJ7s3Jws7vrwQL5YFVrpjHU
        WahePKjNp0l0HsxQSQGKiLdA=
X-Received: by 2002:a37:9cc7:: with SMTP id f190mr3987562qke.236.1591807826873;
        Wed, 10 Jun 2020 09:50:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn20TLNz7hD3Ni4blZzJN/2PX0jI8mrO6z2/UHNbD+ObHKXkY/kSbOK73eCMc/XFP0Ereokw==
X-Received: by 2002:a37:9cc7:: with SMTP id f190mr3987535qke.236.1591807826580;
        Wed, 10 Jun 2020 09:50:26 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id 207sm149672qki.134.2020.06.10.09.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 09:50:25 -0700 (PDT)
Date:   Wed, 10 Jun 2020 12:50:23 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Gerald Schaefer <gerald.schaefer@de.ibm.com>
Cc:     linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        Guan Xuetao <gxt@pku.edu.cn>, linux-xtensa@linux-xtensa.org,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: Possible duplicate page fault accounting on some archs after
 commit 4064b9827063
Message-ID: <20200610165023.GA67179@xz-x1>
References: <20200610174811.44b94525@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200610174811.44b94525@thinkpad>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Wed, Jun 10, 2020 at 05:48:11PM +0200, Gerald Schaefer wrote:
> Hi,

Hi, Gerald,

> 
> Some architectures have their page fault accounting code inside the fault
> retry loop, and rely on only going through that code once. Before commit
> 4064b9827063 ("mm: allow VM_FAULT_RETRY for multiple times"), that was
> ensured by testing for and clearing FAULT_FLAG_ALLOW_RETRY.
> 
> That commit had to remove the clearing of FAULT_FLAG_ALLOW_RETRY for all
> architectures, and introduced a subtle change to page fault accounting
> logic in the affected archs. It is now possible to go through the retry
> loop multiple times, and the affected archs would then account multiple
> page faults instead of just one.
> 
> This was found by coincidence in s390 code, and a quick check showed that
> there are quite a lot of other architectures that seem to be affected in a
> similar way. I'm preparing a fix for s390, by moving the accounting behind
> the retry loop, similar to x86. It is not completely straight-forward, so
> I leave the fix for other archs to the respective maintainers.

Sorry for not noticing this before.  The accounting part should definitely be
put at least into a check against fault_flag_allow_retry_first() to mimic what
was done before.  And I agree it would be even better to put it after the retry
logic, so if any of the page faults gets a major fault, it'll be accounted as a
major fault which makes more sense to me, just like what x86 is doing now with:

	major |= fault & VM_FAULT_MAJOR;

I'm not sure what's the preference of the arch maintainers, just let me know if
it's preferred to use a single series to address this issue for all affected
archs (or the archs besides s390), then I'll do.

Thanks!

-- 
Peter Xu

