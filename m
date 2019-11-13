Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB037FB1F2
	for <lists+linux-alpha@lfdr.de>; Wed, 13 Nov 2019 14:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727634AbfKMN6M (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 13 Nov 2019 08:58:12 -0500
Received: from mail-eopbgr1310045.outbound.protection.outlook.com ([40.107.131.45]:27205
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726186AbfKMN6M (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 13 Nov 2019 08:58:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUH4x3Kw7SKpMMT+oGsVYXNoz9uKLeE4pIniSkMmKvL6TFBodnNzn0Q1QDdFccA6Ta/f0E+f4HYINVWbDn/NhGWGs3pmUvJR11Mwmy37koVK52ZKE4SHShsQrJxsw9gj+Sjn9Y421eI7JWsIvgHYei0oKgPXYZjKSXPkiXwywNwCkY9NVdKT4FDtwF8txmurWR3LtUuf4mT27BuxqpFpd2ynVncBLVTWWrZkd4Myhmop54e0Gb7wk59WJ/siCrOneAQC/XuMrEmH9t0P3iiwX1XExJdnpC81ib7U9AwF6hvZsuX/Rwtj2uUPs77tv1WBIAZJ2QPw8XBVgHeQix8yFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7nHEsLaw1Cz9+X1pVruDRkVipWsrR4oCuWZw9ccmmc=;
 b=BmTpGazSQrG4zwVkRMn2wjCvl1vFygGTeI05I9gEBRftRSe1uvGjqLt33xYCioUxWHLQYq/n7oCjlyrezF9YAzRoFVhdbNyS4o7GJhqN6ud0VmgPRNnMTlXeFwiU7qI3TGoqz2PxAk+KwPTpt4DuIzvuCwUaLOKJ6jlvV9qK3zk28WGh6IRkmGp1go70Ymys6k6TfC/pEu2CPZjCpbDQ1Q4bnECciQI6PRSxOeYRa4ws8XTHauP2XTFbmJPIKDovS6GbXBv0EkAO0tS9NVZC161BQonuprW9igYYUesv51MO6kgFULSz4NKViFpySA7MNj4fhe7E+oOnF2IIaHU1cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=teo-en-ming-corp.com; dmarc=pass action=none
 header.from=teo-en-ming-corp.com; dkim=pass header.d=teo-en-ming-corp.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector2-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7nHEsLaw1Cz9+X1pVruDRkVipWsrR4oCuWZw9ccmmc=;
 b=OHviTJkb6VeC7FXHZnE/1HkGYTDQbC0M1tb6lEwtmEbK89j2geiZ7w1y3/mavYBWJxX/illQoHTWTlmw+zCpgipqXem/M2YXbT/yLZOB6oxmH3G2YUb3xbbzE4aT/++Gd7aRU5CoASxcwWUo7U5sD7ZqpoGDzz8nHLbzcNArodU=
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
 SG2PR01MB2598.apcprd01.prod.exchangelabs.com (20.177.169.79) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Wed, 13 Nov 2019 13:58:07 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::49d4:fc70:bde2:c3a]) by SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::49d4:fc70:bde2:c3a%2]) with mapi id 15.20.2430.028; Wed, 13 Nov 2019
 13:58:07 +0000
From:   Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To:     "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>
CC:     Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: Singapore Democratic Party leader Dr. Chee Soon Juan encouraged me to
 try applying for refugee status/political asylum in several countries
Thread-Topic: Singapore Democratic Party leader Dr. Chee Soon Juan encouraged
 me to try applying for refugee status/political asylum in several countries
Thread-Index: AdWaKlxw1FVmsO+tRBCIJ6xQW7lI0w==
Date:   Wed, 13 Nov 2019 13:58:07 +0000
Message-ID: <SG2PR01MB2141C8AFA02539D77469D1A087760@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [2401:7400:c802:de67:9162:51ee:7860:8489]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a424cbe-3585-43a6-1ad2-08d768418300
x-ms-traffictypediagnostic: SG2PR01MB2598:
x-ms-exchange-purlcount: 4
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR01MB2598B653236A613050D6BC6487760@SG2PR01MB2598.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39830400003)(396003)(136003)(366004)(376002)(199004)(189003)(4326008)(66476007)(2351001)(7736002)(966005)(33656002)(81166006)(305945005)(6306002)(5660300002)(55016002)(81156014)(508600001)(8676002)(6436002)(14454004)(76116006)(66946007)(66556008)(66446008)(64756008)(5640700003)(99286004)(52536014)(74316002)(186003)(8936002)(6506007)(486006)(2906002)(71200400001)(25786009)(7696005)(71190400001)(86362001)(2501003)(316002)(6116002)(6916009)(256004)(107886003)(476003)(14444005)(102836004)(9686003)(46003);DIR:OUT;SFP:1101;SCL:1;SRVR:SG2PR01MB2598;H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ONEml6chHA6WvO1LvXz+3Vkm1tne+eoI1ThD19jnzVa7LTf/L/TuMUOhnNtq5rWKxBQCL3Or9OjVfyjW+61C3jkSA0PshoJWogWYJnTpWdVntntxICPP9kX6wPySAX5GwgN07FTJUW2uflj2FHEWuLDADaj94XrY6VJ/C1fHIEUCEN8dUTokBHXJzlgeR5N4v47lyfP5dG/GAhXKfKWVtKyozec5yzGdVjLzfaygVqke4JaKsDfk2aRUPNrdGqvXnmVR5aIxBQZ50kz/RyxUc4+jfT7+W1SZvaBwEWcoJo8Whx55zaSr3tuaTzRlqX1HLp2GnVg8Af/O31c05So/Iq1v4Zh0vWPy6edMu/qBdmYHYVg10Uc6EPtd7VelFVcH2Q3IqWf1+Wfd+b4WI5m/pt8aNvA6IC223sIAmDM6LjpT8MMb53iskEHI44AF88tm7Ecbmjex1WtkXAlT9G7C6vvEonQjtw6NILQhvNOJuQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a424cbe-3585-43a6-1ad2-08d768418300
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 13:58:07.4430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hFsrP+Qv3PpLkHuFqjpjrxZ+YvSJpiXz8vCFdRXT8zykoH1th1T4U+Jh4A9TIHCLTrqaZNQqbdURjuc9d0J4LZygcrPfcD8b/pn2FaHqAVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB2598
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Subject: Singapore Democratic Party leader Dr. Chee Soon Juan encouraged me=
 to try applying for refugee status/political asylum in several countries

I have a chance encounter with Singapore Democratic Party leader Dr. Chee S=
oon Juan along the street at Toa Payoh Lorong 4 on 13 November 2019 Wednesd=
ay at about 3:00 PM Singapore Time. I was on my way home after a 3-hour par=
t time/temporary job from 11 AM to 2 PM Singapore Time when I bumped into D=
r. Chee. We had a short discussion. I briefly told Dr. Chee of my plight fo=
r the past 13 years, which has been told countless times in my RAID 1 mirro=
ring redundant Blogger and Wordpress Blogs, my autobiography first draft 11=
 November 2019 and my countless international posts. Dr. Chee advised and e=
ncouraged me to try applying for refugee status/political asylum in several=
 countries. We parted soon after.

Teo En Ming's Archives and Records Administration (TEMARA). Office of the G=
rand Historian. Records made on 13 November 2019 Wednesday Singapore Time.

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

