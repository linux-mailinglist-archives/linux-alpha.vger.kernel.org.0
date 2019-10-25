Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 238FBE4117
	for <lists+linux-alpha@lfdr.de>; Fri, 25 Oct 2019 03:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389055AbfJYBfi (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 24 Oct 2019 21:35:38 -0400
Received: from mail-eopbgr1300083.outbound.protection.outlook.com ([40.107.130.83]:31992
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730006AbfJYBfi (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 24 Oct 2019 21:35:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRlFPavJo27c19X/Dm0WnRLNZYbxLBQ+tyXn2NNhs2fJ1nTQvYz9UY5hlh+MtBnM772Ag6inrHgJQ0Ufl/nIAXE5YN1Q5vDOSZenXDX8i6XTXWBLlXHdyv5QdXCpo6s5ArSAhNiZlXC8k4CK/ZTeD1pWADKZw0vF4QWl2KhaSzNuM37+HQ+l3lxz1SIBhun3nDDC1DSVF+IpGCT791e6MWyAccSC/oB3cpeh7EJ+dMnIWK62V8Z+Tciq9FxyMKCR2usH8QiuNrpRUKGQuKxPhudO+JX6HB1WqZ/DRzns5gKwiOpw75kzQcm1cmL9/vpSyvIFQXxrLRC6RV/GaSnAOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ekeqnocrcbc5M3c/bGfJ2Yxvcw81NBvyAUFlf3Je/g=;
 b=j37UsRN/umvXaOZHiTnOqxh9Am25TgCLzJPMRVEaCPCsghsz/n3p1wTPZEFV5HXZS7kLmewCkbFtvrIbnDutjoSCPp/UCpY1MqlN7EQFL6ifO/JWy+OAisSllF/WEyrVV/poubLMq8GtAXeNj2aV+OA0LZ++J+y1KNKFS98UdngFvVzBgayYSgDkH9SSLJaX184iFfvpIY5S5DoMihcLdNn4dbgL6AFWKmR5rmEam7stKj7OZGyNLhH8oESqrILuWgznKAdCH3DGoAbk8vbQq5p9mnWDEZ+XsowVebsEoTQrRhPzyVrZdmQn+5rRgPVOA8YGXJyW+AaBNau5lyvCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=teo-en-ming-corp.com; dmarc=pass action=none
 header.from=teo-en-ming-corp.com; dkim=pass header.d=teo-en-ming-corp.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector2-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ekeqnocrcbc5M3c/bGfJ2Yxvcw81NBvyAUFlf3Je/g=;
 b=AAiScj20SYyGB5pCFQVdHj2WifXQaZA4C5stnNKZ1ZvANytgemgJV0bViYOh/qepuY61F2jYTk9RtHuUnXaSKHfQYiu2AXK3ywCRQ84ziUIWRYXK1jLF8pN0phUe+LsUAFL6LNisQbhcv/fTnrDu7O/wmzeVJYrx/VK2pvdGd6Q=
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
 SG2PR01MB2966.apcprd01.prod.exchangelabs.com (20.177.92.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Fri, 25 Oct 2019 01:35:31 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::48a5:3998:fd15:92e8]) by SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::48a5:3998:fd15:92e8%6]) with mapi id 15.20.2367.027; Fri, 25 Oct 2019
 01:35:30 +0000
From:   Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To:     "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>
CC:     Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: Replacement of Supercomputer @ Home in Singapore Due to Motherboard
 Malfunction
Thread-Topic: Replacement of Supercomputer @ Home in Singapore Due to
 Motherboard Malfunction
