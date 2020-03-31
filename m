Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70F3219A0E5
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 23:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbgCaVdG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 31 Mar 2020 17:33:06 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45342 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728245AbgCaVdG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 31 Mar 2020 17:33:06 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02VLWwd9011094;
        Tue, 31 Mar 2020 16:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585690378;
        bh=VOFzdsbpmbGq56qhynD8I4xwoNX+f1ELxwtHDtGjq5o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=MBeoxIMQe5Piln3ifv+uVqgPLBIaMjPlg+1/5wVKXRrGz9ddVU1/rzGltM7Y4Qa3h
         oiKGRJuNrI2EjbGB0RHQHt/wI9r7MpvnQRFb77FDfMtcHqkqlCQYdGSuG0HACvckhX
         mqMxxL5HWjID69J2/bowtaIKNYXkRK42Y/D+VBW0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02VLWwMm052377
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 31 Mar 2020 16:32:58 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 31
 Mar 2020 16:32:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 31 Mar 2020 16:32:58 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02VLWwD3023666;
        Tue, 31 Mar 2020 16:32:58 -0500
Subject: Re: [PATCH v2 11/17] remoteproc: Repurpose function
 rproc_trigger_auto_boot()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <loic.pallardy@st.com>, <peng.fan@nxp.com>,
        <arnaud.pouliquen@st.com>, <fabien.dessenne@st.com>,
        <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-12-mathieu.poirier@linaro.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <8558011f-5e3d-057b-6808-1dbd8661382d@ti.com>
Date:   Tue, 31 Mar 2020 16:32:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200324214603.14979-12-mathieu.poirier@linaro.org>
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
> Repurpose function rproc_trigger_auto_boot() so that it can deal with
> scenarios where the MCU is already running.  As such give it a new name
> to better represent the capabilities and add a call to rproc_actuate()
> if instructed by the platform code to synchronise with the MCU rather
> than boot it from scratch.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 7faee1396ef7..d57b47b0d6be 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -51,6 +51,8 @@ static int rproc_alloc_carveout(struct rproc *rproc,
>  				struct rproc_mem_entry *mem);
>  static int rproc_release_carveout(struct rproc *rproc,
>  				  struct rproc_mem_entry *mem);
> +static int rproc_actuate(struct rproc *rproc,
> +			 const struct firmware *firmware_p);
>  
>  /* Unique indices for remoteproc devices */
>  static DEFINE_IDA(rproc_dev_index);
> @@ -1444,10 +1446,17 @@ static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
>  	release_firmware(fw);
>  }
>  
> -static int rproc_trigger_auto_boot(struct rproc *rproc)
> +static int rproc_trigger_auto_initiate(struct rproc *rproc)
>  {
>  	int ret;
>  
> +	/*
> +	 * The MCU is already booted, all we need to do is synchronise with it.
> +	 * No point dealing with a firmware image.
> +	 */
> +	if (rproc_sync_with_mcu(rproc))
> +		return rproc_actuate(rproc, NULL);
> +
>  	/*
>  	 * We're initiating an asynchronous firmware loading, so we can
>  	 * be built-in kernel code, without hanging the boot process.
> @@ -1931,9 +1940,12 @@ int rproc_add(struct rproc *rproc)
>  	/* create debugfs entries */
>  	rproc_create_debug_dir(rproc);
>  
> -	/* if rproc is marked always-on, request it to boot */
> +	/*
> +	 * if rproc is marked always-on, request it to boot or synchronise
> +	 * with it.

Can you please rephrase the "always-on" here while at this since are
already modifying this comment.

regards
Suman

> +	 */
>  	if (rproc->auto_boot) {
> -		ret = rproc_trigger_auto_boot(rproc);
> +		ret = rproc_trigger_auto_initiate(rproc);
>  		if (ret < 0)
>  			return ret;
>  	}
> 

