Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93A0742974D
	for <lists+linux-alpha@lfdr.de>; Mon, 11 Oct 2021 21:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234551AbhJKTLU (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 11 Oct 2021 15:11:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42149 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233481AbhJKTLT (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 11 Oct 2021 15:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633979359;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oZEQAOmKk6R+KRX2BzvVHC2H3CodKlCG/yzYUUC2zJA=;
        b=KwudnqNUzol5PC2894sI4uG23yAdPLAGs9D71BmLU2f1sO67SCq5ezRs0ddtPX9/roDXEF
        vt9nC3FQ5vwzV7E6nGWRVu2CNYq4TnGDtZMJE4zgfTsYOl7q+k/xB7cgf8kFOLjHHqYvk1
        g2bK/LrvgBfhbsZqn5BVXa5zWqitjnA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-q4EtZD15PPGPB-eQC7ZqsQ-1; Mon, 11 Oct 2021 15:09:17 -0400
X-MC-Unique: q4EtZD15PPGPB-eQC7ZqsQ-1
Received: by mail-ed1-f70.google.com with SMTP id 14-20020a508e4e000000b003d84544f33eso16746483edx.2
        for <linux-alpha@vger.kernel.org>; Mon, 11 Oct 2021 12:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oZEQAOmKk6R+KRX2BzvVHC2H3CodKlCG/yzYUUC2zJA=;
        b=qGKdrsGKKfa1mhovHrHXbYBn/i00+N+q2VQk0VHH5SBKuS1jX6S2+6rGRfb1NQaT7M
         Os3du/Gem538s4TklxFOEWsv4pzfzTkDb0/WgDt1PaCO6mjhvdXOxZzfQx+3r5qZAuCe
         z38S6Bo3UuGepzRRM9yjViXoWUJI4bo8qZmE7bIBTNnRRnfeVD55E8kkM7mAwwnO+VBJ
         XYSG1N42J2x7mEQ73wdoM01t4McGi5Q4fsGDoh5L7TV4Dk5kd5ffjpc3czD+YVBu0+eV
         Zv4Z+NulbUH9XnSAOFkedThl+H5W0Xzr28/awaxX+KtR2h3T/e0QCMZlPVo7pqlEeQxt
         gchA==
X-Gm-Message-State: AOAM5319EpjtrueSSgrw6a7gvsb6Ye+ixtlVHORMPN/DV/wwn6PB4nFZ
        brFyNA52/WZ6c9+xg0isCfNvc50L1P49VcDRL6Q+uZUjanAswLeTtgCy4wUA/yUVTmeoPwUy12O
        lhbeAN43nvvGrd8MHwq7dEjs=
X-Received: by 2002:aa7:c38b:: with SMTP id k11mr4113139edq.79.1633979356727;
        Mon, 11 Oct 2021 12:09:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGboOz6J9azwkeciPdL9sKClCOiUS/XGJc/PjIe5OTL3dASYPSk/hflbIEKyA9zwBTklJK0A==
X-Received: by 2002:aa7:c38b:: with SMTP id k11mr4113103edq.79.1633979356541;
        Mon, 11 Oct 2021 12:09:16 -0700 (PDT)
Received: from redhat.com ([2.55.159.57])
        by smtp.gmail.com with ESMTPSA id z4sm5250327edd.46.2021.10.11.12.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 12:09:15 -0700 (PDT)
Date:   Mon, 11 Oct 2021 15:09:09 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Andi Kleen <ak@linux.intel.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Richard Henderson <rth@twiddle.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        James E J Bottomley <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S . Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter H Anvin <hpa@zytor.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Message-ID: <20211011142956-mutt-send-email-mst@kernel.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <YWPunfa+WK86Cgnv@infradead.org>
 <a070274e-6a3a-fb0a-68ff-d320d0729377@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a070274e-6a3a-fb0a-68ff-d320d0729377@linux.intel.com>
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Mon, Oct 11, 2021 at 10:23:00AM -0700, Andi Kleen wrote:
> 
> On 10/11/2021 12:58 AM, Christoph Hellwig wrote:
> > Just as last time:  This does not make any sense.  ioremap is shared
> > by definition.
> 
> It's not necessarily shared with the host for confidential computing: for
> example BIOS mappings definitely should not be shared, but they're using
> ioremap today.

That just needs to be fixed.

> But if you have a better term please propose something. I tried to clarify
> it with "shared_host", but I don't know a better term.
> 
> 
> -Andi
> 


The reason we have trouble is that it's not clear what does the API mean
outside the realm of TDX.
If we really, truly want an API that says "ioremap and it's a hardened
driver" then I guess ioremap_hardened_driver is what you want.

-- 
MST

