Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B83165FCAD1
	for <lists+linux-alpha@lfdr.de>; Wed, 12 Oct 2022 20:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiJLSmf (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 12 Oct 2022 14:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiJLSme (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 12 Oct 2022 14:42:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20A79E6B8
        for <linux-alpha@vger.kernel.org>; Wed, 12 Oct 2022 11:42:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6EBE5615AD
        for <linux-alpha@vger.kernel.org>; Wed, 12 Oct 2022 18:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2AEC433C1;
        Wed, 12 Oct 2022 18:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665600152;
        bh=fWWqX899aP2P3gs1KHeqVTeMiyz+8pLSiuODGaykGms=;
        h=Date:From:To:Cc:Subject:From;
        b=npkFNDKbL/5evpZGpt7qDTBkmXl0DRWhxCx3fp0rmhvAyGxkFlwsZ9THS9LVk04y8
         4ubry/4rFtrRYLX5K3yWPP27sAlUGfGXSgO2VY6PufFtNJwcEpxL9hdvHSBM5WkmoG
         WipAw5q/wAP5ID8P0T0bcQOecSyJIDbjXvz2WFdb4want2qA9rzTl7VY1UmbFUJrv9
         szdfYoHMUJumoIM0pk/6qvLjxRq7lKG4cbDJz7bZiND8xKdjUh4eONWrn10gn+dnyZ
         KFTu4kiE3kI1olmOf2GjZRjp1Al6hQzStUKPtN1M6JNhIM2fp6Obr/eQbKHwNgvsH1
         AcjVebo/au8xQ==
Date:   Wed, 12 Oct 2022 13:42:31 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     helpdesk@kernel.org
Cc:     Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Subject: Add linux-alpha archives to lore.kernel.org?
Message-ID: <20221012184231.GA3106694@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

The linux-alpha@vger.kernel.org mailing list is listed in MAINTAINERS
and there's still a fair amount of traffic [1].

Can we add it to lore as a better archive?  Since it's hosted on vger,
I assume there are archives there already?

Bjorn

[1] https://www.spinics.net/lists/linux-alpha/
