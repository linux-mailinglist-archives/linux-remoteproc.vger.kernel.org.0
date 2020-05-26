Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD3E1CFE15
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 May 2020 21:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgELTOF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 12 May 2020 15:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgELTOE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 May 2020 15:14:04 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6446C061A0F
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2020 12:14:04 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a7so9880905pju.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2020 12:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8VAWJvEx809/evnC9HkWYNOh4uNvamJHZhEDIvsQGJg=;
        b=qQiCjD3T9CULb/q9bhJP94W6BH8SG7q3MvKH6FepDbpRQlAn3VpAzhZpuxHI7npENn
         2uNO9Aklh7RPnI1S6JqXoiLU8h1UwmAOmEuyJqiU1ZsTu1LgO8nFTmnkXCkNOt0pbrHK
         eCeFWIWof5FkY8F8VZFfgqKU0e9xw91Rf6ZoH6okwk23XzpNVjfd/1vCWKmbMBfJK4IG
         vZlXAygq1NujsZqDYozn1rE4UuEUMZhJM7twUGx94vkub58ZG5qOK9kzYzTIVJRfCqI2
         /Ue0CZZawLXe64gwbcAB2sw+besbVKwK++z2Yb+A9+KJQRVRw9Mo0gWss81p52LHYjyp
         1pCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8VAWJvEx809/evnC9HkWYNOh4uNvamJHZhEDIvsQGJg=;
        b=VOEeMBS8COZjhLdgjuGsQSIWhvUfT4+h/ColIJsaT/O5MaPloqQB3tc9f52Z7DpyDg
         y6goMDfHrYlGWoZIttbJGVWziHNzJ1tcUgQd2EqFnoFcpmVOUZwhla/8yXuPDq/Ezstz
         BNe2KNkX5YZ38HjPANOKvMCNzx0SAQ3OSydvuOOrrN3XNv6XIn3FX4gr1opCIQsOYYPv
         4XLDk5+b+OjBiNjvIB/WipoQOU9H4Qq8vFeB/bOt9kUPzxTvpUlMzvf+Aw2IPyBvfd9K
         SYTxGyk3oMyQX7vM8cxmLa9MD+89T4xvEp+k4bN0JW+5+zaPlOPPjQptX1Wgr8GZ85e0
         kLow==
X-Gm-Message-State: AGi0Puai6auW2Ei9ekFO9FO5wCrOIgDxFQwiJF1SWWV+R8VoQZ5aG3GT
        kUqxj1n7yvQ08gBIcN8TbYVuwQ==
X-Google-Smtp-Source: APiQypL3gnOLeOpwMtmrfVojAqfgL6kN/sk2+t5bsXUUapRJEqdvSSznjQ8hkJjSRzkKg9PIXpuxMg==
X-Received: by 2002:a17:902:7e4b:: with SMTP id a11mr22170702pln.168.1589310844081;
        Tue, 12 May 2020 12:14:04 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x12sm12219169pfo.62.2020.05.12.12.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 12:14:03 -0700 (PDT)
Date:   Tue, 12 May 2020 12:12:30 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        linux-kernel@vger.kernel.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org
Subject: Re: [PATCH] remoteproc: core: Prevent system suspend during
 remoteproc recovery
Message-ID: <20200512191230.GB16107@builder.lan>
References: <1588183482-21146-1-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588183482-21146-1-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 29 Apr 11:04 PDT 2020, Rishabh Bhatnagar wrote:

> The system might go into suspend during recovery of any remoteproc.
> This will interrupt the recovery process in between increasing the
> recovery time. Make the platform device as wakeup capable and
> use pm_stay_wake/pm_relax APIs to avoid system from going into
> suspend during recovery.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---

Please don't forget to add a version to $subject and provide a Changelog
here next time you're respinning something.

I've picked this up now.

Thanks,
Bjorn

>  drivers/remoteproc/qcom_q6v5_pas.c   | 2 ++
>  drivers/remoteproc/remoteproc_core.c | 5 +++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index edf9d0e..e608578 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -398,6 +398,8 @@ static int adsp_probe(struct platform_device *pdev)
>  	adsp->has_aggre2_clk = desc->has_aggre2_clk;
>  	platform_set_drvdata(pdev, adsp);
>  
> +	device_wakeup_enable(adsp->dev);
> +
>  	ret = adsp_alloc_memory_region(adsp);
>  	if (ret)
>  		goto free_rproc;
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 097f33e..6a1cb98 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1712,6 +1712,8 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  
>  	if (!rproc->recovery_disabled)
>  		rproc_trigger_recovery(rproc);
> +
> +	pm_relax(rproc->dev.parent);
>  }
>  
>  /**
> @@ -2208,6 +2210,9 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>  		return;
>  	}
>  
> +	/* Prevent suspend while the remoteproc is being recovered */
> +	pm_stay_awake(rproc->dev.parent);
> +
>  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>  		rproc->name, rproc_crash_to_string(type));
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
