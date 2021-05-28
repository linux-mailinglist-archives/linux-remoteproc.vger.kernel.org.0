Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 170A4393C09
	for <lists+linux-remoteproc@lfdr.de>; Fri, 28 May 2021 05:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236352AbhE1DqK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 27 May 2021 23:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236342AbhE1DqK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 27 May 2021 23:46:10 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B21C061574
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 20:44:35 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id c3so2965064oic.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 20:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VWWrXtqxypaG6W94Jcb7Nqjb7DgWl7Dvm/E9oGzGZbY=;
        b=gGsvGbKh9TFq4frPlNvRb4UTOPbO3ODdYCRS/termttaL9wBaX/aVYbXiCVDAI8hMc
         3hw0s9WwmHoxF5hjnKKreRK1hjcX9JzboDsyo7opzQPjDFWZVP8iw+2c0sqs/ON4FFwq
         ImwSfnInJr0JrFAx0pjBIbHg6GInSbC1WafQCc839WqhLqCgjavP+XkM9C1sC6MGLX1e
         M0WOF9n4SVU8oysKjHTA2DG9+Jd724cUJmCY9msOZq3HfTYBLOtSukYgWZBPsXUNgyU7
         nYcg/hPNrJG/MQtTWJZgZM1e69rf1/cdg8h4oi/Rj5NbZbIInlSHb66TEJ/EXVISbVVN
         pfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VWWrXtqxypaG6W94Jcb7Nqjb7DgWl7Dvm/E9oGzGZbY=;
        b=KQPscRdLqU92kAX6l8z6OyReYRxIhbv2Kp4SmQByLk5jW+j8mXugWX3sLEJxT6AJZR
         dietrlFwKJtP4NNU8XKh/wrtnqb2c+LjN4WUHTdo+ArRFC9BY7Xkt4S1lLdcSZ4rFCwH
         qhtZw2lGDGirD8TTkIWecwWUXbeT6yLopoWnegtg97cQJk7MI0WQnsn6Fqa7gao9n78Z
         +xCYRAH5QfyrRbPI6d2J7gxEkr3+Yyq+8c8nB7DdSf1sfAxuqbDocOCAK+BO2MQxt9du
         MqAi0B+WVPT3T3H2ILRPqRIEJJzfODiRYQnZA+n689ZXU5JzFoIG/OYQ4eDMKSgdGknh
         0AoQ==
X-Gm-Message-State: AOAM5325GYxtDcrkVp8BpRfwTtUss3AUlsMTxlyQOqdURiJTmhGwqBYR
        mEQCdR+RE6jpDpjI+64YEeArBQ==
X-Google-Smtp-Source: ABdhPJzIHO4BdhieqQHBdFlwXeo4p1xzGRxy0ToJKelI3up3VqCBFqUI2lIb1e3HK958Nnpfw7QwNw==
X-Received: by 2002:a05:6808:1149:: with SMTP id u9mr4467883oiu.61.1622173474368;
        Thu, 27 May 2021 20:44:34 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p22sm846364oop.7.2021.05.27.20.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 20:44:33 -0700 (PDT)
Date:   Thu, 27 May 2021 22:44:32 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org,
        stable@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: core: Move validate before device add
Message-ID: <YLBnIDrNVVePv3gZ@builder.lan>
References: <1621284349-22752-1-git-send-email-sidgup@codeaurora.org>
 <1621284349-22752-3-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621284349-22752-3-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 17 May 15:45 CDT 2021, Siddharth Gupta wrote:

> We can validate whether the remoteproc is correctly setup before
> calling making the cdev_add and device_add calls. This saves us
> the trouble of cleaning up later on.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 562355a..45d09bf 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2316,16 +2316,16 @@ int rproc_add(struct rproc *rproc)
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
> -	/* add char device for this remoteproc */
> -	ret = rproc_char_device_add(rproc);
> +	ret = rproc_validate(rproc);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = device_add(dev);
> +	/* add char device for this remoteproc */
> +	ret = rproc_char_device_add(rproc);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = rproc_validate(rproc);
> +	ret = device_add(dev);
>  	if (ret < 0)
>  		return ret;
>  
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
