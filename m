Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0E4B13844C
	for <lists+linux-alpha@lfdr.de>; Sun, 12 Jan 2020 01:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731728AbgALAaI (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 11 Jan 2020 19:30:08 -0500
Received: from mail3-bck.iservicesmail.com ([217.130.24.85]:39241 "EHLO
        mail3-bck.iservicesmail.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731720AbgALAaI (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sat, 11 Jan 2020 19:30:08 -0500
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Sat, 11 Jan 2020 19:30:07 EST
IronPort-SDR: I5d4CTTiNAZZLAuZ+ExtVCHVlN+ByU8s1VXR/aQrtdDmyunF5QYGeG+Vr2LvRjFf75rG/fI/yZ
 ATcf9oi+OAUA==
IronPort-PHdr: =?us-ascii?q?9a23=3ANOWekR3ZtunG/tEYsmDT+DRfVm0co7zxezQtwd?=
 =?us-ascii?q?8ZseIfKfad9pjvdHbS+e9qxAeQG9mCsLQe1bSd6fiocFdDyK7JiGoFfp1IWk?=
 =?us-ascii?q?1NouQttCtkPvS4D1bmJuXhdS0wEZcKflZk+3amLRodQ56mNBXdrXKo8DEdBA?=
 =?us-ascii?q?j0OxZrKeTpAI7SiNm82/yv95HJbAhEmTSwbalsIBi3rAjdudcajZd/Iast1x?=
 =?us-ascii?q?XFpWdFdf5Lzm1yP1KTmBj85sa0/JF99ilbpuws+c1dX6jkZqo0VbNXAigoPG?=
 =?us-ascii?q?Az/83rqALMTRCT6XsGU2UZiQRHDg7Y5xznRJjxsy/6tu1g2CmGOMD9UL45VS?=
 =?us-ascii?q?i+46ptVRTkjiALOSMl/27Nj8xxjLtXrQympxxl247UZ5uVO+BifqzDZN8VW2?=
 =?us-ascii?q?xBUt9NWixdHoOzdZcAD+ofMuZdsYb9oUcOoQKgCgmqHe/hzThIhnno0qw6yu?=
 =?us-ascii?q?guDwfG1xEkE98ArHjYsND5OaEPWu630abI1y3OYf1W1zfn9obGcQ0vrv6QUr?=
 =?us-ascii?q?x/asfR1UsiGB/ZglmMtYDpITWY3fkNvWiB6OpgUPqihXQ5pAFtvDev3NonhY?=
 =?us-ascii?q?nOhoITxVDP6CJ0wJ4rKt2kVkF7e9ClEJxWtyGVLIZ2QtgiTHp0tyog1rIGvp?=
 =?us-ascii?q?u7cDIKyJQk3hPSbeGMfYuQ4h/7SuqdPDV1iGh4dL+xmxq+61asx+LmWsS60F?=
 =?us-ascii?q?tHqDdOnMPWuXAXzRPT79CKSv56/ki8xzmCzxvT6uRYIUAskqrbNoIhzqYwlp?=
 =?us-ascii?q?UNtUTDGTf7mEDsg6+XckUk4Pan6+D7brjpvJOcKYh0hRzkPaQgncy/B/o3Ph?=
 =?us-ascii?q?IQUGiA4ei81bvj8lPlQLhSkPE6j6vUvIrHKckVuqK1GRFZ34k55xuxDzqqyN?=
 =?us-ascii?q?EYkmMGLFJBdhKHlY/pO1TWLfDgE/i/n0qjkC1lxvDBOL3hDY7ALnjYkLj6Yb?=
 =?us-ascii?q?lx8VJTyA02zdxF55JUCakNIOjvVU/pqNzYEhg5PhSww+bmDtV9y4wfVXuVDa?=
 =?us-ascii?q?+dKKPSsUWH6/kxI+mDeoAVoizxK/s76P70i382h1sdcbOu3ZsNZ3DrVshhdk?=
 =?us-ascii?q?GYZ2f8x94FCWcDlhQxQfasi1CYVzNXIXGoUPEG6yk/Gb6hWL/OWo23yIOG2i?=
 =?us-ascii?q?jzSoVbem1cFVeKHnfzfY6EWN8DbSuTJolqlTlSBpa7TIp07RyyuRWy9L1hIa?=
 =?us-ascii?q?KA4iAEuIj80956z+3Inxp0/jtxScSehTLeB1pol38FEmZllJt0plZwnwzbia?=
 =?us-ascii?q?U=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HVAQA9ZhpelyMYgtlMGBoBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBAREBAQECAgEBAQGBaAQBAQEBCwEBGwQBgSmBTVIgEpNQgU0fg0O?=
 =?us-ascii?q?LY4EAgx4VhgcUDIFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQE?=
 =?us-ascii?q?FBAEBAhABAQEBAQYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKTAEOAVO?=
 =?us-ascii?q?DBIJLAQEznXoBjQQNDQKFHYIyBAqBCYEaI4E2AYwYGoFBP4EjIYIrCAGCAYJ?=
 =?us-ascii?q?/ARIBbIJIglkEjUISIYEHiCmYF4JBBHaJTIwCgjcBD4gBhDEDEIJFD4EJiAO?=
 =?us-ascii?q?EToF9ozdXdAGBHnEzGoImGoEgTxgNiBuOLUCBFhACT4xbgjIBAQ?=
X-IPAS-Result: =?us-ascii?q?A2HVAQA9ZhpelyMYgtlMGBoBAQEBAQEBAQEDAQEBAREBA?=
 =?us-ascii?q?QECAgEBAQGBaAQBAQEBCwEBGwQBgSmBTVIgEpNQgU0fg0OLY4EAgx4VhgcUD?=
 =?us-ascii?q?IFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQEFBAEBAhABAQEBA?=
 =?us-ascii?q?QYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKTAEOAVODBIJLAQEznXoBj?=
 =?us-ascii?q?QQNDQKFHYIyBAqBCYEaI4E2AYwYGoFBP4EjIYIrCAGCAYJ/ARIBbIJIglkEj?=
 =?us-ascii?q?UISIYEHiCmYF4JBBHaJTIwCgjcBD4gBhDEDEIJFD4EJiAOEToF9ozdXdAGBH?=
 =?us-ascii?q?nEzGoImGoEgTxgNiBuOLUCBFhACT4xbgjIBAQ?=
X-IronPort-AV: E=Sophos;i="5.69,423,1571695200"; 
   d="scan'208";a="323052171"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 12 Jan 2020 01:25:04 +0100
Received: (qmail 8337 invoked from network); 11 Jan 2020 23:46:31 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-alpha@vger.kernel.org>; 11 Jan 2020 23:46:31 -0000
Date:   Sun, 12 Jan 2020 00:46:30 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghsbchk@gmail.com>
To:     linux-alpha@vger.kernel.org
Message-ID: <32279364.172047.1578786391149.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

