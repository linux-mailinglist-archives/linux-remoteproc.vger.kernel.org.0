Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B808359731
	for <lists+linux-remoteproc@lfdr.de>; Fri,  9 Apr 2021 10:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhDIIKK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 9 Apr 2021 04:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbhDIIKK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Apr 2021 04:10:10 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D212CC061761
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Apr 2021 01:09:57 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id h25so3315920pgm.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Apr 2021 01:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GZEKNpc5NkiGkvi6lIHFrkThqi2fqlKkWIV3fYKJyuA=;
        b=gc4UhQTrFpfRpAHfE+rHovxWUmxetzTRDbP0b3VohpspZz4bz9yJsZQ4pQyOHs3C2d
         a709dWDa92NaLpGrJ9DsSOV8nIKRLQ9jk7kLH4DCSaIHD5rmHjCOopn5hOV7kGXF32Cd
         GOebrQFDP9TOBqGJVBXWJ5kfJpI+FISCSP19cIZChRfEtU4fI/Gr0KwllL7dDwxRL/qj
         U/BTDwGc52Kf/fJuKtyxW0J6QyBBP6dUXJDd+F5CJgnx3tLX2OJ8sXFzlPkoMFk+sci0
         j1QqfQAjJ1SweYZ+BuFGN96FLx9ZiDrgNJPyzLuYN4vOAiivnOItRPr064c5E92spjg/
         1VEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GZEKNpc5NkiGkvi6lIHFrkThqi2fqlKkWIV3fYKJyuA=;
        b=h4YNims5gGgHW2LdnQjXtIlu6PxX3lXneNKEAA9/py446DXoVdSHFfSewQR1+T5lBe
         VTXJbzOU5FztESXdZePn4pTPj6ZiJtPEYgEd6zkUqw5HaLvtIbDOE3a6Rv06o0/w0JfJ
         VNR1lipdY1C9nH1VdnW9AyDqsd6LbBrccj2qisyK5C2PcF7ih60QJ8xzwx5JLq8eyCzC
         2o8aaTtF3G9mUwZN4iGgYIBBdpWVNRA74hz7Tbmqsl9VND3i8UpqYUP2v8rwUUoXl8vN
         a0dHnxrYwRmZWSRSn+6ER6gusGhNO0TtLlWPkVqSfrvZ8q90Je+4/aUkokYzgbw7uRU2
         7xDg==
X-Gm-Message-State: AOAM533QE68OFE1klj+gGctlwv0oQSHN5JfdYwvKGAyr73Am4y8s4WYT
        pbsl28Jk1sfc1p7IoehKSxlsyfpqelk6
X-Google-Smtp-Source: ABdhPJwR6Gd26b9J2YYANqvPzzJQy0KaCHFKuzWGlkClWsGSRpcsm/QdRe4aH+p/1u/5v6+z53O3ww==
X-Received: by 2002:a63:3e4b:: with SMTP id l72mr11801928pga.203.1617955797234;
        Fri, 09 Apr 2021 01:09:57 -0700 (PDT)
Received: from work ([103.77.37.131])
        by smtp.gmail.com with ESMTPSA id q9sm1805976pfn.19.2021.04.09.01.09.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 01:09:56 -0700 (PDT)
Date:   Fri, 9 Apr 2021 13:39:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Deepak Kumar Singh <deesin@qti.qualcomm.com>
Cc:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V2 2/2] soc: qcom: aoss: Add debugfs entry
Message-ID: <20210409080952.GA17381@work>
References: <1617943188-23278-1-git-send-email-deesin@qti.qualcomm.com>
 <1617943188-23278-3-git-send-email-deesin@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617943188-23278-3-git-send-email-deesin@qti.qualcomm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Apr 09, 2021 at 10:09:48AM +0530, Deepak Kumar Singh wrote:
> It can be useful to control the different power states of various
> parts of hardware for device testing. Add a debugfs node for qmp so
> messages can be sent to aoss for debugging and testing purposes.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---
>  drivers/soc/qcom/qcom_aoss.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index 0e397a7..6057bbe 100644
> --- a/drivers/soc/qcom/qcom_aoss.c
> +++ b/drivers/soc/qcom/qcom_aoss.c
> @@ -4,6 +4,7 @@
>   */
>  #include <dt-bindings/power/qcom-aoss-qmp.h>
>  #include <linux/clk-provider.h>
> +#include <linux/debugfs.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/mailbox_client.h>
> @@ -88,6 +89,9 @@ struct qmp {
>  	struct clk_hw qdss_clk;
>  	struct genpd_onecell_data pd_data;
>  	struct qmp_cooling_device *cooling_devs;
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	struct dentry *debugfs_file;
> +#endif /* CONFIG_DEBUG_FS */
>  };
>  
>  struct qmp_pd {
> @@ -560,6 +564,34 @@ void qmp_put(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL(qmp_put);
>  
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static ssize_t aoss_dbg_write(struct file *file, const char __user *userstr,
> +			      size_t len, loff_t *pos)
> +{
> +	struct qmp *qmp = file->private_data;
> +	char buf[QMP_MSG_LEN] = {};
> +	int ret;
> +
> +	if (!len || len >= QMP_MSG_LEN)
> +		return -EINVAL;
> +
> +	ret  = copy_from_user(buf, userstr, len);
> +	if (ret) {
> +		dev_err(qmp->dev, "copy from user failed, ret:%d\n", ret);

Does the userspace need to know how many bytes were not copied? I don't
think this is a useful information. So you could remove this err print.

With that,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> +		return -EFAULT;
> +	}
> +
> +	ret = qmp_send(qmp, buf, QMP_MSG_LEN);
> +
> +	return ret ? ret : len;
> +}
> +
> +static const struct file_operations aoss_dbg_fops = {
> +	.open = simple_open,
> +	.write = aoss_dbg_write,
> +};
> +#endif /* CONFIG_DEBUG_FS */
> +
>  static int qmp_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
> @@ -616,6 +648,11 @@ static int qmp_probe(struct platform_device *pdev)
>  
>  	atomic_set(&qmp->orphan, 0);
>  
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	qmp->debugfs_file = debugfs_create_file("aoss_send_message", 0220, NULL,
> +						qmp, &aoss_dbg_fops);
> +#endif /* CONFIG_DEBUG_FS */
> +
>  	return 0;
>  
>  err_remove_qdss_clk:
> @@ -632,6 +669,10 @@ static int qmp_remove(struct platform_device *pdev)
>  {
>  	struct qmp *qmp = platform_get_drvdata(pdev);
>  
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	debugfs_remove(qmp->debugfs_file);
> +#endif /* CONFIG_DEBUG_FS */
> +
>  	qmp_qdss_clk_remove(qmp);
>  	qmp_pd_remove(qmp);
>  	qmp_cooling_devices_remove(qmp);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
