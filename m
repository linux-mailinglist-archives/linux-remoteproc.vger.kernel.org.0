Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 938FA19012D
	for <lists+linux-remoteproc@lfdr.de>; Mon, 23 Mar 2020 23:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgCWWpl (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 23 Mar 2020 18:45:41 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:32960 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbgCWWpl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 Mar 2020 18:45:41 -0400
Received: by mail-pf1-f194.google.com with SMTP id j1so5565068pfe.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Mar 2020 15:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TtecznepabbAupu5OhOJc88aU0NaofKjnQBnVaXn4N0=;
        b=IjNaZRyRYGMcE0x6dwwZkBtuw57R2TXwcrpUx9acHodEYtVrFi2TRISrhMH1zS6FXa
         lhc2ZjvhReJVfj99jl6Ouimr/xKCRphxnaXm7MlXv16EnADSwT2syqhfllDVSRIzDYW8
         KfspzlCde6336YXWInAYnEJWipEoiKWX3XL/xv6CT5huoO7/Rmm+wDlewDFSVaW734N8
         afFeZ8eeVydh7pkemF5N7VASjgAubIYC5atJ/5AQXESzuXFciWhNMKAxNA0RYf1GVYUy
         BkpGAYI2SqpAnbDSsKbR8biPgWYasibtetHE2JbS3XvfJz7/l5kirAu81G/8goa+5/mG
         wIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TtecznepabbAupu5OhOJc88aU0NaofKjnQBnVaXn4N0=;
        b=dIQngvFnhYvelkhSfuPhknhO/1XigwPPqj8bePApRp6ecjHxg60ZI2dAxEp8GLh+Rb
         S5mzssVtI6rhyDF1oEqLwZ4zdNAOM+erzOP9HQX0S+NgFyFwuo1NnEDC4Yz9YPz8xA/m
         8Q+n9nTcD6KBJG+w8jkAaROvDd7H7Wf+PBp9yiJZ55rXJ53Qvn/WYYb8Ixual6Dbqeje
         DqpZIxSFHOjpyT7oA2XC9P9IbT1R4BF9GJmF0vz9HhEow9gdgPCxbgtYLx/Ad58PWulx
         EROrCQ9baYb8V7kV5MzKMD4wMJUEsrqOF7da1DTtNM50joUU+LVtD/XlSB80TLL5ymCR
         hVog==
X-Gm-Message-State: ANhLgQ0+ce7iiS282I8seiNBWSt1FQqUlE2ZHL35BEjYE5cFUPkKrt58
        NIy/121VvfGxY89CiQ82lxdXxw==
X-Google-Smtp-Source: ADFU+vvYPq6IkWolXCJyUIaTFdVYJTxdfEQvTVJCVUvN27Ti6d8m7eoCGv8VwrrCCv/bFy/UakGVPA==
X-Received: by 2002:a63:fe58:: with SMTP id x24mr23348015pgj.170.1585003539852;
        Mon, 23 Mar 2020 15:45:39 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y9sm10286254pfo.135.2020.03.23.15.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 15:45:39 -0700 (PDT)
Date:   Mon, 23 Mar 2020 16:45:36 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] remoteproc: qcom: Introduce panic handler for PAS
 and ADSP
Message-ID: <20200323224536.GE30464@xps15>
References: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
 <20200310063817.3344712-5-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310063817.3344712-5-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Mar 09, 2020 at 11:38:17PM -0700, Bjorn Andersson wrote:
> Make the PAS and ADSP/CDSP remoteproc drivers implement the panic
> handler that will invoke a stop to prepare the remoteprocs for post
> mortem debugging.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Change since v3:
>  - Change return type to unsigned long
> 
>  drivers/remoteproc/qcom_q6v5_adsp.c | 8 ++++++++
>  drivers/remoteproc/qcom_q6v5_pas.c  | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index d5cdff942535..8f1044e8ea3b 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -292,12 +292,20 @@ static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
>  	return adsp->mem_region + offset;
>  }
>  
> +static unsigned long adsp_panic(struct rproc *rproc)
> +{
> +	struct qcom_adsp *adsp = rproc->priv;
> +
> +	return qcom_q6v5_panic(&adsp->q6v5);
> +}
> +
>  static const struct rproc_ops adsp_ops = {
>  	.start = adsp_start,
>  	.stop = adsp_stop,
>  	.da_to_va = adsp_da_to_va,
>  	.parse_fw = qcom_register_dump_segments,
>  	.load = adsp_load,
> +	.panic = adsp_panic,
>  };
>  
>  static int adsp_init_clock(struct qcom_adsp *adsp, const char **clk_ids)
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index e64c268e6113..678c0ddfce96 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -243,12 +243,20 @@ static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
>  	return adsp->mem_region + offset;
>  }
>  
> +static unsigned long adsp_panic(struct rproc *rproc)
> +{
> +	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;

Above rproc->priv is not casted but it is here... Not a problem, just
consistency.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> +
> +	return qcom_q6v5_panic(&adsp->q6v5);
> +}
> +
>  static const struct rproc_ops adsp_ops = {
>  	.start = adsp_start,
>  	.stop = adsp_stop,
>  	.da_to_va = adsp_da_to_va,
>  	.parse_fw = qcom_register_dump_segments,
>  	.load = adsp_load,
> +	.panic = adsp_panic,
>  };
>  
>  static int adsp_init_clock(struct qcom_adsp *adsp)
> -- 
> 2.24.0
> 
