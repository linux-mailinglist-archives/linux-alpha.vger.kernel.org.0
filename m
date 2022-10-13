Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB0E05FE167
	for <lists+linux-alpha@lfdr.de>; Thu, 13 Oct 2022 20:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbiJMSgy (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 13 Oct 2022 14:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbiJMSgG (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 13 Oct 2022 14:36:06 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 394B2167267
        for <linux-alpha@vger.kernel.org>; Thu, 13 Oct 2022 11:32:39 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id h15so2263767qtu.2
        for <linux-alpha@vger.kernel.org>; Thu, 13 Oct 2022 11:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p+ZyAAkkpyaEB6fyLnAthvxRFvNm4a2RDTTtMl8xu/o=;
        b=VdfB6+tvVT5n35d9TDhdmtzzrw2GarYTWyW+yFXAu3i0ziEXJUAyjttc6l8+1rc0Oi
         UcOioZmKbUP8wlr3Y9WfgGsWvVA1vTAnnTeMWQC0I1W+KRnOF752lq7gVz3iTd1hBgud
         omvOEjcoTkW2NItrzUwJNlvzK2sUzP2PzG9PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+ZyAAkkpyaEB6fyLnAthvxRFvNm4a2RDTTtMl8xu/o=;
        b=i5jsw3Gq3lLGGHsX43cqVQnBY6GAVWRQFQV96LSPdHhGbDplERqI64FkkjIgrmzErL
         mosq6xGUe+qD7z04+rugPRaB7xYKCRoxw/57Za54jKrZ6xpiwPD3YNudb7XX3SSKLmSo
         B54gIiI+J4NyfoAHtHB5XgFqeX/WTQzhdELL2uz8ZVNgasA6IFLO543GKqTPL5s+qAOu
         m2nYGqOFMjqXVtcOiAzL0aRlVfIvHAlM159LRqS+xtg6p74J1mrEIYYDi29nHYso6A3u
         xmgNaWNLy/Jfzca8XUSz6twM8h8O7ffRDhqPmzER4T2BtiAGPd4Bz5f7xXtNsRtU7SUh
         6zQA==
X-Gm-Message-State: ACrzQf0v35e/OXI+P45B5ybEU/QtDzKGaMkylquSv5LKwvWku6AnvAQZ
        SuXzf/ohJw5B/ggIfJ3+8BNjJA==
X-Google-Smtp-Source: AMsMyM4Fj5PUHowP0EysYxI/aiM4mNKind5gwzgvqxyq3lKzDtAKFUYwDLwzK3W6OEVdeL0ZGMS17w==
X-Received: by 2002:a05:622a:38f:b0:399:c718:74f7 with SMTP id j15-20020a05622a038f00b00399c71874f7mr1038158qtx.546.1665685892191;
        Thu, 13 Oct 2022 11:31:32 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id b26-20020ac8679a000000b00393c2067ca6sm454153qtp.16.2022.10.13.11.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 11:31:31 -0700 (PDT)
Date:   Thu, 13 Oct 2022 14:31:30 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     helpdesk@kernel.org,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Subject: Re: Add linux-alpha archives to lore.kernel.org?
Message-ID: <20221013183130.todr6xfry7p3zjlj@meerkat.local>
References: <20221012184231.GA3106694@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221012184231.GA3106694@bhelgaas>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Wed, Oct 12, 2022 at 01:42:31PM -0500, Bjorn Helgaas wrote:
> The linux-alpha@vger.kernel.org mailing list is listed in MAINTAINERS
> and there's still a fair amount of traffic [1].
> 
> Can we add it to lore as a better archive?  Since it's hosted on vger,
> I assume there are archives there already?

The collector is now subscribed to the list. Once we have the rest of the
archives, we can complete the setup.

-K
