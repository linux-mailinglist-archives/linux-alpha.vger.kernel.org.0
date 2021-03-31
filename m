Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30AD34FC20
	for <lists+linux-alpha@lfdr.de>; Wed, 31 Mar 2021 11:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234086AbhCaJFQ (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 31 Mar 2021 05:05:16 -0400
Received: from angie.orcam.me.uk ([157.25.102.26]:38266 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234476AbhCaJEo (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 31 Mar 2021 05:04:44 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 88F1792009C; Wed, 31 Mar 2021 11:04:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 819FF92009B;
        Wed, 31 Mar 2021 11:04:42 +0200 (CEST)
Date:   Wed, 31 Mar 2021 11:04:42 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Bob Tracy <rct@frus.com>
cc:     debian-alpha@lists.debian.org, mcree@orcon.net.nz,
        linux-alpha@vger.kernel.org
Subject: Re: X11 system lockup with 5.11.0 kernel
In-Reply-To: <YF1k+3462hOXkI6d@gherkin.frus.com>
Message-ID: <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com> <YF1k+3462hOXkI6d@gherkin.frus.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, 25 Mar 2021, Bob Tracy wrote:

> > Everything worked as well as it's going to for kernel versions up
> > through v5.10.0.  When I boot on v5.11.0, "lightdm" starts, the screen
> > goes blank as usual, I get a mouse pointer as usual, and shortly after
> > that, the system locks up solid (completely nonresponsive except for
> > being able to ping it -- can't login remotely).  Recovery is via the
> > reset switch at that point :-(.
> > (...)
> 
> Same results for 5.12.0-rc4 kernel.

 I think the only feasible way of determining what has happened here is 
that you track the offending change down by bisecting the upstream kernel 
repository with `git bisect'.  Once you have it someone may help, either 
the author of the change, or the relevant maintainer, or someone else at 
<linux-kernel@vger.kernel.org>.

  Maciej
