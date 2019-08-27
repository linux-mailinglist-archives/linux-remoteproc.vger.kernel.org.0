Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A31999F401
	for <lists+linux-remoteproc@lfdr.de>; Tue, 27 Aug 2019 22:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbfH0UZQ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 27 Aug 2019 16:25:16 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38032 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbfH0UZP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 27 Aug 2019 16:25:15 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7RKP70B093527;
        Tue, 27 Aug 2019 15:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566937507;
        bh=gEFdEpF3+WHvpWSJY5udGgk0X9B9uxOZiubUNpvloVw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=gcOryOkGkUDvclbsETxSdDLvTp8FonXjm/u4yweBik1ycTS8nZcVasBirRn4DeKBN
         4DFdcUTmNi8isNNyhJxCTXIirpZLs+VBkjAVsjsarVL93BGGH2IEHH1+IjQyuKEAty
         jOs/TJeujygUh250pCOKKxZH7xsIXLHgtic7mSvY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7RKP7RV064462
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 27 Aug 2019 15:25:07 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 15:25:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 15:25:06 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7RKP6DQ070466;
        Tue, 27 Aug 2019 15:25:06 -0500
Subject: Re: [PATCH] rpmsg: virtio_rpmsg_bus: replace "%p" with "%pK"
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>,
        Loic Pallardy <loic.pallardy@st.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20181024011909.21674-1-s-anna@ti.com>
 <40831f80-1e36-66ca-b8e5-684d46ba167e@ti.com> <20190827051007.GK1263@builder>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <8d36d695-dd66-c21f-f49e-f6dc3dbdfc5a@ti.com>
Date:   Tue, 27 Aug 2019 15:25:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190827051007.GK1263@builder>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn,

On 8/27/19 12:10 AM, Bjorn Andersson wrote:
> On Fri 09 Aug 13:25 PDT 2019, Suman Anna wrote:
> 
>> Hi Bjorn,
>>
> 
> Hi Suman
> 
>> On 10/23/18 8:19 PM, Suman Anna wrote:
>>> The virtio_rpmsg_bus driver uses the "%p" format-specifier for
>>> printing the vring buffer address. This prints only a hashed
>>> pointer even for previliged users. Use "%pK" instead so that
>>> the address can be printed during debug using kptr_restrict
>>> sysctl.
>>
>> Seems to have been lost among the patches, can you pick up this trivial
>> patch for 5.4? Should apply cleanly on the latest HEAD as well.
>>
> 
> I share Andrew's question regarding what benefit you have from knowing
> this value. Should we not just remove the va from the print? Or do you
> actually have a use case for it?.

I mainly use it during debug when comparing against kernel_page_tables
and vmallocinfo. The pools that we use are not always guaranteed to be
from linear memory, and behavior changes when using with CMA or DMA pools.

Note that usage of %pK does not leak the addresses automatically, but
atleast enables me to get the values when needed. The changes also bring
the usage in rpmsg core in sync with the remoteproc core.

regards
Suman

> 
> Regards,
> Bjorn
> 
>> regards
>> Suman
>>
>>>
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
>>

