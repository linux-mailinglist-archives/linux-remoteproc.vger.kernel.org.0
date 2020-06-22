Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020E020308E
	for <lists+linux-remoteproc@lfdr.de>; Mon, 22 Jun 2020 09:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731362AbgFVHVg (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 22 Jun 2020 03:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726850AbgFVHVg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Jun 2020 03:21:36 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF557C061794
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 00:21:35 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id e5so12246136ote.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 00:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vwl6qS4yPQKOHaGGWLpDtmj9DBSRzOFDIA5kXBhpOwg=;
        b=bHV3MpZjVsKCj7ZFCGAaCW7pzZm+lcPv0lRbgwGZnvnbakQkziiM/YhEILoxlpb/Qc
         jrp8UCvVe3nISscgrH+SN7K77872MVVSehQWSq7KN4gfUezrxODTop8l4HzJj+46kaVx
         yWTyx8tFyvYSxIQA3S/MCOkNye3CB2pe3rGldlTb0Oizhjzhxofs6Gs3PodrfHaRPJxp
         nsxFQ4YOBhJEh5MDp6zZ35otAZ2Bze7LLxbZkACmtxBDfV3JTFM4LzCsrgaHsdpDsq7g
         V+LafUZ7rA2FBOEEuKtY0hHIWIzo06pNYvKxu3P1AVhR8DX0tdB0kcEhDglrCkaNEubq
         WNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vwl6qS4yPQKOHaGGWLpDtmj9DBSRzOFDIA5kXBhpOwg=;
        b=d9vXedv9UXkP8PJS6Cafe/QbX0j1J3NpIeaCnHxfCePNU/6UpxYpU8Wp8kJkDTMXTH
         gihVkab/gsRPfwc2miLVgg9PMScv2MthRs9s27AhBTM3vhe9B0wXMdqEPO3rb5J5CLdp
         wLUDGr1ydbyxg0lVFfNM07MzSVaXLOVT96ZeJ5f3mm0CBhqlXh63QAT5e4baUnA0qi85
         4d2OoF1P0vlAOIoU8fOlk5lU1vLk6BJ/1axc34GvFiSThTTQkgo/iXi3Wdrre7G2DRk/
         Tj4N7nI5GSOEe7lKRHUhcbFZ5URqU5DfUIhroYW+uxKBX/ldrvEgH6HoI9En2l7sHdke
         odbA==
X-Gm-Message-State: AOAM533JkBijS8K+VbX8vvwWSCxX9+8XKfNpR9kqICMNdzDw83Tnqydj
        VVXJqnhPsWetalXM44387nRCBg==
X-Google-Smtp-Source: ABdhPJx/P9N4iexcz+KrvYw7rX1vvCOD6LLcpZJYHZAEvNfPuZQsSrDqjwUpikfbs2KUfP2zi2GSjg==
X-Received: by 2002:a9d:104:: with SMTP id 4mr11665154otu.124.1592810495260;
        Mon, 22 Jun 2020 00:21:35 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x131sm713446ooa.31.2020.06.22.00.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:21:34 -0700 (PDT)
Date:   Mon, 22 Jun 2020 00:18:49 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, s-anna@ti.com
Subject: Re: [PATCH v4 4/9] remoteproc: Introducing function rproc_actuate()
Message-ID: <20200622071849.GF149351@builder.lan>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
 <20200601175139.22097-5-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200601175139.22097-5-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 01 Jun 10:51 PDT 2020, Mathieu Poirier wrote:

> Introduce function rproc_actuate() that provides the same
> functionatlity as rproc_fw_boot(), but without the steps that
> involve interaction with the firmware image.  That way we can
> deal with scenarios where the remoteproc core is attaching
> to a remote processor that has already been started by another
> entity.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_core.c | 68 +++++++++++++++++++++++++++-
>  1 file changed, 67 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 0b323f6b554b..c70fa0372d07 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1370,7 +1370,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
>  
> -static int __maybe_unused rproc_attach(struct rproc *rproc)
> +static int rproc_attach(struct rproc *rproc)
>  {
>  	struct device *dev = &rproc->dev;
>  	int ret;
> @@ -1499,6 +1499,72 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
>  
> +/*
> + * Attach to remote processor - similar to rproc_fw_boot() but without
> + * the steps that deal with the firmware image.
> + */
> +static int __maybe_unused rproc_actuate(struct rproc *rproc)
> +{
> +	struct device *dev = &rproc->dev;
> +	int ret;
> +
> +	/* Tell the PM runtime core we need to keep this device powered */
> +	ret = pm_runtime_get_sync(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "pm_runtime_get_sync failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * if enabling an IOMMU isn't relevant for this rproc, this is
> +	 * just a nop
> +	 */
> +	ret = rproc_enable_iommu(rproc);
> +	if (ret) {
> +		dev_err(dev, "can't enable iommu: %d\n", ret);
> +		goto put_pm_runtime;
> +	}
> +
> +	/* reset max_notifyid */
> +	rproc->max_notifyid = -1;
> +
> +	/* reset handled vdev */
> +	rproc->nb_vdev = 0;
> +
> +	/*
> +	 * Handle firmware resources required to attach to a remote processor.
> +	 * Because we are attaching rather than booting the remote processor,
> +	 * we expect the platform driver to properly set rproc->table_ptr.
> +	 */
> +	ret = rproc_handle_resources(rproc, rproc_loading_handlers);
> +	if (ret) {
> +		dev_err(dev, "Failed to process resources: %d\n", ret);
> +		goto disable_iommu;
> +	}
> +
> +	/* Allocate carveout resources associated to rproc */
> +	ret = rproc_alloc_registered_carveouts(rproc);
> +	if (ret) {
> +		dev_err(dev, "Failed to allocate associated carveouts: %d\n",
> +			ret);
> +		goto clean_up_resources;
> +	}
> +
> +	ret = rproc_attach(rproc);
> +	if (ret)
> +		goto clean_up_resources;
> +
> +	return 0;
> +
> +clean_up_resources:
> +	rproc_resource_cleanup(rproc);
> +disable_iommu:
> +	rproc_disable_iommu(rproc);
> +put_pm_runtime:
> +	pm_runtime_put(dev);
> +	return ret;
> +}
> +
>  /*
>   * take a firmware and boot it up.
>   *
> -- 
> 2.20.1
> 
