Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5CCE19A0C2
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 23:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbgCaV1W (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 31 Mar 2020 17:27:22 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50742 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbgCaV1V (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 31 Mar 2020 17:27:21 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02VLRE78079296;
        Tue, 31 Mar 2020 16:27:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585690034;
        bh=iT9K5IZS9AaGSGgcu+d3woU/E893gBV3plMdvYcACQw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=o8XZ9M2ShufqVv8gPSZtPJ8M7D2ISuKLZ5bWbH0pkUoNGh/RyhdX8srMy4g0zG5Ne
         /hPqtvoZYmSFzvHJHc6HJmMxa42mSLhwZEgAkxjJYJVWhq0YSQuIdb8zcjQy7TSkhg
         /zg2n8WpO5RwmY1conC08oge8CsFaDDKKRuSzwow=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02VLREBa102585
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 31 Mar 2020 16:27:14 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 31
 Mar 2020 16:27:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 31 Mar 2020 16:27:05 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02VLR5tG102533;
        Tue, 31 Mar 2020 16:27:05 -0500
Subject: Re: [PATCH v2 10/17] remoteproc: Decouple firmware load and
 remoteproc booting
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <loic.pallardy@st.com>, <peng.fan@nxp.com>,
        <arnaud.pouliquen@st.com>, <fabien.dessenne@st.com>,
        <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-11-mathieu.poirier@linaro.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <f61fa99d-89dd-fb08-e883-8a1bfee68a31@ti.com>
Date:   Tue, 31 Mar 2020 16:27:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200324214603.14979-11-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 3/24/20 4:45 PM, Mathieu Poirier wrote:
> In preparation to support scenarios where MCU firmware is loaded and
> the MCU itself booted by another entity, split function rproc_boot()
> to decouple the functions of loading the firwmare and starting the
> initialisation process.  That way we can reuse the functionality
> provided by the current implementation without invariably dealing
> with firmware loading.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 63 +++++++++++++++++-----------
>  1 file changed, 39 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 1578a9c70422..7faee1396ef7 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1714,21 +1714,10 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  		rproc_trigger_recovery(rproc);
>  }
>  
> -/**
> - * rproc_boot() - boot a remote processor
> - * @rproc: handle of a remote processor
> - *
> - * Boot a remote processor (i.e. load its firmware, power it on, ...).
> - *
> - * If the remote processor is already powered on, this function immediately
> - * returns (successfully).
> - *
> - * Returns 0 on success, and an appropriate error value otherwise.
> - */
> -int rproc_boot(struct rproc *rproc)
> +static int rproc_actuate(struct rproc *rproc,
> +			 const struct firmware *firmware_p)

I would recommend to add some documentation above this function given
that you are refactoring, and using it from multiple places with
different arguments and expected behaviors based on the sync states,
with certain behaviors from the underlying ops.

regards
Suman

>  {
> -	const struct firmware *firmware_p;
> -	struct device *dev;
> +	struct device *dev = &rproc->dev;
>  	int ret;
>  
>  	if (!rproc) {
> @@ -1736,8 +1725,6 @@ int rproc_boot(struct rproc *rproc)
>  		return -EINVAL;
>  	}
>  
> -	dev = &rproc->dev;
> -
>  	ret = mutex_lock_interruptible(&rproc->lock);
>  	if (ret) {
>  		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
> @@ -1756,24 +1743,52 @@ int rproc_boot(struct rproc *rproc)
>  		goto unlock_mutex;
>  	}
>  
> -	dev_info(dev, "powering up %s\n", rproc->name);
> +	dev_info(dev, "%s %s\n",
> +		 firmware_p ? "powering up" : "syncing with",
> +		 rproc->name);
> +
> +	ret = rproc_fw_boot(rproc, firmware_p);
> +	if (ret)
> +		atomic_dec(&rproc->power);
> +
> +unlock_mutex:
> +	mutex_unlock(&rproc->lock);
> +	return ret;
> +}
> +
> +/**
> + * rproc_boot() - boot a remote processor
> + * @rproc: handle of a remote processor
> + *
> + * Boot a remote processor (i.e. load its firmware, power it on, ...).
> + *
> + * If the remote processor is already powered on, this function immediately
> + * returns (successfully).
> + *
> + * Returns 0 on success, and an appropriate error value otherwise.
> + */
> +int rproc_boot(struct rproc *rproc)
> +{
> +	const struct firmware *firmware_p;
> +	struct device *dev = &rproc->dev;
> +	int ret;
> +
> +	if (!rproc) {
> +		pr_err("invalid rproc handle\n");
> +		return -EINVAL;
> +	}
>  
>  	/* load firmware */
>  	ret = request_firmware(&firmware_p, rproc->firmware, dev);
>  	if (ret < 0) {
>  		dev_err(dev, "request_firmware failed: %d\n", ret);
> -		goto downref_rproc;
> +		return ret;
>  	}
>  
> -	ret = rproc_fw_boot(rproc, firmware_p);
> +	ret = rproc_actuate(rproc, firmware_p);
>  
>  	release_firmware(firmware_p);
>  
> -downref_rproc:
> -	if (ret)
> -		atomic_dec(&rproc->power);
> -unlock_mutex:
> -	mutex_unlock(&rproc->lock);
>  	return ret;
>  }
>  EXPORT_SYMBOL(rproc_boot);
> 

