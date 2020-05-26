Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B74E61D2509
	for <lists+linux-remoteproc@lfdr.de>; Thu, 14 May 2020 04:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgENCM2 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 13 May 2020 22:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726161AbgENCM1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 May 2020 22:12:27 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6105C061A0E
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 19:12:27 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w65so597667pfc.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 19:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w5HuC2pq36yj0OkTrV4K6iXdzhabf7/wAs9Khiu4wb4=;
        b=gBbWxf0sxZXo/ojCfIKRh5Crbnb0sduNMc4aS36VfsexEAB6BjFzpOL3A8RBK3Ih9+
         LZn3p7TpGawiclCva0F8oZ71qvI2WSkXVwt6MjRZOQb4jtXJ9kSu8NnZwOsB258fGLgP
         R8cOCYAeKcgf40M7taQ8K96GBW2wDxNO3/YoMyYl/wPlbAI1+DxMiEq1ocbYmtY6p093
         HG0oP9l9OYuUGnCDWswZnb90J8nCZXWVbSczRdT4kTPdiztuZr2o9wxCMJbRvfBWOM68
         2PWOTI4lilmyPSVEDtzUpngM7Womxku+M393qHMmEBMG/OUmsIipi/Vpk87VuGE6c7hu
         MKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w5HuC2pq36yj0OkTrV4K6iXdzhabf7/wAs9Khiu4wb4=;
        b=nGHqWufXq84reM6K1is2HuCNcC8/b5c2IrgyRHDKE0L4V9/IBlS1UVBrSJseM9wIAC
         +vG6zB4shVG9k+ix+Mv/eknXKe+oYMD4z+sZ9v3DCE5FrJJXnWetg717oEnNj8d2dmLl
         M8CraxSTURm151rmJUvGnxF1cLbSnafnLrZbjN+afw0Cqcn6O8f/frWw9YP8xUfIQPLk
         aFnG93BSzY5jekqJodoBl+q29qFNhzgsOGNEu/rY5z56vyqAGKnmotHtv3xjk7ImVY+l
         QkVDmF/8hx94ZWBR9bjUx5UmS4uWVpL4XMm3cwhhuAhM9Np/nFayoc9MVLYqNxjZXsfu
         wMww==
X-Gm-Message-State: AOAM532hmgVxjClQzEK3YtVkp84XnpZttGWXCgXmrTH2Ao7gK1msnZ+e
        j5XQx2HsshUOg5o9ml+dwsgf5A==
X-Google-Smtp-Source: ABdhPJxTVraityqx1KdWjBjcIoV6NWLKK7w8ftr0Z9ldOW4IGevBOpYjLS7GwNZJqdRINsqzVC/g1A==
X-Received: by 2002:a62:a106:: with SMTP id b6mr2040127pff.23.1589422346892;
        Wed, 13 May 2020 19:12:26 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f64sm17020727pjd.5.2020.05.13.19.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 19:12:26 -0700 (PDT)
Date:   Wed, 13 May 2020 19:10:55 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, loic.pallardy@st.com, arnaud.pouliquen@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/14] remoteproc: Refactor function rproc_fw_boot()
Message-ID: <20200514021055.GF16107@builder.lan>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-6-mathieu.poirier@linaro.org>
 <20200506003341.GD2329931@builder.lan>
 <20200508212756.GB5650@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508212756.GB5650@xps15>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 08 May 14:27 PDT 2020, Mathieu Poirier wrote:

> On Tue, May 05, 2020 at 05:33:41PM -0700, Bjorn Andersson wrote:
> > On Fri 24 Apr 13:01 PDT 2020, Mathieu Poirier wrote:
> > 
> > > Refactor function rproc_fw_boot() in order to better reflect the work
> > > that is done when supporting scenarios where the remoteproc core is
> > > synchronising with a remote processor.
> > > 
> > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index a02593b75bec..e90a21de9de1 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1370,9 +1370,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> > >  }
> > >  
> > >  /*
> > > - * take a firmware and boot a remote processor with it.
> > > + * boot or synchronise with a remote processor.
> > >   */
> > > -static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> > > +static int rproc_actuate_device(struct rproc *rproc, const struct firmware *fw)
> > 
> > Per patch 4 this function will if rproc_needs_syncing() be called with
> > fw == NULL, it's not obvious to me that the various operations on "fw"
> > in this function are valid anymore.
> 
> That is right, all firmware related operations in this function are found in
> remoteproc_internal.h where the value of rproc->sync_with_mcu is checked before
> moving forward. That allows us to avoid introducing a new function similar to
> rproc_fw_boot() but without firmware operations or peppering the code with if
> statements.
> 

As I wrote in my other reply, the two mechanisms seems to consist of the
following steps:

boot the core:
1) request firmware
2) prepare device
3) parse fw
4) handle resources
5) allocate carveouts
6) load segments
7) find resource table
8) prepare subdevices
9) power on
10) start subdevices

sync:
1) prepare device (?)
2) handle resources
3) allocate carveouts (?)
4) prepare subdevices
5) attach
6) start subdevices

Rather than relying on the state flag and missing ops will turn the
first list into the second list I conceptually prefer having two
separate functions that are easy to reason about.

But I haven't done any refactoring or implemented this, so in practice
the two might just be a lot of duplication(?)

> > 
> > >  {
> > >  	struct device *dev = &rproc->dev;
> > >  	const char *name = rproc->firmware;
> > > @@ -1382,7 +1382,9 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > -	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
> > > +	if (!rproc_needs_syncing(rproc))
> > 
> > Can't we make this check on fw, to make the relationship "if we where
> > passed a firmware object, we're going to load and boot that firmware"?
> 
> It can but I specifically decided to use rproc_needs_syncing() to be consistent
> with the rest of the patchset.  That way all we need to do is grep for
> rproc_needs_syncing to get all the places where a decision about synchronising
> with a remote processor is made.
> 

Conceptually we have a single "to sync or not to sync", but I think
we're invoking rproc_needs_syncing() 8 times during rproc_fw_boot() and
each of those operations may or may not do anything.

There are certain operations where I see it makes sense for a driver to
either implement or not, but I think that e.g. for a rproc in OFFLINE
state we should just require ops->start to be specified - because it
doesn't make sense to enter rproc_start() if ops->start is a nop.

Regards,
Bjorn

> > 
> > Regards,
> > Bjorn
> > 
> > > +		dev_info(dev, "Booting fw image %s, size %zd\n",
> > > +			 name, fw->size);
> > >  
> > >  	/*
> > >  	 * if enabling an IOMMU isn't relevant for this rproc, this is
> > > @@ -1818,7 +1820,7 @@ int rproc_boot(struct rproc *rproc)
> > >  		}
> > >  	}
> > >  
> > > -	ret = rproc_fw_boot(rproc, firmware_p);
> > > +	ret = rproc_actuate_device(rproc, firmware_p);
> > >  
> > >  	release_firmware(firmware_p);
> > >  
> > > -- 
> > > 2.20.1
> > > 
