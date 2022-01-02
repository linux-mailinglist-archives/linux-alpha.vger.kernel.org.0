Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098CC482C9B
	for <lists+linux-alpha@lfdr.de>; Sun,  2 Jan 2022 20:48:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiABTsS (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 2 Jan 2022 14:48:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiABTsS (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Sun, 2 Jan 2022 14:48:18 -0500
Received: from wp441.webpack.hosteurope.de (wp441.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:85d2::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 266B5C061761
        for <linux-alpha@vger.kernel.org>; Sun,  2 Jan 2022 11:48:18 -0800 (PST)
Received: from [2a03:7846:b79f:101:21c:c4ff:fe1f:fd93] (helo=valdese.nms.ulrich-teichert.org); authenticated
        by wp441.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1n46px-0005tR-8d; Sun, 02 Jan 2022 20:48:13 +0100
Received: from valdese.nms.ulrich-teichert.org (localhost [127.0.0.1])
        by valdese.nms.ulrich-teichert.org (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPS id 202JmCXI015741
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 2 Jan 2022 20:48:12 +0100
Received: (from ut@localhost)
        by valdese.nms.ulrich-teichert.org (8.15.2/8.15.2/Submit) id 202JmC7h015740;
        Sun, 2 Jan 2022 20:48:12 +0100
Message-Id: <202201021948.202JmC7h015740@valdese.nms.ulrich-teichert.org>
Subject: Booting newer kernels on the Jensen...update
To:     linux-alpha@vger.kernel.org (Linux Alpha)
Date:   Sun, 2 Jan 2022 20:48:12 +0100 (CET)
Cc:     lukas@wunner.de (Lukas Wunner),
        glaubitz@debian.org (John Paul Adrian Glaubitz)
From:   Ulrich Teichert <krypton@ulrich-teichert.org>
X-Mailer: ELM [version 2.5 PL8]
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;ut@ulrich-teichert.org;1641152898;dece652e;
X-HE-SMSGID: 1n46px-0005tR-8d
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hi,

I've made some progress to get modern kernels booting on the Jensen, but
not in a positive way. I got aboot compiled with a gcc cross compiler
after a lot of hackery, installed it on a second disk, attached that to
my Jensen and booted it:

>>> boot dka300 -fl i
INIT-S-CPU...
AUDIT_BOOT_STARTS ... 
AUDIT_CHECKSUM_GOOD
AUDIT_LOAD_BEGINS
AUDIT_LOAD_DONE

aboot: Linux/Alpha SRM bootloader version 1.0_pre20040408
aboot: switching to OSF/1 PALcode version 1.35
aboot: booting from device 'SCSI 1 6 0 0 300 0 JENS-IO'
aboot: valid disklabel found: 4 partitions.
aboot: loading uncompressed ...
aboot: loading compressed ...

unzip: unknown compression method
Welcome to aboot 1.0_pre20040408
Commands:
 h, ?                   Display this message
 q                      Halt the system and return to SRM
 p 1-8                  Look in partition <num> for configuration/kernel
 l                      List preconfigured kernels
 d <dir>                List directory <dir> in current filesystem
 b <file> <args>        Boot kernel in <file> (- for raw boot)
 i <file>               Use <file> as initial ramdisk
                        with arguments <args>
 0-9                    Boot preconfiguration 0-9 (list with 'l')
aboot> l
#
# aboot default configurations
#
0:2/vmlinux.gz ro root=/dev/sdb1 console=ttyS0
1:2/vmlinux.gz ro root=/dev/sdb1 console=ttyS0
3:2/vmlinux.gz ro root=/dev/sdb1 console=ttyS1
#1:2/vmlinux.old.gz ro root=/dev/sda2
#2:2/vmlinux.new.gz ro root=/dev/sda2
#3:2/vmlinux ro root=/dev/sda2
#8:- ro root=/dev/sda2          # fs less boot of raw kernel
#9:0/- ro root=/dev/sda2                # fs less boot of (compressed) ECOFF kernel
-
aboot> 0
aboot: loading compressed vmlinux.gz...
ext2_bread: read error

unzip: attempted to read past eof
ext2_bread: read error
vmlinux.gz: file not found
aboot>

I suppose something went awfully wrong during the cross compile of aboot,
but I simply fail to understand why it tries to unzip a gzipped kernel.
I tried an uncompressed kernel as well, that one failed with:

"ext2_bread: read error"

as well. As ext2_bread of aboot uses the SRM console API in the end,
I assume this is prone to break when cross compiling...

Has anyone tried to cross compile aboot before and got it working?
There certainly is no support for cross compiling built in, maybe for
a reason.

Anyway, I have not given up, but now I have to go for a full native build,
which means I have to build a newer gcc, as all my existing Alpha installs
are too old to carry a usable gcc for modern kernel builds and all my attempts
on a fresh install have failed. My fastest machine is a PWS 600au, so this
will take a while.

I hope I'm not too annoying,
CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, Nightwatchers: On a Mission
