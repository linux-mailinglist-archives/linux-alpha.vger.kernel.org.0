Return-Path: <linux-alpha+bounces-1423-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65D9AC705
	for <lists+linux-alpha@lfdr.de>; Wed, 23 Oct 2024 11:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 168D9282694
	for <lists+linux-alpha@lfdr.de>; Wed, 23 Oct 2024 09:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20CE19E997;
	Wed, 23 Oct 2024 09:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="DspM/2Hj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Gn5dneI3"
X-Original-To: linux-alpha@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339BB19C578;
	Wed, 23 Oct 2024 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729677202; cv=none; b=u2/ZNj4xdp7EVOV+aZ53u3kmLWMlUG2RrKrQKl+6JN++dg9IX/VWzZitV+MtoHEQSH60fk0dd1Ltq/AB/C6ImagOEH2n59TYU/LF01IcCfudh5m9VW7FlMDDS+ZateMycjDrOVVGH7pBB+wAgM+faDG5SpkC3jJEUEoobXfFgII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729677202; c=relaxed/simple;
	bh=qsLv2rZSlqnTEYA9IERSsb8U9cnqCY9wcWyw40oW2qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TS/SpHVFXOQqWvK8jUlsfSvW42lZEGfiKG61PkybrSsZIWJNOoI/ZYcBXKUZYkLlP1C8Okz2gfHJ2eXfar8MaekdxsGUuIPL4b6FLtwRIwouOBsWiO9bnEAhrK1DXspJxn8eO4xSZLCJn7mpnmI94Ecx45ZBsEdkEHQX1kab854=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=DspM/2Hj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Gn5dneI3; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 3E54811400B0;
	Wed, 23 Oct 2024 05:53:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 23 Oct 2024 05:53:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1729677198; x=1729763598; bh=qsLv2rZSlq
	nTEYA9IERSsb8U9cnqCY9wcWyw40oW2qU=; b=DspM/2HjXuFw8136TD8VQ9xrds
	oDKcIpJU0PIkeWUcL0SEOExauk/UYWTy+9xJG4iLveYe7JbqKqhpZjgeylWLrOan
	y1unwGuL7VhXzASIo7C9kULZSnc7CRor7Sv6Rhf3YFHqidZ7rgVVJNoNVlH1LJoz
	7BwoUfHEqaAP+1H3JQhTzGxQsz8/w6zQB6SS2MV1CYHpKiibvpniHUX9T4nJzeII
	F7rxqbhwZLzTqfNeuKuJS0lFEB2zgPRbCHe/DYfdteXu8GhJjZ4If6PLztG/EzSk
	o9Uo3/PgKyX5vjZCjbO6n4aWMQZLbBGEPTkP0pgGMaG7j15Ib+Blv5aDMUaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1729677198; x=1729763598; bh=qsLv2rZSlqnTEYA9IERSsb8U9cnq
	CY9wcWyw40oW2qU=; b=Gn5dneI3689mB6guJwxDv9zyCQtCLK1lc0QkRhMaLI6a
	hXkSdpVme6FXSr6zoJSd4UpFTT6L02IF3cc4ssiIWL3hZVwy6ax+GiNPRZoPAFeL
	PbO1P90yLqHEgrz/v5OvUPY7xWney3niNqB8gCnBkcJERY1GB0ZSbNH+Xr9AIU3R
	/zgydh3FlInfKRunEnr6MeCyRyPV8s5igq5nUFMeQRqxrtvA/zkLBE2HwhWLPStj
	rsztwq7e3eYZ44F67DKnf+3ljh2IOVw473YAz1/lswUNRu24Zk34mmuil9FTrBE3
	pUBD7/UpyKN2KqnIYQyjCba2jPvvh/e7ZQpapyTLJw==
X-ME-Sender: <xms:iscYZ8Ehku7cz2O9HmdVIkSnKcwQAGSglLEb3AIkMt4fL5mgyjQmBQ>
    <xme:iscYZ1XhbaIdCZ5dl5PAik2CJ9Poo8zYLUqhUBUs7De0uVavLP4NxuloT5G_D5TBf
    br_bCsqJ5Qe5Ek_o5s>
