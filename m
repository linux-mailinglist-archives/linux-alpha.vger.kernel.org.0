Return-Path: <linux-alpha+bounces-2609-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B23BE8B9E
	for <lists+linux-alpha@lfdr.de>; Fri, 17 Oct 2025 15:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B58EB4FF8B7
	for <lists+linux-alpha@lfdr.de>; Fri, 17 Oct 2025 13:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBA7331A58;
	Fri, 17 Oct 2025 13:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b="EeIIgiAt"
X-Original-To: linux-alpha@vger.kernel.org
Received: from manage.vyzra.com (unknown [104.128.60.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75330331A49
	for <linux-alpha@vger.kernel.org>; Fri, 17 Oct 2025 13:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.128.60.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706306; cv=none; b=Q+IY3pQ6BWrchFhvy10fCI71vYmnQvUNm0ll1Ib45+mRn2ysWUhzaM0h5+sV/ZsuvaSIArAT1/GLwXPlniE00ZAmyI8ipwNvdcf6TOtDtnk5v/qbvHmPkStkZMC+hDw1Z+rZ1D6EPcLkCcy59UTZkYvd5YiuePAdHFn8n8aBD74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706306; c=relaxed/simple;
	bh=biLnUx9jTTyVdIbdiavoTAgEZeIqqOihfb373MH/e18=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JCrOn2kBR1mPcWMKu/d/wyDESP5Q1SUyyF+yqfIqjOz8EDdF8l1e8YXZ/xghdAnZhniAb34vZUX0gVthGrCW+ecb/fexS1KS/Nt3woKSP+3fpoJqtpSi3fDMA/LYJnRRP/dg6k//UyNJAJTd+S8+SMpRb9iW2n4wgEv5oSpUluE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org; spf=none smtp.mailfrom=manage.vyzra.com; dkim=fail (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b=EeIIgiAt reason="key not found in DNS"; arc=none smtp.client-ip=104.128.60.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=manage.vyzra.com
Received: from debtmanager.org (unknown [103.237.86.103])
	by manage.vyzra.com (Postfix) with ESMTPA id 89AAE4C1AE06
	for <linux-alpha@vger.kernel.org>; Fri, 17 Oct 2025 07:45:31 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=debtmanager.org;
	s=DKIM2021; t=1760705132; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=Aj8bDacQlJB5qNMC5+yWWged1+K/M8YReXQkzUminbQ=;
	b=EeIIgiAtCdIG7m9FSw0ruDe/19TAApEYPShM1vjfOAKGnQcgj2S4h/esnpGiKrK1TUFPrY
	EgyOun/3DmWnkf9dlE8lInjZjnUvH3mcgzlaSqhEUj0s57RYbqzdqsEjA5BnAM49JaElZu
	xjm1GlyMen151mADifwzgsytpbge4Yu1RtLgXIxzh7oa/Q0wAjSmQ/LcUOPImwhiQb84wn
	1aylmBQMg0p5gobsSzAZaMplYPLvtvPg7wC28tH/h+oiQ9c0o7zNE0Wdl6UM9bAtf6Zt1x
	5wjVS3EC8RKycWzRVelOSVgp9oMreQ26v0hyvLxDV3hPH/j72a8lkztLVAMP0A==
Reply-To: vlad.dinu@rdslink.ro
From: "Vlad Dinu" <info@debtmanager.org>
To: linux-alpha@vger.kernel.org
Subject: *** Urgent Change ***
Date: 17 Oct 2025 05:45:31 -0700
Message-ID: <20251017054530.5F1A440768979100@debtmanager.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -0.10

Hello,

I am Vlad Dinu, the newly appointed Director of IMF Legal=20
Affairs, Security and Investigation. I have been given the=20
responsibility to look into all the payments that are still=20
pending and owed to fund beneficiaries / scam victims worldwide.

This action was taken because there have been issues with some=20
banks not being able to send or release money to the correct=20
beneficiary accounts. We have found out that some directors in=20
different organizations are moving pending funds to their own=20
chosen accounts instead of where they should go.

During my investigation, I discovered that an account was=20
reported to redirect your funds to a bank in Sweden.
The details of that account are provided below. I would like you=20
to confirm if you are aware of this new information, as we are=20
now planning to send the payment to the account mentioned.

NAME OF BENEFICIARY: ERIK KASPERSSON
BANK NAME: SWEDBANK AB
ADDRESS: REPSLAGAREGATAN 23A, 582 22 LINK=C3=96PING, SWEDEN
SWIFT CODE: SWEDSESS
ACCOUNT NUMBER: 84806-31282205


A payment instruction has been issued by the Department of=20
Treasury for an immediate release of your payment to the bank=20
account above without further prejudice. We cannot approve or=20
schedule payment to the 

given bank account without your confirmation. May we proceed with=20
the transfer to the Beneficiary: Erik Kaspersson, bank account in=20
Sweden?

I await your urgent response.

Mr. Vlad Dinu.

