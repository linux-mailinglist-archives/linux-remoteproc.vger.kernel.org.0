Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4D962FF90D
	for <lists+linux-remoteproc@lfdr.de>; Fri, 22 Jan 2021 00:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbhAUXrD (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 21 Jan 2021 18:47:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbhAUXrA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 21 Jan 2021 18:47:00 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200FAC0613ED
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 Jan 2021 15:46:20 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id t29so2498334pfg.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 Jan 2021 15:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k1M9wjUVYtoeJq8YrVy/FC3Nxc8VT4kRU7pOrSsvkdQ=;
        b=wzmltjsSrdLir61WBNAbEIB49FW2A9AbvjQct285FtPu7nR67Ov4C965p/cMcz0guf
         TDi80bHPgagSk//SOqUfUgFt890T/UHdQlIyXl+yp77aXU0RaF4pGoQalpIYYpp0gN6K
         RSYSujd3s1GChTJEALdwTumVU3vyzKdA8QJ/1jHhKtGBdMkT5z6laMplbDUowHL55Quv
         YHu+ThpnEoVMyHfVZVZH1ilThZ876rpXSXKSjZQI2ro+RjbJ+Ranzk7QVfR3rewG2WIl
         5clw53XjDi954yVFvC5irXKvcs0xkcyXUMwrYblNJSeNbb0DIMunm6jJ2wHTkubVE0Bm
         5yOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k1M9wjUVYtoeJq8YrVy/FC3Nxc8VT4kRU7pOrSsvkdQ=;
        b=pkba3v+QUgDLdlToyojRLLla7Ae54+QCh8u2gO55jFYH4Dijaa6StmFq4ZYi/UZhGq
         coI53ADNOtHS7Txp5xkdPZWZsz86aXxoSj7BpCLrs5CG9wKVfPA4cwnfS3qVTR0NPOYg
         s6RfD+WDq8xyFvyJYWvv6x13XrmrIAFsuqVZ59vD9gDDFTBRPq5P40mYoxbx5981niNG
         AsUV98NAI6whnxlY1JGM/qTN0N6dUi1zKUZL8Ha3HJ8RihfgKfpu6rusnjxY3KvbiH6R
         cRXUSsQjkAu9iO6lpFI7thzYU4qM9u+JH/+Qx6amuigk0ieDsKm67Zy+qpB5RMynvXXg
         B5PQ==
X-Gm-Message-State: AOAM530MrNLl6+te6wqkDCuxpfUDbaoKBoVbqQsID3JjDSBi1D2BAf92
        /o35oxHzai7fY0oK/wAioVto3g==
X-Google-Smtp-Source: ABdhPJw1/Zw0PiXUNr0YHEyKWifin3wU0VLJk2GV/NHx5C8phUGbmohofQNDpHt8ns5llGlKNSRemw==
X-Received: by 2002:a63:4082:: with SMTP id n124mr1817023pga.340.1611272779489;
        Thu, 21 Jan 2021 15:46:19 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id y16sm6459819pgg.20.2021.01.21.15.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 15:46:16 -0800 (PST)
Date:   Thu, 21 Jan 2021 16:46:14 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 02/16] rpmsg: add RPMsg control API to register service
Message-ID: <20210121234614.GF611676@xps15>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Dec 22, 2020 at 11:57:12AM +0100, Arnaud Pouliquen wrote:
> Add API to register a RPMsg service to the control device.
> The rpmsg_drv_ctrl_info structure links a service to its driver.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_ctrl.c | 57 ++++++++++++++++++++++++++++++++++++++
>  include/linux/rpmsg.h      | 31 +++++++++++++++++++++
>  include/uapi/linux/rpmsg.h | 14 ++++++++++
>  3 files changed, 102 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index 425c3e32ada4..065e2e304019 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -27,6 +27,20 @@ struct rpmsg_ctrl_dev {
>  	struct device dev;
>  };
>  
> +/**
> + * struct rpmsg_ctl_info - control info list node
> + * @ctrl:	control driver info
> + * @node:	list node
> + *
> + * This structure is used by rpmsg_ctl to list the registered drivers services
> + */
> +struct rpmsg_ctl_info {

struct rpmsg_ctrl_info

> +	const struct rpmsg_drv_ctrl_info *ctrl;
> +	struct list_head node;
> +};
> +
> +static LIST_HEAD(rpmsg_drv_list);
> +
>  static DEFINE_IDA(rpmsg_ctrl_ida);
>  static DEFINE_IDA(rpmsg_minor_ida);
>  
> @@ -175,6 +189,49 @@ static struct rpmsg_driver rpmsg_ctrl_driver = {
>  	.remove = rpmsg_ctrl_remove,
>  };
>  
> +/**
> + * rpmsg_ctrl_register_ctl() -register control for the associated service
> + * @ctrl: rpmsg driver information
> + *
> + * This function is called by the rpmsg driver to register a service that will
> + * be exposed to be instantiate by the application.
> + */
> +int  rpmsg_ctrl_register_ctl(const struct rpmsg_drv_ctrl_info *ctrl)

