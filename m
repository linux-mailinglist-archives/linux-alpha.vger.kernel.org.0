Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02222616846
	for <lists+linux-alpha@lfdr.de>; Wed,  2 Nov 2022 17:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbiKBQTB (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 2 Nov 2022 12:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbiKBQSq (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Wed, 2 Nov 2022 12:18:46 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65DD32F399
        for <linux-alpha@vger.kernel.org>; Wed,  2 Nov 2022 09:13:39 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id k22so16847040pfd.3
        for <linux-alpha@vger.kernel.org>; Wed, 02 Nov 2022 09:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uXBcK0ACU7icO7ZJOoOW+GHoCNtTQkKatsk5MPgs1zg=;
        b=dT8+8X+2gJiAb3EJzyqUd2ySb4K1Da3NT1JdLLCgrDDZ8RBBoGyqdj70mnMBk0rnai
         E9paeDUuj8p3vkVcSbpOPp0vJC3ddyXHtS4Xl5g6XZwxFKSHQk45gr7p1X7lwCJrPm3g
         6rnxPKL8dWntY1qtOlsTmTu7nVZNTDEhkff7RkLojE+94hvVmfx+XPheRfWusoWbGdVu
         KESrKJxkOvRBwWO98cQJwmYMU2hhTqpwvBBv02XbfLcIniW1kP9fQWxixYutE/o74/0H
         XX2UHdRdUUTWZvpa0Ql9T24TUEauEbHUIsTAQRzMcBANrlbQvPE2XhvH0TsUOnA1ZBtc
         eqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXBcK0ACU7icO7ZJOoOW+GHoCNtTQkKatsk5MPgs1zg=;
        b=3Owf48BHO1X6VphJQ8JaVS3F8fJ2F4ArViOD8jrbBI3KuYPWAmQETEfbC6gQhkVT2b
         tSy3s+SHirU62VW3vEXkG9mAVnCPg5ybU8pVMt7D0FzTblMZvygnhDUsits4PnrVnz9q
         QFrooeJzUpqM+Mqw1kJ28xrAbY36jKeKKHFYweFe7qKOBU18VLOf3kCubRXRRtcfYAUO
         58/fV1oSqHrO6PpVbXTpUp7qx+i2U3gHb6G2Yg7CHwQUTYa9sLmSOJyHu53Ex+xA9sq3
         /B4Gjyndcxw72TuzajdDHAmplJUcDr4n6q1M+k7sYR/Hlq5qzHuYpaXyBTSzn3Fk+peD
         6abg==
X-Gm-Message-State: ACrzQf0jWYve1sa+YPkcLCTrouesOVn9Mdy5Idq2wXdlza0b9orwYCuo
        UcY8xj07qDEAka89KH2kyEZirycIu9fwpnicPUw=
X-Google-Smtp-Source: AMsMyM7oejZcouKBMPqkbu4oqTtthMeS8ihmM0mF+9XpIExmyPh5QDKMMk4bEtANY0fLox1qWHkpRGVHTsw57pR2RAI=
X-Received: by 2002:a05:6a00:27a0:b0:566:9cd9:3843 with SMTP id
 bd32-20020a056a0027a000b005669cd93843mr25941522pfb.17.1667405597065; Wed, 02
 Nov 2022 09:13:17 -0700 (PDT)
MIME-Version: 1.0
Reply-To: wf063385@gmail.com
Sender: privateaka103@gmail.com
Received: by 2002:a17:903:120d:b0:178:944c:45ac with HTTP; Wed, 2 Nov 2022
 09:13:16 -0700 (PDT)
From:   Williams Franco <wf063385@gmail.com>
Date:   Wed, 2 Nov 2022 16:13:16 +0000
X-Google-Sender-Auth: RfX-b-myMUMEIcCFintzM22fMYA
Message-ID: <CA+B+Etk=JyUygVzwu370sxSgr7SQnvSP7YKCy9fX5DvierSQAA@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

Hi greetings, my name is Williams Franco, from USA. It is my pleasure
to reach with you through this media, I wish to share something very
vital to you.
