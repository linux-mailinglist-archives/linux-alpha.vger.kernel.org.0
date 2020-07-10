Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0220921BB5A
	for <lists+linux-alpha@lfdr.de>; Fri, 10 Jul 2020 18:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgGJQw0 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 10 Jul 2020 12:52:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:59116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726977AbgGJQwY (ORCPT <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 10 Jul 2020 12:52:24 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4CAB02078B;
        Fri, 10 Jul 2020 16:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594399943;
        bh=JFRVnikzffyM0kLIyVXv4/ggOBXeIFkHnh4eBvBnBLY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xzei/k6DhRwA4CoPU2JfT1d96J4vveAm+XAaAkU1cr+BOf+32Tcx/dccl4I4ZPmCx
         sc4qnD19m1gpde2WR6qzwhjbcO9OZkyoPamVFAOYW5xvGZKM61oOqpDPK2n2MMzllD
         RXU/MDbaz/SgCunQxxoQ5llZ5g8r2qCnuIoyKmpk=
From:   Will Deacon <will@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>, Joel Fernandes <joelaf@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Marco Elver <elver@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Matt Turner <mattst88@gmail.com>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Richard Henderson <rth@twiddle.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        virtualization@lists.linux-foundation.org, kernel-team@android.com
Subject: [PATCH v3 03/19] asm/rwonce: Allow __READ_ONCE to be overridden by the architecture
Date:   Fri, 10 Jul 2020 17:51:47 +0100
Message-Id: <20200710165203.31284-4-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200710165203.31284-1-will@kernel.org>
References: <20200710165203.31284-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

The meat and potatoes of READ_ONCE() is defined by the __READ_ONCE()
macro, which uses a volatile casts in an attempt to avoid tearing of
byte, halfword, word and double-word accesses. Allow this to be
overridden by the architecture code in the case that things like memory
barriers are also required.

Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 include/asm-generic/rwonce.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
index 92cc2f223cb3..f9dfa88fc04d 100644
--- a/include/asm-generic/rwonce.h
+++ b/include/asm-generic/rwonce.h
@@ -33,7 +33,9 @@
  * atomicity or dependency ordering guarantees. Note that this may result
  * in tears!
  */
+#ifndef __READ_ONCE
 #define __READ_ONCE(x)	(*(const volatile __unqual_scalar_typeof(x) *)&(x))
+#endif
 
 #define __READ_ONCE_SCALAR(x)						\
 ({									\
-- 
2.27.0.383.g050319c2ae-goog

