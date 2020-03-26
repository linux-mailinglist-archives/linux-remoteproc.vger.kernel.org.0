Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC171947E1
	for <lists+linux-remoteproc@lfdr.de>; Thu, 26 Mar 2020 20:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbgCZTvC (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 26 Mar 2020 15:51:02 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42573 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgCZTvB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Mar 2020 15:51:01 -0400
Received: by mail-pg1-f193.google.com with SMTP id h8so3427142pgs.9
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2020 12:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WNlM17wU13V4C2Q82cbPsO90RUOYDip+1HB0oBZcydk=;
        b=Ku00JDgAcccYNbI1uZUctsOQld+eet5Omx+ff0Cvy3YjfYUgT8Ul9wVIslnrn03YMh
         4zePPAIWKAGJsJ2snn8TFLwVN1+6R5VTe0MJT0CV09SzOOZjeXDy2wuYiSvVGWo5yBHG
         +0kqWcHWvgrFziwr3K07NdsRNIT8IsX9fz7K3IQggjJML5zHKGawVHWcvrLttDSmQG+K
         lNWvIIaE4Ko8i76CPIKmW4hHLOw8UlXKx+SvHG2UWMD4BhfECGZEU5+lxZgR35HyuLXY
         WL5bkoNGSnDUYxtQ999hS4mvdUXqcDnoLXr9WnNKAyIf+ZSQk3wPz43if7ri/zhClL+z
         mx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WNlM17wU13V4C2Q82cbPsO90RUOYDip+1HB0oBZcydk=;
        b=obLD9jqGsqB2EEK7KxD6H/qZJvaAl4o0JcmIoa8Mct9g7hpWbtMneSqEe/R9fUYGrj
         wo9zHnThA5Mnnu+8qniXmvMeBvDGFJ3RVZym140Asxd3K+zJVqHd0g3dblf3H3nCccbl
         zDO+w0z/WX6pvkikD0zpFD9xiX4kvH4D1BoNKF/yKj1Z4o90hrYLUV9jnJ78Gw8DbVws
         UJpOIXNOuSyJV0TO2jsKkXVYkYfpkOfJ4ZP3hpzlZbS6sfCAfqQ783P9NrlOxo7SSFFj
         WxskdAWyd/hkmIu0Oc3z40Zuu9blAlflWmi5JkEnPLl9QNZopvvvlZh6V+XWR/zOh/2x
         KAmA==
X-Gm-Message-State: ANhLgQ1oHkF1N/tM1mB3t3eWtUcSGNEq6Q3OdjAu9IYAtdEsAUWcxqrh
        5C8yr99MJIXZP7BW8dH1J59LRQ==
X-Google-Smtp-Source: ADFU+vtzP9lVP4j9byE0r6N4bVzAiTyE4ric+6ZCDq/jLYLVUz8dO/kaQvref43Lu+xQ9E7J1QiiqQ==
X-Received: by 2002:a62:fc12:: with SMTP id e18mr11054224pfh.45.1585252260035;
        Thu, 26 Mar 2020 12:51:00 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m14sm2252235pje.19.2020.03.26.12.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 12:50:59 -0700 (PDT)
Date:   Thu, 26 Mar 2020 12:50:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Loic Pallardy <loic.pallardy@st.com>
Subject: Re: [PATCH 1/7] remoteproc: add prepare and unprepare ops
Message-ID: <20200326195057.GC59436@builder>
References: <20200324201819.23095-1-s-anna@ti.com>
 <20200324201819.23095-2-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324201819.23095-2-s-anna@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 24 Mar 13:18 PDT 2020, Suman Anna wrote:

> From: Loic Pallardy <loic.pallardy@st.com>
> 
> On some SoC architecture, it is needed to enable HW like
> clock, bus, regulator, memory region... before loading
> co-processor firmware.
> 
> This patch introduces prepare and unprepare ops to execute
> platform specific function before firmware loading and after
> stop execution.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 20 +++++++++++++++++++-
>  include/linux/remoteproc.h           |  4 ++++
>  2 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 26f6947267d2..aca6d022901a 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1394,12 +1394,22 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  		return ret;
>  	}
>  
> +	/* Prepare rproc for firmware loading if needed */
> +	if (rproc->ops->prepare) {
> +		ret = rproc->ops->prepare(rproc);
> +		if (ret) {
> +			dev_err(dev, "can't prepare rproc %s: %d\n",
> +				rproc->name, ret);
> +			goto disable_iommu;
> +		}
> +	}
> +
>  	rproc->bootaddr = rproc_get_boot_addr(rproc, fw);
>  
>  	/* Load resource table, core dump segment list etc from the firmware */
>  	ret = rproc_parse_fw(rproc, fw);
>  	if (ret)
> -		goto disable_iommu;
> +		goto unprepare_rproc;
>  
>  	/* reset max_notifyid */
>  	rproc->max_notifyid = -1;
> @@ -1433,6 +1443,10 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
>  	rproc->table_ptr = NULL;
> +unprepare_rproc:
> +	/* release HW resources if needed */
> +	if (rproc->ops->unprepare)
> +		rproc->ops->unprepare(rproc);
>  disable_iommu:
>  	rproc_disable_iommu(rproc);
>  	return ret;
> @@ -1838,6 +1852,10 @@ void rproc_shutdown(struct rproc *rproc)
>  	/* clean up all acquired resources */
>  	rproc_resource_cleanup(rproc);
>  
> +	/* release HW resources if needed */
> +	if (rproc->ops->unprepare)
> +		rproc->ops->unprepare(rproc);
> +
>  	rproc_disable_iommu(rproc);
>  
>  	/* Free the copy of the resource table */
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 07bd73a6d72a..ddce7a7775d1 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -355,6 +355,8 @@ enum rsc_handling_status {
>  
>  /**
>   * struct rproc_ops - platform-specific device handlers
> + * @prepare:	prepare device for code loading
> + * @unprepare:	unprepare device after stop
>   * @start:	power on the device and boot it
>   * @stop:	power off the device
>   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
> @@ -371,6 +373,8 @@ enum rsc_handling_status {
>   * @get_boot_addr:	get boot address to entry point specified in firmware
>   */
>  struct rproc_ops {
> +	int (*prepare)(struct rproc *rproc);
> +	int (*unprepare)(struct rproc *rproc);
>  	int (*start)(struct rproc *rproc);
>  	int (*stop)(struct rproc *rproc);
>  	void (*kick)(struct rproc *rproc, int vqid);
> -- 
> 2.23.0
> 
