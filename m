Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5BFF5CAA
	for <lists+linux-remoteproc@lfdr.de>; Sat,  9 Nov 2019 02:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbfKIBUe (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 8 Nov 2019 20:20:34 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39808 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbfKIBUd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Nov 2019 20:20:33 -0500
Received: by mail-pl1-f195.google.com with SMTP id o9so5059448plk.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Nov 2019 17:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7caIlvIhGpHy0tmEZ2ZrocD3uac4uTPK9fPGjUeKEWs=;
        b=DJOizknxvNo27vvVk+GWaY4rOkpPvp6KBqy627BehJa+2hAILBsQe7aeXimzHbtID8
         41OoHITeojgdJqyP/18JnpiiJ7jciM7uIpR/gzFR4JGVUmrRIKx3OJOUzA5gEdf3rmwH
         FXdTCuDunWPEuKkp17eo/LopFZoSlm8q5MO0oOAJMQax3n6qvXB/RJx04XLiJYBLYARu
         /tCjkHm3097r/BMdf3QZ+o+TAA9k+rPZVs+drw3xPH0OxarpDoRgQyT7IdL1XcXgmFUy
         OOlIKCIkXK1mKdx2qBSF3w66P1sp96aCuhXRHoF7YJd/j3f5goheCoHRQGZzZAh/OOuQ
         dgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7caIlvIhGpHy0tmEZ2ZrocD3uac4uTPK9fPGjUeKEWs=;
        b=L082hpw0h1o0lW7f36MtRVoelugy1ku9ZCwsHtA9N3KWYwsgcAXZLssyodTEUUrD8F
         ZV+KCa3+O+PYq5vyRe1G1G3Gu28vTzM9a1ybz6qgNe3WaXv/wiZ9GJpI/ZcG3JpqHNyO
         z6o5CcK38RemkQZMnxNd7jxdNkMfC38wkvHCWG/mJUoO1l3ytOed9OAc2K+AElleCVkf
         vDqvfVu7NoVTOgISCkPLgx7wHG9+z2V5CK+eRxdyxwkkq3ewndIl/Rua94LQuwNDo8h/
         3SQ5Sht8K0lkkVi2NevG4p5GJTlHV6H9B6ti/5BM6oDVTMugIlJdp3gxS2uP++Qo4PkS
         BqeA==
X-Gm-Message-State: APjAAAXXDfoq/xwBGFWZYhD2nzOMSrtLmATAiS1u6aE8zCfkHHIfsueA
        YPzbfXi8cfrkxjPFw2Mes6MAzg==
X-Google-Smtp-Source: APXvYqwvr9DsVZ1RbVxRmi2Li01ya1hjUcGmRJAoJvxIwJS69LF+1+2qWPYjcdpyOn1FKqEJDJrOBg==
X-Received: by 2002:a17:902:a717:: with SMTP id w23mr14135262plq.27.1573262430881;
        Fri, 08 Nov 2019 17:20:30 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i126sm8371910pfc.29.2019.11.08.17.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 17:20:30 -0800 (PST)
Date:   Fri, 8 Nov 2019 17:20:27 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Pallardy <loic.pallardy@st.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com,
        benjamin.gaignard@linaro.org, fabien.dessenne@st.com, s-anna@ti.com
Subject: Re: [PATCH v2 1/1] remoteproc: add support for co-processor booted
 before kernel
Message-ID: <20191109012027.GC5662@tuxbook-pro>
References: <1572864570-10131-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572864570-10131-1-git-send-email-loic.pallardy@st.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 04 Nov 02:49 PST 2019, Loic Pallardy wrote:

> Remote processor could boot independently or be started before Linux
> kernel by bootloader or any firmware.
> This patch introduces a new property in rproc core, named preloaded,
> to be able to allocate resources and sub-devices like vdev and to
> synchronize with current state without loading firmware from file system.
> It is platform driver responsibility to implement the right firmware
> load ops according to HW specificities.
> 

Is it just preloaded or already started?

> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> 
> ---
> Change from v1:
> - Keep bool in struct rproc
> ---
>  drivers/remoteproc/remoteproc_core.c | 37 +++++++++++++++++++++++++++---------
>  include/linux/remoteproc.h           |  2 ++
>  2 files changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 3c5fbbbfb0f1..7eaf0f949afa 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1372,7 +1372,11 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	if (ret)
>  		return ret;
>  
> -	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
> +	if (fw)
> +		dev_info(dev, "Booting fw image %s, size %zd\n", name,
> +			 fw->size);
> +	else
> +		dev_info(dev, "Synchronizing with preloaded co-processor\n");
>  
>  	/*
>  	 * if enabling an IOMMU isn't relevant for this rproc, this is
> @@ -1728,7 +1732,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
>   */
>  int rproc_boot(struct rproc *rproc)
>  {
> -	const struct firmware *firmware_p;
> +	const struct firmware *firmware_p = NULL;
>  	struct device *dev;
>  	int ret;
>  
> @@ -1759,11 +1763,17 @@ int rproc_boot(struct rproc *rproc)
>  
>  	dev_info(dev, "powering up %s\n", rproc->name);
>  
> -	/* load firmware */
> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> -	if (ret < 0) {
> -		dev_err(dev, "request_firmware failed: %d\n", ret);
> -		goto downref_rproc;
> +	if (!rproc->preloaded) {
> +		/* load firmware */
> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
> +		if (ret < 0) {
> +			dev_err(dev, "request_firmware failed: %d\n", ret);
> +			goto downref_rproc;
> +		}
> +	} else {
> +		/* set firmware name to null as unknown */
> +		kfree(rproc->firmware);
> +		rproc->firmware = NULL;

What happens when the remoteproc crashes? What happens if I stop it and
try to start it again?

>  	}
>  
>  	ret = rproc_fw_boot(rproc, firmware_p);
> @@ -1917,8 +1927,17 @@ int rproc_add(struct rproc *rproc)
>  	/* create debugfs entries */
>  	rproc_create_debug_dir(rproc);
>  
> -	/* if rproc is marked always-on, request it to boot */
> -	if (rproc->auto_boot) {
> +	if (rproc->preloaded) {
> +		/*
> +		 * If rproc is marked already booted, no need to wait
> +		 * for firmware.
> +		 * Just handle associated resources and start sub devices
> +		 */
> +		ret = rproc_boot(rproc);

This will trickle down to your remoteproc driver's start() callback. If
you really mean that "preloaded" means "already started", then I presume
you're having some logic in your start() to turn it into a nop?

> +		if (ret < 0)
> +			return ret;
> +	} else if (rproc->auto_boot) {
> +		/* if rproc is marked always-on, request it to boot */
>  		ret = rproc_trigger_auto_boot(rproc);
>  		if (ret < 0)
>  			return ret;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 16ad66683ad0..b68fbd576a77 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -479,6 +479,7 @@ struct rproc_dump_segment {
>   * @table_sz: size of @cached_table
>   * @has_iommu: flag to indicate if remote processor is behind an MMU
>   * @auto_boot: flag to indicate if remote processor should be auto-started
> + * @preloaded: remote processor has been preloaded before start sequence

I think this should be "skip_firmware_load", or if you really mean that
the bootloader started the remote process perhaps this should be
"@fw_booted: remote processor was booted by firmware" (or something
similar).

Regards,
Bjorn

>   * @dump_segments: list of segments in the firmware
>   * @nb_vdev: number of vdev currently handled by rproc
>   */
> @@ -512,6 +513,7 @@ struct rproc {
>  	size_t table_sz;
>  	bool has_iommu;
>  	bool auto_boot;
> +	bool preloaded;
>  	struct list_head dump_segments;
>  	int nb_vdev;
>  };
> -- 
> 2.7.4
> 
