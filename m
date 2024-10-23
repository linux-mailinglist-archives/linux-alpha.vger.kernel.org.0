Return-Path: <linux-alpha+bounces-1411-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E73C9AC1D6
	for <lists+linux-alpha@lfdr.de>; Wed, 23 Oct 2024 10:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A9A5283BEC
	for <lists+linux-alpha@lfdr.de>; Wed, 23 Oct 2024 08:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B901315C15A;
	Wed, 23 Oct 2024 08:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="SM0jntru"
X-Original-To: linux-alpha@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C3B61FF2;
	Wed, 23 Oct 2024 08:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672598; cv=none; b=MnvGtOFWh8EWoCM6H3ug5Pvj8krYk/co0kfllw/2jYiZmLtKSH7zMt2wmc/ZbC5LSG+FDLANccJnCjbFHqrU3rpW2dcbVgWcwEBZcTZ4AwH+HWLyLjDQ5WvhDJ7XGkW69fw8oY4hFNIpd4ApFXgSVKH+G6k3VbrB6ReYxKhlggc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672598; c=relaxed/simple;
	bh=gtY2OJ7TcxMTeGrHpTe/cOtjGE5mPafwYi1sxlh+UE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbr0FoAl+DwYXld4iWhaD4CM6k/7frDqlcoGuhWWapfloHcNTbUOTY14RVI3IqcT5OG69DZnohIF8dXBWw1FXKnp4bPchYQbTEyi9/odtu0g3IwT4hegoKw5XXybnA+PeN26W9/ooTrmNiUp885OV72a+z6Ab3BlhAX8Es4QKyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=SM0jntru; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1729672524;
	bh=gtY2OJ7TcxMTeGrHpTe/cOtjGE5mPafwYi1sxlh+UE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=SM0jntrueJ2qldIry8Hj76B4lwF8QMGQOEyDsW42Y4NTZYq5ETGy0bEmDZtMWHk44
	 KmGYT1mLyen7rBYWySRB4OwYBPXIMoCMwuFScC0bW82G25QKbT1pQienTJhhewQe47
	 JqrhBuK/gk9bcl5aBLtF2zMa9BHJVb8rj3Q/inN4=
X-QQ-mid: bizesmtp87t1729672513t5popqgn
X-QQ-Originating-IP: +JJQ3zOs2vuyAniYyLjRm5N+4Gi6nGQUSpT3gfaI/u0=
Received: from [10.20.53.22] ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Oct 2024 16:35:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8095621514156428052
Message-ID: <E2371706B30AEA49+684b91ce-724e-4108-be4d-5f0130994448@uniontech.com>
Date: Wed, 23 Oct 2024 16:35:08 +0800
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Nikita Travkin <nikita@trvn.ru>, Kexy Biscuit <kexybiscuit@aosc.io>
Cc: jeffbai@aosc.io, gregkh@linuxfoundation.org,
 torvalds@linux-foundation.org, aospan@netup.ru, conor.dooley@microchip.com,
 ddrokosov@sberdevices.ru, dmaengine@vger.kernel.org, dushistov@mail.ru,
 fancer.lancer@gmail.com, geert@linux-m68k.org, hoan@os.amperecomputing.com,
 ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
 manivannan.sadhasivam@linaro.org, mattst88@gmail.com,
 netdev@vger.kernel.org, ntb@lists.linux.dev, patches@lists.linux.dev,
 richard.henderson@linaro.org, s.shtylyov@omp.ru, serjk@netup.ru,
 shc_work@mail.ru, tsbogend@alpha.franken.de, v.georgiev@metrotek.ru,
 wsa+renesas@sang-engineering.com, xeb@mail.ru
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <20241023080935.2945-2-kexybiscuit@aosc.io>
 <fdae64c17b4176e1ff70784bc44a4c06@trvn.ru>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <fdae64c17b4176e1ff70784bc44a4c06@trvn.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------J884VbeBrT8RovZp0ltZKJG0"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: ObTD84GaoEn7YuSK66VS86H1jlGWLuLDHsPeKai/TmEWApeBIkwKWo3Z
	dA5KEwbyNj3FOUHqfvu05Lyef3e6MsRro0h0CkOUsUiS/rpHKBcEoCQe+/ihrQmDEtrKw5p
	TYHVTCFdzuPHrZlpVDd8LchC9nXZmrWqvlUso0krjwlSDmNqZY6mxIZZenP7vN6+q931ws3
	/T7l4+kzdxyS4f6/E+ipiArJgc8AjNOxYCvyZhErV9Kd0A1D9YisocfUdBjAAs09xAlfTil
	NQC/lusbQB2OBzxEubWTphn5d5xa4De5pyD+EUqBY4svgKJiTkUxvvaWPxh1aaYb/Nf2mx0
	DurhKlPI0ciGEw7c84znkw+fdyhel5a/jENQicofY0IO0jyCT+FxbLLde8k3BkCs6Ln+pcv
	xZkWAL5rdbDpOgG0YHpglyr89ZwuoimVXG5KvYo1T3lnM5dsRzibYSHTgRLIzu2qry6fizC
	2oPcU0nMOJxJpJaFq9WeB5OZ2UOfr/fyw5va6cyHjjNsy5iuCSkzup5gM9cZEt7CR16hXVT
	6lphNH4lnrhjGgFqUckoGPlb8JZl1fHbxY0Ev31e3Eb2Gfl3BQ4MAEOaPviFnMHigq20Ra3
	z8GHzpFkVIkwvIMZc2WCnXnrlbNz00I08spokqCnHHV92w9GnowNIY0+Ogh0yG7yEKzhnAy
	6qf2P/my/pwYUvgv9stlQe87TccQCHpz9fock/iR2lTwKsfkVEVoW9NBWBjcSuMAaTha1OC
	5qZROAS3NskwkL7/p3Q36O36/puW9D56gn0g6fIAhZAWfBy8trvhAmMYKD5R3hiKS2TRmd1
	g/GIoHLH8Eqe2BcvGA4TINA1FmZlgzjANSMstvvn7ziz0H/oV9t2m2NB4aa3cZE7ksUtu8C
	lMkW5x2MLy1qAwa8nDYi2oD7J2qIdOgbXJDYUHFeQ89/fxXa7qzOutZzgsB07Y/NzWxHEED
	ufMb6FfnlvsQ7xjCimU9mXC5EPOS+eNtRXfEOQMLsaTPq2hKUudyROBi45jHHMZZ0ux2yWv
	T/xrQpdYfGN2e/fFOn
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------J884VbeBrT8RovZp0ltZKJG0
Content-Type: multipart/mixed; boundary="------------87t267w04UlPslvdjOqMDS0c";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Nikita Travkin <nikita@trvn.ru>, Kexy Biscuit <kexybiscuit@aosc.io>
Cc: jeffbai@aosc.io, gregkh@linuxfoundation.org,
 torvalds@linux-foundation.org, aospan@netup.ru, conor.dooley@microchip.com,
 ddrokosov@sberdevices.ru, dmaengine@vger.kernel.org, dushistov@mail.ru,
 fancer.lancer@gmail.com, geert@linux-m68k.org, hoan@os.amperecomputing.com,
 ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
 manivannan.sadhasivam@linaro.org, mattst88@gmail.com,
 netdev@vger.kernel.org, ntb@lists.linux.dev, patches@lists.linux.dev,
 richard.henderson@linaro.org, s.shtylyov@omp.ru, serjk@netup.ru,
 shc_work@mail.ru, tsbogend@alpha.franken.de, v.georgiev@metrotek.ru,
 wsa+renesas@sang-engineering.com, xeb@mail.ru
