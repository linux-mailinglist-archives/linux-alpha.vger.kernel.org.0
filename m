Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23BFB52A8C6
	for <lists+linux-alpha@lfdr.de>; Tue, 17 May 2022 19:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351292AbiEQRDC (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 17 May 2022 13:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351286AbiEQRDB (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 17 May 2022 13:03:01 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B914339D;
        Tue, 17 May 2022 10:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652806980; x=1684342980;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wPndYlW5xEVdpcc0zA72NXu9ypQzfs4FPZzk6VJMkkY=;
  b=E6G3ldzPD5ig+NOHm3uUhmmKyCOpiFukwEEZN44mGoqTeXEdbdfw+54i
   MfU5oqDXSCbrrrvCbE1PbO6tCvc0/ujp0eInlhXAJzbqUmnYl8c8cl0xx
   nvBxMtW7ZG+ZbqValn2tSdtB8S6ufEPhiga+FXYRM9g2uZux15Xku7Fjv
   n4U+zmQ9y2VuCsaNZGr7bmg1A0a9kBKt0V3Jq9+oyJ5EqNm4VMbeWzTau
   pEARQDCByUAmm5UjlOTVRBz39ZEj3GqFKiWAqG5uoXzQkn6sCqNUtExse
   WAc8YZw5fu16sBtoiouqaY+RbPDv1S8BPINTNA1dHWZ6WQ1a9fkNK+Zta
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="258814403"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="258814403"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 10:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="700144313"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga004.jf.intel.com with ESMTP; 17 May 2022 10:02:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 17 May 2022 10:02:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 17 May 2022 10:02:31 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2308.027;
 Tue, 17 May 2022 10:02:31 -0700
From:   "Luck, Tony" <tony.luck@intel.com>
To:     "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Petr Mladek <pmladek@suse.com>,
        Dinh Nguyen <dinguyen@kernel.org>
CC:     "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "bhe@redhat.com" <bhe@redhat.com>,
        "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
        "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
        "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "openipmi-developer@lists.sourceforge.net" 
        <openipmi-developer@lists.sourceforge.net>,
        "rcu@vger.kernel.org" <rcu@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
        "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
        "halves@canonical.com" <halves@canonical.com>,
        "fabiomirmar@gmail.com" <fabiomirmar@gmail.com>,
        "alejandro.j.jimenez@oracle.com" <alejandro.j.jimenez@oracle.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "arnd@arndb.de" <arnd@arndb.de>, "bp@alien8.de" <bp@alien8.de>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "d.hatayama@jp.fujitsu.com" <d.hatayama@jp.fujitsu.com>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "dyoung@redhat.com" <dyoung@redhat.com>,
        "Tang, Feng" <feng.tang@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "mikelley@microsoft.com" <mikelley@microsoft.com>,
        "hidehiro.kawai.ez@hitachi.com" <hidehiro.kawai.ez@hitachi.com>,
        "jgross@suse.com" <jgross@suse.com>,
        "john.ogness@linutronix.de" <john.ogness@linutronix.de>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "luto@kernel.org" <luto@kernel.org>,
        "mhiramat@kernel.org" <mhiramat@kernel.org>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "vgoyal@redhat.com" <vgoyal@redhat.com>,
        "vkuznets@redhat.com" <vkuznets@redhat.com>,
        "will@kernel.org" <will@kernel.org>, Alex Elder <elder@kernel.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Chris Zankel <chris@zankel.net>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        "Corey Minyard" <minyard@acm.org>,
        Dexuan Cui <decui@microsoft.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        "Heiko Carstens" <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        James Morse <james.morse@arm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Matt Turner" <mattst88@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
        "Richard Weinberger" <richard@nod.at>,
        Robert Richter <rric@kernel.org>,
        "Stefano Stabellini" <sstabellini@kernel.org>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        "Vasily Gorbik" <gor@linux.ibm.com>, Wei Liu <wei.liu@kernel.org>
Subject: RE: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Thread-Topic: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier
 list
Thread-Index: AQHYWooLnXaT7guJw0OCpuGv/IkEoK0iJCSAgAAZuAD//40QkIAAesuAgAFqbACAACtDgP//jcxA
Date:   Tue, 17 May 2022 17:02:31 +0000
Message-ID: <06d85642fef24bc482642d669242654b@intel.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com> <YoJgcC8c6LaKADZV@alley>
 <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
 <bed66b9467254a5a8bafc1983dad643a@intel.com>
 <e895ce94-e6b9-caf6-e5d3-06bf0149445c@igalia.com> <YoOs9GJ5Ovq63u5Q@alley>
 <599b72f6-76a4-8e6d-5432-56fb1ffd7e0b@igalia.com>
In-Reply-To: <599b72f6-76a4-8e6d-5432-56fb1ffd7e0b@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

PiBUb255IC8gRGluaCAtIGNhbiBJIGp1c3QgKnNraXAqIHRoaXMgbm90aWZpZXIgKmlmIGtkdW1w
KiBpcyBzZXQgb3IgZWxzZQ0KPiB3ZSBydW4gdGhlIGNvZGUgYXMtaXM/IERvZXMgdGhhdCBtYWtl
IHNlbnNlIHRvIHlvdT8NCg0KVGhlICJza2lwIiBvcHRpb24gc291bmRzIGxpa2UgaXQgbmVlZHMg
c29tZSBzcGVjaWFsIGZsYWcgYXNzb2NpYXRlZCB3aXRoDQphbiBlbnRyeSBvbiB0aGUgbm90aWZp
ZXIgY2hhaW4uIEJ1dCB0aGVyZSBhcmUgb3RoZXIgbm90aWZpZXIgY2hhaW5zIC4uLiBzbyB0aGF0
DQpzb3VuZHMgbWVzc3kgdG8gbWUuDQoNCkp1c3QgYWxsIHRoZSBub3RpZmllcnMgaW4gcHJpb3Jp
dHkgb3JkZXIuIElmIGFueSB3YW50IHRvIHRha2UgZGlmZmVyZW50IGFjdGlvbnMNCmJhc2VkIG9u
IGtkdW1wIHN0YXR1cywgY2hhbmdlIHRoZSBjb2RlLiBUaGF0IHNlZW1zIG1vcmUgZmxleGlibGUg
dGhhbg0KYW4gImFsbCBvciBub3RoaW5nIiBhcHByb2FjaCBieSBza2lwcGluZy4NCg0KLVRvbnkN
Cg==
