Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F56A46D9A1
	for <lists+linux-remoteproc@lfdr.de>; Wed,  8 Dec 2021 18:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237804AbhLHRbN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 8 Dec 2021 12:31:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237820AbhLHRbN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 8 Dec 2021 12:31:13 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534C5C0617A2
        for <linux-remoteproc@vger.kernel.org>; Wed,  8 Dec 2021 09:27:41 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id r130so3076544pfc.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Dec 2021 09:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9TM+RyxfTkSXlam8EqNg6wuolSoQRPl6kpvkBCBVO+w=;
        b=p2de7tAX0wNqXXXfApSpy6QAnvIEeikCayETzj3Grg2i1jgc5o842O/9mztxNxbGVR
         cAcxAX/ceD+rTU/+KtmWlrf1zq0Hs9YyEC+mLaImtlE2/M3iyddvse+EDtnj87pZqYXs
         Pv5UMp9ajc6+Ck+gbIkadzoYICMMJz/b90hhqBz/IDkUUADFEWFtqnW8vNnOAuZh+zId
         cYB6mfkpEDU06Q1RWGcifQwNo3AFBzVWupC2cPfgctHaYUt+Nkys7Zf6zkeaOjurNwLI
         mo6M+asrXaSxdr4wnc2xmgYdOJoelq9CYEFuUbq1QqDUXk/fV32Hisfg+cBGffMX9GuL
         DxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9TM+RyxfTkSXlam8EqNg6wuolSoQRPl6kpvkBCBVO+w=;
        b=hp6Oo87NsSdBkq99TVU6ZWmhASbazhujk0PuEpU7s0fKz4Z6z4PotG4Gdg1/2/z6Jw
         HCTby6lzgLLPiXwfbFxzuqr6dfP7UEcjvOiHTZy5B2ZpysK4lXxMJJDjbywjB8pNm9tw
         wHHzrIJazdRJ+5obX1+GxfGOiGphwhAlgJNydgpJfQXr7Fss/L1dkG/SRsaQwtg7Q5IK
         geD3E4TuakEePxn4CNNjnbEsJpKzIosfzN6AUnTJwzXlPOCLlq+3ufIdcDyVlaq+j4nL
         ORQtY8bjxGZdTKe0VOsLwhjpdwnBjdvEvX3429uzCz5y/u68Gkekg30b9D9Fhyll/ynn
         7RgQ==
X-Gm-Message-State: AOAM532h6edvB7N4qE7yDyH2Q91ZxyQHva2C3HD4rAS5QAR+iR6yVvIa
        nOO/XKzeW5QwFxulh6omiBo6p0aHLyd02A==
X-Google-Smtp-Source: ABdhPJyavsbDwE3hcPZiOvYaeiu7KMvC77bLLEXJWoWxeyZoKeA/Axxre1R4VyHxmArzHAQ4+uUvMQ==
X-Received: by 2002:a63:6a03:: with SMTP id f3mr30414099pgc.618.1638984460744;
        Wed, 08 Dec 2021 09:27:40 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id h1sm4230705pfh.219.2021.12.08.09.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:27:39 -0800 (PST)
Date:   Wed, 8 Dec 2021 10:27:37 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] remoteproc: Fix remaining wrong return formatting in
 documentation
Message-ID: <20211208172737.GB1138949@p14s>
References: <20211206191858.10741-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206191858.10741-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Dec 06, 2021 at 08:18:58PM +0100, Arnaud Pouliquen wrote:
> kernel documentation specification:
> "The return value, if any, should be described in a dedicated section
> named Return."
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/mtk_scp_ipi.c   | 4 ++--
>  drivers/remoteproc/st_slim_rproc.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
> index 6dc955ecab80..00f041ebcde6 100644
> --- a/drivers/remoteproc/mtk_scp_ipi.c
> +++ b/drivers/remoteproc/mtk_scp_ipi.c
> @@ -23,7 +23,7 @@
>   *
>   * Register an ipi function to receive ipi interrupt from SCP.
>   *
> - * Returns 0 if ipi registers successfully, -error on error.
> + * Return: 0 if ipi registers successfully, -error on error.
>   */
>  int scp_ipi_register(struct mtk_scp *scp,
>  		     u32 id,
> @@ -150,7 +150,7 @@ EXPORT_SYMBOL_GPL(scp_ipi_unlock);
>   * When the processing completes, IPI handler registered
>   * by scp_ipi_register will be called in interrupt context.
>   *
> - * Returns 0 if sending data successfully, -error on error.
> + * Return: 0 if sending data successfully, -error on error.
>   **/
>  int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>  		 unsigned int wait)
> diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
> index 22096adc1ad3..4ed9467897e5 100644
> --- a/drivers/remoteproc/st_slim_rproc.c
> +++ b/drivers/remoteproc/st_slim_rproc.c
> @@ -216,7 +216,7 @@ static const struct rproc_ops slim_rproc_ops = {
>   * obtains and enables any clocks required by the SLIM core and also
>   * ioremaps the various IO.
>   *
> - * Returns st_slim_rproc pointer or PTR_ERR() on error.
> + * Return: st_slim_rproc pointer or PTR_ERR() on error.
>   */

Applied.

Thanks,
Mathieu

>  
>  struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
> -- 
> 2.17.1
> 
