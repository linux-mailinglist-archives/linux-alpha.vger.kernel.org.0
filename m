Return-Path: <linux-alpha+bounces-1611-lists+linux-alpha=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-alpha@lfdr.de
Delivered-To: lists+linux-alpha@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C9F9E2644
	for <lists+linux-alpha@lfdr.de>; Tue,  3 Dec 2024 17:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95DF22855CF
	for <lists+linux-alpha@lfdr.de>; Tue,  3 Dec 2024 16:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3281F8907;
	Tue,  3 Dec 2024 16:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="sizE5QoI"
X-Original-To: linux-alpha@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7291F76D5;
	Tue,  3 Dec 2024 16:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733242274; cv=none; b=H00SFwAIGMzxML6BoK05PVrh+axHGzN5LGC4FKvMTVC0SjhDbhgh+FVW0wnEsToUt/MhmBWMo9O5ajlXXHhwPyMC3PG6FKVIi5C6sXTQEPdmGHKQPzzR1KltOTe+MBGjqw7LETxv+FqX9Fid6yL7+C262aFQIhDV5c25s0YMG0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733242274; c=relaxed/simple;
	bh=277NQChdWnV4HacrcegFUWzVRwOH48nxQcs2AvUWU/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGXaFk9hK96JaCeFodjWvUoSRcALoVvacJpLSwcJVZJQQa9WcT4ayy/THVgawXHlMrzGptCbKlwU9RxEyfdPP0br0rY/Aoz2PWe163A81Z5xIrn+yOJwPFAsEUVRk8X5nLmXsTKfM6oCCvPIQFG8InDrEUUyNC1JDYR7Fdil3ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=sizE5QoI; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733242270;
	bh=277NQChdWnV4HacrcegFUWzVRwOH48nxQcs2AvUWU/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sizE5QoIfdIYrqxRdwX94ZC/agXw0pa0PTSsY+EhiaHK9ZyNdezGC3st3dTpS0o5y
	 8J4Rum3nNJJc9R7oV79zFn2aPNNgOgAo2+kTKS3uiDI40pDCkYOi6LivymYIQUOLVi
	 Vh/4iUKA2LVrdrQMyxIcCg+a3+hHswgOA9DOmlgg=
Date: Tue, 3 Dec 2024 17:11:10 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Xinhui.Pan@amd.com, airlied@gmail.com, ajd@linux.ibm.com, 
	alexander.deucher@amd.com, alison.schofield@intel.com, amd-gfx@lists.freedesktop.org, 
	arnd@arndb.de, bhelgaas@google.com, carlos.bilbao.osdev@gmail.com, 
	christian.koenig@amd.com, dan.j.williams@intel.com, dave.jiang@intel.com, 
	dave@stgolabs.net, david.e.box@linux.intel.com, decui@microsoft.com, 
	dennis.dalessandro@cornelisnetworks.com, dri-devel@lists.freedesktop.org, fbarrat@linux.ibm.com, 
	gregkh@linuxfoundation.org, haiyangz@microsoft.com, hdegoede@redhat.com, 
	ilpo.jarvinen@linux.intel.com, ira.weiny@intel.com, jgg@ziepe.ca, jonathan.cameron@huawei.com, 
	kys@microsoft.com, leon@kernel.org, linux-alpha@vger.kernel.org, 
	linux-cxl@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	logang@deltatee.com, martin.petersen@oracle.com, mattst88@gmail.com, 
	miquel.raynal@bootlin.com, mwalle@kernel.org, naveenkrishna.chatradhi@amd.com, 
	platform-driver-x86@vger.kernel.org, pratyush@kernel.org, rafael@kernel.org, 
	richard.henderson@linaro.org, richard@nod.at, simona@ffwll.ch, srinivas.kandagatla@linaro.org, 
	tudor.ambarus@linaro.org, vigneshr@ti.com, vishal.l.verma@intel.com, wei.liu@kernel.org
