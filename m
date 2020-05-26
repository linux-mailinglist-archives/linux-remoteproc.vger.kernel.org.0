Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0CF1B01BE
	for <lists+linux-remoteproc@lfdr.de>; Mon, 20 Apr 2020 08:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgDTGqc (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 20 Apr 2020 02:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726116AbgDTGqc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Apr 2020 02:46:32 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6628C061A10
        for <linux-remoteproc@vger.kernel.org>; Sun, 19 Apr 2020 23:46:30 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id d24so3591462pll.8
        for <linux-remoteproc@vger.kernel.org>; Sun, 19 Apr 2020 23:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1x1XSaiPurYlCacj5RFP4WLBzIU3d1tqW8IFDpUO5D0=;
        b=Ps9f6bBu5mTmwfAPImPWi2frG9mYoSeSAIHWhtUCHA3oMOki215jiwryZD4jDwmDe+
         ebap81b7B46JNvEfUH3xNakxRF3hJf/B8MWmK6wwD2R9kLzEpLKYBV4nXVltBaW2dGIh
         4c6F1xetdO+lfqIUvk2teuIsgYFberHj6698Z82z01zn7AB6JwAUGBvLaDW1aYAp7R/a
         CXsGQCSdP54n7eyh27Y3yv0yNXjhIdHQzaexDKOCVDLvKuAL8ZZJFxLkjz2xRM1/5ekl
         epVsRCtgOspeL3TbUdbVV5aXOif2PKQU2RF0/NERP32+U3q8tZ407Ce8AA5sTSNquzc+
         2EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1x1XSaiPurYlCacj5RFP4WLBzIU3d1tqW8IFDpUO5D0=;
        b=VOQDD3X7jnBI3/JV7jsTGIrkKnABSNRuEpv5ff6kP4oCqTnA+jxsPjf6NJp+bwrnLM
         W2c5JUKgP5hFutTd6cvl2EVBfW5eEYdXlIfBFFBuS4Pznx/t9hfS/QHAgkxOcw2NwRTj
         MO2px9spDpwFv4eXiIjsr7uCQI82QdU/Yf6pn3C3l4aUTM5SsU+5vUWRkWbxIM3hGlt4
         hfqvWDW8seW2BjC4IAot19E/Cpw++2yiJYp34LY9bhTjNox0SXrd9NH9qvXLA6F30NXE
         BR5wbIujLlW+s6aIUEarN6FkcKNeG34+ahKtMoq87MZrRRm55qilLHsqpUWLFRnSM9fe
         EGTQ==
X-Gm-Message-State: AGi0PubC82ESQ6kouGJfSf/oDxfVKQZOw6ebih683Ke2s578Zktfznwn
        6kT59HydMaXim475YHy/P/C5/9tscDs=
X-Google-Smtp-Source: APiQypLMOs/8T1GaAL9VbDgmBkUI1Xt7yDt1bPf1mOGXHe5urocPeF+midMMcSdiNR+DtvRGM2tP5w==
X-Received: by 2002:a17:90a:ad02:: with SMTP id r2mr19881379pjq.63.1587365189953;
        Sun, 19 Apr 2020 23:46:29 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q11sm207934pgs.25.2020.04.19.23.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 23:46:29 -0700 (PDT)
Date:   Sun, 19 Apr 2020 23:46:52 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>, od@zcrc.me,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] remoteproc: Add device-managed variants of
 rproc_alloc/rproc_add
Message-ID: <20200420064652.GB1868936@builder.lan>
References: <20200417170040.174319-1-paul@crapouillou.net>
 <20200417170040.174319-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417170040.174319-2-paul@crapouillou.net>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 17 Apr 10:00 PDT 2020, Paul Cercueil wrote:

> Add API functions devm_rproc_alloc() and devm_rproc_add(), which behave
> like rproc_alloc() and rproc_add() respectively, but register their
> respective cleanup function to be called on driver detach.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v3: New patch
>     v4: No change
>     v5: - Fix return value documentation
>     	- Fix typo in documentation
>     v6: No change
> 
>  drivers/remoteproc/remoteproc_core.c | 67 ++++++++++++++++++++++++++++
>  include/linux/remoteproc.h           |  5 +++
>  2 files changed, 72 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e12a54e67588..a7f96bc98406 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1949,6 +1949,33 @@ int rproc_add(struct rproc *rproc)
>  }
>  EXPORT_SYMBOL(rproc_add);
>  
> +static void devm_rproc_remove(void *rproc)
> +{
> +	rproc_del(rproc);
> +}
> +
> +/**
> + * devm_rproc_add() - resource managed rproc_add()
> + * @dev: the underlying device
> + * @rproc: the remote processor handle to register
> + *
> + * This function performs like rproc_add() but the registered rproc device will
> + * automatically be removed on driver detach.
> + *
> + * Returns: 0 on success, negative errno on failure
> + */
> +int devm_rproc_add(struct device *dev, struct rproc *rproc)
> +{
> +	int err;
> +
> +	err = rproc_add(rproc);
> +	if (err)
> +		return err;
> +
> +	return devm_add_action_or_reset(dev, devm_rproc_remove, rproc);
> +}
> +EXPORT_SYMBOL(devm_rproc_add);
> +
>  /**
>   * rproc_type_release() - release a remote processor instance
>   * @dev: the rproc's device
> @@ -2171,6 +2198,46 @@ int rproc_del(struct rproc *rproc)
>  }
>  EXPORT_SYMBOL(rproc_del);
>  
> +static void devm_rproc_free(struct device *dev, void *res)
> +{
> +	rproc_free(*(struct rproc **)res);
> +}
> +
> +/**
> + * devm_rproc_alloc() - resource managed rproc_alloc()
> + * @dev: the underlying device
> + * @name: name of this remote processor
> + * @ops: platform-specific handlers (mainly start/stop)
> + * @firmware: name of firmware file to load, can be NULL
> + * @len: length of private data needed by the rproc driver (in bytes)
> + *
> + * This function performs like rproc_alloc() but the acquired rproc device will
> + * automatically be released on driver detach.
> + *
> + * Returns: new rproc instance, or NULL on failure
> + */
> +struct rproc *devm_rproc_alloc(struct device *dev, const char *name,
> +			       const struct rproc_ops *ops,
> +			       const char *firmware, int len)
> +{
> +	struct rproc **ptr, *rproc;
> +
> +	ptr = devres_alloc(devm_rproc_free, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	rproc = rproc_alloc(dev, name, ops, firmware, len);
> +	if (rproc) {
> +		*ptr = rproc;
> +		devres_add(dev, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}
> +
> +	return rproc;
> +}
> +EXPORT_SYMBOL(devm_rproc_alloc);
> +
>  /**
>   * rproc_add_subdev() - add a subdevice to a remoteproc
>   * @rproc: rproc handle to add the subdevice to
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 9c07d7958c53..8c9c0dda03c3 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -599,6 +599,11 @@ int rproc_add(struct rproc *rproc);
>  int rproc_del(struct rproc *rproc);
>  void rproc_free(struct rproc *rproc);
>  
> +struct rproc *devm_rproc_alloc(struct device *dev, const char *name,
> +			       const struct rproc_ops *ops,
> +			       const char *firmware, int len);
> +int devm_rproc_add(struct device *dev, struct rproc *rproc);
> +
>  void rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem);
>  
>  struct rproc_mem_entry *
> -- 
> 2.25.1
> 
