Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A29C370B905
	for <lists+linux-alpha@lfdr.de>; Mon, 22 May 2023 11:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbjEVJfN (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 22 May 2023 05:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbjEVJfM (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Mon, 22 May 2023 05:35:12 -0400
Received: from mout.web.de (mout.web.de [212.227.17.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 647EDB9
        for <linux-alpha@vger.kernel.org>; Mon, 22 May 2023 02:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1684748089; i=frank.scheiner@web.de;
        bh=4fXn1Podj9BJK87mevwBgtWQ1/MnjWTYkvsTWsCHZxs=;
        h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
        b=G/JS1C+vh0Fgg5k3jR79H8seSS7SfvQGr/Q32TLnKuMr9CCDm6RtBVySOrvc3xxNP
         9A/HyAi5u4hQNJqYaGxL1M71lsnfvL8vFWW90u8Bc9DwlwSS3hG8k01yTZO5TSf0tC
         ZvqQYZvu4YsQPtZo0d9sA4foGicBcf+Yna260RxhqtrsJ/RffFH5kO2OaS7OQPKTfe
         /+FCrkHAQY6awsPGF8lnndRX/ZXLcstTXdHuGyaqtl2lNiWhiPCcKp1AS49hlW1Vnq
         8ObYV4Xan6RSjnO6MK8WRFVkk8OlWsK3hSz8PCZ54xCgZqMqFFSdS8x2EF955St6Lf
         z5vy9EdjUvheQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.30] ([79.200.218.46]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M608n-1q2ORf3bRL-007Zw6; Mon, 22
 May 2023 11:34:48 +0200
Message-ID: <57622252-b409-869e-7aae-81cf61e94fda@web.de>
Date:   Mon, 22 May 2023 11:34:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     linux-alpha@vger.kernel.org
Cc:     "debian-alpha@lists.debian.org" <debian-alpha@lists.debian.org>,
        Michael Cree <mcree@orcon.net.nz>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
From:   Frank Scheiner <frank.scheiner@web.de>
Subject: Linux 6.1.27, cgroup: Instruction fault 4 with systemd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+eWue8VkzQs/RCLEg5M/TBF0FetaLpTxJ9Ptnf1qFnyx5pF6RXv
 DnMicaWp+Qp0Zzdd7tPNzKp5WXguGkqIH8MdxqH6nkhOT5gONfG7GeakT69eZggadg8qX1Q
 6bn0VRipgD21BputwPUyZuA7njhxg8WqtUw6gDZsJQC6Aifj6VYHlZIw3vUWvpnCiyUrhDw
 AJ1wwUBfotFKbwtBGJGIg==
UI-OutboundReport: notjunk:1;M01:P0:8YI4nZHmGDQ=;f164bJMQKcFPK0xnulC3bOld0io
 bTTQ7SboFDltCleUB/IVq/Z7LI8/VpPnsYZnKTsSrsqdpMuk1F/iAiH/fAZKxdZgHBNYufFij
 WdCc3T2g5v1QoNDPr5S/3Di8LoHCeoRBlWf03GBbTV/7LzLk23Qdj+KD4Z99b0k/Jy3Rp8uhl
 +JvR52M/JfTeSVVO15OOP+X1zytl/JlcS16qtDnnZZxLzqK0+0YBgfoNAJW8S29RlonlRMvoh
 FVfsbcqycwYLwre3RBzMLm3/7eqCbfe9f7tJ9iJTCXsjdENA7exzS5v2nzEnhz2c8AHDF7mkn
 +iRKRxLhGIOR25nLtJTYLd4ZKH5uJh28n545PGIGhMWSD6K4zOfdWmr7CaM/wXHF+gN/rV9TP
 +2z57wv8i72e2cb1S2LYynpfOSo+WcHvri+H/IwDpEE0rgpu/FLdgG5rylfcL1O4L0b562gKS
 XmyknI1zQzKkiD+9qArC/z+D3I3rkpiyokz5s3noL+Gqr6gcYfCe8IkjMjTpym3XAELTvIHqc
 5aVHAYNHIaCgJrsP8Gq0TAl1zoa93CyvjJFsY+c1qB/rRqvJxwjlphZj6K6sg6DMUqBbxzPfB
 iKOIq/ILVNp47YQlZhj1gfqHn2M9WgBEalj2paj2Z+hkmG+KK5wRZDaK+8aKzZWgUM2X4p9oJ
 +fMboZT9WqkUvA7H6nCo+g32fljLQjIt+KWsoAx5W62A3m0dZeqHSDNGEPsPqOkXIHYABI4p0
 gVufpxwNHyPuha+yJMekiM+3LUmaddACvBJSWNfJiEBcIRewGxLza6jkQ9tBgvlGrV4sJHH8V
 qBJo2h8d+eEfcbLoGwejfbVT7BRYwkALzqLlvn0AOpp9gWp8hl7+0FXr80VDnutM+uvaJWFc4
 L7ITVO7wBYo+qS/qS6XOrRq2YHSHgk45qs+4ft/f4BI1D9ljuGn3Y8EdkJZd22t/3YRLRfRvD
 oiEnTTaAqznJObmfvh4t1jlOXxE=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Dear all,

as already outlined on the debian-alpha mailing list ([1]), I get an
instruction fault 4 with Linux 6.1.27 (6.1.0-9 on Debian actually) and
systemd on my DS25:

```
aboot: Linux/Alpha SRM bootloader version 1.0_pre20040408
aboot: switching to OSF/1 PALcode version 1.92
aboot: loading initrd (5376720 bytes/10502 blocks) at 0xfffffc00ffacc000
aboot: starting kernel network with arguments root=3D/dev/nfs
ip=3D:::::enP2p2s5:dhcp console=3DttyS0,9600n8
[    0.000000] Linux version 6.1.0-9-alpha-smp
(debian-kernel@lists.debian.org) (gcc-12 (Debian 12.2.0-9) 12.2.0, GNU
ld (GNU Binutils for Debian) 2.40) #1 SMP Debian
  6.1.27-1 (2023-05-08)
[    0.000000] Booting GENERIC on Titan variation Granite using machine
vector PRIVATEER from SRM
[    0.000000] Major Options: SMP MAGIC_SYSRQ
[    0.000000] Command line: root=3D/dev/nfs ip=3D:::::enP2p2s5:dhcp
console=3DttyS0,9600n8
[...]
Begin: Running /scripts/nfs-bottom ... done.
Begin: Running /scripts/init-bottom ... done.
[    9.820307] systemd[1]: systemd 252.6-1 running in system mode (+PAM
+AUDIT +SELINUX +APPARMOR +IMA +SMACK -SECCOMP +GCRYPT -GNUTLS +OPENSSL
+ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP
+LIBFDISK +PCRE2 -PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ
+ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT
default-hierarchy=3Dunified)
[   10.202143] systemd[1]: Detected architecture alpha.

Welcome to Debian GNU/Linux 12 (bookworm)!

[   11.864251] systemd[1]: Queued start job for default target
graphical.target.
[   11.958978] CPU 1
[   11.958978] systemd(1): Instruction fault 4
[   12.032220] pc =3D [<fffffc0005163bfc>]  ra =3D [<fffffc0005163bf8>]  p=
s
=3D 0000    Not tainted
[   12.131829] pc is at 0xfffffc0005163bfc
[   12.177728] ra is at 0xfffffc0005163bf8
[   12.223626] v0 =3D 0000000000000000  t0 =3D 0000000000000023  t1 =3D
fffffc00066eb800
[   12.310540] t2 =3D fffffc000512e680  t3 =3D 0000000000f00000  t4 =3D
0000000000000008
[   12.398431] t5 =3D 0000000000000001  t6 =3D 0000000000000000  t7 =3D
fffffc0005160000
[   12.486321] a0 =3D 0000000000000000  a1 =3D fffffc0005163bc0  a2 =3D
fffffc0005163bf8
[   12.573235] a3 =3D 0000000000000001  a4 =3D 00000002c8cf86cc  a5 =3D
0000000000000001
[   12.661126] t8 =3D 0000000000000080  t9 =3D 0000000000000001  t10=3D
fffffc0002891148
[   12.749016] t11=3D 0000000000000000  pv =3D fffffc00011d4a40  at =3D
5f19e10505e118bf
[   12.835930] gp =3D fffffc0002871148  sp =3D 00000000440a695e
[   12.899407] Disabling lock debugging due to kernel taint
[   12.962883] Trace:
[   12.987298] [<fffffc00011155d8>] cgroup_migrate_execute+0x338/0x600
[   13.062493] [<fffffc0001115da8>] cgroup_update_dfl_csses+0x2c8/0x330
[   13.138665] [<fffffc000111867c>] cgroup_subtree_control_write+0x56c/0x5=
e0
[   13.219719] [<fffffc000110dc24>] cgroup_file_write+0xa4/0x1a0
[   13.288079] [<fffffc0001379cd4>] kernfs_fop_write_iter+0x1a4/0x330
[   13.362297] [<fffffc00012a06c0>] vfs_write+0x250/0x4c0
[   13.423821] [<fffffc00012a0b1c>] ksys_write+0x8c/0x140
[   13.485344] [<fffffc000101158c>] entSys+0xac/0xc0
[   13.541985]
[   13.559563] Code:
[   13.559563]  fffffc00
[   13.582024]  00000000
[   13.610344]  00000000
[   13.638664]  05163bfc
[   13.666985]  fffffc00
[   13.695305]  02871148
[   13.723625] <fffffc00>
[   13.751946]  00000000
[   13.779289]
```

[1]: https://lists.debian.org/debian-alpha/2023/05/msg00007.html

Checking with a few alternatives, this already seems to happen with
Linux 6.0.7 and systemd 251.6-1 and 250.4-1.

When using sysvinit, the system comes up OK and runs stable over a few
runs of `7z b` and `openssl speed -elapsed`.

It does also not happen when using Linux 5.3.0-3 from Debian with the
same systemd versions on the same machine.

****

Michael provided a first analysis on [2], Adrian locates it in the
cgroup code.

[2]: https://lists.debian.org/debian-alpha/2023/05/msg00010.html

****

Maybe someone on linux-alpha has an idea what could be the reason?

Cheers,
Frank
