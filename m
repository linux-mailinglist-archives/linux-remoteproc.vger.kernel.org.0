Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70847274970
	for <lists+linux-remoteproc@lfdr.de>; Tue, 22 Sep 2020 21:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgIVTqj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 22 Sep 2020 15:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbgIVTqj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Sep 2020 15:46:39 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7285AC0613CF
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2020 12:46:39 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id v14so1949384pjd.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2020 12:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A7K1Lk9w2JU/mzkk5n/G5HuZZXn4DaRG+1GGMP6qt10=;
        b=o/QyLw5IOnPijUiB7gu11H8C/y8KX8qiQByDc/5cdDeCvxZCzAlzUMfPyxj1dquEej
         LpfGQK36XgsNckrrSIllSf2r2nvJMtQsil24ezMvc4ACTw1OPVtnF4bBSfJkGUkjaTFE
         w5PURjvycYfJZXSYiBjjGWb6kGKWujmGv+ZL0y9l5LOyk/f2d0dLFL+9I9JFX8k+0CUN
         KCtB6X5lM8rRNz1mdvqiozdPmLu3AulERdS0BjmMlcM8hIffsXxuZAGeyKkESAxVVoTe
         3MB/wLsMJ9ebKQZQ4CpxEs0j4l12BwD1cFfN2Fh28RD023yIt+YwUL21MguKhUUcbqDV
         IB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A7K1Lk9w2JU/mzkk5n/G5HuZZXn4DaRG+1GGMP6qt10=;
        b=CGK2wGz1wsjNPaVOaTjtHnSHblcHAFT56V94jHAPSErN8X4KT0Mf5R+iWxsq1vz+FH
         ab64+QGCC7bTSeSsgf98pL+pmZ/CqckctSQlOvOJ289EPxMo3iPwdQ/RQR0nyicLkRwl
         +8agiPl8Zk/fgUdM36hWomBhWe43D182gVFsFkrSI4isHBZ8dt/W3K8Z1lYFOcLbleA1
         L3kw4vaTeocOBtwTBbtE/tvSa0aYd4xHHQCKYebNmJdkiOJ1EhCIzQWPOserU5wvFqDB
         gFCUlrON1FdBOOfM8+j//hQgS3B0urmN5XNrXz0HM1tmwCWf8Ji6t/bHcC2iTY0pM7PQ
         Kveg==
X-Gm-Message-State: AOAM533QZ5nvzmdVUGe342l0h7zvXcpG0Ch3cu7seYfOKwENxHgqP2n8
        BsFg8CPEY4kE+57ue3klBciyZw==
X-Google-Smtp-Source: ABdhPJz/Wu2OzlX03ege7flSALsdwmfjWfG5jAcjBQpcHUrEISSvHqsvcce6tgf9nazx2u33oiUpuQ==
X-Received: by 2002:a17:90b:3014:: with SMTP id hg20mr5201262pjb.128.1600803998988;
        Tue, 22 Sep 2020 12:46:38 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y1sm14483510pgr.3.2020.09.22.12.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 12:46:38 -0700 (PDT)
Date:   Tue, 22 Sep 2020 13:46:36 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "guennadi.liakhovetski@linux.intel.com" 
        <guennadi.liakhovetski@linux.intel.com>,
        Loic PALLARDY <loic.pallardy@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 08/10] rpmsg: core: Add RPMSG byte conversion operations
Message-ID: <20200922194636.GC931970@xps15>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
 <20200922001000.899956-9-mathieu.poirier@linaro.org>
 <90c14e71-4c2b-9089-93d4-685b075873a9@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90c14e71-4c2b-9089-93d4-685b075873a9@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Sep 22, 2020 at 04:34:53PM +0200, Arnaud POULIQUEN wrote:
