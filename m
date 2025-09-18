Return-Path: <linux-alpha+bounces-2350-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC59B34C8B
	for <lists+linux-alpha@lfdr.de>; Mon, 25 Aug 2025 22:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13DA4179C35
	for <lists+linux-alpha@lfdr.de>; Mon, 25 Aug 2025 20:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EE1289805;
	Mon, 25 Aug 2025 20:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="jZH9/6ae"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5CF23E32E
	for <linux-alpha@vger.kernel.org>; Mon, 25 Aug 2025 20:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756154905; cv=none; b=tPOZSOo40gFlNlJO/jRojMNQ5pt25lsJmyljwSwEd4LrDMRqknp8BbIcMmM5mLztvFqlsDX/BoDuiJfTu2sTiTotQSmab0K/PnzKoNpAmrDlRIQliRlvUf0UmVECW/mAN27CeUK1US98jX1Y6FChDo9/JxJmocMWhA9FXFXrR34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756154905; c=relaxed/simple;
	bh=ws0OH/LPbfD0uWhZ3//ck7/pwntfVUXedOFJRthyTE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fBYHY5k1T3kp8yZmaWFXjONiuhdqrGtyfMwyY1r6Jvvjx2VQABzhGA69bdc4xwJOwDReUWGElNjF/bJf5JbUJ3c5mQ8sBwLPYdmBCdPsVvNN98yvY36Zzp8fOIcqkRzlJV181N/wuh9l9GgY1vP69BJCUTuY4ZyE9GvyDzBjoyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=jZH9/6ae; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3ea8b3a64beso13897095ab.0
        for <linux-alpha@vger.kernel.org>; Mon, 25 Aug 2025 13:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1756154903; x=1756759703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/dnllQLN8cDpaKVqJzQZtSLrZ7j3LLHfYLifC1ogCM=;
        b=jZH9/6aeiq6scjXh74JMeDRknBu0YK1nVmdvthVMAlC1uKD6/6YiXbcN0d9uOFhQ8y
         n5VOI0KFRdom7vcCh2mFTkp2sEjBeLtvrpwmjhGTwmMURUIf+hINw3wtrwFg0VAZvVFJ
         DnogJpcDUJSSM4JQ5eeutJ85KJnu2jhLgUnKiMuACh3rtdaPxU6Hb5AmPv7aHB4l8mNu
         IvEzWzVGgskyavxiDt7E+Sqw275JD1aC7EtvEnGuIrA5LEDxWYauZo36SBhv+aKCCKmh
         qp7eK8YXq5krcHBKgokh3yv5r2zCwcezlUnx5OFFgipygHxemWQ6ZEwnTtwt5qxHNkMl
         BZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756154903; x=1756759703;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/dnllQLN8cDpaKVqJzQZtSLrZ7j3LLHfYLifC1ogCM=;
        b=wYXR9+wtAgGSwNM1rBIthcUBk8/QQ1NTI8s/UOiHaAzH0GHGE3flKekIgIogUGJtJd
         1h3JFxiV1J1mFE5zaQ1Krmbz3hI55SfPdfmA0vDim8GDYT2TKiDsq6UazcADt7rs0dZ6
         bsjmY2Hq3peKDE7j6wIy1wYJpZlkTrDaGvaMXed3tRjiK8tpvYiauH6hIcC47xFLuMfB
         q0cABfb4on5WvZ1gJCcR7O0EjzxlByWPBDkPxHCC0C6K/gcVC2D0wUUpkjfdFeJKMoaS
         7pgDoqOO8pkL0UXCvp2Dht6E2UxTe2ugXzjrbkxN7hf8bzqRPd1TYRY2t7lT2Qn67Cvl
         VSRw==
X-Forwarded-Encrypted: i=1; AJvYcCWn4MbvYsxXiZ0ZOSNpO4IuX1u5z6vkreIeOxBlAEyBJ1iw72R7HDdE30EohEgpOhdjaGqy5/kbWLiQiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF9Iwj1XkZi7Cc4DDtFTp0hIPAmqtTGfUitOl7E8zVe0KhmwNF
	PrbnZ+6nWwWnGlTTbpQyDNdpdbKH3Uzi8ekYf5MriDyBGfXKY+HDdLJhvqump9rYnZ4=
X-Gm-Gg: ASbGncuVqsOvgUULchh+JcanQTfGfBYmjffJnE+cfh/VD+5SqL90tEsUFe7zgz1N41G
	LybiG+uuHG1ehdGru+NDpYizmCh878Yp8QBrBeq0N8B+F8NGrLTnrwfZ+NMFUc1hvIjrZ21vi6C
	4IjTVfEKyzuM5Ltqm504FPrUWNsdMIBwYKfjpQUVJ7Tg3aVa69h/N+YpTwwBZzzNjadP9+0Uuu5
	NJ6kXcIJWaEDBASKGvN44jwMfqINLQ9xPru6oYjKS3N0j1Ykdxcdj5eyQi7ESPfGUBTIinSMNb6
	tyFep+wldbtA4WFIE5EqQdMCy1RYirpAGdQezfnlkQ1o680kvWRrq217ClxHSg1/6y0xGQFrypo
	nqBVg8CUiXHeNFg==
X-Google-Smtp-Source: AGHT+IGz/OLusjKqnvYuytsepj0QasUaFhQNGeebbI4cWxx4cpCIdsaTdG9b8SEzhdQW1utDLqTgxw==
X-Received: by 2002:a05:6e02:1582:b0:3eb:cca5:5586 with SMTP id e9e14a558f8ab-3ebcca5874cmr83676445ab.17.1756154902655;
        Mon, 25 Aug 2025 13:48:22 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ea4effe70csm53084775ab.51.2025.08.25.13.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 13:48:22 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Thomas Fourier <fourier.thomas@gmail.com>, linux-alpha@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>, 
 Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/3] floppy: A couple of cleanups
Message-Id: <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
Date: Mon, 25 Aug 2025 14:48:21 -0600
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-2ce6c


On Mon, 25 Aug 2025 18:32:54 +0200, Andy Shevchenko wrote:
> There are a few places in architecture code for the floppy driver
> that may be cleaned up. Do it so.
> 
> Assumed to route via Andrew Morton's tree as floppy is basically orphaned.
> 
> Changelog v2:
> - combined separate patches sent earlier into a series
> - added tags (Helge, Geert)
> - fixed typo in the commit message (Geert)
> 
> [...]

Applied, thanks!

[1/3] floppy: Remove unused CROSS_64KB() macro from arch/ code
      commit: d74968780bf287958e2815be5f088dd6c7b7aa19
[2/3] floppy: Replace custom SZ_64K constant
      commit: 8e7ee0f6fa33934373c1c37e8cfb71cff2acea09
[3/3] floppy: Sort headers alphabetically
      commit: d4399e6eb27a803b73d17fe984448a823b4d3a30

Best regards,
-- 
Jens Axboe




