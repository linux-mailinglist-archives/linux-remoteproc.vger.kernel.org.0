Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB3A467004
	for <lists+linux-remoteproc@lfdr.de>; Fri,  3 Dec 2021 03:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245012AbhLCChJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 2 Dec 2021 21:37:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350201AbhLCCgr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Dec 2021 21:36:47 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E71C6C0613B3
        for <linux-remoteproc@vger.kernel.org>; Thu,  2 Dec 2021 18:32:36 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id bk14so3004282oib.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Dec 2021 18:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vNaYqjCjQc904Z13HmAKfcwIkPL725ElEfHMJwuxDWY=;
        b=Dyt3II34OBSHrs9XQOHEEGMlXO2iLvoBQfPWQDnnMEbZKQJY0kMwm3LK+eHqI/tO5q
         mT2hegRHGRkMKTqRxV3/F+WzLRtjyABlNjIxdY3HkkoJm03D2fwbDf2dY/qL8bK4Vay+
         SVa98O1/SR274ng/ONJdWWKzkH0EbYLo8bsvh+GzKMT5eYe84E0rxvUtfiAOcV5Y6Igy
         PFdvDdmNXFbc8+ZbwHw6yGuOOx7WstA2dRg1s8Lb44azj8zleqMFrv8UDzdpefP/M62c
         XC/8piL9wfmvKcoMbCZlODSfNjYtn+DyYFeugMcMHWUq7iAj4kGPrCuMC2XGWo6suUfx
         +rKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vNaYqjCjQc904Z13HmAKfcwIkPL725ElEfHMJwuxDWY=;
        b=7k5lGgqJNrrX1bzgS6wjsSSDbquRKICM+ktlB3+YsXTQyRZ9CXRcsMiCi82HV9/HQN
         bpR6TET40UznVkAdyta0z958nxbu/C6bSvvb6/SKkOT1mRNOABhZltO3QUqDZdZl+r3x
         csKNJUtpVsbajcuU5MOmyOZAmRfn+r9hia8LbNDzW03JA6S3qabHrj+4d8IZWfZ/UU5Z
         mfyQ4SF67bLSks5tqycCN3jGVhLIXFZr1034WuRAblCR3QhNMJUN66h8hmSJq1ABNvGh
         myNQ2wEqQy5OVH/4hV8HFmfl4w25gX2T0viFOH0K+zxFEzE0d/gPs1Ls6sxkbdWZiwqa
         002Q==
X-Gm-Message-State: AOAM532sbQQv8gThgIveOXEZeQjw12tgZ4dLBF+D+9AI9waWtxRx0bS4
        yJJoc3jKHYi1BrBk2ZYpwKruJg==
X-Google-Smtp-Source: ABdhPJzN4WrZ36DnDDdVhdtDPHx1v21wNvqj3q+Bakva89PpDJjiLJnpaDjE1t/84LULA+pbUcrx/Q==
X-Received: by 2002:a05:6808:159a:: with SMTP id t26mr7862306oiw.106.1638498756227;
        Thu, 02 Dec 2021 18:32:36 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s6sm564825ois.3.2021.12.02.18.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 18:32:35 -0800 (PST)
Date:   Thu, 2 Dec 2021 20:32:31 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v7 09/12] rpmsg: char: Add possibility to use default
 endpoint of the rpmsg device.
Message-ID: <YamBv4Sy3Jtdp7Wu@builder.lan>
References: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
 <20211108141937.13016-10-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108141937.13016-10-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 08 Nov 08:19 CST 2021, Arnaud Pouliquen wrote:

> Current implementation create/destroy a new endpoint on each
> rpmsg_eptdev_open/rpmsg_eptdev_release calls.
> 
> For a rpmsg device created by the NS announcement mechanism we need to
> use a unique static endpoint that is the default rpmsg device endpoint
> associated to the channel.
> 
> This patch prepares the introduction of a rpmsg channel device for the
> char device. The rpmsg channel device will require a default endpoint to
> communicate to the remote processor.
> 
> Add the default_ept field in rpmsg_eptdev structure.This pointer
> determines the behavior on rpmsg_eptdev_open and rpmsg_eptdev_release call.
> 
> - If default_ept == NULL:
>   Use the legacy behavior by creating a new endpoint each time
>   rpmsg_eptdev_open is called and release it when rpmsg_eptdev_release
>   is called on /dev/rpmsgX device open/close.
> 
> - If default_ept is set:
>   use the rpmsg device default endpoint for the communication.
> 
> Address the update of _rpmsg_chrdev_eptdev_create in a separate patch for readability.
> 
> Add protection in rpmsg_eptdev_ioctl to prevent to destroy a default endpoint.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 3daf62df69a0..6a01e8e1c111 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -47,6 +47,8 @@ static DEFINE_IDA(rpmsg_minor_ida);
>   * @queue_lock:	synchronization of @queue operations
>   * @queue:	incoming message queue
>   * @readq:	wait object for incoming queue
> + * @default_ept: set to channel default endpoint if the default endpoint should be re-used
> + *              on device open to prevent endpoint address update.
>   */
>  struct rpmsg_eptdev {
>  	struct device dev;
> @@ -57,10 +59,12 @@ struct rpmsg_eptdev {
>  
>  	struct mutex ept_lock;
>  	struct rpmsg_endpoint *ept;
> +	struct rpmsg_endpoint *default_ept;
>  
>  	spinlock_t queue_lock;
>  	struct sk_buff_head queue;
>  	wait_queue_head_t readq;
> +
>  };
>  
>  int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
> @@ -118,7 +122,15 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  
>  	get_device(dev);
>  
> -	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> +	/*
> +	 * If the default_ept is set to true, the rpmsg device default endpoint is used.

default_ept will no longer be "set to true".

Regards,
Bjorn

> +	 * Else a new endpoint is created on open that will be destroyed on release.
> +	 */
> +	if (eptdev->default_ept)
> +		ept = eptdev->default_ept;
> +	else
> +		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> +
>  	if (!ept) {
>  		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
>  		put_device(dev);
> @@ -139,7 +151,8 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
>  	/* Close the endpoint, if it's not already destroyed by the parent */
>  	mutex_lock(&eptdev->ept_lock);
>  	if (eptdev->ept) {
> -		rpmsg_destroy_ept(eptdev->ept);
> +		if (!eptdev->default_ept)
> +			rpmsg_destroy_ept(eptdev->ept);
>  		eptdev->ept = NULL;
>  	}
>  	mutex_unlock(&eptdev->ept_lock);
> @@ -266,6 +279,10 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>  	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
>  		return -EINVAL;
>  
> +	/* Don't allow to destroy a default endpoint. */
> +	if (eptdev->default_ept)
> +		return -EINVAL;
> +
>  	return rpmsg_chrdev_eptdev_destroy(&eptdev->dev, NULL);
>  }
>  
> -- 
> 2.17.1
> 
