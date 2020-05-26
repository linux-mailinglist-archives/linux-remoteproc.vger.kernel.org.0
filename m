Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01BBB1C19E9
	for <lists+linux-remoteproc@lfdr.de>; Fri,  1 May 2020 17:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgEAPlP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 1 May 2020 11:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729927AbgEAPlO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 May 2020 11:41:14 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73A6C061A0E
        for <linux-remoteproc@vger.kernel.org>; Fri,  1 May 2020 08:41:13 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id s18so4692027pgl.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 01 May 2020 08:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YJ4KJlZHvfOajTJzZlfCxHLt+Kv+rjkwCB+Y1R+uJUM=;
        b=yU6H5lg+Ogqt0uxmHyzEVixr4IRtEVo4kUtz8FfGnz0/8CiyJZ/GtOjyzeWKVrdlKy
         Z9LxroihzSaj93D6pfE7osVuQL1LPZLVQUjZSOSa1bHClVrYPYT6QfGX9abQl6FgNh1c
         BdHW25Aan2llomz+UCvvStDBB4NQ3mZqC+Yyp9c1+01e6D0RqK3yoveZDC7358iSIlYD
         FthoYsnXQ1ntEDD496WvXHAXdJ6S6XXUuPVIeuqTaJz+wn09aGpGu1pI3E9uYfvVsTso
         6qSfEk8GbXcevP6xs3Qf1EokZ6+gaIuSTymt4x0ZHf7iuHaAQZkswETQYvmOoVHnOvBm
         QGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YJ4KJlZHvfOajTJzZlfCxHLt+Kv+rjkwCB+Y1R+uJUM=;
        b=QEblgntOKphiT0LXjvJQ/kwoytQsJqR1XfyBjt+DFeWW/vr6wLaPZrvQhmjLZWtNLM
         d7k2z4/uXaWQar2IB2TcnD0lTG/kl+KLuDL51lfWmZxvjbzdlnRXjvSK1miBspq6+Nx0
         2WZKtyh1kyi0PArd9NxB+f4J3KgWFFZs4g9jdDB5GuEz+psCBDbao7zIO46i747tMfOb
         xBWtkkQSnvm7ggrclopGoP8Ma/dTQOmVvrYyI3nIswou5yAxDay7ntuKgOqDRFjkyqnK
         dl6bPeG/JKsJWREwR5Z6zmBqKyLjmKAD4pDxZge7c8/lwvNZnt7XPl8wjNZeJjIpTnIx
         yfhg==
X-Gm-Message-State: AGi0PuZ8GS2NPifsDQAlVlQAlL8nsqLUBYHzAQ5Up01v2jTW0VWaRTBC
        ChU++RSqvdF0QnNtZ/ub1cjB8A==
X-Google-Smtp-Source: APiQypK6nmlhA9hedaldYEm5FVJoURCFe+MI7wLhRHr1XRgxqm6Z55fay8Dm845ScS3+RkkmQvfcuQ==
X-Received: by 2002:a63:6543:: with SMTP id z64mr4722206pgb.260.1588347673275;
        Fri, 01 May 2020 08:41:13 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id gl12sm21394pjb.27.2020.05.01.08.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 08:41:12 -0700 (PDT)
Date:   Fri, 1 May 2020 09:41:10 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <clew@codeaurora.org>, Sibi <sibis@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Subject: Re: [PATCH 1/4] remoteproc: qcom: Pass ssr_name to glink subdevice
Message-ID: <20200501154110.GA30509@xps15>
References: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
 <20200423003736.2027371-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423003736.2027371-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good morning Bjorn,

