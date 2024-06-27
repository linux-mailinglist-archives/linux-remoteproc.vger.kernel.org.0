Return-Path: <linux-remoteproc+bounces-1710-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC8091A354
	for <lists+linux-remoteproc@lfdr.de>; Thu, 27 Jun 2024 12:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88103B20EEA
	for <lists+linux-remoteproc@lfdr.de>; Thu, 27 Jun 2024 10:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D9D13BC26;
	Thu, 27 Jun 2024 10:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FR0VF5Rl"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778834501F;
	Thu, 27 Jun 2024 10:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719482517; cv=none; b=cWNqb1pZVPRL4efekNy5vgaFXUCQXhXzCn18RqHO2WE67LwErf04FR50NByjDYxCiSg7SqtS1aSQUTxUadVIj+7Skjbc+WIr3wku7Phtud0JRmJYvPSy3kOjDZske+XW8LAEx45PfOuBeqmtbGE50TTqCZ1HlpUVyjtHyrDVRs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719482517; c=relaxed/simple;
	bh=PYuXoyzrovl+I/Cj82uWg5mIugIlRxhYi+eRZ6sUCic=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EFkXR6MO0Qt9FoHuE4qrHdOp8W8Y3WN/wbF28vDIFWUoNLklVTmBt5TB2n3gDIjqau+RtqnfrLerCUsyhCxG9dMKCb1gcc2umb9tdz8k80k/wuLwo5DXKiQXfuf7SPSAI835T9djPUIgBuaTqbKHIgumrSpaVoB3n5wQWyw1Yc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FR0VF5Rl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R0nGvB018804;
	Thu, 27 Jun 2024 10:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jtCa7cMb9eryGghcwAs7CfCedLjaHIhzuMxL9+IUFLU=; b=FR0VF5RllHY8dNgO
	/XI6qz3L/T4ihk45xOK8D2GpH0XONghwQPeZey6phiKK79Xrw2sc0sQXw8AlrJkC
	AuK1UhS7nUhufE6ziuVTHJ09lis5bAr1AlwjBHSUKsoUPNdTJCAwhQP0rIHmffiu
	1oqd/EvpJjR8cV3djl5UMkRN/pc2BT9wvVMyvJ4pNvvDJosdmrL9LYT+EIqn4ZFq
	bNnZ6Pt5c24L6lSHMgRsC99X7skIc6WddR9OhFMTYWKlYf0UA0AtXubenzWKiN4u
	m7euT5ctfH6Q8vpGXGTGhh2i5hPgFJDg9HT1m1wrEI1rgVsMhT56K7NfE/u2D0Yq
	dqeVCw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400f90k6y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 10:01:11 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45RA1Aa0020729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 10:01:10 GMT
Received: from [10.152.201.37] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 03:01:04 -0700
Message-ID: <2617940e-72ad-4214-be26-7a5b15374609@quicinc.com>
Date: Thu, 27 Jun 2024 15:31:01 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/8] remoteproc: qcom: Add PRNG proxy clock
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <sboyd@kernel.org>, <andersson@kernel.org>, <bjorn.andersson@linaro.org>,
        <david.brown@linaro.org>, <devicetree@vger.kernel.org>,
        <jassisinghbrar@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <mark.rutland@arm.com>,
        <mturquette@baylibre.com>, <ohad@wizery.com>, <robh@kernel.org>,
        <sricharan@codeaurora.org>, <gokulsri@codeaurora.org>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
 <20240621114659.2958170-2-quic_gokulsri@quicinc.com>
 <chi3pzh5ss3mivnhs3qeoen5hsecfcgzaj6qnrgxantvinrri2@bxsbmpufuqpe>
 <73cb638e-4982-49a2-ba79-0e78402b59ad@quicinc.com>
 <ga5kczcyn3dqoky4525c74rr7dct5uizun2smvyx3p3u6z6vtm@5vshoozpttod>
Content-Language: en-US
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
In-Reply-To: <ga5kczcyn3dqoky4525c74rr7dct5uizun2smvyx3p3u6z6vtm@5vshoozpttod>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vwlrfvxYq8a7c7s_Xhjl0t-js0hOpxUn
X-Proofpoint-GUID: vwlrfvxYq8a7c7s_Xhjl0t-js0hOpxUn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_06,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406270075


On 6/27/2024 12:47 AM, Dmitry Baryshkov wrote:
> On Tue, Jun 25, 2024 at 11:03:30AM GMT, Gokul Sriram P wrote:
>> On 6/22/2024 2:38 AM, Dmitry Baryshkov wrote:
>>> On Fri, Jun 21, 2024 at 05:16:52PM GMT, Gokul Sriram Palanisamy wrote:
>>>> PRNG clock is needed by the secure PIL, support for the same
>>>> is added in subsequent patches.
>>> Which 'same'?
>>> What is 'secure PIL'?
>>    will elaborate in the updated version.
>>    To answer your question, secure PIL is signed PIL image which only
>> TrustZone can authenticate and load.
> Fine. So, the current driver can not load WCSS firmware on IPQ8074, is
> that correct? Or was there some kind of firmware interface change? The
> driver was added in 2018, so I can only hope that at that point it
> worked. Could you please explain, what happened?
The existing wcss driver can load unsigned PIL images without the 
involvement of TrustZone. That works even now.
With the current change, we are trying to add signed PIL as an option 
based on "wcss->need_mem_protection" if set. For signed PIL alone, we 
send a PAS request to TrustZone to authenticate and load.
I also just noticed that Bjorn had suggested to submit a new driver for 
the PAS based IPQ WCSS instead of overloading this driver. Will also 
address that and post a new driver in updated revision.

Regards,
Gokul
>>>> Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
>>>> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
>>>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>>>> ---
>>>>    drivers/remoteproc/qcom_q6v5_wcss.c | 65 +++++++++++++++++++++--------
>>>>    1 file changed, 47 insertions(+), 18 deletions(-)
>

