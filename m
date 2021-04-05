Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E99DD353B66
	for <lists+linux-alpha@lfdr.de>; Mon,  5 Apr 2021 06:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbhDEEsF (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Mon, 5 Apr 2021 00:48:05 -0400
Received: from cpe-67-11-230-143.satx.res.rr.com ([67.11.230.143]:55714 "EHLO
        gherkin.frus.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbhDEEsF (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Mon, 5 Apr 2021 00:48:05 -0400
Received: by gherkin.frus.com (Postfix, from userid 500)
        id BEA5E626DC; Sun,  4 Apr 2021 23:47:58 -0500 (CDT)
Date:   Sun, 4 Apr 2021 23:47:58 -0500
From:   Bob Tracy <rct@frus.com>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     debian-alpha@lists.debian.org, mcree@orcon.net.nz,
        linux-alpha@vger.kernel.org
Subject: Re: X11 system lockup with 5.11.0 kernel
Message-ID: <YGqWfkMbChi7G/Vj@gherkin.frus.com>
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
 <YF1k+3462hOXkI6d@gherkin.frus.com>
 <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Wed, Mar 31, 2021 at 11:04:42AM +0200, Maciej W. Rozycki wrote:
>  I think the only feasible way of determining what has happened here is 
> that you track the offending change down by bisecting the upstream kernel 
> repository with `git bisect'.

That would normally be what I would do, and it may yet happen.  Problem
is, I don't have a 64-bit system with enough disk space to do the kernel
builds with a cross-compiler, and local (native) builds on the PWS are
taking 36+ hours each these days.  Unless I get *really* lucky with the
bisects, the task will take a couple of weeks.

Anyway, I've whined enough :-).  Might as well get started...

--Bob
