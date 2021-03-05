Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6458932E6A2
	for <lists+linux-remoteproc@lfdr.de>; Fri,  5 Mar 2021 11:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbhCEKq2 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 5 Mar 2021 05:46:28 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:39589 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229558AbhCEKqV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 5 Mar 2021 05:46:21 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 125AcLOY026340;
        Fri, 5 Mar 2021 11:46:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=e8RgWyuTLeswgNcGA3ifo/dI3vZUFn59Nt++mY73tcI=;
 b=VonhnXj3mFxSVt4fitfX6UjULmCRSRubQAuM/KrvVZQYZA2ouOHyqHGFDp1YJ8DEB9ro
 I0QcpwTClTRndysEA8HG/jmCKXNlxHoyd7LCH/G1z4qX8z85WYmyEAb6qdepctdKo3mQ
 88yjp/BA+l36bpxpKuwSTW/Qxyi5M8IwTArCu0e8IQsvq8kU2s1WERqTrjYaKMRRkNTA
 CFM8txCfIsXKACS9iBZ3BTsn4iiJdZmJgsCWUY7WMvNw7mRr/C3gvAiyHzqpuvVv0pUz
 RjIJpFqj3Z3/JpnysWjFkKRCNb8WuOP/ELMyanHLuMOvdtVPwgayUcPZXHhL1Xnb+7mU TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36yfc4dq0k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 Mar 2021 11:46:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9D66910002A;
        Fri,  5 Mar 2021 11:46:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 85D252425CB;
        Fri,  5 Mar 2021 11:46:14 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Mar
 2021 11:46:13 +0100
Subject: Re: [PATCH v5 08/16] rpmsg: glink: add sendto and trysendto ops
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-9-arnaud.pouliquen@foss.st.com>
 <20210304191129.GE3854911@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <e0f60693-3184-55c1-db67-1725a5f9c24d@foss.st.com>
Date:   Fri, 5 Mar 2021 11:46:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304191129.GE3854911@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-05_05:2021-03-03,2021-03-05 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 3/4/21 8:11 PM, Mathieu Poirier wrote:
> On Fri, Feb 19, 2021 at 12:14:53PM +0100, Arnaud Pouliquen wrote:
>> Implement the sendto ops to support the future rpmsg_char update for the
>> vitio backend support.
> 
> Add a new line, otherwise it is very easy to read.
> 
>> The use of sendto in rpmsg_char is needed as a destination address is
>> requested at least by the virtio backend.
> 
> Same here and throughout the patchset.
> 
>> The glink implementation does not need a destination address so ignores it.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/qcom_glink_native.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
>> index d4e4dd482614..ae2c03b59c55 100644
>> --- a/drivers/rpmsg/qcom_glink_native.c
>> +++ b/drivers/rpmsg/qcom_glink_native.c
>> @@ -1332,6 +1332,20 @@ static int qcom_glink_trysend(struct rpmsg_endpoint *ept, void *data, int len)
>>  	return __qcom_glink_send(channel, data, len, false);
>>  }
>>  
>> +static int qcom_glink_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
>> +{
>> +	struct glink_channel *channel = to_glink_channel(ept);
>> +
>> +	return __qcom_glink_send(channel, data, len, true);
>> +}
>> +
>> +static int qcom_glink_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
>> +{
>> +	struct glink_channel *channel = to_glink_channel(ept);
>> +
>> +	return __qcom_glink_send(channel, data, len, false);
>> +}
> 
> Just rename send() to sendto() and trysend() to trysendto() and ignore the
> destination address.  

Function prototypes have to match with rpmsg_endpoint_ops structure defined
below. So seems to me not possible to just rename the functions.
Please could you clarify if i missed something?

> The same goes for the next patch.  I would fold patch 08
> and 09 into 10 to help get the big picture.

I'm going to squash all in one.

Thanks,
Arnaud

> 
>> +
>>  /*
>>   * Finds the device_node for the glink child interested in this channel.
>>   */
>> @@ -1364,7 +1378,9 @@ static const struct rpmsg_device_ops glink_device_ops = {
>>  static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
>>  	.destroy_ept = qcom_glink_destroy_ept,
>>  	.send = qcom_glink_send,
>> +	.sendto = qcom_glink_sendto,
>>  	.trysend = qcom_glink_trysend,
>> +	.trysendto = qcom_glink_trysendto,
>>  };
>>  
>>  static void qcom_glink_rpdev_release(struct device *dev)
>> -- 
>> 2.17.1
>>
