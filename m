Return-Path: <linux-alpha+bounces-143-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E01E85C236
	for <lists+linux-alpha@lfdr.de>; Tue, 20 Feb 2024 18:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 797F61F21245
	for <lists+linux-alpha@lfdr.de>; Tue, 20 Feb 2024 17:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C163876C69;
	Tue, 20 Feb 2024 17:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nua/yKas"
X-Original-To: linux-alpha@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2087.outbound.protection.outlook.com [40.107.102.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56802626C6;
	Tue, 20 Feb 2024 17:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708449383; cv=fail; b=VcfO6I0jibjT6RITnmt0mGaKnp7VeLIreezjMqvayj2kz82ElDbhRG5PGibzFZzQad6xeIyvytMhFMxolaNIuwKNYbw0jddp6el4UA8Kdhwg0p46DvN0lPAhPrn0I0d2/Aa47K0IcgaEnt6Itn2ox/rShjvzUo/HciDNfJfcgVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708449383; c=relaxed/simple;
	bh=+83drqfYC8Xe4UqCzmUPm3kVQ1QS2mWTb9Xdtc63oQY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nxs2IuOrWwv3CAys6rYqkBZNazyLU/ubdjSmkiJHs2aEtzfp2YZ2eYPM2yXGHHyS2ffJlVSJvQm4l0k8yH2NCx6XTZGpmJmfbv50odt7keyx0baP23g1iWDGAaLFF6W4Hr+aRREN7rLO8SWYEZzRVwzM1wJEVlPIeuR6qNWUDWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nua/yKas; arc=fail smtp.client-ip=40.107.102.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKm0qV1ViYO6k6xFAms8GJXCIGavzaCUXjmiV9tWZ7KJBIyHo80lSsMv3Oj/JDPsKsIuTWb15z9PalzkR9qi0bdbz6dFitDX8H/s0pndj9GsLT007qc1YhJRjBjN97jLu7sAAlCAfUsUzNXAKXq9ZR2+AeCWhwszQ2EjVVXFlaAkJKLWoVcRjxrbx6zJbPW9jiiDrapHKjT2LNBwUifos4WXpOSIRX7TMusLU5X2g2xN6EjpsbM0tKzrZes9qLUfIsSWX0gyl6nywe1LTmKprqXfngXQMgCidG2OKDDH+2C8TCmXXsYskuipA74TlV+kZjWb++/LYVi9TcxC/kswvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quZsNkcGT9Wh6N0HLP1+7TfKAtPtAmacaj9LCgxfhHo=;
 b=TtrPS13UocYReYInoQ7ETK56+ROfF2KmZgJQGP8V+njL2FZzY1s+mkXP4PnGnLU2M1jnLQLRvQD5MCTBoNYKluu9z9sJOr6L+G/n+bKaGjkNsujH6N8qTyEfJbMEKsC9g1nko9LNXOu+fBX0+SFiVcyNpX0esdcMAX5jxSng0N0SgZlwF2jwX+O0U0AxSQGvmH6xqvWacXY77GU8ceb3UJhYinYiMZ23Ksibl33qjo1BM6UJAJdsoQh80HhilZREAXz0PmyL1lUaCZO0sEE2C4D4rS2KlksXVfjRP7Gfjnp1t6qBueRJ4mGA6nLNz413WMfXcnj+FLo/a7ollb9zGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quZsNkcGT9Wh6N0HLP1+7TfKAtPtAmacaj9LCgxfhHo=;
 b=nua/yKasOTvHORFHiCb8vPsLqQkRZbyQAw6eOv3VPG4Ixw1lLRCx/Et9aMU8Z4CVKRl4SKEdXULH0bArx9Z8OzLi2KLYRGj09tA0MruO8pUHTQSjKQbohhEHM8f8sF0ZXCl+iC5fi5R3ez/ECs0BiEljAvjseUapeek90khZ7jc=
Received: from DS7PR03CA0081.namprd03.prod.outlook.com (2603:10b6:5:3bb::26)
 by DM6PR12MB4203.namprd12.prod.outlook.com (2603:10b6:5:21f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Tue, 20 Feb
 2024 17:16:17 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::f6) by DS7PR03CA0081.outlook.office365.com
 (2603:10b6:5:3bb::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.40 via Frontend
 Transport; Tue, 20 Feb 2024 17:16:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 17:16:17 +0000
Received: from BLR5CG134614W.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 20 Feb
 2024 11:15:57 -0600
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Richard Henderson
	<richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, "Guo
 Ren" <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>, Dinh Nguyen
	<dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, Stefan Kristiansson
	<stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
	<deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh
 Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz
	<glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, Peter Zijlstra
	<peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ardb@kernel.org>,
	Andrew Donnellan <ajd@linux.ibm.com>, Nicholas Miehlbradt
	<nicholas@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Josh Poimboeuf <jpoimboe@kernel.org>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, Rick Edgecombe
	<rick.p.edgecombe@intel.com>, Tony Battersby <tonyb@cybernetics.com>, "Brian
 Gerst" <brgerst@gmail.com>, Tim Chen <tim.c.chen@linux.intel.com>, "David
 Vernet" <void@manifault.com>, <x86@kernel.org>,
	<linux-alpha@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-csky@vger.kernel.org>, <linux-openrisc@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-sh@vger.kernel.org>, <sparclinux@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [RFC PATCH 01/14] thread_info: Add helpers to test and clear TIF_NOTIFY_IPI
Date: Tue, 20 Feb 2024 22:44:44 +0530
Message-ID: <20240220171457.703-2-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220171457.703-1-kprateek.nayak@amd.com>
References: <20240220171457.703-1-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|DM6PR12MB4203:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb4d987-a812-4cdb-a2a9-08dc3237a66d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1PHn4rdjZx5dckahSzNyAtyE18pz/wuCdYswBnjZz1uMl4IiK+vmnleg7VvbcXv77L1F4csYu0PQ0Ilp2/XNyu/5Kf9Uq6vqq4nd/XMhPb4Gltv1tPxeCyS5VEwgfFotO/sqM3JuGIAVKPCLNnc8ZPzMueNUBPiX+owSc3i5fHS7y/mXLURcHsJgwwwrVdKWV6j6gZq3msDpBnSHiYhtEFpLN3/7gWXGME9KM55UmFz8q8cfnk8GfBOLdpelGurI1edhTrFCsnmWszgG51CaDbP+EMr3ZsfMOkJQ7xof4OijH8Rs3hQtEx0ruIXGx/nNORVnZdLIZEtwEAVN49v1ofSeMJ7opno+P+edqOFIcAZ5IJ5yn0hBuOl7K906C4iTFUMD1MdYCwveMuEzGTuyDcm0hHFHAYeJaEmDe1ANpnVqb3okggp8N2Je61UIT8SMfVMdOgYlyjJAYbeTbORjirKp4tSjwwAmUEquVGJGLiH4EJCT3N7v7Ldv8919lxsjPOKFEGpshHDhJfU/Rnh1HpHGPEfObiTtPJSzoa8XWjk9uwIdztWGe+tM78VbYLENjm7ysS6PSjp+SfSbfehlLJGv/LQRJ2Ds6Y9WvKLtsKg1MT34YAAWacAALNbZb25mESyfKuZpcpNMCDZyQuWMpETkG2WFMbJmbTVIFZ0Ldk4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 17:16:17.5310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb4d987-a812-4cdb-a2a9-08dc3237a66d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4203

From: "Gautham R. Shenoy" <gautham.shenoy@amd.com>

Introduce the notion of TIF_NOTIFY_IPI flag. When a processor in
TIF_POLLING mode needs to process an IPI, the sender sets NEED_RESCHED
bit in idle task's thread_info to pull the target out of idle and avoids
sending an interrupt to the idle CPU. When NEED_RESCHED is set, the
scheduler assumes that a new task has been queued on the idle CPU and
calls schedule_idle(), however, it is not necessary that an IPI on an
idle CPU will necessarily end up waking a task on the said CPU. To avoid
spurious calls to schedule_idle() assuming an IPI on an idle CPU will
always wake a task on the said CPU, TIF_NOTIFY_IPI will be used to pull
a TIF_POLLING CPU out of idle.

Since the IPI handlers are processed before the call to schedule_idle(),
schedule_idle() will be called only if one of the handlers have woken up
a new task on the CPU and has set NEED_RESCHED.

Add tif_notify_ipi() and current_clr_notify_ipi() helpers to test if
TIF_NOTIFY_IPI is set in the current task's thread_info, and to clear it
respectively. These interfaces will be used in subsequent patches as
TIF_NOTIFY_IPI notion is integrated in the scheduler and in the idle
path.

[ prateek: Split the changes into a separate patch, add commit log ]

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Guo Ren <guoren@kernel.org>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Daniel Bristot de Oliveira <bristot@redhat.com>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Cc: Nicholas Miehlbradt <nicholas@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Tony Battersby <tonyb@cybernetics.com>
Cc: Brian Gerst <brgerst@gmail.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>
Cc: David Vernet <void@manifault.com>
Cc: x86@kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: linux-openrisc@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Signed-off-by: Gautham R. Shenoy <gautham.shenoy@amd.com>
Co-developed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 include/linux/thread_info.h | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/linux/thread_info.h b/include/linux/thread_info.h
index 9ea0b28068f4..1e10dd8c0227 100644
--- a/include/linux/thread_info.h
+++ b/include/linux/thread_info.h
@@ -195,6 +195,49 @@ static __always_inline bool tif_need_resched(void)
 
 #endif /* _ASM_GENERIC_BITOPS_INSTRUMENTED_NON_ATOMIC_H */
 
+#ifdef TIF_NOTIFY_IPI
+
+#ifdef _ASM_GENERIC_BITOPS_INSTRUMENTED_NON_ATOMIC_H
+
+static __always_inline bool tif_notify_ipi(void)
+{
+	return arch_test_bit(TIF_NOTIFY_IPI,
+			     (unsigned long *)(&current_thread_info()->flags));
+}
+
+static __always_inline void current_clr_notify_ipi(void)
+{
+	arch_clear_bit(TIF_NOTIFY_IPI,
+		       (unsigned long *)(&current_thread_info()->flags));
+}
+
+#else
+
+static __always_inline bool tif_notify_ipi(void)
+{
+	return test_bit(TIF_NOTIFY_IPI,
+			(unsigned long *)(&current_thread_info()->flags));
+}
+
+static __always_inline void current_clr_notify_ipi(void)
+{
+	clear_bit(TIF_NOTIFY_IPI,
+		  (unsigned long *)(&current_thread_info()->flags));
+}
+
+#endif /* _ASM_GENERIC_BITOPS_INSTRUMENTED_NON_ATOMIC_H */
+
+#else /* !TIF_NOTIFY_IPI */
+
+static __always_inline bool tif_notify_ipi(void)
+{
+	return false;
+}
+
+static __always_inline void current_clr_notify_ipi(void) { }
+
+#endif /* TIF_NOTIFY_IPI */
+
 #ifndef CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES
 static inline int arch_within_stack_frames(const void * const stack,
 					   const void * const stackend,
-- 
2.34.1


