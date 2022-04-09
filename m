Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC3A4FA735
	for <lists+linux-alpha@lfdr.de>; Sat,  9 Apr 2022 13:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238453AbiDILXK (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sat, 9 Apr 2022 07:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240347AbiDILXJ (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Sat, 9 Apr 2022 07:23:09 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43653165A4
        for <linux-alpha@vger.kernel.org>; Sat,  9 Apr 2022 04:21:02 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id x17so9861275lfa.10
        for <linux-alpha@vger.kernel.org>; Sat, 09 Apr 2022 04:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=9VEvPWPJ6/pRsRbOBzBgeRvW8C/j5reINh4zVhfcd7g=;
        b=CLP+qi2LNJIL3DFGnK4/WwqrMGS3HOo6zKo0Om6LLBob1Sx35klgPrXkWGSjCLCjgd
         opoy7Kh13/meiXKleS7u9JQ0DpMrJTGDukG2763g2NgstWczBzEuHUw8x2myOVz/3sU1
         hZKUcUAAwyn4acwcpKMa9FJRw1QJC/MptHnlfWga+kk65Baj5RUsu3woP+HkvNSpd8fJ
         UCjhj4eqkFnvPIWB1l8teLxUI11g4FT30lW7pOA0D0c4iV80Bw4Pc0/v780iOmjZ4r8v
         MVE/WC/JmI96ws0dMP89wSsgUaYBQn7IyY2zxF4Xf+nqa4YsB8z1kaTjqLoARDhDww+B
         jNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=9VEvPWPJ6/pRsRbOBzBgeRvW8C/j5reINh4zVhfcd7g=;
        b=5sp9BSCLoFe280mUgLXNXfIT2K5vfyrhHhz7d5Kuh5JcWX2ztaCplT20lBhPG6PCeA
         g+GvCfy8E7hoOpNyt/sk9i7dFsnjq6xGxEtCQGP0WWTucI6MY3bJ7HOxkibyTydTuW18
         /KooBljKVYK71SzyHFkbVLftmkCZKfDGLPwCZzjOeNxIIzW/8KnfCR8pMFz391cTBDvs
         5nXdO9LDymrA+ir1qCRNhCNdqY6oB27rG0Q7S7KDbB+r/ep6r+6tNHOvQQU1xirS7VfL
         3C3rzaceFKKi6cGSrzx9YVsTy6RG4epeKPPx6TjdgP2mtciMiAIl7pvk4iXmmaDJwzHz
         wPww==
X-Gm-Message-State: AOAM533FFjhjz1ODXSHQMTMr5Kdtf4RaExAZHXC12F0gJVdGUNZx2PQ9
        7Fv1iuwCk+4bL5Pi5j6sgak9mCwdMPeqZsAANCA=
X-Google-Smtp-Source: ABdhPJyiqPs9k7RXtLYch9fpxgvYKmQWqTiLFBFoQXjL+I48zwYXgrI9p6qLjhqmP9DUccaNcOS4eP+jcT6zMxfvmLI=
X-Received: by 2002:a05:6512:3fa2:b0:44a:f3f0:47b6 with SMTP id
 x34-20020a0565123fa200b0044af3f047b6mr15889081lfa.610.1649503259933; Sat, 09
 Apr 2022 04:20:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:a78f:0:0:0:0:0 with HTTP; Sat, 9 Apr 2022 04:20:59 -0700 (PDT)
Reply-To: gr576366@gmail.com
From:   Margaret Ko May-Yee Leung <moruri999.m@gmail.com>
Date:   Sat, 9 Apr 2022 14:20:59 +0300
Message-ID: <CAGFXwJfLk9MknVx4gBg_maV0gZ5HadwBXLjEgvfwPvZb_iSjPA@mail.gmail.com>
Subject: Re;
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

-- 
I have a profitable deal for you
