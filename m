Return-Path: <linux-alpha+bounces-527-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C94378FF8C9
	for <lists+linux-alpha@lfdr.de>; Fri,  7 Jun 2024 02:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23837B20D90
	for <lists+linux-alpha@lfdr.de>; Fri,  7 Jun 2024 00:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A8DDDA8;
	Fri,  7 Jun 2024 00:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VxA8yVTI"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAAFBA40
	for <linux-alpha@vger.kernel.org>; Fri,  7 Jun 2024 00:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717721496; cv=none; b=FUCWEnrsngzwImTqROlA8j3YmFmNKftRWjBBW59ER0C1b/IFzo2NMaqeVHq+zg+TxEXce0X0o6CYUD02NgZiYCZVVqokS4S9XkBaDVjpQxtWAJsZVXF/iKWOo5WA6vKS3r/zwftahaPPWcegG5X0YZRbAdenMOn1ctMER+PnPdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717721496; c=relaxed/simple;
	bh=VNji1yzRROeMCdOqTJIJjHlea6F/lyUYaISZibZwYSg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LxXM/qAH0qTlhS4nvWVL9It/rUPQpLkASlaq6C137/ZXraaU3FiftnCgRiTzyaiS317S0rCXZRngOIUrJLuTfVMwD7Ae/CZaXEN9NnuP+IZDj2oNPRC/EHIh3r/wXjn5MTkjJWxWkwPjf7XC5dpsjvCTZzXwT/HDSgNZia2JM+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VxA8yVTI; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dfa73db88dcso2498546276.0
        for <linux-alpha@vger.kernel.org>; Thu, 06 Jun 2024 17:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717721492; x=1718326292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dVhDXhkK6znxXVk7QviPwY/Nc1Qoy5VmoPSCE310dtI=;
        b=VxA8yVTIcHgdMWQPa/FbLyo63E7yk89TJDA03ossfCrSCTkRzanT9q/WHkRWeQ7WTG
         4RNtnMDSGbbTIKc9lwfR+5Y2Aj9d+Aq6czoOXlwGHZgeiMd6UCA2nvGbYOH1zjadRjR+
         Q9FR74gLNDkOIYL6jExf5B2ckumm/0bWjq2Ky3wEdbrF9FVgbhGjsWjRAVqEEsXzGqdM
         P3ZDDeERs9ODm44k5J4N0FdqToSKm80oFIoHfQ4a+GhCxj1KD2NBfLw+LH/SxYHsnIgd
         /CdHPUQ1M8JkSNNCuiFtKoNfbi0JZRtUFhV6jP7hVNgKVhD8ivyJClXYZwaeT6O5gLpy
         RoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717721492; x=1718326292;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVhDXhkK6znxXVk7QviPwY/Nc1Qoy5VmoPSCE310dtI=;
        b=rJOhOuJHg3hEMtHONFahocOa8dkiPeo0LsBzJEhe2EyoUJbtpgZHY4OIhJBBe0LYUA
         L2Xqa9ddwsxfnnGbE4cg8cIaeX0hOKfVHP6tuBVvvUm8dlBex0pjixL72DS8eQblJSxF
         K/EVuqWAi9liXHNygakv/V5vhpa8cLF4JLBB3P74PLoqoB69KfoUewah/9zZy2mPqGJI
         KdwvgXzApK/RUKffOEBh1RGBmlyToygxFDCv3CiZCLw2czyRWpazmba1sgAi+HYBO4a+
         mIIrVgrde/i7f9b6ypF/iKtuqdf+WKSIxoZrgLgSRsoYvmMciTiWuMyFxsG565Qij48E
         elEg==
X-Forwarded-Encrypted: i=1; AJvYcCUCJ1ldRjm9zm/NpgFMCOUBZhfWY/OwDt1WQt36LDw8Kc8mlbaMvdbmFoUpVIqLFt4nA6pHuE/LR/WYLXSO/Vx0X5P7GAbjeb29wIU=
X-Gm-Message-State: AOJu0YyztFpYFgie+K/bv5u1oJtfhLM6eG0QIl2aqkLkXGX0zzNUyBJt
	anCn0HvODH5rJfkw5P6IjymWDIh+V1YkBe10Wxm5bBiG9bAX1ebRvOJNvsJEthGVoPd0Yjnu/+j
	aWH5upaZ5NBSBSGIBwXgzZw==
