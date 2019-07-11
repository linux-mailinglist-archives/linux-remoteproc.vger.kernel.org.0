Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2CC64A6C
	for <lists+linux-remoteproc@lfdr.de>; Wed, 10 Jul 2019 18:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbfGJQEg (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 10 Jul 2019 12:04:36 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:8538 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727750AbfGJQEf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Jul 2019 12:04:35 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6AFvuWp029038;
        Wed, 10 Jul 2019 18:04:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=lLh8rJOE1fLb+/JX7sWcHB+/4QbxrQYIiXPtSf5+1ws=;
 b=F+uPHeKguiyqtGga0FlK8OceyaJTmrAfz+OSkgvcrwGDi2S8x5KQxqb/OmUavk2hO2Pa
 iwgqJnRIdDJbdaNTQba8SC/8uK+7olh+Tu9IykbLxHXzlYNk/0IPxqcXZV0ZO09lOgYo
 ywQ4GMHJOpHDu4HrLSscPFyBC0sw5409MQSrwhxRRUXsJzBHAsLWVkp/BGQAeUVNbXWa
 bNGKLHEsFeQYk01opkUPHIegwJr/gyuSejIp3PfuEb9U9Ktn8kGd8/wvwSUQC2JX90W7
 9P1zEjc9TXCXiAhETjwqBGFpO3iGod1JpIqhQlCZ6R19xDr4XzkHAfCzou9U1FeDWxrc Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2tjgsa61u0-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 10 Jul 2019 18:04:10 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ACCB731;
        Wed, 10 Jul 2019 16:04:07 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6252D4FEC;
        Wed, 10 Jul 2019 16:04:07 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 10 Jul
 2019 18:04:07 +0200
Received: from [10.48.0.131] (10.48.0.131) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 10 Jul 2019 18:04:06
 +0200
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
 <81f58f8f-9050-a6be-29c6-aab803cf5520@st.com>
 <AM0PR0402MB3570CDFC23F75AB682F17D618CF00@AM0PR0402MB3570.eurprd04.prod.outlook.com>
From:   Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <7f14463c-8054-1cc3-10c2-690b70981919@st.com>
Date:   Wed, 10 Jul 2019 18:03:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <AM0PR0402MB3570CDFC23F75AB682F17D618CF00@AM0PR0402MB3570.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.0.131]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-10_06:,,
 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 7/10/19 10:13 AM, Richard Zhu wrote:
>> -----Original Message-----
>> From: Arnaud Pouliquen [mailto:arnaud.pouliquen@st.com]
>> Sent: 2019年7月9日 17:57
>> To: Richard Zhu <hongxing.zhu@nxp.com>; Oleksij Rempel
>> <o.rempel@pengutronix.de>; ohad@wizery.com; bjorn.andersson@linaro.org;
>> linux-remoteproc@vger.kernel.org
>> Cc: loic.pallardy@st.com; Fabien DESSENNE <fabien.dessenne@st.com>;
>> elder@linaro.org; linux-arm-kernel@lists.infradead.org
>> Subject: Re: [EXT] Re: [RFC 2/2] rpmsg: imx: add the initial imx rpmsg support
>>
>> On 7/9/19 9:32 AM, Richard Zhu wrote:
>>> Hi Arnaud:
>>> Thanks a lot for your kindly guidance and review comments.
>>>
>>>
>>>> -----Original Message-----
>>>> From: Arnaud Pouliquen [mailto:arnaud.pouliquen@st.com]
>>>> Sent: 2019年7月8日 22:12
>>>> To: Oleksij Rempel <o.rempel@pengutronix.de>; Richard Zhu
>>>> <hongxing.zhu@nxp.com>; ohad@wizery.com;
>> bjorn.andersson@linaro.org;
>>>> linux-remoteproc@vger.kernel.org
>>>> Cc: loic.pallardy@st.com; Fabien DESSENNE <fabien.dessenne@st.com>;
>>>> elder@linaro.org; linux-arm-kernel@lists.infradead.org
>>>> Subject: Re: [EXT] Re: [RFC 2/2] rpmsg: imx: add the initial imx
>>>> rpmsg support
>>>>
>>>>
>>>> Hello Richard,
>>>>
>>>> On 7/8/19 1:02 PM, Oleksij Rempel wrote:
>>>>> Hi Richard,
>>>>>
>>>>> On 08.07.19 12:17, Richard Zhu wrote:
>>>>>> Hi Oleksij:
>>>>>> Thanks for your comments.
>>>>>>
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
>>>>>>> Sent: 2019年7月4日 17:36
>>>>>>> To: Richard Zhu <hongxing.zhu@nxp.com>; ohad@wizery.com;
>>>>>>> bjorn.andersson@linaro.org; linux-remoteproc@vger.kernel.org
>>>>>>> Cc: linux-arm-kernel@lists.infradead.org; Fabien DESSENNE
>>>>>>> <fabien.dessenne@st.com>; loic.pallardy@st.com;
>>>>>>> arnaud.pouliquen@st.com; s-anna@ti.com; elder@linaro.org
>>>>>>> Subject: [EXT] Re: [RFC 2/2] rpmsg: imx: add the initial imx rpmsg
>>>>>>> support
>>>>>>>
>>>>>>>
>>>>>>> Hi Richard,
>>>>>>>
>>>>>>> On 01.07.19 10:34, Richard Zhu wrote:
>>>>>>>> Based on "virtio_rpmsg_bus" driver, This patch-set is used to set
>>>>>>>> up the communication mechanism between A core and M core on
>> i.MX
>>>>>>>> AMP
>>>>>>> SOCs.
>>>>>>>>
>>>>>>>> Add the initial imx rpmsg support glue driver and one pingpong
>>>>>>>> demo, demonstrated the data transactions between A core and
>>>>>>>> remote
>>>> M core.
>>>>>>>> Distributed framework is used in IMX RPMSG implementation, refer
>>>>>>>> to the following requirements:
>>>>>>>>      - The CAN functions contained in M core and RTOS should be
>>>>>>>> ready and
>>>>>>>>        complete functional in 50ms after AMP system is turned on.
>>>>>>>>      - Partition reset. System wouldn't be stalled by the
>>>>>>>> exceptions (e.x
>>>>>>>>        the reset triggered by the system hang) occurred at the
>>>>>>>> other side.
>>>>>>>>        And the RPMSG mechanism should be recovered automactilly
>>>>>>>> after
>>>>>>> the
>>>>>>>>        partition reset is completed.
>>>>>>>> In this scenario, the M core and RTOS would be kicked off by
>>>>>>>> bootloader firstly, then A core and Linux would be loaded later.
>>>>>>>> Both M core/RTOS and A core/Linux are running independly.
>>>>>>>>
>>>>>>>> One physical memory region used to store the vring is mandatory
>>>>>>>> required to pre-reserved and well-knowned by both A core and M
>>>>>>>> core
>>>>>>>
>>>>>>> I don't see any thing imx specific in this patch. We already have
>>>>>>> remoteproc which would parse firmware header and create needed
>>>>>>> devices. This driver is only needed for the case where firmware
>>>>>>> was stared by the bootloader.
>>>>>>>
>>>>>> [Richard Zhu] Bootloader starts the firmware is mandatory required
>>>>>> in these scenario refer to the reasons listed in the commit.
>>>>>> Thus, the distributed framework has to be used, and both A
>>>>>> core/Linux and remote core/RTOS works independently.
>>>>>>
>>>>>>> I personally would prefer to have generic driver or extend the
>>>>>>> remoteproc framework. So we can notify kernel about work already
>>>>>>> done by bootloader.
>>>>>>>
>>>>>> [Richard Zhu] Thanks for your suggestions.
>>>>>> Regarding to my understand, it seems that master/slave mode is used
>>>>>> in the remoteproc currently.
>>>>>> A core/Linux acts as master, to controls/manipulates remote core/RTOS.
>>>>>> It isn't applicable for the scenario described by this patch-set.
>>>>>>
>>>>>>> In general, some more issues should be solved:
>>>>>>> - Handle or not touch idle clocks for different node used by M
>>>>>>> core and not main system.
>>>>>>> - pin control
>>>>>>> - regulators
>>>>>>>
>>>>>>> ST devs already tried to solve this issues by creating "remoteproc:
>>>>>>> add system
>>>>>>> resource manager device" patch. I don't know what is current state
>>>>>>> of it (/me adding ST devs to CC).
>>>> The resource manager implementation as been proposed but no real
>>>> adhesion of the community on it... Perhaps SCMI should be a candidate...
>>>>
>>>>>>>
>>>>>> [Richard Zhu] Yes, it is. Many contributions have been made by Fabien.
>>>>>> IMHO, there are some different behaviors on iMX8QXP/QM platforms,
>> the
>>>>>>    resources (e.x IP modules) had been assigned and managed by the
>>>> XRDC.
>>>>>> In the other words, the HW resources would be assigned and managed
>>>> would
>>>>>>    be transparent to SW.
>>>>>>
>>>>>> Thus, both A core/Linux and M core/RTOS can work real independently.
>>>>>> System wouldn't be stalled by the exceptions (e.x the reset
>>>>>> triggered by the system hang) occurred at the other side. And the
>>>>>> RPMSG mechanism should
>>>>>>    be recovered automatically after the partition reset is completed.
>>>>>
>>>>> It is exactly the way I did understood it in the firs mail. Any way,
>>>>> i'm ok with this driver. Just rename imx to some thing generic. This
>>>>> driver can and will be reused on other platforms as well.
>>>>>
>>>>> Kind regards,
>>>>> Oleksij Rempel
>>>>>
>>>>
>>>> I'm trying to figure out what is the interest of these drivers vs existing ones.
>>>> Please find below a list of features i noticed in your driver (don't
>>>> hesitate if i missed some of them), with some comments/questions.
>>>>
>>>> 1) The coprocessor is started before the one running Linux OS.
>>>> Have you taken a look to this set of patches proposed by Loic:
>>>> https://lkml.or
>>>>
>> g%2Flkml%2F2018%2F11%2F30%2F157&amp;data=02%7C01%7Chongxing.z
>>>>
>> hu%40nxp.com%7C6773999ac6394dfe37d008d703ae3475%7C686ea1d3bc2
>>>>
>> b4c6fa92cd99c5c301635%7C0%7C0%7C636981919064186660&amp;sdata=
>>>>
>> OUogIs2S7gLR46%2FNcAU3OqEtB4rK3sW0gRKRRSO6xpk%3D&amp;reserved
>>>> =0
>>>> with this patch you should be able to"attach" on the fly on a
>>>> preloaded firmware.
>>> [Richard Zhu] Yes, this patch-set enable to pre-load the firmware in
>> bootloader.
>>> The most difficulties when I try to use the current master/slave mode
>>> are that  the remote-proc controls/management mode is not applicable
>>> to the scenario,  especially the iMX8QXP/QM partition reset usage.
>>> Both A core/Linux and M core/RTOS are working independently.
>>> HW resources(e.x: some IP modules, DDR memory region, power domains,
>>> clocks and so on)  would be pre-managed and pre-assigned to A core or
>>> M core by SCFW through XRDC module refer to the security reasons or
>> something else I don't know.
>> If i well understand the xRDC is an IP which allows hardware isolation of some
>> resources to the A or M core. So it is set by the secure part of the bootloader,
>> right?
> [Richard Zhu] Yes, you're right.
> It would be configured by SCFW.
> 
>> We have an equivalence on the STM32MP1 named ETZPC.
>> So we also manage this use case on stm32mp1. The bootloader configures
>> resource isolation, and can load and start the Cortex-M firmware, before the
>> linux firmware. That why i pointed this patch. In case of preloaded firmware
>> the remote proc does not load the firmware but just parse the resource table
>> (address needs to be provided by the rproc_platform driver). The rpmsg bus is
>> probed according to the resource table entries.
>> This part of code is not upstreamed for time being (waiting integration of the
>> mentioned patch). Nevertheless You can take a look on mechanism we
>> implemented, on ST github (we named it early_boot):
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.
>> com%2FSTMicroelectronics%2Flinux%2Fblob%2Fv4.19-stm32mp%2Fdrivers%
>> 2Fremoteproc%2Fstm32_rproc.c&amp;data=02%7C01%7Chongxing.zhu%40n
>> xp.com%7Ce47bde268f3c4290b91708d70453c995%7C686ea1d3bc2b4c6fa9
>> 2cd99c5c301635%7C0%7C0%7C636982630222216880&amp;sdata=1dtIyIVYf
>> sg693v6UjM%2BFEk7TYHxgg6RDX611%2FKfjqA%3D&amp;reserved=0
>>>
>>> M core/RTOS insists to run and manage its resources assigned by XRDC
>> standalone.
>>> All the interactions between A core and M core are transferred on RPMSG
>> channels.
>>> For example, the audio codec configuration and so on.
>>> So, what I do here is just setup the communication RPMSG channels
>>> between A core/Linux and M core/RTOS.
>>>
>>> One more concern, I'm afraid that I may mess up the current solid
>>> reproc flow and framework if  I force this implementation into the current
>> reproc drivers.
>>> So, I summit this patch-set in the end. Pre-reserved vring buffer,
>>> register virtio_device, establish the RPMSG channels lets A core/Linux and
>> M Core/RTOS can communicate with each other.
>>> That's all.
>> Your concern is valid, and as we have the same requirement, it would be nice
>> to find a common solution. That's why i propose this alternative, which would
>> have the advantage of reusing existing rpmsg implementation.
>>
>   [Richard Zhu] I looked through the codes briefly. Correct me if my understand
>   is wrong.
> It seems that the A core side does a lot of manipulations to the remote M4 core
>   on ST32M.
> During the start/stop/recovery operations, M4 acted as slave and waiting for the
>   control constructions sent from the master A core/Linux side although the
>   early_boot is set.
> 
> There are some differences in the relationship between A core and M core.
> On ST32M: M4/RTOS would started/stopped/recovered by A core/Linux side.
> 
> In my purposed implementation, both A core/Linux and M core/RTOS working in the real
>   independent mode.
> - M4/RTOS complete the start/stop/recovery and son on operations by itself, it wouldn't
>   accept any start/stop/reset interactions from A core/Linux side. Same to A core/Linux side.
> - SCFW monitors the running status of each side, would notify the other side, if there is a
>   system stall at one side.
>   when the lived side receives the notification and know the other side is reset,
>   It would only recover its own rpmsg stack, wait the rpmsg "ready" signal of the opposite side,
>   then re-establish the rpmsg channels again.
>   A core/Linux or M core/RTOS wouldn't do the start/stop/recovery operations on the opposite side.
On STM32MP1 we have not exactly the same strategy but it only a ST 
design choice, implemented in our stm32 remoteproc driver. You should be 
able to implement your expected behavior in your the imx remoteproc driver.

