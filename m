Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66A4B62022
	for <lists+linux-remoteproc@lfdr.de>; Mon,  8 Jul 2019 16:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbfGHOLu (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 8 Jul 2019 10:11:50 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:9898 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731688AbfGHOLu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Jul 2019 10:11:50 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x68DvEfR027228;
        Mon, 8 Jul 2019 16:11:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=9ZEwWzg0Uii4givxH0OJnLeNumN/o+1u2NNv8phcpRs=;
 b=h0RK36rZGv+rpVsFpRfkdxTBMavvMhcNfqzJJsMwkZT3MRVCgUaLxVeknh79xllZCANZ
 n/b5TPtU7D4pGVNOH4vjCz4ZgCCpKDeGvhsTeMsmVrbfGmEZOO5SpmmwQEiIXGm/Cyt5
 UbiL8kMIFaefrZdFLrm61+4BnWedlug7w/bMQc+iqSvc3mYqr2Pp9R3zd+kUEOo/sHPy
 grE8rl4kQGczFjRrKqlnWdUPm5JmtsWTddkH8SYrhkmZJKkx/kLsa+z+jrt+vmW7mDqZ
 S7jystz8dpbdo9UuzNW2YZOyYS1nnJiYf3WW8hTFmNK/NaDQy2gHVWdgl/qISWRXNt7T /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2tjgs9qhc4-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 08 Jul 2019 16:11:35 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 23C9A34;
        Mon,  8 Jul 2019 14:11:33 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F22EC5283;
        Mon,  8 Jul 2019 14:11:32 +0000 (GMT)
Received: from [10.48.0.131] (10.75.127.51) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 8 Jul
 2019 16:11:32 +0200
Subject: Re: [EXT] Re: [RFC 2/2] rpmsg: imx: add the initial imx rpmsg support
To:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
CC:     "loic.pallardy@st.com" <loic.pallardy@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "elder@linaro.org" <elder@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <1561968784-1124-1-git-send-email-hongxing.zhu@nxp.com>
 <1561968784-1124-3-git-send-email-hongxing.zhu@nxp.com>
 <3e0a061c-4f5e-ac32-031d-909a48644265@pengutronix.de>
 <AM0PR0402MB35706FFBFD76FF81BCF5E6018CF60@AM0PR0402MB3570.eurprd04.prod.outlook.com>
 <e4629709-fbe7-6af9-3cee-309b2ec1892f@pengutronix.de>
From:   Arnaud Pouliquen <arnaud.pouliquen@st.com>
Openpgp: preference=signencrypt
Autocrypt: addr=arnaud.pouliquen@st.com; prefer-encrypt=mutual; keydata=
 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
 8mOik8I/F6EW8XyQAA2P
Message-ID: <fcdd6392-75f4-716d-5dbd-1828a679b25f@st.com>
Date:   Mon, 8 Jul 2019 16:11:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <e4629709-fbe7-6af9-3cee-309b2ec1892f@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-08_04:,,
 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Richard,

On 7/8/19 1:02 PM, Oleksij Rempel wrote:
> Hi Richard,
> 
> On 08.07.19 12:17, Richard Zhu wrote:
>> Hi Oleksij:
>> Thanks for your comments.
>>
>>
>>> -----Original Message-----
>>> From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
>>> Sent: 2019年7月4日 17:36
>>> To: Richard Zhu <hongxing.zhu@nxp.com>; ohad@wizery.com;
>>> bjorn.andersson@linaro.org; linux-remoteproc@vger.kernel.org
>>> Cc: linux-arm-kernel@lists.infradead.org; Fabien DESSENNE
>>> <fabien.dessenne@st.com>; loic.pallardy@st.com; arnaud.pouliquen@st.com;
>>> s-anna@ti.com; elder@linaro.org
>>> Subject: [EXT] Re: [RFC 2/2] rpmsg: imx: add the initial imx rpmsg
>>> support
>>>
>>> Caution: EXT Email
>>>
>>> Hi Richard,
>>>
>>> On 01.07.19 10:34, Richard Zhu wrote:
>>>> Based on "virtio_rpmsg_bus" driver, This patch-set is used to set up
>>>> the communication mechanism between A core and M core on i.MX AMP
>>> SOCs.
>>>>
>>>> Add the initial imx rpmsg support glue driver and one pingpong demo,
>>>> demonstrated the data transactions between A core and remote M core.
>>>> Distributed framework is used in IMX RPMSG implementation, refer to
>>>> the following requirements:
>>>>     - The CAN functions contained in M core and RTOS should be ready
>>>> and
>>>>       complete functional in 50ms after AMP system is turned on.
>>>>     - Partition reset. System wouldn't be stalled by the exceptions
>>>> (e.x
>>>>       the reset triggered by the system hang) occurred at the other
>>>> side.
>>>>       And the RPMSG mechanism should be recovered automactilly after
>>> the
>>>>       partition reset is completed.
>>>> In this scenario, the M core and RTOS would be kicked off by
>>>> bootloader firstly, then A core and Linux would be loaded later. Both
>>>> M core/RTOS and A core/Linux are running independly.
>>>>
>>>> One physical memory region used to store the vring is mandatory
>>>> required to pre-reserved and well-knowned by both A core and M core
>>>
>>> I don't see any thing imx specific in this patch. We already have
>>> remoteproc
>>> which would parse firmware header and create needed devices. This
>>> driver is
>>> only needed for the case where firmware was stared by the bootloader.
>>>
>> [Richard Zhu] Bootloader starts the firmware is mandatory required in
>> these scenario
>> refer to the reasons listed in the commit.
>> Thus, the distributed framework has to be used, and both A core/Linux
>> and remote core/RTOS
>> works independently.
>>
>>> I personally would prefer to have generic driver or extend the
>>> remoteproc
>>> framework. So we can notify kernel about work already done by
>>> bootloader.
>>>
>> [Richard Zhu] Thanks for your suggestions.
>> Regarding to my understand, it seems that master/slave mode is used in
>> the remoteproc currently.
>> A core/Linux acts as master, to controls/manipulates remote core/RTOS.
>> It isn't applicable for the scenario described by this patch-set.
>>
>>> In general, some more issues should be solved:
>>> - Handle or not touch idle clocks for different node used by M core
>>> and not
>>> main system.
>>> - pin control
>>> - regulators
>>>
>>> ST devs already tried to solve this issues by creating "remoteproc:
>>> add system
>>> resource manager device" patch. I don't know what is current state of
>>> it (/me
>>> adding ST devs to CC).
The resource manager implementation as been proposed but no real
adhesion of the community on it... Perhaps SCMI should be a candidate...

>>>
>> [Richard Zhu] Yes, it is. Many contributions have been made by Fabien.
>> IMHO, there are some different behaviors on iMX8QXP/QM platforms, the
>>   resources (e.x IP modules) had been assigned and managed by the XRDC.
>> In the other words, the HW resources would be assigned and managed would
>>   be transparent to SW.
>>
>> Thus, both A core/Linux and M core/RTOS can work real independently.
>> System wouldn't be stalled by the exceptions (e.x the reset triggered
>> by the
>> system hang) occurred at the other side. And the RPMSG mechanism should
>>   be recovered automatically after the partition reset is completed.
> 
> It is exactly the way I did understood it in the firs mail. Any way, i'm ok
> with this driver. Just rename imx to some thing generic. This driver can
> and will be reused on other platforms as well.
> 
> Kind regards,
> Oleksij Rempel
> 

