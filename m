Return-Path: <linux-remoteproc+bounces-2639-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C1E9D2137
	for <lists+linux-remoteproc@lfdr.de>; Tue, 19 Nov 2024 09:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48BADB2157A
	for <lists+linux-remoteproc@lfdr.de>; Tue, 19 Nov 2024 08:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46ADD155C8A;
	Tue, 19 Nov 2024 08:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="oY1IGhx6"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A5215748F;
	Tue, 19 Nov 2024 08:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732003479; cv=none; b=UiqESq51uarKEDEuWlDBlkIb5NimRS150h9qOL3JVbPBdmCNUlXxbN2ibyj2/nYr1U7tQdeR2O8nPW/WPjOCjvq7pL+BWR3JdaMooRSpAB5owrEYseTwSkkBmY7MkwTCm7nJuKZ++HpZ52Z56WEs0uBptUnPaVRdH++NLbl1UcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732003479; c=relaxed/simple;
	bh=hkaUjK2ElUWnUs5VmdeRnC+FfSw//6SU0rPiLEeNkWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MC6g6hPty+yzRYCna72hQCyCXyTRqJpAbRtf7+HzZksVavL9FLe74XODEF95Dnj7F/N52IaEFlmskwpufCf9cz2zdYgkvIcSIwCoAmJr08wCGVqVeIabbRKeK/GpxpYiyGeRrzifGla9JfGIjZRCXHM1IDsaKpbPa9Q5ItJUz1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=oY1IGhx6; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7lLJM013174;
	Tue, 19 Nov 2024 09:04:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	1cbqgsZsZzYjG6c8Z7Y+xn7QVPEktoe77SFvmP4EZP4=; b=oY1IGhx6wbhHg/Xx
	3q7UfFhVqrLsldqkchqS0xGna7I4z4XsLiKeSrHPeT/xA4F5zU1hUnswk0Xr8G+r
	SQy2fKlYhUaCTWgtwdmiaWBhuAuT+tZyYdYpRvXauOiiyYIEtftlzEblWe/siibQ
	R4PCSN78bEZEapuiFX0HbPfgKoW4GV7JYMl+mrc/4dkhr2RQdKcmEKmraK8iY5fQ
	miK+hjkDQmB9+Mu+urYT0g+GMKZYxPDGuF7YhWL8xu1SUArXO/EppnTqxhf71lqQ
	D5IaXtLsozmqhR/6rmuK/034bOIR0ZzRIOMzrzBxSNZh8K+jSJLdwgRZQXH+x4tN
	BTRevQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xknw2xyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 09:04:15 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A763A4002D;
	Tue, 19 Nov 2024 09:03:05 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 655ED251A69;
	Tue, 19 Nov 2024 09:02:18 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 19 Nov
 2024 09:02:18 +0100
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 19 Nov
 2024 09:02:17 +0100
Message-ID: <be493536-aedd-4253-ad42-21821d080f41@foss.st.com>
Date: Tue, 19 Nov 2024 09:02:16 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 4/7] remoteproc: Introduce release_fw optional
 operation
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Jens Wiklander
	<jens.wiklander@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>
References: <20241104133515.256497-1-arnaud.pouliquen@foss.st.com>
 <20241104133515.256497-5-arnaud.pouliquen@foss.st.com>
 <Zzt+7NBdNjyzWZIb@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <Zzt+7NBdNjyzWZIb@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

hello Mathieu,

On 11/18/24 18:52, Mathieu Poirier wrote:
> On Mon, Nov 04, 2024 at 02:35:12PM +0100, Arnaud Pouliquen wrote:
>> This patch updates the rproc_ops struct to include an optional
>> release_fw function.
>>
>> The release_fw ops is responsible for releasing the remote processor
>> firmware image. The ops is called in the following cases:
>>
>>  - An error occurs in rproc_start() between the loading of the segments and
>>       the start of the remote processor.
>>  - after stopping the remote processor.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>> Updates from version V11:
>> - fix typo in @release_fw comment
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 5 +++++
>>  include/linux/remoteproc.h           | 3 +++
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 7694817f25d4..46863e1ca307 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1258,6 +1258,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>>  
>>  static void rproc_release_fw(struct rproc *rproc)
>>  {
>> +	if (rproc->ops->release_fw)
>> +		rproc->ops->release_fw(rproc);
>> +
>>  	/* Free the copy of the resource table */
>>  	kfree(rproc->cached_table);
>>  	rproc->cached_table = NULL;
>> @@ -1377,6 +1380,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>>  unprepare_subdevices:
>>  	rproc_unprepare_subdevices(rproc);
>>  reset_table_ptr:
>> +	if (rproc->ops->release_fw)
>> +		rproc->ops->release_fw(rproc);
>>  	rproc->table_ptr = rproc->cached_table;
> 
> I suggest the following:
> 
> 1) Create two new functions, i.e rproc_load_fw() and rproc_release_fw().  The
> only thing those would do is call rproc->ops->load_fw() and
> rproc->ops->release_fw(), if they are present.  When a TEE interface is
> available, ->load_fw() and ->release_fw() become rproc_tee_load_fw() and
> rproc_tee_release_fw().
> 
> 2) Call rproc_load_fw() in rproc_boot(), just before rproc_fw_boot().  If the
> call to rproc_fw_boot() fails, call rproc_release_fw().
> 
> 3) The same logic applies to rproc_boot_recovery(), i.e call rproc_load_fw()
> before rproc_start() and call rproc_release_fw() if rproc_start() fails.
> 
> 4) Take rproc_tee_load_fw() out of rproc_tee_parse_fw().  It will now be called
> in rproc_load_fw().
> 
> 5) As stated above function rproc_release_fw() now calls rproc_tee_release_fw().
> The former is already called in rproc_shutdown() so we are good in that front.
> 
> With the above the cached_table management within the core remains the same and
> we can get rid of patch 3.7.

Thanks for your suggestion! I will try this in next revision.

Regards,
Arnaud

> 
> Thanks,
> Mathieu
> 
>>  
>>  	return ret;
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 2e0ddcb2d792..08e0187a84d9 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -381,6 +381,8 @@ enum rsc_handling_status {
>>   * @panic:	optional callback to react to system panic, core will delay
>>   *		panic at least the returned number of milliseconds
>>   * @coredump:	  collect firmware dump after the subsystem is shutdown
>> + * @release_fw:	optional function to release the firmware image from ROM memories.
>> + *		This function is called after stopping the remote processor or in case of an error
>>   */
>>  struct rproc_ops {
>>  	int (*prepare)(struct rproc *rproc);
>> @@ -403,6 +405,7 @@ struct rproc_ops {
>>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>>  	unsigned long (*panic)(struct rproc *rproc);
>>  	void (*coredump)(struct rproc *rproc);
>> +	void (*release_fw)(struct rproc *rproc);
>>  };
>>  
>>  /**
>> -- 
>> 2.25.1
>>

