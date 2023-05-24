Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66C6070FCA1
	for <lists+linux-alpha@lfdr.de>; Wed, 24 May 2023 19:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbjEXR2S (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Wed, 24 May 2023 13:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjEXR2R (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Wed, 24 May 2023 13:28:17 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7E793
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:28:16 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-96f818c48fbso208278466b.0
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1684949295; x=1687541295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObDKBRhJ0vxirZ4DEKIOQzI3AAzidba1IRigzBqLyYk=;
        b=WGWMX8QcBo5lDwOdLsqpGgY4sJ9lJ0BHzkJ05ccXe8dgvRKPeKLcMobRLAQRuIq0uB
         GxDuHsc5e2q16d3ryv7g8oD929F1nuAJH44m6Ad3bJh8I9yNiB8qFg5XmmAJC3MTw9FG
         mnIw3qWDfDC/WkKWrcFfumXoOU95rmuTmYKL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684949295; x=1687541295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObDKBRhJ0vxirZ4DEKIOQzI3AAzidba1IRigzBqLyYk=;
        b=fBvUCPIXqBqjUziYUxHsBZrq7HcETuLHCeIwGwF0S1zPQaWpvKr0ua+P3l4Jg4VxLM
         bHEcXpwjnCAocK+nhY93MIh2uV2yV/snosz2TzZb2qzsgE2vIOT6Bs2q8f3yazzXMgqI
         tdOygZa4NfaFRq35LKevRXN1w4LnKuQRksh8Wsb5VtpptcahQoXylkY+2vRMhuOLboaq
         tYV9JgBFq+hB5yl4mBBlhDNIMtMeyat2lGhXqi8ESyjNjKSDU9ZMc5qGVNqKWOP5i8jT
         TEuusMhbG6Zx+jfDyfTkjOLjy39gLWebYMK1M0Xj6xhENYXPDUghfMWgk8tz5BVvcvRz
         q0qQ==
X-Gm-Message-State: AC+VfDzkHpHhbI3WO+OKnWewI+XcG1PRXE+h+jkCqnv7EAsYalenA8Wf
        9sQ2mwWTdivbfuMlxTzH9ZakDnBiLpP3fvYSOclSi3Vs
X-Google-Smtp-Source: ACHHUZ5AE+X6rUJ6L/AeoQUWHgUSTMF4ryngGA0icCN88Ol1+e5W6LkLXWgeQueRDXB1npN9WolUlw==
X-Received: by 2002:a17:907:168b:b0:96f:da2c:ddc1 with SMTP id hc11-20020a170907168b00b0096fda2cddc1mr10952005ejc.75.1684949294646;
        Wed, 24 May 2023 10:28:14 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id m5-20020a17090672c500b009666523d52dsm6014484ejl.156.2023.05.24.10.28.13
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 10:28:14 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-96fbe7fbdd4so204022966b.3
        for <linux-alpha@vger.kernel.org>; Wed, 24 May 2023 10:28:13 -0700 (PDT)
X-Received: by 2002:a17:907:26c3:b0:94f:2a13:4e01 with SMTP id
 bp3-20020a17090726c300b0094f2a134e01mr17056730ejc.74.1684949293631; Wed, 24
 May 2023 10:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230524171822.177133-1-npiggin@gmail.com>
In-Reply-To: <20230524171822.177133-1-npiggin@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 24 May 2023 10:27:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjdRm=0kHEAByy5FdV0TsnWt270Yi55RmoOdsPB6qSwzw@mail.gmail.com>
Message-ID: <CAHk-=wjdRm=0kHEAByy5FdV0TsnWt270Yi55RmoOdsPB6qSwzw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Implement MMU_LAZY_TLB_SHOOTDOWN for alpha
To:     Nicholas Piggin <npiggin@gmail.com>
Cc:     linux-alpha@vger.kernel.org,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Wed, May 24, 2023 at 10:18=E2=80=AFAM Nicholas Piggin <npiggin@gmail.com=
> wrote:
>
> Any thoughts about the series would be interesting to hear.

Well, alpha is in a deathmatch with ia64 on "least relevant
architecture ever, and next to be removed".

There are no winners in that match.

I still have the alpha architecture manual somewhere here, but I
haven't touched any actual hardware in decades.

But I certainly don't see anything _wrong_ with your series from a
quick read-through.  It would be nice to hear that it works on real
hardware, of course, but from previous attempts, there's only a couple
of people that still occasionally run it.

               Linus
