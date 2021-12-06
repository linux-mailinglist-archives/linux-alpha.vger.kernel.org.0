Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A72546A4A1
	for <lists+linux-alpha@lfdr.de>; Mon,  6 Dec 2021 19:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbhLFSeS (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 6 Dec 2021 13:34:18 -0500
Received: from mail-mw2nam10hn2242.outbound.protection.outlook.com ([52.100.157.242]:39381
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233338AbhLFSeS (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 6 Dec 2021 13:34:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTBWMEpqGGXm2vVGCo0WZgJo8cj7YGHwurxskvYrXAjiIKmoTAYPaSuiacXoyDofv7U8t1wcvPqP2KdmLh7Vs7LUtTlKuckc01VMPR1+aJ40D50hEAT1lvKGpTd9ux/QoO53MsEGxawJQlEPZWI64dewvh44i3dyps31KAt6nLk0Yf0Nm4PfqjOwPIQ1uzSJh1uRtHVt23zDZzSZxnhEOf7iVs6IExXxwtH/EFFSobKMkF6iP0ENxwzIVbVuPZD8Kg0/bsK7NkbooPuwlujhUQdvIVgjqjx25bn6lp29gFEitSgGM/SmdijXRamiYT/HPZ6OUr3fwdUq68CnCgFoVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=LRnqrMAE3qIjok/Cs2Smj6kFBZDaNzfJ/igu7eLZwHJrWhVqjtfBg0/CIAYqohtUDl71AKa8T7a7PRWm6F6M1xnEMVYGGc88vorgnGrCsgG8DCZ+by+1ptnIzqV9A4WJqVFUFiYHqen4hRfQvjXNp655v2/Z5KBrGbvPid2Q7nyc1s07qA7sbVdB/U+gfG3ytztOjWacwAQ1jWFAy3HEUJB2tH7P3fQe7F7gTsU8orFTMTLpkenfxOlatR35dvLDZ56FkVG4ALuwpmxPH1PHrr3xkD5m3kaIqSiY20wqKFr4vS+neUHpxWfYsjxhjBKJxqlb1GsDjEH6iD1BTWGI1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 146.201.107.145) smtp.rcpttodomain=sdf2.com smtp.mailfrom=msn.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=msn.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fsu.onmicrosoft.com;
 s=selector2-fsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=itkaz7VmwzoXeohG8aZf2bZmvYls3m+K1HPXC5fOimDMUTWb8pcMGaK60RQh4zzWHEFIxsTnbHM6zBGWfbnA7mWuItk/4MwoKtS67bCZwgmj05HCmwK7MxMD1y7xPZxF1tL5Ir/I/C3ZRIsx4O71odVSa/efrHrJggdUTPY39Q8=
Received: from CO2PR05CA0062.namprd05.prod.outlook.com (2603:10b6:102:2::30)
 by CO6P220MB0450.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:13e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Mon, 6 Dec
 2021 18:30:43 +0000
Received: from MW2NAM04FT009.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:102:2:cafe::10) by CO2PR05CA0062.outlook.office365.com
 (2603:10b6:102:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.10 via Frontend
 Transport; Mon, 6 Dec 2021 18:30:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 146.201.107.145) smtp.mailfrom=msn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=msn.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 msn.com discourages use of 146.201.107.145 as permitted sender)