I'm trying to figure out what is the interest of these drivers vs
existing ones.
Please find below a list of features i noticed in your driver (don't
hesitate if i missed some of them), with some comments/questions.

1) The coprocessor is started before the one running Linux OS.
Have you taken a look to this set of patches proposed by Loic:
https://lkml.org/lkml/2018/11/30/157
with this patch you should be able to"attach" on the fly on a preloaded
firmware.

2) RPMSG recovery
Agree with you, this feature is important in AMP systems, as cores can
have their own live cycle.

But I can not see related code, could you point out it to me?

Could you explain How do you recover the rpmsg channels that has been
already established?
For instance what happen if your coprocessor crash during the rpmsg
pingpong demo?

3) ping-pong demo sample
Perhaps you could re-use the rpmsg sample available here:
https://elixir.bootlin.com/linux/v5.2/source/samples/rpmsg

4) No use of the resource table
Is there a reason to not use the resource table to declare the the
vrings? Your implementation seems to impose the same definition in both
firmware while resource table allow to share them.
Furthermore the resource table could be updated by the Linux before the
remote proc is started (in case of Linux booting first)

5) slave and master mode support.
Seems that this drivers not fully respect the virtio protocol (for
instance status field). If you use a synchro mechanism (mailbox...) not
sure that you really need to be virtio slave on Linux.

Thanks,
Arnaud
