Return-Path: <linux-alpha+bounces-1750-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE2E9FAB39
	for <lists+linux-alpha@lfdr.de>; Mon, 23 Dec 2024 08:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C88E11883A1F
	for <lists+linux-alpha@lfdr.de>; Mon, 23 Dec 2024 07:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CF4189B86;
	Mon, 23 Dec 2024 07:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KBeO1QBl"
X-Original-To: linux-alpha@vger.kernel.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BDC28E3F
	for <linux-alpha@vger.kernel.org>; Mon, 23 Dec 2024 07:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734939660; cv=none; b=Ji1PsDejHb+QPQpCcjpLxi4tTezZsk8kXvO9dFYrd0KZuwb+v5MB4fN43puUi1dxNnU8rrRxlInWwnDmvMC5h9oX/tjdT31lYuL6s1JwaQT3KJJVIdRZlEbUrlNAEEz9rj3YHcGD7Mabev5a8Si1zN19/hajzWTuMqKzDRyYUlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734939660; c=relaxed/simple;
	bh=4ahCFuU7clUrGou7iErZdZolhTn7t0Sk2+czTt2uZuY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=AggMznUR96n+efBCh20rXJhassskmCzg8rwq5ZtWAqpKj/14i7em2KDTQjSIuVJWy6BKGm7h+XWsVB1a7i8L2tbncRDYqJWLTWoEQwTWmc3vpIEsyDY/I7bfmjHGpuk4GPdKiFGNlNh3DBk6elcWffUPxDKS43jFw8ns+s95e58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KBeO1QBl; arc=none smtp.client-ip=91.218.175.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734939655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6hH+En7lYpNxr/MhBj1Xan3maLqDPbCX7PuOWLPIjvE=;
	b=KBeO1QBlI1Kq1Qzc1KljsNkFxMR4A+Gp3FdjbVgGZP19gq13Rv0BzRXe70Y+OFF4G3GmPt
	rPOjGzSMU3rR+pHBNQF+83+ZwDERP3JF+T7nMuEZ25n37dAX9FpcZdq4t/vmVz4rb0ayVZ
	Pij/347AjusT7+gE2vpylEwZIepSQQ8=
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [RESEND PATCH] alpha: Replace one-element array with flexible
 array member
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <202412222144.61622A2@keescook>
Date: Mon, 23 Dec 2024 08:40:38 +0100
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>,
 linux-hardening@vger.kernel.org,
 linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <2248C26D-E4E4-4993-BF0A-96A613D1D4F0@linux.dev>
References: <20241220192020.1667-3-thorsten.blum@linux.dev>
 <202412222144.61622A2@keescook>
To: Kees Cook <kees@kernel.org>
X-Migadu-Flow: FLOW_OUT

On 23. Dec 2024, at 06:46, Kees Cook wrote:
> On Fri, Dec 20, 2024 at 08:20:20PM +0100, Thorsten Blum wrote:
>> Replace the deprecated one-element array with a modern flexible array
>> member in the struct crb_struct.
>> 
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> ---
> 
> Seems like this could use __counted_by(map_entries) as well?

Yes, but alpha doesn't seem to support __counted_by() yet. Does it still
make sense to add it then?

Thanks,
Thorsten

