Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898CD29021E
	for <lists+linux-remoteproc@lfdr.de>; Fri, 16 Oct 2020 11:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406220AbgJPJlz (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 16 Oct 2020 05:41:55 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:3600 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2406172AbgJPJly (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 16 Oct 2020 05:41:54 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09G9QYZa032671;
        Fri, 16 Oct 2020 11:41:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Ie1OsdSA7jA5QDXB/p9XO8SD6QLOawur6DZD23ViLfo=;
 b=EADXsIISY5/7eT9MR+ELAsI8qnNQ0RtdIxpzaNs7P6SR5ALZUD8kGiq/fpETOf32v9f3
 9A1deTugiPPMniPWpj3B/AFN1NQjQv4PMxykGfpOR6Zds1tQB6ulBcGNm6ztdikwG502
 6HAK4RqQxd1hd414i9h6la3xH/B76Rt9fGrWPBSgg3BkV+IUswLFAdJqdBzuXqEyL/F6
 5X3q1Y4rK6yvREGSIIX3l/Y3uBeQ2szP9Ap8gmX9aZPS9uutr54ZZ/UXWmje64SxqJQ0
 yujwS/lsTpYN+H+dnrwdM5uzNr4AL/Xvb6eWEarFC7zn35jijViIKQxynJmuEKoX0KLB iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34353wv5w3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Oct 2020 11:41:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7908610002A;
        Fri, 16 Oct 2020 11:41:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 63BEC2FAA1C;
        Fri, 16 Oct 2020 11:41:45 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 11:41:44 +0200
Subject: Re: [PATCH v2 2/9] rpmsg: Introduce __rpmsg{16|32|64} types
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "guennadi.liakhovetski@linux.intel.com" 
        <guennadi.liakhovetski@linux.intel.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
 <20201013232519.1367542-3-mathieu.poirier@linaro.org>
 <03448851-b959-3f56-5618-d31a7b712392@st.com>
 <20201015193243.GD1450102@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <b5635aa9-c3e2-78ba-13ae-bfee1e429537@st.com>
Date:   Fri, 16 Oct 2020 11:41:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201015193243.GD1450102@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-16_05:2020-10-16,2020-10-16 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/15/20 9:32 PM, Mathieu Poirier wrote:
> Good day,
> 
> On Wed, Oct 14, 2020 at 06:31:49PM +0200, Arnaud POULIQUEN wrote:
>> Hi Mathieu,
>>
>> On 10/14/20 1:25 AM, Mathieu Poirier wrote:
>>> Introduce __rpmsg{16|32|64} types along with byte order conversion
>>> functions based on an rpmsg_device operation as a foundation to
>>> make RPMSG modular and transport agnostic.
>>>
>>> Suggested-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
>>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> ---
>>>  include/linux/rpmsg.h            | 51 ++++++++++++++++++++++++
>>>  include/linux/rpmsg_byteorder.h  | 67 ++++++++++++++++++++++++++++++++
>>>  include/uapi/linux/rpmsg_types.h | 11 ++++++
>>>  3 files changed, 129 insertions(+)
>>>  create mode 100644 include/linux/rpmsg_byteorder.h
>>>  create mode 100644 include/uapi/linux/rpmsg_types.h
>>>
>>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
>>> index 9fe1c54ae995..165e4c6d4cd3 100644
>>> --- a/include/linux/rpmsg.h
>>> +++ b/include/linux/rpmsg.h
>>> @@ -17,6 +17,7 @@
>>>  #include <linux/kref.h>
>>>  #include <linux/mutex.h>
>>>  #include <linux/poll.h>
>>> +#include <linux/rpmsg_byteorder.h>
>>>  
>>>  #define RPMSG_ADDR_ANY		0xFFFFFFFF
>>>  
>>> @@ -40,6 +41,7 @@ typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
>>>  
>>>  /**
>>>   * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
>>> + * @is_little_endian:	returns true if using little endian byte ordering
>>>   * @create_ept:		create backend-specific endpoint, required
>>>   * @announce_create:	announce presence of new channel, optional
>>>   * @announce_destroy:	announce destruction of channel, optional
>>> @@ -49,6 +51,7 @@ typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
>>>   * advertise new channels implicitly by creating the endpoints.
>>>   */
>>>  struct rpmsg_device_ops {
>>> +	bool (*is_little_endian)(struct rpmsg_device *rpdev);
>>>  	struct rpmsg_endpoint *(*create_ept)(struct rpmsg_device *rpdev,
>>>  					    rpmsg_rx_cb_t cb, void *priv,
>>>  					    struct rpmsg_channel_info chinfo);
>>> @@ -129,6 +132,54 @@ struct rpmsg_driver {
>>>  	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
>>>  };
>>>  
>>> +static inline u16 rpmsg16_to_cpu(struct rpmsg_device *rpdev, __rpmsg16 val)
>>> +{
>>> +	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
>>> +		return __rpmsg16_to_cpu(rpmsg_is_little_endian(), val);
>>> +	else
>>> +		return __rpmsg16_to_cpu(rpdev->ops->is_little_endian(rpdev), val);
>>> +}
>>> +
>>> +static inline __rpmsg16 cpu_to_rpmsg16(struct rpmsg_device *rpdev, u16 val)
>>> +{
>>> +	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
>>> +		return __cpu_to_rpmsg16(rpmsg_is_little_endian(), val);
>>> +	else
>>> +		return __cpu_to_rpmsg16(rpdev->ops->is_little_endian(rpdev), val);
>>> +}
>>> +
>>> +static inline u32 rpmsg32_to_cpu(struct rpmsg_device *rpdev, __rpmsg32 val)
>>> +{
>>> +	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
>>> +		return __rpmsg32_to_cpu(rpmsg_is_little_endian(), val);
>>> +	else
>>> +		return __rpmsg32_to_cpu(rpdev->ops->is_little_endian(rpdev), val);
>>> +}
>>> +
>>> +static inline __rpmsg32 cpu_to_rpmsg32(struct rpmsg_device *rpdev, u32 val)
>>> +{
>>> +	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
>>> +		return __cpu_to_rpmsg32(rpmsg_is_little_endian(), val);
>>> +	else
>>> +		return __cpu_to_rpmsg32(rpdev->ops->is_little_endian(rpdev), val);
>>> +}
>>> +
>>> +static inline u64 rpmsg64_to_cpu(struct rpmsg_device *rpdev, __rpmsg64 val)
>>> +{
>>> +	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
>>> +		return __rpmsg64_to_cpu(rpmsg_is_little_endian(), val);
>>> +	else
>>> +		return __rpmsg64_to_cpu(rpdev->ops->is_little_endian(rpdev), val);
>>> +}
>>> +
>>> +static inline __rpmsg64 cpu_to_rpmsg64(struct rpmsg_device *rpdev, u64 val)
>>> +{
>>> +	if (!rpdev || !rpdev->ops || !rpdev->ops->is_little_endian)
>>> +		return __cpu_to_rpmsg64(rpmsg_is_little_endian(), val);
>>> +	else
>>> +		return __cpu_to_rpmsg64(rpdev->ops->is_little_endian(rpdev), val);
>>> +}
>>> +
>>>  #if IS_ENABLED(CONFIG_RPMSG)
>>>  
>>>  int register_rpmsg_device(struct rpmsg_device *dev);
>>> diff --git a/include/linux/rpmsg_byteorder.h b/include/linux/rpmsg_byteorder.h
>>> new file mode 100644
>>> index 000000000000..c0f565dbad6d
>>> --- /dev/null
>>> +++ b/include/linux/rpmsg_byteorder.h
>>> @@ -0,0 +1,67 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Follows implementation found in linux/virtio_byteorder.h
>>> + */
>>> +#ifndef _LINUX_RPMSG_BYTEORDER_H
>>> +#define _LINUX_RPMSG_BYTEORDER_H
>>> +#include <linux/types.h>
>>> +#include <uapi/linux/rpmsg_types.h>
>>> +
>>> +static inline bool rpmsg_is_little_endian(void)
>>> +{
>>> +#ifdef __LITTLE_ENDIAN
>>> +	return true;
>>> +#else
>>> +	return false;
>>> +#endif
>>> +}
>>
>> A suggestion:
>>
>> static inline bool rpmsg_is_little_endian(void)
>> #if defined(__BYTE_ORDER)
>> #  if __BYTE_ORDER == __BIG_ENDIAN
>> 	return true;
>> #  elif __BYTE_ORDER == __LITTLE_ENDIAN
>> 	return false;
>> #  else
>> #    warning "unknown endianess, set to little by default"
>> 	return true;
>> #  endif
>> #endif
>> }
> 
> I found that __BYTE_ORDER is not defined stm32mp157 - have you used it before? 

Good point! it seems not defined for some architectures...something strange is that
it is used in some generic code (e.g.[1]) but it works considering little by default... 

I saw this implementation in Linux kernel code, for instance [2].
that's said,  __LITTLE_ENDIAN or __BIG_ENDIAN seems always defined regarding [3].
So just forget this suggestion...

[1]https://elixir.bootlin.com/linux/latest/source/include/math-emu/double.h#L59
[2]https://elixir.bootlin.com/linux/latest/source/tools/lib/bpf/btf.c#L506
[3]https://elixir.bootlin.com/linux/latest/source/include/linux/kconfig.h#L12

> 
>>
>> Otherwise
>>
>> Reviewed-by:  Arnaud Pouliquen <arnaud.pouliquen@st.com>
>>
>> Thanks,
>> Arnaud
>>
>>> +
>>> +static inline u16 __rpmsg16_to_cpu(bool little_endian, __rpmsg16 val)
>>> +{
>>> +	if (little_endian)
>>> +		return le16_to_cpu((__force __le16)val);
>>> +	else
>>> +		return be16_to_cpu((__force __be16)val);
>>> +}
>>> +
>>> +static inline __rpmsg16 __cpu_to_rpmsg16(bool little_endian, u16 val)
>>> +{
>>> +	if (little_endian)
>>> +		return (__force __rpmsg16)cpu_to_le16(val);
>>> +	else
>>> +		return (__force __rpmsg16)cpu_to_be16(val);
>>> +}
>>> +
>>> +static inline u32 __rpmsg32_to_cpu(bool little_endian, __rpmsg32 val)
>>> +{
>>> +	if (little_endian)
>>> +		return le32_to_cpu((__force __le32)val);
>>> +	else
>>> +		return be32_to_cpu((__force __be32)val);
>>> +}
>>> +
>>> +static inline __rpmsg32 __cpu_to_rpmsg32(bool little_endian, u32 val)
>>> +{
>>> +	if (little_endian)
>>> +		return (__force __rpmsg32)cpu_to_le32(val);
>>> +	else
>>> +		return (__force __rpmsg32)cpu_to_be32(val);
>>> +}
>>> +
>>> +static inline u64 __rpmsg64_to_cpu(bool little_endian, __rpmsg64 val)
>>> +{
>>> +	if (little_endian)
>>> +		return le64_to_cpu((__force __le64)val);
>>> +	else
>>> +		return be64_to_cpu((__force __be64)val);
>>> +}
>>> +
>>> +static inline __rpmsg64 __cpu_to_rpmsg64(bool little_endian, u64 val)
>>> +{
>>> +	if (little_endian)
>>> +		return (__force __rpmsg64)cpu_to_le64(val);
>>> +	else
>>> +		return (__force __rpmsg64)cpu_to_be64(val);
>>> +}
>>> +
>>> +#endif /* _LINUX_RPMSG_BYTEORDER_H */
>>> diff --git a/include/uapi/linux/rpmsg_types.h b/include/uapi/linux/rpmsg_types.h
>>> new file mode 100644
>>> index 000000000000..36e3b9404391
>>> --- /dev/null
>>> +++ b/include/uapi/linux/rpmsg_types.h
>>> @@ -0,0 +1,11 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>>> +#ifndef _UAPI_LINUX_RPMSG_TYPES_H
>>> +#define _UAPI_LINUX_RPMSG_TYPES_H
>>> +
>>> +#include <linux/types.h>
>>> +
>>> +typedef __u16 __bitwise __rpmsg16;
>>> +typedef __u32 __bitwise __rpmsg32;
>>> +typedef __u64 __bitwise __rpmsg64;
>>> +
>>> +#endif /* _UAPI_LINUX_RPMSG_TYPES_H */
>>>