X-ME-Received: <xmr:iscYZ2Kn90g451Cpa4UEWZPxzf_BdbuKQdMb9tadSoY72XHbpUn2Uyd-02ayooQYiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeijedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfg
    fuvfevfhfhjggtsehgtderredtreejnecuhfhrohhmpeflihgrgihunhcujggrnhhguceo
    jhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnh
    epieethfffffdvgfdvueevvddvveduteeukefffefhvdejfffgkefgfeeijedvgeelnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgt
    ohhmpdhnsggprhgtphhtthhopeefjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epjhgvfhhfsggrihesrghoshgtrdhiohdprhgtphhtthhopeifrghnghihuhhlihesuhhn
    ihhonhhtvggthhdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunh
    gurghtihhonhdrohhrghdprhgtphhtthhopehprghttghhvghssehlihhsthhsrdhlihhn
    uhigrdguvghvpdhrtghpthhtohepnhhikhhithgrsehtrhhvnhdrrhhupdhrtghpthhtoh
    epihhnkhesjhhurhgrshhsihgtrdhprghrkhdrmhhsuhdrrhhupdhrtghpthhtohepshhh
    tggpfihorhhksehmrghilhdrrhhupdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvg
    hrshhonheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhgrthhtshhtkeeksehgmhgr
    ihhlrdgtohhm
X-ME-Proxy: <xmx:iscYZ-G8DyHMJqbSv3kDrtKNU5IRTxqfKW14NrCWGvOu4PLDg0FgDw>
    <xmx:iscYZyVWFbH6cScdcM7kZcu2xPcUIPfRkHRZUwaHYdFTO-zwZpAO3g>
    <xmx:iscYZxOIfZJWLQMKkDa8fSw5JxuPHwK9_XSHOJKJ3-cDzRwJf3nNlA>
    <xmx:iscYZ52T1YXVFjFKN1ojHOKQAHUusIas1KFqfsj2oGiU8XQZ6Ook7A>
    <xmx:jscYZ3aBBd0cVP3xVF6rYgi9ypcZe501pSd6j1Gsex0U2xLLZwsR_cqf>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 05:53:10 -0400 (EDT)
Message-ID: <418359de-e084-47f9-9090-7980e41661e0@flygoat.com>
Date: Wed, 23 Oct 2024 10:53:09 +0100
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH] MAINTAINERS: Remove some entries due to various
 compliance requirements.
To: Mingcong Bai <jeffbai@aosc.io>, WangYuli <wangyuli@uniontech.com>,
 gregkh@linuxfoundation.org
Cc: patches@lists.linux.dev, nikita@trvn.ru, ink@jurassic.park.msu.ru,
 shc_work@mail.ru, richard.henderson@linaro.org, mattst88@gmail.com,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 fancer.lancer@gmail.com, linux-hwmon@vger.kernel.org,
 dmaengine@vger.kernel.org, xeb@mail.ru, netdev@vger.kernel.org,
 s.shtylyov@omp.ru, linux-ide@vger.kernel.org, serjk@netup.ru,
 aospan@netup.ru, linux-media@vger.kernel.org, ddrokosov@sberdevices.ru,
 linux-iio@vger.kernel.org, v.georgiev@metrotek.ru,
 linux-mips@vger.kernel.org, ntb@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, dushistov@mail.ru,
 manivannan.sadhasivam@linaro.org, conor.dooley@microchip.com,
 linux-fpga@vger.kernel.org, tsbogend@alpha.franken.de,
 hoan@os.amperecomputing.com, geert@linux-m68k.org,
 wsa+renesas@sang-engineering.com
References: <2024101835-tiptop-blip-09ed@gregkh>
 <A74519B4332040FA+20241023063058.223139-1-wangyuli@uniontech.com>
 <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <444fa53bdfdee75522a1af41655a99b0@aosc.io>
Content-Language: en-US
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Autocrypt: addr=jiaxun.yang@flygoat.com;
 keydata= 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
 HVO98ZmbMeg=
In-Reply-To: <444fa53bdfdee75522a1af41655a99b0@aosc.io>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------goP0aHijuEfA0XdZHIGSgQra"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------goP0aHijuEfA0XdZHIGSgQra
Content-Type: multipart/mixed; boundary="------------gXwLSysqjj5TSkD0gx1w2OSN";
 protected-headers="v1"
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: Mingcong Bai <jeffbai@aosc.io>, WangYuli <wangyuli@uniontech.com>,
 gregkh@linuxfoundation.org
Cc: patches@lists.linux.dev, nikita@trvn.ru, ink@jurassic.park.msu.ru,
 shc_work@mail.ru, richard.henderson@linaro.org, mattst88@gmail.com,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 fancer.lancer@gmail.com, linux-hwmon@vger.kernel.org,
 dmaengine@vger.kernel.org, xeb@mail.ru, netdev@vger.kernel.org,
 s.shtylyov@omp.ru, linux-ide@vger.kernel.org, serjk@netup.ru,
 aospan@netup.ru, linux-media@vger.kernel.org, ddrokosov@sberdevices.ru,
 linux-iio@vger.kernel.org, v.georgiev@metrotek.ru,
 linux-mips@vger.kernel.org, ntb@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, dushistov@mail.ru,
 manivannan.sadhasivam@linaro.org, conor.dooley@microchip.com,
 linux-fpga@vger.kernel.org, tsbogend@alpha.franken.de,
 hoan@os.amperecomputing.com, geert@linux-m68k.org,
 wsa+renesas@sang-engineering.com
