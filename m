Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDA5500224
	for <lists+linux-alpha@lfdr.de>; Thu, 14 Apr 2022 00:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238555AbiDMW4P (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 13 Apr 2022 18:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238671AbiDMW4M (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 13 Apr 2022 18:56:12 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6AA33583A9;
        Wed, 13 Apr 2022 15:53:48 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id C37FE92009E; Thu, 14 Apr 2022 00:53:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id C0D8792009D;
        Wed, 13 Apr 2022 23:53:47 +0100 (BST)
Date:   Wed, 13 Apr 2022 23:53:47 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>
cc:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PING^3][PATCH] Alpha: Remove redundant local asm header
 redirections
In-Reply-To: <alpine.DEB.2.21.2202131944000.34636@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2204132104530.9383@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2202131944000.34636@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sun, 13 Feb 2022, Maciej W. Rozycki wrote:

> Remove a number of asm headers locally redirected to the respective 
> generic or generated versions.

 Ping for:
<https://lore.kernel.org/lkml/alpine.DEB.2.21.2202131944000.34636@angie.orcam.me.uk/>

  Maciej
