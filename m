Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 357B2198563
	for <lists+linux-remoteproc@lfdr.de>; Mon, 30 Mar 2020 22:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgC3UbN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 16:31:13 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36770 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727714AbgC3UbN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 16:31:13 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02UKV6hf028280;
        Mon, 30 Mar 2020 15:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585600266;
        bh=16zCCbg8we19U/B2/JW3P8GId/O6IVYlX7lR5STsa0c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fE7x8XTrpb0GYFJRreov1+QXuX5kEyCeVX0Tyq7//usLD09dX+JKFCaqQ+jPTJgmI
         Stg0iULB43LaT+kuy2JUMQiO23fxkS7Fs1tqzntjeHg+3Ifi8P9Un3GikVbGJR2amq
         GoGvVq1gmvJmHHZQvWGhge/9CmTBJAMG0NpZ5OJw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02UKV6Nq033456
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Mar 2020 15:31:06 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Mar 2020 15:31:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Mar 2020 15:31:06 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02UKV5Ij075695;
        Mon, 30 Mar 2020 15:31:06 -0500
Subject: Re: [PATCH v2 05/17] remoteproc: Get rid of tedious error path
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <loic.pallardy@st.com>, <peng.fan@nxp.com>,
        <arnaud.pouliquen@st.com>, <fabien.dessenne@st.com>,
        <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-6-mathieu.poirier@linaro.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <12bcb54a-393e-a6a4-9d25-6ee9eb1688f4@ti.com>
Date:   Mon, 30 Mar 2020 15:31:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200324214603.14979-6-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 3/24/20 4:45 PM, Mathieu Poirier wrote:
> Get rid of tedious error management by moving firmware and operation
> allocation after calling device_initialize().  That way we take advantage
> of the automatic call to rproc_type_release() to cleanup after ourselves
> when put_device() is called.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index d22e557f27ed..ee277bc5556c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2054,12 +2054,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	if (!rproc)
>  		return NULL;
>  
> -	if (rproc_alloc_firmware(rproc, name, firmware))
> -		goto free_rproc;
> -
> -	if (rproc_alloc_ops(rproc, ops))
> -		goto free_firmware;
> -
>  	rproc->name = name;
>  	rproc->priv = &rproc[1];
>  	rproc->auto_boot = true;
> @@ -2070,12 +2064,17 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	rproc->dev.class = &rproc_class;
>  	rproc->dev.driver_data = rproc;

Unrelated to this patch, but do we need to move the idr_init on
notify_ids here?

regards
Suman

>  
> +	if (rproc_alloc_firmware(rproc, name, firmware))
> +		goto out;
> +
> +	if (rproc_alloc_ops(rproc, ops))
> +		goto out;
> +
>  	/* Assign a unique device index and name */
>  	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
>  	if (rproc->index < 0) {
>  		dev_err(dev, "ida_simple_get failed: %d\n", rproc->index);
> -		put_device(&rproc->dev);
> -		return NULL;
> +		goto out;
>  	}
>  
>  	dev_set_name(&rproc->dev, "remoteproc%d", rproc->index);
> @@ -2098,11 +2097,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	rproc->state = RPROC_OFFLINE;
>  
>  	return rproc;
> -
> -free_firmware:
> -	kfree(rproc->firmware);
> -free_rproc:
> -	kfree(rproc);
> +out:
> +	put_device(&rproc->dev);
>  	return NULL;
>  }
>  EXPORT_SYMBOL(rproc_alloc);
> 

