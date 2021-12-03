Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF9D4466F6A
	for <lists+linux-remoteproc@lfdr.de>; Fri,  3 Dec 2021 02:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbhLCCBp (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 2 Dec 2021 21:01:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbhLCCBo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Dec 2021 21:01:44 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8021CC06174A
        for <linux-remoteproc@vger.kernel.org>; Thu,  2 Dec 2021 17:58:21 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso2248146otf.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Dec 2021 17:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=smb1r2XfUg8MLMMqcLmw+mdb8mXA88P8HeDQMpSaQXQ=;
        b=mW8Rv4d2wGlgGwsDI0ch3/RY0Wx//Sz5OSXjuV8KTLtxaXMX3yJhSuWICAf0tiPXXP
         mhRyWyrnEOMmQAY5PmQIqRnmCi34S3AaT9pOatU6pFWx5R7Wa0S/9NhcaTvz7duM+vDs
         nA3AZGMHH96/GUTHGFwj/UwgokoPy3sm9eajYvMSDLi76bO3DuIP3JEkHXGsNVf8TLZq
         XlYLUSN2AJtWdRlwJXlaFcxgmioaNoOPZ1mXKifsIwkHmnHKW9fvwOqRcihaSsqlskqa
         tXlOxgjfiasJv+t0NcHn7ZdD8obF5EDzesBHZzo1dJOInzClaQ2eOrr1OX6u2vpynfDd
         d6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=smb1r2XfUg8MLMMqcLmw+mdb8mXA88P8HeDQMpSaQXQ=;
        b=emFeWVDFBUxTh1pa2wN4MiLXrLtCbzVlV9zhJcP2vmJD8q2EAjvrsn+6ke+eSIfLcd
         wXiNieuq6NYaJ1wgLbv5e1drDlXt4iV2xfbgEcIpSYJ6MEwZnAtj7vjIqWbLXtNHN76s
         Dbc88H7ZKPDgbJAdbl9YgGqgKvEBIFXD+oMEE1jp5UQNDHeUdAJu0jv+T4xseJXxKiN0
         jXXdWxAc+LEVhsmuBl09h65r70Axqw59vFraK7y8LgKs8gPrQvwT+fIXYAx7A0ucNIZJ
         OW8w67sGWnD26O8ZotX6l/LDadsd06qL4IJO7DDYa341zPqAwfW27CMi343ikFTB3gwP
         1G/g==
X-Gm-Message-State: AOAM533ZCMzEsttUcyfSHgCpiqNUjUDA7/GiFGRqnu/ELyJsH1b20olW
        qVMi3Jnt7MFfttqpWZ8gN0sl4A==
X-Google-Smtp-Source: ABdhPJx5tNIkP0zfsreHzBezhGIR/QP82WXkGRhO9QXAzHMcFilI+uffVEm1od0Li4r41vInbereeg==
X-Received: by 2002:a05:6830:22cf:: with SMTP id q15mr14047768otc.255.1638496700813;
        Thu, 02 Dec 2021 17:58:20 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t18sm376710ott.2.2021.12.02.17.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 17:58:19 -0800 (PST)
Date:   Thu, 2 Dec 2021 19:58:14 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v7 12/12] rpmsg: core: send a ns announcement when a
 default endpoint is created
Message-ID: <Yal5tplvcqDjEeTs@builder.lan>
References: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
 <20211108141937.13016-13-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108141937.13016-13-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 08 Nov 08:19 CST 2021, Arnaud Pouliquen wrote:

> When a channel is created by user space application with the
> RPMSG_CREATE_DEV_IOCTL controls, a ns announcement has to be sent
> (depending on backend) to inform the remote side that a new service
> is available.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_core.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index bdcde57c22f6..63227279397d 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -145,6 +145,9 @@ EXPORT_SYMBOL(rpmsg_destroy_ept);
>   *
>   * This function returns a pointer to an endpoint created and assigned as the default
>   * endpoint of the rpmsg device.
> + * If we need to, we also announce about this channel to the remote
> + * processor. This announcement is needed in case the driver is exposing an rpmsg service that has
> + * been created locally.
>   *
>   * Drivers should provide their @rpdev channel (so the new endpoint would belong
>   * to the same remote processor their channel belongs to), an rx callback
> @@ -161,6 +164,7 @@ struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
>  						struct rpmsg_channel_info chinfo)
>  {
>  	struct rpmsg_endpoint *ept;
> +	int err = 0;
>  
>  	if (WARN_ON(!rpdev))
>  		return NULL;
> @@ -183,6 +187,16 @@ struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
>  	rpdev->ept = ept;
>  	rpdev->src = ept->addr;
>  
> +	if (rpdev->ops->announce_create)
> +		err = rpdev->ops->announce_create(rpdev);
> +	if (err) {
> +		rpmsg_destroy_ept(ept);
> +		rpdev->ept = NULL;
> +		rpdev->src = RPMSG_ADDR_ANY;
> +
> +		return NULL;
> +	}
> +

Unless I'm missing something I think this would be cleaner as:

	if (rpdev->ops->announce_create) {
		err = rpdev->ops->announce_create(rpdev);
		if (err) {
			...;
		}
	}

which also implies that you don't need to zero-initialize err.

Other than that, this looks good and follows what would happen in
rpmsg_dev_probe()...


PS. In rpmsg_dev_probe(), if rpdrv->probe() succeeds but announce_create
returns a failure we will exit the function with an error, which will
just fail really_probe() and we won't ever clean up the device (i.e.
call rpdev->remove()).

Regards,
Bjorn

>  	return ept;
>  }
>  EXPORT_SYMBOL(rpmsg_create_default_ept);
> -- 
> 2.17.1
> 
