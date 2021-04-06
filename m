Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5380C3550A5
	for <lists+linux-alpha@lfdr.de>; Tue,  6 Apr 2021 12:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241331AbhDFKQD (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 6 Apr 2021 06:16:03 -0400
Received: from mail-eopbgr690048.outbound.protection.outlook.com ([40.107.69.48]:18734
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241322AbhDFKQD (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 6 Apr 2021 06:16:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRathHgAnMBYBCGSnPLTnxnuiU/i3SktInqb52rBOq7/ICP2kNqNWKWsQxUUDwfHQoC1bDFRzcNrNYbBKOAZ8rNc9osNZh08x9dwxSlWeQvS9MJaV3F8X0q1uWyh2vRcz12r8b3u2fgjjB66jlMTLXb6hgvh14MvZyRzSyVXclnnBmjM6st4Iw74juKdkHvyynkfl/CQ8jagyEiiOvBkcSEo1Se/wMyue2kvJq5N2dpNsNsyy/i6MbmpffLh5QviC7YTDrBEbxbPh/LGU9h3BhZvYqzsFIdlG2apKn/CLR0g4oh8Qf2w6Q9G6byX4QiKyhqrZJlqhiWVsSyoj3Dxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41IP5SSy2KHynl3TK6I08RmEnyo6yn8ruPXSinPCM3E=;
 b=Z8+HzkyijJwgqxPclvJeoslgUztKF9UwvHTyFJoq9JtiViWB2kJr0PstKCqynJNqKopBrqaQuA8f+sdnFAvkm286y0BcGuOqB2uzEUR5n+aqz8DlJbSDazwDs73LBaf6d65hYbKghw98Ekqwe3nRJyWD74jz8iS2U8xMTkFWYV8UrrKwI0+zxvc4WyNHPTHrwnIuq9a3cwO9ExWvqYp6YM9TDEOhbKmz0a8w+a89M0nnDRubl8kRIrNvAwRRFQuXMyUH89kL8sSnZiko9irtyI8Zuc9rgrvZrZv3zsNeFnsyDsvy1o0/tDWuNau897esi45lqk5QaKPWVbTFT6lv3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41IP5SSy2KHynl3TK6I08RmEnyo6yn8ruPXSinPCM3E=;
 b=4daUz9KXBGrLNNUHSQZ2N5dB1A5+dWlPSWDFj52en7bT7H9aXKRI5EVF+ZHcryKHM0acr/EF52eZ/c178JYbzfwvqaCDZELZ56xGHahppqRf0dNuvNTMOzgBniPwyU6h1bPWwObqCjGFd3UU6/ocyf8hlOW2FMal6D9ARVYGe0o=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4302.namprd12.prod.outlook.com (2603:10b6:208:1de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 10:15:54 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 10:15:54 +0000
Subject: Re: X11 system lockup with 5.11.0 kernel
To:     Michael Cree <mcree@orcon.net.nz>, Bob Tracy <rct@frus.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
 <YF1k+3462hOXkI6d@gherkin.frus.com>
 <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
 <YGqWfkMbChi7G/Vj@gherkin.frus.com> <20210405045515.GA6637@tower>
 <20210405095825.GA17443@tower> <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
 <20210406091431.GA4462@tower>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <dda17ea7-2abd-3e81-475f-8f103f7c9217@amd.com>
Date:   Tue, 6 Apr 2021 12:15:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210406091431.GA4462@tower>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8475:9991:cfb3:4162]
X-ClientProxiedBy: AM8P190CA0010.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8475:9991:cfb3:4162] (2a02:908:1252:fb60:8475:9991:cfb3:4162) by AM8P190CA0010.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28 via Frontend Transport; Tue, 6 Apr 2021 10:15:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c3ba0ad-184d-4fe2-105e-08d8f8e4f60f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4302:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4302A799CE1A21418E70B31383769@MN2PR12MB4302.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OcTh8ciEjg642rRtf5OBSUtlG0VrGt5f1CHO0tt48NSCr0Vnl9/f9BMy/4qgFWsFtjnb4MdKjuyFdCpfictowx7HSt7JIaLnpdpBraUzZBcN83xiQUq90wgI0MmXr6N3gYxox8z3rdFbl7+xQIlIiLWwDWa1szIOLhZwJhrZbdkLfpmgOTnXbyAQYIN2L/860JwLEOTzBg1PrrsHi3efz2Yq9arD1qufamj9Ec0yCrCRdJhTqX+FmilEx7HhJYmz1NUEQbsvYaP1eWtrqav1zvrDXt/i0lpupaqRA02fKAhnVTkQGsLWIz5f4zMkkbxtLxhhxS0YXCIkIMlypG4+h7tLx6jgDAIVRstoX9Syc2EJGAmZ7wwVemIY3qBT0OJ/DzbrRJHqSOs3S+08YnKbVuhmhzjN1spfEHH41JdY3AjR5WUmadPVmQROX5VaU5oaYXpdvo6UnWto9IJB3wHXG1GrpAEDMT/FbYlINgTBRzGG1RDUhwGg9yoYHtizlAkyHpiOd1Vy+1sdZ5W2DxdrCh+AnhAat6ojdmQQnHkYBN7NNXwLIn1zV/f/M1Lk/LNJM+N08nPUKfKPqhaRTEH5m+BMrOn0ycreCd8lww0LkAuv4t5WD5JskZ5djFHp80gAFZsd5CmAi7JlGdNWq2ZmPtH4/FBgJmexG5ue6U14gKTtH2rtf3LsAsGMVLeCE9qnioegol+35zNnQWDxdcjwctCNHFqBCzMFZaENh429QNj9FwVActhJDms7B2TbZDBRFDd6YkJDmwMPC6oDDV/krVi6yjYNqmYbERGxhnOTCtA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(16526019)(66476007)(316002)(2616005)(6666004)(31686004)(52116002)(478600001)(110136005)(2906002)(186003)(6486002)(38100700001)(66574015)(36756003)(83380400001)(8676002)(66946007)(45080400002)(31696002)(86362001)(66556008)(5660300002)(8936002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VTZ5RzVRa3lIZk1lb1p4QkVTcTdQS0dOOGZJMnBWV0g5VFNBd2VXRXpBUzBs?=
 =?utf-8?B?cXVkeHhHd1dvUVlzTU5lY3hMUzV3alVwcG5KUTlUMnFXZ1FEdmZwR3F2WlJa?=
 =?utf-8?B?Q0MyMzdubmxwdHJONzRncVFhYUUxUXFoeVBpSUZwOEZOTGRrSnZ2b0tINWZW?=
 =?utf-8?B?MDRQTXl2Y0N6eGhxRnMwOE1WTCtBVHl0eXB6cWl3K0ViZVA2bksyRENWTVpj?=
 =?utf-8?B?a3lnVUplNUw5NkN4clZrSjlRSzNYM0haSlFHaVVka1FJZEpUZlZ0ZWxRT21o?=
 =?utf-8?B?ZDNPWkpnM3JMNEJhZW90RGdLZUpQNVpjTXlDUDM0RjhCMHFuL0Y2SDFldWd3?=
 =?utf-8?B?aVY0RUNmUDlWakJmQmNsRkltZmN2dUlTbTNka0VjL3N0NDNsaC9nS0J2NHpJ?=
 =?utf-8?B?V1FOQ1ZRclpoZEFkRHRkQVgwbHJvMTM0OE5zLzRBUlg3TG9qZVhTNk4rdXpY?=
 =?utf-8?B?clJscDE0QVIrUXd2ZWJMR1NnRUo0cVUrNzFIeEthekxHNHBCakVQZTQxWWNO?=
 =?utf-8?B?VDRiVVRuclhsS2MrZTQrRmMvZngxZko1ckZMam4zeDFHaFJHZkgxMUhOT21q?=
 =?utf-8?B?TSt3U0ZQemJXdVhiQVhFaHd4TnFsekc4V0t1UkRPaVdYQkVjN3oyN1g0Tytq?=
 =?utf-8?B?YTFubStEOS94Vkg4MlFHRnArdkxOZi9tWUZyWWNYVWZINW1raVJndkIxWW0x?=
 =?utf-8?B?eVhiaHNsZ3UyRFB4dElLQUVnc25lQURCdGhpRkVXVksySlY1VVFMdVJSc2s3?=
 =?utf-8?B?WHJNMllVUnFmNUVnZVYramt2U3NlNnJxdzNjSFB2a3kvZzVaZGppbXFobTZw?=
 =?utf-8?B?eEZ2RXRSNXRYR2JnYTRCQUZlVU5pbjJ5ZmJ1em4yRisrQ0M0MzBDdFZXZHp1?=
 =?utf-8?B?MktXQUlXK094WENlbTl2WEIxZ3VLZUluaWtJamlvbUxxeFg0c0phNWhXZTg2?=
 =?utf-8?B?c3BpYzliRUpQdWROcWZ2TlJvRHZJck1pZFcvSzZiK2lMM3JJY1pPbmloR2VB?=
 =?utf-8?B?elQ0bFJoRldCVkVnSXFyS3JkM0lLclBySlNwbXUwakhjVUJIU2FjTWp3UWZG?=
 =?utf-8?B?RkJqRkkrNVdUMXJKN3M0NmVvbktuOXFCU0dJUHlYS2g0em1Kb1pVRmVuTTlX?=
 =?utf-8?B?NzBLWkxJdkljLzI3WkNEa3luRTlZN3U5WXV0eXBRSlFTRG1kNzR5R24xSUFM?=
 =?utf-8?B?MXpvcUJiRWhaWTBFMzBjQ0hwb2NQNW9XUnRJejFPdEZZb3hyeTV4Yy96RXZp?=
 =?utf-8?B?c0pwUzg4YUJCTEU3NThVaE5HNHZiSE8rTHoxZms2aE1rcS9sTnBsL3M1eDcx?=
 =?utf-8?B?dkdQUGMzeGhYV0QzMVU2TFpFekZ0cmxiWUk4Z01MaHRxNUY0TklpaGt1SVYx?=
 =?utf-8?B?bzNpc1dnOGZCUTFoUTg5UDRZUzNrcmlUSUZXS2VFR2NXbmtvOVhQNGRhYUlR?=
 =?utf-8?B?dEQyVGJmSk5SUlNQaHVpeGQ3TnA3ekk4NWEydCtudVUxejdqNjFiZXRMWWFQ?=
 =?utf-8?B?UmhHN1Q2c0hlbUV4bnBoVzV4RUxKeXBObld3YzNUZ3luS2xFRFprYmhjU3Np?=
 =?utf-8?B?OHBwUjBPbFBvRURveVdwQmhia0wvWlBINDNUMFc1ZkdhdkxjNGZzUlcvUTJ1?=
 =?utf-8?B?NTF0b3ZRRjJKU0REUXlGNnN0bUZrOW1WZS9QWE50ZERLY2hybHZqWXRKQ2V3?=
 =?utf-8?B?TkxDbHdaVzdhNjUzd293SVdDcHdUQlJDTFRVSHBrSlB4cTA1c1UyMHAwd2h1?=
 =?utf-8?B?ZUgrVDVUNEVGQU5IanE2cXZqM2g2TWt5bENtZlJsZnRzejhERHNJanFVMTBG?=
 =?utf-8?B?QVJoVGRlQXZrK0htWkZ0Vi9SZllxQjF3ZitIV2FIbEY4ZUNVc05TSVJ2Mm1j?=
 =?utf-8?Q?NwPyWsp/KgUMO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3ba0ad-184d-4fe2-105e-08d8f8e4f60f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 10:15:53.9548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWOIhWcTH+YQ5k2q/QLwH0NsZF+60FvtzxF7dEUyvGusHxFIKCXrvhyd8lI2hGtr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Am 06.04.21 um 11:14 schrieb Michael Cree:
> On Tue, Apr 06, 2021 at 09:08:10AM +0200, Christian König wrote:
>> That is a known issue fixed in follow up 5.11.x kernels.
> Well, it's intriguing that you say that because the latest 5.11.x
> kernel available from https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.kernel.org%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C4bc7eae6b1c14259a35608d8f8dc6908%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637532973258538981%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=hgwidEjS4X1IBGx7koSUTWW0y3WHAN4AT4moJvf%2BK3s%3D&amp;reserved=0 (i.e. 5.11.11) is also bad
> and locks up hard when X is started on my Alpha XP1000.

Well *that* is rather interesting. We have considered dropping Alpha 
support because we couldn't find somebody with that hardware any more.

The patch you mentioned has the following bug fix associated with it:

commit e0658f970a7f3d85431c6803b7d5169444fb11b0
Author: Christian König <christian.koenig@amd.com>
Date:   Tue Jan 5 18:55:47 2021 +0100

     drm/radeon: stop re-init the TTM page pool

     Drivers are not supposed to init the page pool directly any more.

     Signed-off-by: Christian König <christian.koenig@amd.com>
     Reviewed-by: Huang Rui <ray.huang@amd.com>
     Link: https://patchwork.freedesktop.org/patch/412153/

Please make sure that you got this, but when 5.11.11 doesn't work either 
I would expect that.

Do you have a full dmesg of the system?

Thanks,
Christian.

>
> Cheers
> Michael.
>
>> Am 05.04.21 um 11:58 schrieb Michael Cree:
>>> On Mon, Apr 05, 2021 at 04:55:15PM +1200, Michael Cree wrote:
>>>> On Sun, Apr 04, 2021 at 11:47:58PM -0500, Bob Tracy wrote:
>>>>> On Wed, Mar 31, 2021 at 11:04:42AM +0200, Maciej W. Rozycki wrote:
>>>>>>    I think the only feasible way of determining what has happened here is
>>>>>> that you track the offending change down by bisecting the upstream kernel
>>>>>> repository with `git bisect'.
>>>>> That would normally be what I would do, and it may yet happen.  Problem
>>>>> is, I don't have a 64-bit system with enough disk space to do the kernel
>>>>> builds with a cross-compiler, and local (native) builds on the PWS are
>>>>> taking 36+ hours each these days.  Unless I get *really* lucky with the
>>>>> bisects, the task will take a couple of weeks.
>>>> Confirmed that v5.11.0 hard locks up on presenting the X-Desktop
>>>> login screen whereas v5.10.0 is fine. This is on a XP1000 with
>>>> a Radeon HD4350.
>>> And the first bad commit is:
>>>
>>> 0fe3cf3a53b5c1205ec7d321be1185b075dff205 is the first bad commit
>>> commit 0fe3cf3a53b5c1205ec7d321be1185b075dff205
>>> Author: Christian König <christian.koenig@amd.com>
>>> Date:   Sat Oct 24 13:12:23 2020 +0200
>>>
>>>       drm/radeon: switch to new allocator v2
>>>       It should be able to handle all cases here.
>>>       v2: fix debugfs as well
>>>       Signed-off-by: Christian König <christian.koenig@amd.com>
>>>       Reviewed-by: Dave Airlie <airlied@redhat.com>
>>>       Reviewed-by: Madhav Chauhan <madhav.chauhan@amd.com>
>>>       Tested-by: Huang Rui <ray.huang@amd.com>
>>>       Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F397088%2F%3Fseries%3D83051%26rev%3D1&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C4bc7eae6b1c14259a35608d8f8dc6908%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637532973258538981%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=A0AQyT01bn4CjQeeQuanoh1xGdq%2FEHdE%2FggHzxEzaIA%3D&amp;reserved=0
>>>
>>> :040000 040000 4e643ef861b921392bc67be21a42298c91c7ff7a b36453567c3176a3cd50fa0b23886b0fd642560d M	drivers
>>>
>>> Cheers
>>> Michael.

