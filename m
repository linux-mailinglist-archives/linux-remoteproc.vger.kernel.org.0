Return-Path: <linux-remoteproc+bounces-4595-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B56B42373
	for <lists+linux-remoteproc@lfdr.de>; Wed,  3 Sep 2025 16:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CD317B7965
	for <lists+linux-remoteproc@lfdr.de>; Wed,  3 Sep 2025 14:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7250730F921;
	Wed,  3 Sep 2025 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ImSTfEzI"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC193093C4
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Sep 2025 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909306; cv=none; b=ugCvJxh4jaRpLlPW92OByiAfet4Pca19oEwqgxz0/VGCpqCbXDgLTkcHOBs2If4bhUUifvOdK3WhDatmemlLTWPu2Gy/rVmLNLJ6/JL62mgIrsdwmEuRouvrEoUZZYnlOHQD3+BANoS/0H4BfWNdZtpG094GHGoVwIDK2Sjs9vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909306; c=relaxed/simple;
	bh=tcJUS2DcL8AHkuxDrMrWb2CHMBYd3+1ne8RjXT9OhM4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=duJavMe+S3+zKbRBM7OZUoWtnV8rjMYRUsh0eKsPeqzAs2IB0eqyUta1p8rNIJCnnriuc2xIhI33XfnVHepxfa2yJPA/rgRrLJlZ+FQ38xkZDnYSv61dpPi0DcsF037Scmug0AF44yckUM2bW9B06scavLn4QZHbmG7u77NQGxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ImSTfEzI; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3cf991e8c82so3785453f8f.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Sep 2025 07:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756909301; x=1757514101; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EKgV79vNJU4zyM3bSPnCgocGy52AMMMPuwaDPx5dsvI=;
        b=ImSTfEzIBwJHTPyStVJYM5zz8Y5s7cEscim7BwnZeBeUU477LUmq8j5mly1OqyLndP
         8d1pIjSj9T0a+p8QrDdGX1yZz9m45sMcNVpvf5uC25doJFC0FWL99Px9B5KiJAWBuprb
         sy23cAk2cLcyZ5Siu5tfNZprWvT/9RdS+ePhFQPN/t3J90eR5FsjuvxY7Y1hVyMwr9pf
         5mC+wiTXWfk6RsM9Pq4yp+L43vNAEEGOh6eHs2P1mqrn3h/ykopf9iteOtlMNzf9s6CZ
         IicDwyRD2pfBQWGOH/PTPdO6gO23upR3KlCp/yTIrzolKBZQ/xTXb/AMulLAZXASLq6b
         yruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756909301; x=1757514101;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EKgV79vNJU4zyM3bSPnCgocGy52AMMMPuwaDPx5dsvI=;
        b=YACX6mKPXX9OKMIvZ9rAG3CuBuklUOvXHgRWjcfQywKReX+6H3QnluuBWAqAp45VUl
         zCs1MQflkyiLCp11qXD/1wK0SdAh3+CjQ/UkwLFEhXb/FY9VAeQK6//z2phoZbKgNS+5
         Keh7CotzPAobZU33+oiHbukFDt/AprH89P3bHWnvNqfVykbNDLntOiADB/2XXVJHgd2k
         8g1u7v3MB3h5gHIkd0XTY6Ch84orkryDHwT4yXw6I+4/kZKqlGXRQDcOkI5PIdPjQr/c
         A0i+EBc9Y6+plQ8dd3eumZ2VZ2TPATnfjAZyYyMvdpOtWePfgE3iJQJf59Lf7HGmNBXf
         zw5A==
X-Forwarded-Encrypted: i=1; AJvYcCWV71JnpLTdhj9FCbY/RuDIFt6qa5XGDHdWdV2p9J4ewSBeHcmOCSmI+3LMhFDO8sBPzOnWPX0baZJxPxM5vQeN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6qO30r74ml04kfF3UhyBLpsmabJVriuBHJBbUEtnyp+lAIXGH
	xQ743Tn4dTIUaWcTny+0AYSL9vlirBWRX4blA3fpLrUDYjlELX30dWyGQ7ku2hsZHXc=
