Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F28B2250FE
	for <lists+linux-alpha@lfdr.de>; Sun, 19 Jul 2020 11:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgGSJ4h (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 19 Jul 2020 05:56:37 -0400
Received: from sonic315-15.consmr.mail.bf2.yahoo.com ([74.6.134.125]:35057
        "EHLO sonic315-15.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726021AbgGSJ4h (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sun, 19 Jul 2020 05:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1595152596; bh=NajTNMrfMLb6UXcjRhYpYerQX8PtVBLz0oFgaMINSWY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=S9gYtc5RhGKb4Dhk4ZZzspFAPHVkDFNUXAmLuMqoWhuLWi7Lbz4DG2ndFZUTGw+bNVPhOLwwe4esE0DzqVRY8a+7u9l41ouPpoupPKJ9xUSi3jXXoh9FjKO2t0q4pDAX5crnWB4hbx+N7eicYLFuMx1r60vnFohGnN2hfhV/Gl0quKMIeZz/joSo8V7LQS+Nc5SekCARtiiyqLYASKfmP7EnfZ1GzHXFHrZ/tAUwGIwohK2LVNXoNNvXSBpj41MVIGB1RZq4H/Lri+f8YO8egs9zrQdSniX+ThJQOOMO2Fw6msl8NWo2xuuc7Dipk55rkP71SJW6K1w57mbS3MdZWw==
X-YMail-OSG: BIQbq.YVM1nXGAWgExwlvRao_HmZeegdicWxszH0YcQtcH05XCh6tnpUU9leXAF
 WbVpmt7909496P7ZeRfnFNf8DGML5kaLkrHk_wG.ZxVXsqiRPY6yS9sAUu3cGw2NiGdZp5moqyBQ
 oJvaDG7treqGJTo0BD2vVcDJlaZnH__t28JumgdrfdOUMOG5Y0ti1DyVkwdnnbHYxzHRXhlCZp2S
 9Y1gwbVbrGdOG92RH3JBvin29YvG4hNzLiuH.4pZpEuNN2DICcxsB16Q5mh.PaAmFjdX4sxo27w_
 Tn5xpXISEuwM.mp2B.EbUQvLp_aE0t.C8uKaTXU7gWcVhG.YbpQDoSL_JkgllND.QDn1PQnfDuhd
 snbWBVdr.wwf0_7vuFJw5tbyX3m6BlGVZ4UodnFiVgKP1AFFjF55AMj6adRaEfgtzV4LsLBFGXD7
 DIJy8LVuiB.0n9IL9oZUevPVbU4J4ZFeDNVFLlV1gdt2.Ur0F.TOd9c5ykWExqU7IyS3EaoTnu1M
 FZzugRglLa9DrdkUg.7yP2olxSlO5T2GX3gpTTAU3SMZ2hIN0sKiKUuXZTEH6XbjIE9rOnNr.vV3
 CEJ3duDJkKsfDEWC91H5CFLlM8ZQqn7JUghIAOeCOjK_uu7zucmnz7P6IrG8mNVgqFlM_nHVAAXV
 9T2bJJ5DVCKffMZCpv3VkHfmbW3c3OK11jcX4dX_TBCHCLz_HT8hS7uHpShchEiUeQyIczAOlcpL
 hggYZsojbX03BORLmccn_zRHfl850Hupa09wh0Sc9FlpuBn1_5yFqPRe8PSVF58KUI4EcOd.YQsO
 I_lZsnDGNfTDjth8kMyHfJnU_K3r4I8DPRUrNVxLr9SEc7woh1SnsFOGxRUK_skKvGnEf6nPdjyn
 YHoRV1TVCrljWMYewZOzBRCiBdGIhNjIW5ovrVU5TEoo6PJPEK1ptRyjBXYQTepmBr5s7579WdlZ
 5DRCpadHaPk2itYMzdCQjxrG5puhSiWvbMyIeZ4k.ZyWFF1xnqKaJL9TTEMTL7my_GcwCAwPMw5c
 ZjUsb_JIHiCvZJFsr_jWhnT0lY_9.J0w.FGU2cHYWXtN0pcGTEslefrpnPSQmbG9eQuK7SbdB5OM
 V3TAlO9abrwp.Zwy7.EPaaOJGrIXuKHhSU2edAmWtP8DuLTIEYHMROeBVxqyfALKZ954wZeUhimD
 urakUbohtUPZnlDB7Bt1HNpdksgGj_JcYbv8Jq1Vc1dDxuw3UCMnzXCF17EwVTwuD2RQ1EFuL9EG
 cAjpU40tlWntxPpG4qwFhGMCI1B1kKvhuhh9XancZSdaB7Zz_BBhV8XK4.Pbl5iBZnwjlQ3OapYk
 KsQ--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.bf2.yahoo.com with HTTP; Sun, 19 Jul 2020 09:56:36 +0000
Date:   Sun, 19 Jul 2020 09:56:33 +0000 (UTC)
From:   Ms lisa Hugh <lisahugh531@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <1271446046.2700451.1595152593688@mail.yahoo.com>
Subject: BUSINESS MASSAGE FROM(Ms Lisa hugh).
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1271446046.2700451.1595152593688.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16271 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101 Firefox/78.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org



Dear Friend,

I am Ms Lisa hugh, work with the department of Audit and accounting manager here in the Bank(B.O.A).

Please i need your assistance for the transferring of thIs fund to your bank account for both of us benefit for life time investment, amount (US$4.5M DOLLARS).

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me for success.

Note/ 50% for you why 50% for me after success of the transfer to your bank account.

Below information is what i need from you so will can be reaching each other

1)Full name ...
2)Private telephone number...
3)Age...
4)Nationality...
5)Occupation ...


Thanks.

Ms Lisa hugh.
