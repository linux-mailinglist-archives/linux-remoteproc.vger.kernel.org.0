Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A3F223287
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Jul 2020 06:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgGQEnh (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 17 Jul 2020 00:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgGQEnh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Jul 2020 00:43:37 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC246C061755
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Jul 2020 21:43:36 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id l63so6073953pge.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Jul 2020 21:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZS96AHkKsIz+9ewp6Tb9M00I6PYyw+DXgHrEqe3EDMs=;
        b=hDvG+flSpEjtZ0hG1cnQW3jGKAhn8mwFZiG0ojsB0dQEdpJqbXl4iOSLPiHSNdNkC+
         GCOsUMWjS4r8SVqtpZdiFxutX/KyypO49Sl0mqtDXHFHdVt+Jq/e86vnqk/iQKUPuzlW
         q0lC6waAFjEUpQ9xHUe+qCQOW4gZ1frwLgn3VB9vQ5/JC3bmRj9RsfYbdbhz4/cVvuBC
         nrdLaBls9h+RM4ZWqgmvUw77DZx35UtdnmLVhpj21dOblO7LwVDnPZS4u0DzPexg4J9x
         KMprlL7LNMBUmWctKrJJlIpAtZor1VL/yV3MEV48nErMbjSamigOUZuftNPQKMRPzllR
         9yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZS96AHkKsIz+9ewp6Tb9M00I6PYyw+DXgHrEqe3EDMs=;
        b=LAZqOLXER6ZEr/61EAvz3fuO03ukGZTXdoSLjievTqllxQNE930LsLHYK61PZZcnbi
         AvL0ZC18117r2H/0mLlVQRtOnwxCETM+v+UWivTfVjx1kbQ6tETU+c4ehPc6zdVzOcKj
         gjCKQgFyEPQRUhCL+OoKHbWDYwrvZI2c3waiRdcee/zB3f6+cUJJohKnWX6v/lN+xSF/
         d7RYVNxZljAB7g0vmqa7mEurH4NaeHbVNxja5vvmNLHT2KnJzppSgBb9yt03zBHZVUeK
         /T8jGPJwVj/pIOB8/01/n4pxxZcjEFY3G2SLaQuP6fd2xqCjOM1loWCWBRkIueiv/kdi
         pCwA==
X-Gm-Message-State: AOAM532/4Q+K3PfBrp+dv502p6E7cwNzIlu27bC4WKojl7plULW/h0cP
        CngthhdiQHYxs2PNK/6Sz2ueuw==
X-Google-Smtp-Source: ABdhPJw3GVGfOpBPzeAuOqVTdeOgtS4JxzEmnM5OOQRp8CUOC23j8zfe/tH9Tj5+kFYuIQ3SzpYdQQ==
X-Received: by 2002:a62:e217:: with SMTP id a23mr6467599pfi.257.1594961016203;
        Thu, 16 Jul 2020 21:43:36 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j16sm6384044pgb.33.2020.07.16.21.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 21:43:35 -0700 (PDT)
Date:   Thu, 16 Jul 2020 21:41:33 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com
Subject: Re: [PATCH 1/3] remoteproc: qcom_q6v5_mss: Add modem debug policy
 support
Message-ID: <20200717044133.GB2922385@builder.lan>
References: <20200716123630.21892-1-sibis@codeaurora.org>
 <20200716123630.21892-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716123630.21892-2-sibis@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 16 Jul 05:36 PDT 2020, Sibi Sankar wrote:

> Add modem debug policy support which will enable coredumps and live
> debug support when the msadp firmware is present on secure devices.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 13c6d5a72a831..95e21ed607cb9 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -187,6 +187,7 @@ struct q6v5 {
>  	phys_addr_t mba_phys;
>  	void *mba_region;
>  	size_t mba_size;
> +	size_t dp_size;
>  
>  	phys_addr_t mpss_phys;
>  	phys_addr_t mpss_reloc;
> @@ -406,6 +407,13 @@ static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
>  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct q6v5 *qproc = rproc->priv;
> +	const struct firmware *dp_fw;
> +
> +	if (!request_firmware(&dp_fw, "msadp", qproc->dev) && fw->size <= SZ_1M) {

Can we change this to a request_firmware_direct() to avoid the fact that
as written here devices lacking this file will pause here for 60 seconds
waiting for userspace to assist in loading it (which at least none of my
systems do).

I also think that while it's nice to check that fw->size <= SZ_1M, to
avoid overwriting the tail of it, you should check that SZ_1M +
dp_fw->size < mba_size. To ensure that the memcpy doesn't go out of
bounds.

> +		memcpy(qproc->mba_region + SZ_1M, dp_fw->data, dp_fw->size);
> +		qproc->dp_size = dp_fw->size;
> +		release_firmware(dp_fw);
> +	}
>  
>  	memcpy(qproc->mba_region, fw->data, fw->size);
>  
> @@ -896,6 +904,10 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  	}
>  
>  	writel(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
> +	if (qproc->dp_size) {
> +		writel(qproc->mba_phys + SZ_1M, qproc->rmb_base + RMB_PMI_CODE_START_REG);
> +		writel(qproc->dp_size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> +	}
>  
>  	ret = q6v5proc_reset(qproc);
>  	if (ret)
> @@ -1258,7 +1270,8 @@ static int q6v5_start(struct rproc *rproc)
>  	if (ret)
>  		return ret;
>  
> -	dev_info(qproc->dev, "MBA booted, loading mpss\n");
> +	dev_info(qproc->dev, "MBA booted, debug policy %s, loading mpss\n",
> +		 qproc->dp_size ? "enabled" : "disabled");

"MBA booted with%s debug policy, loading mpss\n", qproc->dp_size ? "" : "out"

Please.

Regards,
Bjorn

>  
>  	ret = q6v5_mpss_load(qproc);
>  	if (ret)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
