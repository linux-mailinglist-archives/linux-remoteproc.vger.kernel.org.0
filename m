Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B85660B560
	for <lists+linux-remoteproc@lfdr.de>; Mon, 24 Oct 2022 20:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbiJXSWq (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 24 Oct 2022 14:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiJXSW3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 24 Oct 2022 14:22:29 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC522930B6
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Oct 2022 10:03:19 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id b11so2447562pjp.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Oct 2022 10:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HWp3TIeKZpGy6GkN3z1WruHhMlmRnuA03h7wokHamTc=;
        b=ifD1VgrDLxCc8E7hOmtSPZILVWOKunssDgoKSoiRy1CHAZmOqOzu/uMCK6+tn+GMWY
         nL6pb9yq7qaupMctBou9mUZx4bwcoTj0K/Z6L3AHmMEsc4FSCq1JRbgc6n7Y2gUDJiyY
         rBfPEjIvx1SIN1qhSfY+94swzZiVmETFhdhdNolzI36SLsLbI90vIaFDbBRd3IVngJMh
         i/BKM/IM7VdlYy9voCghRHXu+74Zj3bBoaCI4jCixbobobyZ06soVmwUIkwbTtSg4VDH
         8tJ5/6fU66laIDsiGcPgv71tnRc/9M+Gx3MXYU8TJlYedmr16AUYA8wFjsLsOPALwDEh
         prnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWp3TIeKZpGy6GkN3z1WruHhMlmRnuA03h7wokHamTc=;
        b=LjMOEsgleX1pQXLibYL44f6nRfWeVNRxu9Dg9zz9doaJLcS4ZVXLLk3g3f7n8Uyo+a
         PULQZxqYkrywycm+/XNAVuzQB+wWE39pcuJ2o5v7ARlIqOV0tO57Ciel+O92scyd7SHr
         4MK12qREGT2VZ3Yg+4S6c7J6BP6Iil+FMzlkTqauDbqt5BfU6OBAW7zFAMAVztH2oFtu
         mdb8gd2MVmgX7G8Eetue5svnpTzXsPwGbRvQ4i+RlBmTa7pidrTEfZE+rzrBo2x9JexG
         p4zSifGyCf52AHO1gMabnfnbEmBFUwgn/ZsnrMVlM5DPbpw0Hi67N9seQrAjqCxVYHGZ
         fBlg==
X-Gm-Message-State: ACrzQf0QbBHpaVCx1HP0JnPtxB9jNE7JDs0vmsgEMdpj1dh3CMH7TYSH
        09KAqHi0dCXxZ2IsQhY/atCpiBit0/+HhQ==
X-Google-Smtp-Source: AMsMyM6PhPvK8EnzR1KXAMrq3tghFd4cT03OkXdxwzHQfXVqm16kPsN6qMQluFFrLYjD9A49RHG1Ew==
X-Received: by 2002:a17:902:d903:b0:186:601a:a6fa with SMTP id c3-20020a170902d90300b00186601aa6famr25427302plz.102.1666628820837;
        Mon, 24 Oct 2022 09:27:00 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l8-20020a17090add8800b00210125b789dsm95720pjv.54.2022.10.24.09.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 09:27:00 -0700 (PDT)
Date:   Mon, 24 Oct 2022 10:26:58 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: Add mutex protection for
 workqueue
Message-ID: <20221024162658.GA626419@p14s>
References: <1664524216-19949-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1664524216-19949-1-git-send-email-shengjiu.wang@nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Sep 30, 2022 at 03:50:16PM +0800, Shengjiu Wang wrote:
> The workqueue may execute late even after remoteproc is stopped or
> stopping, some resources (rpmsg device and endpoint) have been
> released in rproc_stop_subdevices(), then rproc_vq_interrupt()
> accessing these resources will cause kennel dump.
> 
> Call trace:
>  virtqueue_add_split+0x1ac/0x560
>  virtqueue_add_inbuf+0x4c/0x60
>  rpmsg_recv_done+0x15c/0x294
>  vring_interrupt+0x6c/0xa4
>  rproc_vq_interrupt+0x30/0x50
>  imx_dsp_rproc_vq_work+0x24/0x40 [imx_dsp_rproc]
>  process_one_work+0x1d0/0x354
>  worker_thread+0x13c/0x470
>  kthread+0x154/0x160
>  ret_from_fork+0x10/0x20
> 
> Add mutex protection in imx_dsp_rproc_vq_work(), if the state is
> not running, then just skip calling rproc_vq_interrupt().
> 
> Also the flush workqueue operation can't be added in rproc stop
> for the same reason. The call sequence is
> 
> rproc_shutdown
> -> rproc_stop
>    ->rproc_stop_subdevices
>    ->rproc->ops->stop()
>      ->imx_dsp_rproc_stop
>        ->flush_work
>          -> rproc_vq_interrupt
> 
> The resource needed by rproc_vq_interrupt has been released in
> rproc_stop_subdevices, so flush_work is not safe to be called in
> imx_dsp_rproc_stop.
> 
> Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
> changes in v2:
> - update commit message
> 
>  drivers/remoteproc/imx_dsp_rproc.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Applied.

Thanks,
Mathieu

> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 899aa8dd12f0..95da1cbefacf 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -347,9 +347,6 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>  	struct device *dev = rproc->dev.parent;
>  	int ret = 0;
>  
> -	/* Make sure work is finished */
> -	flush_work(&priv->rproc_work);
> -
>  	if (rproc->state == RPROC_CRASHED) {
>  		priv->flags &= ~REMOTE_IS_READY;
>  		return 0;
> @@ -432,9 +429,18 @@ static void imx_dsp_rproc_vq_work(struct work_struct *work)
>  {
>  	struct imx_dsp_rproc *priv = container_of(work, struct imx_dsp_rproc,
>  						  rproc_work);
> +	struct rproc *rproc = priv->rproc;
> +
> +	mutex_lock(&rproc->lock);
> +
> +	if (rproc->state != RPROC_RUNNING)
> +		goto unlock_mutex;
>  
>  	rproc_vq_interrupt(priv->rproc, 0);
>  	rproc_vq_interrupt(priv->rproc, 1);
> +
> +unlock_mutex:
> +	mutex_unlock(&rproc->lock);
>  }
>  
>  /**
> -- 
> 2.34.1
> 
