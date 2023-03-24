Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF6D6C7AD3
	for <lists+linux-alpha@lfdr.de>; Fri, 24 Mar 2023 10:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbjCXJJH (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 24 Mar 2023 05:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232056AbjCXJI5 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 24 Mar 2023 05:08:57 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B58BBA7
        for <linux-alpha@vger.kernel.org>; Fri, 24 Mar 2023 02:08:45 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id p34so674581wms.3
        for <linux-alpha@vger.kernel.org>; Fri, 24 Mar 2023 02:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679648924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tl24kxujrDRhD/Pw1VxqIQuGTyFCOtjGuHoJAXogeUQ=;
        b=KF7vhgGUy9iSCVz/2JMV95cnXXiwuET9tU7Rc7Ha4nCWlEtjrRR52AkRL3JFzV31N8
         FvBvjTemrQpnvLLevT/7WRHrnq6vQTjJaal/zyxaU9lnhkPgeE4ZxxrwnrSeYP5XXpBc
         4V7jndgKaulVRlh2NX+8aC2vQ132DHHauBUvo9d076iWPZ097+573LyCG57UyqnF/weQ
         Wl0cANOGoKc/C+uNjEJ93bVBXPTZ7IkGYmTVHGwGkHxXXK4MlPEb6KAWoXYRQNmd8+4H
         wQFnUqtZsqyWz/Sra/sxWYXnULQ6q5z/LE5eyV19WnrETSaXYW26jzEB3xzi7XfnA3JF
         5cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679648924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tl24kxujrDRhD/Pw1VxqIQuGTyFCOtjGuHoJAXogeUQ=;
        b=jia+Wh5Qbg/VY4DFZh0INO81IId0ETcwk3c5vPnb+l8XUVyQH/vhW6tl09XEOVfmO1
         sv2UdJRgBalYU7RHca3EqGaIzHm1KozWwyMNUGz5iskeGsrGmAUUAJcCbn8d66GBL2Fj
         WkZkTtvnRkgIENs9gRjSbIk2Vn8sIvqhsPT3I3lnXBkXGhzJLa3U09ImtvnvVsfrPfTV
         n+8kNUO9BCyJwjB+1mq9D1gYHx80KdKrU3RGDO6jA8kd8nvVlhDE+A5ki2KpSybE8lJZ
         A1ogUhpNELShakrdR+4JXb5UQmg9zFzKXLYNMjpxDdYcLmNobZbGt3yoL1I+HO0yk8vO
         IB0w==
X-Gm-Message-State: AO0yUKW1gfliBiEDKT9ML5Qr/l+fxK3os5KoQPqfOJXM4X7S7GkwnBeV
        hRCCJIudCWEVD/werROwUkoXdw==
X-Google-Smtp-Source: AK7set/vvjAUaOTR5nW6O5SRtNoHqTNaeTjKsckBwHxq1C38GOKprexc3eF5NaIoYwtOC0bG/ZduEw==
X-Received: by 2002:a05:600c:c4:b0:3ed:b048:73f4 with SMTP id u4-20020a05600c00c400b003edb04873f4mr1903820wmm.5.1679648924434;
        Fri, 24 Mar 2023 02:08:44 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.149])
        by smtp.gmail.com with ESMTPSA id z5-20020a7bc7c5000000b003ee1b2ab9a0sm4306039wmk.11.2023.03.24.02.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 02:08:43 -0700 (PDT)
Message-ID: <1722e75c-bc06-4a34-5e12-fa3622ed86a3@linaro.org>
Date:   Fri, 24 Mar 2023 10:08:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v7 6/6] PCI: Make use of pci_resource_n()
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Bjorn Helgaas <helgaas@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Juergen Gross <jgross@suse.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-pci@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Anatolij Gustschin <agust@denx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
 <20230323173610.60442-7-andriy.shevchenko@linux.intel.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230323173610.60442-7-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On 23/3/23 18:36, Andy Shevchenko wrote:
> Replace open-coded implementations of pci_resource_n() in pci.h.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   include/linux/pci.h | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 70a4684d5f26..9539cf63fe5e 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2006,14 +2006,12 @@ int pci_iobar_pfn(struct pci_dev *pdev, int bar, struct vm_area_struct *vma);
>    * for accessing popular PCI BAR info
>    */
>   #define pci_resource_n(dev, bar)	(&(dev)->resource[(bar)])
> -#define pci_resource_start(dev, bar)	((dev)->resource[(bar)].start)
> -#define pci_resource_end(dev, bar)	((dev)->resource[(bar)].end)
> -#define pci_resource_flags(dev, bar)	((dev)->resource[(bar)].flags)
> -#define pci_resource_len(dev,bar) \
> -	((pci_resource_end((dev), (bar)) == 0) ? 0 :	\
> -							\
> -	 (pci_resource_end((dev), (bar)) -		\
> -	  pci_resource_start((dev), (bar)) + 1))
> +#define pci_resource_start(dev, bar)	(pci_resource_n(dev, bar)->start)
> +#define pci_resource_end(dev, bar)	(pci_resource_n(dev, bar)->end)
> +#define pci_resource_flags(dev, bar)	(pci_resource_n(dev, bar)->flags)
> +#define pci_resource_len(dev,bar)					\
> +	(pci_resource_end((dev), (bar)) ? 				\
> +	 resource_size(pci_resource_n((dev), (bar))) : 0)

Seems (to me) more logical to have this patch as "PCI: Introduce 
pci_resource_n()" ordered before your patch #2 "PCI: Introduce 
pci_dev_for_each_resource()".

Here as #6 or as #2:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
