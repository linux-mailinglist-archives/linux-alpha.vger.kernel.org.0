Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEFBB34A0A7
	for <lists+linux-alpha@lfdr.de>; Fri, 26 Mar 2021 05:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbhCZEhw (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Fri, 26 Mar 2021 00:37:52 -0400
Received: from cpe-67-11-230-143.satx.res.rr.com ([67.11.230.143]:53820 "EHLO
        gherkin.frus.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbhCZEhR (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Fri, 26 Mar 2021 00:37:17 -0400
Received: by gherkin.frus.com (Postfix, from userid 500)
        id BFDC1626D9; Thu, 25 Mar 2021 23:37:15 -0500 (CDT)
Date:   Thu, 25 Mar 2021 23:37:15 -0500
From:   Bob Tracy <rct@frus.com>
To:     debian-alpha@lists.debian.org
Cc:     mcree@orcon.net.nz, linux-alpha@vger.kernel.org
Subject: Re: X11 system lockup with 5.11.0 kernel
Message-ID: <YF1k+3462hOXkI6d@gherkin.frus.com>
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Wed, Mar 24, 2021 at 09:48:46AM -0500, Bob Tracy wrote:
> (...) 
> Everything worked as well as it's going to for kernel versions up
> through v5.10.0.  When I boot on v5.11.0, "lightdm" starts, the screen
> goes blank as usual, I get a mouse pointer as usual, and shortly after
> that, the system locks up solid (completely nonresponsive except for
> being able to ping it -- can't login remotely).  Recovery is via the
> reset switch at that point :-(.
> (...)

Same results for 5.12.0-rc4 kernel.

--Bob
