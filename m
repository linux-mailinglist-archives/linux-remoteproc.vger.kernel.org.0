Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72BF52B0B63
	for <lists+linux-remoteproc@lfdr.de>; Thu, 12 Nov 2020 18:37:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgKLRhH (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Nov 2020 12:37:07 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:46574 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725999AbgKLRhG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Nov 2020 12:37:06 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ACHX4PY004287;
        Thu, 12 Nov 2020 18:37:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=AN1ghn94Cu9R4f8yJvJefb225cd7wT8TwGEv8/9nZxw=;
 b=BucChHxjAAInvYX9VpF3TOT29DQpmSqjAFqioU3FPTQm0EvAvYPOsHMIGnv/DkjYCd+i
 ndNryu07SbgooRrmlAkWR17ePhlsyr0ZOBM8TjiiSwhw6gbKFQeCuhc0AK3kVpcMYVk0
 TZVhHM+boe/ZPK3YaFLozc4k5lKbO+OzqhSo4JHD7GCsIRce1mEjKF00E3Il9h1tSv6K
 bk9CWlTw981Ffr/dE9TwcMqhvrHbBiTw0JYJK1QMNDGnlY+cahQRBVMxy+BtwfJcyUzU
 xIhFTFOdIPiA6FtD92h1/jwm8LE4/NQ+H0tz1FbEvZsgeHrVNhtgk539TuzZGuTj4UaJ DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34nkbneqjb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Nov 2020 18:37:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B8D4B10002A;
        Thu, 12 Nov 2020 18:37:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ABB402607D5;
        Thu, 12 Nov 2020 18:37:00 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Nov
 2020 18:36:59 +0100
Subject: Re: [PATCH v2 11/14] remoteproc: Properly deal with a stop request
 when attached
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-12-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <0252b2b6-2c4d-6659-4b67-b5b0ae97bc65@st.com>
Date:   Thu, 12 Nov 2020 18:36:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030195713.1366341-12-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-12_08:2020-11-12,2020-11-12 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,


On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> This patch introduces the capability to stop a remote processor
> that has been attached to by the remoteproc core.  For that to
> happen a rproc::ops::stop() operation need to be available.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_cdev.c  | 5 +++--
>  drivers/remoteproc/remoteproc_core.c  | 6 +++++-
>  drivers/remoteproc/remoteproc_sysfs.c | 5 +++--
>  3 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> index b19ea3057bde..d06f8d4919c7 100644
> --- a/drivers/remoteproc/remoteproc_cdev.c
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -37,10 +37,11 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
>  
>  		ret = rproc_boot(rproc);
>  	} else if (!strncmp(cmd, "stop", len)) {
> -		if (rproc->state != RPROC_RUNNING)
> +		if (rproc->state != RPROC_RUNNING &&
> +		    rproc->state != RPROC_ATTACHED)
>  			return -EINVAL;
>  
> -		rproc_shutdown(rproc);
> +		ret = rproc_shutdown(rproc);
>  	} else {
>  		dev_err(&rproc->dev, "Unrecognized option\n");
>  		ret = -EINVAL;
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f58475f6dcab..229fa2cad0bd 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1642,6 +1642,10 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
> +	/* No need to continue if a stop() operation has not been provided */
> +	if (!rproc->ops->stop)
> +		return -EINVAL;
> +
>  	/* Stop any subdevices for the remote processor */
>  	rproc_stop_subdevices(rproc, crashed);
>  
> @@ -1880,7 +1884,7 @@ int rproc_shutdown(struct rproc *rproc)
>  		return ret;
>  	}
>  
> -	if (rproc->state != RPROC_RUNNING) {
> +	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED) {
>  		ret = -EPERM;
>  		goto out;
>  	}
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 99ff51fd9707..96751c087585 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c

I've started some tests, it's working pretty well!
I found an issue when trying to start the remote proc while already attached:

@@ -106,7 +106,8 @@ static ssize_t state_store(struct device *dev,
 	int ret = 0;

 	if (sysfs_streq(buf, "start")) {
-		if (rproc->state == RPROC_RUNNING)
+		if (rproc->state == RPROC_RUNNING ||
+		    rproc->state == RPROC_ATTACHED)
 			return -EBUSY;

 		ret = rproc_boot(rproc);

To fix it also in cdev...

Regards,
Arnaud

> @@ -230,10 +230,11 @@ static ssize_t state_store(struct device *dev,
>  		if (ret)
>  			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
>  	} else if (sysfs_streq(buf, "stop")) {
> -		if (rproc->state != RPROC_RUNNING)
> +		if (rproc->state != RPROC_RUNNING &&
> +		    rproc->state != RPROC_ATTACHED)
>  			return -EINVAL;
>  
> -		rproc_shutdown(rproc);
> +		ret = rproc_shutdown(rproc);
>  	} else {
>  		dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
>  		ret = -EINVAL;
> 
