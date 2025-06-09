Return-Path: <linux-remoteproc+bounces-3920-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC53AD23F4
	for <lists+linux-remoteproc@lfdr.de>; Mon,  9 Jun 2025 18:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1483E3A2F0D
	for <lists+linux-remoteproc@lfdr.de>; Mon,  9 Jun 2025 16:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC3F2165F3;
	Mon,  9 Jun 2025 16:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="l5x8CTLt"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950343A1B6;
	Mon,  9 Jun 2025 16:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749486843; cv=none; b=lWblVKsrzm9C+NNOG1dXkBIuh5lA1jn/PBmbjMuCRVzw/NmQbJM+UxlmTqPAOAplqBHIH8F5fRLqsPo7ErbqnRbHzeMTgKYNnguo9UmhJINyyGLF8oiLC/c4NJIdy050VFKmiqn9zDGWJDd2VGEtZt5JQmVKBeQEO8F38CZg5kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749486843; c=relaxed/simple;
	bh=GTnFfGyaol0WHB79nJS8vHJ5V67NBcsQeSu7yPvQUIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LuKRHxbqzHI9v31neKUtX3euiausaFgPBNCPa/uCct3B44LPJNAh3L6IX99VvInQLwtUND6PbuT0UVFC7DZYQwLIYnNtVl7+wXIptTaM2g/lsZ5jQ677AKgXWWDnOjqxbx/uiaO42IEjvDsqS5Ye/N4BCTlOGODuxLdSIU/+Uc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=l5x8CTLt; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559Fxc8D010757;
	Mon, 9 Jun 2025 18:33:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	XdsCmzlviAN7D8zW7RN1bkzetwH59L+fJQ05vlqmlxk=; b=l5x8CTLtU5RADRo6
	SxU13ZIwSRejlojuW9TaZ6uGJVu49k/9cAUsTCzU6JM1hW+eEUkHZOmqDCmbDvW/
	Rlgk3Q1Qw0Ec6ZUMpHN3ajvuStAjAiSDldeDTaB80zeSD8ZjKgXncHounqKYRxlq
	KYsC5TyOe6AsBUlnqsXBz8lAdCYM3qZbLL99yUJrs1vEkXngi73WG39pYvYnWVSC
	O1sUpZeXV3Q2exKZD7j1bWn2VF37XEfHzvFOqHeo7H0zl8vcv1KHTks1Z7m61pn7
	pQTUsZLgeyVgnJLFNYeuKhcmQs37PTvi932ECEProqA/gJ1Oc0yytWrPqRNHkIdS
	61sKNQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cahfx2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 18:33:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 26A7D400CF;
	Mon,  9 Jun 2025 18:32:19 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 70948BF25F3;
	Mon,  9 Jun 2025 18:30:09 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 18:30:09 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 18:30:08 +0200
Message-ID: <7850c6f4-6a6f-4934-895d-9ec0688cda2a@foss.st.com>
Date: Mon, 9 Jun 2025 18:30:07 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v16 0/6] Introduction of a remoteproc tee to load
 signed firmware
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Jens Wiklander
	<jens.wiklander@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>
References: <20250603100808.1074812-1-arnaud.pouliquen@foss.st.com>
 <aEb8XbhY5dR__GM-@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <aEb8XbhY5dR__GM-@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01

Hello Mathieu,

On 6/9/25 17:23, Mathieu Poirier wrote:
> On Tue, Jun 03, 2025 at 12:08:02PM +0200, Arnaud Pouliquen wrote:
>> Hello Bjorn and Mathieu,
>>
>> I am resending this series after waiting for over two months for Bjorn's
>> feedback, despite a prior reminder.
>>
>> Please could you coordinate between yourselves to determine who will continue
>> reviewing this series? It would be greatly appreciated if the review could
>> proceed within a more reasonable timeframe.
>>
>> Thanks in advance and best regards,
>> Arnaud
>>
>>
>> Main updates from version V15[1]:
>> - Removed the rproc_ops:load_fw() operation introduced in the previous version.
>> - Returned to managing the remoteproc firmware loading in rproc_tee_parse_fw to
>>   load and authenticate the firmware before getting the resource table.
>> - Added spinlock and dev_link mechanisms in remoteproc TEE to better manage
>>   bind/unbind.
>>
> 
> Have all pending issues been resolved or is there still questions about some
> aspects of the design?
>  