On STM32MP1 we manage the M4 preloaded firmware in this way:
-  On Linux stm32 remoteproc probe:
	We detect that the firmware is preloaded (early-booted filed in DT) and 
set the earl_boot variable.
	we provide the resource table address to the remoteproc core that 
parses it an call the stm32_rproc_start. here we do nothing as M4 
already started we just set the hold boot to freeze the M4 in case of crash

- On M4 crash we have not the same strategy as your one. We consider 
that the M4 firmware can be corrupted and either we try to reload a firmware
which as been provided by application, or we don't let it restarting 
(hold boot set on start).

-We allow userland to stop the preloaded firmware to load and to run a 
new one.

>   
> Anyway, let me do some more homework, and figure out that whether I can fit these into the existing
> remoteproc framework or not.
Sorry to give you homework... but seems (IMHO) possible to integrate 
your constraint in rpmsg/remoteproc current design.

> 
>>>>
>>>> 2) RPMSG recovery
>>>> Agree with you, this feature is important in AMP systems, as cores
>>>> can have their own live cycle.
>>>>
>>>> But I can not see related code, could you point out it to me?
>>>>
>>> [Richard Zhu] This feature had been validated in the local repos.
>>> But these codes are not contained in this patch-set, because this
>>> feature is relied on the SCFW(system control firm ware) used to
>>> monitor the status of  both side, and trigger one irq to the other side, if one
>> side is stall.
>>> Unfortunately, it is not up streamed yet. So, these codes would be
>>> updated later If the SCFW is ready.
>>>
>>>> Could you explain How do you recover the rpmsg channels that has been
>>>> already established?
>>>> For instance what happen if your coprocessor crash during the rpmsg
>>>> pingpong demo?
>>> [Richard Zhu] SCFW would inform the other side, if one core/OS is crashed.
>>> Then, the RPMSG stack would be re-initialized itself on the lived
>>> core/OS, and clarify that It's ready to re-establish the channels again.
>>> For example, M4/RTOS is crashed when pingpong demo is running.
>>> 1. Pingpong demo is stopped.
>>> 2. Lived A core/Linux would receive one irq from SCFW indicated that
>>> remote M4/RTOS is  reset, then all the virtio_device registered in A
>>> core/Linux side, would be un-registered,  and these virtio_devices
>>> would be registered again after receive the signal(e.x the mailbox rdb)
>> that M4/RTOS RPMSG stack is ready again.
>>> 3. Thus RPMS channels can be re-established in this situation.
>>> 4. Accordingly, the consumer of the rpmsg glue driver should be re-initialized
>> too.
>>> For example, remove the pingpond demo module, and insmod it again.
>>
>> Thanks for the clarification, i think this is no so far from the recovery already
>> implemented in remoteproc. Seems you remote proc driver handles the
>> recovery:
>>   -stop rproc on irq reception, restart it ( in preloaded mode) on mailbox rdb.
>> On stm32MP1 we have a similar mechanism based on a Watchdog.
>>
> [Richard Zhu] Regarding to my understand, STM32MP1 stop/restart the remote
>   M core/RTOS although the preloaded mode is used, right?
Yes as explained above we allow to reload a firmware if recovery mode is 
enabled or simply if application when to load a new one.
> 
> 
>>>
>>>>
>>>> 3) ping-pong demo sample
>>>> Perhaps you could re-use the rpmsg sample available here:
>>>> https://elixir.b
>>>>
>> ootlin.com%2Flinux%2Fv5.2%2Fsource%2Fsamples%2Frpmsg&amp;data=02
>>>> %7C01%7Chongxing.zhu%40nxp.com%7C6773999ac6394dfe37d008d703a
>> e3
>>>>
>> 475%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636981919064
>>>>
>> 186660&amp;sdata=mSV3YsoyhAO%2FROfWX79X0woGQN3jx%2Fv4pL8LRUf
>>>> bHUM%3D&amp;reserved=0
>>> [Richard Zhu] Thanks a lot.
>>> This demo sample can be used. Sorry about that I didn't notice it before.
>>>
>>>>
>>>> 4) No use of the resource table
>>>> Is there a reason to not use the resource table to declare the the
>>>> vrings? Your implementation seems to impose the same definition in
>>>> both firmware while resource table allow to share them.
>>>> Furthermore the resource table could be updated by the Linux before
>>>> the remote proc is started (in case of Linux booting first)
>>>>
>>> [Richard Zhu] Regarding to the auto industry requirements, the M
>>> core/RTOS is always started firstly, because that the CAN functions
>>> should be ready in 50ms after system is power up.
>>> BTW, resource table is a great idea in the case when Linux is booting firstly.
>> As explained before We also use it when cortex-M4 is booted firstly. A
>> constraint is that the resource table address should be known by the
>> remoteproc driver: either the resource table address is defined in DT, or
>> provided by the bootloader which loads the firmware so parses it.
>>
> [Richard Zhu] Up to now, the pre-defined vring address and the mailbox channels
>   are defined in the DT in my local implementation.
> FYI. Here are the details. "https://patchwork.kernel.org/patch/11031059/"
> 
Thanks, we have similar use of the reserved memory to declare the vring 
(vdev0vring0, vdev0vring1, vdev0buffer) according to remoteproc core 
requirement:
https://github.com/STMicroelectronics/linux/blob/v4.19-stm32mp/arch/arm/boot/dts/stm32mp157a-dk1.dts

>>>
>>>> 5) slave and master mode support.
>>>> Seems that this drivers not fully respect the virtio protocol (for
>>>> instance status field). If you use a synchro mechanism (mailbox...)
>>>> not sure that you really need to be virtio slave on Linux.
>>> [Richard Zhu] Sorry about that. I used trying to keep this driver
>>> compatible with the current slave-master mode, but I'm failed to achieve
>> that. ☹.
>>> - Partition reset feature is mandatory required.
>>> - M4 side insists that they should run and manage its resources standalone.
>> No problem, it is an RFC.
>> Anyway regarding you requirements and concerns, it seems that we have the
>> same ones. I don't know if the solution we propose can fit with your needs,
>> but i would be nice to have a common implementation.
>>
> [Richard Zhu] Agree. It's great if there is a common solution taking the advantage of
>   reusing existing rpmsg implementation.
> 
> Thanks a lot for your kindly review comments.
Thanks a lot to you for considering an alternative proposal!

Best regards
Arnaud

> Best Regards
> Richard
> 
>> Best Regards,
>> Arnaud
>>
>>>
>>> Best Regards
>>> Richard Zhu
>>>>
>>>> Thanks,
>>>> Arnaud
