Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31569D7DEF
	for <lists+linux-alpha@lfdr.de>; Tue, 15 Oct 2019 19:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388832AbfJORg0 (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 15 Oct 2019 13:36:26 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43999 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388830AbfJORg0 (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 15 Oct 2019 13:36:26 -0400
Received: by mail-pf1-f193.google.com with SMTP id a2so12912030pfo.10
        for <linux-alpha@vger.kernel.org>; Tue, 15 Oct 2019 10:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m+oSkq2BGDVnMXCTCZOGBY+AVAcaQgizlBaC3TfYgbk=;
        b=JV+TKEsIejeoGguft/smdhcOhD8TznOS3FDgaThCNzjFd/zO9Gf+USti5K/cmcvGGL
         VL+DN5u7ePo4IWynJI4kZyUxYCOiGUo31kRO4IGsw0RDA7MEE9P0Lx+Gh5T4vmOLDPmO
         nAWj+aCJO3XdoGRVZfY2JbnQgqczJYP20lPBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m+oSkq2BGDVnMXCTCZOGBY+AVAcaQgizlBaC3TfYgbk=;
        b=m/LEArHSY9Yuu77Hx4IHGHg1J6126a5628AD2BK5RzFUrn111Qlmh1xM/X7XOHBsCw
         FYsUmcAO+mT0sJ5S8bFO3f2yi1vGKATzZXHbc2Hh3AruNnEczJqhQbpXZxDWfC1NXu+g
         71cNWerLCkpao+R9AF89hzYZpFaPcLB5/3J071+xo1CRocNMACwFzfYl5p6jp7FzUST+
         IpgmLt9hlk3CKh3HeedoNUZ//VnJscHusD6yQum6j9JMoXpHgqJ2iwkeEo+n0XCQ0Mda
         VIiGeawGxOivXIFIw9ETCgymDEk7Bs4kS0WJOLSSvuQKdIcMY4b3qqHsEhAnuThJ8bBL
         XpUg==
X-Gm-Message-State: APjAAAXrFjKUUWfWy8bREazfIakrtn2VZtkltrwgYTbaxHTenLpwTSfk
        9K2i/4ISF2yg8VEyT0qKWekNnHt6V1s=
X-Google-Smtp-Source: APXvYqyiR4aQoe1gYk78ERJu5vF+BWIQdBY7ufngAKMkxwambAKLD5Wy/+2CK6+2hmVn878fjUO5OQ==
X-Received: by 2002:a62:b504:: with SMTP id y4mr39162264pfe.124.1571160984162;
        Tue, 15 Oct 2019 10:36:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f74sm25484564pfa.34.2019.10.15.10.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 10:36:23 -0700 (PDT)
Date:   Tue, 15 Oct 2019 10:36:21 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Segher Boessenkool <segher@kernel.crashing.org>,
        linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
        Michal Simek <monstr@monstr.eu>, x86@kernel.org,
        linux-ia64@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        linux-xtensa@linux-xtensa.org,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linuxppc-dev@lists.ozlabs.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-parisc@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org
Subject: Re: [PATCH v2 01/29] powerpc: Rename "notes" PT_NOTE to "note"
Message-ID: <201910151034.A21FDCA32@keescook>
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-2-keescook@chromium.org>
 <20191011082519.GI9749@gate.crashing.org>
 <201910110910.48270FC97@keescook>
 <20191011162552.GK9749@gate.crashing.org>
 <20191015165412.GD596@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015165412.GD596@zn.tnic>
Sender: linux-alpha-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, Oct 15, 2019 at 06:54:13PM +0200, Borislav Petkov wrote:
> On Fri, Oct 11, 2019 at 11:25:52AM -0500, Segher Boessenkool wrote:
> > Names *matter*, internal names doubly so.  So why replace a good name with
> > a worse name?  Because it is slightly less work for you?
> 
> So if we agree on the name "notes" and we decide to rename the other
> arches, this should all be done in a separate patchset anyway, and ontop
> of this one. And I believe Kees wouldn't mind doing it ontop since he's
> gotten his hands dirty already. :-P

Yeah, I'm fine with that. I would prefer to do it as a separate step,
just to minimize the logical steps each patch takes. Shall I spin a v3
with the Acks added and a final rename for this?

-- 
Kees Cook
