Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B80F61FFE69
	for <lists+linux-remoteproc@lfdr.de>; Fri, 19 Jun 2020 01:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729992AbgFRXAj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 18 Jun 2020 19:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730306AbgFRXAg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Jun 2020 19:00:36 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5101C0613EE
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2020 16:00:36 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id i4so6120364iov.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2020 16:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WWegyLOphUdUq2xMzuao7on0U+YW/ae33XwIxQCwUhM=;
        b=Lu3YAJ2Tj3Z8rdEUDrzl1hkWBmyhBLIXG0haNA5uDuo58/nFlzD0rebF/jhUdU5k9d
         p3TtBODyabnZLauFmVG+PAVTnYHbU3X8umC5yic5wRY226pPFlrWYuaC12y+iAKfzX+8
         hzCcM4UQu2Pdc3TNMNjqtNpFOtsiN5S/LeIUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WWegyLOphUdUq2xMzuao7on0U+YW/ae33XwIxQCwUhM=;
        b=krPdu5YqJYCvPzp1K3yL+JnFYefDvRUCYupTUGVj4NlCOXdiCehSg8LWFsxpjTFE6z
         k4wC1X0dtVw1G5/PpdrjiRV2TvLkZegvw9sSP6oCG4WcuEAvhkc00+QWOFyBFRtzswbU
         FPUNdLtleGfj67l2NK/NVVKazKEsvrABtUcsREoaCYS2lA3M5Txbo1Em1UT8oTX99oQc
         urlFVAhetPyPsuGYaNPIgDB53SJS74H965sfOlnySeLjdibuLkWQNQgBWrj7g8ZQkO+9
         E+DVD4zq00cQ3uAPr8fFClu1i+hE3I3ufak7SPfRkoiA5JAyqHLeKYGAHNFlRBhUb2zi
         O0/Q==
X-Gm-Message-State: AOAM531GRFLPpM/OC/h6SerDEh0BM1NvuPyV9pdxnCCLzN+aiC5Oi3NX
        OvCxsZUHKISnzBvpv4FMh5EovA==
X-Google-Smtp-Source: ABdhPJync4oY1K3Sw6X56Wque2/ctwSaQw+z+Wj62V5N5JjoYGkQXRgu3cWHiu4XdBmaioxe8ZkilQ==
X-Received: by 2002:a05:6602:2e05:: with SMTP id o5mr1185592iow.28.1592521235677;
        Thu, 18 Jun 2020 16:00:35 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id m18sm2199101ilj.11.2020.06.18.16.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 16:00:35 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] remoteproc: qcom: Add notification types to SSR
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org
References: <1590636883-30866-1-git-send-email-rishabhb@codeaurora.org>
 <1590636883-30866-3-git-send-email-rishabhb@codeaurora.org>
From:   Alex Elder <elder@ieee.org>
Message-ID: <c7c2d4ac-3d09-d28b-0d21-9ac6e9e10172@ieee.org>
Date:   Thu, 18 Jun 2020 18:00:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1590636883-30866-3-git-send-email-rishabhb@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 5/27/20 10:34 PM, Rishabh Bhatnagar wrote:
> From: Siddharth Gupta <sidgup@codeaurora.org>
> 
> The SSR subdevice only adds callback for the unprepare event. Add callbacks
> for unprepare, start and prepare events. The client driver for a particular

   for prepare, start, and stop events

> remoteproc might be interested in knowing the status of the remoteproc
> while undergoing SSR, not just when the remoteproc has finished shutting
> down.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>   drivers/remoteproc/qcom_common.c      | 46 +++++++++++++++++++++++++++++++++--
>   include/linux/remoteproc/qcom_rproc.h | 14 +++++++++++
>   2 files changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 61ff2dd..5c5a1eb 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -228,7 +228,7 @@ struct qcom_ssr_subsystem *qcom_ssr_get_subsys(const char *name)
>    *
>    * This registers the @nb notifier block as part the notifier chain for a
>    * remoteproc associated with @name. The notifier block's callback
> - * will be invoked when the particular remote processor is stopped.
> + * will be invoked when the particular remote processor is started/stopped.

Maybe something more like:
   will be invoked when an SSR event occurs for the named
   remote processor.

