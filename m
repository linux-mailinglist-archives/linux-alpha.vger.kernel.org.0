Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78D013B37B7
	for <lists+linux-alpha@lfdr.de>; Thu, 24 Jun 2021 22:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbhFXUWB (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Thu, 24 Jun 2021 16:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232498AbhFXUWA (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Thu, 24 Jun 2021 16:22:00 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FFAFC061574
        for <linux-alpha@vger.kernel.org>; Thu, 24 Jun 2021 13:19:41 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id df12so10355451edb.2
        for <linux-alpha@vger.kernel.org>; Thu, 24 Jun 2021 13:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QdsTxdbLy6OAQCJe+BxLmLcw7gNCvC1VuxBL+c/EdBc=;
        b=CN50qFEZiM/KC40ZFphsMGum7u0fgQ/7PSKkzLv3Imv2qoT+m2I4xle85ef/hnSBmd
         jQ7V9plRVWmia3duLG9JtlwtA8gRKNqUguKYIy9mayOSyo2ct58AmgGxinOrbYWP7B9+
         tKraksvFmL2Pf/jciosSyTRbQSZ6FxNlrKsF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QdsTxdbLy6OAQCJe+BxLmLcw7gNCvC1VuxBL+c/EdBc=;
        b=qMzlR1GxbmQmO3UOVKmJRBA/UvBHZAYdg+3rJrWWqrXqQFdOYu672C8DJro8qyyWHC
         RUkLPPSjdJOzUIj6h8LIWNT+0RttdQg9wEs/jf/65juuNv7CvTe7fiLSuE1aU1yn+gXd
         n5DesRU4JAwGFBGtwzroyHSWI9lUtiMSwbLp6iM3My+IPnn04pcuoW5U+poNAQ2gSQtC
         aGxBdzQjrRI/8Cu72nAoS+2eV0EL0pWAmBG5HT10/fUhu3NJqZiKsDDXRd2bEinJ9Gov
         oXYr/RzYd6Hz0y9XJuN2SPrtzVSGdkc9TyK5MqlSNhgmi35fHVkjJ0kgW0BWsFpV3tEf
         m8UA==
X-Gm-Message-State: AOAM532bpbJa6ME7ba+HdVn1hsvc+vwL7R2AzsvCXWKCM7rBZJDGwIvN
        /SQnh/CGKWWP2R87UBNv/Y0uC5Hnjv76MZsRE84=
X-Google-Smtp-Source: ABdhPJy6+LCyGbrZrCrGficHRxT6UJhjP9R4zEB/MEJdR6mojxKKef6CfO1Q+rMdW27gT1l2IztuWA==
X-Received: by 2002:a05:6402:2687:: with SMTP id w7mr9691044edd.98.1624565979619;
        Thu, 24 Jun 2021 13:19:39 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id z28sm1564181ejl.69.2021.06.24.13.19.39
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 13:19:39 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id d16so7952304ejm.7
        for <linux-alpha@vger.kernel.org>; Thu, 24 Jun 2021 13:19:39 -0700 (PDT)
X-Received: by 2002:a05:6512:baa:: with SMTP id b42mr4974557lfv.487.1624565494034;
 Thu, 24 Jun 2021 13:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133> <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133> <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133> <875yy3850g.fsf_-_@disp2133> <87y2az5bmt.fsf_-_@disp2133>
In-Reply-To: <87y2az5bmt.fsf_-_@disp2133>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 24 Jun 2021 13:11:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg16ZBqtLngzE2edV8e68Qxje2kFehnKTrBBe5opcsj-w@mail.gmail.com>
Message-ID: <CAHk-=wg16ZBqtLngzE2edV8e68Qxje2kFehnKTrBBe5opcsj-w@mail.gmail.com>
Subject: Re: [PATCH 7/9] signal: Make individual tasks exiting a first class concept.
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Michael Schmitz <schmitzmic@gmail.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Thu, Jun 24, 2021 at 12:03 PM Eric W. Biederman
<ebiederm@xmission.com> wrote:
>
> Implement start_task_exit_locked and rewrite the de_thread logic
> in exec using it.
>
> Calling start_task_exit_locked is equivalent to asyncrhonously
> calling exit(2) aka pthread_exit on a task.

Ok, so this is the patch that makes me go "Yeah, this seems to all go together".

The whole "start_exit()" thing seemed fairly sane as an interesting
concept to the whole ptrace notification thing, but this one actually
made me think it makes conceptual sense and how we had exactly that
"start exit asynchronously" case already in zap_other_threads().

So doing that zap_other_threads() as that async exit makes me just
thin kthat yes, this series is the right thing, because it not only
cleans up the ptrace condition, it makes sense in this entirely
unrelated area too.

So I think I'm convinced. I'd like Oleg in particular to Ack this
series, and Al to look it over, but I do think this is the right
direction.

           Linus
