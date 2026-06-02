Return-Path: <linux-alpha+bounces-3644-lists+linux-alpha=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-alpha@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD/oIgJjHmrCiwkAu9opvQ
	(envelope-from <linux-alpha+bounces-3644-lists+linux-alpha=lfdr.de@vger.kernel.org>)
	for <lists+linux-alpha@lfdr.de>; Tue, 02 Jun 2026 06:58:42 +0200
X-Original-To: lists+linux-alpha@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 099F562844E
	for <lists+linux-alpha@lfdr.de>; Tue, 02 Jun 2026 06:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A7D33035886
	for <lists+linux-alpha@lfdr.de>; Tue,  2 Jun 2026 04:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B53199931;
	Tue,  2 Jun 2026 04:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXjud0hl"
X-Original-To: linux-alpha@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165182C11E2
	for <linux-alpha@vger.kernel.org>; Tue,  2 Jun 2026 04:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376317; cv=pass; b=IoWn7AfIAM8MAjZq6ODf3xm72HK5Ku+xewGi/GI4pIHlALs5A4ghBv71SES1uY/Qt7lZZUqe54XWeYkwhleXtvhak5EdiYzbxYLqWWPfQwPa6/Cw7UmTrxU3RvjZ6wc82WnNqT2BXuJqkw7aeYkTyPxWd7PNaU+RKHzogdvUNm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376317; c=relaxed/simple;
	bh=EOSaXlTWytRVfXLOz4KD2o8c4YmV9sz6n8rT21KNy48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZT8nU73LBz2hGPh4XEChZmVfmshAcZ9GcjBp1nza7eEIiXzx+D8ZB2s3uhGVpckDTGVvs6PrF3mbxiqCAeSMXMtW8lUX7VtLh3Pd+t2IEN4bm9ctC3i0K/sIoeXS+ZPSQHh2B7RCkXPLaE7DxujrKVpm2qIbYKfr2++qZIFn8/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXjud0hl; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-beb44f97561so280265166b.0
        for <linux-alpha@vger.kernel.org>; Mon, 01 Jun 2026 21:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780376314; cv=none;
        d=google.com; s=arc-20240605;
        b=Ma82Z+dZdjiqb959klCTlzd0Jx/J6PwWiedPAo4QroJsRsZ5syPVE4i2Tgs9QlH8R9
         TLlvLRJNb7td1F3eq2Ytl3STkIICA8keWsWVrFfYGWyDT0ckLcP3iK1kqQc8m44dkuB1
         LaOMoq6G0er0yQQV0ZGyosIqKhwZkbXFGVE+qVCGumJ+0VWJGcrtYDZRO891sR3+xWZ2
         7IJ4hBGgFeS/CI2Zjgxr0gjw4x+xICkMrhWSK/sLgjDi7/vFOqg0sp2RsHbLsMaFlZFd
         8BovSFoWrOmyaBY7dDe4XCVuMr0AwD90w+3PtW4z/36DoIJWr7FTw0jo32S+dkL5ZBsh
         VlDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SHIiCZYmW4THOwcz5tc8dCkjswL5oi0qzy34/dGzVl4=;
        fh=wpchQ1Fj/cux4TG8kirnhnQdFjYMtsgKykf/lb6yFwU=;
        b=i5AMnJwkghaLvLLv+ncQOtHSTxvIbmI2C5xVkhTzaJzoB3rE+pGdZul0oFwMM8JPFb
         BEEkZ4voJSNsl42PS7KMr+ikvJRKH3BGgK9yrsLFNkqif06FYE9brpQJANvOnDAxzRaE
         7XoZAY6P2UxQ7xBssb04LcXOKryV6YxGQn76gvVHGo7nrhmYungoJlNiZzf0OUxLs2RZ
         ZU9uAa/kxTqgYzU7KbTOcJx/JuorVpJ5mZc3YX7Si5J02LMKUyWK56vxiTA3h7c5x4di
         sI32UGDwiVwhWBe1BsDlTg9gsEqCuSby+alQKuxRV2DWlU+efeSt2KyROeRKr7BUAE20
         BTWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780376314; x=1780981114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHIiCZYmW4THOwcz5tc8dCkjswL5oi0qzy34/dGzVl4=;
        b=gXjud0hlpPYyW1phpYgDcNUpwRTNOV5wjMD1IB268K2wK7C+2yh9mgo5FPCgCilvP9
         X6krT7awIr9D0NhPd3vGAPU4+CxvrfXIKsnauXX/qV8IUuCSZvFHEKw01+FHEdlKOLV3
         uwdaoDZgNBl6xY4Zyv4Rr7y4qB6eLCywCasO/Hq7uFWOhigC5Mqj4k18y8SmHI+N8F1U
         NS/7gy26RRjjenSgu73HY1STFAzZTIy+BAtm/5xBYmAI9RqMoiOMR5dwN1r4L15u0rCv
         WA6vTZsIVqHRuW3fZNToesly8Cwuh+dwUnsLQ7hqNYCiSj4Oi7w0mxiprKB2+we8hpGN
         CZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780376314; x=1780981114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SHIiCZYmW4THOwcz5tc8dCkjswL5oi0qzy34/dGzVl4=;
        b=NAwdyuXk45ob+Ys6foO0J3MYZCB2BuoEZ2h0WxTqXb20wdabVfWgz/8fI2z+D+2LKU
         4+7kydRJAwJXGfjvGA4AIaI+k7QXnWViryapbStdOFRmQAkYj5QSuOsPisyvVTycH2sr
         8fnk4bSIixntftt8LJQ4XFLWBgAA0a9p8iF3Ud3/+h4SvEtKEHzDCQxgjkaDiLmBP7SK
         4boy1jGYa2sbwFbxkVwx+UfjtLP+R8C9uweIZ2zXALbexGFtTo6t958pKbqbkndsGzhG
         6fMhbJkdH+RVpbUAKkc4LIRKIsh/GojoxbuQYz7VfwO329ygVqKfQYlL1l/mKEei4p7H
         f/dQ==
