Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA43354D68
	for <lists+linux-alpha@lfdr.de>; Tue,  6 Apr 2021 09:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237840AbhDFHI1 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 6 Apr 2021 03:08:27 -0400
Received: from mail-mw2nam12on2087.outbound.protection.outlook.com ([40.107.244.87]:43297
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237800AbhDFHIU (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 6 Apr 2021 03:08:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dePTAehCpNR9WZTwHSPjIjqwMuvW2iQP0UXSoEHF67FlxXiHR10zbKs3UqPgKONuXYuKx1EUP211u7GFCFSY0n4gaorU0IdJBg7WJKZLrMbwR0WtrbEsK97C8rxNB2sler2AMxgQkcO3jWwb30aNW49NMcpQ0XvRz1GxBbSJF3jupgg0t7tRETTZEFjhsm9J4+IF3E0j9ADsuwWVYVIguDMbzBKP3dKNuCY3jlTPkRAoRnT/ZqmyqQv1L5pcdsCxwV2fVHabaEu0tclCZIwi8zRNU/mxcVwKOb0etW1FOUXfbcq7uAQJhpMawgXmUrGpZsF5kBp3v6gWaXshRG1W6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAzCu/XYpQ/A77OyHtL81AwzeKJEzebK2ILVudnYMr0=;
 b=F93R4iB9dQWp/8hjJALDGyde8cUzdZLdwi+9pgSG376a79p+PTyYBscCTvo8hc16GsmURuFvxxgj+96Db/57RRaX3LTIN988qSIToRf9C1GVfzORzfusi+jUThDDE6oB+hwHjHxCJ64mBeDPA8UIMAang9fenAutRCzSjNFgxoFU1fNoX+lH+r4Si5nA2Vf61CE/2HdgHJDrmZQFVItfRTVeI0Yi6rX5Nlq7ADO1VgrLqXKdghEX3Wl3zvSUoXIVFoB73tstv12y2cvB0xilwl57uXVlBC3cBirvyZMmWPrAMaF1PjBbTqrLqlUamDMfQEJGLtfM8Z9tn9TSdUnoxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAzCu/XYpQ/A77OyHtL81AwzeKJEzebK2ILVudnYMr0=;
 b=shdViFIEU0190H95pA4g3zYNZEly3Px9ZFIbcZfii9h9flv9zFEYgdu7if6CgC50vs2J1I78mLxcc0ZZLT3QVSgjGqHT9W+XT3j6a3rDOhkDqUkrVuzGmlt5mg0zyVew3TAOqjZxuzsOmZd2ABItn21P+qOTe8aHyNudInahZbw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2545.namprd12.prod.outlook.com (2603:10b6:207:4e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 07:08:11 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 07:08:11 +0000
Subject: Re: X11 system lockup with 5.11.0 kernel
To:     Michael Cree <mcree@orcon.net.nz>, Bob Tracy <rct@frus.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
 <YF1k+3462hOXkI6d@gherkin.frus.com>
 <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
 <YGqWfkMbChi7G/Vj@gherkin.frus.com> <20210405045515.GA6637@tower>
 <20210405095825.GA17443@tower>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
Date:   Tue, 6 Apr 2021 09:08:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210405095825.GA17443@tower>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8475:9991:cfb3:4162]
X-ClientProxiedBy: AM9P193CA0019.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8475:9991:cfb3:4162] (2a02:908:1252:fb60:8475:9991:cfb3:4162) by AM9P193CA0019.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29 via Frontend Transport; Tue, 6 Apr 2021 07:08:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5234f506-e5ed-4bab-1e83-08d8f8cabd14
X-MS-TrafficTypeDiagnostic: BL0PR12MB2545:
X-Microsoft-Antispam-PRVS: <BL0PR12MB25451FFEE21BB7F6CCCAC07283769@BL0PR12MB2545.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mFEsO+m/qiXV8vYYu8y1j/T9ZNVfbP4cV1ttXQFcAKY2YP6CEhCKWhvXe1bR0Rn9cow/beThbn9nemhA5TQM26nfB2mkY6fcsjXvAUicneXdZ8ZkUBZxkQU27124fXaOGuXbt+HUQNT7Fq/cJSEVvFMfPpjg9ihHPZUIbgfQ7sB6GC7Kac0b9lDqCR6YRD2n0w1oaehZbP5nGdAVn113Gc6FNvzVoqmH+Yb5CO/gwAvIi67UjGZUIFtlgzRYY0pauGs3Czmm2sQPfdg+fFUjgJ1ZX8q/SvjZh0nQY9tx1GBIJu35dZSW9ng27hg/Pk6onJG2UrYgXM+Y3FHMZh35qApxVx16JwtO5gIZdLZbPq0mPN/OltcDkpvDOiuhnhBqXUSym+XCvWyYYqshdD3AibpojWm8V9IqKKreuFqBhgTXLl0Pt2ByntwLetaP2ov/55jPqPKBnXK5CVT2XzbTFxSU9s3v/M35JGFIFPXx4swqdjgRqW22YrH+Zs1j+kWKp0YWZ5sOlHg8xPJoGUAJDwfWwvEz6z0+qddqdroM1Lb9sStGcDdWO4zGjyFYkFJVkqw0EdtLGCru1zDy1Ph01QZQTrK8jYzlq5UYlT6BYUeGVLlTwftBR4xK+CMo55fJq5nIZBElurKfyulb4ggFwt/lYUqQTfKYpiT99vM5LtBZ1bFjwc9Iye/DUs2UgqdwsviIf7KOtQV5IvkKNrsOv1i33HYtPakOL8D6udB5KmszTjBFckAQkFDyZXtaQMJO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(478600001)(66556008)(66476007)(66946007)(36756003)(45080400002)(110136005)(66574015)(52116002)(31686004)(186003)(16526019)(83380400001)(966005)(316002)(2616005)(2906002)(86362001)(8936002)(31696002)(8676002)(38100700001)(6486002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c29IcVlPZW9lR29KZ2QwYXdwaFIxMTBUWGw1SmQxV3lFY295ODk0WmN1UlBU?=
 =?utf-8?B?QzJJWndLTUFRNlE2bGlNKzlEWlgvTkhPbU1DeEY1a1pHbmdRUWR1QnBUOXE1?=
 =?utf-8?B?VGdOWWVhMCtNNGM1c3VMSWJIa3NrdjZCYWt2cjQ5NTNLK05GbVVSZGkxYjdO?=
 =?utf-8?B?ZmN1Nm1BM0kxbk05SUk3VlVZQ0tnT2ZEdGFiVDhVbENnQm1aeXRublcwTGNq?=
 =?utf-8?B?ZUlaMkpjSkUzQm1DM1dCbUIzOW96NHYzNWZKY2JFTyt4b2dacHBqUDJhY2di?=
 =?utf-8?B?QXJhMlBXTjdMb1BzTUNiNHZnRWE1YlNQSmlRWHR5UTRiZ0RKOHg4bFhsbGYy?=
 =?utf-8?B?RmsyUzRXSElDK2E4ZUQ3L1BLTkFNNEFWQjArODlsZTcwdmpGOVlOdWV5Um9I?=
 =?utf-8?B?TWhNVjd6NEh4a0dPMDJGMDkxc2ZSMGxISmV0N3lKR2NTdkhkRmN2ODBFR1Q2?=
 =?utf-8?B?RmNUSlg4UzY4RGNkdHJGdXI4NGNxSlZVb0oyTjYydjBTbnh4T1k2ak13YlJC?=
 =?utf-8?B?MUpqcSt0RkFGVVA4NWxsMU01aURvbFM0NnJJWU9MdUt1VWtXdGZiY1hMMDZu?=
 =?utf-8?B?b3lrdDl2Z3RCVksxcmNtTFpGbnp4ZWQxK05pMFM2YUlKYmIyYlErNWwyT0Ri?=
 =?utf-8?B?Rm85Q2JDZEZBZEt0UnJ2V1VrMkhjS2ZMRnhiek84ZGYrUnJTMVdqZEMrVWJo?=
 =?utf-8?B?SlVzZVVYSEVJM1VoODkzOVYrVnVJSVlrQmpScmFVQ2hpQUZHczFMR1lBWHBT?=
 =?utf-8?B?Ym40RU5LcGxNOFk3N2hLQnNuQmJtVlhJTDdxaGpROGsxYStrZzY3bUdGdVV5?=
 =?utf-8?B?a2FsTk15L21EVlNVYS9hVEVXcXJiODNkNTNKZUs4K2ZLdjhCRnMxR2crYjRC?=
 =?utf-8?B?RHNRVHJpTmxnMFg3S0lyWGw0STh6UnI1QUxVdjVIZ01GMDBDakhoQjJybSs3?=
 =?utf-8?B?TXJ1RXZsVHBvK2EvdHVscGxsdzFzVnFMd3JBcDB6SjRTSmpiY0RySmREZ2My?=
 =?utf-8?B?MWRjbDRmNnVJZTkvSURLVk5KSnJOOVBFUnJoR1ZjL0tER0ZjVjh3TWJvc0s4?=
 =?utf-8?B?ZWQ3K00rMlFGVkNwOUJyQmxQdjRCZTVFUzEzd21FVW8zSGszenhZclhWMDBw?=
 =?utf-8?B?Y2xUODU1Lzd2TklYbEVQRWswZjJDVUp1TmJIbmorSEZLWXJsYXRSMmVLWDJ4?=
 =?utf-8?B?Z1paNXg5RXlxcW9BaE5pQ0J2S0NITEU4U2Q4anJkaExIUkIzamErSGpRVkNo?=
 =?utf-8?B?MzBaeGt2d3VOVU1DU0lrcE1URmpPaFhoVVVqYnRxS1diQmU2WmhTOGhUZlpv?=
 =?utf-8?B?RXRCRGJnSHlRaXFXbHJJREZCYUZlSFR0aHdxd0dLbXVQS2xXSS9lcjd2VmlT?=
 =?utf-8?B?WVRCOU1JMXBuUitGSkF5RCs0TkQ3SExwdmNzbmVVTm9HTTRWR0g0YkV6RVM5?=
 =?utf-8?B?SmNvVTVVQnlpdnNIZnQ0bVNqODBBenc4Y0ducnFYRmxTK2dzME5mY1pkWmRN?=
 =?utf-8?B?c3RqcWRpMFMvckdVckRqdE43N1JCODFYcEFvUEtrbktneit1NlM4elBjSDNi?=
 =?utf-8?B?VnQ3ZkpWUTVKU1R3UEN0SFVYK0FTYXFna2tTQXk2NzZFVFJxUkpBT29QbGtQ?=
 =?utf-8?B?aFVoMGU1TWY1empXbzhUSnlnWG5rWjBqb2hTMGJYYlJlQjR4WjhkdUNjanBX?=
 =?utf-8?B?N2RoTFFkcXgrQnFhRjh5RXNxOGVLTTk1dkNObWVuSjAwdTlpL2J0K0dpKzZl?=
 =?utf-8?B?VHNnRUFnQ3dpRVFwV1dKckNqcGZlcUxRazdFU1E5U1FuSDA4RlZ4QTdnNkhK?=
 =?utf-8?B?bU5wNGl2WUJ5dG5FNmFYMk94S1hoT2dwSFZhOFJQVERVbnF0dHpMdEdFajVS?=
 =?utf-8?Q?PQn/7SKGCJ68L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5234f506-e5ed-4bab-1e83-08d8f8cabd14
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 07:08:11.4508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkcBIUAOAZ9VU+HENd/LG16CQKPPQNK4f3NfAMvjfnKbiz2XZw/8E0r/TR785dIA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2545
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

That is a known issue fixed in follow up 5.11.x kernels.

Regards,
Christian.

Am 05.04.21 um 11:58 schrieb Michael Cree:
> On Mon, Apr 05, 2021 at 04:55:15PM +1200, Michael Cree wrote:
>> On Sun, Apr 04, 2021 at 11:47:58PM -0500, Bob Tracy wrote:
>>> On Wed, Mar 31, 2021 at 11:04:42AM +0200, Maciej W. Rozycki wrote:
>>>>   I think the only feasible way of determining what has happened here is
>>>> that you track the offending change down by bisecting the upstream kernel
>>>> repository with `git bisect'.
>>> That would normally be what I would do, and it may yet happen.  Problem
>>> is, I don't have a 64-bit system with enough disk space to do the kernel
>>> builds with a cross-compiler, and local (native) builds on the PWS are
>>> taking 36+ hours each these days.  Unless I get *really* lucky with the
>>> bisects, the task will take a couple of weeks.
>> Confirmed that v5.11.0 hard locks up on presenting the X-Desktop
>> login screen whereas v5.10.0 is fine. This is on a XP1000 with
>> a Radeon HD4350.
> And the first bad commit is:
>
> 0fe3cf3a53b5c1205ec7d321be1185b075dff205 is the first bad commit
> commit 0fe3cf3a53b5c1205ec7d321be1185b075dff205
> Author: Christian König <christian.koenig@amd.com>
> Date:   Sat Oct 24 13:12:23 2020 +0200
>
>      drm/radeon: switch to new allocator v2
>      
>      It should be able to handle all cases here.
>      
>      v2: fix debugfs as well
>      
>      Signed-off-by: Christian König <christian.koenig@amd.com>
>      Reviewed-by: Dave Airlie <airlied@redhat.com>
>      Reviewed-by: Madhav Chauhan <madhav.chauhan@amd.com>
>      Tested-by: Huang Rui <ray.huang@amd.com>
>      Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F397088%2F%3Fseries%3D83051%26rev%3D1&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ce271ea2552a640dfec1408d8f81964a3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637532135545775310%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=UYwXgn6lAsES4q8p944kP0Y%2BGzqHRwSMXgrQvZXwXzM%3D&amp;reserved=0
>
> :040000 040000 4e643ef861b921392bc67be21a42298c91c7ff7a b36453567c3176a3cd50fa0b23886b0fd642560d M	drivers
>
> Cheers
> Michael.

