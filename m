Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C251D2662
	for <lists+linux-remoteproc@lfdr.de>; Thu, 14 May 2020 07:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbgENFEj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 14 May 2020 01:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725911AbgENFEi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 May 2020 01:04:38 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71ECC061A0E
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 22:04:38 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id w65so779165pfc.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 22:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aNdxFa4QrJqUAslQvvR1Ej1cwVVNap3hxsxBpwJX/qw=;
        b=lqCVdH0DG85s8XFJt9av2MXGj4T0fHmhnth6+GRm+5czdRqg8SzBo2fQ21tg1rxbfq
         ybLI+gAxenyU/ClGQd8AtxvFhpjbe1tbt6kJAnKL/bd0dS68CmkA7mq5eH9L9TSGDrMR
         VkkhDRMMe9q7JnDfleItdIjOZct4RM8rkFMF1Vau754MBefsmOgaaL2EC45dM9rMH+DX
         FQ5s8c6EdI5CuKqkwCjloSg/VfMW1NclEAcN9p/0fE0vK46R7hpg69BrKVKABEoEZbTm
         wFyI5aqlBVjQ7dxOJu3SullzfZWFlNhN7VvBOR5MZCUZmYap5y2gjqrU88xQDANavc5S
         ZF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aNdxFa4QrJqUAslQvvR1Ej1cwVVNap3hxsxBpwJX/qw=;
        b=R17MOWtB3N+w7XkyORoQKxvvR/Rhqylp01m5uETcJuRWETjKKpFpbvs39Ovx5uJVDJ
         fc/WE+9LHAxd3LL4ioYyeLdFbJ0933kf3m+hrvhpxpwuYqrF3x4PYfgtQmfkeD9ncWhS
         ZlzXfK6GVn8HsugjMN3+UiqSrO9usEwcrLf6jI1pP31sIK0CQGqZQ0osrluwrCBSLEFw
         KR3asKDQTYcAPprJXVBiVg5bY0pRM6fNFafrvZ0VCcCbQqcxUAmPadEv0SmD5udvLp39
         yEb0CijfIg9ou1mTyUmM8iM02+7+R2S/p0IQ3Wd/v44ZJ4R60/bQZJcXOhRJwz1A9GSW
         L9zg==
X-Gm-Message-State: AOAM531o5ZxsPu5G7X0CP8i8GDrcAJT1BxkOa4WSZUTqIjdlt9/N5MoV
        vQMdf5YLH1ojKI4KnUKTC8FcAj9oSTc=
X-Google-Smtp-Source: ABdhPJwRiy8/1HoO7DTnCtfH18KWXNfvYdwz4V9uPRi2+kFUWIXvo1uANQsWfdxgpLZtpPG2rO77WA==
X-Received: by 2002:aa7:8658:: with SMTP id a24mr2765320pfo.135.1589432678189;
        Wed, 13 May 2020 22:04:38 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v3sm1073113pfv.186.2020.05.13.22.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 22:04:37 -0700 (PDT)
Date:   Wed, 13 May 2020 22:03:07 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/12] remoteproc: stm32: Remove memory translation
 from DT parsing
Message-ID: <20200514050307.GJ16107@builder.lan>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-5-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424202505.29562-5-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 24 Apr 13:24 PDT 2020, Mathieu Poirier wrote:

> Other than one has to be done after the other, there is no correlation
> between memory translation and DT parsing.  As move function
> stm32_rproc_of_memory_translations() to stm32_rproc_probe() so that
> stm32_rproc_parse_dt() can be extended to look for synchronisation
> related binding in a clean way.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Loic Pallardy <loic.pallardy@st.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/stm32_rproc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 57a426ea620b..658439d4b00a 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -606,7 +606,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  
>  	*auto_boot = of_property_read_bool(np, "st,auto-boot");
>  
> -	return stm32_rproc_of_memory_translations(pdev, ddata);
> +	return 0;
>  }
>  
>  static int stm32_rproc_probe(struct platform_device *pdev)
> @@ -634,6 +634,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> +	ret = stm32_rproc_of_memory_translations(pdev, ddata);
> +	if (ret)
> +		goto free_rproc;
> +
>  	rproc->auto_boot = auto_boot;
>  	rproc->has_iommu = false;
>  	ddata->workqueue = create_workqueue(dev_name(dev));
> -- 
> 2.20.1
> 
