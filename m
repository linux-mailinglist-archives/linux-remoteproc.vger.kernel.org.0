Return-Path: <linux-remoteproc+bounces-3322-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7B5A7C66C
	for <lists+linux-remoteproc@lfdr.de>; Sat,  5 Apr 2025 00:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F5063B822F
	for <lists+linux-remoteproc@lfdr.de>; Fri,  4 Apr 2025 22:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1294F19CD0B;
	Fri,  4 Apr 2025 22:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iurx9Lp8"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95752AD58
	for <linux-remoteproc@vger.kernel.org>; Fri,  4 Apr 2025 22:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743806739; cv=none; b=WeHPdbZdGe1Dq9ncW9+cXQcjdca6zOCLqxxn0aws1etGzwmglQPnbrWBdMAQLUMvnZ1t+xV8hM1j6xfKMdO6I1lRDT0kUQEAc2VzZ/4K/0RNQVoqtku+Sc5PSi0hccklsPrNLext7Zo9g0+sqBd0S0fX3UfbB6Ozj7GlKXDqM4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743806739; c=relaxed/simple;
	bh=m1gX9GcFbYplZKAVf2dpLzUsWbvGAvbVHvpB3DUsvHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z81ju5/QI0k1/RpTK6p8JGLJYmX6KaH8ZLP3nY44znUZnWJXo6EmaHlttNmJ54pvKmTJN2hWTHAKmKMmLfD4GbQN2chcBx6ywGfeYVQAJAWadaorJmzIvQqWC2AVOjFr9v3+5eGv0z48xTN8oa4mTD9SX12FVw/3mrJEZeUr5PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iurx9Lp8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JFsND007734
	for <linux-remoteproc@vger.kernel.org>; Fri, 4 Apr 2025 22:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2uhvyXSGm51v63SQshGF8UzfoAo0KRRwekunhPn4GMo=; b=iurx9Lp8Iu7GsQs9
	e4ZLMVXsyBiA+N65A588YMZduDvZd9Wr047lIl+/rtJVONMac1D0E1La7tlKZx7j
	AsLOKPN2UP8CkIkY5C0/mRITP1GHjlRACVTwcANUpuhUoVhisYQg4fqr7yHHEC1y
	7OgNxT+G1jUm8co39Eq+Q85opYk6LV1FbZPPnq/eE5WK128C+uDFZ21pv33rfnWD
	aKAAPB5KKzWbB7zOtCxt4uksuqBFeVxz8KJUbZhHsVTfqNV9q9ePHuTXe1mTdz66
	d+Qyfbkq7XT4Jb5Z5CiZ1fono3t9xOqwfKjPplOYW5c2HklLt6V+n53tAddMiOmx
	qhZY9Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d533qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 04 Apr 2025 22:45:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4775bdbcdc3so5639151cf.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Apr 2025 15:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743806719; x=1744411519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2uhvyXSGm51v63SQshGF8UzfoAo0KRRwekunhPn4GMo=;
        b=M+4YzDkOaUkCTVmdHDFAckAlCTS1MaublPy3uwDETb6LWmFtJRxcgFaYXioQp46yRg
         ULWDqQuL35R69umNUVg7GRlVwcxgWYsMiY9iUiLrkN6pJi7pR1fjl8uXyd73l/e5r2n1
         DgSsjmR6Pwv6EyxYyr2NRpZ/7iKgGh5NCj5lmjAnhcAh5+DPw2WVqIMPFRQOLK8e91ma
         UO3ZRSJHs4oKdBThj5bb+XuwdtdYAQq/GEMAUPcu6Ye8xBzHrFga5qChlTOqC+Pe1xVV
         4PeBPkHeZo8uZ+P0MeeKmeWKOqyW3GziOZZchrwt/hCaoB84i4Wt4ixTYkCpcOA0IgCH
         4Z6g==
