Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4B41633C0
	for <lists+linux-remoteproc@lfdr.de>; Tue,  9 Jul 2019 11:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbfGIJ5K (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 9 Jul 2019 05:57:10 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:14400 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726126AbfGIJ5J (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Jul 2019 05:57:09 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x699uLIi017063;
        Tue, 9 Jul 2019 11:56:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=yLeGG8TEmYv1y5liPEJPaZpv4gzdRKx60rdCuR+Y050=;
 b=mtedViXkYppyq3RXhuhtuMVJA6K1AKQZ2WbaJCAMYfc6W2Xvo4JjrUFqSgmnebGC3Tcz
 RzH8G5Lmuy2sFzzw7YjebF+oVJouJEfUN2tUfme+U6chYaKy0ygKRWcGwfYDbOW2pR6E
 nrKaccG+Qe/z3tZEpe29JDrtWcJFlf6Avpa0eiVXLD9jobYF1fKCJz2ivF+7SRcEC9Sg
 HBEk3XuQSaE4JjXbTtouLA9IGDRf3uAe8S/6NRqVrHJw9BHqUsLvFCCymnvpRcgPp/22
 INuQ1aWwP7lA4J+JWx8T5y/ssNHjrAh7as5cxkXVBXxJulsStmZdnHHD/XMx0PMSDLcj +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2tjgs9vr0j-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 09 Jul 2019 11:56:55 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7C62938;
        Tue,  9 Jul 2019 09:56:54 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E9792D3B;
        Tue,  9 Jul 2019 09:56:54 +0000 (GMT)
Received: from [10.48.0.131] (10.75.127.44) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 9 Jul
 2019 11:56:53 +0200
Subject: Re: [EXT] Re: [RFC 2/2] rpmsg: imx: add the initial imx rpmsg support
To:     Richard Zhu <hongxing.zhu@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
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
 <fcdd6392-75f4-716d-5dbd-1828a679b25f@st.com>
 <AM0PR0402MB3570CF963122A44DF2F049E88CF10@AM0PR0402MB3570.eurprd04.prod.outlook.com>
From:   Arnaud Pouliquen <arnaud.pouliquen@st.com>
Openpgp: preference=signencrypt
Autocrypt: addr=arnaud.pouliquen@st.com; prefer-encrypt=mutual; keydata=
 xsFNBFZu+HIBEAC/bt4pnj18oKkUw40q1IXSPeDFOuuznWgFbjFS6Mrb8axwtnxeYicv0WAL
 rWhlhQ6W2TfKDJtkDygkfaZw7Nlsj57zXrzjVXuy4Vkezxtg7kvSLYItQAE8YFSOrBTL58Yd
 d5cAFz/9WbWGRf0o9MxFavvGQ9zkfHVd+Ytw6dJNP4DUys9260BoxKZZMaevxobh5Hnram6M
 gVBYGMuJf5tmkXD/FhxjWEZ5q8pCfqZTlN9IZn7S8d0tyFL7+nkeYldA2DdVplfXXieEEURQ
 aBjcZ7ZTrzu1X/1RrH1tIQE7dclxk5pr2xY8osNePmxSoi+4DJzpZeQ32U4wAyZ8Hs0i50rS
 VxZuT2xW7tlNcw147w+kR9+xugXrECo0v1uX7/ysgFnZ/YasN8E+osM2sfa7OYUloVX5KeUK
 yT58KAVkjUfo0OdtSmGkEkILWQLACFEFVJPz7/I8PisoqzLS4Jb8aXbrwgIg7d4NDgW2FddV
 X9jd1odJK5N68SZqRF+I8ndttRGK0o7NZHH4hxJg9jvyEELdgQAmjR9Vf0eZGNfowLCnVcLq
 s+8q3nQ1RrW5cRBgB8YT2kC8wwY5as8fhfp4846pe2b8Akh0+Vba5pXaTvtmdOMRrcS7CtF6
 Ogf9zKAxPZxTp0qGUOLE3PmSc3P3FQBLYa6Y+uS2v2iZTXljqQARAQABzSpBcm5hdWQgUG91
 bGlxdWVuIDxhcm5hdWQucG91bGlxdWVuQHN0LmNvbT7CwX4EEwECACgFAlZu+HICGyMFCQlm
 AYAGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEP0ZQ+DAfqbfdXgP/RN0bU0gq3Pm1uAO
 4LejmGbYeTi5OSKh7niuFthrlgUvzR4UxMbUBk30utQAd/FwYPHR81mE9N4PYEWKWMW0T3u0
 5ASOBLpQeWj+edSE50jLggclVa4qDMl0pTfyLKOodt8USNB8aF0aDg5ITkt0euaGFaPn2kOZ
 QWVN+9a5O2MzNR3Sm61ojM2WPuB1HobbrCFzCT+VQDy4FLU0rsTjTanf6zpZdOeabt0LfWxF
 M69io06vzNSHYH91RJVl9mkIz7bYEZTBQR23KjLCsRXWfZ+54x6d6ITYZ2hp965PWuAhwWQr
 DdTJ3gPxmXJ7xK9+O15+DdUAbxF9FJXvvt9U5pTk3taTM3FIp/qaw77uxI/wniYA0dnIJRX0
 o51sjR6cCO6hwLciO7+Q0OCDCbtStuKCCCTZY5bF6fuEqgybDwvLGAokYIdoMagJu1DLKu4p
 seKgPqGZ4vouTmEp6cWMzSyRz4pf3xIJc5McsdrUTN2LtcX63E45xKaj/n0Neft/Ce7OuyLB
 rr0ujOrVlWsLwyzpU5w5dX7bzkEW1Hp4mv44EDxH9zRiyI5dNPpLf57I83Vs/qP4bpy7/Hm1
 fqbuM0wMbOquPGFI8fcYTkghntAAXMqNE6IvETzYqsPZwT0URpOzM9mho8u5+daFWWAuUXGA
 qRbo7qRs8Ev5jDsKBvGhzsFNBFZu+HIBEACrw5wF7Uf1h71YD5Jk7BG+57rpvnrLGk2s+YVW
 zmKsZPHT68SlMOy8/3gptJWgddHaM5xRLFsERswASmnJjIdPTOkSkVizfAjrFekZUr+dDZi2
 3PrISz8AQBd+uJ29jRpeqViLiV+PrtCHnAKM0pxQ1BOv8TVlkfO7tZVduLJl5mVoz1sq3/C7
 hT5ZICc2REWrfS24/Gk8mmtvMybiTMyM0QLFZvWyvNCvcGUS8s2a8PIcr+Xb3R9H0hMnYc2E
 7bc5/e39f8oTbKI6xLLFLa5yJEVfTiVksyCkzpJSHo2eoVdW0lOtIlcUz1ICgZ7vVJg7chmQ
 nPmubeBMw73EyvagdzVeLm8Y/6Zux8SRab+ZcU/ZQWNPKoW5clUvagFBQYJ6I2qEoh2PqBI4
 Wx0g1ca7ZIwjsIfWS7L3e310GITBsDmIeUJqMkfIAregf8KADPs4+L71sLeOXvjmdgTsHA8P
 lK8kUxpbIaTrGgHoviJ1IYwOvJBWrZRhdjfXTPl+ZFrJiB2E55XXogAAF4w/XHpEQNGkAXdQ
 u0o6tFkJutsJoU75aHPA4q/OvRlEiU6/8LNJeqRAR7oAvTexpO70f0Jns9GHzoy8sWbnp/LD
 BSH5iRCwq6Q0hJiEzrVTnO3bBp0WXfgowjXqR+YR86JPrzw2zjgr1e2zCZ1gHBTOyJZiDwAR
 AQABwsFlBBgBAgAPBQJWbvhyAhsMBQkJZgGAAAoJEP0ZQ+DAfqbfs5AQAJKIr2+j+U3JaMs3
 px9bbxcuxRLtVP5gR3FiPR0onalO0QEOLKkXb1DeJaeHHxDdJnVV7rCJX/Fz5CzkymUJ7GIO
 gpUGstSpJETi2sxvYvxfmTvE78D76rM5duvnGy8lob6wR2W3IqIRwmd4X0Cy1Gtgo+i2plh2
 ttVOM3OoigkCPY3AGD0ts+FbTn1LBVeivaOorezSGpKXy3cTKrEY9H5PC+DRJ1j3nbodC3o6
 peWAlfCXVtErSQ17QzNydFDOysL1GIVn0+XY7X4Bq+KpVmhQOloEX5/At4FlhOpsv9AQ30rZ
 3F5lo6FG1EqLIvg4FnMJldDmszZRv0bR0RM9Ag71J9bgwHEn8uS2vafuL1hOazZ0eAo7Oyup
 2VNRC7Inbc+irY1qXSjmq3ZrD3SSZVa+LhYfijFYuEgKjs4s+Dvk/xVL0JYWbKkpGWRz5M82
 Pj7co6u8pTEReGBYSVUBHx7GF1e3L/IMZZMquggEsixD8CYMOzahCEZ7UUwD5LKxRfmBWBgK
 36tfTyducLyZtGB3mbJYfWeI7aiFgYsd5ehov6OIBlOz5iOshd97+wbbmziYEp6jWMIMX+Em
 zqSvS5ETZydayO5JBbw7fFBd1nGVYk1WL6Ll72g+iEnqgIckMtxey1TgfT7GhPkR7hl54ZAe
 8mOik8I/F6EW8XyQAA2P
Message-ID: <81f58f8f-9050-a6be-29c6-aab803cf5520@st.com>
Date:   Tue, 9 Jul 2019 11:56:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <AM0PR0402MB3570CF963122A44DF2F049E88CF10@AM0PR0402MB3570.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-09_04:,,
 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 7/9/19 9:32 AM, Richard Zhu wrote:
> Hi Arnaud:
> Thanks a lot for your kindly guidance and review comments.
> 
> 
>> -----Original Message-----
>> From: Arnaud Pouliquen [mailto:arnaud.pouliquen@st.com]
>> Sent: 2019年7月8日 22:12
>> To: Oleksij Rempel <o.rempel@pengutronix.de>; Richard Zhu
>> <hongxing.zhu@nxp.com>; ohad@wizery.com; bjorn.andersson@linaro.org;
>> linux-remoteproc@vger.kernel.org
>> Cc: loic.pallardy@st.com; Fabien DESSENNE <fabien.dessenne@st.com>;
>> elder@linaro.org; linux-arm-kernel@lists.infradead.org
>> Subject: Re: [EXT] Re: [RFC 2/2] rpmsg: imx: add the initial imx rpmsg support
>>
>>
>> Hello Richard,
>>
>> On 7/8/19 1:02 PM, Oleksij Rempel wrote:
>>> Hi Richard,
>>>
>>> On 08.07.19 12:17, Richard Zhu wrote:
>>>> Hi Oleksij:
>>>> Thanks for your comments.
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
>>>>> Sent: 2019年7月4日 17:36
>>>>> To: Richard Zhu <hongxing.zhu@nxp.com>; ohad@wizery.com;
>>>>> bjorn.andersson@linaro.org; linux-remoteproc@vger.kernel.org
>>>>> Cc: linux-arm-kernel@lists.infradead.org; Fabien DESSENNE
>>>>> <fabien.dessenne@st.com>; loic.pallardy@st.com;
>>>>> arnaud.pouliquen@st.com; s-anna@ti.com; elder@linaro.org
>>>>> Subject: [EXT] Re: [RFC 2/2] rpmsg: imx: add the initial imx rpmsg
>>>>> support
>>>>>
>>>>>
>>>>> Hi Richard,
>>>>>
>>>>> On 01.07.19 10:34, Richard Zhu wrote:
>>>>>> Based on "virtio_rpmsg_bus" driver, This patch-set is used to set
>>>>>> up the communication mechanism between A core and M core on i.MX
>>>>>> AMP
>>>>> SOCs.
>>>>>>
>>>>>> Add the initial imx rpmsg support glue driver and one pingpong
>>>>>> demo, demonstrated the data transactions between A core and remote
>> M core.
>>>>>> Distributed framework is used in IMX RPMSG implementation, refer to
>>>>>> the following requirements:
>>>>>>     - The CAN functions contained in M core and RTOS should be
>>>>>> ready and
>>>>>>       complete functional in 50ms after AMP system is turned on.
>>>>>>     - Partition reset. System wouldn't be stalled by the exceptions
>>>>>> (e.x
>>>>>>       the reset triggered by the system hang) occurred at the other
>>>>>> side.
>>>>>>       And the RPMSG mechanism should be recovered automactilly
>>>>>> after
>>>>> the
>>>>>>       partition reset is completed.
>>>>>> In this scenario, the M core and RTOS would be kicked off by
>>>>>> bootloader firstly, then A core and Linux would be loaded later.
>>>>>> Both M core/RTOS and A core/Linux are running independly.
>>>>>>
>>>>>> One physical memory region used to store the vring is mandatory
>>>>>> required to pre-reserved and well-knowned by both A core and M core
>>>>>
>>>>> I don't see any thing imx specific in this patch. We already have
>>>>> remoteproc which would parse firmware header and create needed
>>>>> devices. This driver is only needed for the case where firmware was
>>>>> stared by the bootloader.
>>>>>
>>>> [Richard Zhu] Bootloader starts the firmware is mandatory required in
>>>> these scenario refer to the reasons listed in the commit.
>>>> Thus, the distributed framework has to be used, and both A core/Linux
>>>> and remote core/RTOS works independently.
>>>>
>>>>> I personally would prefer to have generic driver or extend the
>>>>> remoteproc framework. So we can notify kernel about work already
>>>>> done by bootloader.
>>>>>
>>>> [Richard Zhu] Thanks for your suggestions.
>>>> Regarding to my understand, it seems that master/slave mode is used
>>>> in the remoteproc currently.
>>>> A core/Linux acts as master, to controls/manipulates remote core/RTOS.
>>>> It isn't applicable for the scenario described by this patch-set.
>>>>
>>>>> In general, some more issues should be solved:
>>>>> - Handle or not touch idle clocks for different node used by M core
>>>>> and not main system.
>>>>> - pin control
>>>>> - regulators
>>>>>
>>>>> ST devs already tried to solve this issues by creating "remoteproc:
>>>>> add system
>>>>> resource manager device" patch. I don't know what is current state
>>>>> of it (/me adding ST devs to CC).
>> The resource manager implementation as been proposed but no real
>> adhesion of the community on it... Perhaps SCMI should be a candidate...
>>
>>>>>
>>>> [Richard Zhu] Yes, it is. Many contributions have been made by Fabien.
>>>> IMHO, there are some different behaviors on iMX8QXP/QM platforms, the
>>>>   resources (e.x IP modules) had been assigned and managed by the
>> XRDC.
>>>> In the other words, the HW resources would be assigned and managed
>> would
>>>>   be transparent to SW.
>>>>
>>>> Thus, both A core/Linux and M core/RTOS can work real independently.
>>>> System wouldn't be stalled by the exceptions (e.x the reset triggered
>>>> by the system hang) occurred at the other side. And the RPMSG
>>>> mechanism should
>>>>   be recovered automatically after the partition reset is completed.
>>>
>>> It is exactly the way I did understood it in the firs mail. Any way,
>>> i'm ok with this driver. Just rename imx to some thing generic. This
>>> driver can and will be reused on other platforms as well.
>>>
>>> Kind regards,
>>> Oleksij Rempel
>>>
>>
>> I'm trying to figure out what is the interest of these drivers vs existing ones.
>> Please find below a list of features i noticed in your driver (don't hesitate if i
>> missed some of them), with some comments/questions.
>>
>> 1) The coprocessor is started before the one running Linux OS.
>> Have you taken a look to this set of patches proposed by Loic:
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.or
>> g%2Flkml%2F2018%2F11%2F30%2F157&amp;data=02%7C01%7Chongxing.z
>> hu%40nxp.com%7C6773999ac6394dfe37d008d703ae3475%7C686ea1d3bc2
>> b4c6fa92cd99c5c301635%7C0%7C0%7C636981919064186660&amp;sdata=
>> OUogIs2S7gLR46%2FNcAU3OqEtB4rK3sW0gRKRRSO6xpk%3D&amp;reserved
>> =0
>> with this patch you should be able to"attach" on the fly on a preloaded
>> firmware.
> [Richard Zhu] Yes, this patch-set enable to pre-load the firmware in bootloader.
> The most difficulties when I try to use the current master/slave mode are that
>  the remote-proc controls/management mode is not applicable to the scenario,
>  especially the iMX8QXP/QM partition reset usage.
> Both A core/Linux and M core/RTOS are working independently.
> HW resources(e.x: some IP modules, DDR memory region, power domains, clocks and so on)
>  would be pre-managed and pre-assigned to A core or M core by SCFW through XRDC module
> refer to the security reasons or something else I don't know.
If i well understand the xRDC is an IP which allows hardware isolation
of some resources to the A or M core. So it is set by the secure part of
the bootloader, right?
We have an equivalence on the STM32MP1 named ETZPC.
So we also manage this use case on stm32mp1. The bootloader configures
resource isolation, and can load and start the Cortex-M firmware, before
the linux firmware. That why i pointed this patch. In case of preloaded
firmware the remote proc does not load the firmware but just parse the
resource table (address needs to be provided by the rproc_platform
driver). The rpmsg bus is probed according to the resource table entries.
This part of code is not upstreamed for time being (waiting integration
of the mentioned patch). Nevertheless You can take a look on mechanism
we implemented, on ST github (we named it early_boot):
https://github.com/STMicroelectronics/linux/blob/v4.19-stm32mp/drivers/remoteproc/stm32_rproc.c
> 
> M core/RTOS insists to run and manage its resources assigned by XRDC standalone.
> All the interactions between A core and M core are transferred on RPMSG channels.
> For example, the audio codec configuration and so on.
> So, what I do here is just setup the communication RPMSG channels between A core/Linux
> and M core/RTOS.
> 
> One more concern, I'm afraid that I may mess up the current solid reproc flow and framework if
>  I force this implementation into the current reproc drivers. 
> So, I summit this patch-set in the end. Pre-reserved vring buffer, register virtio_device, establish
> the RPMSG channels lets A core/Linux and M Core/RTOS can communicate with each other.
> That's all.
Your concern is valid, and as we have the same requirement, it would be
nice to find a common solution. That's why i propose this alternative,
which would have the advantage of reusing existing rpmsg implementation.

