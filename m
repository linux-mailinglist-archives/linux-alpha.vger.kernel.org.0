Return-Path: <linux-alpha+bounces-603-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E6F90A30F
	for <lists+linux-alpha@lfdr.de>; Mon, 17 Jun 2024 06:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A57CA1F21CE6
	for <lists+linux-alpha@lfdr.de>; Mon, 17 Jun 2024 04:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973F8D527;
	Mon, 17 Jun 2024 04:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uPHAVcMf"
X-Original-To: linux-alpha@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2084.outbound.protection.outlook.com [40.107.100.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4058F819;
	Mon, 17 Jun 2024 04:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718598962; cv=fail; b=Ud+xBWj3xn0noBq7iU2Ae3ZzBbq8mqlSrLPjEPN2slRFWSo4EgrR3Fq6XFFN/Bi8WfIg4lqrEfHs8sPIAyiQWlcCewTAneDzU38XcQM+jQ7UB7gddYnTZ4iJeq5Xz05yvEOsSnBWJRZi9x40qI2c5P/Yjxgu7xwdCpnJ8fSj/SQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718598962; c=relaxed/simple;
	bh=yewums6JxpdyYrTZn+c0bFz2jxNG5+b3bUNergndDI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bu8dFFtctZKdeTF1UAH/sqW+pUIZbYlj4Ffd6Yg1tO9iCvbb6+hQkd50W58O8pFOF+efLub+yeph95J3rMTKuTr7teEnE4P5seDpBnJ5LCruET+0yzzUnnZwF/oFx9RnXspQNfA50vG1JK1hzQvaYcrTRPMr6GinuNtjjO+D2JQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uPHAVcMf; arc=fail smtp.client-ip=40.107.100.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cS6MBv1kpEUKbn752opehSE8vuVo40+QHM/CwSA36vDW9hvLn6kU+OH4YhuOoDvjAy3zIW0wdCSPiMvzSynGz3fa7vRg11PzLhihjMwTSAQ7F+7TLqjImnqhguMg91FxR6u9fPQ/tdtRjdPzgn9k2vBxeo5BIVDk1yVKIM3hNjrUfani50miJgb0T6m3WGVtW4TKcvZLRgJIh9YEKSCXGpAe8XC0pPdErBkqzTJ2gWDz4JZILuWRUfn1mq4rBDYgnT1cJrDm2SsE+jXAqRiR4UGsFANBGRLdgCaEhX0JfyGnROd2eTXxlFgzb7eyeEFJCm1HXGCsM/gyNLFgO/RbTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGWQmqRyqMXs038b48yvR4MdWmcP7CQlSWGCb1h0oU0=;
 b=BBukvcezG+b1PkkgZbfctaSvOznCeLdMGUx94vbSaAnZuBrgi0hS+xDDSMIvIzsOEl66coOqqTte+TfdzKGixpoHW4cOT1Bv91Dm7FCys/aM8GvdyP6GpaUb06ISLpiv2D8Ic9Ejh2/lt9gPaISrhmPTr9X4WlZyk8Z4tcsqhlEUyIv0HXklKFHhbz5FRWboachWvbi6H7wdWZH0ZIOcl748qGAa6h1o/0UNXz2AHtfF+1IX873Qf1yRas0BGHEkUGi04VrzNdFkov0UlHOw4IFLl1xerTLmeAeF2AFConwfieTVjV38Lwuuunii2Wg1xg3YHKl1es5t+IcVhpaTxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=armlinux.org.uk smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGWQmqRyqMXs038b48yvR4MdWmcP7CQlSWGCb1h0oU0=;
 b=uPHAVcMffkz/6M7XVxYV9akUNTj9LIsREr1MivnHsRsKAEpHDTZsKu97eNIuYRaHh9lJqWrQ0kLrlqw7LkebTL+u7JTRNRHCjBEU7//gRKHjBOIcS3bUDXJUD+7dN6ANTUfm8ahrL/JEv2x7r0jA+s8ikoETRdm+jO4t0Jjoorw=
Received: from DM6PR03CA0072.namprd03.prod.outlook.com (2603:10b6:5:100::49)
 by DS7PR12MB8249.namprd12.prod.outlook.com (2603:10b6:8:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 04:35:54 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:100:cafe::23) by DM6PR03CA0072.outlook.office365.com
 (2603:10b6:5:100::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Mon, 17 Jun 2024 04:35:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 04:35:54 +0000
Received: from [10.136.33.236] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 16 Jun
 2024 23:35:39 -0500
Message-ID: <4f872eec-f302-5ac4-e914-bcc3ce65950c@amd.com>
Date: Mon, 17 Jun 2024 10:05:36 +0530
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 00/14] Introducing TIF_NOTIFY_IPI flag
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: <linux-kernel@vger.kernel.org>, "Gautham R. Shenoy"
	<gautham.shenoy@amd.com>, Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>,
	Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>, Dinh Nguyen
	<dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, Stefan Kristiansson
	<stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
	<deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>, Yoshinori Sato
	<ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, "John Paul
 Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, "David S. Miller"
	<davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
	<hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Peter Zijlstra <peterz@infradead.org>, "Juri
 Lelli" <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, "Valentin
 Schneider" <vschneid@redhat.com>, Andrew Donnellan <ajd@linux.ibm.com>,
	Benjamin Gray <bgray@linux.ibm.com>, Frederic Weisbecker
	<frederic@kernel.org>, Xin Li <xin3.li@intel.com>, Kees Cook
	<keescook@chromium.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, "Tony
 Battersby" <tonyb@cybernetics.com>, Bjorn Helgaas <bhelgaas@google.com>,
	"Brian Gerst" <brgerst@gmail.com>, Leonardo Bras <leobras@redhat.com>, Imran
 Khan <imran.f.khan@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rik
 van Riel" <riel@surriel.com>, Tim Chen <tim.c.chen@linux.intel.com>, David
 Vernet <void@manifault.com>, Julia Lawall <julia.lawall@inria.fr>,
	<linux-alpha@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-csky@vger.kernel.org>, <linux-openrisc@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-sh@vger.kernel.org>, <sparclinux@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <x86@kernel.org>
References: <20240613181613.4329-1-kprateek.nayak@amd.com>
 <Zm2kouKx/NSSrr6x@shell.armlinux.org.uk>
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <Zm2kouKx/NSSrr6x@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|DS7PR12MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c378d6-3196-4602-553a-08dc8e86f99f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|7416011|376011|36860700010|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHVjNUI3OGVUdW5VK2pqVlFNZTFlTE83MklqUS9TWW1FMDdQeUN1WDRmdXl1?=
 =?utf-8?B?Nkg0NldIc0tqcU82RnM3Z0Rxd3YwRC9tay9UOWV1YW1NTlVKaDgrOFptRE1F?=
 =?utf-8?B?M3VMSWNJUGlQY0VNbjBJSWlqMXFQMzVFSU0wVlR6REN6bXpLUXpITGJLVWZ1?=
 =?utf-8?B?QzVoVEhvaXRybE84c2lObnN5WXJ6ZjNhUU84My9ldmxqL1oyb1JMdWk2MDh0?=
 =?utf-8?B?aEJtcVY2T1dsL1Y2WlZXZStwWXdoZlVyR3JIeXh3eU5mY2ZyQU1kNHgxQk9w?=
 =?utf-8?B?L2NwK1pTRDQ4YXBQNFdwdmFPbGo5SjZnUjViVytTN1FwS2lTdW5UZUR4QmNP?=
 =?utf-8?B?Q29xUGUwaDlzeGxwdlhEeFVucGJ4c0pkdGpJMitmZXNKcmQvbXR0OUZYdVNk?=
 =?utf-8?B?Vm9lSDdUN053N0hsOXZzd3dJdWNxY2cvWktTMjg3bnZwbUtXQUcxNThaTUYr?=
 =?utf-8?B?cmk1U2pSbEVEVWRlN1BqT3NRWVlXYTRMaERiOUJ1S2FvNkhtT2R2WitKbHFk?=
 =?utf-8?B?YmtOZDZXVXpjNjRSODVuL01ETWVibkVBdGRJeWVUZHlhaVF2cDB1Ni9xdlBp?=
 =?utf-8?B?VHRValdGekFkVWp2elJHZFh3b0FSdk8xWUh4b3BSR0JRVHBZSnFZWHJBdE5z?=
 =?utf-8?B?NzlMTEZnUnBiUTBZbm43WEFpZE5heFBJWDNrbk5UMUtySksrSCs1Ynl5c2FO?=
 =?utf-8?B?UlVJWE1BM3hQYlBsMFJndGsvTHNoZDlRWXpaN2NmcVFIN1VyU0tRM1M1ZzM2?=
 =?utf-8?B?NGk5clV4NWVOU3pBMkhzY1ZkVVROUkNBa3lEQjZXNmtXcFlnY1ZEZWxhZUNE?=
 =?utf-8?B?aG1mTDM0QUh6MmxiZXR6cnd3b04rZUlFU0czT1A2TWlTcnFtT3RtZUJWU0Nt?=
 =?utf-8?B?ZFJmdVBlOGJIVGFkM2NSQmxGelN0WVI1WjhkeEc2cDd2elgwenBSNGhoRDJU?=
 =?utf-8?B?OStmQllRTHFmSmh5VDZHcEhKTG9aQ0dSUUJiOGtSRmoyckJSQnhnMWFieEpj?=
 =?utf-8?B?aU5SRmN0aXc5dTdvYzUrTSsrWkt0MnhyeVRrdCsxZkY3R1FydFRMNC9GOXJN?=
 =?utf-8?B?STROV3BLMWo2VXBSNDZTSVJVaHRHdjlqd0Z4NnFSOWJMMmdaeXMzSlVMNUsw?=
 =?utf-8?B?RVZZZFZYRjNqeTlNTXVldEsyMFFOd015alVRSUdvZWU0UEJESWp5U0dNSCtr?=
 =?utf-8?B?YVlOdUVHeU44L0FNVkQ1cnpsT2F1dy8wbmphaUFncjFuQ3JRRVQwMWZlUVB0?=
 =?utf-8?B?ODFJSUV4V2IxeUQ2TzlseVErWVRZOXo0OEJlR1ZQYXovS0grbjgzWDMxcUFt?=
 =?utf-8?B?c0JOM0VndXNyMlMwUXl4ekU5YksxSU9wNlUrSWhUdUtJVDZsTEJFODRQR1Zw?=
 =?utf-8?B?cWZzWi8zWFcxSWlpaVhLU054cll6cGZtN28xRUVLL3hrdlFIakVBcG5NU2Rm?=
 =?utf-8?B?YndMMkl1M0k2ZUIwbUJJbWF1cWZBVzVZY0ZML2lmSlA5dzRHenZOSWR2R1Vs?=
 =?utf-8?B?OEMrWlgwczJsNXR6QjNjeDkvYUI1Mk02bVRHVUpLUUlSbXNveWEzbE9lQkVn?=
 =?utf-8?B?b3pXK0NNeTNma2xJM1lRWHZBY3N0aWt1SFB3TDc2eThNUW52WFBHd2VoZGJ5?=
 =?utf-8?B?U1BZb3U3bEZTWWhvZWhXZVlwUyt0NUNndE1mS25mNzQ4Z1lDb0EraGpaNlFE?=
 =?utf-8?B?VGY2S1BEMlE3VDBXZDV3WlBDaXZWYmQ3c3pWblpJWnRmKytJOThMVFR4ZW9L?=
 =?utf-8?B?U0FTSmliam1POFM3TzE3ZnEyNTJSZWt1ZEFyTlkrQWI3ZTh6b29KekFxS2NH?=
 =?utf-8?B?RmFDa1JEVzJLMkg0VGNwdz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(7416011)(376011)(36860700010)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 04:35:54.3404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c378d6-3196-4602-553a-08dc8e86f99f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8249

Hello Russell,

On 6/15/2024 7:56 PM, Russell King (Oracle) wrote:
> On Thu, Jun 13, 2024 at 06:15:59PM +0000, K Prateek Nayak wrote:
>> o Dropping the ARM results since I never got my hands on the ARM64
>>    system I used in my last testing. If I do manage to get my hands on it
>>    again, I'll rerun the experiments and share the results on the thread.
>>    To test the case where TIF_NOTIFY_IPI is not enabled for a particular
>>    architecture, I applied the series only until Patch 3 and tested the
>>    same on my x86 machine with a WARN_ON_ONCE() in do_idle() to check if
>>    tif_notify_ipi() ever return true and then repeated the same with
>>    Patch 4 applied.
> 
> Confused. ARM (32-bit) or ARM64? You patch 32-bit ARM, but you don't
> touch 64-bit Arm. "ARM" on its own in the context above to me suggests
> 32-bit, since you refer to ARM64 later.
> 

In my first RFC posting, I had shared the results for ipistorm on an
ARM64 server [1]. Vincent and Linus Walleij brought to my attention that
ARM32 and ARM64 do not share the thread info flags and I probably saw a
one-off behavior during my testing. Since then, it has been slightly
challenging to get my hands on that machine again in a stable condition
to see if there was any scenario that I might have missed but I tried a
bunch of things on my x86 machine to confirm that an arch that does not
define the TIF_NOTIFY_IPI would not hit these changes.

Rest assured, Patch 5 is for ARM32 machines that currently define
TIF_POLLING_NRFLAG

[1] https://lore.kernel.org/lkml/20240220171457.703-6-kprateek.nayak@amd.com/

-- 
Thanks and Regards,
Prateek

