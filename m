Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E70232544
	for <lists+linux-remoteproc@lfdr.de>; Wed, 29 Jul 2020 21:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgG2TUJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 29 Jul 2020 15:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726800AbgG2TUI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 29 Jul 2020 15:20:08 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2DFC0619D4
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jul 2020 12:20:08 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id e8so14852242pgc.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jul 2020 12:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HGXcQxniYOJ/L+/BbSJHGqRZ1csrAGecCIYczpmNch4=;
        b=CWQeakntD3r4UHVDonF0RsCdeZ+R7/FiH6YY8MnpigA19viBWrwaAmlWRUzimnUFkF
         yyAufnaYCoPsh35cHMstxZE/NVB+enOaPdFZu5HTb8cy1x6VnmFZ/JMOliwgoNmXeZOK
         L27U5zsKI6cBxWAnJUBYMRFGwRxTh72dDC/z8o0HoIpB1L+7HLPEznLyI9Z7M1QNuUpN
         QeTsz7Mh4Quj5r+4bE+L81UR0FwjDbKvv6tpA/GGBfMIumWqzvTrEhRlNvGpJ4wwGD7I
         dbiuC5v1uZBgGdjZMphJmcD7sF4jmo1V5BIxX0JO1OHT9xJ6qWabr3SbuV9eAm/BfDRr
         nU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HGXcQxniYOJ/L+/BbSJHGqRZ1csrAGecCIYczpmNch4=;
        b=qohdK56qvYbe27M9r/ZdydZRK4ygSOoBF6bTo7Dy8lkUtQPwGlHhr73AWMGzeQZ2cW
         stxXbuOe4lQYeO+wvZDZE8Q+nQ3hpk8BvsRKyxCMKkoprXr13K/seLXrhywuzriSetm9
         LflEK/OEJ7q6i+jIG48NVxd/RuRr9MHABX1+aqX2OA2v5MgWCRcSIqpsOG4bMvlIksZ6
         MlU/pYsxdQ/27gq4i/c2VVvxHMpbXKibFeaFc9G6HC7IYYG/h0WqXIK9fWD53Rmx9xG+
         NIiJfUYJTTQYozhEn3T3EPJl5Z9QWKUxts9C7ahLvRBH4Ay9zmNj8oEV0mkmYOizfM9K
         5Qog==
X-Gm-Message-State: AOAM530g8rBgOXxDOZbs7FTKkMYemiJDI0bWBmdDFBM8faBtVkbWtynY
        OCyxno8+Bu6xUavjMtnTKMOnrQ==
X-Google-Smtp-Source: ABdhPJwoUuUGN1m8e0bLII+ZzoMSh6x28a7Fj+eVz1nRdWqgeRnvvc9OdaVEmSRBTmlIVHbzgSRN/g==
X-Received: by 2002:a63:7d16:: with SMTP id y22mr29049887pgc.136.1596050407636;
        Wed, 29 Jul 2020 12:20:07 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 79sm3207215pfu.86.2020.07.29.12.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 12:20:07 -0700 (PDT)
Date:   Wed, 29 Jul 2020 12:16:38 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com, corbet@lwn.net,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/2] remoteproc: core: Register the character device
 interface
Message-ID: <20200729191638.GF229995@builder.lan>
References: <1596044401-22083-1-git-send-email-sidgup@codeaurora.org>
 <1596044401-22083-3-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596044401-22083-3-git-send-email-sidgup@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 29 Jul 10:40 PDT 2020, Siddharth Gupta wrote:

> Add the character device during rproc_add. This would create
> a character device node at /dev/remoteproc<index>. Userspace
> applications can interact with the remote processor using this
> interface.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 277d3bf..7f90eee 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1986,6 +1986,11 @@ int rproc_add(struct rproc *rproc)
>  	/* create debugfs entries */
>  	rproc_create_debug_dir(rproc);
>  
> +	/* add char device for this remoteproc */
> +	ret = rproc_char_device_add(rproc);
> +	if (ret < 0)
> +		return ret;
> +
>  	/*
>  	 * Remind ourselves the remote processor has been attached to rather
>  	 * than booted by the remoteproc core.  This is important because the
> @@ -2262,6 +2267,7 @@ int rproc_del(struct rproc *rproc)
>  	mutex_unlock(&rproc->lock);
>  
>  	rproc_delete_debug_dir(rproc);
> +	rproc_char_device_remove(rproc);
>  
>  	/* the rproc is downref'ed as soon as it's removed from the klist */
>  	mutex_lock(&rproc_list_mutex);
> @@ -2430,6 +2436,7 @@ static int __init remoteproc_init(void)
>  {
>  	rproc_init_sysfs();
>  	rproc_init_debugfs();
> +	rproc_init_cdev();
>  	rproc_init_panic();
>  
>  	return 0;
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
