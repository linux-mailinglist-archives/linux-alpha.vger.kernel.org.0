Return-Path: <linux-alpha+bounces-1938-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0906BA2D7AA
	for <lists+linux-alpha@lfdr.de>; Sat,  8 Feb 2025 18:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EF9E166980
	for <lists+linux-alpha@lfdr.de>; Sat,  8 Feb 2025 17:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDE11F3B8A;
	Sat,  8 Feb 2025 17:01:40 +0000 (UTC)
X-Original-To: linux-alpha@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052181F30DA;
	Sat,  8 Feb 2025 17:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739034100; cv=none; b=G93zJUBL2WfQLjN9F3pTvN9ZVOyWrMgGXFBxTSyxoLrcV0Rzk1NNqncnT42F4ltq91jMy7UEIUTEok0W1ynW9NFiUgEues1lHSUGvwcu/uz93fsltSuBsJXvu8O4g+WQRUdSREDP0QnRQddwY3X2qELPLV+hE+pCVMvmYCmjgKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739034100; c=relaxed/simple;
	bh=h2rkblmX5EfFrSe0nF4FTOWG+kG+A77Mx735MgMn3Xw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=msoTUVCTnUtV3OZdsJzXlReqqtLPRkvQ2BYTYdPstr6Pk483Qg7Sb69XPM60mmXcFEUoB9Ybut2JLnUlzeDUa8Uxprsdy91TC9xup7hTcHs7//poBExQFyaST+FoUjZiUReSmV26rohEDUyMfBxig7OW3ztPtr2v3spezGQHsG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5744C92009D; Sat,  8 Feb 2025 18:01:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5324992009C;
	Sat,  8 Feb 2025 17:01:37 +0000 (GMT)
Date: Sat, 8 Feb 2025 17:01:37 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Ivan Kokshaysky <ink@unseen.parts>
cc: Richard Henderson <richard.henderson@linaro.org>, 
    Matt Turner <mattst88@gmail.com>, Oleg Nesterov <oleg@redhat.com>, 
    Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
    "Paul E. McKenney" <paulmck@kernel.org>, 
    Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org, 
    linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 3/3] alpha: align stack for page fault and user
 unaligned trap handlers
In-Reply-To: <20250204223524.6207-4-ink@unseen.parts>
Message-ID: <alpine.DEB.2.21.2502081616240.65342@angie.orcam.me.uk>
References: <20250204223524.6207-1-ink@unseen.parts> <20250204223524.6207-4-ink@unseen.parts>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Feb 2025, Ivan Kokshaysky wrote:

> do_page_fault() and do_entUna() are special because they use
> non-standard stack frame layout. Fix them manually.
> 
> Cc: stable@vger.kernel.org
> Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Tested-by: Magnus Lindholm <linmag7@gmail.com>
> Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Signed-off-by: Ivan Kokshaysky <ink@unseen.parts>
> ---

Tested-by: Maciej W. Rozycki <macro@orcam.me.uk>

  Maciej