>>
>> 2) RPMSG recovery
>> Agree with you, this feature is important in AMP systems, as cores can have
>> their own live cycle.
>>
>> But I can not see related code, could you point out it to me?
>>
> [Richard Zhu] This feature had been validated in the local repos.
> But these codes are not contained in this patch-set, because this feature is
> relied on the SCFW(system control firm ware) used to monitor the status of
>  both side, and trigger one irq to the other side, if one side is stall.
> Unfortunately, it is not up streamed yet. So, these codes would be updated later
> If the SCFW is ready.
> 
>> Could you explain How do you recover the rpmsg channels that has been
>> already established?
>> For instance what happen if your coprocessor crash during the rpmsg
>> pingpong demo?
> [Richard Zhu] SCFW would inform the other side, if one core/OS is crashed.
> Then, the RPMSG stack would be re-initialized itself on the lived core/OS, and clarify that
> It's ready to re-establish the channels again.
> For example, M4/RTOS is crashed when pingpong demo is running.
> 1. Pingpong demo is stopped.
> 2. Lived A core/Linux would receive one irq from SCFW indicated that remote M4/RTOS is
>  reset, then all the virtio_device registered in A core/Linux side, would be un-registered,
>  and these virtio_devices would be registered again after receive the signal(e.x the mailbox rdb)
>  that M4/RTOS RPMSG stack is ready again.
> 3. Thus RPMS channels can be re-established in this situation.
> 4. Accordingly, the consumer of the rpmsg glue driver should be re-initialized too.
> For example, remove the pingpond demo module, and insmod it again.

