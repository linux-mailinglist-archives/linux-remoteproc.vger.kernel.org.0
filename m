Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7992BCC799
	for <lists+linux-remoteproc@lfdr.de>; Sat,  5 Oct 2019 06:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbfJEEDa (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 5 Oct 2019 00:03:30 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43721 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbfJEEDa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 5 Oct 2019 00:03:30 -0400
Received: by mail-pf1-f194.google.com with SMTP id a2so5054555pfo.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Oct 2019 21:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ep+T4ZjSmgVgmfOmjNJkzXbXl0FrJoxYAHDsSkcqpX0=;
        b=Ym13/luvCh4HRz9APPjske1u+h0i1SJvJ/OhgaVzdzAtnKWjlspe8o7xEmP+7IbY7f
         sJcI8dgcp/8xe2szkey2GF1l42mvdGVRx2mI8/KL+8QXBgillBcxrPfY+6808U57GFeD
         S6JqnpqljXqfWpOYoBxju6COK3d8eNXCzpyqmu2I58UXR5daXXiBIZGqcxp/+f3eN+QZ
         SJkNy+5P/fpY17vkKSu5RAX8TK9qXn0UdH360eT+NJjnvoVFeeWCK5D9XR9we5BGFxCN
         83vhwmNyiMbrxr6MLwb/bts1DpkdL9eTRdCA6Eu9mKObTZm/GSOgTo3ylyLrWc7e6Pdy
         5M9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ep+T4ZjSmgVgmfOmjNJkzXbXl0FrJoxYAHDsSkcqpX0=;
        b=A2uHgCtitnwgE2jVbovnZY4rLfIYQ3Q1cw1WVqkbhaxGYxtyWr+jFg0tnEAS534bB4
         oj53ChIcZbFhE+FPvTh+Eg+sX94S0TrVij6lr1j9263iWtQAASSetKZ49ydK+DEjU6t9
         rgY49mq5ZMMFtPGeop8v9OBGaDyPKNK9woypT4S+qMjfmBOI0XnWyRD0+Z+YFnD1QNGD
         TZn3PZt+NrQgBbAD9NqBFuxnyQ0JqPrCp+cylAhtK4fG8SnmTXCk0zbRgxpxqc7+nLUZ
         Vali5EPP1NflbgOVIOZdcQni9W34o+WYkILE35Akpy7in7INP8o/nA1v9SPePxQGzWm3
         Fivw==
X-Gm-Message-State: APjAAAXS1K3vUcXTOl+Jm7YHbN+JaA97+kILUDm4foUWakgoiXtwc2rj
        Sdo3wvXQgmp4E4YP9SKax/iKVA==
X-Google-Smtp-Source: APXvYqy6CR1/CTAJi3zeL2dzdM9xntro53i8Tmw4S9q3dLx7SjGWLW2+lCDDvRKQ255GHtt9quen0w==
X-Received: by 2002:a17:90a:cb18:: with SMTP id z24mr20149664pjt.108.1570248209669;
        Fri, 04 Oct 2019 21:03:29 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e14sm7692470pjt.8.2019.10.04.21.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 21:03:29 -0700 (PDT)
Date:   Fri, 4 Oct 2019 21:03:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Fabien Dessenne <fabien.dessenne@st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Loic Pallardy <loic.pallardy@st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: Re: [PATCH] remoteproc: stm32: fix probe error case
Message-ID: <20191005040326.GB5189@tuxbook-pro>
References: <1570190555-12465-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570190555-12465-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 04 Oct 05:02 PDT 2019, Fabien Dessenne wrote:

> If the rproc driver is probed before the mailbox driver and if the rproc
> Device Tree node has some mailbox properties, the rproc driver probe
> shall be deferred instead of being probed without mailbox support.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 2cf4b29..410b794 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -310,7 +310,7 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
>  	}
>  };
>  
> -static void stm32_rproc_request_mbox(struct rproc *rproc)
> +static int stm32_rproc_request_mbox(struct rproc *rproc)
>  {
>  	struct stm32_rproc *ddata = rproc->priv;
>  	struct device *dev = &rproc->dev;
> @@ -328,11 +328,15 @@ static void stm32_rproc_request_mbox(struct rproc *rproc)
>  		cl->dev = dev->parent;
>  
>  		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);
> -		if (IS_ERR(ddata->mb[i].chan)) {
> +		if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER) {

You may not use PTR_ERR() without first checking IS_ERR(), apart from
that your patch looks good.

Regards,
Bjorn

> +			return -EPROBE_DEFER;
> +		} else if (IS_ERR(ddata->mb[i].chan)) {
>  			dev_warn(dev, "cannot get %s mbox\n", name);
>  			ddata->mb[i].chan = NULL;
>  		}
>  	}
> +
> +	return 0;
>  }
>  
>  static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
> @@ -596,7 +600,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> -	stm32_rproc_request_mbox(rproc);
> +	ret = stm32_rproc_request_mbox(rproc);
> +	if (ret)
> +		goto free_rproc;
>  
>  	ret = rproc_add(rproc);
>  	if (ret)
> -- 
> 2.7.4
> 