X-Forwarded-Encrypted: i=1; AJvYcCW31BXJgOMZGXIae1E3a5JRpmhGD1+vhSNbitpE5ZhZnvAQ0uw8h6wOjc9O06H/qJq5ZS55IFYEZS88AFUaBb6G@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1C62QT8euB/qntXlgzpVZCX1DORfDUU1B6Lc1cZ+IGHpYztv8
	ae60CFYG2uRCzPqHZzhdEaYrNivVCByWtuYqWpfkaEiaj7rx0LCOLrg0j8741ffth5oimdsl3pZ
	PxkUqb5gHX75N1HukdWB7Hxk/QMn+AZtl7Io6JshSKbUihU4JSmNphjgA8Czfi7d9e3c8
X-Gm-Gg: ASbGncv7spvuzFDGH+b18MnuRP02GxQ0RhzP/z/f1E+YPkCnl1VZhmlrHu+oyVUbTc6
	faIajKJaS0itiW8CSUx4SC1B4/GXHtpp7XPeUcs8sTBGyoN4wVJ9NOk1URaycdLbwyk83qYQgrs
	JgFcdQ5fVYs9VaWFJqDPNzVIA56GpTYPS/vbLSfOjAbYkhX1dBVbXavjIWTIRllI2S3IsAptGCL
	x1RTDD7uADPItbQs8fHTLMdyn8bKGFK3W2ZUT8cFBMUQxaOea3pE3LbDpFroO1ip5HlMzUWy5Es
	OMS5FadBTtECR0Mta3rKprOFRgbiq+bdYy9oa+qQyz+AS9O6I4ZCgjocmY5XDA28LO/BCw==
X-Received: by 2002:a05:622a:18a6:b0:474:f9a1:ffb8 with SMTP id d75a77b69052e-479249a2e14mr27175861cf.10.1743806719000;
        Fri, 04 Apr 2025 15:45:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0NyttOkBeBvbJE9SPv1SD648StVLjdEGJ8edcR+u6rMdRMa0LX6BV1hMzDF/mfBYf5OJLpQ==
X-Received: by 2002:a05:622a:18a6:b0:474:f9a1:ffb8 with SMTP id d75a77b69052e-479249a2e14mr27175681cf.10.1743806718652;
        Fri, 04 Apr 2025 15:45:18 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a6a50sm2998261a12.79.2025.04.04.15.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 15:45:17 -0700 (PDT)
Message-ID: <63831566-2975-4ef8-9057-239e0603adee@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 00:45:15 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/8] soc: qcom: smem: introduce qcom_smem_get_machid()
To: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
 <20250403120304.2345677-5-gokul.sriram.p@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250403120304.2345677-5-gokul.sriram.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s8TxHWFh45UkOT3eGEnzPLhXbp6eSoOj
X-Proofpoint-ORIG-GUID: s8TxHWFh45UkOT3eGEnzPLhXbp6eSoOj
X-Authority-Analysis: v=2.4 cv=bZtrUPPB c=1 sm=1 tr=0 ts=67f06110 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=w6f_H_opvIP2fMNd1lUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxlogscore=979
 mlxscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040157

On 4/3/25 2:03 PM, Gokul Sriram Palanisamy wrote:
> Introduce a helper to return the machid which is used to identify the
> specific board variant derived from the same SoC.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/smem.c       | 26 ++++++++++++++++++++++++++
>  include/linux/soc/qcom/smem.h |  1 +
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index 592819701809..327f7358191d 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -827,6 +827,32 @@ int qcom_smem_get_soc_id(u32 *id)
>  }
>  EXPORT_SYMBOL_GPL(qcom_smem_get_soc_id);
>  
> +/**
> + * qcom_smem_get_machid() - return the machid
> + * @id:	On success, we return the machid here.
> + *
> + * generate machid from HW/SW build ID and return it.
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +
> +int qcom_smem_get_machid(u32 *id)
> +{
> +	struct socinfo *info;
> +
> +	info = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID, NULL);
> +	if (IS_ERR(info))
> +		return PTR_ERR(info);
> +
> +	*id = ((info->hw_plat << 24) |
> +	      (((info->plat_ver & 0xffff0000) >> 16) << 16) |
> +	      ((info->plat_ver & 0x0000ffff) << 8) |
> +	      (info->hw_plat_subtype));

FIELD_PREP + GENMASK, not raw bit ops, please

Is this format specific to this usecase, or is it used more widely?
If the former, it may be better to export these variables separately
and combine them into this specific combination of fields in the
consumer

Konrad

