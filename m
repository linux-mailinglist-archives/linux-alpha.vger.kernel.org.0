Return-Path: <linux-alpha+bounces-3727-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e/62OBwrSGoCnQAAu9opvQ
	(envelope-from <linux-alpha+bounces-3727-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Fri, 03 Jul 2026 23:35:24 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8A8705E49
	for <lists+linux-alpha@lfdr.de>; Fri, 03 Jul 2026 23:35:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=L+X+Ve5r;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-alpha+bounces-3727-lists+linux-alpha=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-alpha+bounces-3727-lists+linux-alpha=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D5B6E30855EF
	for <lists+linux-alpha@lfdr.de>; Fri,  3 Jul 2026 21:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0776349AE0;
	Fri,  3 Jul 2026 21:32:37 +0000 (UTC)
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE67B33859C
	for <linux-alpha@vger.kernel.org>; Fri,  3 Jul 2026 21:32:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783114357; cv=none; b=mNDXb99EWctdMuVuFKFTgcR39ToQb8ZHdn2u5508WbIrB55zJkZQ5GprA8ZWZUJN6bHau1g3z6Tc/VbeDmvh3mpBgYAT7XPsl5+Ke+QVaDYeAMmQZ0oNSlwLl8Ft2RODVRee4eXQEvWkYvMY6r3ExMR3fc4KmSFKE5qj3n1hsE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783114357; c=relaxed/simple;
	bh=2Xe0OMXeeYc9/S4+5LxR1blLhyrbF1Lgb0xGUfI7zl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bN4ji1s6uxBQ1XdVZHNQ5Y56jYLxHcPh62F17NCL7g6fhClquKEblPXEjGN8vp5iFXYUckhB/3oDtURKVa7RX+5Me+7/IVNS0ctayLfaMc//kOHo8HHzR0xjsmN/E+be64bPajz6Ubua1qqqHch24se+eO58M3xlLHl3afntirc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+X+Ve5r; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E908A1F00ACF
	for <linux-alpha@vger.kernel.org>; Fri,  3 Jul 2026 21:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783114355;
	bh=OKSIV0oOxnrYHCfPO5lAQhnCzHPQePBOMJ0ktW8HRY4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=L+X+Ve5rFFmAbHC8BOi+ZIIcP1cQ+6P0y9xuzBuOhkmJ2QjJzMsScrnLbDWzVOq2F
	 CDRw2e90XyAgpu6/TyMFoNgZzEENGTgomFDlUcRuJm9oewwWG9q5ETEjSU6LqIhsGT
	 RknHnNUy5yyQndrBMUliVhBzY0Qn/NmCqHjYaJCADLnWhwzXCHKOuadPuwGNjxwDtA
	 egtpUpasm4nM/6WjRe5gSPw3czVm2DxmoU+KdoEpFKeTbOVDwjgFoFvjj0A5eoNhxe
	 CvE2MRoo/X9U67HLSaLEtE3VRR7CyjJyzx+odq7ir+bVHPCL6tick8FTkJRObVbtD3
	 9rin1/KYJiA0g==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aea9d606f0so987391e87.3
        for <linux-alpha@vger.kernel.org>; Fri, 03 Jul 2026 14:32:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoKYYCUiuMjlAjr2vqniT9dGy8I3BwYOLrMwUFXF5ZoBkfmTJDolLkFz/8q+xxe5bZfCIdikVCd6BJnjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygept65I3+izBpe7OZxEYh+i+6qzOLrF8zoq1w33GwocQdCuca
	HX7OUDQ09wUXccFZJViw1rl0F43nt23mkMSFvqqvVUHprmHAq4oHZSGnVDZpB1iAq/LCA536NdY
	IWDpxPnFPDEjg6yvFS3k/Z8DzPxcR/pE=
X-Received: by 2002:a05:6512:8391:b0:5ae:ba2b:b469 with SMTP id
 2adb3069b0e04-5aed5092745mr72984e87.18.1783114353971; Fri, 03 Jul 2026
 14:32:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
 <20260629130616.642022-2-ruanjinjie@huawei.com> <akdp6GAu77-ipsXA@kunlun.suse.cz>
 <87cxx4mmim.ffs@fw13> <akeIK5TRCjlKbzbp@J2N7QTR9R3>
In-Reply-To: <akeIK5TRCjlKbzbp@J2N7QTR9R3>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 23:32:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLn0Pfhx0bY9XywVkDVU-nyAbvrnf9Wr8TSkuV4hgJL=8w@mail.gmail.com>
X-Gm-Features: AVVi8CegcPVBpxUBhMgaVmjHkjMbMgWpKQVd4voTgZ2p1M7BcZ7lo9TMo7bB8LM
Message-ID: <CAD++jLn0Pfhx0bY9XywVkDVU-nyAbvrnf9Wr8TSkuV4hgJL=8w@mail.gmail.com>
Subject: Re: [PATCH v16 01/18] seccomp: Convert __secure_computing() to return boolean
To: Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, oleg@redhat.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, kees@kernel.org, guoren@kernel.org, 
	chenhuacai@kernel.org, kernel@xen0n.name, geert@linux-m68k.org, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	deller@gmx.de, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, luto@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	chris@zankel.net, jcmvbkbc@gmail.com, peterz@infradead.org, wad@chromium.org, 
	thuth@redhat.com, ada.coupriediaz@arm.com, kevin.brodsky@arm.com, 
	yeoreum.yun@arm.com, song@kernel.org, james.morse@arm.com, 
	anshuman.khandual@arm.com, broonie@kernel.org, liqiang01@kylinos.cn, 
	pengcan@kylinos.cn, ryan.roberts@arm.com, yangtiezhu@loongson.cn, 
	sshegde@linux.ibm.com, mchauras@linux.ibm.com, austin.kim@lge.com, 
	jchrist@linux.ibm.com, arnd@arndb.de, thomas.weissschuh@linutronix.de, 
	sohil.mehta@intel.com, andrew.cooper3@citrix.com, jgross@suse.com, 
	kas@kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,suse.de,huawei.com,redhat.com,linaro.org,gmail.com,armlinux.org.uk,arm.com,xen0n.name,linux-m68k.org,alpha.franken.de,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,nod.at,cambridgegreys.com,sipsolutions.net,alien8.de,linux.intel.com,zytor.com,zankel.net,infradead.org,chromium.org,kylinos.cn,loongson.cn,lge.com,arndb.de,linutronix.de,intel.com,citrix.com,suse.com,vger.kernel.org,lists.infradead.org,kvack.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3727-lists,linux-alpha=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mark.rutland@arm.com,m:tglx@kernel.org,m:msuchanek@suse.de,m:ruanjinjie@huawei.com,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:guoren@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:ysato@users.sourceforge.jp,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:luto@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:chris@z
 ankel.net,m:jcmvbkbc@gmail.com,m:peterz@infradead.org,m:wad@chromium.org,m:thuth@redhat.com,m:ada.coupriediaz@arm.com,m:kevin.brodsky@arm.com,m:yeoreum.yun@arm.com,m:song@kernel.org,m:james.morse@arm.com,m:anshuman.khandual@arm.com,m:broonie@kernel.org,m:liqiang01@kylinos.cn,m:pengcan@kylinos.cn,m:ryan.roberts@arm.com,m:yangtiezhu@loongson.cn,m:sshegde@linux.ibm.com,m:mchauras@linux.ibm.com,m:austin.kim@lge.com,m:jchrist@linux.ibm.com,m:arnd@arndb.de,m:thomas.weissschuh@linutronix.de,m:sohil.mehta@intel.com,m:andrew.cooper3@citrix.com,m:jgross@suse.com,m:kas@kernel.org,m:x86@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mm@kvack.org,m:linux-csky@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um
 @lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-alpha@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-alpha@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[84];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-alpha];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC8A8705E49

On Fri, Jul 3, 2026 at 12:00=E2=80=AFPM Mark Rutland <mark.rutland@arm.com>=
 wrote:

> Bikeshedding below; sorry.
>
> I think the bigger problem is just that secure_computing() is a terrible
> name that does not express the intended semantic -- it's not clear
> whether "secure computing" means "seccomp permit the syscall" or
> "seccomp is enabled and some special rules now apply" or something else
> entirely.
>
> If we're changing the return type, it might be worth renaming the
> function something like:
>
>         seccomp_permits_syscall()

Yeah that's way better, let's do this.
(I also had problems with this function!!)

Rusty Russel's API design manifesto tells us to do this:
https://gist.github.com/mjball/9cd028ac793ae8b351df1379f1e721f9

Yours,
Linus Walleij

