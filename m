Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80ADCF92FE
	for <lists+linux-alpha@lfdr.de>; Tue, 12 Nov 2019 15:48:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfKLOst (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 12 Nov 2019 09:48:49 -0500
Received: from mail-eopbgr1320040.outbound.protection.outlook.com ([40.107.132.40]:53696
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725997AbfKLOst (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 12 Nov 2019 09:48:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q//HaN2EvwB/ktHVCll5LW119tpgzPIOsgJl7sBibNltBIzMcEA/WTUIXYpo2GeUmS4YoTQuj8FT1nqo4Mh1eTIucxEDxI7MY8CaRLxhAWNaVirtSrXrGW3lTIvhFCvmgYHmvq4z1QkEtafqaGKO4I6wnLY/XV7XsdAV3Z6q/BLSqgTQRj/wsSDa08wU0Sr29YvfoqYSMBeYr6+bjnBDr87X85zLry5mUJY/UP5Qci8aE+c1TPaacipFeSqB78UuCqSHb45j6OIpzitTmo44quJHUJn34W5tGM5ycVePBWYpxXk/xv1wcx/XswN+oQKOrDGGFqUz7Ej9Hnt+W+WLyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZtVyGHaQuahF155qe6t/LZA0ztH4wGjm8lT3PxmYWM=;
 b=XD7flJMDKN9m2BvfGwAURrCyZZFLp9beE2Um44xV7y1nCw9IN3RiZLSFsRhV6pD9ft2suoHaES+5lXytQkxBpVTOZqIN3HIGlLV7xudeVSfy9v8RFli9dYfIyGMCSKKBMkCnSRL1U2dIcN94JXXNOUcpsNYlfUmVhcPkPgP8Oi27NaY2e9QFi+dhP4UZ+F1SKlokcfJFTDKQhWaXomxhl94Epc0CoC2TVtYYfoAS5NWAKQQulFhPF9+qY4EA4hNPPEz7bobIQYUhbeA7dzbtK0nq6JdHyKVVk1QmlE3R+i/ZhGY02qqGgvz50Jw4K8hlyPfSSoSutiCsjf6vLiUdXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=teo-en-ming-corp.com; dmarc=pass action=none
 header.from=teo-en-ming-corp.com; dkim=pass header.d=teo-en-ming-corp.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector2-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZtVyGHaQuahF155qe6t/LZA0ztH4wGjm8lT3PxmYWM=;
 b=LqhHVsCF26gUtfLv71gNPv/WPCd7llLsDw41nyTGoHIb3J5l81Vdivf4Dryls2nXEcE+ws0Kuh1cABDrXveLBMVN+pni5bc8lumFPLXOk0xQw5zUix+qMOToux92pBDTfT/ONnM+L0SNhgJ9N0ci6VgIuIxQH/eAawZ1S12N6qs=
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
 SG2PR01MB2014.apcprd01.prod.exchangelabs.com (52.133.138.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Tue, 12 Nov 2019 14:48:44 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::49d4:fc70:bde2:c3a]) by SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::49d4:fc70:bde2:c3a%2]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 14:48:43 +0000
From:   Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To:     "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>
CC:     Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: I just got to know another 2 Singaporeans who were denied/refused
 government jobs because of their remarks on the Singapore Government
Thread-Topic: I just got to know another 2 Singaporeans who were
 denied/refused government jobs because of their remarks on the Singapore
 Government
Thread-Index: AdWZaECc9J7Tgiz4SSy//d/TMW0j6A==
Date:   Tue, 12 Nov 2019 14:48:43 +0000
Message-ID: <SG2PR01MB21416AB2861FA18A282C27A587770@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [118.189.211.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 167a1810-d9b1-41d3-59f7-08d7677f6a63
x-ms-traffictypediagnostic: SG2PR01MB2014:
x-ms-exchange-purlcount: 4
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR01MB20140FB35526C5ED75F1080087770@SG2PR01MB2014.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39830400003)(136003)(376002)(346002)(366004)(396003)(199004)(189003)(33656002)(81166006)(14454004)(6116002)(64756008)(316002)(66476007)(2906002)(66556008)(76116006)(3846002)(66946007)(966005)(99286004)(25786009)(8676002)(8936002)(81156014)(508600001)(66446008)(2501003)(4326008)(6436002)(6306002)(6916009)(476003)(5640700003)(9686003)(7696005)(14444005)(256004)(186003)(26005)(6506007)(71190400001)(71200400001)(305945005)(74316002)(7736002)(107886003)(52536014)(2351001)(5660300002)(66066001)(486006)(55016002)(86362001)(102836004);DIR:OUT;SFP:1101;SCL:1;SRVR:SG2PR01MB2014;H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RajgxOrk+CSFQsZecRoDXeQOIgqjSH3it+7C5SllgKAuKtqf+nsTuXhqtOU2ugBSUXapKnxgHnqq1ayvmA6sbFm803VbaYTt/FpCYPViTBIHFNKZUCcY6o6vmmU6uAO9qUdvR9hrQytePTeRE8uGukUx8mqHTg3YvfnSTYYKy9dxp0lOdNk1+TrsOHuYSMt9181yYyucFp3JZBt0jo+KbMomr2EWOh7Hn7WYAQIZMsLJ2MzIpPa2NocEK679AeQg7lj8QH0mJnI1c4gai2WMw02P13OP//0PdtBT70BhH4rM3aEfGERURv7/dVBgoxQ7jOUh4ufgGsc33ldvBUMfMripTIG71WE4OHqZgKLA8zyqwqE6Hw7ItsZXF0YoGdibZmSDReMcQHqR2ep2lsJVoSF1G6Wm8ngUDBPUmodwD4nwUVDUa55StBwBTK7xJzTL7dGkMGpKt9Yw7iBLWiJ0/RX3u0tVrSkaqeS9iBq2CQw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 167a1810-d9b1-41d3-59f7-08d7677f6a63
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 14:48:43.8838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EtaU/CTZR3fux4qLWtJMZkadA9ITCRRi93JoV84QZwKXvqJKMJhPAJYtLXXistQxMZYldPy7G83yhEDPsBqBiqROt71O+oKQxWxeZ0KB6wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB2014
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Subject: I just got to know another 2 Singaporeans who were denied/refused =
government jobs because of their remarks on the Singapore Government

Today, 12 November 2019 Tuesday Singapore Time, I got to know another 2 Sin=
gaporeans who were denied/refused government jobs because of their remarks =
on the Singapore Government.

Donald Trump (not his real name of course), who is a recruitment consultant=
 at job agency Nanotechnology Infocomms (not the real name of the job agenc=
y of course) in Singapore, communicated to me he is aware of another 2 Sing=
aporeans who were denied/refused government jobs because of their remarks o=
n the Singapore Government.

According to Donald Trump, the 1st Singaporean passed the first round of se=
curity clearance but failed the second round of security clearance. On furt=
her thoughts, the 1st Singaporean thought he may have been denied/refused t=
he government job because of his remarks on the Singapore Government.

According to Donald Trump, the 2nd Singaporean was working in a semi-govern=
ment job involving classified information of government ministers in Singap=
ore. According to Donald Trump, the 2nd Singaporean refused to sign Non-Dis=
closure Agreement (NDA) because he argued that government ministers in Sing=
apore are public figures. The 2nd Singaporean was subsequently forced to re=
sign or terminated from employment.

Due to privacy laws in Singapore (Personal Data Protection Act (PDPA)), Don=
ald Trump cannot reveal the names of the two Singaporean Targeted Individua=
ls to me. Privacy laws also exist in the European Union and the United Stat=
es.

The General Data Protection Regulation (EU) 2016/679 (GDPR) is a regulation=
 in EU law on data protection and privacy for all individual citizens of th=
e European Union (EU) and the European Economic Area (EEA). It also address=
es the transfer of personal data outside the EU and EEA areas. The GDPR aim=
s primarily to give control to individuals over their personal data and to =
simplify the regulatory environment for international business by unifying =
the regulation within the EU.[1] Superseding the Data Protection Directive =
95/46/EC, the regulation contains provisions and requirements related to th=
e processing of personal data of individuals (formally called data subjects=
 in the GDPR) inside the EEA, and applies to any enterprise established in =
the EEA or-regardless of its location and the data subjects' citizenship-th=
at is processing the personal information of data subjects inside the EEA.

The Privacy Act of 1974 (Pub.L. 93-579, 88 Stat. 1896, enacted December 31,=
 1974, Title 5 United States Code Section =A7 552a), a United States federa=
l law, establishes a Code of Fair Information Practice that governs the col=
lection, maintenance, use, and dissemination of personally identifiable inf=
ormation about individuals that is maintained in systems of records by fede=
ral agencies. A system of records is a group of records under the control o=
f an agency from which information is retrieved by the name of the individu=
al or by some identifier assigned to the individual. The Privacy Act requir=
es that agencies give the public notice of their systems of records by publ=
ication in the Federal Register. The Privacy Act prohibits the disclosure o=
f information from a system of records absent of the written consent of the=
 subject individual, unless the disclosure is pursuant to one of twelve sta=
tutory exceptions. The Act also provides individuals with a means by which =
to seek access to and amendment of their records and sets forth various age=
ncy record-keeping requirements. Additionally, with people granted the righ=
t to review what was documented with their name, they are also able to find=
 out if the "records have been disclosed".. and are also given the rights t=
o make corrections.[1]

I am now aware I am definitely not alone and I am definitely not the only T=
argeted Individual (TI) in Singapore. So far Donald Trump is the only recru=
itment consultant from only one job agency in Singapore whom I have spoken =
to. Hence there could be a lot more Targeted Individuals out there in Singa=
pore whom I am not aware of yet.




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

