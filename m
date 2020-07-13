Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65031219ACB
	for <lists+linux-remoteproc@lfdr.de>; Thu,  9 Jul 2020 10:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgGII3V (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 9 Jul 2020 04:29:21 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:16136 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726122AbgGII3V (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Jul 2020 04:29:21 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0698SSMf006621;
        Thu, 9 Jul 2020 10:29:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=KHZ0DTBO4Sa3jfHpi9CN4ZkwzrMLUJvZ7+a3IyOpx8Q=;
 b=awRDeWjjIjkVDjDyd8UESWSH5Nq+sSrSAU/jn9d9TnUov4pzEFoMHOwsVncJY3tjoIbc
 i9lTDgcDg51eYxJQ9nSClQAp88HeUcl6EkdmETrFwGk66MUE2DCrHZGVlXIiNLO6FZ1i
 E0JufHq7f/U4x5rzom9XUi5+RT8OLX7iDAxhyvobdbobTpqiVWck1l3kCsMY+0iVIBz2
 AD9OBjSbaj2bWhFRwaGoyAwPPiWLoaBRHUsK66Cnkcq01EI9nQTQoem69CsCM9Uk8qSh
 dp5VgOb922OIerOJ8jgC877c99CkI86jDc90W79+PuOuykEBgAecU2ULLQKPqCcRRZbg pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 325k403d31-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 09 Jul 2020 10:29:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 776F510002A;
        Thu,  9 Jul 2020 10:29:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A3DB2A9347;
        Thu,  9 Jul 2020 10:29:16 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.49) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jul
 2020 10:29:15 +0200
Subject: Re: [PATCH v5 4/9] remoteproc: Introducing function rproc_actuate()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200707210014.927691-1-mathieu.poirier@linaro.org>
 <20200707210014.927691-5-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <e96cdfd0-5e87-6c08-c09d-5c75faa06681@st.com>
Date:   Thu, 9 Jul 2020 10:29:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707210014.927691-5-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-09_04:2020-07-08,2020-07-09 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,


On 7/7/20 11:00 PM, Mathieu Poirier wrote:
> Introduce function rproc_actuate() that provides the same
> functionatlity as rproc_fw_boot(), but without the steps that
> involve interaction with the firmware image.  That way we can
> deal with scenarios where the remoteproc core is attaching
> to a remote processor that has already been started by another
> entity.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud
> ---
>  drivers/remoteproc/remoteproc_core.c | 59 +++++++++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 1e8e66a25bd6..fd424662801f 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1369,7 +1369,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
>  
> -static int __maybe_unused rproc_attach(struct rproc *rproc)
> +static int rproc_attach(struct rproc *rproc)
>  {
>  	struct device *dev = &rproc->dev;
>  	int ret;
> @@ -1490,6 +1490,63 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
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
> +	/*
> +	 * if enabling an IOMMU isn't relevant for this rproc, this is
> +	 * just a nop
> +	 */
> +	ret = rproc_enable_iommu(rproc);
> +	if (ret) {
> +		dev_err(dev, "can't enable iommu: %d\n", ret);
> +		return ret;
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
> +	return ret;
> +}
> +
>  /*
>   * take a firmware and boot it up.
>   *
> 
