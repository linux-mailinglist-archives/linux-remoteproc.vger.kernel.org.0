Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1F6C159619
	for <lists+linux-remoteproc@lfdr.de>; Tue, 11 Feb 2020 18:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbgBKRYd (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 11 Feb 2020 12:24:33 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:39416 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727954AbgBKRYc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 11 Feb 2020 12:24:32 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01BHMPuK028693;
        Tue, 11 Feb 2020 18:24:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=G7+OYT/H4500zQ3AfNgJuaeZu4f6W3FUE3Y+JErpRIg=;
 b=pbNH8hHz12cIf9ocniuYvmr7rYCx3VUb9YRq5d/OhyNPI07b1tqvGNz8KApbcVWIcmYA
 0HbFtHxrb3O2y9mPo++TQpU1vtIkjzbU7pXh01dm11sb7xcvN/Tm+cVNh9szvxUZwoGP
 vr5OT78TP6pf12iS2coYz11KEyERKt5TEZJgEDHLWx4uz1WqLK+XwRmOGZIUkCZfxaiV
 03d5CkBLFNayKdSbakEWY/EUiYds0y0yi4UIRtwHqBzIkE7Rd/gg3k8O8036yy64gDh+
 eyCWCDALMa+9u17rWtNRtAown3LO94pvT2z7YrxGlcQ/V0w4FbvPo8PdmT3tEPIIuzZO Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y1ud9q8rw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 11 Feb 2020 18:24:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1A0C100039;
        Tue, 11 Feb 2020 18:24:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D22432C8767;
        Tue, 11 Feb 2020 18:24:08 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.45) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 11 Feb
 2020 18:24:07 +0100
Subject: Re: [PATCH v4 1/5] remoteproc: Use u64 len for da_to_va
To:     =?UTF-8?Q?Cl=c3=a9ment_Leger?= <cleger@kalray.eu>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
References: <527785289.2852303.1581062223707.JavaMail.zimbra@kalray.eu>
 <20200210162209.23149-1-cleger@kalray.eu>
 <20200210162209.23149-2-cleger@kalray.eu>
 <4465bade-e3de-88b8-63a5-e5410de9adc0@st.com>
 <884697376.3644142.1581439161953.JavaMail.zimbra@kalray.eu>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <63c2949f-c1d6-c0aa-b123-906630e3f028@st.com>
