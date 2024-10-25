Return-Path: <linux-remoteproc+bounces-2540-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB099B0DE0
	for <lists+linux-remoteproc@lfdr.de>; Fri, 25 Oct 2024 21:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A7DC1F2499D
	for <lists+linux-remoteproc@lfdr.de>; Fri, 25 Oct 2024 19:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5012F20D508;
	Fri, 25 Oct 2024 19:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xca6cd/p"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876911FF04A
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Oct 2024 19:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729883274; cv=none; b=aLF1pN0MmfR3rQD+U/3d5uNX+rrYAeYgrQdmirK1fIlOJwge/Uj/nDPx8C1Or4MDKuz4P7lgPTYqLxLaXET2F2XPU8ak5YDrbTAy+QTkvA/KwwYtMgytNgwGegz/MTuY2BOjlFZRADEc5vZQW63Bej7emK8jj69jfzHFIP4huNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729883274; c=relaxed/simple;
	bh=RN6p/B1AQ/O8d9z2eErd1gykqpFN9e+i30QfJL1X89w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7dOeBA6kYmNQKdiZ1cwEMs45VwWPHt0EgBIZWLaQzLbEreT8pjIGKhe+vGzc34LjkU6XEb+wwq9PT22ihj4j4qG3+K8WHoQdW94XI6lctTP55s0Ieo6nZDT20ihHPyv3YAypZwHX6jEX+x5C2Egl/pPHDlgsz5MVwu7rzzA7J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xca6cd/p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAPui7029348
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Oct 2024 19:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pWUHHcRmlCMUYxvgewl9XAQLBFB89oD/yMOwfx0sk6Q=; b=Xca6cd/pZb9RkG9O
	UhIx9CN/vSx2vKsRmQH73bJHKBJv6yuYWUVcnyeCa6owSBB3y6n+YYjVnSfV5bHq
	K2r0W6cyS25Rtp7QdD1jj/n6psUOGUN6c1qlTGFSBwTGOeXGOZkRh7sSO2pTlOt3
	1aUOU7XjRTHdcRlaHx+UEOEwdgu7Zi5A0xi7dbre2mK76OyJFCWEKVwYy622Zz/a
	OnPzNDrND+LBbaEY++5iGjotNt0i9LW/kQE8VGtpdNxn9/xu9DNCcax0bR/6pfB6
	4bQjlu3VZURdZ3UIQjPEPZzau6Ft3U5nODK+wG/VeArJM/DRLDEk9FjUFEu051Ob
	3Lt5jw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wa5ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Oct 2024 19:07:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbf5a3192aso4821186d6.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Oct 2024 12:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729883257; x=1730488057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pWUHHcRmlCMUYxvgewl9XAQLBFB89oD/yMOwfx0sk6Q=;
        b=KGD+jratJIeNRDM2pVxYNowITg2ymV4oA8nwuOVzCvz8X10UMDwUMPqe7BVYlJsfNl
         itHQw7+2DGJa9yxNCyu3Jhi3q9645g6ePAJDRFnEl/j/8s7ZNa7Z9fs0257XE9fYsEXh
         ZoqIXmWs8VXeRV1t+PMO4GaBhMcLiinOlhm+rdNuFt5KzB0kYyZfnJ+PWGb9kVEq6OWY
         JRQ8p0EiHc77cAoZTOra3u7jXzi3bQHKol2dcijmVILV19BK+F3G8+MXG2vxg5W500yV
         iWbyDhiJwuvEi2DRz84FRGdMWvHGpMskhAfzH21KCSb36ar8pGKokgTogTbdg/6o07w/
         h1lw==
X-Forwarded-Encrypted: i=1; AJvYcCXlU7CTHRaUeWrL/0f0UucFm1PRJUjwb6R89n/xUy54lk1bewqCEPlMs1BT2/HBt81MUKsdohUjeRiFdzghedSH@vger.kernel.org
X-Gm-Message-State: AOJu0YwxoLEgbJ0+JzuPprwcF9sOYd4goN9IkqU6cHwfQJoIh7ltnPCw
	x0NMiC30LEpp3E1fzVF5hkgGUQV6cbyl+EZcobPXrM1BXs8fJ3ru7CTbc2ntGolsBywpfjIMron
	MlMrjy5ShrJbkoiswyt62froMB8m9USF6PjsWQkuC139EfSHZjTMjTnjGTpndCpoggVxf
X-Received: by 2002:a05:6214:2628:b0:6cb:6e29:bad4 with SMTP id 6a1803df08f44-6d185862784mr3258246d6.11.1729883257388;
        Fri, 25 Oct 2024 12:07:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFomDmU43rfEFT4JzNZexXnRtc7TNByVK+ixuphjXguBZXTif83yGpvStrHWpPMpElXjP1MYQ==
X-Received: by 2002:a05:6214:2628:b0:6cb:6e29:bad4 with SMTP id 6a1803df08f44-6d185862784mr3258046d6.11.1729883257034;
        Fri, 25 Oct 2024 12:07:37 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dec8169sm98665466b.34.2024.10.25.12.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 12:07:36 -0700 (PDT)
Message-ID: <345b1aa7-1cd5-45b9-9699-d77a83d6760d@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 21:07:34 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] remoteproc: qcom: Enable map/unmap and SHM bridge
 support
To: Mukesh Ojha <quic_mojha@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-7-quic_mojha@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241004212359.2263502-7-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DXsVDpCu7tS6W4sJvmSJqqN7ZJdNzyHK
X-Proofpoint-GUID: DXsVDpCu7tS6W4sJvmSJqqN7ZJdNzyHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=731
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250147

On 4.10.2024 11:23 PM, Mukesh Ojha wrote:
> For Qualcomm SoCs runnning with Qualcomm EL2 hypervisor(QHEE), IOMMU
> translation for remote processors is managed by QHEE and if the same SoC
> run under KVM, remoteproc carveout and devmem region should be IOMMU
> mapped from Linux PAS driver before remoteproc is brought up and
> unmapped once it is tear down and apart from this, SHM bridge also need
> to set up to enable memory protection on both remoteproc meta data
> memory as well as for the carveout region.

!Gunyah != KVM

> Enable the support required to run Qualcomm remoteprocs on non-QHEE
> hypervisors.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---

[...]

>  
> +	if (of_property_present(pdev->dev.of_node, "iommus")) {
> +		struct of_phandle_args args;
> +
> +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus", "#iommu-cells", 0, &args);
> +		if (ret < 0)
> +			return ret;
> +
> +		rproc->has_iommu = true;
> +		adsp->sid = args.args[0];

Do we ignore the SMR mask completely?

This ties the implementation very closely to arm-smmu-v2. While I don't
expect any changes in there, this is something to keep in mind..

Konrad

