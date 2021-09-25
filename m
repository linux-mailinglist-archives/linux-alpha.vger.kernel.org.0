Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9EC2417F67
	for <lists+linux-alpha@lfdr.de>; Sat, 25 Sep 2021 04:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344150AbhIYCz4 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 24 Sep 2021 22:55:56 -0400
Received: from zeniv-ca.linux.org.uk ([142.44.231.140]:45548 "EHLO
        zeniv-ca.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343905AbhIYCzz (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 24 Sep 2021 22:55:55 -0400
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mTxpN-0076gP-GI; Sat, 25 Sep 2021 02:54:13 +0000
Date:   Sat, 25 Sep 2021 02:54:13 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     linux-alpha@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCHES] alpha asm glue cleanups and fixes
Message-ID: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

	Fallout from asm glue review on alpha:

1) TIF_NOTIFY_SIGNAL support is broken; do_work_pending() handles
it, but the logics *calling* do_work_pending() ignores that flag
completely.  If it's called for other reasons - fine, but
TIF_NOTIFY_SIGNAL alone will not suffice for that.  Bug from the
last cycle.  5.11 bug.

2) _TIF_ALLWORK_MASK is junk - never had been used.

3) !AUDIT_SYSCALL configs have buggered logics for going into
straced syscall path.  Any thread flag (including TIF_SIGNAL_PENDING)
will suffice to send us there.  3.14 bug.

4) on straced syscalls we have force_successful_syscall_return() broken -
it ends up with a3 *not* set to 0.

5) on non-straced syscalls force_successful_syscall_return() handling is
suboptimal - it duplicates code from the normal syscall return path for
no good reason; instead of branching to the copy, it might branch to the
original just fine.

6) ret_from_fork could just as well go to ret_from_user - it's not going
to be hit when returning to kernel mode.

Patchset lives in git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git
#work.alpha; individual patches in followups.