Date:   Tue, 11 Feb 2020 18:24:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <884697376.3644142.1581439161953.JavaMail.zimbra@kalray.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-11_05:2020-02-10,2020-02-11 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 2/11/20 5:39 PM, Clément Leger wrote:
> Hi Arnaud,
> 
> ----- On 11 Feb, 2020, at 16:53, Arnaud Pouliquen arnaud.pouliquen@st.com wrote:
> 
>> On 2/10/20 5:22 PM, Clement Leger wrote:
>>> With upcoming changes in elf loader for elf64 support, section size will
>>> be a u64. When used with da_to_va, this will potentially lead to
>>> overflow if using the current "int" type for len argument. Change
>>> da_to_va prototype to use a u64 for len and fix all users of this
>>> function.
>>>
>>> Signed-off-by: Clement Leger <cleger@kalray.eu>
>>> ---
>>>  drivers/remoteproc/imx_rproc.c           | 11 ++++++-----
>>>  drivers/remoteproc/keystone_remoteproc.c |  4 ++--
>>>  drivers/remoteproc/qcom_q6v5_adsp.c      |  2 +-
>>>  drivers/remoteproc/qcom_q6v5_mss.c       |  2 +-
>>>  drivers/remoteproc/qcom_q6v5_pas.c       |  2 +-
>>>  drivers/remoteproc/qcom_q6v5_wcss.c      |  2 +-
>>>  drivers/remoteproc/qcom_wcnss.c          |  2 +-
>>>  drivers/remoteproc/remoteproc_core.c     |  2 +-
>>>  drivers/remoteproc/remoteproc_internal.h |  2 +-
>>>  drivers/remoteproc/st_slim_rproc.c       |  4 ++--
>>>  drivers/remoteproc/wkup_m3_rproc.c       |  4 ++--
>>>  include/linux/remoteproc.h               |  2 +-
>>>  12 files changed, 20 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>>> index 3e72b6f38d4b..f497f5b49b18 100644
>>> --- a/drivers/remoteproc/imx_rproc.c
>>> +++ b/drivers/remoteproc/imx_rproc.c
>>> @@ -186,7 +186,7 @@ static int imx_rproc_stop(struct rproc *rproc)
>>>  }
>>>  
>>>  static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
>>> -			       int len, u64 *sys)
>>> +			       u64 len, u64 *sys)
>>>  {
>>>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>>>  	int i;
>>> @@ -203,19 +203,19 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64
>>> da,
>>>  		}
>>>  	}
>>>  
>>> -	dev_warn(priv->dev, "Translation failed: da = 0x%llx len = 0x%x\n",
>>> +	dev_warn(priv->dev, "Translation failed: da = 0x%llx len = 0x%llx\n",
>>>  		 da, len);
>>>  	return -ENOENT;
>>>  }
>>>  
>>> -static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct imx_rproc *priv = rproc->priv;
>>>  	void *va = NULL;
>>>  	u64 sys;
>>>  	int i;
>>>  
>>> -	if (len <= 0)
>>> +	if (len == 0)
>>>  		return NULL;
>>>  
>>>  	/*
>>> @@ -235,7 +235,8 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da,
>>> int len)
>>>  		}
>>>  	}
>>>  
>>> -	dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%x va = 0x%p\n", da, len, va);
>>> +	dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%llx va = 0x%p\n",
>>> +		da, len, va);
>>>  
>>>  	return va;
>>>  }
>>> diff --git a/drivers/remoteproc/keystone_remoteproc.c
>>> b/drivers/remoteproc/keystone_remoteproc.c
>>> index 5c4658f00b3d..466093f48814 100644
>>> --- a/drivers/remoteproc/keystone_remoteproc.c
>>> +++ b/drivers/remoteproc/keystone_remoteproc.c
>>> @@ -246,7 +246,7 @@ static void keystone_rproc_kick(struct rproc *rproc, int
>>> vqid)
>>>   * can be used either by the remoteproc core for loading (when using kernel
>>>   * remoteproc loader), or by any rpmsg bus drivers.
>>>   */
>>> -static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct keystone_rproc *ksproc = rproc->priv;
>>>  	void __iomem *va = NULL;
>>> @@ -255,7 +255,7 @@ static void *keystone_rproc_da_to_va(struct rproc *rproc,
>>> u64 da, int len)
>>>  	size_t size;
>>>  	int i;
>>>  
>>> -	if (len <= 0)
>>> +	if (len == 0)
>>>  		return NULL;
>>>  
>>>  	for (i = 0; i < ksproc->num_mems; i++) {
>>> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c
>>> b/drivers/remoteproc/qcom_q6v5_adsp.c
>>> index e953886b2eb7..7518e67a49e5 100644
>>> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
>>> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
>>> @@ -270,7 +270,7 @@ static int adsp_stop(struct rproc *rproc)
>>>  	return ret;
>>>  }
>>>  
>>> -static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *adsp_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
>>>  	int offset;
>>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c
>>> b/drivers/remoteproc/qcom_q6v5_mss.c
>>> index 471128a2e723..248febde6fc1 100644
>>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>>> @@ -1148,7 +1148,7 @@ static int q6v5_stop(struct rproc *rproc)
>>>  	return 0;
>>>  }
>>>  
>>> -static void *q6v5_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *q6v5_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct q6v5 *qproc = rproc->priv;
>>>  	int offset;
>>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c
>>> b/drivers/remoteproc/qcom_q6v5_pas.c
>>> index db4b3c4bacd7..cf2cd609c90d 100644
>>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>>> @@ -159,7 +159,7 @@ static int adsp_stop(struct rproc *rproc)
>>>  	return ret;
>>>  }
>>>  
>>> -static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *adsp_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
>>>  	int offset;
>>> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c
>>> b/drivers/remoteproc/qcom_q6v5_wcss.c
>>> index f93e1e4a1cc0..3a6b82a16961 100644
>>> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
>>> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
>>> @@ -406,7 +406,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
>>>  	return 0;
>>>  }
>>>  
>>> -static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct q6v5_wcss *wcss = rproc->priv;
>>>  	int offset;
>>> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
>>> index dc135754bb9c..f893219e45a8 100644
>>> --- a/drivers/remoteproc/qcom_wcnss.c
>>> +++ b/drivers/remoteproc/qcom_wcnss.c
>>> @@ -287,7 +287,7 @@ static int wcnss_stop(struct rproc *rproc)
>>>  	return ret;
>>>  }
>>>  
>>> -static void *wcnss_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *wcnss_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
>>>  	int offset;
>>> diff --git a/drivers/remoteproc/remoteproc_core.c
>>> b/drivers/remoteproc/remoteproc_core.c
>>> index 307df98347ba..9e6d3c6a60ee 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -185,7 +185,7 @@ EXPORT_SYMBOL(rproc_va_to_pa);
>>>   * here the output of the DMA API for the carveouts, which should be more
>>>   * correct.
>>>   */
>>> -void *rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +void *rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>
>> This function is exported, don't see any update in consequence...
>> references:
>> https://elixir.bootlin.com/linux/v5.6-rc1/ident/rproc_da_to_va
>> For instance the function rproc_trace_read use it. it quite strange that my gcc
>> does not warns for the cast but i suppose that some could.
> 
> Agreed, even if len should never have been a signed type since it can't be
> negative. I will try to fix all callers.
> 
>> An indirect consequence is that the len field in rproc_mem_entry struct should
>> probably been updated to u64 to be aligned.
> 
> Ok, I will do that once we settle on the type of len.
> 
>>
>> I'm still wondering about the use of size_t instead,which seems more rational
>> from my window.
>> So i you or Mathieu remember it was decided to use u64, please could remind me
>> the arguments?
> 
> I tried to find the notes of a meeting we had for OpenAMP but I did not found
> them. Anyway, the argument was coming from Tomas or someone else, (I can't
> remember) talking about a 32 bits CPU executing code on a 64 bits accelerator.
> In that case, the size_t type could fail due to being only 32bits on the host
> CPU but larger than 4G.
> 
> However, I can't say if it's a real usecase or not... All I can say is
> that keeping it open is probably better if one day somebody comes with such
> architecture.
> 
>> As an alternative a check should be added for 32 bits processors to ensure that
>> the size is not higher than
>> its address range capability...
> 
> Agreed.
> I was even thinking about a mecanism for remoteproc drivers to declare the type
> of supported elfs files (such as EM_*, ELFCLASS* and other needed thing).
> Or should it be supported by overriding .sanity_check in drivers  to reject
> elf64 for instance ?
> 
> Since elf is a "specific format" and that rproc can support other formats,
> I did not want to add a specific elf_sanity_check field to rproc ops.
Agree, platform driver as to check the format it can support, elf, bin, properitay format....
To check the size, the da_to_va ops seems a good candidate as called for loaded segments and memories.
So ok to delegate the check to the platform driver.