X-Gm-Gg: ASbGncvkHNx4cHdLYn7XS1lmZ5hdoTuzPjCSUsjEYgQk6qQEz2Ps/nLN7ljNkNrZpst
	THmt5sHLBijsZAlUCTbkucQ3bujSH8KV94sSfYYYdwzgrjAAnloQWJgRf3EKIRUS9OC2+oQr7gQ
	JSmhso83uyMzd0OsMGC9vjC8lZJuDLuIe3fHIu1J0VtiT6/7am0HTFFjcW8XB3IxNizmOtGPfj9
	CLgAyzfxiKrlN9dLYQZpfYrPpMFuI2cOTu3xvHYBCpYO73akV2ygRQxvDi9uEvcK1iPOMtdWBLY
	+isSC8koZdGJPC2XIBGu/LQFDWh8S7Q5aRdO78zeKy+9OHur6tGB8/bf9p23eM9oJJinHI17HSt
	smvf34aZL8RRNfTy4n0zXL208F0iGkBGGHZATZ33Mhi5+yZMYHfmNoQ/wLYBHsA6DB0XaOKacSd
	v6xWrUrmvvI4/CFw8j5XOuTryeBPz4jQ==
X-Google-Smtp-Source: AGHT+IHwLy799UewuHNrjOzAeeZ8+ixPdy2+Eu6OOxr7kN1BaCwzw1W8vztyyF8g/5pyZ6ez9hw58A==
X-Received: by 2002:a05:6000:290f:b0:3c9:ad8:fec9 with SMTP id ffacd0b85a97d-3d1df539f94mr12117495f8f.58.1756909301221;
        Wed, 03 Sep 2025 07:21:41 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fbb3cdsm7504973f8f.51.2025.09.03.07.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 07:21:40 -0700 (PDT)
Message-ID: <e7cede34-3469-4711-9440-62be22fb66f5@linaro.org>
Date: Wed, 3 Sep 2025 15:21:37 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
 <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
 <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
 <b5a0ad0d-ceba-40d3-a111-0831c4538cea@linaro.org>
 <2g3iwc2en6wh2ucrsth5ontzdwqr7tr6oplxjnfdjsy3lwyyfe@l76frwiadgru>
 <7a7c122f-50e1-476a-939e-9d76e34b1d6a@linaro.org>