Message-ID: <684b91ce-724e-4108-be4d-5f0130994448@uniontech.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <20241023080935.2945-2-kexybiscuit@aosc.io>
 <fdae64c17b4176e1ff70784bc44a4c06@trvn.ru>
In-Reply-To: <fdae64c17b4176e1ff70784bc44a4c06@trvn.ru>

--------------87t267w04UlPslvdjOqMDS0c
Content-Type: multipart/mixed; boundary="------------eDdzeuQ8KDS5vjkSpdolENXB"

--------------eDdzeuQ8KDS5vjkSpdolENXB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAyMDI0LzEwLzIzIDE2OjI2LCBOaWtpdGEgVHJhdmtpbiB3cm90ZToNCj4gS2V4eSBC
aXNjdWl0INC/0LjRgdCw0Lso0LApIDIzLjEwLjIwMjQgMTM6MDk6DQo+PiBUaGlzIHJldmVy
dHMgY29tbWl0IDZlOTBiNjc1Y2Y5NDJlNTBjNzBlODM5NGRmYjU4NjI5NzVjM2IzYjIuDQo+
Pg0KPj4gQW4gYWJzb2x1dGVseSBuby1vbmUtZXZlci1yZXZpZXdlZCBwYXRjaCwgbm90IGV2
ZW4gYnkgdGhlIG1haW50YWluZXJzIHdobw0KPj4gZ290IHJlbW92ZWQgdGhlbXNlbHZlcyAt
IGF0IGxlYXN0IG5vdCBvbiB0aGUgbWFpbGluZyBsaXN0LiBUaGVuIHRoZSBwYXRjaA0KPj4g
anVzdCBnb3Qgc2xpcHBlZCBpbnRvIGFuIHVucmVsYXRlZCBzdWJzeXN0ZW0gcHVsbCByZXF1
ZXN0LCBhbmQgZ290IHB1bGxlZA0KPj4gYnkgVG9ydmFsZHMgd2l0aCBub3QgZXZlbiBhIGNv
bW1lbnQuDQo+Pg0KPj4gV2hhdCBhYm91dCB0aGUgbmV4dCB0aW1lPyBXaG8gbmV4dCB3b3Vs
ZCBiZSByZW1vdmVkIGZyb20gdGhlIE1BSU5UQUlORVJTDQo+PiBmaWxlLCB0aGUga2VybmVs
Lm9yZyBpbmZyYXN0cnVjdHVyZT8gV2hhdCBpZiB0aGUgY29tcGxpYW5jZSByZXF1aXJlcw0K
Pj4gYW5vdGhlciBYWiBiYWNrZG9vciB0byBiZSBkZXZlbG9wZWQgd2l0aG91dCBmdXJ0aGVy
IGV4cGxhbmF0aW9uPyBJcyB0aGUNCj4+IGtlcm5lbCBkZXZlbG9wbWVudCBwcm9jZXNzIHN0
aWxsIGRvbmUgaW4gcHVibGljPw0KPj4NCj4+IEFyZSB0aGUgImNvbXBsaWFuY2UgcmVxdWly
ZW1lbnRzIiBkb2N1bWVudGVkIG9uIGRvY3Mua2VybmVsLm9yZz8gV2hvIGFyZQ0KPj4gcmVz
cG9uc2libGUgZm9yIHRoZW0/IEFyZSBhbGwgdGhhdCBhcmUgcmVzcG9uc2libGUgZW1wbG95
ZWVzIG9mDQo+PiBUaGUgTGludXggRm91bmRhdGlvbiwgd2hpY2ggaXMgcmVndWxhdGVkIGJ5
IHRoZSBVLlMuIGxlZ2lzbGF0dXJlPw0KPj4NCj4+IEZpeGVzOiA2ZTkwYjY3NWNmOTQgKCJN
QUlOVEFJTkVSUzogUmVtb3ZlIHNvbWUgZW50cmllcyBkdWUgdG8gdmFyaW91cyBjb21wbGlh
bmNlIHJlcXVpcmVtZW50cy4iKQ0KPj4gU2lnbmVkLW9mZi1ieTogS2V4eSBCaXNjdWl0IDxr
ZXh5YmlzY3VpdEBhb3NjLmlvPg0KPj4gLS0tDQo+PiBQbGVhc2Uga2VlcCBhbGwgZGlzY3Vz
c2lvbnMgb24gYXQgbGVhc3Qgb25lIG9mIHRoZSBtYWlsaW5nIGxpc3RzLg0KPj4NCj4+ICAg
TUFJTlRBSU5FUlMgfCAxNzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTc4IGluc2VydGlvbnMo
KykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KPj4g
aW5kZXggZTk2NTlhNWE3ZmIzLi41MDFhYTVjMDg4N2UgMTAwNjQ0DQo+PiAtLS0gYS9NQUlO
VEFJTkVSUw0KPj4gKysrIGIvTUFJTlRBSU5FUlMNCj4+IEBAIC0yNTgsNiArMjU4LDEyIEBA
IEw6CWxpbnV4LWFjZW5pY0BzdW5zaXRlLmRrDQo+PiAgIFM6CU1haW50YWluZWQNCj4+ICAg
RjoJZHJpdmVycy9uZXQvZXRoZXJuZXQvYWx0ZW9uL2FjZW5pYyoNCj4+ICAgDQo+PiArQUNF
UiBBU1BJUkUgMSBFTUJFRERFRCBDT05UUk9MTEVSIERSSVZFUg0KPj4gK006CU5pa2l0YSBU
cmF2a2luIDxuaWtpdGFAdHJ2bi5ydT4NCj4+ICtTOglNYWludGFpbmVkDQo+PiArRjoJRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BsYXRmb3JtL2FjZXIsYXNwaXJlMS1l
Yy55YW1sDQo+PiArRjoJZHJpdmVycy9wbGF0Zm9ybS9hcm02NC9hY2VyLWFzcGlyZTEtZWMu
Yw0KPj4gKw0KPiBBY2tlZC1ieTogTmlraXRhIFRyYXZraW4gPG5pa2l0YUB0cnZuLnJ1Pg0K
Pg0KPj4gICBBQ0VSIEFTUElSRSBPTkUgVEVNUEVSQVRVUkUgQU5EIEZBTiBEUklWRVINCj4+
ICAgTToJUGV0ZXIgS2Flc3RsZSA8cGV0ZXJAcGlpZS5uZXQ+DQo+PiAgIEw6CXBsYXRmb3Jt
LWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnDQo+PiBAQCAtODgyLDYgKzg4OCw3IEBAIEY6
CWRyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdW54aS9jZWRydXMvDQo+PiAgIA0KPj4gICBBTFBI
QSBQT1JUDQo+PiAgIE06CVJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBs
aW5hcm8ub3JnPg0KPj4gK006CUl2YW4gS29rc2hheXNreSA8aW5rQGp1cmFzc2ljLnBhcmsu
bXN1LnJ1Pg0KPj4gICBNOglNYXR0IFR1cm5lciA8bWF0dHN0ODhAZ21haWwuY29tPg0KPj4g
ICBMOglsaW51eC1hbHBoYUB2Z2VyLmtlcm5lbC5vcmcNCj4+ICAgUzoJT2RkIEZpeGVzDQo+
PiBAQCAtMjI1Niw2ICsyMjYzLDEyIEBAIEw6CWxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZyAobW9kZXJhdGVkIGZvciBub24tc3Vic2NyaWJlcnMpDQo+PiAgIFM6CU1h
aW50YWluZWQNCj4+ICAgRjoJYXJjaC9hcm0vbWFjaC1lcDkzeHgvdHM3Mnh4LmMNCj4+ICAg
DQo+PiArQVJNL0NJUlJVUyBMT0dJQyBDTFBTNzExWCBBUk0gQVJDSElURUNUVVJFDQo+PiAr
TToJQWxleGFuZGVyIFNoaXlhbiA8c2hjX3dvcmtAbWFpbC5ydT4NCj4+ICtMOglsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcgKG1vZGVyYXRlZCBmb3Igbm9uLXN1YnNj
cmliZXJzKQ0KPj4gK1M6CU9kZCBGaXhlcw0KPj4gK046CWNscHM3MTF4DQo+PiArDQo+PiAg
IEFSTS9DSVJSVVMgTE9HSUMgRVA5M1hYIEFSTSBBUkNISVRFQ1RVUkUNCj4+ICAgTToJSGFy
dGxleSBTd2VldGVuIDxoc3dlZXRlbkB2aXNpb25lbmdyYXZlcnMuY29tPg0KPj4gICBNOglB
bGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbWFpbC5jb20+DQo+PiBA
QCAtMzgwMiw2ICszODE1LDE0IEBAIEY6CWRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0Lw0KPj4g
ICBGOglpbmNsdWRlL2xpbnV4L2JhY2tsaWdodC5oDQo+PiAgIEY6CWluY2x1ZGUvbGludXgv
cHdtX2JhY2tsaWdodC5oDQo+PiAgIA0KPj4gK0JBSUtBTC1UMSBQVlQgSEFSRFdBUkUgTU9O
SVRPUiBEUklWRVINCj4+ICtNOglTZXJnZSBTZW1pbiA8ZmFuY2VyLmxhbmNlckBnbWFpbC5j
b20+DQo+PiArTDoJbGludXgtaHdtb25Admdlci5rZXJuZWwub3JnDQo+PiArUzoJU3VwcG9y
dGVkDQo+PiArRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL2Jh
aWthbCxidDEtcHZ0LnlhbWwNCj4+ICtGOglEb2N1bWVudGF0aW9uL2h3bW9uL2J0MS1wdnQu
cnN0DQo+PiArRjoJZHJpdmVycy9od21vbi9idDEtcHZ0LltjaF0NCj4+ICsNCj4+ICAgQkFS
Q08gUDUwIEdQSU8gRFJJVkVSDQo+PiAgIE06CVNhbnRvc2ggS3VtYXIgWWFkYXYgPHNhbnRv
c2hrdW1hci55YWRhdkBiYXJjby5jb20+DQo+PiAgIE06CVBldGVyIEtvcnNnYWFyZCA8cGV0
ZXIua29yc2dhYXJkQGJhcmNvLmNvbT4NCj4+IEBAIC02NDU1LDYgKzY0NzYsNyBAQCBGOglk
cml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGkqDQo+PiAgIA0KPj4gICBERVNJR05XQVJFIEVE
TUEgQ09SRSBJUCBEUklWRVINCj4+ICAgTToJTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5p
dmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4NCj4+ICtSOglTZXJnZSBTZW1pbiA8ZmFu
Y2VyLmxhbmNlckBnbWFpbC5jb20+DQo+PiAgIEw6CWRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5v
cmcNCj4+ICAgUzoJTWFpbnRhaW5lZA0KPj4gICBGOglkcml2ZXJzL2RtYS9kdy1lZG1hLw0K
Pj4gQEAgLTk3MzcsNiArOTc1OSwxNCBAQCBGOglkcml2ZXJzL2dwaW8vZ3Bpb2xpYi1jZGV2
LmMNCj4+ICAgRjoJaW5jbHVkZS91YXBpL2xpbnV4L2dwaW8uaA0KPj4gICBGOgl0b29scy9n
cGlvLw0KPj4gICANCj4+ICtHUkUgREVNVUxUSVBMRVhFUiBEUklWRVINCj4+ICtNOglEbWl0
cnkgS296bG92IDx4ZWJAbWFpbC5ydT4NCj4+ICtMOgluZXRkZXZAdmdlci5rZXJuZWwub3Jn
DQo+PiArUzoJTWFpbnRhaW5lZA0KPj4gK0Y6CWluY2x1ZGUvbmV0L2dyZS5oDQo+PiArRjoJ
bmV0L2lwdjQvZ3JlX2RlbXV4LmMNCj4+ICtGOgluZXQvaXB2NC9ncmVfb2ZmbG9hZC5jDQo+
PiArDQo+PiAgIEdSRVRIIDEwLzEwMC8xRyBFdGhlcm5ldCBNQUMgZGV2aWNlIGRyaXZlcg0K
Pj4gICBNOglBbmRyZWFzIExhcnNzb24gPGFuZHJlYXNAZ2Fpc2xlci5jb20+DQo+PiAgIEw6
CW5ldGRldkB2Z2VyLmtlcm5lbC5vcmcNCj4+IEBAIC0xMjkyOSw2ICsxMjk1OSwxMiBAQCBT
OglNYWludGFpbmVkDQo+PiAgIEY6CWRyaXZlcnMvYXRhL3BhdGFfYXJhc2FuX2NmLmMNCj4+
ICAgRjoJaW5jbHVkZS9saW51eC9wYXRhX2FyYXNhbl9jZl9kYXRhLmgNCj4+ICAgDQo+PiAr
TElCQVRBIFBBVEEgRFJJVkVSUw0KPj4gK1I6CVNlcmdleSBTaHR5bHlvdiA8cy5zaHR5bHlv
dkBvbXAucnU+DQo+PiArTDoJbGludXgtaWRlQHZnZXIua2VybmVsLm9yZw0KPj4gK0Y6CWRy
aXZlcnMvYXRhL2F0YV8qLmMNCj4+ICtGOglkcml2ZXJzL2F0YS9wYXRhXyouYw0KPj4gKw0K
Pj4gICBMSUJBVEEgUEFUQSBGQVJBREFZIEZUSURFMDEwIEFORCBHRU1JTkkgU0FUQSBCUklE
R0UgRFJJVkVSUw0KPj4gICBNOglMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFy
by5vcmc+DQo+PiAgIEw6CWxpbnV4LWlkZUB2Z2VyLmtlcm5lbC5vcmcNCj4+IEBAIC0xMjk0
NSw2ICsxMjk4MSwxNSBAQCBGOglkcml2ZXJzL2F0YS9haGNpX3BsYXRmb3JtLmMNCj4+ICAg
RjoJZHJpdmVycy9hdGEvbGliYWhjaV9wbGF0Zm9ybS5jDQo+PiAgIEY6CWluY2x1ZGUvbGlu
dXgvYWhjaV9wbGF0Zm9ybS5oDQo+PiAgIA0KPj4gK0xJQkFUQSBTQVRBIEFIQ0kgU1lOT1BT
WVMgRFdDIENPTlRST0xMRVIgRFJJVkVSDQo+PiArTToJU2VyZ2UgU2VtaW4gPGZhbmNlci5s
YW5jZXJAZ21haWwuY29tPg0KPj4gK0w6CWxpbnV4LWlkZUB2Z2VyLmtlcm5lbC5vcmcNCj4+
ICtTOglNYWludGFpbmVkDQo+PiArVDoJZ2l0IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9kbGVtb2FsL2xpYmF0YS5naXQNCj4+ICtGOglEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXRhL2JhaWthbCxidDEtYWhjaS55YW1sDQo+
PiArRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F0YS9zbnBzLGR3Yy1h
aGNpLnlhbWwNCj4+ICtGOglkcml2ZXJzL2F0YS9haGNpX2R3Yy5jDQo+PiArDQo+PiAgIExJ
QkFUQSBTQVRBIFBST01JU0UgVFgyL1RYNCBDT05UUk9MTEVSIERSSVZFUg0KPj4gICBNOglN
aWthZWwgUGV0dGVyc3NvbiA8bWlrcGVsaW51eEBnbWFpbC5jb20+DQo+PiAgIEw6CWxpbnV4
LWlkZUB2Z2VyLmtlcm5lbC5vcmcNCj4+IEBAIC0xNDE0MCw2ICsxNDE4NSwxNiBAQCBTOglN
YWludGFpbmVkDQo+PiAgIFQ6CWdpdCBnaXQ6Ly9saW51eHR2Lm9yZy9tZWRpYV90cmVlLmdp
dA0KPj4gICBGOglkcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXgtcHhwLltjaF0NCj4+
ICAgDQo+PiArTUVESUEgRFJJVkVSUyBGT1IgQVNDT1QyRQ0KPj4gK006CVNlcmdleSBLb3ps
b3YgPHNlcmprQG5ldHVwLnJ1Pg0KPj4gK006CUFieWxheSBPc3BhbiA8YW9zcGFuQG5ldHVw
LnJ1Pg0KPj4gK0w6CWxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZw0KPj4gK1M6CVN1cHBv
cnRlZA0KPj4gK1c6CWh0dHBzOi8vbGludXh0di5vcmcNCj4+ICtXOglodHRwOi8vbmV0dXAu
dHYvDQo+PiArVDoJZ2l0IGdpdDovL2xpbnV4dHYub3JnL21lZGlhX3RyZWUuZ2l0DQo+PiAr
RjoJZHJpdmVycy9tZWRpYS9kdmItZnJvbnRlbmRzL2FzY290MmUqDQo+PiArDQo+PiAgIE1F
RElBIERSSVZFUlMgRk9SIENYRDIwOTlBUiBDSSBDT05UUk9MTEVSUw0KPj4gICBNOglKYXNt
aW4gSmVzc2ljaCA8amFzbWluQGFudy5hdD4NCj4+ICAgTDoJbGludXgtbWVkaWFAdmdlci5r
ZXJuZWwub3JnDQo+PiBAQCAtMTQxNDgsNiArMTQyMDMsMTYgQEAgVzoJaHR0cHM6Ly9saW51
eHR2Lm9yZw0KPj4gICBUOglnaXQgZ2l0Oi8vbGludXh0di5vcmcvbWVkaWFfdHJlZS5naXQN
Cj4+ICAgRjoJZHJpdmVycy9tZWRpYS9kdmItZnJvbnRlbmRzL2N4ZDIwOTkqDQo+PiAgIA0K
Pj4gK01FRElBIERSSVZFUlMgRk9SIENYRDI4NDFFUg0KPj4gK006CVNlcmdleSBLb3psb3Yg
PHNlcmprQG5ldHVwLnJ1Pg0KPj4gK006CUFieWxheSBPc3BhbiA8YW9zcGFuQG5ldHVwLnJ1
Pg0KPj4gK0w6CWxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZw0KPj4gK1M6CVN1cHBvcnRl
ZA0KPj4gK1c6CWh0dHBzOi8vbGludXh0di5vcmcNCj4+ICtXOglodHRwOi8vbmV0dXAudHYv
DQo+PiArVDoJZ2l0IGdpdDovL2xpbnV4dHYub3JnL21lZGlhX3RyZWUuZ2l0DQo+PiArRjoJ
ZHJpdmVycy9tZWRpYS9kdmItZnJvbnRlbmRzL2N4ZDI4NDFlcioNCj4+ICsNCj4+ICAgTUVE
SUEgRFJJVkVSUyBGT1IgQ1hEMjg4MA0KPj4gICBNOglZYXN1bmFyaSBUYWtpZ3VjaGkgPFlh
c3VuYXJpLlRha2lndWNoaUBzb255LmNvbT4NCj4+ICAgTDoJbGludXgtbWVkaWFAdmdlci5r
ZXJuZWwub3JnDQo+PiBAQCAtMTQxOTIsNiArMTQyNTcsMzUgQEAgRjoJZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9ueHAvaW14LW1pcGktY3Npcy5jDQo+PiAgIEY6CWRyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbnhwL2lteDctbWVkaWEtY3NpLmMNCj4+ICAgRjoJZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9ueHAvaW14OG1xLW1pcGktY3NpMi5jDQo+PiAgIA0KPj4gK01FRElBIERSSVZF
UlMgRk9SIEhFTEVORQ0KPj4gK006CUFieWxheSBPc3BhbiA8YW9zcGFuQG5ldHVwLnJ1Pg0K
Pj4gK0w6CWxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZw0KPj4gK1M6CVN1cHBvcnRlZA0K
Pj4gK1c6CWh0dHBzOi8vbGludXh0di5vcmcNCj4+ICtXOglodHRwOi8vbmV0dXAudHYvDQo+
PiArVDoJZ2l0IGdpdDovL2xpbnV4dHYub3JnL21lZGlhX3RyZWUuZ2l0DQo+PiArRjoJZHJp
dmVycy9tZWRpYS9kdmItZnJvbnRlbmRzL2hlbGVuZSoNCj4+ICsNCj4+ICtNRURJQSBEUklW
RVJTIEZPUiBIT1JVUzNBDQo+PiArTToJU2VyZ2V5IEtvemxvdiA8c2VyamtAbmV0dXAucnU+
DQo+PiArTToJQWJ5bGF5IE9zcGFuIDxhb3NwYW5AbmV0dXAucnU+DQo+PiArTDoJbGludXgt
bWVkaWFAdmdlci5rZXJuZWwub3JnDQo+PiArUzoJU3VwcG9ydGVkDQo+PiArVzoJaHR0cHM6
Ly9saW51eHR2Lm9yZw0KPj4gK1c6CWh0dHA6Ly9uZXR1cC50di8NCj4+ICtUOglnaXQgZ2l0
Oi8vbGludXh0di5vcmcvbWVkaWFfdHJlZS5naXQNCj4+ICtGOglkcml2ZXJzL21lZGlhL2R2
Yi1mcm9udGVuZHMvaG9ydXMzYSoNCj4+ICsNCj4+ICtNRURJQSBEUklWRVJTIEZPUiBMTkJI
MjUNCj4+ICtNOglTZXJnZXkgS296bG92IDxzZXJqa0BuZXR1cC5ydT4NCj4+ICtNOglBYnls
YXkgT3NwYW4gPGFvc3BhbkBuZXR1cC5ydT4NCj4+ICtMOglsaW51eC1tZWRpYUB2Z2VyLmtl
cm5lbC5vcmcNCj4+ICtTOglTdXBwb3J0ZWQNCj4+ICtXOglodHRwczovL2xpbnV4dHYub3Jn
DQo+PiArVzoJaHR0cDovL25ldHVwLnR2Lw0KPj4gK1Q6CWdpdCBnaXQ6Ly9saW51eHR2Lm9y
Zy9tZWRpYV90cmVlLmdpdA0KPj4gK0Y6CWRyaXZlcnMvbWVkaWEvZHZiLWZyb250ZW5kcy9s
bmJoMjUqDQo+PiArDQo+PiAgIE1FRElBIERSSVZFUlMgRk9SIE1YTDVYWCBUVU5FUiBERU1P
RFVMQVRPUlMNCj4+ICAgTDoJbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnDQo+PiAgIFM6
CU9ycGhhbg0KPj4gQEAgLTE0MTk5LDYgKzE0MjkzLDE2IEBAIFc6CWh0dHBzOi8vbGludXh0
di5vcmcNCj4+ICAgVDoJZ2l0IGdpdDovL2xpbnV4dHYub3JnL21lZGlhX3RyZWUuZ2l0DQo+
PiAgIEY6CWRyaXZlcnMvbWVkaWEvZHZiLWZyb250ZW5kcy9teGw1eHgqDQo+PiAgIA0KPj4g
K01FRElBIERSSVZFUlMgRk9SIE5FVFVQIFBDSSBVTklWRVJTQUwgRFZCIGRldmljZXMNCj4+
ICtNOglTZXJnZXkgS296bG92IDxzZXJqa0BuZXR1cC5ydT4NCj4+ICtNOglBYnlsYXkgT3Nw
YW4gPGFvc3BhbkBuZXR1cC5ydT4NCj4+ICtMOglsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmcNCj4+ICtTOglTdXBwb3J0ZWQNCj4+ICtXOglodHRwczovL2xpbnV4dHYub3JnDQo+PiAr
VzoJaHR0cDovL25ldHVwLnR2Lw0KPj4gK1Q6CWdpdCBnaXQ6Ly9saW51eHR2Lm9yZy9tZWRp
YV90cmVlLmdpdA0KPj4gK0Y6CWRyaXZlcnMvbWVkaWEvcGNpL25ldHVwX3VuaWR2Yi8qDQo+
PiArDQo+PiAgIE1FRElBIERSSVZFUlMgRk9SIE5WSURJQSBURUdSQSAtIFZERQ0KPj4gICBN
OglEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+DQo+PiAgIEw6CWxpbnV4LW1l
ZGlhQHZnZXIua2VybmVsLm9yZw0KPj4gQEAgLTE0ODQyLDYgKzE0OTQ2LDEzIEBAIEY6CWRy
aXZlcnMvbXRkLw0KPj4gICBGOglpbmNsdWRlL2xpbnV4L210ZC8NCj4+ICAgRjoJaW5jbHVk
ZS91YXBpL210ZC8NCj4+ICAgDQo+PiArTUVNU0VOU0lORyBNSUNST1NZU1RFTVMgTVNBMzEx
IERSSVZFUg0KPj4gK006CURtaXRyeSBSb2tvc292IDxkZHJva29zb3ZAc2JlcmRldmljZXMu
cnU+DQo+PiArTDoJbGludXgtaWlvQHZnZXIua2VybmVsLm9yZw0KPj4gK1M6CU1haW50YWlu
ZWQNCj4+ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FjY2Vs
L21lbXNlbnNpbmcsbXNhMzExLnlhbWwNCj4+ICtGOglkcml2ZXJzL2lpby9hY2NlbC9tc2Ez
MTEuYw0KPj4gKw0KPj4gICBNRU4gQTIxIFdBVENIRE9HIERSSVZFUg0KPj4gICBNOglKb2hh
bm5lcyBUaHVtc2hpcm4gPG1vcmJpZHJzYUBnbWFpbC5jb20+DQo+PiAgIEw6CWxpbnV4LXdh
dGNoZG9nQHZnZXIua2VybmVsLm9yZw0KPj4gQEAgLTE1MTc1LDYgKzE1Mjg2LDcgQEAgRjoJ
ZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9wY2kxeHh4eC5jDQo+PiAgIA0KPj4gICBN
SUNST0NISVAgUE9MQVJGSVJFIEZQR0EgRFJJVkVSUw0KPj4gICBNOglDb25vciBEb29sZXkg
PGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4gK1I6CVZsYWRpbWlyIEdlb3JnaWV2
IDx2Lmdlb3JnaWV2QG1ldHJvdGVrLnJ1Pg0KPj4gICBMOglsaW51eC1mcGdhQHZnZXIua2Vy
bmVsLm9yZw0KPj4gICBTOglTdXBwb3J0ZWQNCj4+ICAgRjoJRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2ZwZ2EvbWljcm9jaGlwLG1wZi1zcGktZnBnYS1tZ3IueWFtbA0K
Pj4gQEAgLTE1NDI5LDYgKzE1NTQxLDE3IEBAIEY6CWFyY2gvbWlwcy8NCj4+ICAgRjoJZHJp
dmVycy9wbGF0Zm9ybS9taXBzLw0KPj4gICBGOglpbmNsdWRlL2R0LWJpbmRpbmdzL21pcHMv
DQo+PiAgIA0KPj4gK01JUFMgQkFJS0FMLVQxIFBMQVRGT1JNDQo+PiArTToJU2VyZ2UgU2Vt
aW4gPGZhbmNlci5sYW5jZXJAZ21haWwuY29tPg0KPj4gK0w6CWxpbnV4LW1pcHNAdmdlci5r
ZXJuZWwub3JnDQo+PiArUzoJU3VwcG9ydGVkDQo+PiArRjoJRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2J1cy9iYWlrYWwsYnQxLSoueWFtbA0KPj4gK0Y6CURvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9iYWlrYWwsYnQxLSoueWFtbA0KPj4g
K0Y6CWRyaXZlcnMvYnVzL2J0MS0qLmMNCj4+ICtGOglkcml2ZXJzL2Nsay9iYWlrYWwtdDEv
DQo+PiArRjoJZHJpdmVycy9tZW1vcnkvYnQxLWwyLWN0bC5jDQo+PiArRjoJZHJpdmVycy9t
dGQvbWFwcy9waHlzbWFwLWJ0MS1yb20uW2NoXQ0KPj4gKw0KPj4gICBNSVBTIEJPU1RPTiBE
RVZFTE9QTUVOVCBCT0FSRA0KPj4gICBNOglQYXVsIEJ1cnRvbiA8cGF1bGJ1cnRvbkBrZXJu
ZWwub3JnPg0KPj4gICBMOglsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZw0KPj4gQEAgLTE1
NDQxLDYgKzE1NTY0LDcgQEAgRjoJaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9ib3N0b24t
Y2xvY2suaA0KPj4gICANCj4+ICAgTUlQUyBDT1JFIERSSVZFUlMNCj4+ICAgTToJVGhvbWFz
IEJvZ2VuZG9lcmZlciA8dHNib2dlbmRAYWxwaGEuZnJhbmtlbi5kZT4NCj4+ICtNOglTZXJn
ZSBTZW1pbiA8ZmFuY2VyLmxhbmNlckBnbWFpbC5jb20+DQo+PiAgIEw6CWxpbnV4LW1pcHNA
dmdlci5rZXJuZWwub3JnDQo+PiAgIFM6CVN1cHBvcnRlZA0KPj4gICBGOglkcml2ZXJzL2J1
cy9taXBzX2NkbW0uYw0KPj4gQEAgLTE2NDA4LDYgKzE2NTMyLDEyIEBAIEY6CWluY2x1ZGUv
bGludXgvbnRiLmgNCj4+ICAgRjoJaW5jbHVkZS9saW51eC9udGJfdHJhbnNwb3J0LmgNCj4+
ICAgRjoJdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbnRiLw0KPj4gICANCj4+ICtOVEIgSURU
IERSSVZFUg0KPj4gK006CVNlcmdlIFNlbWluIDxmYW5jZXIubGFuY2VyQGdtYWlsLmNvbT4N
Cj4+ICtMOgludGJAbGlzdHMubGludXguZGV2DQo+PiArUzoJU3VwcG9ydGVkDQo+PiArRjoJ
ZHJpdmVycy9udGIvaHcvaWR0Lw0KPj4gKw0KPj4gICBOVEIgSU5URUwgRFJJVkVSDQo+PiAg
IE06CURhdmUgSmlhbmcgPGRhdmUuamlhbmdAaW50ZWwuY29tPg0KPj4gICBMOgludGJAbGlz
dHMubGludXguZGV2DQo+PiBAQCAtMTg0MjgsNiArMTg1NTgsMTMgQEAgRjoJZHJpdmVycy9w
cHMvDQo+PiAgIEY6CWluY2x1ZGUvbGludXgvcHBzKi5oDQo+PiAgIEY6CWluY2x1ZGUvdWFw
aS9saW51eC9wcHMuaA0KPj4gICANCj4+ICtQUFRQIERSSVZFUg0KPj4gK006CURtaXRyeSBL
b3psb3YgPHhlYkBtYWlsLnJ1Pg0KPj4gK0w6CW5ldGRldkB2Z2VyLmtlcm5lbC5vcmcNCj4+
ICtTOglNYWludGFpbmVkDQo+PiArVzoJaHR0cDovL3NvdXJjZWZvcmdlLm5ldC9wcm9qZWN0
cy9hY2NlbC1wcHRwDQo+PiArRjoJZHJpdmVycy9uZXQvcHBwL3BwdHAuYw0KPj4gKw0KPj4g
ICBQUkVTU1VSRSBTVEFMTCBJTkZPUk1BVElPTiAoUFNJKQ0KPj4gICBNOglKb2hhbm5lcyBX
ZWluZXIgPGhhbm5lc0BjbXB4Y2hnLm9yZz4NCj4+ICAgTToJU3VyZW4gQmFnaGRhc2FyeWFu
IDxzdXJlbmJAZ29vZ2xlLmNvbT4NCj4+IEBAIC0xOTUxOCw2ICsxOTY1NSwxNSBAQCBTOglT
dXBwb3J0ZWQNCj4+ICAgRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ky
Yy9yZW5lc2FzLGlpYy1lbWV2Mi55YW1sDQo+PiAgIEY6CWRyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtZW1ldjIuYw0KPj4gICANCj4+ICtSRU5FU0FTIEVUSEVSTkVUIEFWQiBEUklWRVINCj4+
ICtSOglTZXJnZXkgU2h0eWx5b3YgPHMuc2h0eWx5b3ZAb21wLnJ1Pg0KPj4gK0w6CW5ldGRl
dkB2Z2VyLmtlcm5lbC5vcmcNCj4+ICtMOglsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5l
bC5vcmcNCj4+ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3Jl
bmVzYXMsZXRoZXJhdmIueWFtbA0KPj4gK0Y6CWRyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVz
YXMvS2NvbmZpZw0KPj4gK0Y6CWRyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvTWFrZWZp
bGUNCj4+ICtGOglkcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmIqDQo+PiArDQo+
PiAgIFJFTkVTQVMgRVRIRVJORVQgU1dJVENIIERSSVZFUg0KPj4gICBSOglZb3NoaWhpcm8g
U2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+PiAgIEw6CW5l
dGRldkB2Z2VyLmtlcm5lbC5vcmcNCj4+IEBAIC0xOTU2Nyw2ICsxOTcxMywxNCBAQCBGOglE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3JlbmVzYXMscm1vYmlsZS1p
aWMueWFtbA0KPj4gICBGOglkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXJjYXIuYw0KPj4gICBG
Oglkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXNoX21vYmlsZS5jDQo+PiAgIA0KPj4gK1JFTkVT
QVMgUi1DQVIgU0FUQSBEUklWRVINCj4+ICtSOglTZXJnZXkgU2h0eWx5b3YgPHMuc2h0eWx5
b3ZAb21wLnJ1Pg0KPj4gK0w6CWxpbnV4LWlkZUB2Z2VyLmtlcm5lbC5vcmcNCj4+ICtMOgls
aW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4+ICtTOglTdXBwb3J0ZWQNCj4+
ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXRhL3JlbmVzYXMscmNh
ci1zYXRhLnlhbWwNCj4+ICtGOglkcml2ZXJzL2F0YS9zYXRhX3JjYXIuYw0KPj4gKw0KPj4g
ICBSRU5FU0FTIFItQ0FSIFRIRVJNQUwgRFJJVkVSUw0KPj4gICBNOglOaWtsYXMgU8O2ZGVy
bHVuZCA8bmlrbGFzLnNvZGVybHVuZEByYWduYXRlY2guc2U+DQo+PiAgIEw6CWxpbnV4LXJl
bmVzYXMtc29jQHZnZXIua2VybmVsLm9yZw0KPj4gQEAgLTE5NjQyLDYgKzE5Nzk2LDE2IEBA
IFM6CVN1cHBvcnRlZA0KPj4gICBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaTJjL3JlbmVzYXMscnp2Mm0ueWFtbA0KPj4gICBGOglkcml2ZXJzL2kyYy9idXNzZXMv
aTJjLXJ6djJtLmMNCj4+ICAgDQo+PiArUkVORVNBUyBTVVBFUkggRVRIRVJORVQgRFJJVkVS
DQo+PiArUjoJU2VyZ2V5IFNodHlseW92IDxzLnNodHlseW92QG9tcC5ydT4NCj4+ICtMOglu
ZXRkZXZAdmdlci5rZXJuZWwub3JnDQo+PiArTDoJbGludXgtcmVuZXNhcy1zb2NAdmdlci5r
ZXJuZWwub3JnDQo+PiArRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25l
dC9yZW5lc2FzLGV0aGVyLnlhbWwNCj4+ICtGOglkcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5l
c2FzL0tjb25maWcNCj4+ICtGOglkcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL01ha2Vm
aWxlDQo+PiArRjoJZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9zaF9ldGgqDQo+PiAr
RjoJaW5jbHVkZS9saW51eC9zaF9ldGguaA0KPj4gKw0KPj4gICBSRU5FU0FTIFVTQiBQSFkg
RFJJVkVSDQo+PiAgIE06CVlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51
aEByZW5lc2FzLmNvbT4NCj4+ICAgTDoJbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwu
b3JnDQo+PiBAQCAtMjIyOTUsMTEgKzIyNDU5LDE5IEBAIEY6CWRyaXZlcnMvdHR5L3Nlcmlh
bC84MjUwLzgyNTBfbHBzcy5jDQo+PiAgIA0KPj4gICBTWU5PUFNZUyBERVNJR05XQVJFIEFQ
QiBHUElPIERSSVZFUg0KPj4gICBNOglIb2FuIFRyYW4gPGhvYW5Ab3MuYW1wZXJlY29tcHV0
aW5nLmNvbT4NCj4+ICtNOglTZXJnZSBTZW1pbiA8ZmFuY2VyLmxhbmNlckBnbWFpbC5jb20+
DQo+PiAgIEw6CWxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnDQo+PiAgIFM6CU1haW50YWlu
ZWQNCj4+ICAgRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vc25w
cyxkdy1hcGItZ3Bpby55YW1sDQo+PiAgIEY6CWRyaXZlcnMvZ3Bpby9ncGlvLWR3YXBiLmMN
Cj4+ICAgDQo+PiArU1lOT1BTWVMgREVTSUdOV0FSRSBBUEIgU1NJIERSSVZFUg0KPj4gK006
CVNlcmdlIFNlbWluIDxmYW5jZXIubGFuY2VyQGdtYWlsLmNvbT4NCj4+ICtMOglsaW51eC1z
cGlAdmdlci5rZXJuZWwub3JnDQo+PiArUzoJU3VwcG9ydGVkDQo+PiArRjoJRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zbnBzLGR3LWFwYi1zc2kueWFtbA0KPj4g
K0Y6CWRyaXZlcnMvc3BpL3NwaS1kdyoNCj4+ICsNCj4+ICAgU1lOT1BTWVMgREVTSUdOV0FS
RSBBWEkgRE1BQyBEUklWRVINCj4+ICAgTToJRXVnZW5peSBQYWx0c2V2IDxFdWdlbml5LlBh
bHRzZXZAc3lub3BzeXMuY29tPg0KPj4gICBTOglNYWludGFpbmVkDQo+PiBAQCAtMjM2MDks
NiArMjM3ODEsMTIgQEAgTDoJbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnDQo+PiAgIFM6
CU1haW50YWluZWQNCj4+ICAgRjoJZHJpdmVycy9oaWQvaGlkLXVkcmF3LXBzMy5jDQo+PiAg
IA0KPj4gK1VGUyBGSUxFU1lTVEVNDQo+PiArTToJRXZnZW5peSBEdXNoaXN0b3YgPGR1c2hp
c3RvdkBtYWlsLnJ1Pg0KPj4gK1M6CU1haW50YWluZWQNCj4+ICtGOglEb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL3Vmcy5yc3QNCj4+ICtGOglmcy91ZnMvDQo+PiArDQo+PiAgIFVISUQg
VVNFUlNQQUNFIEhJRCBJTyBEUklWRVINCj4+ICAgTToJRGF2aWQgUmhlaW5zYmVyZyA8ZGF2
aWRAcmVhZGFoZWFkLmV1Pg0KPj4gICBMOglsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmcN
CkFja2VkLWJ5OiBXYW5nWXVsaSA8d2FuZ3l1bGlAdW5pb250ZWNoLmNvbT4NCg0KQ2hlZXJz
LA0KLS0gDQpXYW5nWXVsaQ0K
--------------eDdzeuQ8KDS5vjkSpdolENXB
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------eDdzeuQ8KDS5vjkSpdolENXB--

--------------87t267w04UlPslvdjOqMDS0c--

--------------J884VbeBrT8RovZp0ltZKJG0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZxi1PAUDAAAAAAAKCRDF2h8wRvQL7qEg
AQDsWBiHRtgz1qloiiboeH76yDBTQdrcnuPq/aylHFI/OQD/YfEnPb7TJOWMuj60fn7REeDDoZYm
udVKnCn6Qx8gvAs=
=wvKB
-----END PGP SIGNATURE-----

--------------J884VbeBrT8RovZp0ltZKJG0--

