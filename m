Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3B79E9196
	for <lists+linux-alpha@lfdr.de>; Tue, 29 Oct 2019 22:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfJ2VPm (ORCPT <rfc822;lists+linux-alpha@lfdr.de>);
        Tue, 29 Oct 2019 17:15:42 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33386 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbfJ2VPm (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>);
        Tue, 29 Oct 2019 17:15:42 -0400
Received: by mail-pl1-f195.google.com with SMTP id y8so8322776plk.0
        for <linux-alpha@vger.kernel.org>; Tue, 29 Oct 2019 14:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4W0RQy7L8eh7pRvWVxgcmtPohgICmGJuDBiUC3OtQXc=;
        b=I8U+d2V8b9DcvszTpNkYzx8YDIuowvCEAN8/hq06mWUBrW1C9IFc9zOdTV8NmetYIx
         XdchWOKTprtzj7BrCs1SWXwtizr/5Svkqrapz3CRCsQMazLT/znGCXGXfPoHk47uKD4s
         H8DeqA+Bp69QYF4iTcRYw2od2qrlqFz95t1aQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4W0RQy7L8eh7pRvWVxgcmtPohgICmGJuDBiUC3OtQXc=;
        b=Au0idX+m0qLuxYTO5H0nnJNlCDnPyOtPxWM1pgDvWdmAieNww5e4oolvzfLuPIKcM9
         gOzboFEd8w+Mfl7EHKPQuQoOEeRb+ER58mIDeNDJarapK0TQ58faCMhtF+nJV/eIsaJ0
         7PIO//pipMe+qKiAzK/EOYkQ1C4bfibWa47J1YbbUdL+Pxfl5yVX7anzAUb2non8XzwD
         GsP34mvHFxaGBcDSPWaTxmw2P7AwCRQteGoH7ArvAUBNoHEJslicfKMw4rqFZqaJ/L27
         bR53r6c/S4E0/Qerz7w+PsyARmNMp5dCx1MXwUlMijTJm8WVf5dVt+vUYxxBgjdVXfsj
         4YgQ==
X-Gm-Message-State: APjAAAUoUfQlEcx+ibAp5+hgCKziqGPSRKTOhDNVO8YYQqnt5Jd7TbyT
        iVTRqAmuMSpzmBbmY5xKrHenPg==
X-Google-Smtp-Source: APXvYqxcKsW5UISFe0oAVMX295CcWwGO1CFi+pF1WGPYr1NNtMArlvLHufwgOSgweI/u+V6GrCnhCQ==
X-Received: by 2002:a17:902:a98c:: with SMTP id bh12mr723589plb.289.1572383741354;
        Tue, 29 Oct 2019 14:15:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z18sm27341pfq.182.2019.10.29.14.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 14:15:40 -0700 (PDT)
Date:   Tue, 29 Oct 2019 14:15:39 -0700
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
Message-ID: <201910291414.F29F738B7@keescook>
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

I've added more rationale to patch #1 in the just-sent v3 of this
series. If I still can't convince you Segher, I'm happy to send "patch
30/29" to do a bulk rename to "notes". Let me know. :)

-- 
Kees Cook