X-Google-Smtp-Source: AGHT+IFMQYk3cwbsXVWaC0FrJ4RplY3gFkdCM403zqYC+QDCB3UIy0FUkLS7xuA7JI/U3KVGktZ1x5K38LSsCcxv5w==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a05:6902:2b08:b0:df4:d6ca:fed0 with
 SMTP id 3f1490d57ef6-dfaf6552c24mr161582276.4.1717721492297; Thu, 06 Jun 2024
 17:51:32 -0700 (PDT)
Date: Fri,  7 Jun 2024 00:51:10 +0000
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240607005127.3078656-1-almasrymina@google.com>
Subject: [PATCH net-next v11 00/13] Device Memory TCP
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

v11: https://patchwork.kernel.org/project/netdevbpf/list/?series=3D857457&s=
tate=3D*
=3D=3D=3D=3D

Major Changes:
--------------

v11 addresses feedback received in v10. The major change is the removal
of the memory provider ops as requested by Christoph. We still
accomplish the same thing, but utilizing direct function calls with if
statements rather than generic ops.

Additionally address sparse warnings, bugs and review comments from
folks that reviewed.

As usual, the full devmem TCP changes including the full GVE driver
implementation is here:

https://github.com/mina/linux/commits/tcpdevmem-v11/

Detailed changelog:
-------------------

