Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22128511396
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Apr 2022 10:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232792AbiD0IlU (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 27 Apr 2022 04:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359455AbiD0IlT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Apr 2022 04:41:19 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5FF66AE2;
        Wed, 27 Apr 2022 01:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651048689; x=1682584689;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tFKOQOb1PYbAm7KR5PoNuvuFW3Jwvi6eYvq4MWG+3FU=;
  b=hZ7zxdBGBcwJ/GALMNXW0NN23yu7vRb5AQgVS57jaT6oc1AsmydVy3xE
   pJQI9AQSTX8vbkJHcNUhK87F3GgNipmaCGD3ZuU7qenZ4hVJz3gsEnH96
   bpSJVJjW7nXqPI660rkK9bizeMyxSj8nBaW43eMFQqJr9v/Vns+aNk/H2
   4=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Apr 2022 01:38:09 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 01:38:08 -0700
Received: from [10.110.10.129] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.47.97.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 27 Apr
 2022 01:38:06 -0700
Message-ID: <40e01cd4-638b-175f-75c1-12721b0870f8@quicinc.com>
Date:   Wed, 27 Apr 2022 14:08:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 ] remoteproc: Use unbounded workqueue for recovery work
Content-Language: en-US
To:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <saravanak@google.com>
References: <1650367554-15510-1-git-send-email-quic_mojha@quicinc.com>
From:   Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <1650367554-15510-1-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.47.97.222)
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Missed to add cc:saravanak, sorry for that.

Addressed comment given on v3 here.

https://lore.kernel.org/lkml/20220415004417.1790161-1-saravanak@google.com/

Regards,
-Mukesh

On 4/19/2022 4:55 PM, Mukesh Ojha wrote:
> There could be a scenario when there is too much load on a core
> (n number of tasks which is affined) or in a case when multiple
> rproc subsystem is going for recovery, they queue their recovery
> work to one core so even though subsystem are independent their
> recovery will be delayed if one of the subsystem recovery work
> is taking more time in completing.
> 
> If we make this queue unbounded, the recovery work could be picked
> on any cpu. This patch is trying to address this.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> Changes in v4:
>    - Removed fallback option on @sarvana comment
>    - Fail the init on workqueue creation failure.
>    - modified commit text.
>


> Changes in v3:
>    - Add fallback option to go back to earlier path incase recovery wq
>      creation fails.
> 
> Changes in v2:
>    - Removed WQ_HIGHPRI.
>    - Updated commit text.
> 
> 
>   drivers/remoteproc/remoteproc_core.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c510125..c8a1e3e 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -59,6 +59,7 @@ static int rproc_release_carveout(struct rproc *rproc,
>   
>   /* Unique indices for remoteproc devices */
>   static DEFINE_IDA(rproc_dev_index);
> +static struct workqueue_struct *rproc_recovery_wq;
>   
>   static const char * const rproc_crash_names[] = {
>   	[RPROC_MMUFAULT]	= "mmufault",
> @@ -2755,8 +2756,7 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>   	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>   		rproc->name, rproc_crash_to_string(type));
>   
> -	/* Have a worker handle the error; ensure system is not suspended */
> -	queue_work(system_freezable_wq, &rproc->crash_handler);
> +	queue_work(rproc_recovery_wq, &rproc->crash_handler);
>   }
>   EXPORT_SYMBOL(rproc_report_crash);
>   
> @@ -2805,6 +2805,13 @@ static void __exit rproc_exit_panic(void)
>   
>   static int __init remoteproc_init(void)
>   {
> +	rproc_recovery_wq = alloc_workqueue("rproc_recovery_wq",
> +						WQ_UNBOUND | WQ_FREEZABLE, 0);
> +	if (!rproc_recovery_wq) {
> +		pr_err("remoteproc: creation of rproc_recovery_wq failed\n");
> +		return -ENOMEM;
> +	}
> +
>   	rproc_init_sysfs();
>   	rproc_init_debugfs();
>   	rproc_init_cdev();
> @@ -2818,9 +2825,13 @@ static void __exit remoteproc_exit(void)
>   {
>   	ida_destroy(&rproc_dev_index);
>   
> +	if (!rproc_recovery_wq)
> +		return;
> +
>   	rproc_exit_panic();
>   	rproc_exit_debugfs();
>   	rproc_exit_sysfs();
> +	destroy_workqueue(rproc_recovery_wq);
>   }
>   module_exit(remoteproc_exit);
>   