On Wed, Apr 22, 2020 at 05:37:33PM -0700, Bjorn Andersson wrote:
> Pass ssr_name to glink subdevice in preparation for tying glink_ssr to
> the glink subdevice, rather than having its own "ssr subdevice".
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/qcom_common.c    | 9 ++++++++-
>  drivers/remoteproc/qcom_common.h    | 5 ++++-
>  drivers/remoteproc/qcom_q6v5_adsp.c | 2 +-
>  drivers/remoteproc/qcom_q6v5_mss.c  | 2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c  | 2 +-
>  5 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 60650bcc8c67..ff26f2b68752 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -46,8 +46,10 @@ static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
>   * qcom_add_glink_subdev() - try to add a GLINK subdevice to rproc
>   * @rproc:	rproc handle to parent the subdevice
>   * @glink:	reference to a GLINK subdev context
> + * @ssr_name:	identifier of the associated remoteproc for ssr notifications
>   */
> -void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink)
> +void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
> +			   const char *ssr_name)
>  {
>  	struct device *dev = &rproc->dev;
>  
> @@ -55,6 +57,10 @@ void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink)
>  	if (!glink->node)
>  		return;
>  
> +	glink->ssr_name = kstrdup_const(ssr_name, GFP_KERNEL);
> +	if (!glink->ssr_name)
> +		return;
> +

In case or an error with the allocation of ->ssr_name an
of_node_put(glink->node) needs to be done.  That way qcom_add_glink_subdev()
cleans up after itself if things go wrong.  On the flip side the same
of_node_put() will be done when the driver is removed.  So I'm ambivalent on
this one.  With or without this change:

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>  

>  	glink->dev = dev;
>  	glink->subdev.start = glink_subdev_start;
>  	glink->subdev.stop = glink_subdev_stop;
> @@ -74,6 +80,7 @@ void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glin
>  		return;
>  
>  	rproc_remove_subdev(rproc, &glink->subdev);
> +	kfree_const(glink->ssr_name);
>  	of_node_put(glink->node);
>  }
>  EXPORT_SYMBOL_GPL(qcom_remove_glink_subdev);
> diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
> index 58de71e4781c..34e5188187dc 100644
> --- a/drivers/remoteproc/qcom_common.h
> +++ b/drivers/remoteproc/qcom_common.h
> @@ -11,6 +11,8 @@ struct qcom_sysmon;
>  struct qcom_rproc_glink {
>  	struct rproc_subdev subdev;
>  
> +	const char *ssr_name;
> +
>  	struct device *dev;
>  	struct device_node *node;
>  	struct qcom_glink *edge;
> @@ -30,7 +32,8 @@ struct qcom_rproc_ssr {
>  	const char *name;
>  };
>  
> -void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink);
> +void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
> +			   const char *ssr_name);
>  void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink);
>  
>  int qcom_register_dump_segments(struct rproc *rproc, const struct firmware *fw);
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index c60dabc6939e..d2a2574dcf35 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -461,7 +461,7 @@ static int adsp_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto disable_pm;
>  
> -	qcom_add_glink_subdev(rproc, &adsp->glink_subdev);
> +	qcom_add_glink_subdev(rproc, &adsp->glink_subdev, desc->ssr_name);
>  	qcom_add_ssr_subdev(rproc, &adsp->ssr_subdev, desc->ssr_name);
>  	adsp->sysmon = qcom_add_sysmon_subdev(rproc,
>  					      desc->sysmon_name,
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 7af1d0c987e0..b5dd36775b77 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1762,7 +1762,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  
>  	qproc->mpss_perm = BIT(QCOM_SCM_VMID_HLOS);
>  	qproc->mba_perm = BIT(QCOM_SCM_VMID_HLOS);
> -	qcom_add_glink_subdev(rproc, &qproc->glink_subdev);
> +	qcom_add_glink_subdev(rproc, &qproc->glink_subdev, "mpss");
>  	qcom_add_smd_subdev(rproc, &qproc->smd_subdev);
>  	qcom_add_ssr_subdev(rproc, &qproc->ssr_subdev, "mpss");
>  	qcom_add_ipa_notify_subdev(rproc, &qproc->ipa_notify_subdev);
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 8ecc157f1ed1..fc6658b523b6 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -436,7 +436,7 @@ static int adsp_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto detach_proxy_pds;
>  
> -	qcom_add_glink_subdev(rproc, &adsp->glink_subdev);
> +	qcom_add_glink_subdev(rproc, &adsp->glink_subdev, desc->ssr_name);
>  	qcom_add_smd_subdev(rproc, &adsp->smd_subdev);
>  	qcom_add_ssr_subdev(rproc, &adsp->ssr_subdev, desc->ssr_name);
>  	adsp->sysmon = qcom_add_sysmon_subdev(rproc,
> -- 
> 2.24.0
> 