Thanks for the clarification, i think this is no so far from the
recovery already implemented in remoteproc. Seems you remote proc driver
handles the recovery:
 -stop rproc on irq reception, restart it ( in preloaded mode) on
mailbox rdb.
On stm32MP1 we have a similar mechanism based on a Watchdog.

> 
>>
>> 3) ping-pong demo sample
>> Perhaps you could re-use the rpmsg sample available here:
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.b
>> ootlin.com%2Flinux%2Fv5.2%2Fsource%2Fsamples%2Frpmsg&amp;data=02
>> %7C01%7Chongxing.zhu%40nxp.com%7C6773999ac6394dfe37d008d703ae3
>> 475%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636981919064
>> 186660&amp;sdata=mSV3YsoyhAO%2FROfWX79X0woGQN3jx%2Fv4pL8LRUf
>> bHUM%3D&amp;reserved=0
> [Richard Zhu] Thanks a lot.
> This demo sample can be used. Sorry about that I didn't notice it before.
> 
>>
>> 4) No use of the resource table
>> Is there a reason to not use the resource table to declare the the vrings? Your
>> implementation seems to impose the same definition in both firmware while
>> resource table allow to share them.
>> Furthermore the resource table could be updated by the Linux before the
>> remote proc is started (in case of Linux booting first)
>>
> [Richard Zhu] Regarding to the auto industry requirements, the M core/RTOS is always
> started firstly, because that the CAN functions should be ready in 50ms after system is
> power up.
> BTW, resource table is a great idea in the case when Linux is booting firstly.
As explained before We also use it when cortex-M4 is booted firstly. A
constraint is that the resource table address should be known by the
remoteproc driver: either the resource table address is defined in DT,
or provided by the bootloader which loads the firmware so parses it.

> 
>> 5) slave and master mode support.
>> Seems that this drivers not fully respect the virtio protocol (for instance status
>> field). If you use a synchro mechanism (mailbox...) not sure that you really
>> need to be virtio slave on Linux.
> [Richard Zhu] Sorry about that. I used trying to keep this driver compatible with
> the current slave-master mode, but I'm failed to achieve that. ☹.
> - Partition reset feature is mandatory required.
> - M4 side insists that they should run and manage its resources standalone.
No problem, it is an RFC.
Anyway regarding you requirements and concerns, it seems that we have
the same ones. I don't know if the solution we propose can fit with your
needs, but i would be nice to have a common implementation.

Best Regards,
Arnaud

> 
> Best Regards
> Richard Zhu
>>
>> Thanks,
>> Arnaud
