Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35BA21DA49B
	for <lists+linux-remoteproc@lfdr.de>; Wed, 20 May 2020 00:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgESWeA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 19 May 2020 18:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgESWd7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 May 2020 18:33:59 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9371C061A0F
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2020 15:33:57 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id q16so483282plr.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2020 15:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=d2S5rKQKMJ+vUpUVcLBLOVq44Yhp+me9A/Z4UO/jFR0=;
        b=S9LyVVx9SQFnKBLDQjVRgdFLhlX48ZY8d19GgfrpPk5bCpo8aPrpT7R4eRzoYDCRy1
         Fp8azzOWXKRy/9rnYcM1V6PmwOnfT1k66f4T8u7RUUc/azX5EKoxBAqy2QO4Vj7KotQq
         yCQVhYBKCEXG6UFvS2T64qy906bQEeWnOdjsjr01wC4rvnfCRlkU6tbj6lOUMd7HXphV
         h1RJs0Ka3QTQ8B5ynATChDUdQ2beRpSHDx4j25Rdz5hNC5C7Vof4ahgB+vjjjP/xfG1w
         5lIhnr6ugGrN/awsjHF1UcQOPeMjKQHYBsXIhJ0XccQpQXrRM5HApcdX0u/rvnQ155/+
         Bddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d2S5rKQKMJ+vUpUVcLBLOVq44Yhp+me9A/Z4UO/jFR0=;
        b=aJLc92/eflPV7oDC5iFQRvdzWylesvKgHobYbOwxdLYDMX4fhy8urZjQ7DyL8E+sXu
         oVe0LbJfrifg71IHApnDkkmCB97FxIZUWHgg4WrDKkp4APyiwWxfVEVj8dcSY4RM62g7
         W9LwEsiqQ/oaRC6Jz8Kg5E7zVw8q1E/Vnw919YmolTownLXKyRZ31MzvS55VhopXa9yT
         xGQPrnGi8DB4F036xXZ0GQOjoJXvgVm5duOqLQrGMfSPWEEoGUaxQZ32iIPQ1Q+USBFx
         x5YOO136OINK2dJHi9C5nP59kT4W5PHqOvSvNfxUcOSDlDZhReyOYbsoa1bUsRdLX11h
         yRcg==
X-Gm-Message-State: AOAM531YoWesaFRBp/dbH1clMUNZwqHc/ZD2gU4uGbG1lwDVvb8UHVa9
        tdigRlj4ry5+yoFRoQD+sCVMDQ==
X-Google-Smtp-Source: ABdhPJxuVLFOqG6CZpwV4kGE4gTI04IoXATiK/wOjORPZUwTl15EJyM0Ho5VHx+Qcedi64VEt1G0Qw==
X-Received: by 2002:a17:90a:648a:: with SMTP id h10mr1904527pjj.69.1589927637197;
        Tue, 19 May 2020 15:33:57 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c21sm397057pfo.131.2020.05.19.15.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 15:33:56 -0700 (PDT)
Date:   Tue, 19 May 2020 16:33:54 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 3/4] rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
Message-ID: <20200519223354.GC26832@xps15>
References: <1589346671-15226-1-git-send-email-aneela@codeaurora.org>
 <1589346671-15226-4-git-send-email-aneela@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589346671-15226-4-git-send-email-aneela@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, May 13, 2020 at 10:41:10AM +0530, Arun Kumar Neelakantam wrote:
> Add TICOMGET and TIOCMSET ioctl support for rpmsg char device nodes

s/TICOMGET/TIOCMGET

> to get/set the low level transport signals.
> 
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> ---
>  drivers/rpmsg/rpmsg_char.c | 53 +++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 50 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 4bbbacd..e2f92f3 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> + * Copyright (c) 2018, The Linux Foundation.
>   * Copyright (c) 2016, Linaro Ltd.
>   * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
>   * Copyright (c) 2012, PetaLogix
> @@ -19,6 +20,7 @@
>  #include <linux/rpmsg.h>
>  #include <linux/skbuff.h>
>  #include <linux/slab.h>
> +#include <linux/termios.h>
>  #include <linux/uaccess.h>
>  #include <uapi/linux/rpmsg.h>
>  
> @@ -269,15 +271,60 @@ static __poll_t rpmsg_eptdev_poll(struct file *filp, poll_table *wait)
>  	return mask;
>  }
>  
> +static int rpmsg_eptdev_tiocmset(struct file *fp, unsigned int cmd,
> +				 int __user *arg)
> +{
> +	struct rpmsg_eptdev *eptdev = fp->private_data;
> +	u32 set, clear, val;
> +	int ret;
> +
> +	ret = get_user(val, arg);
> +	if (ret)
> +		return ret;
> +	set = clear = 0;
> +	switch (cmd) {
> +	case TIOCMBIS:
> +		set = val;
> +		break;
> +	case TIOCMBIC:
> +		clear = val;
> +		break;
> +	case TIOCMSET:
> +		set = val;
> +		clear = ~val;
> +		break;
> +	}
> +
> +	set &= TIOCM_DTR | TIOCM_RTS | TIOCM_CD | TIOCM_RI;
> +	clear &= TIOCM_DTR | TIOCM_RTS | TIOCM_CD | TIOCM_RI;
> +
> +	return rpmsg_set_signals(eptdev->ept, set, clear);
> +}
> +
>  static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>  			       unsigned long arg)
>  {
>  	struct rpmsg_eptdev *eptdev = fp->private_data;
> +	int ret;
>  
> -	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
> -		return -EINVAL;
> +	switch (cmd) {
> +	case TIOCMGET:
> +		ret = rpmsg_get_signals(eptdev->ept);
> +		if (ret >= 0)
> +			ret = put_user(ret, (int __user *)arg);
> +		break;
> +	case TIOCMSET:
> +	case TIOCMBIS:
> +	case TIOCMBIC:
> +		ret = rpmsg_eptdev_tiocmset(fp, cmd, (int __user *)arg);
> +		break;
> +	case RPMSG_DESTROY_EPT_IOCTL:
> +		ret = rpmsg_eptdev_destroy(&eptdev->dev, NULL);
> +	default:
> +		ret = -EINVAL;
> +	}
>  
> -	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
> +	return ret;
>  }
>  
>  static const struct file_operations rpmsg_eptdev_fops = {
> -- 
> 2.7.4
