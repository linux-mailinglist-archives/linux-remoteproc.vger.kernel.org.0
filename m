Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36C273A94CB
	for <lists+linux-remoteproc@lfdr.de>; Wed, 16 Jun 2021 10:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbhFPIOQ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 16 Jun 2021 04:14:16 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:55818 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231710AbhFPIOP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Jun 2021 04:14:15 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15G7v3DJ001291;
        Wed, 16 Jun 2021 10:12:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=bFvu2HfEeOPL3uefX4Yygb8OKjju9ZpEW+yTEh8JSzM=;
 b=f7rZ006gW6fr91ClKVMkWLMrcr2Sc7E0ZygWnNqE8lrFywRntgpMEZ5A/pi2nxmPaNcC
 WGCk0ai/W7bz61772DlvVHn1nFSlIDylPTBhBhF03EHuLFWWGaXfO/TEK8g6HhXY18nh
 hQAkhi4NK4ge02NfR69EPFzh1xHNJRd9iDsYTeSR2ZwaZsbRMn0749T7euLsvSfhkDCk
 b/HRRA8gDui4bzjdn+d8H9DYecDR2pZa44yjXrI0z08PFEIsTXGL3Qdc8y2ScDgOJmsf
 wVQPUK6pDPjQml2LlFW/gOkLszzKY8PkaoP01SorFdusRHR+caFxGKi+SfsRo478C9P6 hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 396y17v8x5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 16 Jun 2021 10:12:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A2CBF100034;
        Wed, 16 Jun 2021 10:12:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8BE6421999A;
        Wed, 16 Jun 2021 10:12:05 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 10:12:05 +0200
Subject: Re: [PATCH 1/4] rpmsg: ctrl: Introduce RPMSG_CREATE_DEV_IOCTL
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
 <20210604091406.15901-2-arnaud.pouliquen@foss.st.com>
 <20210615175334.GD604521@p14s>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <1645a516-1d83-27bd-e9ed-c78a18bf4c52@foss.st.com>
Date:   Wed, 16 Jun 2021 10:12:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210615175334.GD604521@p14s>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-16_05:2021-06-15,2021-06-16 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Mathieu,

On 6/15/21 7:53 PM, Mathieu Poirier wrote:
> On Fri, Jun 04, 2021 at 11:14:03AM +0200, Arnaud Pouliquen wrote:
>> Implement the RPMSG_CREATE_DEV_IOCTL to allow the user application to
>> initiate a communication through a new rpmsg channel.
>> This Ioctl can be used to instantiate a local rpmsg device.
>> Depending on the back-end implementation, the associated rpmsg driver is
>> probed and a NS announcement can be sent to the remote processor.
>>
>> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_ctrl.c | 30 ++++++++++++++++++++++++++----
>>  include/uapi/linux/rpmsg.h |  5 +++++
>>  2 files changed, 31 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
>> index eeb1708548c1..4aa962df3661 100644
>> --- a/drivers/rpmsg/rpmsg_ctrl.c
>> +++ b/drivers/rpmsg/rpmsg_ctrl.c
>> @@ -23,6 +23,7 @@
>>  #include <uapi/linux/rpmsg.h>
>>  
>>  #include "rpmsg_char.h"
>> +#include "rpmsg_internal.h"
>>  
>>  static dev_t rpmsg_major;
>>  
>> @@ -37,11 +38,13 @@ static DEFINE_IDA(rpmsg_minor_ida);
>>   * @rpdev:	underlaying rpmsg device
>>   * @cdev:	cdev for the ctrl device
>>   * @dev:	device for the ctrl device
>> + * @ctrl_lock:	serialize the ioctrls.
>>   */
>>  struct rpmsg_ctrldev {
>>  	struct rpmsg_device *rpdev;
>>  	struct cdev cdev;
>>  	struct device dev;
>> +	struct mutex ctrl_lock;
>>  };
>>  
>>  static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
>> @@ -70,9 +73,8 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>>  	void __user *argp = (void __user *)arg;
>>  	struct rpmsg_endpoint_info eptinfo;
>>  	struct rpmsg_channel_info chinfo;
>> -
>> -	if (cmd != RPMSG_CREATE_EPT_IOCTL)
>> -		return -EINVAL;
>> +	struct rpmsg_device *rpdev;
>> +	int ret = 0;
>>  
>>  	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
>>  		return -EFAULT;
>> @@ -82,7 +84,26 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>>  	chinfo.src = eptinfo.src;
>>  	chinfo.dst = eptinfo.dst;
>>  
>> -	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
>> +	mutex_lock(&ctrldev->ctrl_lock);
> 
> Do we need a lock here?  I thought the character device layer would guarantee
> accesses on a file handler would be atomic...  Am I wrong?
> 

It is a good point! from my understanding, using "unlocked_ioctl" ops, the
driver has to handle is own atomic protection.
I will try to hack the code to verify this.

Thanks,
Arnaud

>> +	switch (cmd) {
>> +	case RPMSG_CREATE_EPT_IOCTL:
>> +		ret = rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
>> +		break;
>> +
>> +	case RPMSG_CREATE_DEV_IOCTL:
>> +		rpdev = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
>> +		if (!rpdev) {
>> +			dev_err(&ctrldev->dev, "failed to create %s channel\n", chinfo.name);
>> +			ret = -ENXIO;
>> +		}
>> +		break;
>> +
>> +	default:
>> +		ret = -EINVAL;
>> +	}
>> +	mutex_unlock(&ctrldev->ctrl_lock);
>> +
>> +	return ret;
>>  };
>>  
>>  static const struct file_operations rpmsg_ctrldev_fops = {
>> @@ -119,6 +140,7 @@ static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
>>  	device_initialize(dev);
>>  	dev->parent = &rpdev->dev;
>>  
>> +	mutex_init(&ctrldev->ctrl_lock);
>>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>>  	ctrldev->cdev.owner = THIS_MODULE;
>>  
>> diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
>> index f5ca8740f3fb..f9d5a74e7801 100644
>> --- a/include/uapi/linux/rpmsg.h
>> +++ b/include/uapi/linux/rpmsg.h
>> @@ -33,4 +33,9 @@ struct rpmsg_endpoint_info {
>>   */
>>  #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
>>  
>> +/**
>> + * Instantiate a rpmsg service device.
>> + */
>> +#define RPMSG_CREATE_DEV_IOCTL	_IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
>> +
>>  #endif
>> -- 
>> 2.17.1
>>
