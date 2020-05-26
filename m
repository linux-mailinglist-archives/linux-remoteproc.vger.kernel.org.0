Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E65AE19FB42
	for <lists+linux-remoteproc@lfdr.de>; Mon,  6 Apr 2020 19:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbgDFRUW (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 6 Apr 2020 13:20:22 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33811 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728557AbgDFRUW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Apr 2020 13:20:22 -0400
Received: by mail-pg1-f194.google.com with SMTP id l14so280025pgb.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Apr 2020 10:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9ufQQaWgpQ1ovP51hpWZYakegE3ep+d8csbsVkQT9hw=;
        b=Et3RwsnxoUZxcWoJKthjdlVbl8BWY6TSt1ZTTvJhDPEOAlyjOUKBjPC2+paORR2YZl
         X+pSasZgIQ2s9oegTIX+8ZSJ8QGetfnMJfw+Vz0HI51C/bPHRzI+OdKukXOOMMkqJk2u
         GOZKEiIIaQjY/AxAUBmbf06xYizlv8wkWZwHd9w9sKqIubPJs/XFQqIkDKg6ljIdCiWe
         Ye3zOHnqH77YRPMJrIGGrzvBcbBB837ESdTdAF/VCrZqITdLan1s0Oe1rH6DQsY/+xv2
         k9YMRYaC0z00/I1sUFGIZCF1IW4u0pzBwdTvaRLBvJLinrn+Eg3aAN67aTKoonLrMwtG
         Yk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9ufQQaWgpQ1ovP51hpWZYakegE3ep+d8csbsVkQT9hw=;
        b=MKVBSs1pzfnV24kNM5/rFWrwgCQvSz+cGSXjCRCQrhbGWEpTMp1siRBRRuU7Fhw3+H
         eRFR0g1sOoOXy3BQRwUjCPHdaDkN4ZIjsM69GO0duFrMMRDP+nUXbNNhNCfTz55g/yPZ
         piRVz1z2VFM4kHQn4su0nlI+tcds447YqwhbFvv5n/2KsNEN0yqcU5BDgacGI5jd4q8e
         D85S2RD8fjHTcTJAsW2vKEEwxY4cs14fcUf7rwf+1H9gjcOkiZIe+c93NI8fKFxaK7NX
         wAmwkxX/1tav1l40z6AmTaCa1tNKbMSLKVNLguUSoGHnGxN9Nu2PyCJ1uCDMsqBtIGJ1
         fcGA==
X-Gm-Message-State: AGi0PuazbkUbJBjFdqsJLtdKzQXrbyXkrXHi5QfeiXOUmfTyv37dgZYy
        z8FZV/MWQZFsbkOo//5xH28IyA==
X-Google-Smtp-Source: APiQypKD14oDwdXQWKCZ1Qi/4No9nWpitsw/lHB15XdP4NiRpWom5ngC86uzh7fy2A17q3MwbegH+A==
X-Received: by 2002:aa7:8f29:: with SMTP id y9mr515086pfr.19.1586193620938;
        Mon, 06 Apr 2020 10:20:20 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r189sm11456723pgr.31.2020.04.06.10.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 10:20:20 -0700 (PDT)
Date:   Mon, 6 Apr 2020 11:20:18 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Loic Pallardy <loic.pallardy@st.com>
Subject: Re: [PATCH 1/7] remoteproc: add prepare and unprepare ops
Message-ID: <20200406172018.GA11572@xps15>
References: <20200324201819.23095-1-s-anna@ti.com>
 <20200324201819.23095-2-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324201819.23095-2-s-anna@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good morning Suman,

I have started to work on this set - comments will come in over the next few
days...

On Tue, Mar 24, 2020 at 03:18:13PM -0500, Suman Anna wrote:
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

In my patchset on MCU synchronisation I have moved ops->{start/stop} to
remoteproc_internal.h and called them rproc_start/stop_device() (after Loic's
suggestion).  In order to be consistent and remove boiler plate code in the core
we could do the same, i.e have rproc_prepare/unprepare_device() in
remoteproc_internal.h .

With the above:
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Thanks,
Mathieu

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

