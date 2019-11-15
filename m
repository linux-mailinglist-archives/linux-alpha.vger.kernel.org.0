Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A52A6FE536
	for <lists+linux-alpha@lfdr.de>; Fri, 15 Nov 2019 19:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbfKOSra (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 15 Nov 2019 13:47:30 -0500
Received: from sonic312-21.consmr.mail.bf2.yahoo.com ([74.6.128.83]:37952 "EHLO
        sonic312-21.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726075AbfKOSr3 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 15 Nov 2019 13:47:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1573843648; bh=ZkSLcXkg1xPrFHtzBsy9ipALcIc7hyyhd9T7GsQ9zU4=; h=Date:From:Reply-To:Subject:From:Subject; b=sZw5MbBzdKTdK491vvflYOTw++CRPV+WeHicKoI7dwBDnB0jlJ/gGrzsqt5rMHlNcNErn7TrKHAPuDAqAxLl44Kww3JLq57r2Dag1Afk+jZcoJAornisOC6vx+hypsBKojhNdMmNk5H+wwTaroyyDREk9DYWxUcnIMs/IFhEASmbenhdelsYX9pYIg9eSfC1JXaZjBZg2HoFA/5nJ3Qt6Mt1P9S3NwVlbgGg0ug3DHOZvewqZrwQQod37Pq4KHJSyKlFw4oKJ6vyWERLhNhHM+HR2qZQ5KN9RBi5i4ppJPtEXMxnHqvWwk/Rco0ZM5yQlpXK1u7NdpQ0qqqLnpfQDA==
X-YMail-OSG: 5AiGE3sVM1lmlU0LJiYeXHm9WsUaJKtF_yyrwQNhmzEhTxcXHCvoK64UX88Ofuw
 MXtrdcvMTOZMx6N8dFjs1AFySpyr1VlnD_8_e35VZfqGySzAId_WILqtUaYI1SPVpbxS1ArepCKX
 hI94lF3TozrBzHAQYMD8nJL4kcQhQWq6TmpQGXiqFw0Orjpvxdw22600J2rZPSw1U6pHmxk6KAuv
 2FJUZHALS0b1v98Mqg9.VdHiv.rSWXhWD950tjHKsVGvKB44ISK6x8GVqKnvsN5xzNWN2dCI99cD
 X0g4Hhlx9hp7rE8SWQFCOEbrHHkRccojRcz6SLTaOq.SUH5MlWdiEE_QOniK6yjkVE76hQNZQm6p
 C7ESgWccQc5MjNbddYv7ZO7g2rBrFnKNEiLTNvG3NkqaxSCBvkL_T4IkM7OqAWHIgShDnrxz1OFh
 CNxE8JxiVVMxYQSzK0jYdPEn.3emhIVL90.3h08PRTYqvoN8JE3lSUfhf4lmTfH.OyPiaAcaVN1M
 SbQGqhSrsOltiyPUbepn5NgoWeAdUiPPNow.Si9zDww9Ew4KOrvYM.pdTPRxAom3GktRxcw9sq7n
 4SwOv8HcPts.t8J2o_fi_y8.Ew3PvSbacxTvD6WzXaxRruy58ND07ClWWhZZDKo2jm4kQHBKkHsA
 hPTHnUEfDPOe3_DDj2As4QtU8WPDSSwGfbsmP7w4i4Imci0XjjeZL4ewyCsuDtD71Lr0HbTUxEnh
 6nTaWbqU0wxJACPuW6mWLCrq1Fsk.wnEeuS6srxbkgbMGFU2Vt6_xGy8lZ5iuKSdrQ0WeyrW2yRp
 kGVzrh65UD.tCKSiCSewPXDjlfSqXaUhlCVg14Q6hKqvZFyN5Y.VNFdRVjnpalEzIZEUOLgX1dvb
 6oTfqogydopX_YTp3PX5m81b53EAAVDfIIwLiiKWivcJbA2xuDmnKxyNDV6StNBj.hFOcqbLXG2_
 CDP21RC2i7kbzA_ef_4K6WCzdTLwCP4IYEXkb3yVLzqpCQTw3MkGONng99JkYu45zm_BUwh7jI4h
 xCnqRFmTC6QuOoz2mPzqbD1E8NB59QjCgRz.fTUaWbUbvJdOCdDn14aE7pWMhAp_0uM.9EttSmgS
 bIuI6MFrVChQGsDrgH3chbaALo27IIIqaHeNgd_.6g.b1BBqsI4UK_5x.2sxyWbx1LETn4C.dvMK
 40lbRrGBNRcfSxyfhEUSq33O5ZOCZHRFJBdxrHE3gSKimNoWN.E8moNESKoc4LxsKvXs4VGqKE8Z
 5.L3MDLRYMVOUZDxCjZx6jpHY6evC2RYEvvPAYo4WFmdpKxv84I2Xoznxy_Q7cfwKKY8GFq5YaLq
 r7Gs8
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.bf2.yahoo.com with HTTP; Fri, 15 Nov 2019 18:47:28 +0000
Date:   Fri, 15 Nov 2019 18:47:24 +0000 (UTC)
From:   Ms Lisa Hugh <lisa.hugh222@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <1424388015.583617.1573843644776@mail.yahoo.com>
Subject: BUSINESS CO-OPERATION BENEFIT.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org



Dear Friend,

I am Ms Lisa Hugh work with the department of Audit and accounting manager here in the Bank(B.O.A).

Please i need your assistance for the transferring of thIs fund to your bank account for both of us benefit for life time investment, amount (US$4.5M DOLLARS).

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me forsuccess.

Note/ 50% for you why 50% for me after success of the transfer to your bank
account.

Below information is what i need from you so will can be reaching each
other

1)Full name ...
2)Private telephone number...
3)Age...
4)Nationality...
5)Occupation ...


Thanks.

Ms Lisa Hugh.