Content-Language: en-US
In-Reply-To: <7a7c122f-50e1-476a-939e-9d76e34b1d6a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/09/2025 15:13, Bryan O'Donoghue wrote:
> On 03/09/2025 15:02, Dmitry Baryshkov wrote:
>> On Wed, Sep 03, 2025 at 02:31:55PM +0100, Bryan O'Donoghue wrote:
>>> On 03/09/2025 12:56, Konrad Dybcio wrote:
>>>>> Can you try with this next-20250814 tag ?
>>>> You sent it on the 19th, so it's in your best interest to run a quick
>>>>
>>>> git rebase --onto linux-next/master $(git describe --abbrev=0)
>>>>
>>>> and giving the series a prompt re-test before sending, because there 
>>>> might have
>>>> been incompatible changes, whether ones that would prevent applying, 
>>>> or break
>>>> things functionally
>>>
>>> I can't even find that tag next-20250814 closets thing is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/ 
>> tag/?h=next-20250814
>>
>>>
>>> | * \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   00062ea01d35e - Merge 
>>> tag
>>> 'drm-xe-fixes-2025-08-14' of https://gitlab.freedesktop.org/drm/xe/ 
>>> kernel
>>> into drm-fixes (3 weeks ago)
>>>
>>> but patch #9 in this series stubbornly won't apply to any SHA I've 
>>> tried.
>>>
>>> meh
>>>
>>> ---
>>> bod
>>
> 
> Unfortunately that's not the right SHA though
> 
> git checkout -b next-20250814-test next-20250814
> Switched to a new branch 'next-20250814-test'
> 
> b4 shazam 20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7- 
> ce7a1a774803@oss.qualcomm.com
> Grabbing thread from lore.kernel.org/all/20250812-qcom-tee-using-tee-ss- 
> without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
>    Added from v8: 12 patches
>    Added from v9: 12 patches
> Analyzing 60 messages in the thread
> Analyzing 163 code-review messages
> Will use the latest revision: v9
> You can pick other revisions using the -vN flag
> Checking attestation on all messages, may take a moment...
> ---
>    ✓ [PATCH v9 1/11] tee: allow a driver to allocate a tee_device 
> without a pool
>    ✓ [PATCH v9 2/11] tee: add close_context to TEE driver operation
>    ✓ [PATCH v9 3/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
>    ✓ [PATCH v9 4/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
>    ✓ [PATCH v9 5/11] tee: increase TEE_MAX_ARG_SIZE to 4096
>    ✓ [PATCH v9 6/11] firmware: qcom: scm: add support for object invocation
>    ✓ [PATCH v9 7/11] firmware: qcom: tzmem: export shm_bridge create/delete
>    ✓ [PATCH v9 8/11] tee: add Qualcomm TEE driver
>    ✓ [PATCH v9 9/11] tee: qcom: add primordial object
>    ✓ [PATCH v9 10/11] tee: qcom: enable TEE_IOC_SHM_ALLOC ioctl
>    ✓ [PATCH v9 11/11] Documentation: tee: Add Qualcomm TEE driver
>    ---
>    ✓ Signed: DKIM/qualcomm.com (From: amirreza.zarrabi@oss.qualcomm.com)
> ---
> Total patches: 11
> ---
>   Base: using specified base-commit 
> 33bcf93b9a6b028758105680f8b538a31bc563cf
> Applying: tee: allow a driver to allocate a tee_device without a pool
> Applying: tee: add close_context to TEE driver operation
> Applying: tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
> Applying: tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
> Applying: tee: increase TEE_MAX_ARG_SIZE to 4096
> Applying: firmware: qcom: scm: add support for object invocation
> Applying: firmware: qcom: tzmem: export shm_bridge create/delete
> Applying: tee: add Qualcomm TEE driver
> Applying: tee: qcom: add primordial object
> Applying: tee: qcom: enable TEE_IOC_SHM_ALLOC ioctl
> Applying: Documentation: tee: Add Qualcomm TEE driver
> 
> b4 shazam 20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com
> Grabbing thread from lore.kernel.org/all/20250819165447.4149674-1- 
> mukesh.ojha@oss.qualcomm.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 70 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 0 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>    ✓ [PATCH v2 1/11] firmware: qcom_scm: Introduce PAS context 
> initialization helper
>    ✓ [PATCH v2 2/11] soc: qcom: mdtloader: Add context aware 
> qcom_mdt_pas_load() helper
>    ✓ [PATCH v2 3/11] firmware: qcom_scm: Add a prep version of 
> auth_and_reset function
>    ✓ [PATCH v2 4/11] firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
>      + Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> (✗ 
> DKIM/linaro.org)
>    ✓ [PATCH v2 5/11] firmware: qcom_scm: Add shmbridge support to 
> pas_init/release function
>    ✓ [PATCH v2 6/11] remoteproc: Move resource table data structure to 
> its own header
>    ✓ [PATCH v2 7/11] firmware: qcom_scm: Add 
> qcom_scm_pas_get_rsc_table() to get resource table
>    ✓ [PATCH v2 8/11] soc: qcom: mdt_loader: Add helper functions to map 
> and unmap resources
>    ✓ [PATCH v2 9/11] remoteproc: pas: Extend parse_fw callback to parse 
> resource table
>    ✓ [PATCH v2 10/11] remoteproc: qcom: pas: Enable Secure PAS support 
> with IOMMU managed by Linux
>    ✓ [PATCH v2 11/11] media: iris: Enable Secure PAS support with IOMMU 
> managed by Linux
>    ---
>    ✓ Signed: DKIM/qualcomm.com (From: mukesh.ojha@oss.qualcomm.com)
> ---
> Total patches: 11
> ---
> Applying: firmware: qcom_scm: Introduce PAS context initialization helper
> Applying: soc: qcom: mdtloader: Add context aware qcom_mdt_pas_load() 
> helper
> Applying: firmware: qcom_scm: Add a prep version of auth_and_reset function
> Applying: firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
> Applying: firmware: qcom_scm: Add shmbridge support to pas_init/release 
> function
> Applying: remoteproc: Move resource table data structure to its own header
> Applying: firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get 
> resource table
> Applying: soc: qcom: mdt_loader: Add helper functions to map and unmap 
> resources
> Applying: remoteproc: pas: Extend parse_fw callback to parse resource table
> Patch failed at 0009 remoteproc: pas: Extend parse_fw callback to parse 
> resource table
> error: patch failed: drivers/soc/qcom/mdt_loader.c:22
> error: drivers/soc/qcom/mdt_loader.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am -- 
> abort".
> hint: Disable this message with "git config set advice.mergeConflict false"
> 

Its also possible to apply it manually ...

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c 
b/drivers/remoteproc/qcom_q6v5_pas.c
index 09cada92dfd56..1e0f09bf1ef29 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -408,6 +408,35 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, 
u64 da, size_t len, bool *is
         return pas->mem_region + offset;
  }

+static int qcom_pas_parse_firmware(struct rproc *rproc, const struct 
firmware *fw)
+{
+       struct qcom_pas *pas = rproc->priv;
+       size_t output_rt_size = MAX_RSCTABLE_SIZE;
+       void *output_rt;
+       int ret;
+
+       ret = qcom_register_dump_segments(rproc, fw);
+       if (ret) {
+               dev_err(pas->dev, "Error in registering dump segments\n");
+               return ret;
+       }
+
+       if (!rproc->has_iommu)
+               return ret;
+
+       ret = qcom_scm_pas_get_rsc_table(pas->pas_id, NULL, 0, 
&output_rt, &output_rt_size);
+       if (ret) {
+               dev_err(pas->dev, "error %d getting resource_table\n", ret);
+               return ret;
+       }
+
+       rproc->cached_table = output_rt;
+       rproc->table_ptr = rproc->cached_table;
+       rproc->table_sz = output_rt_size;
+
+       return ret;
+}
+
  static unsigned long qcom_pas_panic(struct rproc *rproc)
  {
         struct qcom_pas *pas = rproc->priv;
@@ -420,7 +449,7 @@ static const struct rproc_ops qcom_pas_ops = {
         .start = qcom_pas_start,
         .stop = qcom_pas_stop,
         .da_to_va = qcom_pas_da_to_va,
-       .parse_fw = qcom_register_dump_segments,
+       .parse_fw = qcom_pas_parse_firmware,
         .load = qcom_pas_load,
         .panic = qcom_pas_panic,
  };
@@ -430,7 +459,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
         .start = qcom_pas_start,
         .stop = qcom_pas_stop,
         .da_to_va = qcom_pas_da_to_va,
-       .parse_fw = qcom_register_dump_segments,
+       .parse_fw = qcom_pas_parse_firmware,
         .load = qcom_pas_load,
         .panic = qcom_pas_panic,
         .coredump = qcom_pas_minidump,
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 3ac19e85d71df..a754e513cd541 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -22,7 +22,6 @@
  #include <linux/slab.h>
  #include <linux/soc/qcom/mdt_loader.h>

-#define MAX_RSCTABLE_SIZE      SZ_16K
  #define RSC_TABLE_HASH_BITS         5  // 32 buckets

  DEFINE_HASHTABLE(qcom_pas_rsc_table_map, RSC_TABLE_HASH_BITS);
diff --git a/include/linux/soc/qcom/mdt_loader.h 
b/include/linux/soc/qcom/mdt_loader.h
index 38475fd528d62..8fb3309d2a71a 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -8,6 +8,8 @@
  #define QCOM_MDT_TYPE_HASH     (2 << 24)
  #define QCOM_MDT_RELOCATABLE   BIT(27)

+#define MAX_RSCTABLE_SIZE      SZ_16K
+
  struct device;
  struct firmware;
  struct qcom_scm_pas_ctx;


