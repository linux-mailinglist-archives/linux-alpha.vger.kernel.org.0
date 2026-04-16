Return-Path: <linux-alpha+bounces-3435-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMv9IufJ4GkdmAAAu9opvQ
	(envelope-from <linux-alpha+bounces-3435-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Thu, 16 Apr 2026 13:37:11 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E372840D79D
	for <lists+linux-alpha@lfdr.de>; Thu, 16 Apr 2026 13:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5317E314FFC3
	for <lists+linux-alpha@lfdr.de>; Thu, 16 Apr 2026 11:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC5A3A8742;
	Thu, 16 Apr 2026 11:29:59 +0000 (UTC)
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAB13A7F70
	for <linux-alpha@vger.kernel.org>; Thu, 16 Apr 2026 11:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338999; cv=none; b=GVcU7IrTUSIYlM4mrYEzinz4tgeWzfpwri/jHI+UCGO/TjUc0ix9QuDLEH9FEUZXDDCP5dxVC1zHPahP+8T04F1wsbbSKH2+tKk1CVED1Ys4qfsdEMbZB5p4ffsdxgZCovHVuki+vVK5/w3ju/RLl7IVahPYAl5f8l3L/lpn5As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338999; c=relaxed/simple;
	bh=FSgVIzpnraycKQsxAztrNgNSM9On/XU1ftEj+pCL/gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QuNW+h+Pele2+glvGScpGmz3bPz8YfQkJgX0ktlmUoM2NQFL1NGuHAuB/jMgQgpbdI5ry3xkDZ78cXDHTvSLsbYTFf42vHbD+XjbeOncm1GC8sq021n+b4+CgwEgyAIiogQXwmP9dc85IDsJEyOf7VemiSAQr9lRel4U662xRyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d7ebe11bffso6532805a34.0
        for <linux-alpha@vger.kernel.org>; Thu, 16 Apr 2026 04:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338996; x=1776943796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AptjVPQ97g683jPGYCmYUacoTRTAG/3/TQY5t1TSdkk=;
        b=YPuK94GnCJISMZQmEN7BYsY7JJrFeJlmy1a992Zwh91hT0MUL2knktx54CS82CepnI
         qktkj86mFJAfUbvLnx46BAMdW55b6OI3PvlXpPjyG8KI2xpotHxYJDfmfUesrfEBF0bw
         pdKOUEnTwcOc0GhW/ZSh6Q2/40HH2Qsa91wlWdD4haBbS5RMDzTcavIV8iMKmR0ECRWw
         oUATqYdcxBeHYKGWTBUI5tQb3YVzjdIrvB7+7wZem6NHoKc+L81l2OAlDiCXlauHHqBx
         UOwZwcxqhkSo3KLO+/KIUrVuScSbiSzkNGZNNhRgwwqNNLTLjYlfseQ5hQzrCHMThLcs
         kwSg==
X-Forwarded-Encrypted: i=1; AFNElJ/lErtYFnU4YMg3c+K3BD1Zy7jc8qhns9jrXMhcIg0U/ky4TvpcnmmXenPgfK98//UY6Po5XpBK0PgavQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9CMbAyD7Eot8wMD2sIOQhjkfscoRJwvXrqAsP8A3Sa9o9c2Ja
	nauvULMymXsH7iJf9c5bYUApgzXx8tTkva+00JwLEoRxkF3YPqvYt5Idk62HvNth
X-Gm-Gg: AeBDievLtJfz2Q4pZkSiJ7qC6A15Pn8dZ7VO81EfR1fbdkZdJSnPefYsnmFi61nYUzc
	YlCBw5+R8plm+ZPcCA8W53LDpWXlowLHFZLLtpawuSY//9AgeRJQjYtv+d9ewc9PAL1TMcaT9T2
	QCl8LXpvtLjam6aCVRTEd+3q5jTanSbnICcCXOcXTj+sGvOIaYdZMIz3ycqFJqqGeVbgLbusWPA
	DKZWHdI7zQtQIpA0Q0WAWEQ/Nm/K0npppVXNBkM8z1QwC7OYKjegaM1a4SATNplM9KNKbtwMzO4
	SkY7G7Qq2K7IvoLwq6PPMYAoUr5242ueCzQkW9fgIqrc55/J/vTGY1Wz/BF3rqx/Xj5l6jt2mw1
	CJN/MvpbdAtPiOOqWMoCeEWyKBAAReX1pLj01c72fxdhz1git3pSdSv1is/nu36hJ2VAhNUAs2c
	hYkeu/bvF3fvH4TMrYlrv/XV7g9QnmJvkAjBufPMyKwUn6zNLEQQw593A86+zzjknRVO3sUwlz2
	Us=
X-Received: by 2002:a05:6830:252:b0:7dc:3e5a:64db with SMTP id 46e09a7af769-7dc3e5a693cmr8212412a34.26.1776338996194;
        Thu, 16 Apr 2026 04:29:56 -0700 (PDT)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com. [209.85.167.169])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc76a1284fsm3548282a34.5.2026.04.16.04.29.55
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:29:56 -0700 (PDT)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-471618e20a5so4055191b6e.1
        for <linux-alpha@vger.kernel.org>; Thu, 16 Apr 2026 04:29:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8l1zb5KydARZDZXbeie9GqIITTY6yGvMpX0zDhfyDmiz50m2sQGSBjT58aQChLoQq9COk3sSS3sFhzKg==@vger.kernel.org
X-Received: by 2002:a05:6122:788:b0:56f:1ed6:1d29 with SMTP id
 71dfb90a1353d-56f3bca6059mr11244615e0c.9.1776338533353; Thu, 16 Apr 2026
 04:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120317.910770161@kernel.org>
In-Reply-To: <20260410120317.910770161@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1aShz8esbYzJ7T-0Na6++_Yi315aCiUx0Cnsgod5uUg@mail.gmail.com>
X-Gm-Features: AQROBzBwwjc8yd10cT00Tu5Dl2qrCYQStWr3Lcobhh8coMrpPeCH9vhBSNokYJk
Message-ID: <CAMuHMdX1aShz8esbYzJ7T-0Na6++_Yi315aCiUx0Cnsgod5uUg@mail.gmail.com>
Subject: Re: [patch 05/38] treewide: Remove CLOCK_TICK_RATE
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,arndb.de,kernel.org,linux.intel.com,lists.linux.dev,pengutronix.de,gondor.apana.org.au,kvack.org,infradead.org,plugable.com,mit.edu,linux-foundation.org,gmail.com,google.com,googlegroups.com,alumni.ethz.ch,zx2c4.com,linaro.org,armlinux.org.uk,lists.infradead.org,arm.com,lists.linux-m68k.org,southpole.se,gmx.de,ellerman.id.au,lists.ozlabs.org,linux.ibm.com,davemloft.net];
	TAGGED_FROM(0.00)[bounces-3435-lists,linux-alpha=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-alpha@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-alpha];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E372840D79D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 10 Apr 2026 at 14:18, Thomas Gleixner <tglx@kernel.org> wrote:
> This has been scheduled for removal more than a decade ago and the comments
> related to it have been dutifully ignored. The last dependencies are gone.
>
> Remove it along with various now empty asm/timex.h files.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

>  arch/m68k/include/asm/timex.h       |   15 ---------------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

