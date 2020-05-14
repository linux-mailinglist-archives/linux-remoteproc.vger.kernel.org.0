Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFFA1D2625
	for <lists+linux-remoteproc@lfdr.de>; Thu, 14 May 2020 06:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725979AbgENE64 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 14 May 2020 00:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725788AbgENE64 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 May 2020 00:58:56 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254E5C061A0C
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 21:58:56 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id u35so756372pgk.6
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 21:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XB9iR1Wtni03RNsjVOMYUq9aoFsWINR5LTN8xhVnTBE=;
        b=wjDd6XVS335MCJz9fDAbV1AJWTNo6NfWf4m+5LBZrK5OZvhYRFS7xdg7rvVKwsStr0
         0GZKzpEEeDPKMlo6yRynvB1Py/hJpE7BdKPYvhOHlY5iZPRmTLVKPxDGadQrq9288OTD
         bXmo47fVNu8lfa0j4e6PZ6phtHOTmgKaLvm7kUcLeS3nehSQ3dQXUoRyj+jvBcbrhnAN
         g7OSwaQxYwqJT54/+bQeyy/xEm0H8osNIoLSNDpPu5bGko684DCE+LjlRJNHZZ3Ydo5X
         fc4G9VljKI/7ZhlOFs+YM4Zf/bGUyIaMxZlmd0kHF0AdrH2gQKMoDs5ixQv/638Quu5V
         Eycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XB9iR1Wtni03RNsjVOMYUq9aoFsWINR5LTN8xhVnTBE=;
        b=COaeKAKWfdm0Pzn0ZVzGyd0WpLA2CivzHjqWpT6igv2KE0H8T5psogH5IZPFGrArnh
         P6YVm/9CJiLENrZMka0TzwUdUc/S92xefAj+PaR2Y/0HKmHx4DVZIZx6XCSLvNOZIVBy
         wv+K+PlbnvY5W1cKgQZ9I/1Bd42C07JW2bp/hdCbrnl+igniQmXneiO5mPPSAa5fq9wP
         ldJXcfziUuU2UZggxHlQZa+zZcUgyTKPa2IDnvaLBIq65VO5vqaYHOHV/mAnU4P7OEEE
         Q0p3LhGWRRJttQ5hZ++eeBlBrtO4TDASQWHSADMdRnjhROuqfbLSx2/N6mJiqy0zJC15
         UCRw==
X-Gm-Message-State: AOAM532csj+Qoxzs/No9OsZErQISoD+R9DXdFihN7sv4LnDDPMQeV8Cm
        biKKSaPM9UMwEP44s7l/AR/Q/w==
X-Google-Smtp-Source: ABdhPJwtJMENg8lvG2CR/fcdWf8E4zka+8LBZfgW9TaUXTChBfsuSaci4EXXRp2CUpbC+jWVbtUTAg==
X-Received: by 2002:a63:1557:: with SMTP id 23mr2564283pgv.104.1589432335637;
        Wed, 13 May 2020 21:58:55 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d203sm1052337pfd.79.2020.05.13.21.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 21:58:55 -0700 (PDT)
Date:   Wed, 13 May 2020 21:57:24 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/12] remoteproc: stm32: Request IRQ with platform
 device
Message-ID: <20200514045724.GH16107@builder.lan>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-3-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424202505.29562-3-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 24 Apr 13:24 PDT 2020, Mathieu Poirier wrote:

> Request IRQ with platform device rather than remote proc in order to
> call stm32_rproc_parse_dt() before rproc_alloc().  That way we can
> know whether we need to synchronise with the MCU or not.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Loic Pallardy <loic.pallardy@st.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/stm32_rproc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 91fd59af0ffe..1ac90adba9b1 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -261,7 +261,8 @@ static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  
>  static irqreturn_t stm32_rproc_wdg(int irq, void *data)
>  {
> -	struct rproc *rproc = data;
> +	struct platform_device *pdev = data;
> +	struct rproc *rproc = platform_get_drvdata(pdev);
>  
>  	rproc_report_crash(rproc, RPROC_WATCHDOG);
>  
> @@ -553,7 +554,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
>  
>  	if (irq > 0) {
>  		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
> -				       dev_name(dev), rproc);
> +				       dev_name(dev), pdev);
>  		if (err) {
>  			dev_err(dev, "failed to request wdg irq\n");
>  			return err;
> -- 
> 2.20.1
> 
