Return-Path: <linux-remoteproc+bounces-3625-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E83CAA9402
	for <lists+linux-remoteproc@lfdr.de>; Mon,  5 May 2025 15:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4EB11899BED
	for <lists+linux-remoteproc@lfdr.de>; Mon,  5 May 2025 13:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A522561D8;
	Mon,  5 May 2025 13:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGtOGBMz"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B49F2046A6
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 May 2025 13:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450472; cv=none; b=i2sO+dAkAHCWpcQgpRbQ0z8HEs/iTInd4YrnZRHmu363lws9svckncckjCDj6BJf2/oRucr/Bw9R95+MK8Edo4WnPyFplgBOy/IrLY4unswZBToYo6LdRHpLjrm+3eDqNOvqdj8XH2HRNfUrQOMVm+BlBTE4PRUlZPIScvrgBi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450472; c=relaxed/simple;
	bh=Co5/+JRmTV9xf6AE6O7EzpylVwg5wsLvPoGaApnYw+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rt18izS3weqHPWcKW8MTAHer5HZYOJCmCnEQKogQF1BW/i6yCKmG24lNtUbyI74xx3y8jCJYxyvPRw218zkVMrp3ADQxR68BNEoRSkprx4Hzuqjrp7FzTzX3ab516FNI7YybzvAdMDKVSJT3csKPrJkNLURm6Uj2OwHhrtaal80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGtOGBMz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545CGdl4000439
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 May 2025 13:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oJ2xkOZreVOLEDBm9yTWCFsnyfq9hqlhNlEZZUyUYhE=; b=OGtOGBMzNTjfBuZD
	4PZ+56hd6zE+zlNlP+sev4p1NxQ8BveHxGSvzS+ewfswkz7fflOZCD2cg7qMBYFB
	q83fqp1ZTDpzwCBQjKKnJlsOqW6r+jrnp8TjXDKhDE49/SkXlDobUzeQA98GFny2
	FKfefxPUAmDS9JtZAmh+wT0+4P4HcZHp6f6BXxO0ESZ2dOqqO9HmxRj/PwhEIvKt
	/DkU/ICNDYOA96I5ljZTKfHjw0mOOd96stKK7eq3gfZ7O8Bz/Gf0AughhdDzjHFR
	7zGrDSZ4qm0vVE8HvQSMdUlozEfwOMXB5Jlb9+bpJ/6SGvJ6oQ9ZSQauiTOSqhkY
	osPKgA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce9c2v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 May 2025 13:07:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so19881376d6.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 May 2025 06:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450469; x=1747055269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oJ2xkOZreVOLEDBm9yTWCFsnyfq9hqlhNlEZZUyUYhE=;
        b=gLuaphcwIvyN68t2pMNWlLqR1V4ZBQtHXKMSv/+y7oqrQdlWvDPCT8tqr0rWwZtRoW
         DSJYdZBWXNPeeNCTXbw/JfN6tfv0RlAZ+EovFivwW4mfox40IlOxh71vy2vis8/UB0c4
         HCr3c1+EtCfRV/L7XhXxgODVMm/Amqi6tqYdjvHg8NpCZFgzMZgwruV874SLwPiq436h
         cJQEGpESQk5TYroZFyQZxM9fcREyNqXb0WFnQUEnDNumzhX6ntVW/POpzR2ybYuTYB4T
         DNzdfLtPT7tQbu8oFz2+12ZTPGKQJjCl/QEi2Mbjh04aPOVHjlNnevn1bI2a8S7NGw8c
         ChAw==
X-Forwarded-Encrypted: i=1; AJvYcCUwBCodz7ZYKFmCjerVQZLY13DRZjM9NgUMyECRvDAXG2odRDG9o44CvjNVwBom6iaE7ZuScSBlKEaXq31mGFF7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0duI3DjJyahVMV94BItCx0RYfn/NDEH/hgm5Lj3OmJLSibw6k
	ALf4jqPWH7ZHlSdC/1yDr1CSWUR7pCvyzoC2zK2G5epLQSldDHNoRfnlA4U/lx/N/MUoQyZP798
	Zz4O1g8nUXgiGMPiCR3vX50L437AaUFQuZSduSd0RM9p3yKGM42NVWQXgwvAYCsZw+DCX
X-Gm-Gg: ASbGncuPTVvsGWTfOEZSGQzdkmopzzvA/7OEQOKMhMcH3WiC/LWJK9tuBfZgviPowVj
	mXMkRzDNguE6f7JYtUBZxxyWyKJMfggaGWuGIdLDfVr3lLT8t6I9nufVv1GpZN16vUNLnPUdlS1
	7KFR8/yzuuj4qEoN342GPq90rmp5FYpJoPmNWTSGQ6mBoV2EmxLOySFXsOg0V14Ezy88o73S/UX
	DmNipfhikG6Vz+n8DSV9wMwVIH0CYFM3zLoLeccqO51lDRgsd6OR+ZhnaOP1GLbV40OX8sxRBsT
	9lGvQ9XHJfyHIjXjWDOQWtPyo6m58wRNUJmXs3UhRSxqJLr23T4DLnuIkWV0hcSf1Pk=