No pending issues on my side.

In terms of design, I resend an equivalent of the V13 design incorporating
Bjorn's comments on V15.
The pending questions are:
- is that V13/V16 is aligned with Bjorn's expectations[1].
- are you also aligned on this design even if you proposed an alternative that
  implemented in V14 and V15
Few details on the V13/V16 design:

The main point of discussion is the rproc_tee_parse_fw() implementation.
In V13, this function loaded the firmware and then parses the resource table.

You proposed an alternative, to add a new rproc->load ops
in the remoteproc core instead (implemented in V14 and V15).
Bjorn expressed concerns about this and proposed a solution that, from my
understanding, is equivalent to the V13 implementation.

Thanks,
Arnaud


[1] https://lkml.org/lkml/2025/3/5/906

>> More details are available in each patch commit message.
>>
>> [1] https://lore.kernel.org/linux-remoteproc/20241128084219.2159197-7-arnaud.pouliquen@foss.st.com/T/
>>
>> Tested-on: commit 0ff41df1cb26 ("Linux 6.15")
>>
>> Description of the feature:
>> --------------------------
>> This series proposes the implementation of a remoteproc tee driver to
>> communicate with a TEE trusted application responsible for authenticating
>> and loading the remoteproc firmware image in an Arm secure context.
>>
>> 1) Principle:
>>
>> The remoteproc tee driver provides services to communicate with the OP-TEE
>> trusted application running on the Trusted Execution Context (TEE).
>> The trusted application in TEE manages the remote processor lifecycle:
>>
>> - authenticating and loading firmware images,
>> - isolating and securing the remote processor memories,
>> - supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
>> - managing the start and stop of the firmware by the TEE.
>>
>> 2) Format of the signed image:
>>
>> Refer to:
>> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57
>>
>> 3) OP-TEE trusted application API:
>>
>> Refer to:
>> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h
>>
>> 4) OP-TEE signature script
>>
>> Refer to:
>> https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py
>>
>> Example of usage:
>> sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem
>>
>>
>> 5) Impact on User space Application
>>
>> No sysfs impact. The user only needs to provide the signed firmware image
>> instead of the ELF image.
>>
>>
>> For more information about the implementation, a presentation is available here
>> (note that the format of the signed image has evolved between the presentation
>> and the integration in OP-TEE).
>>
>> https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds
>>
>> Arnaud Pouliquen (6):
>>   remoteproc: core: Introduce rproc_pa_to_va helper
>>   remoteproc: Add TEE support
>>   remoteproc: Introduce release_fw optional operation
>>   dt-bindings: remoteproc: Add compatibility for TEE support
>>   remoteproc: stm32: Create sub-functions to request shutdown and
>>     release
>>   remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
>>
>>  .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 +-
>>  drivers/remoteproc/Kconfig                    |  10 +
>>  drivers/remoteproc/Makefile                   |   1 +
>>  drivers/remoteproc/remoteproc_core.c          |  52 ++
>>  drivers/remoteproc/remoteproc_internal.h      |   6 +
>>  drivers/remoteproc/remoteproc_tee.c           | 619 ++++++++++++++++++
>>  drivers/remoteproc/stm32_rproc.c              | 139 +++-
>>  include/linux/remoteproc.h                    |   4 +
>>  include/linux/remoteproc_tee.h                |  90 +++
>>  9 files changed, 935 insertions(+), 44 deletions(-)
>>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
>>  create mode 100644 include/linux/remoteproc_tee.h
>>
>>
>> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
>> -- 
>> 2.25.1
>>

