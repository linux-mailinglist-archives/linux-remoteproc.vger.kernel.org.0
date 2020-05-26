Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4441DA42C
	for <lists+linux-remoteproc@lfdr.de>; Tue, 19 May 2020 23:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgESV6e (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 19 May 2020 17:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgESV6e (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 May 2020 17:58:34 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E19DC08C5C0
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2020 14:58:34 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id k7so253017pjs.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2020 14:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kK+2pmAYy39VnLPMOLCXFZ6Zx76Shy7L3nYn+DJUmK8=;
        b=msPsCpepScCRymS+8srDcPupvtIh62gvkLNavHEXNy/iG0e1Fh7WSpBBfka2w5rPl0
         jjW2zcKn7rSUAkbvqiilBGY1Njybl7Ubqnx5uBhgrDX+YXF2aDYzaTcgB2HH3sKredq0
         nUzRikSMucERiLtJk5jlr3/c8UmzUqtUo1HzMthLGAqKDC99ia41IYXAfx+JkRgGBeD+
         hP1UsqeVZ7LT/RD+aLY+JIMEEi2Cy8pfyvCYvbIl0DcQ6H7oWUsQ11EEnPqn6RYi86Ah
         bQ8VuKv14CgYdg+daPckrWlkDLclYlQelVjcFNct+tNiJ1UFG/vZUJBKKkDepsKrATkS
         ShEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kK+2pmAYy39VnLPMOLCXFZ6Zx76Shy7L3nYn+DJUmK8=;
        b=iAcFODbGF7Is21b7OUJfpGqMsWYUw3E3SVqzGW7Wu2GZHFCFCGrrDz44lc9u6REZNR
         /ybasWiRKeBRqqCr/kKlO9qeoeBtu57gYpJjFnGhJ4OU4Kd4K+cbQp3yBD48rcAIlO9k
         fSbt0tmSDVEq4aaUGE+Wbwaj2sCKtO1b06ZAEUUi9p1oj71+Y98f7GruvwmLl9g8VY9c
         nl0YJFRoptDMXujcwGcP7FVrIztOYYyD2+zkMY6h1S1a7GI4acks8zmFx6yKR3uBXFkD
         anbLRE1aNVLaRYU/Q2gjbS9qHiDQBPhdHGEj7SoZWrNPbyr//sDxa8uP6GkBxptRiixX
         zVqw==
X-Gm-Message-State: AOAM531A48tvdlsxYb8HKG5f4aeZQG/c8iEJKEO8+HUEa+feGknnouhP
        O3FIbyWeFZHFp8G5xdUmFD4cBTbLqyM=
X-Google-Smtp-Source: ABdhPJwhWwu6zlCGmD9a0WYtDGqWID5DpQbADA8qlsSaV9aCUnyEqOuNK1bSHtBBdWvboMlDOSnplw==
X-Received: by 2002:a17:90a:ba09:: with SMTP id s9mr1654531pjr.55.1589925513391;
        Tue, 19 May 2020 14:58:33 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 1sm370511pff.180.2020.05.19.14.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 14:58:32 -0700 (PDT)
Date:   Tue, 19 May 2020 15:58:31 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 1/4] rpmsg: core: Add signal API support
Message-ID: <20200519215830.GA26832@xps15>
References: <1589346671-15226-1-git-send-email-aneela@codeaurora.org>
 <1589346671-15226-2-git-send-email-aneela@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589346671-15226-2-git-send-email-aneela@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arun,

On Wed, May 13, 2020 at 10:41:08AM +0530, Arun Kumar Neelakantam wrote:
> Some transports like Glink support the state notifications between
> clients using signals similar to serial protocol signals.
>

This changelog could use some more meat around the bone.  For someone not
familiar with Glink, I have to guess what is happening.
 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> ---
>  drivers/rpmsg/rpmsg_core.c     | 41 +++++++++++++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h |  5 +++++
>  include/linux/rpmsg.h          | 26 ++++++++++++++++++++++++++
>  3 files changed, 72 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index d6c3275..453790b 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -2,6 +2,7 @@
>  /*
>   * remote processor messaging bus
>   *
> + * Copyright (c) 2018, The Linux Foundation.

What is the reason for adding this copyright?

>   * Copyright (C) 2011 Texas Instruments, Inc.
>   * Copyright (C) 2011 Google, Inc.
>   *
> @@ -283,6 +284,42 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  }
>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>  
> +/**
> + * rpmsg_get_signals() - get the signals for this endpoint
> + * @ept:	the rpmsg endpoint
> + *
> + * Returns signal bits on success and an appropriate error value on failure.
> + */
> +int rpmsg_get_signals(struct rpmsg_endpoint *ept)
> +{
> +	if (WARN_ON(!ept))
> +		return -EINVAL;
> +	if (!ept->ops->get_signals)
> +		return -EOPNOTSUPP;

All other accessors return -ENXIO when the ops is not defined, please do the
same.

> +
> +	return ept->ops->get_signals(ept);
> +}
> +EXPORT_SYMBOL(rpmsg_get_signals);
> +
> +/**
> + * rpmsg_set_signals() - set the remote signals for this endpoint
> + * @ept:	the rpmsg endpoint
> + * @set:	set mask for signals
> + * @clear:	clear mask for signals
> + *
> + * Returns 0 on success and an appropriate error value on failure.
> + */
> +int rpmsg_set_signals(struct rpmsg_endpoint *ept, u32 set, u32 clear)
> +{
> +	if (WARN_ON(!ept))
> +		return -EINVAL;
> +	if (!ept->ops->set_signals)
> +		return -EOPNOTSUPP;
> +
> +	return ept->ops->set_signals(ept, set, clear);
> +}
> +EXPORT_SYMBOL(rpmsg_set_signals);
> +
>  /*
>   * match an rpmsg channel with a channel info struct.
>   * this is used to make sure we're not creating rpmsg devices for channels
> @@ -468,6 +505,10 @@ static int rpmsg_dev_probe(struct device *dev)
>  
>  		rpdev->ept = ept;
>  		rpdev->src = ept->addr;
> +
> +		if (rpdrv->signals)
> +			ept->sig_cb = rpdrv->signals;
> +

Here I am assuming the signal interface replaces the RPMSG namespace discovery
protocol enacted by solutions where virtio devices are used.  Please add enough
comments to the code, especially in the core, so that people don't have to
guess what is going on. 

>  	}
>  
>  	err = rpdrv->probe(rpdev);
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index 3fc83cd..8958d6c 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -2,6 +2,7 @@
>  /*
>   * remote processor messaging bus internals
>   *
> + * Copyright (c) 2018, The Linux Foundation.
>   * Copyright (C) 2011 Texas Instruments, Inc.
>   * Copyright (C) 2011 Google, Inc.
>   *
> @@ -47,6 +48,8 @@ struct rpmsg_device_ops {
>   * @trysendto:		see @rpmsg_trysendto(), optional
>   * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
>   * @poll:		see @rpmsg_poll(), optional
> + * @get_signals:	see @rpmsg_get_signals(), optional
> + * @set_signals:	see @rpmsg_set_signals(), optional
>   *
>   * Indirection table for the operations that a rpmsg backend should implement.
>   * In addition to @destroy_ept, the backend must at least implement @send and
> @@ -66,6 +69,8 @@ struct rpmsg_endpoint_ops {
>  			     void *data, int len);
>  	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
>  			     poll_table *wait);
> +	int (*get_signals)(struct rpmsg_endpoint *ept);
> +	int (*set_signals)(struct rpmsg_endpoint *ept, u32 set, u32 clear);
>  };
>  
>  int rpmsg_register_device(struct rpmsg_device *rpdev);
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index 9fe156d..48c8ae3 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -2,6 +2,7 @@
>  /*
>   * Remote processor messaging
>   *
> + * Copyright (c) 2018 The Linux Foundation.
>   * Copyright (C) 2011 Texas Instruments, Inc.
>   * Copyright (C) 2011 Google, Inc.
>   * All rights reserved.
> @@ -60,6 +61,7 @@ struct rpmsg_device {
>  };
>  
>  typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
> +typedef int (*rpmsg_rx_sig_t)(struct rpmsg_device *, void *, u32, u32);
>  
>  /**
>   * struct rpmsg_endpoint - binds a local rpmsg address to its user
> @@ -67,6 +69,7 @@ typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
>   * @refcount: when this drops to zero, the ept is deallocated
>   * @cb: rx callback handler
>   * @cb_lock: must be taken before accessing/changing @cb
> + * @sig_cb: rx serial signal handler
>   * @addr: local rpmsg address
>   * @priv: private data for the driver's use
>   *
> @@ -89,6 +92,7 @@ struct rpmsg_endpoint {
>  	struct kref refcount;
>  	rpmsg_rx_cb_t cb;
>  	struct mutex cb_lock;
> +	rpmsg_rx_sig_t sig_cb;

No locking is required in case of signals?

>  	u32 addr;
>  	void *priv;
>  
> @@ -102,6 +106,7 @@ struct rpmsg_endpoint {
>   * @probe: invoked when a matching rpmsg channel (i.e. device) is found
>   * @remove: invoked when the rpmsg channel is removed
>   * @callback: invoked when an inbound message is received on the channel
> + * @signals: invoked when a serial signal change is received on the channel
>   */
>  struct rpmsg_driver {
>  	struct device_driver drv;
> @@ -109,6 +114,7 @@ struct rpmsg_driver {
>  	int (*probe)(struct rpmsg_device *dev);
>  	void (*remove)(struct rpmsg_device *dev);
>  	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
> +	int (*signals)(struct rpmsg_device *, void *, u32, u32);

This line generates checkpatch warnings.  Please fix all checkpatch warnings
before sending a patchset. 

>  };
>  
>  #if IS_ENABLED(CONFIG_RPMSG)
> @@ -135,6 +141,9 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>  			poll_table *wait);
>  
> +int rpmsg_get_signals(struct rpmsg_endpoint *ept);
> +int rpmsg_set_signals(struct rpmsg_endpoint *ept, u32 set, u32 clear);
> +
>  #else
>  
>  static inline int register_rpmsg_device(struct rpmsg_device *dev)
> @@ -242,6 +251,23 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>  	return 0;
>  }
>  
> +static inline int rpmsg_get_signals(struct rpmsg_endpoint *ept)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return -ENXIO;
> +}
> +
> +static inline int rpmsg_set_signals(struct rpmsg_endpoint *ept,
> +				    u32 set, u32 clear)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return -ENXIO;
> +}
> +
>  #endif /* IS_ENABLED(CONFIG_RPMSG) */
>  
>  /* use a macro to avoid include chaining to get THIS_MODULE */
> -- 
> 2.7.4
