Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76C3114C9A0
	for <lists+linux-alpha@lfdr.de>; Wed, 29 Jan 2020 12:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgA2Lc0 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 29 Jan 2020 06:32:26 -0500
Received: from sonic309-24.consmr.mail.ir2.yahoo.com ([77.238.179.82]:34167
        "EHLO sonic309-24.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726068AbgA2Lc0 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 29 Jan 2020 06:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1580297544; bh=eg3qZapD09VJqj25AUJW5s1BYxWsWc1QdQQ9ZvAlPmk=; h=Date:From:Reply-To:Subject:References:From:Subject; b=a7AtBA0kiGmz3A8bdOk4hM68CnWx2Gr8VxlarDe3VNMVAnF47B+1Mi9ySGgrCZLGQYbm+DpYmacVAjv6iPxMnTiUl1Cfj5aTbw6JNHlL3MRJ/afdw/i8R2qhh/kp6o8xbmPkLF9YVZ9lc2J1iIMB+77ndMy9HBdMVBoymJTHn083iFxJGyrQPzb0bmpmJh1JXPikmHGJWQcSQkqBRK2b9L5mTPSxlbgcCZBbC69F1RRKCfiADmfKLhXbHkmGYfYkvQ0meqd3BzLWalKYAIQxjpnTEJmBzjeuHUVM5j3AyimU2Mg073gCY5txkkN0mRf0pz9OGNJUyzm3wyfPztBxAw==
X-YMail-OSG: sKqCDfAVM1mu0F1JVQL9e0g1D.qVrObTVfty4l18G2YkkOrehEY98BE1I.gWa72
 GnliLm7wukbBlpuXu1D84MI9J_wZWDYwIu5yJTm09IVqnghxRRSgh7Yxfjr3nJZwTb5Z.BkPDjOs
 M.BkhMtg9lLBJMBtctf1T.GYlFRjdWNSDvSQOK8DY5LqwkxspEk3ObpMcuUCa_iYcIaY9EbWhpgA
 ZJ4KsookUt0NLdakC9WpIoOOAI3nxpHjgh_i4yjzVuKAFNFH9ehryDeG6cnW6IaxfJ0ZRvAgPp1a
 Y2.xG39OFLDhLRh5OIMGJhJZQgMxkWbXfdEaVdntQZvMCuy2M58jquy2JVYrRdRnorcZCaQsWYCn
 deaAWxmphvW0YGCNua32VZ5VraeiEqHrTOwU5Fib6yzRQ0.3IzPRvxDmQX.YJ4mVyKDspXdtEkkA
 B.7Ovkd0PyPNgRWH3dZMnNmodBTgUblm_Hiylbv1hMZ_8h5VwqqJGlAjdEgpEb2M3pjCLPFGwL0m
 7ADFj0ImX3UOs_0t4jyBQE9A0pYqXFSSp4N_2.qotEuNQd78XIv0NR0WRricAzPvdlIyL2X_B3BN
 Hu_.dRXvZPa9rF18BZIPjzuyh732aGkFb3_z_AYPlzmaFe1tFIR5JP1IiA3TDVhh7UDvJPSFqZju
 ZJw2jdxHCI1czaf0tRJy2rVjeWGeaEeoy0n5K0Jt73s3ImtqrR10OGDIlp2y8iOyOwcZY1a9ihaB
 Vqdhd2c05uvvDora4xSLSbxBXPydxwwfmupKspCvf6cidNFf7ACEfdKU0aXjyZt.OtkwgfBSmHEe
 cVzTCaLFaJ6dTRx6mx4MPqaKrB9hwQIUJS09W6rrgsZO.NhinSOPQI5WZpB1Fo0m2f1QYUH6DL4T
 rnb4e2kdSPeauMRu5Yp7nM1A4YoQibPmpEX3XVeJQFF1UkM_ceuY7mQj.D9lkjo68uXXi.UeotUC
 PLH2UGgvTkqCzzcrdrJkAq0h.RMwYWqzTE1xnUaE58frhycX4S2_W8k_BJWdYIqMg3u6KjLxGdEk
 gkqaJPKQAIUPh3zzi8MRR_WZvdcW_V1xuKCdHmA7qX7uP..HMxLLTxvhXhE_Aa_yCdSD0Et4vvGA
 D.eZfJ6LnGk4EA6Lem.dqARLDJwGeRQ9214v3HJuT.62wkuCL7yEAUFoMoh4rL9etTlzkbnhn_s8
 tWm_NRwqjcJZIpU0CwqEvokJDSLxDcXbilMSEBWI7_DIDU0FPMdkbVdlTwH004JaFboZTe7O7kWS
 hlK_vx71lPYvLA1OTSqIfrVbZV.345kKhSpqb1uBFcY1H0VAJWCn.H_zm8BbFjUCZ2D6BPk4-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ir2.yahoo.com with HTTP; Wed, 29 Jan 2020 11:32:24 +0000
Date:   Wed, 29 Jan 2020 11:32:20 +0000 (UTC)
From:   Ms Lisa Hugh <lisa.hugh111@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <1002854083.1428592.1580297540467@mail.yahoo.com>
Subject: BUSINESS TRANSFER CO-OPERATION.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1002854083.1428592.1580297540467.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15116 YMailNodin Mozilla/5.0 (Windows NT 6.1; rv:68.0) Gecko/20100101 Firefox/68.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org



Dear Friend,

I am Ms Lisa Hugh work with the department of Audit and accounting manager here in the Bank,

Please i need your assistance for the transferring of this abandon (US$4.5M DOLLARS) to your bank account for both of us benefit.

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me after success.

Below information that is needed from you.

1)Private telephone number...
2)Age...
3)Nationality...
4)Occupation ...
5)Full Name....
Thanks.


Ms Lisa Hugh