>    */
>   void *qcom_register_ssr_notifier(const char *name, struct notifier_block *nb)
>   {
> @@ -258,6 +258,44 @@ int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb)
>   }
>   EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
>   
> +static int ssr_notify_prepare(struct rproc_subdev *subdev)
> +{
> +	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> +	struct qcom_ssr_notif_data data = {
> +		.name = ssr->info->name,
> +		.crashed = false,
> +	};
> +
> +	srcu_notifier_call_chain(&ssr->info->notifier_list,
> +				 QCOM_SSR_BEFORE_POWERUP, &data);
> +	return 0;
> +}
> +
> +static int ssr_notify_start(struct rproc_subdev *subdev)
> +{
> +	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> +	struct qcom_ssr_notif_data data = {
> +		.name = ssr->info->name,
> +		.crashed = false,
> +	};
> +
> +	srcu_notifier_call_chain(&ssr->info->notifier_list,
> +				 QCOM_SSR_AFTER_POWERUP, &data);
> +	return 0;
> +}
> +
> +static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
> +{
> +	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> +	struct qcom_ssr_notif_data data = {
> +		.name = ssr->info->name,
> +		.crashed = crashed,
> +	};
> +
> +	srcu_notifier_call_chain(&ssr->info->notifier_list,
> +				 QCOM_SSR_BEFORE_SHUTDOWN, &data);
> +}
> +
>   static void ssr_notify_unprepare(struct rproc_subdev *subdev)
>   {
>   	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> @@ -266,7 +304,8 @@ static void ssr_notify_unprepare(struct rproc_subdev *subdev)
>   		.crashed = false,
>   	};
>   
> -	srcu_notifier_call_chain(&ssr->info->notifier_list, 0, &data);
> +	srcu_notifier_call_chain(&ssr->info->notifier_list,
> +				 QCOM_SSR_AFTER_SHUTDOWN, &data);
>   }
>   
>   
> @@ -294,6 +333,9 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
>   
>   	mutex_unlock(&qcom_ssr_subsys_lock);
>   	ssr->info = info;
> +	ssr->subdev.prepare = ssr_notify_prepare;
> +	ssr->subdev.start = ssr_notify_start;
> +	ssr->subdev.stop = ssr_notify_stop;
>   	ssr->subdev.unprepare = ssr_notify_unprepare;
>   
>   	rproc_add_subdev(rproc, &ssr->subdev);
> diff --git a/include/linux/remoteproc/qcom_rproc.h b/include/linux/remoteproc/qcom_rproc.h
> index 58422b1..a558183 100644
> --- a/include/linux/remoteproc/qcom_rproc.h
> +++ b/include/linux/remoteproc/qcom_rproc.h
> @@ -5,6 +5,20 @@
>   
>   #if IS_ENABLED(CONFIG_QCOM_RPROC_COMMON)
>   
> +/**
> + * enum qcom_ssr_notif_type - Different stages of remoteproc notifications
> + * @QCOM_SSR_BEFORE_SHUTDOWN:	unprepare stage of  remoteproc
> + * @QCOM_SSR_AFTER_SHUTDOWN:	stop stage of  remoteproc
> + * @QCOM_SSR_BEFORE_POWERUP:	prepare stage of  remoteproc
> + * @QCOM_SSR_AFTER_POWERUP:	start stage of  remoteproc

I think your explanations of these symbols are less clear than
the symbol names themselves...  In any case, I wouldn't refer
to these as "stages of notifications" but instead something
more like startup/shutdown related events for a remote processor.

I personally might have ordered them differently too:
So maybe more like:
	BEFORE_POWERUP	Remoteproc about to start (prepare)
	AFTER_POWERUP	Remoteproc is running (start)
	BEFORE_SHUTDOWN	Remoteproc crashed, or shutting down (stop)
	AFTER_SHUTDOWN	Remoteproc is down (unprepare)

					-Alex
	
> + */
> +enum qcom_ssr_notif_type {
> +	QCOM_SSR_BEFORE_SHUTDOWN,
> +	QCOM_SSR_AFTER_SHUTDOWN,
> +	QCOM_SSR_BEFORE_POWERUP,
> +	QCOM_SSR_AFTER_POWERUP,
> +};
> +
>   struct qcom_ssr_notif_data {
>   	const char *name;
>   	bool crashed;
> 

