Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE91C16AFB7
	for <lists+linux-remoteproc@lfdr.de>; Mon, 24 Feb 2020 19:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbgBXSxi (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 24 Feb 2020 13:53:38 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45672 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbgBXSxh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 24 Feb 2020 13:53:37 -0500
Received: by mail-pf1-f195.google.com with SMTP id 2so5787271pfg.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Feb 2020 10:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5o+NRLE+XeQOQqO+QGCBe9virQiAW2Yqk+LqPr6RM+k=;
        b=zlXKmr/tXaX2hjWqTpQ2njtzL2v39uLcpNTrh6YWx5o5mRLOnjMG0dB9wXvhmk4/QP
         mszWYPx63JNQ0rNx9QhLrp2Ty2oJ62q/wHOeDBTmyJcxFUC2gD/GsB94xMpHsLz+SIJo
         oaU2MtzeREnx5KcWl+gpwnp9dGoL2pvM6cwAVb26fFIAjgMLcUidsFJSrGce6IY2ddtH
         DHHkfjIClkjdJ9Ksj84wcjHPezT++M655R7NO5VWHNuSwIANqs/8bQtR2iHA5Av/beM6
         Yt9YlYL4zMXwazL8tbEG1TVgex9D/w4/dlMdEuSmroq2NvA+xmREquf6s839RLDJS8GH
         gQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5o+NRLE+XeQOQqO+QGCBe9virQiAW2Yqk+LqPr6RM+k=;
        b=m0T9wVKMHrLFsstDSBrLLJhY/O/OJOqATKDw7wazHiihYENDd0X/36jcUhNwEBKrsh
         S7tq67LP3OcXfAtBIqvMuvXvaf5JNUYbbbhq+qfkbcI4Coyjgkl/8P2uQxPcUV8RDoey
         hkz+TSGI9yGpoeWgEpYHhQgX57Pd0+92jPrdB6dhVrLyyaMwgrP17Vo7u6RzT4hBcy+d
         XlLQzQ68NkyaNO2OUoqKMbBrA4m+Y/uAEaFAG66xcmQ7Hxs9o3ulYGGNS3QzBXrioBoB
         xO8sA9PneL7+410s43bjkaadCYBjIRWQqR3aZLIJmMqjWV/fb5wVrDd4YVPeFwPRhaeU
         dKng==
X-Gm-Message-State: APjAAAWnbN62JszIe70mqjca7vOWR+22gbuiskwG4bXaQPwr5O/Efx3V
        SnKlbE8qG5NZkaHFXXFDAj8VBsxDVbY=
X-Google-Smtp-Source: APXvYqxlG79nw9hdnewWjUWulRuruSK0ApRJJQ/cb+aNxOv7rQwCZTRuCo/oWDO8TH8Xl6qVAeD9iw==
X-Received: by 2002:a63:7ce:: with SMTP id 197mr44461643pgh.429.1582570417176;
        Mon, 24 Feb 2020 10:53:37 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j4sm13931577pfh.152.2020.02.24.10.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 10:53:36 -0800 (PST)
Date:   Mon, 24 Feb 2020 11:53:34 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH 2/2] remoteproc: core: Prevent sleep when rproc crashes
Message-ID: <20200224185334.GB9477@xps15>
References: <1582164713-6413-1-git-send-email-sidgup@codeaurora.org>
 <1582164713-6413-3-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582164713-6413-3-git-send-email-sidgup@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Feb 19, 2020 at 06:11:53PM -0800, Siddharth Gupta wrote:
> Remoteproc recovery should be fast and any delay will have an impact on the
> user-experience. Use power management APIs (pm_stay_awake and pm_relax) to
> ensure that the system does not go to sleep.

When you say "ensure the system does not go to sleep", you're referring to the
system going idle from the CPUidle subsystem? 

> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 5ab65a4..52e318c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1712,6 +1712,8 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  
>  	if (!rproc->recovery_disabled)
>  		rproc_trigger_recovery(rproc);
> +
> +	pm_relax(&rproc->dev);
>  }
>  
>  /**
> @@ -2242,6 +2244,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>  		return;
>  	}
>  
> +	pm_stay_awake(&rproc->dev);
> +

I fail to understand how this can be useful since there is no HW associted to
rproc->dev...  Is it possible for you to elaborate more on the problem you're
trying to fix?

Thanks,
Mathieu

>  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>  		rproc->name, rproc_crash_to_string(type));
>  
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
