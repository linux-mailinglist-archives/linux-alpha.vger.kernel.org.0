Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67FF4BA2E9
	for <lists+linux-alpha@lfdr.de>; Sun, 22 Sep 2019 16:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729097AbfIVOix (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 22 Sep 2019 10:38:53 -0400
Received: from sonic307-2.consmr.mail.bf2.yahoo.com ([74.6.134.41]:39969 "EHLO
        sonic307-2.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729096AbfIVOix (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sun, 22 Sep 2019 10:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1569163132; bh=zPC9p8T5S06DA73PD5F75wViZ/EpBpeYylTS7OqjCU4=; h=Date:From:Reply-To:Subject:From:Subject; b=ls9teii7uNcp2tJb5/f5pIgCYjL7oBYevxLiicbg2FPYRmcPD9xwbU7vk9Qvd/vggtzLnBuFXrfF59UTXfQz9YF6zU0ntE7Dszt1AObXelV/5j+gvs67gY4musLhAJoS29ua+Sjb2wKEKN849lYWBDZkufhmIhti+229a1CklokjxPzMa/ihDI6m8UtzH+ctjU5sOPUJtYZ0e2LX0v9vXNS6Q2XZeZSpAQ8Bq/AIatfG4JT5zS8rb95OIJsLrAQFt68O4RcFGjyRSbni0LC2O9dWRobqpIjKHeaTQ9ORbQ70Vh0oxMh9XMgiF/B0DVe0rANfAU3UrS3VslkCnDqxLA==
X-YMail-OSG: s9iRo34VM1kV0nsKSPR73D8aC.LzNu6U._9o0tox6Gd6MthEACsoemR_CYaa_W_
 vFIUUKLe.XJhdlBKPii6OcoLAY_GjofNgri6gDYPbH9cC5yo.qOTZnLCc9TXDzqJT1q1KlTkqHn3
 cDu7b5In.1VCZcmZNlzSvuLjtK6IIgxZod8hf1ufJrAO7IOlj5FtMGYFAMAO7dQaAbLy.VcHcDs2
 i8_.djtcgzd8Njlb0J4e3AHMwoag7P0maahCxsx7PomKlJrr_ZGJWNCTgk6.hWdggH6CRt1RChJD
 HdG5B2kvSSZLmamB9ytfGbOO9Db6eTK5Xrs3xFq2sC0DvJV6pU1sv9dVb.kOGQH8cn.MqN4E1aJd
 UVlOblAjuwJnENb75oRmefMBiC4su3rPNm3t95krLQQKLIxBN93OoVruPk.SZ2zAlitdEFyNflsZ
 uJ.0o8hbqMH08loM27GLwEsyYSYSPPNQFh1GuT77G5Hu.Eg.wzlN0gdPqj_Y0nyX15ZUoFkp7X9_
 yF8yWqLVW.8UzmhEEovYBAMIBBQXEhNFrYvGQeiG8Lt80FAXshjxBpkTyNBXFIHJkt1sZTVYgynZ
 Ijwhrl2qaFuLip7S5NR_db25YwQ3v43Fp934bfshn_TKexe2AqYSv8jc_6PdSw3BJC.ZbXI3Qt06
 DLnkQf6xeab3ruUIsb0jFewUhDR9EqborllKXu7dvIvgsTRhtF7_wSDMy5lXDXKp3C3WW1GXlJRa
 R9cMsNfVEt1VAc0VWI_VHAP38qPBP2cKr3.dv4TvRnVrIj30lfurmsStxp1NOx0hjIzzOYB4MsBS
 2FFj0VTszvfq8kBwucSa_yYczUoPkcpfRhpa89HWGuXwGzXHM31csKdp.b2HEXqo1e0UopzoCiNj
 B_kx3AwVoGqI5UCsa5Basr1aQyd.WZZ9jnPJiNSZyMfhAOkMNOAPl7soqxWbvGlz4FKlqlJLzkVi
 Y7LU4hR.eNA9jEpCGvT._XJJhthVmXvRxhj7w99IBXey8HzeTZJ947pySiozAN8Zpli48GC3_.gf
 qzl424z.mfxehtUf6_JJR5WBeG2.0aeF9pRMQOIltHu6nscYXFjsbPeoEIYRVJ.aRKz03wVL.dEh
 btxdy5Z12kwIvlNyzZAp.TvB8y2Z2t0AQyiuwStEbVX.rjysgD6OpR22w.ILAdV6GDEesjhJXwfN
 B4H9JPlJPkI44g7E88KxaEpBTyoEv_6jVQHTKgI2YPqavzafClhSOQMYTrBsjzs2QoC0F3H6QQk_
 _jkGCRPBAH7J8YfOtj1Syni4P.wnaVdHQncdv
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.bf2.yahoo.com with HTTP; Sun, 22 Sep 2019 14:38:52 +0000
Date:   Sun, 22 Sep 2019 14:38:51 +0000 (UTC)
From:   Ms Lisa Hugh <lisa.hugh222@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <1155695483.7409451.1569163131092@mail.yahoo.com>
Subject: FROM MS LISA HUGH(BUSINESS)....
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

Ms Lisa Hugh
