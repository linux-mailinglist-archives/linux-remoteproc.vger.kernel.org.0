Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF61AFD674
	for <lists+linux-remoteproc@lfdr.de>; Fri, 15 Nov 2019 07:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfKOGce (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 15 Nov 2019 01:32:34 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35250 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbfKOGce (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 Nov 2019 01:32:34 -0500
Received: by mail-pf1-f196.google.com with SMTP id q13so5960692pff.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Nov 2019 22:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q3ePoHPIIdr3W7D+aaS4Z60EnVlbf0EDqLIH1S2hQUU=;
        b=IDUmX0KGEbj6muhIKJyL7HEhTXwt+PkuOrsqDIMdJNfODpcksOOJ4zuhsAIsOr/Oce
         U27ZwTq8v6TVX2+Mm7OMb2JyPNhU+gFqNK6itxctNYK+T7Beoe3iwMML41GMjVpy7iRW
         p9QrS6/uZ7hhBUVoYO1vBF2n7h4u0ac3aKJM3Sv2mS82gGvsO9ZSsHCIng271RLEqKgc
         ussy0+OzHFTn9oj0QukKglzMDdkO5Xk8PZSKKceMb0VCOSrLdyAgGnyrSGxVbGhJW3kf
         iJ53JmuF4I2o6rTRRvcX3VwVUcWOuNhknIkWTpzAgKryWtidmIWwgK8nYkLweoAu4GC+
         4LOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q3ePoHPIIdr3W7D+aaS4Z60EnVlbf0EDqLIH1S2hQUU=;
        b=Td9+sy4rgc8nD/DuKcKZLiaFejdrGMEzEnE6fVUV/1l3QhCj2fuDnRjGah14Xy/eYB
         U+HdCokDLGrSP1EOmQM7/3UqPuMmTHSqmGgzvcytIAKR3s1507BlkoKqlocu6nLYdkQc
         sGUYbOiyt+M9g9DJCxxTv0UtbkuPXG5L53Q0eAtCCAc+hVRIp421oqHCKirXkzKuU592
         4ARaUuc3vZ+e5YtlLHfmauSDNI89ejczMXGar5GEiuTR1oaZ1n45ubvjQ6SNGB2h695b
         MPW0O+7NEKuYW/X53yNs3sPmnfyuFSa2RhcszWGaKnlL3nZyYTpZMiYM4hDaWUf679pP
         6N5w==
X-Gm-Message-State: APjAAAWmDh8xbzUdjXHzGuqtNGh04EpF4GFItaqHanzV9hVFMQsJ32wA
        RQVzLdEvG+y0b9rsVIUcznePiA==
X-Google-Smtp-Source: APXvYqwXmWhg5Qpo4vphioNQf1z/8vt/0yg96EIeaEoylI37/2yBLu1fWTS4R30QXtIhmfgqLJ6KzA==
X-Received: by 2002:a17:90a:bf16:: with SMTP id c22mr17129860pjs.83.1573799551704;
        Thu, 14 Nov 2019 22:32:31 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p16sm9058430pfn.171.2019.11.14.22.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 22:32:30 -0800 (PST)
Date:   Thu, 14 Nov 2019 22:32:28 -0800
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
Subject: Re: [PATCH v3] remoteproc: stm32: fix probe error case
Message-ID: <20191115063228.GS3108315@builder>
References: <1573635167-24590-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573635167-24590-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 13 Nov 00:52 PST 2019, Fabien Dessenne wrote:

> If the rproc driver is probed before the mailbox driver and if the rproc
> Device Tree node has some mailbox properties, the rproc driver probe
> shall be deferred instead of being probed without mailbox support.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
> Changes since v2: free other requested mailboxes after one request fails
> Changes since v1: test IS_ERR() before checking PTR_ERR()
> ---
>  drivers/remoteproc/stm32_rproc.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 2cf4b29..4b67480 100644
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
> @@ -329,10 +329,16 @@ static void stm32_rproc_request_mbox(struct rproc *rproc)
>  
>  		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);
>  		if (IS_ERR(ddata->mb[i].chan)) {
> +			if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER) {
> +				ddata->mb[i].chan = NULL;

So this relies on the caller jumping to stm32_rproc_free_mbox() to
release a subset of ddata->mb[x].chan. While this works I find it error
prone and would prefer the idiomatic solution of cleaning things up, in
this function, before returning.

So, could you please goto a snippet that loops backwards from i-- to 0
calling mbox_free_channel() and then return -EPROBE_DEFER instead?

Thanks,
Bjorn

> +				return -EPROBE_DEFER;
> +			}
>  			dev_warn(dev, "cannot get %s mbox\n", name);
>  			ddata->mb[i].chan = NULL;
>  		}
>  	}
> +
> +	return 0;
>  }
>  
>  static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
> @@ -596,7 +602,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> -	stm32_rproc_request_mbox(rproc);
> +	ret = stm32_rproc_request_mbox(rproc);
> +	if (ret)
> +		goto free_mb;
>  
>  	ret = rproc_add(rproc);
>  	if (ret)
> -- 
> 2.7.4
> 