- Fixes in netdev_rx_queue_restart() from Pavel & David.
- Remove commit e650e8c3a36f5 ("net: page_pool: create hooks for
custom page providers") from the series to address Christoph's
feedback and rebased other patches on the series on this change.
- Fixed build errors with CONFIG_DMA_SHARED_BUFFER &&
  !CONFIG_GENERIC_ALLOCATOR build.
- Fixed sparse warnings pointed out by Paolo.
- Drop unnecessary gro_pull_from_frag0 checks.
- Added Bagas reviewed-by to docs.

Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Nikolay Aleksandrov <razor@blackwall.org>

v10: https://patchwork.kernel.org/project/netdevbpf/list/?series=3D852422&s=
tate=3D*
=3D=3D=3D=3D

Major Changes:
--------------

v9 was sent right before the merge window closed (sorry!). v10 is almost
a re-send of the series now that the merge window re-opened. Only
rebased to latest net-next and addressed some minor iterative comments
received on v9.

As usual, the full devmem TCP changes including the full GVE driver
implementation is here:

https://github.com/mina/linux/commits/tcpdevmem-v10/

Detailed changelog:
-------------------

- Fixed tokens leaking in DONTNEED setsockopt (Nikolay).
- Moved net_iov_dma_addr() to devmem.c and made it a devmem specific
  helpers (David).
- Rename hook alloc_pages to alloc_netmems as alloc_pages is now
  preprocessor macro defined and causes a build error.

v9:
=3D=3D=3D

Major Changes:
--------------

GVE queue API has been merged. Submitting this version as non-RFC after
rebasing on top of the merged API, and dropped the out of tree queue API
I was carrying on github. Addressed the little feedback v8 has received.

Detailed changelog:
------------------
- Added new patch from David Wei to this series for
  netdev_rx_queue_restart()
  - Fixed sparse error.
  - Removed CONFIG_ checks in netmem_is_net_iov()
  - Flipped skb->readable to skb->unreadable
  - Minor fixes to selftests & docs.

RFC v8:
=3D=3D=3D=3D=3D=3D=3D

Major Changes:
--------------

- Fixed build error generated by patch-by-patch build.
- Applied docs suggestions from Randy.

RFC v7:
=3D=3D=3D=3D=3D=3D=3D

Major Changes:
--------------

This revision largely rebases on top of net-next and addresses the feedback
RFCv6 received from folks, namely Jakub, Yunsheng, Arnd, David, & Pavel.

The series remains in RFC because the queue-API ndos defined in this
series are not yet implemented. I have a GVE implementation I carry out
of tree for my testing. A upstreamable GVE implementation is in the
works. Aside from that, in my estimation all the patches are ready for
review/merge. Please do take a look.

As usual the full devmem TCP changes including the full GVE driver
implementation is here:

https://github.com/mina/linux/commits/tcpdevmem-v7/

Detailed changelog:

- Use admin-perm in netlink API.
- Addressed feedback from Jakub with regards to netlink API
  implementation.
- Renamed devmem.c functions to something more appropriate for that
  file.
- Improve the performance seen through the page_pool benchmark.
- Fix the value definition of all the SO_DEVMEM_* uapi.
- Various fixes to documentation.

Perf - page-pool benchmark:
---------------------------

Improved performance of bench_page_pool_simple.ko tests compared to v6:

https://pastebin.com/raw/v5dYRg8L

      net-next base: 8 cycle fast path.
      RFC v6: 10 cycle fast path.
      RFC v7: 9 cycle fast path.
      RFC v7 with CONFIG_DMA_SHARED_BUFFER disabled: 8 cycle fast path,
                                                     same as baseline.

Perf - Devmem TCP benchmark:
---------------------

Perf is about the same regardless of the changes in v7, namely the
removal of the static_branch_unlikely to improve the page_pool benchmark
performance:

189/200gbps bi-directional throughput with RX devmem TCP and regular TCP
TX i.e. ~95% line rate.

RFC v6:
=3D=3D=3D=3D=3D=3D=3D

Major Changes:
--------------

This revision largely rebases on top of net-next and addresses the little
feedback RFCv5 received.

The series remains in RFC because the queue-API ndos defined in this
series are not yet implemented. I have a GVE implementation I carry out
of tree for my testing. A upstreamable GVE implementation is in the
works. Aside from that, in my estimation all the patches are ready for
review/merge. Please do take a look.

As usual the full devmem TCP changes including the full GVE driver
implementation is here:

https://github.com/mina/linux/commits/tcpdevmem-v6/

This version also comes with some performance data recorded in the cover
letter (see below changelog).

Detailed changelog:

- Rebased on top of the merged netmem_ref changes.

- Converted skb->dmabuf to skb->readable (Pavel). Pavel's original
  suggestion was to remove the skb->dmabuf flag entirely, but when I
  looked into it closely, I found the issue that if we remove the flag
  we have to dereference the shinfo(skb) pointer to obtain the first
  frag to tell whether an skb is readable or not. This can cause a
  performance regression if it dirties the cache line when the
  shinfo(skb) was not really needed. Instead, I converted the skb->dmabuf
  flag into a generic skb->readable flag which can be re-used by io_uring
  0-copy RX.

- Squashed a few locking optimizations from Eric Dumazet in the RX path
  and the DEVMEM_DONTNEED setsockopt.

- Expanded the tests a bit. Added validation for invalid scenarios and
  added some more coverage.

Perf - page-pool benchmark:
---------------------------

bench_page_pool_simple.ko tests with and without these changes:
https://pastebin.com/raw/ncHDwAbn

AFAIK the number that really matters in the perf tests is the
'tasklet_page_pool01_fast_path Per elem'. This one measures at about 8
cycles without the changes but there is some 1 cycle noise in some
results.

With the patches this regresses to 9 cycles with the changes but there
is 1 cycle noise occasionally running this test repeatedly.

Lastly I tried disable the static_branch_unlikely() in
netmem_is_net_iov() check. To my surprise disabling the
static_branch_unlikely() check reduces the fast path back to 8 cycles,
but the 1 cycle noise remains.

Perf - Devmem TCP benchmark:
---------------------

189/200gbps bi-directional throughput with RX devmem TCP and regular TCP
TX i.e. ~95% line rate.

Major changes in RFC v5:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1. Rebased on top of 'Abstract page from net stack' series and used the
   new netmem type to refer to LSB set pointers instead of re-using
   struct page.

2. Downgraded this series back to RFC and called it RFC v5. This is
   because this series is now dependent on 'Abstract page from net
   stack'[1] and the queue API. Both are removed from the series to
   reduce the patch # and those bits are fairly independent or
   pre-requisite work.

3. Reworked the page_pool devmem support to use netmem and for some
   more unified handling.

4. Reworked the reference counting of net_iov (renamed from
   page_pool_iov) to use pp_ref_count for refcounting.

The full changes including the dependent series and GVE page pool
support is here:

https://github.com/mina/linux/commits/tcpdevmem-rfcv5/

[1] https://patchwork.kernel.org/project/netdevbpf/list/?series=3D810774

Major changes in v1:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1. Implemented MVP queue API ndos to remove the userspace-visible
   driver reset.

2. Fixed issues in the napi_pp_put_page() devmem frag unref path.

3. Removed RFC tag.

Many smaller addressed comments across all the patches (patches have
individual change log).

Full tree including the rest of the GVE driver changes:
https://github.com/mina/linux/commits/tcpdevmem-v1

Changes in RFC v3:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1. Pulled in the memory-provider dependency from Jakub's RFC[1] to make the
   series reviewable and mergeable.

2. Implemented multi-rx-queue binding which was a todo in v2.

3. Fix to cmsg handling.

The sticking point in RFC v2[2] was the device reset required to refill
the device rx-queues after the dmabuf bind/unbind. The solution
suggested as I understand is a subset of the per-queue management ops
Jakub suggested or similar:

https://lore.kernel.org/netdev/20230815171638.4c057dcd@kernel.org/

This is not addressed in this revision, because:

1. This point was discussed at netconf & netdev and there is openness to
   using the current approach of requiring a device reset.

2. Implementing individual queue resetting seems to be difficult for my
   test bed with GVE. My prototype to test this ran into issues with the
   rx-queues not coming back up properly if reset individually. At the
   moment I'm unsure if it's a mistake in the POC or a genuine issue in
   the virtualization stack behind GVE, which currently doesn't test
   individual rx-queue restart.

3. Our usecases are not bothered by requiring a device reset to refill
   the buffer queues, and we'd like to support NICs that run into this
   limitation with resetting individual queues.

My thought is that drivers that have trouble with per-queue configs can
use the support in this series, while drivers that support new netdev
ops to reset individual queues can automatically reset the queue as
part of the dma-buf bind/unbind.

The same approach with device resets is presented again for consideration
with other sticking points addressed.

This proposal includes the rx devmem path only proposed for merge. For a
snapshot of my entire tree which includes the GVE POC page pool support &
device memory support:

https://github.com/torvalds/linux/compare/master...mina:linux:tcpdevmem-v3

[1] https://lore.kernel.org/netdev/f8270765-a27b-6ccf-33ea-cda097168d79@red=
hat.com/T/
[2] https://lore.kernel.org/netdev/CAHS8izOVJGJH5WF68OsRWFKJid1_huzzUK+hpKb=
LcL4pSOD1Jw@mail.gmail.com/T/

Changes in RFC v2:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The sticking point in RFC v1[1] was the dma-buf pages approach we used to
deliver the device memory to the TCP stack. RFC v2 is a proof-of-concept
that attempts to resolve this by implementing scatterlist support in the
networking stack, such that we can import the dma-buf scatterlist
directly. This is the approach proposed at a high level here[2].

Detailed changes:
1. Replaced dma-buf pages approach with importing scatterlist into the
   page pool.
2. Replace the dma-buf pages centric API with a netlink API.
3. Removed the TX path implementation - there is no issue with
   implementing the TX path with scatterlist approach, but leaving
   out the TX path makes it easier to review.
4. Functionality is tested with this proposal, but I have not conducted
   perf testing yet. I'm not sure there are regressions, but I removed
   perf claims from the cover letter until they can be re-confirmed.
5. Added Signed-off-by: contributors to the implementation.
6. Fixed some bugs with the RX path since RFC v1.

Any feedback welcome, but specifically the biggest pending questions
needing feedback IMO are:

1. Feedback on the scatterlist-based approach in general.
2. Netlink API (Patch 1 & 2).
3. Approach to handle all the drivers that expect to receive pages from
   the page pool (Patch 6).

[1] https://lore.kernel.org/netdev/dfe4bae7-13a0-3c5d-d671-f61b375cb0b4@gma=
il.com/T/
[2] https://lore.kernel.org/netdev/CAHS8izPm6XRS54LdCDZVd0C75tA1zHSu6jLVO8n=
zTLXCc=3DH7Nw@mail.gmail.com/

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* TL;DR:

Device memory TCP (devmem TCP) is a proposal for transferring data to and/o=
r
from device memory efficiently, without bouncing the data to a host memory
buffer.

* Problem:

A large amount of data transfers have device memory as the source and/or
destination. Accelerators drastically increased the volume of such transfer=
s.
Some examples include:
- ML accelerators transferring large amounts of training data from storage =
into
  GPU/TPU memory. In some cases ML training setup time can be as long as 50=
% of
  TPU compute time, improving data transfer throughput & efficiency can hel=
p
  improving GPU/TPU utilization.

- Distributed training, where ML accelerators, such as GPUs on different ho=
sts,
  exchange data among them.

- Distributed raw block storage applications transfer large amounts of data=
 with
  remote SSDs, much of this data does not require host processing.

Today, the majority of the Device-to-Device data transfers the network are
implemented as the following low level operations: Device-to-Host copy,
Host-to-Host network transfer, and Host-to-Device copy.

The implementation is suboptimal, especially for bulk data transfers, and c=
an
put significant strains on system resources, such as host memory bandwidth,
PCIe bandwidth, etc. One important reason behind the current state is the
kernel=E2=80=99s lack of semantics to express device to network transfers.

* Proposal:

In this patch series we attempt to optimize this use case by implementing
socket APIs that enable the user to:

1. send device memory across the network directly, and
2. receive incoming network packets directly into device memory.

Packet _payloads_ go directly from the NIC to device memory for receive and=
 from
device memory to NIC for transmit.
Packet _headers_ go to/from host memory and are processed by the TCP/IP sta=
ck
normally. The NIC _must_ support header split to achieve this.

Advantages:

- Alleviate host memory bandwidth pressure, compared to existing
 network-transfer + device-copy semantics.

- Alleviate PCIe BW pressure, by limiting data transfer to the lowest level
  of the PCIe tree, compared to traditional path which sends data through t=
he
  root complex.

* Patch overview:

** Part 1: netlink API

Gives user ability to bind dma-buf to an RX queue.

** Part 2: scatterlist support

Currently the standard for device memory sharing is DMABUF, which doesn't
generate struct pages. On the other hand, networking stack (skbs, drivers, =
and
page pool) operate on pages. We have 2 options:

1. Generate struct pages for dmabuf device memory, or,
2. Modify the networking stack to process scatterlist.

Approach #1 was attempted in RFC v1. RFC v2 implements approach #2.

** part 3: page pool support

We piggy back on page pool memory providers proposal:
https://github.com/kuba-moo/linux/tree/pp-providers

It allows the page pool to define a memory provider that provides the
page allocation and freeing. It helps abstract most of the device memory
TCP changes from the driver.

** part 4: support for unreadable skb frags

Page pool iovs are not accessible by the host; we implement changes
throughput the networking stack to correctly handle skbs with unreadable
frags.

** Part 5: recvmsg() APIs

We define user APIs for the user to send and receive device memory.

Not included with this series is the GVE devmem TCP support, just to
simplify the review. Code available here if desired:
https://github.com/mina/linux/tree/tcpdevmem

This series is built on top of net-next with Jakub's pp-providers changes
cherry-picked.

* NIC dependencies:

1. (strict) Devmem TCP require the NIC to support header split, i.e. the
   capability to split incoming packets into a header + payload and to put
   each into a separate buffer. Devmem TCP works by using device memory
   for the packet payload, and host memory for the packet headers.

2. (optional) Devmem TCP works better with flow steering support & RSS supp=
ort,
   i.e. the NIC's ability to steer flows into certain rx queues. This allow=
s the
   sysadmin to enable devmem TCP on a subset of the rx queues, and steer
   devmem TCP traffic onto these queues and non devmem TCP elsewhere.

The NIC I have access to with these properties is the GVE with DQO support
running in Google Cloud, but any NIC that supports these features would suf=
fice.
I may be able to help reviewers bring up devmem TCP on their NICs.

* Testing:

The series includes a udmabuf kselftest that show a simple use case of
devmem TCP and validates the entire data path end to end without
a dependency on a specific dmabuf provider.

** Test Setup

Kernel: net-next with this series and memory provider API cherry-picked
locally.

Hardware: Google Cloud A3 VMs.

NIC: GVE with header split & RSS & flow steering support.

Cc: Pavel Begunkov <asml.silence@gmail.com>
Cc: David Wei <dw@davidwei.uk>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yunsheng Lin <linyunsheng@huawei.com>
Cc: Shailend Chand <shailend@google.com>
Cc: Harshitha Ramamurthy <hramamurthy@google.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Jeroen de Borst <jeroendb@google.com>
Cc: Praveen Kaligineedi <pkaligineedi@google.com>



Mina Almasry (13):
  netdev: add netdev_rx_queue_restart()
  net: netdev netlink api to bind dma-buf to a net device
  netdev: support binding dma-buf to netdevice
  netdev: netdevice devmem allocator
  page_pool: convert to use netmem
  page_pool: devmem support
  memory-provider: dmabuf devmem memory provider
  net: support non paged skb frags
  net: add support for skbs with unreadable frags
  tcp: RX path for devmem TCP
  net: add SO_DEVMEM_DONTNEED setsockopt to release RX frags
  net: add devmem TCP documentation
  selftests: add ncdevmem, netcat for devmem TCP

 Documentation/netlink/specs/netdev.yaml |  57 +++
 Documentation/networking/devmem.rst     | 258 +++++++++++
 Documentation/networking/index.rst      |   1 +
 arch/alpha/include/uapi/asm/socket.h    |   6 +
 arch/mips/include/uapi/asm/socket.h     |   6 +
 arch/parisc/include/uapi/asm/socket.h   |   6 +
 arch/sparc/include/uapi/asm/socket.h    |   6 +
 include/linux/skbuff.h                  |  61 ++-
 include/linux/skbuff_ref.h              |  11 +-
 include/linux/socket.h                  |   1 +
 include/net/devmem.h                    | 124 ++++++
 include/net/mp_dmabuf_devmem.h          |  46 ++
 include/net/netdev_rx_queue.h           |   5 +
 include/net/netmem.h                    | 208 ++++++++-
 include/net/page_pool/helpers.h         | 153 +++++--
 include/net/page_pool/types.h           |  22 +-
 include/net/sock.h                      |   2 +
 include/net/tcp.h                       |   5 +-
 include/trace/events/page_pool.h        |  29 +-
 include/uapi/asm-generic/socket.h       |   6 +
 include/uapi/linux/netdev.h             |  19 +
 include/uapi/linux/uio.h                |  17 +
 net/bpf/test_run.c                      |   5 +-
 net/core/Makefile                       |   3 +-
 net/core/datagram.c                     |   6 +
 net/core/dev.c                          |   6 +-
 net/core/devmem.c                       | 375 ++++++++++++++++
 net/core/gro.c                          |   3 +-
 net/core/netdev-genl-gen.c              |  23 +
 net/core/netdev-genl-gen.h              |   6 +
 net/core/netdev-genl.c                  | 103 +++++
 net/core/netdev_rx_queue.c              |  74 ++++
 net/core/page_pool.c                    | 360 +++++++++-------
 net/core/skbuff.c                       |  83 +++-
 net/core/sock.c                         |  61 +++
 net/ipv4/esp4.c                         |   3 +-
 net/ipv4/tcp.c                          | 261 +++++++++++-
 net/ipv4/tcp_input.c                    |  13 +-
 net/ipv4/tcp_ipv4.c                     |  10 +
 net/ipv4/tcp_minisocks.c                |   2 +
 net/ipv4/tcp_output.c                   |   5 +-
 net/ipv6/esp6.c                         |   3 +-
 net/packet/af_packet.c                  |   4 +-
 tools/include/uapi/linux/netdev.h       |  19 +
 tools/testing/selftests/net/.gitignore  |   1 +
 tools/testing/selftests/net/Makefile    |   5 +
 tools/testing/selftests/net/ncdevmem.c  | 542 ++++++++++++++++++++++++
 47 files changed, 2759 insertions(+), 266 deletions(-)
 create mode 100644 Documentation/networking/devmem.rst
 create mode 100644 include/net/devmem.h
 create mode 100644 include/net/mp_dmabuf_devmem.h
 create mode 100644 net/core/devmem.c
 create mode 100644 net/core/netdev_rx_queue.c
 create mode 100644 tools/testing/selftests/net/ncdevmem.c

--=20
2.45.2.505.gda0bf45e8d-goog


