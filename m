Return-Path: <linux-alpha+bounces-89-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 436FA7F8639
	for <lists+linux-alpha@lfdr.de>; Fri, 24 Nov 2023 23:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73C621C20AD3
	for <lists+linux-alpha@lfdr.de>; Fri, 24 Nov 2023 22:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05423BB55
	for <lists+linux-alpha@lfdr.de>; Fri, 24 Nov 2023 22:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-alpha@vger.kernel.org
X-Greylist: delayed 2385 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 24 Nov 2023 13:28:25 PST
Received: from smtp-2.orcon.net.nz (smtp-2.orcon.net.nz [60.234.4.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D4CD41;
	Fri, 24 Nov 2023 13:28:25 -0800 (PST)
Received: from [121.99.247.178] (port=12167 helo=creeky)
	by smtp-2.orcon.net.nz with esmtpa (Exim 4.90_1)
	(envelope-from <mcree@orcon.net.nz>)
	id 1r6d5c-0003Ui-0D; Sat, 25 Nov 2023 09:47:52 +1300
Date: Sat, 25 Nov 2023 09:47:50 +1300
From: Michael Cree <mcree@orcon.net.nz>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] remove the last bits of a.out support
Message-ID: <ZWEL9r5nqyRSfB-t@creeky>
Mail-Followup-To: Michael Cree <mcree@orcon.net.nz>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, x86@kernel.org,
	linux-kernel@vger.kernel.org
References: <20231123180246.750674-1-dimitri.ledkov@canonical.com>
 <87plzzu1w0.fsf@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plzzu1w0.fsf@email.froward.int.ebiederm.org>
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --

On Fri, Nov 24, 2023 at 12:00:15AM -0600, Eric W. Biederman wrote:
> Dimitri John Ledkov <dimitri.ledkov@canonical.com> writes:
> If it is old code like aboot it may be that it is
> difficult to test any changes.  If memory serves you have to flash your
> firmware to change/test aboot.

No, aboot is written to the first sectors of the boot disk. Yes, there
is a special utilty in the aboot tools to write aboot to the boot
sectors and make sure that there is no overlap with the first
partition.

Cheers
Michael.



