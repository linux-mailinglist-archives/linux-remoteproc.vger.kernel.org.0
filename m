Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2CA98A371
	for <lists+linux-remoteproc@lfdr.de>; Mon, 12 Aug 2019 18:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfHLQgM (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 12 Aug 2019 12:36:12 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59644 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfHLQgM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Aug 2019 12:36:12 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7CGa5w7038570;
        Mon, 12 Aug 2019 11:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565627765;
        bh=T2phpgm+NARzJAyCB2+UTr9p6Cxo5E7SZBGs4Cpo3zo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LpKMdEDMQhXB4jMb2oafcKkPFCB8q7ubinXIphDr0YOVHeNKsWh7ytwbeM5Pt5iAW
         NIUORjWZKvwnyPovIlEnqLTh6zJacNOGBStB6M0y7/7peLmIwqUzxTVQIxCkUdFUgY
         fR8O6VolvFyHcjTGLVuov7p0VMn196fLsLTp+zOs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7CGa5xS076195
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 12 Aug 2019 11:36:05 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 12
 Aug 2019 11:36:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 12 Aug 2019 11:36:04 -0500
Received: from [10.250.88.190] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7CGa4Fa112134;
        Mon, 12 Aug 2019 11:36:04 -0500
Subject: Re: [PATCH] rpmsg: virtio_rpmsg_bus: replace "%p" with "%pK"
To:     Suman Anna <s-anna@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>,
        Loic Pallardy <loic.pallardy@st.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20181024011909.21674-1-s-anna@ti.com>
 <1cc3d697-6fde-901b-2e35-2e2b53b44425@ti.com>
 <2ef5e274-df09-c3a0-41ed-a945d1902eaf@ti.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <92dc4403-8782-8dbf-b912-cc832ac748a7@ti.com>
Date:   Mon, 12 Aug 2019 12:36:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2ef5e274-df09-c3a0-41ed-a945d1902eaf@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 8/12/19 12:28 PM, Suman Anna wrote:
> On 8/12/19 10:47 AM, Andrew F. Davis wrote:
>> On 10/23/18 9:19 PM, Suman Anna wrote:
>>> The virtio_rpmsg_bus driver uses the "%p" format-specifier for
>>> printing the vring buffer address. This prints only a hashed
>>> pointer even for previliged users. Use "%pK" instead so that
>>> the address can be printed during debug using kptr_restrict
>>> sysctl.
>>>
>>
>>
>> s/previliged/privileged
> 
> Bjorn,
> Can you fix this up when applying.
> 
>>
>> You describe what the code does, but not why you need this. %pK is used
>> for only about 1% of pointer printing, why do you want to leak this
>> address to userspace at all?
> 
> Andrew,
> Default behavior of %pK is same as %p, but it does allow you to control
> the print. The reason is clearly mentioned in the last sentence in the
> patch description.
> 


Let me rephrase then, why would you ever set 'kptr_restrict' to anything
other than 0, or why do you want to be able to leak this address to
userspace at all? If the answer is just because you can, then all 12,000
instances of %p in kernel could be converted for the same reason.

Andrew


> regards
> Suman
> 
>>
>> Andrew
>>
>>
>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>> ---
>>>  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>>> index f29dee731026..1345f373a1a0 100644
>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>> @@ -950,7 +950,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>  		goto vqs_del;
>>>  	}
>>>  
>>> -	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
>>> +	dev_dbg(&vdev->dev, "buffers: va %pK, dma %pad\n",
>>>  		bufs_va, &vrp->bufs_dma);
>>>  
>>>  	/* half of the buffers is dedicated for RX */
>>>
> 
