Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE7A203059
	for <lists+linux-remoteproc@lfdr.de>; Mon, 22 Jun 2020 09:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731320AbgFVHKP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 22 Jun 2020 03:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731316AbgFVHKO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Jun 2020 03:10:14 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC2AC061794
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 00:10:14 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id p82so3975316oif.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 00:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Gnm6o+0Hdw9Gs6PG3g5iLBKEOWre/ZeNRFkAN0MJIi4=;
        b=hGprWhuTYlcdM3uoACEaOjqPwLSG+uCaWw8NVFoChC7syHeWbLr0mi6tiGR4ojdyfA
         +uzQ9siBpAV9ebm27htqxAHP9QC/HkD/uB5V9L7Fbh81AKepqlKGLnmeOCEkzv2IUT6R
         342GsUTAq7ZsFw1R3ruwVMMwpXkjwkZKDISibDHPPaWVKd7dCQwTqF4J6ka5xll81Qvh
         8V4GvVrBb/MFXiVJQofykzYaz1Fy4M2+BKfDZxXdKVmBajNzvrJ/IpR5gNwHg9/LK+LH
         klYS38eHqM8nuZcevdeYBdDEdaosmz7VW9jH/2UDlKR/VbAITMnrWptf2DiftQtf89Xp
         gx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gnm6o+0Hdw9Gs6PG3g5iLBKEOWre/ZeNRFkAN0MJIi4=;
        b=fFqeapi8VXxV8/cbh0EVbMlLuUiFVVTHQ+RBAts7vUdNydxoH8HrIJNVbJrd4BqTLt
         /WN5ekCT+7GEhE2Pke88XDj58hZar2b/eAUrlZya2PyVdAMhkdA72aBRPmJd9X2RYGIT
         8zOlHdnZDx6gEMxplUtsNzSPOH8bGgWt26et3OTxZlShL+1RmJAjuP6VCNi/an90ruNg
         qFIZ8iSc47kCKw1Uf6ZZEJOq0iBkduW2urdWenmM11jZpaJKjvkWF7MYJ3MNNqDHhjlD
         LPNDzDh7sQSJ/BOyeoAefRarXPH+2o67U5wnrmljj6ST8CNFYaq6mUE4D5sD1t1dFQU9
         OIQA==
X-Gm-Message-State: AOAM533VCxVmJH9yXDYORnlLdWitfJXJhsL4I/FWwtW/BToFc7H9U/he
        RleOrqqy8ztAHA55zWqNbu5dlg==
X-Google-Smtp-Source: ABdhPJyN4NSurz/LsUB6M2KEX3is0xOR/sGwblrexAO062yBIviwY7ocYYFmWKEfLtm/5QjzWpw1uA==
X-Received: by 2002:aca:4dc3:: with SMTP id a186mr11885127oib.17.1592809813734;
        Mon, 22 Jun 2020 00:10:13 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d72sm732706oob.15.2020.06.22.00.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:10:13 -0700 (PDT)
Date:   Mon, 22 Jun 2020 00:07:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, s-anna@ti.com
Subject: Re: [PATCH v4 3/9] remoteproc: Introducing function rproc_attach()
Message-ID: <20200622070727.GD149351@builder.lan>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
 <20200601175139.22097-4-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200601175139.22097-4-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 01 Jun 10:51 PDT 2020, Mathieu Poirier wrote:

> Introducing function rproc_attach() to enact the same actions as
> rproc_start(), but without the steps related to the handling of
> a firmware image.  That way we can properly deal with scenarios
> where the remoteproc core needs to attach with a remote processsor
> that has been booted by another entity.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 42 ++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 9f04c30c4aaf..0b323f6b554b 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1370,6 +1370,48 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
>  
> +static int __maybe_unused rproc_attach(struct rproc *rproc)
> +{
> +	struct device *dev = &rproc->dev;
> +	int ret;
> +

For the case where we're going DETACHED -> RUNNING - > OFFLINE we
need to consider the pm_runtime (and prepare/unprepare) state of the
device as well...


Apart from that I think this looks good.

Regards,
Bjorn

> +	ret = rproc_prepare_subdevices(rproc);
> +	if (ret) {
> +		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
> +			rproc->name, ret);
> +		goto out;
> +	}
> +
> +	/* Attach to the remote processor */
> +	ret = rproc_attach_device(rproc);
> +	if (ret) {
> +		dev_err(dev, "can't attach to rproc %s: %d\n",
> +			rproc->name, ret);
> +		goto unprepare_subdevices;
> +	}
> +
> +	/* Start any subdevices for the remote processor */
> +	ret = rproc_start_subdevices(rproc);
> +	if (ret) {
> +		dev_err(dev, "failed to probe subdevices for %s: %d\n",
> +			rproc->name, ret);
> +		goto stop_rproc;
> +	}
> +
> +	rproc->state = RPROC_RUNNING;
> +
> +	dev_info(dev, "remote processor %s is now attached\n", rproc->name);
> +
> +	return 0;
> +
> +stop_rproc:
> +	rproc->ops->stop(rproc);
> +unprepare_subdevices:
> +	rproc_unprepare_subdevices(rproc);
> +out:
> +	return ret;
> +}
> +
>  /*
>   * take a firmware and boot a remote processor with it.
>   */
> -- 
> 2.20.1
> 
