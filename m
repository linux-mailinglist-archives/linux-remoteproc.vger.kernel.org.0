Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47BB033FD06
	for <lists+linux-remoteproc@lfdr.de>; Thu, 18 Mar 2021 03:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhCRCFq (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 17 Mar 2021 22:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbhCRCFN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Mar 2021 22:05:13 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 063CCC061760
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Mar 2021 19:05:12 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so3771096otk.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Mar 2021 19:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hFIpeKGuX0nycNGYPZhEkMTQ5TBqkNsH4ol9rotosSc=;
        b=IhgVGMCvFH2iERlU//bxqH9so1HPvDqIVyIrwWE+6bq8TApVEWo3UMUo5FIEUp9/7p
         SUizN/eu9SknJXLViXcoZX5NUIpl7sB4/tx/cgVd0fDUM9rbGniAvT5h6FnFLq48cAMs
         ZQYQWjDrYNOlVVegvpVydsF1huTuX890N78nMYdAN3ajl66KQk52r3BGI1HOxt1MxfqH
         AefYuAJagpM6EiQrKCrhOR50SSON9HG+Ok+/vORiIW5b590kz3hYHUv+Vt9aGaRfwpL8
         8hg+HI8IXJPsWVxwIRKqLBRbhf3Xj5/43gfh/KGYHBvnyBq154LILExyZkJsroDsF2yt
         XCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hFIpeKGuX0nycNGYPZhEkMTQ5TBqkNsH4ol9rotosSc=;
        b=FSSaGeOtuPiIpl/wrbgiXfbFYk1FiVInBUMAJmVbzm5lSMGTeRspgClt0auSaXmp8A
         dqaB4PylysyovCvGrxkaE1Mr2RrX/QsmiAjvI1qr9n0cnBQBrK3OiLlY8aPDmiLLpBGa
         vDljUfYxPcubNOniZvXJwTV5LMW5IeeSNCQoYtnNQw4CVZDgL68fJU9G3PgvW8WsoKzX
         OX6AHEUgLFXQeu64hXGRvdDMx+HKJK9HA3hdG77mAbPYE1kh+ClM9uU+4yN76g/6vOUd
         OGND9teAfmAHPPZiFCcnFzmatrpfdZt8+AlQ/TOHuQFhyHnyHzdEP76o86wYkfxABsbT
         avSw==
X-Gm-Message-State: AOAM5339x5Pu4Lcgh0wMxoads1IBuw6G0yUVmWKfSgqM1IjvppMpcIRj
        xgrfCQ0tyzurDVRAUCH6O187Xg==
X-Google-Smtp-Source: ABdhPJxFML//B68n13ChjKm4UD7s0AutRzoN7PAzF7QkWiRDrh5kbP77C0us713T0MxQGUia13XF+w==
X-Received: by 2002:a9d:7293:: with SMTP id t19mr5689012otj.4.1616033112191;
        Wed, 17 Mar 2021 19:05:12 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u194sm211331oia.27.2021.03.17.19.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 19:05:11 -0700 (PDT)
Date:   Wed, 17 Mar 2021 21:05:10 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Cc:     sboyd@kernel.org, agross@kernel.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH v8 2/9] remoteproc: qcom: Add secure PIL support
Message-ID: <YFK1VpP74rQH2Z72@builder.lan>
References: <1611984013-10201-1-git-send-email-gokulsri@codeaurora.org>
 <1611984013-10201-3-git-send-email-gokulsri@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611984013-10201-3-git-send-email-gokulsri@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 29 Jan 23:20 CST 2021, Gokul Sriram Palanisamy wrote:

> IPQ8074 uses secure PIL. Hence, adding the support for the same.
> 

Sorry for not giving this a proper review before Gokul, I've look at it
but been uncertain about what feedback to offer.

> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>

I suspect that there should have some "Co-developed-by" here (and in the
other patches)?

> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 43 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index c0368bb..4e35e5c 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -18,6 +18,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> +#include <linux/qcom_scm.h>
>  #include "qcom_common.h"
>  #include "qcom_pil_info.h"
>  #include "qcom_q6v5.h"
> @@ -86,6 +87,9 @@
>  #define TCSR_WCSS_CLK_ENABLE	0x14
>  
>  #define MAX_HALT_REG		3
> +
> +#define WCNSS_PAS_ID		6
> +
>  enum {
>  	WCSS_IPQ8074,
>  	WCSS_QCS404,
> @@ -134,6 +138,7 @@ struct q6v5_wcss {
>  	unsigned int crash_reason_smem;
>  	u32 version;
>  	bool requires_force_stop;
> +	bool need_mem_protection;
>  
>  	struct qcom_rproc_glink glink_subdev;
>  	struct qcom_rproc_ssr ssr_subdev;
> @@ -152,6 +157,7 @@ struct wcss_data {
>  	int ssctl_id;
>  	const struct rproc_ops *ops;
>  	bool requires_force_stop;
> +	bool need_mem_protection;
>  };
>  
>  static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
> @@ -251,6 +257,15 @@ static int q6v5_wcss_start(struct rproc *rproc)
>  
>  	qcom_q6v5_prepare(&wcss->q6v5);
>  
> +	if (wcss->need_mem_protection) {
> +		ret = qcom_scm_pas_auth_and_reset(WCNSS_PAS_ID);
> +		if (ret) {
> +			dev_err(wcss->dev, "wcss_reset failed\n");
> +			return ret;
> +		}
> +		goto wait_for_reset;

This goto essentially puts the entire old function in an "else" block.

> +	}
> +
>  	/* Release Q6 and WCSS reset */
>  	ret = reset_control_deassert(wcss->wcss_reset);
>  	if (ret) {
> @@ -285,6 +300,7 @@ static int q6v5_wcss_start(struct rproc *rproc)
>  	if (ret)
>  		goto wcss_q6_reset;
>  
> +wait_for_reset:
>  	ret = qcom_q6v5_wait_for_start(&wcss->q6v5, 5 * HZ);
>  	if (ret == -ETIMEDOUT)
>  		dev_err(wcss->dev, "start timed out\n");
> @@ -717,6 +733,15 @@ static int q6v5_wcss_stop(struct rproc *rproc)
>  	struct q6v5_wcss *wcss = rproc->priv;
>  	int ret;
>  
> +	if (wcss->need_mem_protection) {
> +		ret = qcom_scm_pas_shutdown(WCNSS_PAS_ID);
> +		if (ret) {
> +			dev_err(wcss->dev, "not able to shutdown\n");
> +			return ret;
> +		}
> +		goto pas_done;

Same here.

> +	}
> +
>  	/* WCSS powerdown */
>  	if (wcss->requires_force_stop) {
>  		ret = qcom_q6v5_request_stop(&wcss->q6v5, NULL);
> @@ -741,6 +766,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
>  			return ret;
>  	}
>  
> +pas_done:
>  	clk_disable_unprepare(wcss->prng_clk);
>  	qcom_q6v5_unprepare(&wcss->q6v5);
>  
> @@ -764,9 +790,15 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
>  	struct q6v5_wcss *wcss = rproc->priv;
>  	int ret;
>  
> -	ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
> -				    0, wcss->mem_region, wcss->mem_phys,
> -				    wcss->mem_size, &wcss->mem_reloc);
> +	if (wcss->need_mem_protection)
> +		ret = qcom_mdt_load(wcss->dev, fw, rproc->firmware,
> +				    WCNSS_PAS_ID, wcss->mem_region,
> +				    wcss->mem_phys, wcss->mem_size,
> +				    &wcss->mem_reloc);
> +	else
> +		ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
> +					    0, wcss->mem_region, wcss->mem_phys,
> +					    wcss->mem_size, &wcss->mem_reloc);

And same here.

In practice this means that you're essentially overloading new logic to
all code paths though the driver. Left is some boilerplate code, which I
wish we could refactor into common helper functions in the framework
(e.g. we duplicate q6v5_alloc_memory_region() in a lot of drivers).

So with this in mind, instead of overloading new logic to this entire
driver, could you please submit a new driver for the PAS based IPQ WCSS?

Regards,
Bjorn

>  	if (ret)
>  		return ret;
>  
> @@ -1032,6 +1064,9 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
>  	if (!desc)
>  		return -EINVAL;
>  
> +	if (desc->need_mem_protection && !qcom_scm_is_available())
> +		return -EPROBE_DEFER;
> +
>  	rproc = rproc_alloc(&pdev->dev, pdev->name, desc->ops,
>  			    desc->firmware_name, sizeof(*wcss));
>  	if (!rproc) {
> @@ -1045,6 +1080,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
>  
>  	wcss->version = desc->version;
>  	wcss->requires_force_stop = desc->requires_force_stop;
> +	wcss->need_mem_protection = desc->need_mem_protection;
>  
>  	ret = q6v5_wcss_init_mmio(wcss, pdev);
>  	if (ret)
> @@ -1115,6 +1151,7 @@ static const struct wcss_data wcss_ipq8074_res_init = {
>  	.wcss_q6_reset_required = true,
>  	.ops = &q6v5_wcss_ipq8074_ops,
>  	.requires_force_stop = true,
> +	.need_mem_protection = true,
>  };
>  
>  static const struct wcss_data wcss_qcs404_res_init = {
> -- 
> 2.7.4
> 
