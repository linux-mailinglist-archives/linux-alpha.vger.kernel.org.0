Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4D90141C81
	for <lists+linux-alpha@lfdr.de>; Sun, 19 Jan 2020 06:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbgASFtR (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 19 Jan 2020 00:49:17 -0500
Received: from cpe-67-11-230-143.satx.res.rr.com ([67.11.230.143]:32806 "EHLO
        gherkin.frus.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgASFtQ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Sun, 19 Jan 2020 00:49:16 -0500
Received: by gherkin.frus.com (Postfix, from userid 500)
        id 65B3369CD4; Sat, 18 Jan 2020 23:49:16 -0600 (CST)
Date:   Sat, 18 Jan 2020 23:49:16 -0600
From:   Bob Tracy <rct@frus.com>
To:     Witold Baryluk <witold.baryluk@gmail.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
Subject: Re: dbus-daemon unaligned accesses
Message-ID: <20200119054916.GA7215@gherkin.frus.com>
References: <20200118160623.GA2136@gherkin.frus.com>
 <b656550f-76aa-c437-d3d9-36a868b8f093@physik.fu-berlin.de>
 <CAEGMnwooY_KiNzdwUMnQ2k6GyK8884BYAw0-HjrdJGtbnz2PgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEGMnwooY_KiNzdwUMnQ2k6GyK8884BYAw0-HjrdJGtbnz2PgA@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sat, Jan 18, 2020 at 05:33:31PM +0000, Witold Baryluk wrote:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=932381

At first glance, that certainly appears to be the issue.  The
conversation seems to have stalled-out as of July 2019.

memcpy() looks to be a good way of handling the problem, for the
reasons mentioned.  Did you try that fix?  If so, did it work for you?

--Bob
