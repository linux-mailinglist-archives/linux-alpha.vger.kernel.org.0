Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03E3B689BD5
	for <lists+linux-alpha@lfdr.de>; Fri,  3 Feb 2023 15:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233831AbjBCOdE (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 3 Feb 2023 09:33:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233656AbjBCOcy (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Fri, 3 Feb 2023 09:32:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30DBA42BB
        for <linux-alpha@vger.kernel.org>; Fri,  3 Feb 2023 06:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675434697;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/decAsXzWzOr1Fn5getBDCGr7TKXQO+f4q0N0MxWErI=;
        b=A2t109/yTXLOQ7tcfcBaBddd5w1h6mW4obqM9xZpsk3Fd0BvOmYoaCX+eWZTACR2DBxVuy
        h5agvau6d5Em5bsbT2t3iqSNJmfy6uxTGWYdlt9hUiHPzzYUIqHBL6Yg8roAqxoTfpeooF
        1e9s/f9jpVKdbUh5paPBhSIYtL+LbtA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-484-CL2Upr0EMgWtGNgMagWEJA-1; Fri, 03 Feb 2023 09:31:36 -0500
X-MC-Unique: CL2Upr0EMgWtGNgMagWEJA-1
Received: by mail-wr1-f72.google.com with SMTP id g15-20020adfd1ef000000b002c3daec14f3so116357wrd.3
        for <linux-alpha@vger.kernel.org>; Fri, 03 Feb 2023 06:31:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/decAsXzWzOr1Fn5getBDCGr7TKXQO+f4q0N0MxWErI=;
        b=xVogimy7H3nkJ9HXZkA8uWE2DeOIi0bSe5ZbUfwz8ZsfGspLOcGCnXG5WsgmhVKGi1
         yNUkbwikw72uosn6IZQEzGqGcYYbre1L3jayp0N7bfYJMXS4bUw0wkp3Sbde9BkkuIpZ
         lzDJMpCthBXg91ep8NPQuJOAnw6sigNGbOMK8u97k4iMVPWuF/EzcmIi4dtNfOOEdyOa
         SUAkxZLkYt6+4ORGsa7NPmWQPUnCCSR/inKfHx3ptpJ9ecJaovZ7+WuTJF82dXF3z0qa
         fnFfKrPOvTDXEJu5qkz4fethkXLsKYR5xDrxbwpheUrirHKA6jDW2196FWXeJh44werv
         OF5g==
X-Gm-Message-State: AO0yUKWBu32ytWT7+XkhqBpXORNmq/14GqaBMDg8OESekZoBDVa4n94c
        wRhR+UIo2YybyJkBop8GDy91NFO/h4Jin6EECDp/F7pq7zHnMUPbnVQz5eLYsENRg1qhBnq1oJZ
        VIUEVffGATzCa55fsxDRBSFo=
X-Received: by 2002:a05:600c:4747:b0:3df:e549:bd27 with SMTP id w7-20020a05600c474700b003dfe549bd27mr3634996wmo.6.1675434695224;
        Fri, 03 Feb 2023 06:31:35 -0800 (PST)
X-Google-Smtp-Source: AK7set/qkaMfF+TBCgvbwgP2CGu2sIJoLRpl09HLMUmy0eiiBTILy4lbS6cT+HBgr82lyryc+pIpNQ==
X-Received: by 2002:a05:600c:4747:b0:3df:e549:bd27 with SMTP id w7-20020a05600c474700b003dfe549bd27mr3634941wmo.6.1675434694897;
        Fri, 03 Feb 2023 06:31:34 -0800 (PST)
Received: from [192.168.3.108] (p5b0c6376.dip0.t-ipconnect.de. [91.12.99.118])
        by smtp.gmail.com with ESMTPSA id q9-20020a1ce909000000b003dc34edacf8sm7704293wmc.31.2023.02.03.06.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 06:31:34 -0800 (PST)
Message-ID: <1d13abeb-ea4b-6314-2fd2-1b86b8f4d6c5@redhat.com>
Date:   Fri, 3 Feb 2023 15:31:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/4] mips: drop definition of pfn_valid() for
 DISCONTIGMEM
Content-Language: en-US
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <monstr@monstr.eu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rich Felker <dalias@libc.org>,
        Richard Weinberger <richard@nod.at>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vineet Gupta <vgupta@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
        openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
        x86@kernel.org
References: <20230129124235.209895-1-rppt@kernel.org>
 <20230129124235.209895-4-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230129124235.209895-4-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On 29.01.23 13:42, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> There is stale definition of pfn_valid() for DISCONTINGMEM memory model
> guarded !FLATMEM && !SPARSEMEM && NUMA ifdefery.
> 
> Remove everything but definition of pfn_valid() for FLATMEM.
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

