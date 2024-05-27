Return-Path: <linux-alpha+bounces-462-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 538B28D10A7
	for <lists+linux-alpha@lfdr.de>; Tue, 28 May 2024 01:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57288B21CA7
	for <lists+linux-alpha@lfdr.de>; Mon, 27 May 2024 23:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5919010A35;
	Mon, 27 May 2024 23:49:26 +0000 (UTC)
X-Original-To: linux-alpha@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A5817E912;
	Mon, 27 May 2024 23:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716853766; cv=none; b=T9MDBvsbdS2M8EyMvuLJgXUBe1ZZX2No2lKKDNV9K5fLVC2fqO1uPxSuHT+SWXAB2hoMSYavFYpyotfVZvP6Y4Q4AzUkXcgrCBqB7Q6fgSaqa1c066vOcEnexmhGDn6hiQApQsKVE484xBowZVNnBi61iDzLjQXQ6q3SEp5pIgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716853766; c=relaxed/simple;
	bh=rabRgxOsPh5C2GiXUHySc/EapwoLaPE6Cxr5XfGbp/Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GB7nG25tppRkm1TZaaBJ5q9cQsi4/YOPeP/6RlDAD/1Hx9oNdFwsThoxHFiOAIbTJvKYbJbNdX4lquN1b/4drGNfB8R14/2BAGDGWz1aObf8ZuHFp/0t8i4NcTS69bcf+FWXO07zsmjLTZbB07fKXnT/jhsMjFd6XKgma7fUnOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2596D92009C; Tue, 28 May 2024 01:49:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 16C4092009B;
	Tue, 28 May 2024 00:49:16 +0100 (BST)
Date: Tue, 28 May 2024 00:49:16 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Arnd Bergmann <arnd@kernel.org>, linux-alpha@vger.kernel.org, 
    Arnd Bergmann <arnd@arndb.de>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
    Matt Turner <mattst88@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
    Marc Zyngier <maz@kernel.org>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, 
    Michael Cree <mcree@orcon.net.nz>, Frank Scheiner <frank.scheiner@web.de>
Subject: Re: [PATCH 00/14] alpha: cleanups for 6.10
In-Reply-To: <272a909522f2790a30b9a8be73ab7145bf06d486.camel@physik.fu-berlin.de>
Message-ID: <alpine.DEB.2.21.2405280041550.23854@angie.orcam.me.uk>
References: <20240503081125.67990-1-arnd@kernel.org> <272a909522f2790a30b9a8be73ab7145bf06d486.camel@physik.fu-berlin.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 May 2024, John Paul Adrian Glaubitz wrote:

> > I had investigated dropping support for alpha EV5 and earlier a while
> > ago after noticing that this is the only supported CPU family
> > in the kernel without native byte access and that Debian has already
> > dropped support for this generation last year [1] after it turned
> > out to be broken.
> 
> That's not quite correct. Support for older Alphas is not broken and
> always worked when I tested it. It's just that some people wanted to
> raise the baseline in order to improve code performance on newer machines
> with the hope to fix some minor issues we saw on Alpha here and there.

 I'm not quite happy to see pre-EV5 support go as EV45 is all the Alpha 
hardware I have and it's only owing to issues with the firmware of my 
console manager hardware that I haven't deployed it at my lab yet for 
Linux and GNU toolchain verification.  I'd rather I wasn't stuck with an 
obsolete version of Linux.

> > This topic came up again when Paul E. McKenney noticed that
> > parts of the RCU code already rely on byte access and do not
> > work on alpha EV5 reliably, so I refreshed my series now for
> > inclusion into the next merge window.
> 
> Hrrrm? That sounds like like Paul ran tests on EV5, did he?

 What exactly is required to make it work?

  Maciej

