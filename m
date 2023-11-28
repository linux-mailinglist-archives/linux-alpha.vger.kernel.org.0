Return-Path: <linux-alpha+bounces-97-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C527FBCDB
	for <lists+linux-alpha@lfdr.de>; Tue, 28 Nov 2023 15:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A270F1C20A9B
	for <lists+linux-alpha@lfdr.de>; Tue, 28 Nov 2023 14:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A4A524CB
	for <lists+linux-alpha@lfdr.de>; Tue, 28 Nov 2023 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/O4yKjG"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF6D182;
	Tue, 28 Nov 2023 05:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701177935; x=1732713935;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=v5kZeBtVjhn/s8XidixV9girh/5AonY7gkwyCtvwHsE=;
  b=T/O4yKjGp2LKmEUs4pqIndGMBqEKVTGSq+xLQK8XIErFkYHloPxn/oX1
   2ALh2hyqqrZf+ZVrrH67hzB2BvCLum1VM0cquDxqt+QnKwzwmcjp+oTlM
   MCgD0HEFrvB/vGJdWhAtjhsEygQYI7pvlEYPqJgM1ZIQpUK6D2m8WzvRe
   cL6GS7qyf+qdrr6133b+H04F/rofhswHQ67Fv5KlV9TyJ6l0w3YpbMbFs
   ThJnIF8nwxoBRIXQ1plhTrRaS5qVEIhkXD0dpZ31h8U4hyASZ1XKEA0wl
   LZ8+OdsZ6HgOzSyjydbve2I0veFPY5Upp5GLQhwNFOKDd0sLio+MueH4l
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="459428739"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="459428739"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 05:25:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="718383128"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="718383128"
Received: from haslam-mobl1.ger.corp.intel.com ([10.252.43.79])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 05:25:32 -0800
Date: Tue, 28 Nov 2023 15:25:30 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
    Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Subject: Re: [PATCH 2/5] tty: srmcons: make srmcons_do_write() return void
In-Reply-To: <20231127123713.14504-2-jirislaby@kernel.org>
Message-ID: <203edefa-a819-23cc-1697-7e60a6732f83@linux.intel.com>
References: <20231127123713.14504-1-jirislaby@kernel.org> <20231127123713.14504-2-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-5569259-1701177935=:1797"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-5569259-1701177935=:1797
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Mon, 27 Nov 2023, Jiri Slaby (SUSE) wrote:

> The return value of srmcons_do_write() is ignored as all characters are
> pushed. So make srmcons_do_write() to return void.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> ---
> 
> Notes:
>     [v2] reordered so that it makes sense
> 
>  arch/alpha/kernel/srmcons.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
> index b68c5af083cd..de896fa9829e 100644
> --- a/arch/alpha/kernel/srmcons.c
> +++ b/arch/alpha/kernel/srmcons.c
> @@ -88,7 +88,7 @@ srmcons_receive_chars(struct timer_list *t)
>  }
>  
>  /* called with callback_lock held */
> -static int
> +static void
>  srmcons_do_write(struct tty_port *port, const char *buf, int count)
>  {
>  	static char str_cr[1] = "\r";
> @@ -125,7 +125,6 @@ srmcons_do_write(struct tty_port *port, const char *buf, int count)
>  				need_cr = 0;
>  		}
>  	}
> -	return count;
>  }
>  
>  static ssize_t
> 

Reviewed-by: Ilpo J�rvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-5569259-1701177935=:1797--

