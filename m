Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F07501727EB
	for <lists+linux-remoteproc@lfdr.de>; Thu, 27 Feb 2020 19:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729608AbgB0SrK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 27 Feb 2020 13:47:10 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:33570 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729512AbgB0SrK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 27 Feb 2020 13:47:10 -0500
Received: by mail-pj1-f68.google.com with SMTP id m7so3521312pjs.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Feb 2020 10:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lcrpnq/b6/hpdUjJ7BPbI1dg5z0iJwDYFP4cImRT74Q=;
        b=EBgRVvpATZd+QdllWh7NgaqS+BEpB4r+tKv0NcGj8T6IejQ3JSGblsVlM3JqSpvkUp
         KFswIxe3vj9uVxeHURFe7KHbkZfbgW5bpPj2+sz2YA5/jW2xsej+si7DyS+cHQnuFKpo
         Grytv0YQSoYqUtgbsgqWNtco4yYJYJU/3/kItHoEyRlzenpJIgYyjHD9vjzxocZOgYPn
         TGXazEmGe9xX8g35FKQZAe9OTufWqwCCCUsQdMEqjbOJR993VDCAfV4BipMoCXNtpAEn
         8ob3I4Isj6uIVUuuo1HrvNHQT8xlcmUKu/UapSmtGiuvC/+nGD4eGDbki6Jg2Lrk4yAQ
         xqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lcrpnq/b6/hpdUjJ7BPbI1dg5z0iJwDYFP4cImRT74Q=;
        b=EWcWkxCIdWU+v7mT5Fh4Y/b5A/yLa10UBBj6jgdz6aoicoNi16k24AZhNKWxnV8u7B
         AWEfEbKnSguaAxP2koFoy9/zCXENACmBS8j5uXH7aLHKPmoy+qP7MIFoklymXSzVL5b6
         6dbh7sxXOkhBEwF/+J+HBQz9MKSuBuKzRwTa/aUb0rikpj4R7fOvsA3RahHFFhhM+ZFj
         PSpg7fTi0zNRhxNaUhZKFrQ3gXxezjITw225qD3TZ7XfZ6VsiHcWIX24qhBOO/jQPkgl
         VAhWgYdUF92jptY6KcuRXeNtaxCpFtxfioVAIriIBqVJShuA4jlxJXnWt2CoWlaDyW8R
         itbQ==
X-Gm-Message-State: APjAAAW+egnSVqUIPbi8Bzwf1rsM0gMGQM1jGjEQ48jzG2B1yFbk8ZI4
        96I2AB3x9Kj3cAx9/ErcA+zAzA==
X-Google-Smtp-Source: APXvYqyyvmpMV6UxoiAw6oNqpaKxbRnOQVGywr7htIuimBaTBFfOvraztV8a2ntnrTPplYWpShvBMw==
X-Received: by 2002:a17:90a:b386:: with SMTP id e6mr354511pjr.106.1582829229170;
        Thu, 27 Feb 2020 10:47:09 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id e2sm3343567pfh.151.2020.02.27.10.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 10:47:08 -0800 (PST)
Date:   Thu, 27 Feb 2020 11:47:06 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH 3/6] remoteproc: sysmon: Inform current rproc about all
 active rprocs
Message-ID: <20200227184706.GA20116@xps15>
References: <1582167465-2549-1-git-send-email-sidgup@codeaurora.org>
 <1582167465-2549-4-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582167465-2549-4-git-send-email-sidgup@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Feb 19, 2020 at 06:57:42PM -0800, Siddharth Gupta wrote:
> A remoteproc that has just recovered from a crash will not be aware of the
> state of other remoteprocs. Send sysmon notifications on behalf of all the
> active/online remoteprocs to the one that just booted up.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_sysmon.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index 851664e..d0d59d5 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -457,6 +457,7 @@ static int sysmon_start(struct rproc_subdev *subdev)
>  {
>  	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
>  						  subdev);
> +	struct qcom_sysmon *target;
>  	struct sysmon_event event = {
>  		.subsys_name = sysmon->name,
>  		.ssr_event = SSCTL_SSR_EVENT_AFTER_POWERUP
> @@ -464,6 +465,17 @@ static int sysmon_start(struct rproc_subdev *subdev)
>  
>  	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
>  
> +	mutex_lock(&sysmon_lock);
> +	list_for_each_entry(target, &sysmon_list, node) {
> +		if (target == sysmon ||
> +		    target->rproc->state != RPROC_RUNNING)
> +			continue;
> +
> +		event.subsys_name = target->name;
> +		ssctl_send_event(sysmon, &event);
> +	}
> +	mutex_unlock(&sysmon_lock);
> +

The changelog is specific about crash recovery but to me this code will run
every time an MCU is switched on.  If I understand correctly, in a crash
recovery situation or simply an MCU coming on line, you want to make sure the
subdevices associated to the booting (or recovering) MCU knows about subdevices
that were registered with the sysmon_notifiers before it.

If that is the case, the changelog needs to be modified and a good chunk of
comments need to be added to this patch.

Lastly, shouldn't there be a provision for sysmon->ssctl_version == 2?

Thanks,
Mathieu 

>  	return 0;
>  }
>  
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