> 
> 
> On 9/22/20 2:09 AM, Mathieu Poirier wrote:
> > Add RPMSG device specific byte conversion operations as a first
> > step to separate the RPMSG name space service from the virtIO
> > transport layer.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/rpmsg/rpmsg_core.c     | 51 ++++++++++++++++++++++++++++++++++
> >  drivers/rpmsg/rpmsg_internal.h | 12 ++++++++
> >  2 files changed, 63 insertions(+)
> > 
> > diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> > index 50a835eaf1ba..66ad5b5f1e87 100644
> > --- a/drivers/rpmsg/rpmsg_core.c
> > +++ b/drivers/rpmsg/rpmsg_core.c
> > @@ -20,6 +20,57 @@
> >  
> >  #include "rpmsg_internal.h"
> >  
> > +/**
> > + * rpmsg{16|32}_to_cpu()
> > + * cpu_to_rpmsg[16|32}() - rpmsg device specific byte conversion functions to
> > + *			   perform byte conversion between rpmsg device and the
> > + *			   transport layer it is operating on.
> > + */
> > +
> > +u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, u16 val)
> > +{
> > +	if (WARN_ON(!rpdev))
> > +		return -EINVAL;
> > +	if (!rpdev->ops || !rpdev->ops->transport16_to_cpu)
> > +		return -EPERM;
> > +
> > +	return rpdev->ops->transport16_to_cpu(rpdev, val);
> > +}
> > +EXPORT_SYMBOL(rpmsg16_to_cpu);
> > +
> > +u16 cpu_to_rpmsg16(struct rpmsg_device *rpdev, u16 val)
> > +{
> > +	if (WARN_ON(!rpdev))
> > +		return -EINVAL;
> > +	if (!rpdev->ops || !rpdev->ops->cpu_to_transport16)
> > +		return -EPERM;
> > +
> > +	return rpdev->ops->cpu_to_transport16(rpdev, val);
> > +}
> > +EXPORT_SYMBOL(cpu_to_rpmsg16);
> > +
> > +u32 rpmsg32_to_cpu(struct rpmsg_device *rpdev, u32 val)
> > +{
> > +	if (WARN_ON(!rpdev))
> > +		return -EINVAL;
> > +	if (!rpdev->ops || !rpdev->ops->transport32_to_cpu)
> > +		return -EPERM;
> > +
> > +	return rpdev->ops->transport32_to_cpu(rpdev, val);
> > +}
> > +EXPORT_SYMBOL(rpmsg32_to_cpu);
> > +
> > +u32 cpu_to_rpmsg32(struct rpmsg_device *rpdev, u32 val)
> > +{
> > +	if (WARN_ON(!rpdev))
> > +		return -EINVAL;
> > +	if (!rpdev->ops || !rpdev->ops->cpu_to_transport32)
> > +		return -EPERM;
> 
> Alternative could be to choice the processor endianness ( it was the case
> before the virtio patch to set the endianness

That's a good idea.

> 
> > +
> > +	return rpdev->ops->cpu_to_transport32(rpdev, val);
> > +}
> > +EXPORT_SYMBOL(cpu_to_rpmsg32);
> > +
> >  /**
> >   * rpmsg_create_channel() - create a new rpmsg channel
> >   * using its name and address info.
> > diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> > index 2e65386f191e..2f0ad1a52698 100644
> > --- a/drivers/rpmsg/rpmsg_internal.h
> > +++ b/drivers/rpmsg/rpmsg_internal.h
> > @@ -81,6 +81,8 @@ struct virtio_rpmsg_channel {
> >  
> >  /**
> >   * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
> > + * @transport{16|32}_to_cpu: byte conversion from rpmsg device to transport layer
> > + * @cpu_to_transport{16|32}: byte conversion from transport layer to rpmsg device
> >   * @create_channel:	create backend-specific channel, optional
> >   * @release_channel:	release backend-specific channel, optional
> >   * @create_ept:		create backend-specific endpoint, required
> > @@ -92,6 +94,10 @@ struct virtio_rpmsg_channel {
> >   * advertise new channels implicitly by creating the endpoints.
> >   */
> >  struct rpmsg_device_ops {
> > +	u16 (*transport16_to_cpu)(struct rpmsg_device *rpdev, u16 val);
> > +	u16 (*cpu_to_transport16)(struct rpmsg_device *rpdev, u16 val);
> > +	u32 (*transport32_to_cpu)(struct rpmsg_device *rpdev, u32 val);
> > +	u32 (*cpu_to_transport32)(struct rpmsg_device *rpdev, u32 val);
> 
> This trigg me a suggestion. Perhaps it would be simpler to have only on ops
> to get the endianness.
> 

Another good idea, I'll look into it.

Thanks for the comments,
Mathieu

> Regards
> Arnaud
> 
> >  	struct rpmsg_device *(*create_channel)(struct rpmsg_device *rpdev,
> >  					     struct rpmsg_channel_info *chinfo);
> >  	int (*release_channel)(struct rpmsg_device *rpdev,
> > @@ -148,6 +154,12 @@ rpmsg_create_channel(struct rpmsg_device *rpdev,
> >  		     struct rpmsg_channel_info *chinfo);
> >  int rpmsg_release_channel(struct rpmsg_device *rpdev,
> >  			  struct rpmsg_channel_info *chinfo);
> > +
> > +u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, u16 val);
> > +u16 cpu_to_rpmsg16(struct rpmsg_device *rpdev, u16 val);
> > +u32 rpmsg32_to_cpu(struct rpmsg_device *rpdev, u32 val);
> > +u32 cpu_to_rpmsg32(struct rpmsg_device *rpdev, u32 val);
> > +
> >  /**
> >   * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
> >   * @rpdev:	prepared rpdev to be used for creating endpoints
> > 