Received: from mailrelay03.its.fsu.edu (146.201.107.145) by
 MW2NAM04FT009.mail.protection.outlook.com (10.13.30.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:30:42 +0000
Received: from [10.0.0.200] (ani.stat.fsu.edu [128.186.4.119])
        by mailrelay03.its.fsu.edu (Postfix) with ESMTP id 5C21F9518B;
        Mon,  6 Dec 2021 13:30:05 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re: From Fred!
To:     Recipients <fred128@msn.com>
From:   "Fred Gamba." <fred128@msn.com>
Date:   Mon, 06 Dec 2021 19:29:22 +0100
Reply-To: fred_gamba@yahoo.co.jp
Message-ID: <62ab5b24-94d9-423e-add5-4726ec3c9032@MW2NAM04FT009.eop-NAM04.prod.protection.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 452ac581-68e8-4e9c-45bb-08d9b8e68304
X-MS-TrafficTypeDiagnostic: CO6P220MB0450:EE_
X-Microsoft-Antispam-PRVS: <CO6P220MB045033073EBDF994CE1D48BCEB6D9@CO6P220MB0450.NAMP220.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Forefront-Antispam-Report: CIP:146.201.107.145;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:mailrelay03.its.fsu.edu;PTR:mailrelay03.its.fsu.edu;CAT:OSPM;SFS:(4636009)(84050400002)(46966006)(40470700001)(26005)(40460700001)(82310400004)(31686004)(3480700007)(316002)(8936002)(786003)(7366002)(2860700004)(7406005)(956004)(7416002)(8676002)(70206006)(31696002)(2906002)(7116003)(508600001)(82202003)(86362001)(70586007)(6666004)(336012)(9686003)(5660300002)(83380400001)(356005)(7596003)(47076005)(35950700001)(6200100001)(6266002)(6862004)(480584002);DIR:OUT;SFP:1501;
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkJadHRWTlVtWlVCWE13a0ZHNWhaRnBjQXJiOFp2Wm5GMTRhVElaZkFMWERJ?=
 =?utf-8?B?UGRKSFk4R1FoSVp3WnZYdHhtdUlMSW41SlF4SGs0YkNNNEpZL3Jmb3BBZXdO?=
 =?utf-8?B?Z3FWWUlpLzc2alNJWnMxekxWZExYRHlNdGZPd2x2dWNPZ1JzRHNGSWxmRVRL?=
 =?utf-8?B?R25BejNySHJvV3FKOEs3ZWRKWnlibURmZ01CZG9mR2ErdEQzaG1Eb2dZa3Bk?=
 =?utf-8?B?K3pJNHM1ZFJ6eTJiT1hGUFVSMnpQUGtVZGU1MnNlQTE1azhIVm1vekdmdHFq?=
 =?utf-8?B?VGM1SGllMVFMKzlkRXovRXVOS2lYL2ZHZ0hTVklUa2ZiWUd3dlpCU0VUVXY1?=
 =?utf-8?B?aG9FeEpEQWtYU3QycjhFY1FWaUlnZk02b256R05TWkJlN2FWK1h3ZGY5d2Z3?=
 =?utf-8?B?U0pBb0d3WVRjSTdVa0VDYlRpSXB1RFAxOWU4WSs5cjZ0dW9WVUpQcFZYMnJm?=
 =?utf-8?B?SHUrcWw0NmVRZW94NUVhY3ZJUzVuZi9sT3VzNHo4LzAxV0VZYzd0ejhjRTlK?=
 =?utf-8?B?clJ1MFhnNTZMOG9CelU4WTlKbGxmUXdnQXF0ZkZEaHB5L21aYnBBUm1rVC81?=
 =?utf-8?B?c2lMUHl6NThUeVdVSUtlYnRBdG1NUXY1aVd4b1BmbGhEb2pZWU1rMkpvbFcw?=
 =?utf-8?B?UURnT21kWmM3dnUzWm1MV3dYU0Rjdm1ZM2REb2RwQWtmcmxyY3VSa0ZadkpL?=
 =?utf-8?B?ODVUZG1lU1hZOEVxeE1KNm9SSTUvcHg5bFI3MUp5SFlLZmI1RUY5OERUL0h2?=
 =?utf-8?B?N1Z6enRUeG5JK3hWcmZwWEVEWnlVbHFabzBBMFY0eEZURkpoYlFkdnl5NzVk?=
 =?utf-8?B?cjV0K3hTQm9xY2dyZEl6NHhuS2F6TXlBMHJjQlNtZUxYVWdmV0IxNXRSSzkv?=
 =?utf-8?B?NjhGa1RSak40UWJjeVpKMTVhMGJwU0NubU5ETk9jbHZjTVlYYnpWdWg4R2Ny?=
 =?utf-8?B?Q3FlWjlLZjJKZVRmSUZYdE9uRCtyVVc4V2lXYTgxckt6Q0xBR2xiem9nQzhJ?=
 =?utf-8?B?U0x6b2hORVhGSUQxdTRFQnppb2QwcC9JV1o2dlFDbERkMzNGdm1zdFM0TDEv?=
 =?utf-8?B?Ym5EMjJIdGR3cHJ5ZFhFRlVxRnYzaXY3dlVzNkdUdERYdTNqcktPZW9hbnds?=
 =?utf-8?B?K2txSE1IcWtpbjBnaUNtVzdYdnJ1K1pCYkVSZE0wUURlNUFVS0xSaWVOMUky?=
 =?utf-8?B?SWFGeHhHYnZ4UTY1Q1F3ZFh6bUpYOS9xb2czR3dOR0IyN3k1TjBPUHNndHJs?=
 =?utf-8?B?cEdWMjVyTlRYVndiaTl1TktmK2trS3dZSm9PYitqM21INHl4MXVDeDVxcEZJ?=
 =?utf-8?B?M0g0d1lwRWNLSy83ZXlQdUpUZnkvZFB2RXZQVStZbE1IL3ZKYUpBQlYzdkp6?=
 =?utf-8?B?RjVnNlAxa0pReFZUVVZTUkpsMHg4azUxRDFiNmh4SmhCLzNIMXF3QTJTVGxn?=
 =?utf-8?Q?rt/1unrR?=
X-OriginatorOrg: fsu.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:30:42.7845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 452ac581-68e8-4e9c-45bb-08d9b8e68304
X-MS-Exchange-CrossTenant-Id: a36450eb-db06-42a7-8d1b-026719f701e3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a36450eb-db06-42a7-8d1b-026719f701e3;Ip=[146.201.107.145];Helo=[mailrelay03.its.fsu.edu]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM04FT009.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6P220MB0450
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hello,

I decided to write you this proposal in good faith, believing that you will=
 not betray me. I have been in search of someone with the same last name of=
 our late customer and close friend of mine (Mr. Richard), heence I contact=
ed you Because both of you bear the same surname and coincidentally from th=
e same country, and I was pushed to contact you and see how best we can ass=
ist each other. Meanwhile I am Mr. Fred Gamba, a reputable banker here in A=
ccra Ghana.

On the 15 January 2009, the young millionaire (Mr. Richard) a citizen of yo=
ur country and Crude Oil dealer made a fixed deposit with my bank for 60 ca=
lendar months, valued at US $ 6,500,000.00 (Six Million, Five Hundred Thous=
and US Dollars) and The mature date for this deposit contract was on 15th o=
f January, 2015. But sadly he was among the death victims in the 03 March 2=
011, Earthquake disaster in Japan that killed over 20,000 people including =
him. Because he was in Japan on a business trip and that was how he met his=
 end.

My bank management is yet to know about his death, but I knew about it beca=
use he was my friend and I am his Account Relationship Officer, and he did =
not mention any Next of Kin / Heir when the account was opened, because he =
was not married and no children. Last week my Bank Management reminded me a=
gain requested that Mr. Richard should give instructions on what to do abou=
t his funds, if to renew the contract or not.

I know this will happen and that is why I have been looking for a means to =
handle the situation, because if my Bank Directors happens to know that he =
is dead and do not have any Heir, they will take the funds for their person=
al use, That is why I am seeking your co-operation to present you as the Ne=
xt of Kin / Heir to the account, since you bear same last name with the dec=
eased customer.

There is no risk involved; the transaction will be executed under a legitim=
ate arrangement that will protect you from any breach of law okay. So It's =
better that we claim the money, than allowing the Bank Directors to take it=
, they are rich already. I am not a greedy person, so I am suggesting we sh=
are the funds in this ratio, 50% 50, ie equal.

Let me know your mind on this and please do treat this information highly c=
onfidential.

I will review further information to you as soon as I receive your
positive response.

Have a nice day and I anticipating your communication.

With Regards,
Fred Gamba.
