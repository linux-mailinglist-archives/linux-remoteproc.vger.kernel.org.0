Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 796202F55EE
	for <lists+linux-remoteproc@lfdr.de>; Thu, 14 Jan 2021 02:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729749AbhANAFJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 13 Jan 2021 19:05:09 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:48536 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729721AbhANADs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Jan 2021 19:03:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610582602; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=fhLpL3AKfQEqE54s/9FR9dcv2eIlTCG3NXQOw4ROGzg=; b=e7vj7/F2A8gZUtroxMgyQwzx4hHhJw9/iu3X9Em48bmPjSUw4mRvGP/h1c+1NoBwR0+zPMKr
 wyrLVxbyHXw3KhJde/eoWHZsDGPCbf6LmYce9GSXE51dFAAM/V6Z4uGnaSyiGxbclSAj2SM/
 H9n2UvZ/zfQzSnZj07rVuJfm/Bc=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fff7bc2415a6293c5ff1efc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 23:01:22
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C7B22C433ED; Wed, 13 Jan 2021 23:01:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.10] (cpe-75-83-25-192.socal.res.rr.com [75.83.25.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C799C433CA;
        Wed, 13 Jan 2021 23:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4C799C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
Subject: Re: [PATCH 3/3] soc: qcom: mdt_loader: Read hash from firmware blob
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
References: <1609968211-7579-1-git-send-email-sidgup@codeaurora.org>
 <1609968211-7579-4-git-send-email-sidgup@codeaurora.org>
 <X/elgO+66ibjeL+3@builder.lan>
From:   Siddharth Gupta <sidgup@codeaurora.org>
Message-ID: <ec2a7223-d785-a9f3-d864-3c03e4965be5@codeaurora.org>
Date:   Wed, 13 Jan 2021 15:01:18 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <X/elgO+66ibjeL+3@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 1/7/2021 4:21 PM, Bjorn Andersson wrote:
> On Wed 06 Jan 15:23 CST 2021, Siddharth Gupta wrote:
>
>> Since the split elf blobs will always contain the hash segment, we rely on
> I think it will sounds better if we add "should" in "we should rely on..."
Sure
>
>> the blob file to get the hash rather than assume that it will be present in
>> the mdt file. This change uses the hash index to read the appropriate elf
>> blob to get the hash segment.
>>
>> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
>> ---
>>   drivers/remoteproc/qcom_q6v5_mss.c  |  4 ++--
>>   drivers/soc/qcom/mdt_loader.c       | 38 +++++++++++++++++++++++++++----------
>>   include/linux/soc/qcom/mdt_loader.h |  3 ++-
>>   3 files changed, 32 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 66106ba..74c0229 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -4,7 +4,7 @@
>>    *
>>    * Copyright (C) 2016 Linaro Ltd.
>>    * Copyright (C) 2014 Sony Mobile Communications AB
>> - * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2012-2013, 2020 The Linux Foundation. All rights reserved.
>>    */
>>   
>>   #include <linux/clk.h>
>> @@ -828,7 +828,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>>   	void *ptr;
>>   	int ret;
>>   
>> -	metadata = qcom_mdt_read_metadata(fw, &size);
>> +	metadata = qcom_mdt_read_metadata(qproc->dev, fw, qproc->hexagon_mdt_image, &size);
>>   	if (IS_ERR(metadata))
>>   		return PTR_ERR(metadata);
>>   
>> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
>> index c9bbd8c..6876c0b 100644
>> --- a/drivers/soc/qcom/mdt_loader.c
>> +++ b/drivers/soc/qcom/mdt_loader.c
>> @@ -103,15 +103,18 @@ EXPORT_SYMBOL_GPL(qcom_mdt_get_size);
>>    *
>>    * Return: pointer to data, or ERR_PTR()
>>    */
>> -void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
>> +void *qcom_mdt_read_metadata(struct device *dev, const struct firmware *fw, const char *firmware,
>> +			     size_t *data_len)
>>   {
>>   	const struct elf32_phdr *phdrs;
>>   	const struct elf32_hdr *ehdr;
>> -	size_t hash_offset;
>> +	const struct firmware *seg_fw;
>>   	size_t hash_index;
>>   	size_t hash_size;
>>   	size_t ehdr_size;
>> +	char *fw_name;
>>   	void *data;
>> +	int ret;
>>   
>>   	ehdr = (struct elf32_hdr *)fw->data;
>>   	phdrs = (struct elf32_phdr *)(ehdr + 1);
>> @@ -137,14 +140,29 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
>>   	if (!data)
>>   		return ERR_PTR(-ENOMEM);
>>   
>> -	/* Is the header and hash already packed */
>> -	if (qcom_mdt_bins_are_split(fw))
>> -		hash_offset = phdrs[0].p_filesz;
>> -	else
>> -		hash_offset = phdrs[hash_index].p_offset;
>> -
>> +	/* copy elf header */
>>   	memcpy(data, fw->data, ehdr_size);
>> -	memcpy(data + ehdr_size, fw->data + hash_offset, hash_size);
>> +
> This seems to duplicates parts of the loop in __qcom_mdt_load(), how
> about breaking this out to a separate
>
> static int mdt_load_segment(struct device *dev, const struct firmware *fw,
> 			    int idx, void *buf, size_t len, bool is_split)
>
> Which either just memcpy from @fw or does the filename and loading
> dance, based on @is_split?
Since mdt_load_segment won't know the name of the firmware without a 
global variable
(which in turn will make it non-reentrant), the idea of creating such a 
function and not passing
the actual name of the firmware seemed wrong.

If we want to pass the firmware name in this function the code size will 
be more or equal to
what we started with. If that is not a problem I can make the changes.

Thanks,
Sid
>
> Regards,
> Bjorn
>
>> +	if (qcom_mdt_bins_are_split(fw)) {
>> +		fw_name = kstrdup(firmware, GFP_KERNEL);
>> +		if (!fw_name) {
>> +			kfree(data);
>> +			return ERR_PTR(-ENOMEM);
>> +		}
>> +		snprintf(fw_name + strlen(fw_name) - 3, 4, "b%02d", hash_index);
>> +
>> +		ret = request_firmware_into_buf(&seg_fw, fw_name, dev, data + ehdr_size, hash_size);
>> +		kfree(fw_name);
>> +
>> +		if (ret) {
>> +			kfree(data);
>> +			return ERR_PTR(ret);
>> +		}
>> +
>> +		release_firmware(seg_fw);
>> +	} else {
>> +		memcpy(data + ehdr_size, fw->data + phdrs[hash_index].p_offset, hash_size);
>> +	}
>>   
>>   	*data_len = ehdr_size + hash_size;
>>   
>> @@ -191,7 +209,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
>>   		return -ENOMEM;
>>   
>>   	if (pas_init) {
>> -		metadata = qcom_mdt_read_metadata(fw, &metadata_len);
>> +		metadata = qcom_mdt_read_metadata(dev, fw, firmware, &metadata_len);
>>   		if (IS_ERR(metadata)) {
>>   			ret = PTR_ERR(metadata);
>>   			goto out;
>> diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
>> index e600bae..04ba5e8 100644
>> --- a/include/linux/soc/qcom/mdt_loader.h
>> +++ b/include/linux/soc/qcom/mdt_loader.h
>> @@ -21,6 +21,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
>>   			  const char *fw_name, int pas_id, void *mem_region,
>>   			  phys_addr_t mem_phys, size_t mem_size,
>>   			  phys_addr_t *reloc_base);
>> -void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len);
>> +void *qcom_mdt_read_metadata(struct device *dev, const struct firmware *fw, const char *firmware,
>> +			     size_t *data_len);
>>   
>>   #endif
>> -- 
>> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