Message-ID: <418359de-e084-47f9-9090-7980e41661e0@flygoat.com>
Subject: Re: [PATCH] MAINTAINERS: Remove some entries due to various
 compliance requirements.
References: <2024101835-tiptop-blip-09ed@gregkh>
 <A74519B4332040FA+20241023063058.223139-1-wangyuli@uniontech.com>
 <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <444fa53bdfdee75522a1af41655a99b0@aosc.io>
In-Reply-To: <444fa53bdfdee75522a1af41655a99b0@aosc.io>

--------------gXwLSysqjj5TSkD0gx1w2OSN
Content-Type: multipart/mixed; boundary="------------mPGKAAAuRehn0cV23ixzcqJi"

--------------mPGKAAAuRehn0cV23ixzcqJi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCk9uIDIwMjQvMTAvMjMgMDk6MjYsIE1pbmdjb25nIEJhaSB3cm90ZToNCj4gTm8sIG5v
LCBuby4gTnVoLCB1aC4NCj4NCj4gR3JlZyBoYXMgdW5mb3J0dW5hdGVseSBkZWNpZGVkIHRv
IHJlc3BvbmQgaW4gcHJpdmF0ZSBvdmVyIGEgbWF0dGVyIA0KPiB0aGF0IGJ5IG5vIG1lYW5z
IHNob3VsZCBiZSBnbG9zc2VkIG92ZXIuIEhlcmUgYmVsb3cgaXMgb3VyIGNvbnZlcnNhdGlv
bjoNCg0KSSBjYW4ndCBiZWxpZXZlIGEgc2VuaW9yIG1haW50YWluZXIgaXMgYnJlYWtpbmcg
b3VyIGFncmVlZCBuZXRpcXVldHRlIA0KWzFdLCBidXQgdGhhdCdzIGhhcHBlbmluZy4NCg0K
PiDlnKggMjAyNC0xMC0yMyAxNTo1Ne+8jEdyZWcgS0gg5YaZ6YGT77yaDQpbLi4uXQ0KPg0K
PiBSZXF1ZXN0IGRlY2xpbmVkLiBZb3VyIHJlc3BvbnNlIGlzIG5vdyBwdWJsaWMga25vd2xl
ZGdlIChhbmQgaGV5LCBpZiANCj4gdGhpcyBpcyBub3QgYnkgeW91ciB3aWxsLCBteSBhcG9s
b2dpZXMpLiBBZ2FpbiwgdGhpcyBtYXR0ZXIgcmVxdWlyZXMgDQo+IHB1YmxpYyByZXNwb25z
ZS4NCj4NCj4+IOWcqCAyMDI0LTEwLTIzIDE0OjMw77yMV2FuZ1l1bGkg5YaZ6YGT77yaIEFs
dGhvdWdoIHRoaXMgY29tbWl0IGhhcyBiZWVuIA0KPj4gbWVyZ2VkLCBpdCdzIHN0aWxsIGlt
cG9ydGFudCB0byBrbm93IHRoZQ0KPj4gc3BlY2lmaWMgcmVhc29uIChvciBldmVuIGFuIGV4
YW1wbGUpIHRoYXQgdHJpZ2dlcmVkIHRoaXMgY2hhbmdlIGZvcg0KPj4gZXZlcnlvbmUgaGVy
ZSwgcmlnaHQ/DQo+Pg0KPj4gQW5kIHRob3NlIG1haW50YWluZXJzIHdobyBoYXZlIGJlZW4g
cmVtb3ZlZCBzaG91bGQgYmUgbm90aWZpZWQuDQo+PiBTZWNvbmRlZC4NCj4NCj4gU29ycnks
IGJ1dCB0aGF0J3Mgbm90IGhvdyB0aGlzIGlzIGFsbG93ZWQgdG8gd29yay7CoCBQbGVhc2Ug
Y29udGFjdCB5b3VyDQo+IGNvbXBhbnkgbGF3eWVycyBpZiB5b3UgaGF2ZSBhbnkgcXVlc3Rp
b25zIGFib3V0IHRoaXMuwqAgQW5kIHRoaXMgb25seQ0KPiBhZmZlY3RzIG1haW50YWluZXJz
LCBhcyB5b3UgYXJlbid0IGxpc3RlZCBpbiB0aGUgTUFJTlRBSU5FUlMgZmlsZSwgdGhlcmUN
Cj4gc2hvdWxkIG5vdCBiZSBhbnkgaXNzdWUsIGJ1dCBhZ2FpbiwgY29udGFjdCB5b3VyIGNv
bXBhbnkgaWYgeW91IGhhdmUgYW55DQo+IHF1ZXN0aW9ucyBhcyB0aGV5IGtub3cgd2hhdCBp
cyBnb2luZyBvbi4NCg0KSSB0aGluayB0aGVyZSBhcmUgbm8gcmVndWxhdGlvbnMgb24gZWFy
dGggcHJldmVudGluZyBpdHNlbGYgZnJvbSBiZWluZyANCnJlZmVyZW5jZWQuDQpFdmVuIGlm
IHRoZSByZWd1bGF0aW9uIHByZXZlbnRzIGZ1cnRoZXIgY29tbXVuaWNhdGlvbiB3aXRoIGFm
ZmVjdGVkIGJvZGllcywNCnRoZSB3aWRlciBjb21tdW5pdHkgc3RpbGwgZGVzZXJ2ZXMgYW4g
ZXhwbGFuYXRpb24uDQoNCkFzIGEgcGVyc29uIHdpdGggTSBlbnRyaWVzIEkgZm91bmQgdGhp
cyBiZWhhdmlvciBhcHBhbGxpbmcuIEl0IHNoYWtlcyBtdXR1YWwNCnRydXN0IGJldHdlZW4g
bWFpbnRhaW5lcnMsIGFzIHdlIGFsbCBhc3N1bWVkIHRoYXQgcGF0Y2hlcyBiZWluZyBhcHBs
aWVkIGFyZQ0Kd2VsbCBzY3J1dGluaXplZC4NCg0KQmVzaWRlcywgbWFueSBvZiB1cyBhcmUg
d29ya2luZyBvbiBrZXJuZWwgYXMgaG9iYnlpc3TCoCBpbiBhIHBlcnNvbmFsIA0KY2FwYWNp
dHkuDQpUaGF0IG1lYW5zIHdlIGRvbid0IGhhdmUgYWNjZXNzIHRvIGxhd3llcnMsIGVzcGVj
aWFsbHkgVVMgb25lLiBXaGlsZSBJIA0KdW5kZXJzdGFuZA0KY29ycG9yYXRlIHBhcnRpY2lw
YW50cyBtYXkgYmUgdGhlIG1ham9yaXR5IG9mIHRoZSBjb21tdW5pdHksIHBsZWFzZSANCmRv
bid0IGxlYXZlDQpob2JieWlzdHMgYmVoaW5kIQ0KDQpJJ3ZlIGhhZCBzb21lIGludGVyYWN0
aW9ucyB3aXRoIHNvbWUgb2YgcGVvcGxlIGJlaW5nIHJlbW92ZWQgaGVyZSwgYW5kIEkgDQp3
b3VsZA0Kc2F5IHRoZXkgYXJlIGFsbCBicmlsbGlhbnQgaW5kaXZpZHVhbHMuIEl0J3PCoCBy
ZWFsbHkgc2FkIHRvIHNlZSB0aGVtIA0KYmVpbmcgdHVybmVkIGF3YXkgOi0oDQoNCj4NCj4g
SnVzdCAqd2luayogaWYgeW91IHdlcmUgY29tcGVsbGVkIGludG8gdGhpcy4NCl4gSXQgc291
bmRzIHVucHJvZmVzc2lvbmFsIHRvIG1lLg0KDQpUaGFua3MNCi0gSmlheHVuDQoNClsxXTog
aHR0cHM6Ly9wZW9wbGUua2VybmVsLm9yZy90Z2x4L25vdGVzLWFib3V0LW5ldGlxdWV0dGUt
cXc4OQ0KPg0KPj4gdGhhbmtzLA0KPj4NCj4+IGdyZWcgay1oDQo+DQo+IEJlc3QgUmVnYXJk
cywNCj4gTWluZ2NvbmcgQmFpDQo+DQo=
--------------mPGKAAAuRehn0cV23ixzcqJi
Content-Type: application/pgp-keys; name="OpenPGP_0xC111949073FC0F67.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC111949073FC0F67.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
VGLdoeF3+rqgS68fmJIuiZi00N04
=3DZDar
-----END PGP PUBLIC KEY BLOCK-----

--------------mPGKAAAuRehn0cV23ixzcqJi--

--------------gXwLSysqjj5TSkD0gx1w2OSN--

--------------goP0aHijuEfA0XdZHIGSgQra
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRUECKOsIHRoNfgavxDcQx913cpwwUCZxjHhQUDAAAAAAAKCRBDcQx913cpw2kq
AQDeq0YNu3yH4h1oZ37KEB62NlO3ivCNYq8GfVdSPx92jQD6A4WSofLqHzGEK5X88Tr/5crd1n8y
VHyQR6rScHuZngI=
=luO4
-----END PGP SIGNATURE-----

--------------goP0aHijuEfA0XdZHIGSgQra--

