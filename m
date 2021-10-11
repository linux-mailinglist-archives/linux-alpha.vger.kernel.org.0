Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA07428C72
	for <lists+linux-alpha@lfdr.de>; Mon, 11 Oct 2021 13:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236092AbhJKMB6 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 11 Oct 2021 08:01:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24031 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236036AbhJKMB5 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 11 Oct 2021 08:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633953597;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hwUIXMwF5ZMBaAs7PCxNKL8UZk5q2glV6KYJyh2b2Q4=;
        b=WSQukelTmKdtW4e8dVO4rBrkyOGQWO3Gk+teXh23DW3jHemasuuFgdsZGRzmnKMlB+tKvZ
        vIUXknHm9VJCeQGRpSvZnkXsbOff7IeVJrUgNcShJr14aEViJUj/UIMQpwM7XMpVnqsU0r
        mcEmWebzHmzFNsBkH6NmZWH4sqxwlok=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-1kPvptZPNpOei1ZgO8jA0g-1; Mon, 11 Oct 2021 07:59:25 -0400
X-MC-Unique: 1kPvptZPNpOei1ZgO8jA0g-1
Received: by mail-ed1-f71.google.com with SMTP id i7-20020a50d747000000b003db0225d219so15738661edj.0
        for <linux-alpha@vger.kernel.org>; Mon, 11 Oct 2021 04:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hwUIXMwF5ZMBaAs7PCxNKL8UZk5q2glV6KYJyh2b2Q4=;
        b=N5HNuP0ld7wQTd5nGzeuHvr4Gu5K92S0o56ADEo3n2DY/hM/hmxaFrhVr+aoYf57BK
         /qg3OsQShJtlWBJdWTqCppaQPVi8Ew3Zf2yAgu+3wndUB09yhx4TtHhrUdsTc3zdpnNv
         nnGMqFmd00Ug5muZamWb5hIaNZ1FwUfpJyvWG/IPnZD0+fy3Ik1c10oqrACwh6l1CfzN
         3Z5BG5/ionYogWmct5h4YajRq5cl2s++x9f0n07TMC1Q3XEJiAvf2Y4NEx+y0P2jk7y+
         uH+q623ijuQDYw5mH0Um72vCYkseTTI6ZrNT/FrmTpSpbYM+rY3ZmzERHhV1489I3IOL
         ZFTQ==
X-Gm-Message-State: AOAM530cDYDwT08D0PmwA/PPENaxlYIItsoG+VdyHjrw8+faysM6brBx
        nc3QP7OgI+z7bjr7oWxn4AFqWS1igJd933LMemDoIMCc5qtw483TF5Z595uLHzschmLg/RvJAry
        BOu8aYMR2o72LUUQ9o5HBE98=
X-Received: by 2002:a05:6402:90c:: with SMTP id g12mr1207530edz.139.1633953564693;
        Mon, 11 Oct 2021 04:59:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe9IbZEyN/NuCWBVGBR/HLcEv3Q4Zpk3pvSHKKh7mzddFCxZ4eLiFif7F1M5YGcdkOoPRk/g==
X-Received: by 2002:a05:6402:90c:: with SMTP id g12mr1207493edz.139.1633953564478;
        Mon, 11 Oct 2021 04:59:24 -0700 (PDT)
Received: from redhat.com ([2.55.159.57])
        by smtp.gmail.com with ESMTPSA id lb12sm3498129ejc.28.2021.10.11.04.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 04:59:23 -0700 (PDT)
Date:   Mon, 11 Oct 2021 07:59:17 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Andi Kleen <ak@linux.intel.com>
Cc:     Kuppuswamy Sathyanarayanan 
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
Message-ID: <20211011073614-mutt-send-email-mst@kernel.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org>
 <cec62ebb-87d7-d725-1096-2c97c5eedbc3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cec62ebb-87d7-d725-1096-2c97c5eedbc3@linux.intel.com>
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sun, Oct 10, 2021 at 03:22:39PM -0700, Andi Kleen wrote:
> 
> > To which Andi replied
> > 	One problem with removing the ioremap opt-in is that
> > 	it's still possible for drivers to get at devices without going through probe.
> > 
> > To which Greg replied:
> > https://lore.kernel.org/all/YVXBNJ431YIWwZdQ@kroah.com/
> > 	If there are in-kernel PCI drivers that do not do this, they need to be
> > 	fixed today.
> > 
> > Can you guys resolve the differences here?
> 
> 
> I addressed this in my other mail, but we may need more discussion.

Hopefully Greg will reply to that one.

> 
> > 
> > And once they are resolved, mention this in the commit log so
> > I don't get to re-read the series just to find out nothing
> > changed in this respect?
> > 
> > I frankly do not believe we are anywhere near being able to harden
> > an arbitrary kernel config against attack.
> 
> Why not? Device filter and the opt-ins together are a fairly strong
> mechanism.

Because it does not end with I/O operations, that's a trivial example.
module unloading is famous for being racy: I just re-read that part of
virtio drivers and sure enough we have bugs there, this is after
they have presumably been audited, so a TDX guest is better off
just disabling hot-unplug completely, and hotplug isn't far behind.
Malicious filesystems can exploit many linux systems unless
you take pains to limit what is mounted and how.
Networking devices tend to get into the default namespaces and can
do more or less whatever CAP_NET_ADMIN can.
Etc.
I am not saying this makes the effort worthless, I am saying userspace
better know very well what it's doing, and kernel better be
configured in a very specific way.

> And it's not that they're a lot of code or super complicated either.
> 
> You're essentially objecting to a single line change in your subsystem here.

Well I commented on the API patch, not the virtio patch.
If it's a way for a driver to say "I am hardened
and audited" then I guess it should at least say so. It has nothing
to do with host or sharing, that's an implementation detail,
and it obscures the actual limitations of the approach,
in that eventually in an ideal world all drivers would be secure
and use this API.

Yes, if that's the API that PCI gains then virtio will use it.


> > How about creating a defconfig that makes sense for TDX then?
> 
> TDX can be used in many different ways, I don't think a defconfig is
> practical.
> 
> In theory you could do some Kconfig dependency (at the pain point of having
> separate kernel binariees), but why not just do it at run time then if you
> maintain the list anyways. That's much easier and saner for everyone. In the
> past we usually always ended up with runtime mechanism for similar things
> anyways.
> 
> Also it turns out that the filter mechanisms are needed for some arch
> drivers which are not even configurable, so alone it's probably not enough,


I guess they aren't really needed though right, or you won't try to
filter them? So make them configurable?

> 
> > Anyone deviating from that better know what they are doing,
> > this API tweaking is just putting policy into the kernel  ...
> 
> Hardening drivers is kernel policy. It cannot be done anywhere else.
> 
> 
> -Andi

To clarify, the policy is which drivers to load into the kernel.

-- 
MST