Subject: Re: [PATCH v2 09/10] sysfs: bin_attribute: add const read/write
 callback variants
Message-ID: <5b589ddb-e3c9-40e1-987f-30ba81dc8ace@t-8ch.de>
References: <20241103-sysfs-const-bin_attr-v2-9-71110628844c@weissschuh.net>
 <7ed3b713f8901398f52d7485d59613c19ea0e752.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ed3b713f8901398f52d7485d59613c19ea0e752.camel@HansenPartnership.com>

On 2024-12-03 11:06:16-0500, James Bottomley wrote:
> > diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> > index
> > d17c473c1ef292875475bf3bdf62d07241c13882..d713a6445a6267145a7014f308d
> > f3bb25b8c3287 100644
> > --- a/include/linux/sysfs.h
> > +++ b/include/linux/sysfs.h
> > @@ -305,8 +305,12 @@ struct bin_attribute {
> >  	struct address_space *(*f_mapping)(void);
> >  	ssize_t (*read)(struct file *, struct kobject *, struct
> > bin_attribute *,
> >  			char *, loff_t, size_t);
> > +	ssize_t (*read_new)(struct file *, struct kobject *, const
> > struct bin_attribute *,
> > +			    char *, loff_t, size_t);
> >  	ssize_t (*write)(struct file *, struct kobject *, struct
> > bin_attribute *,
> >  			 char *, loff_t, size_t);
> > +	ssize_t (*write_new)(struct file *, struct kobject *,
> > +			     const struct bin_attribute *, char *,
> > loff_t, size_t);
> >  	loff_t (*llseek)(struct file *, struct kobject *, const
> > struct bin_attribute *,
> >  			 loff_t, int);
> >  	int (*mmap)(struct file *, struct kobject *, const struct
> > bin_attribute *attr,
> > @@ -325,11 +329,28 @@ struct bin_attribute {
> >   */
> >  #define sysfs_bin_attr_init(bin_attr) sysfs_attr_init(&(bin_attr)-
> > >attr)
> >  
> > +typedef ssize_t __sysfs_bin_rw_handler_new(struct file *, struct
> > kobject *,
> > +					   const struct
> > bin_attribute *, char *, loff_t, size_t);
> > +
> >  /* macros to create static binary attributes easier */
> >  #define __BIN_ATTR(_name, _mode, _read, _write, _size)
> > {		\
> >  	.attr = { .name = __stringify(_name), .mode = _mode
> > },		\
> > -	.read	=
> > _read,						\
> > -	.write	=
> > _write,						\
> > +	.read =
> > _Generic(_read,						\
> > +		__sysfs_bin_rw_handler_new * :
> > NULL,			\
> > +		default :
> > _read						\
> > +	),							
> > 	\
> > +	.read_new =
> > _Generic(_read,					\
> > +		__sysfs_bin_rw_handler_new * :
> > _read,			\
> > +		default :
> > NULL						\
> > +	),							
> > 	\
> > +	.write =
> > _Generic(_write,					\
> > +		__sysfs_bin_rw_handler_new * :
> > NULL,			\
> > +		default :
> > _write					\
> > +	),							
> > 	\
> > +	.write_new =
> > _Generic(_write,					\
> > +		__sysfs_bin_rw_handler_new * :
> > _write,			\
> > +		default :
> > NULL						\
> > +	),							
> > 	\
> >  	.size	=
> > _size,						\
> >  }
> 
> It's probably a bit late now, but you've done this the wrong way
> around.  What you should have done is added the const to .read/.write
> then added a .read_old/.write_old with the original function prototype
> and used _Generic() to switch between them.  Then when there are no
> more non const left, you can simply remove .read_old and .write_old
> without getting Linus annoyed by having to do something like this:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e70140ba0d2b1a30467d4af6bcfe761327b9ec95

Not all users are using the macros to define their attributes.
(Nor do they want to)

These users would break with your suggestion.
Otherwise I agree.


Thomas

