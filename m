Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3EC8367B99
	for <lists+linux-remoteproc@lfdr.de>; Thu, 22 Apr 2021 09:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbhDVH5T (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 22 Apr 2021 03:57:19 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:8530 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229487AbhDVH5T (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 22 Apr 2021 03:57:19 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13M7pkVc010640;
        Thu, 22 Apr 2021 09:56:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iiceL4vriA1YrX6ST+maKuiRlVW/kDiy+fwAHwgglsU=;
 b=zN2ZlwQImubCfOluydWU6o5kzrALU1duk8y+smOVTRZU7+5inK7+EaUYwrtq8AI82zIc
 NumqjUUczRf7DHecJoY6wVf6XYgPemjRC8bXSg+d19kPr3tyYamFEvlahE4hUh4Jy/nL
 S/1+EjNme6huzswdA+z8ePZUWFGPL+IRr9KuetMaYkKgK1zvtQim1H5BPRFGPWNAwD9i
 EGW2M8ROEFoD4a5s/eb5mTgcjRKLAC6I824JIhIAbx625m1xEs1j8mke5OZwmR+tcryB
 ci0HRXA85u4fg0Q1ExqgKJz/DYnpjo1qLtqi93geJvTUQy6ca/OZl3iOuX52dktDVQRt mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 382fxqf3ap-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Apr 2021 09:56:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 96AE610002A;
        Thu, 22 Apr 2021 09:56:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 820FB21FEA9;
        Thu, 22 Apr 2021 09:56:42 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 22 Apr
 2021 09:56:41 +0200
Subject: Re: [PATCH v2 2/7] rpmsg: Move the rpmsg control device from
 rpmsg_char to rpmsg_ctrl
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
 <20210413134458.17912-3-arnaud.pouliquen@foss.st.com>
 <20210421180455.GE1223348@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <bb376229-006f-af16-2006-4ef9edea87f5@foss.st.com>
Date:   Thu, 22 Apr 2021 09:56:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210421180455.GE1223348@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-22_01:2021-04-21,2021-04-21 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 4/21/21 8:04 PM, Mathieu Poirier wrote:
> On Tue, Apr 13, 2021 at 03:44:53PM +0200, Arnaud Pouliquen wrote:
>> Create the rpmsg_ctrl.c module and move the code related to the
>> rpmsg_ctrldev device in this new module.
>>
>> Add the dependency between rpmsg_char and rpmsg_ctrl in the
>> kconfig file.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>> update from v1:
>> - keep "rpmsg_chrdev" driver name in rpmsg_ctrl, driver will be renamed
>>   in next path that renames the rpmsg_chrdev_create_eptdev.
>> - rename the chardev regions
>> - move RPMSG_DEV_MAX to rpmsg_char.h
>> ---
>>  drivers/rpmsg/Kconfig      |   9 ++
>>  drivers/rpmsg/Makefile     |   1 +
>>  drivers/rpmsg/rpmsg_char.c | 181 +----------------------------
>>  drivers/rpmsg/rpmsg_char.h |   2 +
>>  drivers/rpmsg/rpmsg_ctrl.c | 231 +++++++++++++++++++++++++++++++++++++
>>  5 files changed, 245 insertions(+), 179 deletions(-)
>>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
>>
>> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
>> index 0b4407abdf13..d822ec9ec692 100644
>> --- a/drivers/rpmsg/Kconfig

snip[...]

>> +static int rpmsg_ctrldev_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_ctrl");
>> +	if (ret < 0) {
>> +		pr_err("rpmsg: failed to allocate char dev region\n");
>> +		return ret;
>> +	}
>> +
>> +	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
> 
> This class thing really bothers me.  Keeping this here means that rpmsg_eptdevs
> created from user space will be associated to this rpmsg_class but those created
> from the name service won't.  As such I propose to move this to rpmsg_char and
> simply not associate the control device to the class.
> 
> Otherwise we'd have to introduce some mechanic only to deal with the creation of
> the class and I don't think it is worth.  We can revise that approach if someone
> complains we broke their user space. 

I agree with that as it was my first proposed approach here [1]

[1] https://www.spinics.net/lists/linux-arm-msm/msg81194.html

Thanks,
Arnaud

> 
> 
>> +	if (IS_ERR(rpmsg_class)) {
>> +		pr_err("failed to create rpmsg class\n");
>> +		ret = PTR_ERR(rpmsg_class);
>> +		goto free_region;
>> +	}
>> +
>> +	ret = register_rpmsg_driver(&rpmsg_ctrldev_driver);
>> +	if (ret < 0) {
>> +		pr_err("rpmsg ctrl: failed to register rpmsg driver\n");
>> +		goto free_class;
>> +	}
>> +
>> +	return 0;
>> +
>> +free_class:
>> +	class_destroy(rpmsg_class);
>> +free_region:
>> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>> +
>> +	return ret;
>> +}
>> +postcore_initcall(rpmsg_ctrldev_init);
>> +
>> +static void rpmsg_ctrldev_exit(void)
>> +{
>> +	unregister_rpmsg_driver(&rpmsg_ctrldev_driver);
>> +	class_destroy(rpmsg_class);
>> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>> +}
>> +module_exit(rpmsg_ctrldev_exit);
>> +
>> +MODULE_DESCRIPTION("rpmsg control interface");
>> +MODULE_ALIAS("rpmsg:" KBUILD_MODNAME);
>> +MODULE_LICENSE("GPL v2");
>> -- 
>> 2.17.1
>>
