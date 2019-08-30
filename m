Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91756A2C84
	for <lists+linux-alpha@lfdr.de>; Fri, 30 Aug 2019 03:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727361AbfH3Bzb (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 29 Aug 2019 21:55:31 -0400
Received: from mail-eopbgr1300055.outbound.protection.outlook.com ([40.107.130.55]:49493
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727216AbfH3Bzb (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 29 Aug 2019 21:55:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBZTwzsMLaCUrD6qvGv1eFKUYQ26QnUaWG9WPiC0HhorzQAdhdHmezHq9QA93LtZE8FnJ912aPLlmFRBup9gymwq+491Q3qz6hWB0KfhNiwLeBKJ9IJmktqv1ZRcHOG8yksagFd334WMJJ8PSSYBxuaLO6YV6ccuWaww8hDJrOOGPJijoytAro8IL4pvl1/CwG9iqFZzieLr5J6ksC7snzO01Hiu70ZKiTDpHkflNZjWPexXUtrR29rE++vIdzKyTGaJNYF4w+foujNGJYTX/6zrKYlpm0tP3wXHfX/qHUlV2ToCxuQVPROiS2+/WgcxDEeQQ1ulv5LrR8VSZ4Gpzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4isZp/PzGBjqlMvBYOKyg33r5kkCtHtvwX4lv1gu04=;
 b=lSjf8jjNG163w5VAUTTEQeYdJJw2Ufaq4Vy9PGdwvpaRboTkUdkaQf1Z80lNfK4Wz08k7lzTJ9+ygUojzhKV/IRyhV8oHkSepqD8YFs4hB/LstPMdUWElWd0KDuoXQRq2gSqebM4DPCqcNwy+eN0FAO1ypk3stePjSjvdiMtBYhNQC+zh6cHCICPzrKmL1lN4zMF3JlLAmzhHxnUadgrlA+9wwFgrr68U0NJbPb64dUIjjIfLT5kZcBiZhKynFo4UvQdcSmSgJ2RI40qJ5Aeksqj6vu/PCJO4f6HCHAnUt8TN/koGpEZ2Xwv0CBKg+t2qxlK2ILNY10V+bA0N9HIHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=teo-en-ming-corp.com; dmarc=pass action=none
 header.from=teo-en-ming-corp.com; dkim=pass header.d=teo-en-ming-corp.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector1-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4isZp/PzGBjqlMvBYOKyg33r5kkCtHtvwX4lv1gu04=;
 b=OWUJQKe27BTaUFSl3zfal4TERUaBikAZNJbD/Wb8YYoa97tiWKQ+DRVsjGFrRaLqbwI4+NaVfMe0PgS3HehiE0XVOf/MqkctDCPGvktEfLaqyt+zhsKtEFZdveabMCu26s0LwI6rHceIuKimRCspdCTqhGwxXUmSOOpQBEFOuZw=
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
 SG2PR01MB2159.apcprd01.prod.exchangelabs.com (10.170.143.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 01:55:25 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::508e:ee77:4ba7:9278]) by SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::508e:ee77:4ba7:9278%7]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 01:55:25 +0000
From:   Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To:     "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>
CC:     Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: Singaporean Mr. Teo En Ming's Refugee Seeking Attempts
Thread-Topic: Singaporean Mr. Teo En Ming's Refugee Seeking Attempts
Thread-Index: AdVe1fiJRY/GwJkFTry/lRwY+a1FyQ==
Date:   Fri, 30 Aug 2019 01:55:25 +0000
Message-ID: <SG2PR01MB2141992828A3A71FDEB7D6BC87BD0@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [118.189.211.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 164f430b-721f-4517-3f85-08d72ced205d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:SG2PR01MB2159;
x-ms-traffictypediagnostic: SG2PR01MB2159:
x-ms-exchange-purlcount: 7
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR01MB2159361E3463FF559D42861B87BD0@SG2PR01MB2159.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(366004)(39830400003)(346002)(136003)(199004)(189003)(53936002)(66946007)(76116006)(102836004)(66556008)(66476007)(66446008)(64756008)(3846002)(6116002)(6916009)(305945005)(2501003)(14444005)(74316002)(6436002)(5640700003)(2351001)(6306002)(7736002)(55016002)(2906002)(256004)(66066001)(9686003)(25786009)(52536014)(316002)(966005)(86362001)(7696005)(508600001)(14454004)(99286004)(71200400001)(71190400001)(8936002)(486006)(33656002)(81166006)(107886003)(476003)(81156014)(8676002)(26005)(5660300002)(6506007)(186003)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:SG2PR01MB2159;H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lR/pQToIfQknVUhnx6jmUjuG50rIr7qc4ie9O4PRt24blx6nn3ziKONjU/RExf7EE3oKsdMrcFCXgH+MY/p9ZrriAI1lwWyuIh/PusQQvyO2YS8SL3q3PpF9cApc8n70FFY9kKgGfCrpdFemlETqmQSjoGPTtTCTThnmf7UxmdpAa7MDKoNDuOM2WUtQcgfT5BfX6ZlsDeq49+LmpoUy3rnOQM/tOuaeZI64sgMz05Cx+ewInGsGQxg1vNudVYEw3+ApWxBXo5mVzKrLH+6/qptVkFMtg2+ABilJZm5K25PZp2nXCVAiAM7GsiWr0zmQSUXOx2yF7cv6/4vCFE/8MpE7iE2KQxB8JfJJo30Y4dYoqQiugZLATTErf0qIKo9+1VHxVqToBlHCQJyHWUe3WLkd8LsQzq8764HmzHnl49g=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 164f430b-721f-4517-3f85-08d72ced205d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 01:55:25.6968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YIYP5VYcKwmp9n5iVYQy0K2nPYhia45KQ5RtMf4BL4SmjojdB+gI1U06FtCAvyzmzmkORGFn8SClgOmx1C8A646ketfXx8ifmFJi7RbWuKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB2159
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Subject: Singaporean Mr. Teo En Ming's Refugee Seeking Attempts

In reverse chronological order:

[1] Petition to the Government of Taiwan for Refugee Status, 5th August 201=
9 Monday

Photo #1: At the building of the National Immigration Agency, Ministry of t=
he Interior, Taipei, Taiwan, 5th August 2019

Photo #2: Queue ticket at the National Immigration Agency, Ministry of the =
Interior, Taipei, Taiwan, 5th August 2019

Photo #3: Submission of documents/petition to the National Immigration Agen=
cy, Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photos #4 and #5: Acknowledgement of Receipt for the submission of document=
s/petition from the National Immigration Agency, Ministry of the Interior, =
Taipei, Taiwan, 5th August 2019

References:

(a) Petition to the Government of Taiwan for Refugee Status, 5th August 201=
9 Monday (Blogspot)

Link: https://tdtemcerts.blogspot.sg/2019/08/petition-to-government-of-taiw=
an-for.html

(b) Petition to the Government of Taiwan for Refugee Status, 5th August 201=
9 Monday (Wordpress)

Link: https://tdtemcerts.wordpress.com/2019/08/23/petition-to-the-governmen=
t-of-taiwan-for-refugee-status/

[2] Application for Refugee Status at the United Nations Refugee Agency, Ba=
ngkok, Thailand, 21st March 2017 Tuesday

References:

(a) [YOUTUBE] Vlog: The Road to Application for Refugee Status at UNHCR Ban=
gkok

Link: https://www.youtube.com/watch?v=3DutpuAa1eUNI

YouTube video Published on March 22nd, 2017





-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link: https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwav=
e.html

***************************************************************************=
*****************

Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
Qualifications as at 14 Feb 2019

[1] https://tdtemcerts.wordpress.com/

[2] https://tdtemcerts.blogspot.sg/

[3] https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----

