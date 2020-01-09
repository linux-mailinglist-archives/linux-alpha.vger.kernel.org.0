Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 241C1135CC7
	for <lists+linux-alpha@lfdr.de>; Thu,  9 Jan 2020 16:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732434AbgAIPaQ (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 9 Jan 2020 10:30:16 -0500
Received: from mail-eopbgr1300072.outbound.protection.outlook.com ([40.107.130.72]:35593
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731052AbgAIPaQ (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 9 Jan 2020 10:30:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dq4RKasKfRQnNjz71dD9Hq6K4SDMINdZfRbgyTLUEqIAAbQwtrvFbzhxYNHVcs2QXzkxyyRwdTPrc/uMNnGIYSBq9qsYVA2TEvvVZUyzO8h7+/u7TWNOnbbIcoTIRjogioPhVlgvySbrBHVI38JAfGnGDZrVePDKe4wiVXn99TCQnsht87Xfh0Z6JyVwRkNbWEORJ98mGNaEBpF+Du+7i+uM46MnLhAGOFWHk8SS/HQKii03X5oDu3GQiV8qvWGXNh2V+AgHc8kzaR6e3pPmA+bk0q//3xzjP1J8y8DoTF18rU0LdvQ5i4T7W1sx7HNy+Gza7QlY2sJRJ/sk2iqj6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzyTqtbOfq3Ig0yXTX1EWjydOU+uAenurCB81rAkFjg=;
 b=GkxmUoo0508qre7K0VDqNiwY9wJNTSUw5xCPnOV6zTLfrnDzN2GpPEaNtmf/LDKyQJ2Z9TxHuYuqU4oQyrqDZGDakwk6ED8e+oZ23ZhhJvb/pK2Kk/mf1OitZABg0ymAqNTyct1RjObmIZ+2Y6cckdWQaN4GOkIi+Ui2O4INccTOIOQI83bl+gUa53qxbYq2FFSU2e7F5CzWmzHQzzPtZcrTlSYil18tkfTI/iX7YrzYLmusSAQYdSBdxax2Ypxsn5pP9hhrBq3t/uQPlIxSTiiGw7WR9bpMeikfjq/MU8mqA52KeP2vo9YkQQFhYxL8HMuhvsMRqlz8Yu3qteUIMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=teo-en-ming-corp.com; dmarc=pass action=none
 header.from=teo-en-ming-corp.com; dkim=pass header.d=teo-en-ming-corp.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector2-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzyTqtbOfq3Ig0yXTX1EWjydOU+uAenurCB81rAkFjg=;
 b=F9IISIyfwEhmH1MKeeNaEGemM3FF8wfaJqgQJiJSCARZexG8pBylPlzU3z93ImFzYLtndoelfMBh11/RARfLdXJ7SBNuQERf/tKrmXwFlyVF7v8RyOdOeXv2w/Wq6U04aJnPUjhSZVbZNh3pc8aZFxEGqIKhlmv3fJ8FDW6AdLw=
Received: from KU1PR01MB2134.apcprd01.prod.exchangelabs.com (10.170.174.138)
 by KU1PR01MB1894.apcprd01.prod.exchangelabs.com (10.170.173.138) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12; Thu, 9 Jan
 2020 15:30:10 +0000
Received: from KU1PR01MB2134.apcprd01.prod.exchangelabs.com
 ([fe80::8122:ca17:cba6:19aa]) by KU1PR01MB2134.apcprd01.prod.exchangelabs.com
 ([fe80::8122:ca17:cba6:19aa%5]) with mapi id 15.20.2623.010; Thu, 9 Jan 2020
 15:30:10 +0000
From:   Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To:     "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>
CC:     Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: Singapore Citizen Mr. Teo En Ming's Refugee Seeking Attempts as at 9
 Jan 2020 Thursday
Thread-Topic: Singapore Citizen Mr. Teo En Ming's Refugee Seeking Attempts as
 at 9 Jan 2020 Thursday
Thread-Index: AdXHAZ+Q7xUJbeWIQAuU2mUYaFrDvA==
Date:   Thu, 9 Jan 2020 15:30:10 +0000
Message-ID: <KU1PR01MB2134FC0DA235A7DDE0261D3A87390@KU1PR01MB2134.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [2401:7400:c802:de67:f1ab:6fde:d925:5c0c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be0121b5-9a68-40d2-1ac8-08d79518d092
x-ms-traffictypediagnostic: KU1PR01MB1894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <KU1PR01MB1894AB8E55C0124FB7A8F00887390@KU1PR01MB1894.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(346002)(39830400003)(366004)(396003)(199004)(189003)(66556008)(66476007)(66946007)(76116006)(81166006)(81156014)(2906002)(33656002)(64756008)(66446008)(8676002)(316002)(508600001)(6506007)(4000180100002)(107886003)(71200400001)(4326008)(7696005)(55016002)(5660300002)(6916009)(186003)(52536014)(86362001)(966005)(8936002)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:KU1PR01MB1894;H:KU1PR01MB2134.apcprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zc9Qs9HH1U4+8mzHm/kcqkWpc61IvxBWeiAy7eFnbKq9wzKKD9M/L3Un1XoA7d1pp9+H8raBLZQqVC9fDuRnag+EUk9T73yUs/+InGutVt73ArMAeflo+PuC4vsrHTsgf8DpNv52Unr5XvfvwcfoTOuFeX35fQDEg/iWKWWAH9/lxHp7/zwokGUPhNhN2emWlv3f167nqylcmbEl6w4dG8vzB/Gc3fTaLRlrU5l25DPrKEXL0lZOJFMygtKQBgF/BWAMCYKSvmzJBZRZcEt1l2dbRWDRdGdguCH8PgpOi3gMTkEIvb5RHjfE5QLISqizmS+We/BPCjK9kWwbfrenzbYscRP/4bEsJbbfhV866qL4uRK874xukbc4rxtFn7eBLnZVkVzvTyCMR9knRTKgLKYq0EHDua+BnEfB6QPnXcquakldn8XfdGFk4vK8tib4VEC85ExIo9YYSMIgP98G16xKOd2YWGP7gSb5aG3SEs06E1SRj7qmgtrhODXMGnXea/I/lJF35JnKVP3I287L1A==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be0121b5-9a68-40d2-1ac8-08d79518d092
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 15:30:10.5485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5qWTUNgK7UCzcNdbPMd5YiILbgGLBsBT0OUKUriwCSq1VdKuAr7mn5kSnBZbw8Nx6xz7uRbRiRNiV1hKK1vAbQVWPPqht1frQwUhlisJVEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU1PR01MB1894
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

SUBJECT: Singapore Citizen Mr. Teo En Ming's Refugee Seeking Attempts as at=
 9 Jan 2020 Thursday

In reverse chronological order:

[1] Application for Offshore Refugee/Humanitarian Visa to Australia, 25 Dec=
 2019 (Christmas) to 9 Jan 2020

Photo #1: Page 1 of Form 842 Application for an Offshore Humanitarian visa,=
 Refugee and Humanitarian (Class XB) visa

Photo #2: Front of DHL Express plastic envelope (yellow)

Photo #3: Back of DHL Express plastic envelope (white)

Photo #4: DHL Express Shipment Waybill

Photo #5: DHL Express Shipment Tracking Online Page, showing that my applic=
ation for offshore refugee visa to Australia=20
was picked up at 1619 hours on 25 Dec 2019 in Singapore and delivered to Ca=
nberra - Braddon - Australia
on 30 Dec 2019 at 11:10 AM Braddon, Australian Capital Territory (ACT) Time

Photo #6: DHL Express Electronic Proof of Delivery, showing that my applica=
tion for offshore refugee visa to Australia=20
was received and signed by staff Mohsin Mahmood at the Special Humanitarian=
 Processing Center,=20
3 Lonsdale Street, Braddon, Australian Capital Territory (ACT) 2612, Canber=
ra, Australia.

Photo #7: Page 5 of Form 842 Application for an Offshore Humanitarian visa,=
 Refugee and Humanitarian (Class XB) visa, bearing the=20
official stamp of the Australian Government Department of Home Affairs at N=
ew South Wales (NSW):=20
"COURIER RECEIVED; HOME AFFAIRS; NSW; 27 DEC 2019" and=20
"HOME AFFAIRS; NSW; 27 DEC 2019" at the bottom.

References:

For the above-mentioned seven photos, please refer to my RAID 1 mirroring r=
edundant Blogger and Wordpress blogs at

https://tdtemcerts.blogspot.sg/

https://tdtemcerts.wordpress.com/



[2] Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday

Photo #1: At the building of the National Immigration Agency, Ministry
of the Interior, Taipei, Taiwan, 5th August 2019

Photo #2: Queue ticket no. 515 at the National Immigration Agency,
Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photo #3: Submission of documents/petition to the National Immigration
Agency, Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photos #4 and #5: Acknowledgement of Receipt (no. 03142) for the
submission of documents/petition from the National Immigration Agency,
Ministry of the Interior, Taipei, Taiwan, 5th August 2019, 10:00 AM

References:

(a) Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday (Blogger blog)

Link: https://tdtemcerts.blogspot.sg/2019/08/petition-to-government-of-taiw=
an-for.html

(b) Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday (Wordpress blog)

Link: https://tdtemcerts.wordpress.com/2019/08/23/petition-to-the-governmen=
t-of-taiwan-for-refugee-status/



[3] Application for Refugee Status at the United Nations High Commissioner =
for Refugees (UNHCR),=20
Bangkok, Thailand, 21st March 2017 Tuesday

References:

(a) [YOUTUBE] Vlog: The Road to Application for Refugee Status at the
United Nations High Commissioner for Refugees (UNHCR), Bangkok

Link: https://www.youtube.com/watch?v=3DutpuAa1eUNI

YouTube video Published on March 22nd, 2017

Views as at 9 Jan 2020: 659

YouTube Channel: Turritopsis Dohrnii Teo En Ming
Subscribers as at 9 Jan 2020: 3.14K
Link: https://www.youtube.com/channel/UC__F2hzlqNEEGx-IXxQi3hA






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