Thread-Index: AdWK1HbHOtDORFxWRqqrwTKVObTwVA==
Date:   Fri, 25 Oct 2019 01:35:30 +0000
Message-ID: <SG2PR01MB21410F2A31E231B417727D3087650@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [2401:7400:c802:1ef3:d923:25a:c4b4:68f8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 534463c2-649a-4f07-ca33-08d758eb9f37
x-ms-traffictypediagnostic: SG2PR01MB2966:
x-ms-exchange-purlcount: 4
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR01MB2966EB2E5B94B5D8BC4D0C1487650@SG2PR01MB2966.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(346002)(39830400003)(396003)(136003)(199004)(189003)(66476007)(46003)(508600001)(66556008)(76116006)(107886003)(2351001)(186003)(33656002)(8676002)(9686003)(66446008)(7696005)(25786009)(55016002)(6116002)(64756008)(476003)(66946007)(2501003)(81166006)(2906002)(5660300002)(99286004)(6306002)(6506007)(52536014)(966005)(8936002)(5640700003)(86362001)(256004)(14444005)(102836004)(74316002)(7736002)(71200400001)(81156014)(71190400001)(486006)(316002)(305945005)(4326008)(6916009)(14454004)(6436002);DIR:OUT;SFP:1101;SCL:1;SRVR:SG2PR01MB2966;H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1FUG7n3Rngcp+kjbzJ4OY8J4tgk2jADs7NyFehnRyDLKQfqrLh6LzahrF/cp2HupATLOEB1zSbgYHSryYJSJ8GNnMF8Wj7aHVxHJXRO0rHp1v/JY+K4NQNXOglVDFfRTeq+TKAZAXbnOrwfcY5GsRqRSdCdo4Yl0iec7CLXNk2DDTmJ0GczyvOYJZ+eABxm2GBedT611EW8pgUj4oChDdnD+qyjCB4EPEjiTeHRJKXH5o7P3pBgOBs8chuEHmL1IKMtyU1EBcDJ+6pb2I63DRucFTbBCQ/SUqULWcQeiZ4MOEZqhjHhGiP90MJ4MXgcHY/TlGfCV4Cb7QGrXKIheNkkl+V1IBNHwNKnySlbZQIzWi7Gr+dVAUv8l8mNMT0Jc+wT27zDMQwjSZUW0l1yOrL2N/D0TCSpl9BVtBFLWycmSoMh+k8Uafp0gkmRDwClk2TMMF2IZMJhHy4xzFrlufgHM3J2j1YkMUTW+/TPb72E=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 534463c2-649a-4f07-ca33-08d758eb9f37
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 01:35:30.7517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M3Alx5u6U8UFV1gabkEmX2NfCS3UFvWnlxTY58HBlcCGCEK4GUbHiCgm0Vd+makGTmoP4rwHDPjTq2wdWiNQJjkeuX8+4LItTrzvNcCD8X0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB2966
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Subject: Replacement of Supercomputer @ Home in Singapore Due to Motherboar=
d Malfunction

Good day from Singapore,

Section A: Old Supercomputer Bought on 30 August 2015
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

I had bought the following computer components on 30 August 2015 (confirmed=
 date), which is slightly more than 4 years ago.

[1] 5th Generation Intel Core i7-5820K 3.3 GHz 15 MB LGA2011(V3) (140W) SGD=
$530

[2] MSI X99A SLI Krait Edition USB3.1 LGA2011-3 DDR4 MAINBOARD SGD$439

[3] Kingston PC4-2133 8 GB DDR4 DIMM (KVR21N15D8/8) SGD$90

[4] ANDYSON AG-SERIES 650W 80PLUS SILVER (5YRS) SGD$95

[5] Coolermaster Hyper 103 CPU Cooler SGD$68

Grand Total: SGD$1,222.00 (on 30 Aug 2015)

Section B: Malfunction of MSI X99A SLI Krait Edition Motherboard on 23 Oct =
2019 Wed
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

Symptoms:

When power is supplied, there are LED lights on the motherboard. However, t=
he power supply unit fan, casing fan, CPU fan, and GPU fan keeps spinning u=
p and down repeatedly forever. The RESET LED on the motherboard also turns =
on and off repeatedly forever.

Troubleshooting Steps:

1. Removed all existing DDR4 memory sticks on the motherboard. Insert brand=
 new G.SKILL DDR4 memory stick. Symptoms persist.

2. Use another known working power supply unit. Symptoms persist.

Conclusion:=20

The MSI X99A SLI Krait Edition motherboard, which has been in service with =
me for slightly more than 4 years, is now dead.

Credits: Troubleshooting is performed by a computer shop in 4th story of Si=
m Lim Square in Singapore, because I don't have the necessary spare parts t=
o troubleshoot. Troubleshooting fee is SGD$30. Plus Grab fare from my home =
to Sim Lim Square is SGD$20.

Section C: Buying Brand New AMD Ryzen 3 3200G processor, Gigabyte B450M DS3=
H SOC motherboard and Transcend 2666 MHz 8 GB DDR4 DIMM on 23 Oct 2019 Wed
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

On 23 Oct 2019 Wednesday, I bought the following *replacement* computer com=
ponents.

[1] Gigabyte B450M DS3H SOC AM4 ATX DDR4 MAINBOARD SGD$113

[2] AMD Ryzen 3 3200G 3.6 GHZ AMD (VEGA 8 GRAPHICS) SGD$138

[3] Transcend 2666 MHZ 8 GB DDR4 DIMM JM2666HLB-8G SGD$58 (bought on 24 Oct=
 2019)

Notes: My previous 1X Kingston DDR4-2133, 2X Crucial DDR4-2133 and 1X Cruci=
al DDR4-2400 memory sticks are not compatible with the new motherboard, acc=
ording to the computer shop. I am reusing the MSI GeForce GTX1650 4 GB GDD5=
 GPU video card and other peripherals in my computer casing.

Grand Total: SGD$309 (on 24 Oct 2019)

Conclusion: Windows 10 Home Edition 64-bit version 1903 is working beautifu=
lly without needing to reinstall the operating system after a complete over=
haul of supercomputer hardware.

Remarks:=20

For the past 13 years after graduation from National University of Singapor=
e (NUS) with a Bachelor's degree (Second Class Lower Honours) in mechanical=
 engineering, I have NEVER had a stable and permanent job because I am a TA=
RGETED INDIVIDUAL (TI). A Targeted Individual is a person who is persecuted=
, targeted, and marked by the [Singapore] Government. Covertly and subtlely=
, the Singapore Government does not allow me to have a stable and permanent=
 job earning high PMET salaries like $8000 or $9000 a month. For the past 1=
3 years after graduation from NUS, I was *frequently* fired/terminated from=
 employment or forced to resign. I am always *struggling* to find part time=
/temporary jobs earning $7-$8 per hour. As a result, I do not have much per=
sonal savings. When another Singaporean flaunted he has $354,000 in his ban=
k account, I only have less than $1000 in my bank account. I can also recal=
l that The Straits Times reported that a Singaporean housewife was cheated =
of some $700,000 some time ago. When my home supercomputer failed, I can on=
ly buy the cheapest AMD Ryzen 3 processor and the cheapest AMD Socket AM4 m=
otherboard. Singaporean Mr. Turritopsis Dohrnii Teo En Ming is the poorest =
university graduate in the world! I SIMPLY LOVE TO FLAUNT MY POVERTY!

POSTED WORLD WIDE.


-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link:=A0https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microw=
ave.html

***************************************************************************=
*****************

Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
Qualifications as at 14 Feb 2019 and refugee seeking attempts at the
United Nations Refugee Agency Bangkok (21 Mar 2017) and in Taiwan (5
Aug 2019):

[1]=A0https://tdtemcerts.wordpress.com/

[2]=A0https://tdtemcerts.blogspot.sg/

[3]=A0https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----