Here an rpmsg_drv is registered with the infrastructure and as such I propose
rpmsg_ctrl_register_driver_ctrl().

> +{
> +	struct rpmsg_ctl_info *drv_info;
> +
> +	drv_info =  kzalloc(sizeof(*drv_info), GFP_KERNEL);
> +	if (!drv_info)
> +		return -ENOMEM;

When this driver is remove all drv_info left in rpmsg_drv_list should be free'd.
We can't count on users to call rpmsg_ctrl_unregister_ctl().

> +
> +	drv_info->ctrl = ctrl;

This has the potential of creating problems - we don't know then the memory
assocaited with @ctrl will disappear on us.

> +
> +	list_add_tail(&drv_info->node, &rpmsg_drv_list);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(rpmsg_ctrl_register_ctl);
> +
> +/**
> + * rpmsg_ctrl_unregister_ctl() -unregister control for the associated service
> + * @ctrl: the rpmsg control information
> + *
> + * This function is called by the rpmsg driver to unregister the associated
> + * service.
> + */
> +void rpmsg_ctrl_unregister_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
> +{
> +	struct rpmsg_ctl_info *drv_info, *tmp;
> +
> +	list_for_each_entry_safe(drv_info, tmp, &rpmsg_drv_list, node) {
> +		if (drv_info->ctrl == ctrl) {
> +			list_del(&drv_info->node);
> +			kfree(drv_info);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(rpmsg_ctrl_unregister_ctl);
> +
>  static int rpmsg_ctrl_init(void)
>  {
>  	int ret;
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index a5db828b2420..5d64704c2346 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -26,6 +26,19 @@ struct rpmsg_endpoint;
>  struct rpmsg_device_ops;
>  struct rpmsg_endpoint_ops;
>  
> +/**
> + * struct rpmsg_drv_ctrl_info - rpmsg ctrl structure
> + * @drv_name:	name of the associated driver
> + * @service:	the associated rpmsg service listed in @rpmsg_services
> + *
> + * This structure is used by rpmsg_ctl to link the endpoint creation to the
> + * service rpmsg driver.
> + */
> +struct rpmsg_drv_ctrl_info {
> +	const char *drv_name;
> +	u32  service;
> +};
> +
>  /**
>   * struct rpmsg_channel_info - channel info representation
>   * @name: name of service
> @@ -315,4 +328,22 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>  	module_driver(__rpmsg_driver, register_rpmsg_driver, \
>  			unregister_rpmsg_driver)
>  
> +#if IS_ENABLED(CONFIG_RPMSG_CTRL)
> +
> +int  rpmsg_ctrl_register_ctl(const struct rpmsg_drv_ctrl_info *ctrl);
> +void rpmsg_ctrl_unregister_ctl(const struct rpmsg_drv_ctrl_info *ctrl);
> +
> +#else
> +
> +static inline int rpmsg_ctrl_register_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
> +{
> +	return 0;
> +}
> +
> +static inline void rpmsg_ctrl_unregister_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
> +{
> +}
> +
> +#endif /* IS_ENABLED(CONFIG_RPMSG_CTRL) */

Shouldn't this be in its own header, something like rpmsg_ctrl.h?

> +
>  #endif /* _LINUX_RPMSG_H */
> diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
> index e14c6dab4223..0b0cb028e0b3 100644
> --- a/include/uapi/linux/rpmsg.h
> +++ b/include/uapi/linux/rpmsg.h
> @@ -9,6 +9,20 @@
>  #include <linux/ioctl.h>
>  #include <linux/types.h>
>  
> +/**
> + * enum rpmsg_services - list of supported RPMsg services
> + *
> + * @RPMSG_RAW_SERVICE: char device RPMSG service
> + * @RPMSG_START_PRIVATE_SERVICES: private services have to be declared after.
> + */
> +enum rpmsg_services {
> +	/* Reserved services */
> +	RPMSG_RAW_SERVICE =  0,
> +
> +	/* Private services */
> +	RPMSG_START_PRIVATE_SERVICES =  1024,

We have plenty of bits in an enum type - I would set this to 4096 just to be on
the safe side.

> +};
> +
>  /**
>   * struct rpmsg_endpoint_info - endpoint info representation
>   * @name: name of service
> -- 
> 2.17.1
> 
