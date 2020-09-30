Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E650827E468
	for <lists+linux-remoteproc@lfdr.de>; Wed, 30 Sep 2020 10:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbgI3I6k (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 30 Sep 2020 04:58:40 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:54699 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728126AbgI3I6k (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Sep 2020 04:58:40 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08U8vcLS027288;
        Wed, 30 Sep 2020 10:58:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=dnVcq0/nTUkT0tamJ0weTNzngZJq0FRzYq9kMsA6ZCw=;
 b=DzWPtbF2p7NpjVjFPgh3qmU8qQlCKjqenzt2rYMGpF3KUgb3QvchmN4GKVODQtE94lEP
 h5ohjsOi/q/gWFz3fyzMEIiN90dgBfOZf4r7nnY7D7Uy3XfdpXCPtDBxD3N4clMA+nyQ
 1DGxvgwmdWSGaBAFOZpkXU7Ac1mNdzNojjKeypDfJgdsYwfruNBW4edcfp94iLJD+8qd
 bYobqqA8EfTEwl5uUW0QlDwNUC8HwGEc4C1NtZPO2AJbiCH1L0e0Uz4xoCON0bRoMCpD
 v4xru6x7/80HeTJAXt9r0t9k4WsPhS6WWU5uDMMmajKn8pLJHF0/0LR3jGfEd2dMUsXx Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33su3ywser-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Sep 2020 10:58:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 42DCB100034;
        Wed, 30 Sep 2020 10:58:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A72321FEB1;
        Wed, 30 Sep 2020 10:58:31 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.50) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Sep
 2020 10:58:02 +0200
Subject: Re: [PATCH v6 2/3] remoteproc: Move recovery configuration to sysfs
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "tsoni@codeaurora.org" <tsoni@codeaurora.org>,
        "psodagud@codeaurora.org" <psodagud@codeaurora.org>,
        "sidgup@codeaurora.org" <sidgup@codeaurora.org>
References: <1601331456-20432-1-git-send-email-rishabhb@codeaurora.org>
 <1601331456-20432-3-git-send-email-rishabhb@codeaurora.org>
 <8a9dee56-b204-6160-1e69-60286543379e@st.com>
Message-ID: <70911f14-b76d-515d-fcd8-ea38166454ba@st.com>
Date:   Wed, 30 Sep 2020 10:58:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8a9dee56-b204-6160-1e69-60286543379e@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-30_05:2020-09-29,2020-09-30 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 9/30/20 10:11 AM, Arnaud POULIQUEN wrote:
> 
> 
> On 9/29/20 12:17 AM, Rishabh Bhatnagar wrote:
>> Move recovery configuration from debugfs to sysfs.This will
>> allow usage of this configuration feature in production
>> devices where access to debugfs might be limited.
>>
>> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
>> ---
>>  Documentation/ABI/testing/sysfs-class-remoteproc | 20 ++++++
>>  drivers/remoteproc/remoteproc_debugfs.c          | 78 ------------------------
>>  drivers/remoteproc/remoteproc_sysfs.c            | 56 +++++++++++++++++
>>  3 files changed, 76 insertions(+), 78 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-remoteproc b/Documentation/ABI/testing/sysfs-class-remoteproc
>> index f6c44fa..7368b50 100644
>> --- a/Documentation/ABI/testing/sysfs-class-remoteproc
>> +++ b/Documentation/ABI/testing/sysfs-class-remoteproc
>> @@ -82,3 +82,23 @@ Description:	Remote processor coredump configuration
>>  		all data is read by usersapce.
>>  
>>  		"disabled" means no dump will be collected.
>> +
>> +What:		/sys/class/remoteproc/.../recovery
>> +Date:		July 2020
>> +Contact:	Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
>> +Description:	Remote processor recovery mechanism
>> +
>> +		Reports the recovery mechanism of the remote processor,
>> +		which will be one of:
>> +
>> +		"enabled"
>> +		"disabled"
>> +
>> +		"enabled" means, the remote processor will be automatically
>> +		recovered whenever it crashes. Moreover, if the remote
>> +		processor crashes while recovery is disabled, it will
>> +		be automatically recovered too as soon as recovery is enabled.
>> +
>> +		"disabled" means, a remote processor will remain in a crashed
>> +		state if it crashes. This is useful for debugging purposes;
>> +		without it, debugging a crash is substantially harder.
>> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
>> index 732770e..c505f0e 100644
>> --- a/drivers/remoteproc/remoteproc_debugfs.c
>> +++ b/drivers/remoteproc/remoteproc_debugfs.c
>> @@ -84,82 +84,6 @@ static const struct file_operations rproc_name_ops = {
>>  	.llseek	= generic_file_llseek,
>>  };
>>  
>> -/* expose recovery flag via debugfs */
>> -static ssize_t rproc_recovery_read(struct file *filp, char __user *userbuf,
>> -				   size_t count, loff_t *ppos)
>> -{
>> -	struct rproc *rproc = filp->private_data;
>> -	char *buf = rproc->recovery_disabled ? "disabled\n" : "enabled\n";
>> -
>> -	return simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf));
>> -}
>> -
>> -/*
>> - * By writing to the 'recovery' debugfs entry, we control the behavior of the
>> - * recovery mechanism dynamically. The default value of this entry is "enabled".
>> - *
>> - * The 'recovery' debugfs entry supports these commands:
>> - *
>> - * enabled:	When enabled, the remote processor will be automatically
>> - *		recovered whenever it crashes. Moreover, if the remote
>> - *		processor crashes while recovery is disabled, it will
>> - *		be automatically recovered too as soon as recovery is enabled.
>> - *
>> - * disabled:	When disabled, a remote processor will remain in a crashed
>> - *		state if it crashes. This is useful for debugging purposes;
>> - *		without it, debugging a crash is substantially harder.
>> - *
>> - * recover:	This function will trigger an immediate recovery if the
>> - *		remote processor is in a crashed state, without changing
>> - *		or checking the recovery state (enabled/disabled).
>> - *		This is useful during debugging sessions, when one expects
>> - *		additional crashes to happen after enabling recovery. In this
>> - *		case, enabling recovery will make it hard to debug subsequent
>> - *		crashes, so it's recommended to keep recovery disabled, and
>> - *		instead use the "recover" command as needed.
>> - */
>> -static ssize_t
>> -rproc_recovery_write(struct file *filp, const char __user *user_buf,
>> -		     size_t count, loff_t *ppos)
>> -{
>> -	struct rproc *rproc = filp->private_data;
>> -	char buf[10];
>> -	int ret;
>> -
>> -	if (count < 1 || count > sizeof(buf))
>> -		return -EINVAL;
>> -
>> -	ret = copy_from_user(buf, user_buf, count);
>> -	if (ret)
>> -		return -EFAULT;
>> -
>> -	/* remove end of line */
>> -	if (buf[count - 1] == '\n')
>> -		buf[count - 1] = '\0';
>> -
>> -	if (!strncmp(buf, "enabled", count)) {
>> -		/* change the flag and begin the recovery process if needed */
>> -		rproc->recovery_disabled = false;
>> -		rproc_trigger_recovery(rproc);
>> -	} else if (!strncmp(buf, "disabled", count)) {
>> -		rproc->recovery_disabled = true;
>> -	} else if (!strncmp(buf, "recover", count)) {
>> -		/* begin the recovery process without changing the flag */
>> -		rproc_trigger_recovery(rproc);
>> -	} else {
>> -		return -EINVAL;
>> -	}
>> -
>> -	return count;
>> -}
>> -
>> -static const struct file_operations rproc_recovery_ops = {
>> -	.read = rproc_recovery_read,
>> -	.write = rproc_recovery_write,
>> -	.open = simple_open,
>> -	.llseek = generic_file_llseek,
>> -};
>> -
>>  /* expose the crash trigger via debugfs */
>>  static ssize_t
>>  rproc_crash_write(struct file *filp, const char __user *user_buf,
>> @@ -329,8 +253,6 @@ void rproc_create_debug_dir(struct rproc *rproc)
>>  
>>  	debugfs_create_file("name", 0400, rproc->dbg_dir,
>>  			    rproc, &rproc_name_ops);
>> -	debugfs_create_file("recovery", 0600, rproc->dbg_dir,
>> -			    rproc, &rproc_recovery_ops);
>>  	debugfs_create_file("crash", 0200, rproc->dbg_dir,
>>  			    rproc, &rproc_crash_ops);
>>  	debugfs_create_file("resource_table", 0400, rproc->dbg_dir,
>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
>> index 2a44571..e60a014 100644
>> --- a/drivers/remoteproc/remoteproc_sysfs.c
>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
>> @@ -10,6 +10,61 @@
>>  
>>  #define to_rproc(d) container_of(d, struct rproc, dev)
>>  
>> +static ssize_t recovery_show(struct device *dev,
>> +			     struct device_attribute *attr, char *buf)
>> +{
>> +	struct rproc *rproc = to_rproc(dev);
>> +
>> +	return sprintf(buf, "%s", rproc->recovery_disabled ? "disabled\n" : "enabled\n");
>> +}
>> +
>> +/*
>> + * By writing to the 'recovery' sysfs entry, we control the behavior of the
>> + * recovery mechanism dynamically. The default value of this entry is "enabled".
>> + *
>> + * The 'recovery' sysfs entry supports these commands:
>> + *
>> + * enabled:	When enabled, the remote processor will be automatically
>> + *		recovered whenever it crashes. Moreover, if the remote
>> + *		processor crashes while recovery is disabled, it will
>> + *		be automatically recovered too as soon as recovery is enabled.
>> + *
>> + * disabled:	When disabled, a remote processor will remain in a crashed
>> + *		state if it crashes. This is useful for debugging purposes;
>> + *		without it, debugging a crash is substantially harder.
>> + *
>> + * recover:	This function will trigger an immediate recovery if the
>> + *		remote processor is in a crashed state, without changing
>> + *		or checking the recovery state (enabled/disabled).
>> + *		This is useful during debugging sessions, when one expects
> 
> Recovery seems to be related to debugging, is it wise to expose it in sysfs?
> This would allow the user space to restart remote processor and generate core
> dumps at any time...Is this the expected behavior?

This comment is wrong, please forget it. I mixed with some code from last Kernel LTS.
The state is checked in rproc_trigger_recovery, so no issue.

My apologize for this stupid comment. 

Regards
Arnaud

> 
> For your information, in the ST test suite, we use this mechanism also to simulate a
> proc crash. This is useful for testing the recovery of RPMsg channels...
> 
> Regards
> Arnaud
> 
>> + *		additional crashes to happen after enabling recovery. In this
>> + *		case, enabling recovery will make it hard to debug subsequent
>> + *		crashes, so it's recommended to keep recovery disabled, and
>> + *		instead use the "recover" command as needed.
>> + */
>> +static ssize_t recovery_store(struct device *dev,
>> +			      struct device_attribute *attr,
>> +			      const char *buf, size_t count)
>> +{
>> +	struct rproc *rproc = to_rproc(dev);
>> +
>> +	if (sysfs_streq(buf, "enabled")) {
>> +		/* change the flag and begin the recovery process if needed */
>> +		rproc->recovery_disabled = false;
>> +		rproc_trigger_recovery(rproc);
>> +	} else if (sysfs_streq(buf, "disabled")) {
>> +		rproc->recovery_disabled = true;
>> +	} else if (sysfs_streq(buf, "recover")) {
>> +		/* begin the recovery process without changing the flag */
>> +		rproc_trigger_recovery(rproc);
>> +	} else {
>> +		return -EINVAL;
>> +	}
>> +
>> +	return count;
>> +}
>> +static DEVICE_ATTR_RW(recovery);
>> +
>>  /*
>>   * A coredump-configuration-to-string lookup table, for exposing a
>>   * human readable configuration via sysfs. Always keep in sync with
>> @@ -202,6 +257,7 @@ static DEVICE_ATTR_RO(name);
>>  
>>  static struct attribute *rproc_attrs[] = {
>>  	&dev_attr_coredump.attr,
>> +	&dev_attr_recovery.attr,
>>  	&dev_attr_firmware.attr,
>>  	&dev_attr_state.attr,
>>  	&dev_attr_name.attr,
>>