X-Gm-Message-State: AOJu0Ywr/J+POUJtd6xfx2IWWYmEpq+XvNKDcJY6WUO4gsQoSTEcarS0
	lzAsd4N8smlzcrT5c64jggAezEi9R3jjRGCZffwuS4UtLl5CPEj5J0dUsCUx+0b7f1Cpm2WCU36
	Hsj4TvlIbdqiI6Zt9S2+Jx+QNuwzmzGk=
X-Gm-Gg: Acq92OE/tBuA7MkDT08yWcFih+VNBYcPDhr5G8A5d5EYcuVViBvzmwuysqG33OFwMpF
	niLVqER1Hl2swVcqFPdKvVwr9OARZ1bM9j8pxMx6b/OjJFVQCCLlr9seaUftm5wdIswDz2GoURp
	lH/UaK7gbkUw4tjTPLcVxZFTSM8A19gfyCtdWNjhAfAhrEa1IQYvZ0rPk+UTnoOd4Y3sxl9baH5
	l+nEuPMhyJSoD9AlT8C4VWmuc/Ft4UTPWxNhtTzpl8cIiDHmckjnjX8vRg21MjvO4ioFsjMrBCe
	APm83d4kngNDYoZGP7MEsoIy9cqYZKkG3hMbScOAeZM1QdeOvtM=
X-Received: by 2002:a17:907:9804:b0:bd1:fe8f:59ab with SMTP id
 a640c23a62f3a-beab2c5d3cbmr847927366b.23.1780376314309; Mon, 01 Jun 2026
 21:58:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517233246.23915-1-enelsonmoore@gmail.com>
In-Reply-To: <20260517233246.23915-1-enelsonmoore@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 2 Jun 2026 06:58:22 +0200
X-Gm-Features: AVHnY4LRajuwcM645wF6j-DPxw8UZQVkW--edWdJAkoZhRRUbkf52zqJtHGjtuk
Message-ID: <CA+=Fv5QFbrkMj6cRYKuZaOY+dt+QbEbKSV9-urko5z5bRbkhrw@mail.gmail.com>
Subject: Re: [PATCH] alpha: remove unnecessary architecture-specific <asm/device.h>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-alpha@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3644-lists,linux-alpha=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmag7@gmail.com,linux-alpha@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-alpha];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 099F562844E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 1:32=E2=80=AFAM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
>
> arch/alpha/include/asm/device.h simply includes <asm-generic/device.h>,
> and therefore the Alpha-specific version is unnecessary. Remove it.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  arch/alpha/include/asm/device.h | 6 ------
>  1 file changed, 6 deletions(-)
>  delete mode 100644 arch/alpha/include/asm/device.h
>
> diff --git a/arch/alpha/include/asm/device.h b/arch/alpha/include/asm/dev=
ice.h
> deleted file mode 100644
> index 9ca75a7db23e..000000000000
> --- a/arch/alpha/include/asm/device.h
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Arch specific extensions to struct device
> - */
> -#include <asm-generic/device.h>
> -
> --
> 2.43.0
>

Looks good to me. Alpha does not add anything architecture-specific here,
so falling back to the generic header is fine.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

