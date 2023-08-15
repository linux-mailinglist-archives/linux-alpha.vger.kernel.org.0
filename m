Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0053D77C89B
	for <lists+linux-alpha@lfdr.de>; Tue, 15 Aug 2023 09:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235143AbjHOHeT (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 15 Aug 2023 03:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235239AbjHOHd7 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 15 Aug 2023 03:33:59 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D821733
        for <linux-alpha@vger.kernel.org>; Tue, 15 Aug 2023 00:33:58 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-986d8332f50so692420766b.0
        for <linux-alpha@vger.kernel.org>; Tue, 15 Aug 2023 00:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1692084836; x=1692689636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ptPuBEpK+bTuLrHXWomcWZqL5q0T5IOC69Hvw3A95bI=;
        b=KFI+UK7Ev9NoB+QrDddZx9LmrmscknI+E/D4xZ0r2SJDn+V/VJeg6WzDm8K+PE5VNN
         M2LvF3rGyjKn17nbxKUmHNYzOzfjr95LpdXsPqRBGgf2GbmDPiXhPfd8YTIEkrriESHf
         nVwDddGFJiJnMuNDWe+lbiX5vs9w9SOivomOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692084836; x=1692689636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptPuBEpK+bTuLrHXWomcWZqL5q0T5IOC69Hvw3A95bI=;
        b=ktkIMbG5ul7zTe/THtViBLGZthxVh38kOLAY7zJqUq5P8XrIvzUpt8ISiEOwI6/6NP
         pFPpr/9FlOBq5zuGXialjNc1eH1FIE2gNaFHTAMGsC78JPj35P0kdjXNFv+DVv42PLza
         PMaEq5Q3mzDTXtPO52I9jw2N5puZG+6UA5XQGDhR5ZyH1xZZLaoAcwu4lehHvTTdsMfA
         TGUX2+yIHlCShDfeen/t/BXLi2/9N4gAvKHnj5wbb2edcIhQCLMesbc4eTn9YiNDip2J
         WLPzD/RtfjIekC+otN9F1PPn/s/yHsGYB6SdnAN9Nyhnn83LZq6YuHJq2yVseAInxJrx
         Hw7g==
X-Gm-Message-State: AOJu0YydV2UDwDWeHPMpkVTh48VO88Nyrk5UtxrHuFWpMiS47LBnGVp4
        yf2IRJrEMN1GH2j1O2N82Ij16RSlUPPYq1P/gCEJNUIG
X-Google-Smtp-Source: AGHT+IHD7GIzcEzbdT1LKnNNPLtk6B6i1J6oVFTSetEAsi+HxkMsj21eY+XRFkmioJQ1b4vD3VzxCw==
X-Received: by 2002:a17:907:a044:b0:982:c69c:8c30 with SMTP id gz4-20020a170907a04400b00982c69c8c30mr9006128ejc.55.1692084836571;
        Tue, 15 Aug 2023 00:33:56 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id u25-20020a17090657d900b0099bcf1c07c6sm6637000ejr.138.2023.08.15.00.33.53
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 00:33:54 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-522dd6b6438so6396709a12.0
        for <linux-alpha@vger.kernel.org>; Tue, 15 Aug 2023 00:33:53 -0700 (PDT)
X-Received: by 2002:a05:6402:290:b0:523:1004:1c9a with SMTP id
 l16-20020a056402029000b0052310041c9amr8202386edv.35.1692084833506; Tue, 15
 Aug 2023 00:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <202308151426.97be5bd8-oliver.sang@intel.com>
In-Reply-To: <202308151426.97be5bd8-oliver.sang@intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 15 Aug 2023 07:33:36 +0000
X-Gmail-Original-Message-ID: <CAHk-=whbOEhPUL1m8Ua-+-E7kJXED4xa+duzRF-wJKR84NAPWg@mail.gmail.com>
Message-ID: <CAHk-=whbOEhPUL1m8Ua-+-E7kJXED4xa+duzRF-wJKR84NAPWg@mail.gmail.com>
Subject: Re: [linus:master] [locking] c8afaa1b0f: stress-ng.zero.ops_per_sec
 6.3% improvement
To:     kernel test robot <oliver.sang@intel.com>
Cc:     Mateusz Guzik <mjguzik@gmail.com>, oe-lkp@lists.linux.dev,
        lkp@intel.com, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, ying.huang@intel.com,
        feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, 15 Aug 2023 at 07:12, kernel test robot <oliver.sang@intel.com> wrote:
>
> kernel test robot noticed a 6.3% improvement of stress-ng.zero.ops_per_sec on:

WTF? That's ridiculous. Why would that even test new_inode() at all?
And why would it make any difference anyway to prefetch a new inode?
The 'zero' test claims to just read /dev/zero in a loop...

[ Goes looking ]

>      39.35            -0.3       39.09        perf-profile.calltrace.cycles-pp.inode_sb_list_add.new_inode.shmem_get_inode.__shmem_file_setup.shmem_zero_setup

Ahh. It also does the mmap side, and the shared case ends up always
creating a new inode.

And while the test only tests *reading* and the mmap is read-only, the
/dev/zero file descriptor was opened for writing too, for a different
part of a test.

So even though the mapping is never written to, MAYWRITE is set, and
so the /dev/zero mapping is done as a shared memory mapping and we
can't do it as just a private one.

That's kind of stupid and looks unintentional, but whatever.

End result: that benchmark ends up being at least partly (and a fairly
noticeable part) a shmem setup benchmark, for no actual good reason.

Oh well. I certainly don't mind the removal apparently then also
helping some odd benchmark case, but I don't think this translates to
anything real. Very random.

                    Linus
