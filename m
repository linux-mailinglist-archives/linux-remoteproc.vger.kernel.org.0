Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E64F13787D
	for <lists+linux-remoteproc@lfdr.de>; Fri, 10 Jan 2020 22:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgAJV2K (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 10 Jan 2020 16:28:10 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:53695 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727078AbgAJV2K (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Jan 2020 16:28:10 -0500
Received: by mail-pj1-f67.google.com with SMTP id n96so1472353pjc.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 10 Jan 2020 13:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=viPNXtvEyDoCmVBCyRALorFNqUyS0KGVGSGNa6vRkAo=;
        b=D2nocuW33MlbdJco1hV0XxUMMz2fsz8BeZNWWmVMjaNj5Rp+hEnyuWtQDy5Ra1LUCL
         K+3CJC7/G2wUykWX1TUg0I3cWIZnAXKAORwPudXX4oO16LJEQnEd7PiJrBlCiAt2EPc6
         htDgLEr38DCUiI6XOBrOnKCgZilQYV6WffG9gw5rJHP6bdkq5spK+HHslOoVzShuyfeR
         bcQoag3NVWugOPleXCmOMWo8MLvhNttQfJ3AZc5Xj4ujt2XBJfvOdvyoeQYUASXhEo/b
         Tq4RZKCDi8/Iv+gvIqoiATCwGTYFOA23e2+3FBN7uKLt+9sOnecSrNEuwaFMc9V9WjAJ
         9XQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=viPNXtvEyDoCmVBCyRALorFNqUyS0KGVGSGNa6vRkAo=;
        b=BcsmxAQGbZ7LmB5hhGdQxt+1jDycwQK0a9KM7UkaaWj670PmIJgQJqPsKIJUw9gbF+
         CSNOxbpoo+9/aR+RtQiQZgWFqQzus2kq23qnYtYePqC7pWtgrJZBWWx8DC+Xj16UNYXU
         RGVxl0jZSvwX8yOCSOHp1Cj+CTmDUMnI0PqAys9f59G0OnMkBqDeon4nf8YwFs6a8irN
         G8UlqB0KudM3ceAh7ohLs1tNcq8TFsh+xMphu2lum50fsekVZa9wZOkohhhglZBsmo7i
         5vgWeMINt8OLo59ARRUcon5T8UKkuhxlkuBshrV75l5uCafEXtksQT/mMu2oM7iuwyoU
         /csA==
X-Gm-Message-State: APjAAAWqv+pScGMeVUfXcIH4BDQ63g/9zAsWj/PRL1RN3UNtro/7D1KE
        thTNysvlukdCz1FI9Fdx+pQu0Q==
X-Google-Smtp-Source: APXvYqzYj/spulZNJS+gjeNidZhhw9Hpm7o2a1Vcck4PUefPZJe/oOIPG4pzu6BMDxg2a/abPqg9vw==
X-Received: by 2002:a17:90a:b009:: with SMTP id x9mr7430144pjq.124.1578691689492;
        Fri, 10 Jan 2020 13:28:09 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id w11sm3685158pgs.60.2020.01.10.13.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 13:28:08 -0800 (PST)
Date:   Fri, 10 Jan 2020 14:28:06 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v2 7/8] remoteproc: qcom: q6v5: Add common panic handler
Message-ID: <20200110212806.GD11555@xps15>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-8-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191227053215.423811-8-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Dec 26, 2019 at 09:32:14PM -0800, Bjorn Andersson wrote:
> Add a common panic handler that invokes a stop request and sleep enough
> to let the remoteproc flush it's caches etc in order to aid post mortem
> debugging.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - None
> 
>  drivers/remoteproc/qcom_q6v5.c | 19 +++++++++++++++++++
>  drivers/remoteproc/qcom_q6v5.h |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index cb0f4a0be032..17167c980e02 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -6,6 +6,7 @@
>   * Copyright (C) 2014 Sony Mobile Communications AB
>   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
>   */
> +#include <linux/delay.h>
>  #include <linux/kernel.h>
>  #include <linux/platform_device.h>
>  #include <linux/interrupt.h>
> @@ -15,6 +16,8 @@
>  #include <linux/remoteproc.h>
>  #include "qcom_q6v5.h"
>  
> +#define Q6V5_PANIC_DELAY_MS	200
> +
>  /**
>   * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
>   * @q6v5:	reference to qcom_q6v5 context to be reinitialized
> @@ -162,6 +165,22 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
>  }
>  EXPORT_SYMBOL_GPL(qcom_q6v5_request_stop);
>  
> +/**
> + * qcom_q6v5_panic() - panic handler to invoke a stop on the remote
> + * @q6v5:	reference to qcom_q6v5 context
> + *
> + * Set the stop bit and sleep in order to allow the remote processor to flush
> + * its caches etc for post mortem debugging.
> + */
> +void qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
> +{
> +	qcom_smem_state_update_bits(q6v5->state,
> +				    BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
> +
> +	mdelay(Q6V5_PANIC_DELAY_MS);

I really wonder if the delay should be part of the remoteproc core and
configurable via device tree.  Wanting the remote processor to flush its caches
is likely something other vendors will want when dealing with a kernel panic.
It would be nice to see if other people have an opinion on this topic.  If not
then we can keep the delay here and move it to the core if need be.

Thanks,
Mathieu

> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
> +
>  /**
>   * qcom_q6v5_init() - initializer of the q6v5 common struct
>   * @q6v5:	handle to be initialized
> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
> index 7ac92c1e0f49..c37e6fd063e4 100644
> --- a/drivers/remoteproc/qcom_q6v5.h
> +++ b/drivers/remoteproc/qcom_q6v5.h
> @@ -42,5 +42,6 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
>  int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
>  int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5);
>  int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
> +void qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
>  
>  #endif
> -- 
> 2.24.0
> 
