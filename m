Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B144D1BD7A7
	for <lists+linux-remoteproc@lfdr.de>; Wed, 29 Apr 2020 10:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgD2Ix5 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 29 Apr 2020 04:53:57 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:23544 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726345AbgD2Ix5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 29 Apr 2020 04:53:57 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03T8qTRP032348;
        Wed, 29 Apr 2020 10:52:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=BEwhmA5i7vXM6Du+soyBhv27RZwVEwPtgYeu2uOQAdY=;
 b=nGDnVU34/IVp7EvLTZ6q+pMXYpiSeBs/bEwmp7/GwPzwKKQIjFv0bKkzG7H5v4P9BYFU
 4wrhPRSq5lc8H2/O0CzKjo9QTv97JgHp5plUO5zFWmFBoMREur0t5qwuJwULGrRkz4QE
 dico+50yZXFrBt0jj5a7DWAe3FdKyMiiWp3jSirKVdPP7gFoREX5krRR2q5wYEiYLrwH
 OpP7UlsgJoxzlJ3bhskmYmg35cClgWEner/dVqaApS7fajbuRQvRSUehd16guTQSnXwu
 9HO4gCn4+Qgk9ZW8zgB38mygMl1CM3uevJewHrDPuUTuuBR8HRb/ROIGo+86Pr+A8k4X Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30mhq655yq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Apr 2020 10:52:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7AF8A100034;
        Wed, 29 Apr 2020 10:52:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 642582073F6;
        Wed, 29 Apr 2020 10:52:50 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.51) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Apr
 2020 10:52:49 +0200
Subject: Re: [PATCH v3 11/14] remoteproc: Deal with synchronisation when
 changing FW image
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        <bjorn.andersson@linaro.org>, <ohad@wizery.com>
CC:     <loic.pallardy@st.com>, <s-anna@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-12-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <4ab6d7ac-905b-494e-cce7-cb8a697decb7@st.com>
Date:   Wed, 29 Apr 2020 10:52:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424200135.28825-12-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-29_03:2020-04-28,2020-04-29 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 4/24/20 10:01 PM, Mathieu Poirier wrote:
> This patch prevents the firmware image from being displayed or changed
> when the remoteproc core is synchronising with a remote processor. This
> is needed since there is no guarantee about the nature of the firmware
> image that is loaded by the external entity.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_sysfs.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 7f8536b73295..cdd322a6ecfa 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -13,9 +13,20 @@
>  static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
>  			  char *buf)
>  {
> +	ssize_t ret;
>  	struct rproc *rproc = to_rproc(dev);
>  
> -	return sprintf(buf, "%s\n", rproc->firmware);
> +	/*
> +	 * In most instances there is no guarantee about the firmware
> +	 * that was loaded by the external entity.  As such simply don't
> +	 * print anything.
> +	 */
> +	if (rproc_needs_syncing(rproc))
> +		ret = sprintf(buf, "\n");

A default name is provided in sysfs if no firmware is started/synchronised on boot.

IMO providing an empty name here could be confusing.
Perhaps a refactoring of this sysfs entry would be nice:
 - Normal boot (no firmware loaded) : empty name instead of a default name
 - auto_boot: name provided by the platform driver or default name ( current implementation)
 - synchronization: a predefined name such as Default, unknown, External, None,...   

> +	else
> +		ret = sprintf(buf, "%s\n", rproc->firmware);
> +
> +	return ret;
>  }
>  
>  /* Change firmware name via sysfs */
> @@ -39,6 +50,17 @@ static ssize_t firmware_store(struct device *dev,
>  		goto out;
>  	}
>  
> +	/*
> +	 * There is no point in trying to change the firmware if loading the
> +	 * image of the remote processor is done by another entity.
> +	 */
> +	if (rproc_needs_syncing(rproc)) {
> +		dev_err(dev,
> +			"can't change firmware while synchronising with MCU\n");

I don't know if you decide to keep "MCU" or not. If not the case
you have also some other instances in your patch 9/14.

Regards
Arnaud

> +		err = -EBUSY;
> +		goto out;
> +	}
> +
>  	len = strcspn(buf, "\n");
>  	if (!len) {
>  		dev_err(dev, "can't provide a NULL firmware\n");
> 
