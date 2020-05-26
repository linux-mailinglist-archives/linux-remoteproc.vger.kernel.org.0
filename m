Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C101D2185
	for <lists+linux-remoteproc@lfdr.de>; Wed, 13 May 2020 23:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729819AbgEMV4N (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 13 May 2020 17:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729487AbgEMV4M (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 May 2020 17:56:12 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A42C061A0F
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 14:56:12 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t9so11692933pjw.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 14:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=URXKt/CtJiUnLhAXRhzn7WHXaaovZqdso8oMCz+GR2c=;
        b=zgg3uSPYjx1Fq9SF/NJZDBOu6PaZKWswvNlnYpfhfyOpMHs9QgxJblQ9SHH8w4SVTm
         U/j8SreK901TGCI8VLZe+cGqfFACPgDBgsFNopQ6IwqhF0IGJlDwWt28aZCXIRLHhV2x
         vGCe2fw3s0+OSJ931/VrF+xGe/D1G4Mu+Q3175i9r/udCjesuDuaEWCHLlw4srYQ47+p
         wQodfH6T46WwVYrSeeva9WEM7EAc8UE64FUDcZ5lurlWEXPtrB5JiLHgSI1uOj7xhpoR
         zZalj0FxzE0WLn62TQJhBirmicHXekBH1wLvNpHuHHRl8xSfazqCZmDTTVBbex0zdZlN
         pr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=URXKt/CtJiUnLhAXRhzn7WHXaaovZqdso8oMCz+GR2c=;
        b=XmreC4lbqjVH280JE8hhBDdUM1ovec0jJe1OYyOM6Wg8VwoCW+znFp5X4yPIeZ3mfl
         hSjYhWJtr1tv9waYbOnk2Z8gIkXEPN6B122Y/7f3iDl7lXqeQ0jXoAYBnYv0ZT6BIcq9
         5bYcN8xj9gkSDGhpcDb00F08U0w02wbCuegVRLyWuq2C2+jJ9MAkPtG3YO+TZiao8Ib8
         h+BemMkVRSleXVubdDZS+gFkvyBgG9Qh86GcUNXKRfx0/Yh12cOcg44hcAgmO+LyTBWg
         /b9biRczQkKRYynNW4T/S5s0rGDhw+NBsux87syW4Y+gyIjiqXt50pkrQGeL0EhaH3l6
         yQ0Q==
X-Gm-Message-State: AGi0PuYqe1BMmhBfBdf6m9z8V9DGG/NPVBXsXraH+5d4X0+kTP4OwGom
        MbtjpuWnWA7gIAdrQt3xmEYftdsE01Q=
X-Google-Smtp-Source: APiQypLfZxmnarSDfauVRkIFplhL7r6EsFhDlKlDgtFu9R1IGXvtHs2lg5ugQzGaB0VBgM7OJ3kYkg==
X-Received: by 2002:a17:90a:d3cc:: with SMTP id d12mr37699942pjw.158.1589406972131;
        Wed, 13 May 2020 14:56:12 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b24sm475244pfi.4.2020.05.13.14.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 14:56:11 -0700 (PDT)
Date:   Wed, 13 May 2020 15:56:09 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH V5 3/5] rpmsg: glink: Add support for rpmsg glink chrdev
Message-ID: <20200513215609.GB8328@xps15>
References: <1589346606-15046-1-git-send-email-aneela@codeaurora.org>
 <1589346606-15046-4-git-send-email-aneela@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589346606-15046-4-git-send-email-aneela@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, May 13, 2020 at 10:40:04AM +0530, Arun Kumar Neelakantam wrote:
> From: Chris Lew <clew@codeaurora.org>
> 
> RPMSG provides a char device interface to userspace. Probe the rpmsg
> chrdev channel to enable the rpmsg_ctrl device creation on glink
> transports.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 40 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 604f11f..3a7f87c 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1178,7 +1178,7 @@ static int qcom_glink_announce_create(struct rpmsg_device *rpdev)
>  	__be32 *val = defaults;
>  	int size;
>  
> -	if (glink->intentless)
> +	if (glink->intentless || !completion_done(&channel->open_ack))

Please move this to patch 01.

>  		return 0;
>  
>  	prop = of_find_property(np, "qcom,intents", NULL);
> @@ -1574,6 +1574,40 @@ static void qcom_glink_cancel_rx_work(struct qcom_glink *glink)
>  		kfree(dcmd);
>  }
>  
> +static void qcom_glink_device_release(struct device *dev)
> +{
> +	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> +	struct glink_channel *channel = to_glink_channel(rpdev->ept);
> +
> +	/* Release qcom_glink_alloc_channel() reference */
> +	kref_put(&channel->refcount, qcom_glink_channel_release);
> +	kfree(rpdev);
> +}
> +
> +static int qcom_glink_create_chrdev(struct qcom_glink *glink)
> +{
> +	struct rpmsg_device *rpdev;
> +	struct glink_channel *channel;
> +
> +	rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
> +	if (!rpdev)
> +		return -ENOMEM;
> +
> +	channel = qcom_glink_alloc_channel(glink, "rpmsg_chrdev");
> +	if (IS_ERR(channel)) {
> +		kfree(rpdev);
> +		return PTR_ERR(channel);
> +	}
> +	channel->rpdev = rpdev;
> +
> +	rpdev->ept = &channel->ept;
> +	rpdev->ops = &glink_device_ops;
> +	rpdev->dev.parent = glink->dev;
> +	rpdev->dev.release = qcom_glink_device_release;
> +
> +	return rpmsg_chrdev_register_device(rpdev);
> +}
> +
>  struct qcom_glink *qcom_glink_native_probe(struct device *dev,
>  					   unsigned long features,
>  					   struct qcom_glink_pipe *rx,
> @@ -1633,6 +1667,10 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> +	ret = qcom_glink_create_chrdev(glink);
> +	if (ret)
> +		dev_err(glink->dev, "failed to register chrdev\n");
> +
>  	return glink;
>  }
>  EXPORT_SYMBOL_GPL(qcom_glink_native_probe);
> -- 
> 2.7.4
