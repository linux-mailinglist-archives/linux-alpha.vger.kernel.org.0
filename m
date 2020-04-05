Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2AC519ED76
	for <lists+linux-alpha@lfdr.de>; Sun,  5 Apr 2020 20:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgDESyS (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Sun, 5 Apr 2020 14:54:18 -0400
Received: from mail-ed1-f49.google.com ([209.85.208.49]:43155 "EHLO
        mail-ed1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgDESyR (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Sun, 5 Apr 2020 14:54:17 -0400
Received: by mail-ed1-f49.google.com with SMTP id bd14so16162747edb.10
        for <linux-alpha@vger.kernel.org>; Sun, 05 Apr 2020 11:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tA7A3TRvEPYMMVq2/ZnUcviHo2vqQZwzCcTe1paHlLk=;
        b=bfy02jjPNFTFBsQuh/2I/8dcv6+TilepxsEY6u1KQN5j+7hrTb5A3EVFHvyu6dXWUw
         08ZFAwK2AxjrvF9AtPA+m9HaRL5oP1WGcySQi0c1lJcjoPgBsU1UYh6T65JT9EKnYyMo
         qyMAoIltgUfXm5NeJb/FHa01k3IdFNHROHSSDgYggSZBD3aHinC5SXvPMlEt6eRETGT9
         0ygcQCHqNLGXTLLPBsrIlFmhVub7FpEhAjTKW0B+oj/6PIRdm82fyNTvvzM44fNJab52
         MDYIyg17kZEev3k2CLrk3nBa2BE9tUgd8SYcghd/9FbXfFW/31rD0wz73gHtkujtjPGx
         ZonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tA7A3TRvEPYMMVq2/ZnUcviHo2vqQZwzCcTe1paHlLk=;
        b=bW8yjuG2tRgrrhC7mBvYkgOlHXbWWaZls/qxskLlQ4DKWFonCeX3ledWQyYCbjmxt2
         RdEiUpdnmMFU1KQ2RQo8Hpo5VCDuf3teHtVzUTZpESAqLOahqbXJnHn3/0tR88wgPS1t
         vDsTiA8JcewhEx37w2fru4nCaw8GW6pkR7q0WNiVzExZVljmOAJfmV1sjYbMos54wQW9
         3vrRggpDzQSwnYDnCsKAJ3Ckot04EBQBUtdledIT/NtlboXT/QIQyPLiHuwLZlq9GA8P
         JEsbKWy5ulo/pK9weS9T0Ns27mi8opOjrhwyj7x+SCJqvYWR3EyfVp9LOYy/WNJ1JcUp
         hjIg==
X-Gm-Message-State: AGi0PuaYGldJlwFpdZ52rDcTUhkBvl/VJRwgS2RDLjnNe3VGgnkCrPPO
        SVNGDc4fzNAhPuhqi50Haoa4FgjUKXxo6nOEz0c+8g==
X-Google-Smtp-Source: APiQypIrT4hGMQuEk4XncujNvZJEXZ7ww+wbsuQRPSltPXiaTvlU5i0A4Ug4CDwI9Oz77NJiEq652vAbod1E3iesvjk=
X-Received: by 2002:a05:6402:3044:: with SMTP id bu4mr17142295edb.123.1586112856117;
 Sun, 05 Apr 2020 11:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200405184858.3963582-1-mattst88@gmail.com>
In-Reply-To: <20200405184858.3963582-1-mattst88@gmail.com>
From:   Matt Turner <mattst88@gmail.com>
Date:   Sun, 5 Apr 2020 11:54:04 -0700
Message-ID: <CAEdQ38EwVVfj=G9Zh0o4N1HaJLNrj=gzVXqSTvp=X26DSJhtrw@mail.gmail.com>
Subject: Re: [PATCH 1/5] silo: Build with -fno-PIC to reduce size
To:     linux-alpha <linux-alpha@vger.kernel.org>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Sun, Apr 5, 2020 at 11:49 AM Matt Turner <mattst88@gmail.com> wrote:
>

*Sigh*

Sent to the wrong mailing list. My apologies.