X-Received: by 2002:a05:620a:24ce:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7cad5b618bamr628257885a.7.1746450468849;
        Mon, 05 May 2025 06:07:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjHQXQJA0Wg7e8FXr0tEryYns4283mrVA0VshcEjXdpS+g9SWnQrrJmYkgMZ1/GNoTTXSE8w==
X-Received: by 2002:a05:620a:24ce:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7cad5b618bamr628256385a.7.1746450468376;
        Mon, 05 May 2025 06:07:48 -0700 (PDT)
Received: from [192.168.65.169] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950b5a6sm488310466b.155.2025.05.05.06.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:07:47 -0700 (PDT)
Message-ID: <9e8c9de6-19a9-44bc-83b7-5947bb626962@oss.qualcomm.com>
Date: Mon, 5 May 2025 15:07:45 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 3/6] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
To: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-4-gokul.sriram.p@oss.qualcomm.com>
 <72f0d4f7-8d8a-4fc5-bac2-8094e971a0e3@oss.qualcomm.com>
 <538b32d1-c7b7-41b5-aa93-d285604d1f05@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <538b32d1-c7b7-41b5-aa93-d285604d1f05@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEyNiBTYWx0ZWRfX+marwKVOpa0B
 exHLNhKp+l8499NW2VXsGawYGSclsMsoFkJJiWf+XFm6O/AWhYgcBJIrbge2VmHPl4QUQE+HkHh
 npA+ju+pc31q0eg6tw47Aa8b8beraSeQ9eTsYxhgCrBDOXtyaSur34GmiBTOb84beW6tZ3NIQzY
 xe4g06gisjGOhJiTLRpLYoc7DtIIMYd7skkIFfCrA0ElrroNStlHcVc3Cymd25PPMV8qteG/Ahh
 TzG6q4IvCtiscqFbWTSwFPWMBWaEFAJ8UbXdncIq0dQeGsjPjsjrH6kwGowp+Tni9mQZaqN95f2
 Xc0DTtmA9jtSpjOuV4iOJDys08/U4jlZwuGYvLG/RWu2RmSNBWO8iMpYAWAe/MgQ0mPSYkGwVna
 ATKrKgZcJQt9QJ5UpWBT57T/vJGxLGqbqgBzAlsf99xuivnirCmexSbsLoecRFbmcGh/ANOP
X-Proofpoint-ORIG-GUID: ib2A4WYi9RqHqgRK1MnmgIe5AfAggc6i
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=6818b826 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=3J7CewlSCtftuwbhWDwA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ib2A4WYi9RqHqgRK1MnmgIe5AfAggc6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=674 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050126

On 5/5/25 2:30 PM, Gokul Sriram P wrote:
> 
> On 4/25/2025 5:17 PM, Konrad Dybcio wrote:
>> On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
>>> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>>>
>>> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
>>> SoCs support secure Peripheral Image Loading (PIL).
>>>
>>> Secure PIL image is signed firmware image which only trusted software such
>>> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
>>> Peripheral Authentication Service (PAS) request to TZ to authenticate and
>>> load the PIL images. This change also introduces secure firmware
>>> authentication using Trusted Management Engine-Lite (TME-L) which is
>>> supported on IPQ5424 SoC. This driver uses mailbox based PAS request to
>>> TME-L for image authentication if supported, else it will fallback to use
>>> SCM call based PAS request to TZ.
>>>
>>> In order to avoid overloading the existing WCSS driver or PAS driver, we
>>> came up with this new PAS based IPQ WCSS driver.
>>>
>>> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +static int wcss_sec_start(struct rproc *rproc)
>>> +{
>>> +	struct wcss_sec *wcss = rproc->priv;
>>> +	struct device *dev = wcss->dev;
>>> +	int ret;
>>> +
>>> +	ret = qcom_q6v5_prepare(&wcss->q6);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (!IS_ERR_OR_NULL(wcss->mbox_chan)) {
>> You abort probe if wcss->mbox_chan returns an errno, please rework
>> this to use if (use_tmelcom) or something
> 
> Hi Konrad,
> 
> do you mean to use 'use_tmelcom' variable from driver descriptor? If
> yes, what if mbox_request_channel( ) failed?
> 
> or based on wcss->mbox_chan, should I set 'use_tmeeiihcckgddglcom' to
> true or false and use it?

Add 'use_tmelcom' in match data and then make decisions based on it
if the mailbox channel get fails and use_tmelcom is true, fail probing
etc.

Konrad

