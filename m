Return-Path: <linux-remoteproc+bounces-17-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ACB7F816B
	for <lists+linux-remoteproc@lfdr.de>; Fri, 24 Nov 2023 19:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FE1328244A
	for <lists+linux-remoteproc@lfdr.de>; Fri, 24 Nov 2023 18:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43423173F;
	Fri, 24 Nov 2023 18:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cZH991uV"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27B41BD8;
	Fri, 24 Nov 2023 10:54:50 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AOI0C2w030233;
	Fri, 24 Nov 2023 18:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8Hmxc1rL7mlS4z6kmcKDPZ9q13Eml27Jp1Hi+F3WMPM=;
 b=cZH991uVfNIVg97ZxHdO6djzCM0T3KVwMPnOzRClvqKoYat+rJcPEqPgsYeH7b+POfnu
 5K5N9a7RIY5mhOxlLPQV2VGIzt24HPgmVuujHrpcgv6dKTjNrhhlquHrXX2DxhkBVGQo
 Pr0JhJSa2bR14pMroj7sa/3l3Y9NDTfzMjxsuA2EE+GQTNUq9AL/z66DJWpHx3mtVSUn
 5G+s8s7Uz5GsUoqhDSAIA7lULUvMKqC6emSU6dCW6W8IjzJstICX+fYkcoJG8R0rIDMG
 zxZ77HvsCbOaRcRU8k6Xp0xbRziV6Pnei0/xInqFtOSfMMvgZR/z0kroJt0YqFcVYe8t GA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ujwg50hn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 18:54:46 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AOIsjUu022497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 18:54:46 GMT
Received: from [10.50.15.50] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 24 Nov
 2023 10:54:42 -0800
Message-ID: <d3c3320b-8cc1-4d13-ae87-f2f8f46826e6@quicinc.com>
Date: Sat, 25 Nov 2023 00:24:38 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: Add NOTIFY_FATAL event type to SSR
 subdevice
From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: <agross@kernel.org>, <konrad.dybcio@linaro.org>,
        <mathieu.poirier@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_kathirav@quicinc.com>, <quic_devipriy@quicinc.com>,
        <quic_sjaganat@quicinc.com>
References: <20230503062146.3891-1-quic_viswanat@quicinc.com>
 <egnmb647g7x7e74j4g2jddwho23ulmbap2q4eimcyj7y4qvdlz@zmaydxodu2a6>
 <509406eb-8093-4bcf-820f-8e5210e1539d@quicinc.com>
Content-Language: en-US
In-Reply-To: <509406eb-8093-4bcf-820f-8e5210e1539d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3hs_k0zlg__os5QNzRnazmvUrtEQ6_tJ
X-Proofpoint-ORIG-GUID: 3hs_k0zlg__os5QNzRnazmvUrtEQ6_tJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-24_04,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=794 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311240145



On 9/4/2023 10:23 PM, Vignesh Viswanathan wrote:
> 
> 
> On 7/16/2023 1:50 AM, Bjorn Andersson wrote:
>> On Wed, May 03, 2023 at 11:51:46AM +0530, Vignesh Viswanathan wrote:
>>> Currently the SSR subdevice notifies the client driver on crash of the
>>> rproc from the recovery workqueue using the BEFORE_SHUTDOWN event.
>>> However the client driver might be interested to know that the device
>>> has crashed immediately to pause any further transactions with the
>>> rproc. This calls for an event to be sent to the driver in the IRQ
>>> context as soon as the rproc crashes.
>>>
>>
>> Please make your argumentation more concrete, I can only guess what
>> client driver you're referring to.
>>
>> You can do this either by spelling out which actual problem you're
>> solving, or better yet, include some patches in the series that actually
>> uses this interface.
>>
> 
> Hi Bjorn,
> 
> Apologies for the delay in response.
> 
> The client driver in my scenario is a Wi-Fi driver which is continuously
> queuing data to the remoteproc and needs to know if remoteproc crashes
> as soon as possible to stop queuing further data and also dump some 
> debug statistics on the driver side that could potentially help in debug
> of why the remoteproc crashed.
> 
> Also in the case with upcoming Wi-Fi 7 targets with multi-link 
> operation, the driver might need to know that the remoteproc has crashed
> instantly to handle some multi-link specific handling.
> 
> The ath11k/ath12k WLAN drivers today partially have support for handling
> such FATAL notification but it has not been upstreamed yet.
> 
> Reference patch: 
> https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/win.wlan_host_opensource.1.0/mac80211/patches/031-ath11k-print-stats-on-crash.patch -- event SUBSYS_PREPARE_FOR_FATAL_SHUTDOWN.
> 
> Also, Mukesh mentioned earlier that in some MSM targets with PCIe where 
> latency cannot be tolerated, a similar downstream patch adds support for 
> "early notifier". If this patch is accepted, the early notifier can also 
> be replaced to use the same NOTIFY_FATAL event from SSR Subdevice
> 
> https://git.codelinaro.org/clo/la/kernel/msm-5.15/-/commit/7583d24de337aa1bf7c375a7da706af9b995b9a1#a840754ebb0e24e88adbf48177e1abd0830b72d2
> https://git.codelinaro.org/clo/la/kernel/msm-5.15/-/commit/257de41c63a5a51a081cc7887cdaa4a46e4d1744

Hi Bjorn,

Gentle reminder for this patch.

Thanks,
Vignesh
> 
> Thanks,
> Vignesh
> 
>> Regards,
>> Bjorn