Regards
Arnaud

> 
> Regards,
> 
> Clément
> 
>>
>> Regards
>> Arnaud
>>
>>>  {
>>>  	struct rproc_mem_entry *carveout;
>>>  	void *ptr = NULL;
>>> diff --git a/drivers/remoteproc/remoteproc_internal.h
>>> b/drivers/remoteproc/remoteproc_internal.h
>>> index 493ef9262411..004867061721 100644
>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>> @@ -50,7 +50,7 @@ void rproc_exit_sysfs(void);
>>>  void rproc_free_vring(struct rproc_vring *rvring);
>>>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
>>>  
>>> -void *rproc_da_to_va(struct rproc *rproc, u64 da, int len);
>>> +void *rproc_da_to_va(struct rproc *rproc, u64 da, u64 len);
>>>  phys_addr_t rproc_va_to_pa(void *cpu_addr);
>>>  int rproc_trigger_recovery(struct rproc *rproc);
>>>  
>>> diff --git a/drivers/remoteproc/st_slim_rproc.c
>>> b/drivers/remoteproc/st_slim_rproc.c
>>> index 04492fead3c8..fc01cd879b60 100644
>>> --- a/drivers/remoteproc/st_slim_rproc.c
>>> +++ b/drivers/remoteproc/st_slim_rproc.c
>>> @@ -174,7 +174,7 @@ static int slim_rproc_stop(struct rproc *rproc)
>>>  	return 0;
>>>  }
>>>  
>>> -static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct st_slim_rproc *slim_rproc = rproc->priv;
>>>  	void *va = NULL;
>>> @@ -191,7 +191,7 @@ static void *slim_rproc_da_to_va(struct rproc *rproc, u64
>>> da, int len)
>>>  		}
>>>  	}
>>>  
>>> -	dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%x va = 0x%pK\n",
>>> +	dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%llx va = 0x%pK\n",
>>>  		da, len, va);
>>>  
>>>  	return va;
>>> diff --git a/drivers/remoteproc/wkup_m3_rproc.c
>>> b/drivers/remoteproc/wkup_m3_rproc.c
>>> index 3984e585c847..91485b467407 100644
>>> --- a/drivers/remoteproc/wkup_m3_rproc.c
>>> +++ b/drivers/remoteproc/wkup_m3_rproc.c
>>> @@ -80,14 +80,14 @@ static int wkup_m3_rproc_stop(struct rproc *rproc)
>>>  	return 0;
>>>  }
>>>  
>>> -static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>>> +static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>>>  {
>>>  	struct wkup_m3_rproc *wkupm3 = rproc->priv;
>>>  	void *va = NULL;
>>>  	int i;
>>>  	u32 offset;
>>>  
>>> -	if (len <= 0)
>>> +	if (len == 0)
>>>  		return NULL;
>>>  
>>>  	for (i = 0; i < WKUPM3_MEM_MAX; i++) {
>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>> index 16ad66683ad0..f84bd5fe0211 100644
>>> --- a/include/linux/remoteproc.h
>>> +++ b/include/linux/remoteproc.h
>>> @@ -374,7 +374,7 @@ struct rproc_ops {
>>>  	int (*start)(struct rproc *rproc);
>>>  	int (*stop)(struct rproc *rproc);
>>>  	void (*kick)(struct rproc *rproc, int vqid);
>>> -	void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
>>> +	void * (*da_to_va)(struct rproc *rproc, u64 da, u64 len);
>>>  	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
>>>  	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
>>>  			  int offset, int avail);
