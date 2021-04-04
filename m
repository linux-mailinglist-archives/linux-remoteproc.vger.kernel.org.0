Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD4F3538F4
	for <lists+linux-remoteproc@lfdr.de>; Sun,  4 Apr 2021 18:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbhDDQ75 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sun, 4 Apr 2021 12:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbhDDQ74 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 4 Apr 2021 12:59:56 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D828C0613E6
        for <linux-remoteproc@vger.kernel.org>; Sun,  4 Apr 2021 09:59:52 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso9485133otp.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 04 Apr 2021 09:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hiTjEIXnFtxjVW2OYzhXcq2+uKAg/SMDNbyy/FBgm1A=;
        b=ak2De3We9oa2zeT2NhySjCdqaW5U7HzWoB4gNPMOD6Vu3Vxqq68yr7hxDGUB9sQCDH
         lLkUIbQmu8MRJjTwNhTFfF3vPL8RrtDlitX9s/Jocw/bNVKhEWX5x+D4WWqa0b/g0jF9
         A17NnPtQIFCjy3Ktmr7ni/9Sv2eKOCblHTcYKS/ylUEfSoHkfl2aMWvyvkMJP+2nl85N
         OghiDwD45edBXGR2PVxgRjBjtfkapyGXtKZ+HXVrXbtmFcXhbuRC5yAb5ZaX758kcCf5
         i5UineOhy9V2svPssvdPSH78bXSV5Uov6ZqcpGOphA+QSqnWY3i2MaI9mjO5e7q2iqhi
         szoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hiTjEIXnFtxjVW2OYzhXcq2+uKAg/SMDNbyy/FBgm1A=;
        b=atefwcmcS84jVVzREf/OKMws29opd7rtG+eEffN6HB0ITT0tAa1CP8fF9id+x/3EsA
         UfzkIbb/u4JrhZ1mn94qDddpSDNJm4196Mpd0oLY72FgH92K8mgLCUV53TZJxDN1o3sw
         vnwAk1EE/NBGjguzYV71szXr+L2Nzt7xXBwu6uHYF3i9WPb0Yvy3gMpr4aewxEZqlEoJ
         Sj7LFgQRYHJVbLVRAX6hOgAdLovyhKimfHF+26wq7uJUCrKuOjg5pmpTNLG8ZdFmaXLq
         IUCONSydctPSklb6cCgppgFvHkj22mYE5O7YSDfEq6qx4ZyCcBybalXFD4lk3VYDLktQ
         jMCA==
X-Gm-Message-State: AOAM530ypfVnO8lKIlVOv7RsteodCI67gwETuRU9jgWDP4JJPS2uOPmu
        FDEF9pFE+0oA63thUeN+bi5H+A==
X-Google-Smtp-Source: ABdhPJwTgTvn9zUeRbv3NxxhEK4AYYUs3dcMkqfaR3Bn1JYFmZ0ILkHe1gCd485jcEn73OOAOBshFA==
X-Received: by 2002:a9d:7f8a:: with SMTP id t10mr18726017otp.239.1617555591660;
        Sun, 04 Apr 2021 09:59:51 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m129sm2689059oif.34.2021.04.04.09.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 09:59:51 -0700 (PDT)
Date:   Sun, 4 Apr 2021 11:59:49 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     clew@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V1 2/2] soc: qcom: aoss: Add debugfs entry
Message-ID: <YGnwhSYxHMvmxBRS@builder.lan>
References: <1617344238-12137-1-git-send-email-deesin@codeaurora.org>
 <1617344238-12137-3-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617344238-12137-3-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 02 Apr 01:17 CDT 2021, Deepak Kumar Singh wrote:

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
> index 5c643f0..1789880 100644
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
> @@ -86,6 +87,9 @@ struct qmp {
>  	struct clk_hw qdss_clk;
>  	struct genpd_onecell_data pd_data;
>  	struct qmp_cooling_device *cooling_devs;
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	struct dentry *debugfs_file;
> +#endif /* CONFIG_DEBUG_FS */
>  };
>  
>  struct qmp_pd {
> @@ -549,6 +553,34 @@ struct qmp *qmp_get(struct device *dev)
>  }
>  EXPORT_SYMBOL(qmp_get);
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
> +		return len;

If len >= QMP_MSG_LEN we shouldn't lie to the caller and say that all
went well, better return -EINVAL in this case.

> +
> +	ret  = copy_from_user(buf, userstr, len);
> +	if (ret) {
> +		dev_err(qmp->dev, "copy from user failed, ret:%d\n", ret);
> +		return len;

		return -EFAULT;

And you don't have to print here.

The rest looks good.

Regards,
Bjorn

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
> @@ -603,6 +635,11 @@ static int qmp_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, qmp);
>  
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	qmp->debugfs_file = debugfs_create_file("aoss_send_message", 0220, NULL,
> +						qmp, &aoss_dbg_fops);
> +#endif /* CONFIG_DEBUG_FS */
> +
>  	return 0;
>  
>  err_remove_qdss_clk:
> @@ -619,6 +656,10 @@ static int qmp_remove(struct platform_device *pdev)
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
