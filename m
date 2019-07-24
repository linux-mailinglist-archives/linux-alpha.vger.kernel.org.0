Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC07B7274C
	for <lists+linux-alpha@lfdr.de>; Wed, 24 Jul 2019 07:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbfGXF0r (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 24 Jul 2019 01:26:47 -0400
Received: from mail-eopbgr1320054.outbound.protection.outlook.com ([40.107.132.54]:30800
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725861AbfGXF0q (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 24 Jul 2019 01:26:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDi8VUIRxjbB54qh2++u+WOLXCZNB7o1R26J8tVb9q7FHam/jqAJLDqFyAMusDbRtgF8cAfqCT0Fq5IaHYG95gQq6XtBgxBE7EZjZ7zjgxhCAVhYvRuvu1LH8bXoFDM7G2N90g4XzYef5l7zs1eQyzNeytNZk1bVaBusCJaYBc8x8KWoXQ5toJ8WDsT4c9VNbw7NckySWkdY71x0qHPEEzOCow6FaXcy+69ckSqZ4oooraZd8X78PdhtUzutmATRI69AR/4g4EiPQizuSvg6K0ongBoPhAz1v+YDMnS0sZ1p7gifdxh3GGE4t2fph9J6+njjgtWGctuUb4+5CpBWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S3rSJ0bCs+XT884l2x2TL4sFNyCBwWrAiWbxdH2Sxs=;
 b=SyM4bgnacIpFPfd9UTsyf9haSOYzXcNa/aey67npNvAkoEbedg2THQjV+CRic7kAcVZb//siDSQC+zw3prtEPAZZ4S35Da5xsIEPZ/kWFi+JBCDlFjc0XweixQTDaQY4l1BWZKgWvb3F1NZKqK11dFUuRXrdWLW/Jp6bwx755fet9KVpF/JSsEot2aDVJt6cnN0/782O8VO0KKQ0/inB6UXmn9ATFEpkwO5ypPY4n+x3m4zfnE5WcQAO4U0EjU4LX62T2Kfo8sMqJuDGwjr2e72WGnxt0RIeLYo5B4A7CfSeCpxb8AFO9QpXJKheE2PB0HrZ9RTWA6G4NgWzuu/R7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=teo-en-ming-corp.com;dmarc=pass action=none
 header.from=teo-en-ming-corp.com;dkim=pass
 header.d=teo-en-ming-corp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector1-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S3rSJ0bCs+XT884l2x2TL4sFNyCBwWrAiWbxdH2Sxs=;
 b=EK/XML+aFb4sVInr3IiUy8y2G7e/BJx3wD3tHWUtkQ3kUGMpEbIrDr+UBwrMrEuiZdeQgPiSBo82eJQfla1fAcFQANHUgjslfxoQXmad/dweMk+J80YD2GfRetkyn+pwSmZdajy33o93j5DO+hwx718q43dGHjq2B6OLC1sqMbA=
Received: from KU1PR01MB2134.apcprd01.prod.exchangelabs.com (10.170.174.138)
 by KU1PR01MB1912.apcprd01.prod.exchangelabs.com (52.133.202.16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Wed, 24 Jul
 2019 05:26:38 +0000
Received: from KU1PR01MB2134.apcprd01.prod.exchangelabs.com
 ([fe80::7d19:b2d7:95fd:1820]) by KU1PR01MB2134.apcprd01.prod.exchangelabs.com
 ([fe80::7d19:b2d7:95fd:1820%3]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 05:26:38 +0000
From:   Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To:     "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>
CC:     Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: Great News: National Heart Center Singapore CT Coronary Calcium Score
 18 July 2019
Thread-Topic: Great News: National Heart Center Singapore CT Coronary Calcium
 Score 18 July 2019
Thread-Index: AdVB3/nSeMVtzqjRST+csaLXpqwjLA==
Date:   Wed, 24 Jul 2019 05:26:37 +0000
Message-ID: <KU1PR01MB2134EEB9F5E6CD3E065E6C1C87C60@KU1PR01MB2134.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [118.189.211.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 809cbcb6-6a6a-436e-8a42-08d70ff7805a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7193020);SRVR:KU1PR01MB1912;
x-ms-traffictypediagnostic: KU1PR01MB1912:
x-ms-exchange-purlcount: 5
x-microsoft-antispam-prvs: <KU1PR01MB19122B9EBA42E00A49C8661D87C60@KU1PR01MB1912.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(366004)(39830400003)(396003)(136003)(346002)(199004)(189003)(3846002)(64756008)(966005)(8676002)(107886003)(316002)(55016002)(7696005)(4326008)(508600001)(53936002)(9686003)(5660300002)(86362001)(6306002)(66556008)(305945005)(74316002)(66446008)(2351001)(66476007)(68736007)(52536014)(76116006)(25786009)(6116002)(256004)(66946007)(7736002)(14444005)(2906002)(33656002)(81156014)(99286004)(81166006)(14454004)(2501003)(476003)(6916009)(5640700003)(8936002)(71190400001)(71200400001)(186003)(66066001)(6506007)(102836004)(486006)(6436002)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:KU1PR01MB1912;H:KU1PR01MB2134.apcprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:3;
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NVwQ6BgpBgQSbUWkKi0Nie5T9OZDA7k2XyONvfKrLzcka8L3GGY4duUBVOO1GJN+yVS/KeTgvuhjSYMGhHBiHoLgZgtcNUhds93ODRrKORqdMnVASdjMkezOM68N0PlYfi09C/kf2KNaMwcahMZIVuLEGajgGWm3k69NJxvisxQn1+/ofRNFXpyfWpK6JJPbX7yOzzyEQpflNCdtoEnruYEH3pzwRvOKAVUoQKpibwM0CossqECkkBTeU0Df2NT472nEGLNtKhyqxrNUHRsf48C1fLouPgtDyP60sCX74JJOJA3w9ETu7iJdiRqmXN69noZIoxulpDnW/krQf3VqMWcO6qS569T/hFOs8Igd1MrVxLkfaqnASV+RWkY9KabfoqJd5m0GJ88eX2Ul2igse/T8Dp5iBthzGAr9alw+EjI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 809cbcb6-6a6a-436e-8a42-08d70ff7805a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 05:26:38.0021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ceo@teo-en-ming-corp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU1PR01MB1912
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Subject: Great News: National Heart Center Singapore CT Coronary Calcium Sc=
ore 18 July 2019

Good day from Singapore,

This is good news for trillions and trillions of years to come!

1. My weight/mass is 123.5 kg (taken on 23 July 2019).

2. My height is 1.79 meters (taken on 23 July 2019).

3. My Body Mass Index (BMI) is 38.56 kg/m2 (as at 23 July 2019)

4. I have been living with random, intermittent, and chronic mild chest pai=
n for the past 10 years since the year 2009.

5. I have seen countless (lost count) doctors in Singapore over the past 10=
 years. The diagnoses were always atypical chest pain (ie. nothing to do wi=
th the heart). All the doctors I have seen did not think it is angina pecto=
ris.

6. I have done countless (lost count) cardiac tests in Singapore over the p=
ast 10 years, including electrocardiogram (ECG), treadmill stress test, MIB=
I heart perfusion test, and CT coronary angiogram. All the test results wer=
e either normal or perfect.

7. I have high cholesterol (hypercholesterolemia) for many years, according=
 to doctors.

8. My pulse rate is consistently around 100 beats per minute for many years=
.

9. Recently, I went for CT coronary calcium scoring at National Heart Cente=
r Singapore (NHCS) on 18 July 2019. The following is a transcript of the CT=
 coronary calcium scoring report obtained on 23 July 2019.

-----BEGIN NHCS CT Coronary Calcium Scoring Report 18 July 2019-----

National Heart Centre Singapore

Patient Results

Requested By: Chan Lihua Laura (Doctor)                          23-Jul-201=
9 05:54 PM

TURRITOPSIS DOHRNII TEO EN MING (ZHANG ENMING)                Sex: M      A=
ge: 41y    DOB: *****

MRN / Visit No.: ***** / H119042968E0003                        Locn: NHC-C=
ardiac Clinic B

18-Jul-2019 11:07              CT Coronary Calcium Scoring                 =
HCCT195011991718            Final

Additional Info	              Verified Date/Time: 18/07/2019 12:02         =
                            Final
                              Verified Person: Dr. Narayan Lath
                              Verified Section: NHC CT
                              Performed at : National Heart Centre Singapor=
e
                              Level 5, 5D, 5 Hospital Drive Singapore 16960=
9

CT Coronary Calcium                                                        =
                            Final
Scoring
   HISTORY
   to reassess risk profile
   TECHNIQUE
   Calcium Scan was prospectively gated. Images were reconstructed at 3.0 m=
m slice thickness.
   Assessment was done using Vitrea Calcium software and Agatston scoring s=
chema.
   REPORT
   Calcium Score: Agatston 0 , Volume score 0 mm3, LM 0 , RCA 0 , LAD 0 , L=
CX 0.
   The calcium score is between 0 th and 25 th percentile for [men between =
the ages=20
   of 40 and 44.
   Normal coronary origins.
   EXTRACARDIAC FINDINGS
   No incidental significant abnormalities in the included lungs or mediast=
inum.
   Report Indicator:   Normal
   Finalised by:        Narayan Lath, Senior Consultant, 12598I
   Finalised Date/Time: 18/07/2019 12:02
Report Link                                                                =
                            Final






Printed from: National Heart Centre Singapore                    End of Rep=
ort                         Page: 1 of 1

-----END NHCS CT Coronary Calcium Scoring Report 18 July 2019-----

For scanned image of the original CT coronary calcium scoring report from N=
ational Heart Center Singapore, please visit my RAID 1 mirroring redundant =
Blogger and Wordpress blogs at

https://tdtemcerts.blogspot.sg

https://tdtemcerts.wordpress.com

On how to interpret CT Coronary Calcium Score, please visit the website of =
the Radiological Society of North America, Inc. (RSNA) at

https://www.radiologyinfo.org/en/info.cfm?pg=3Dct_calscoring






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

