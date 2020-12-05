Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2BAC2CF819
	for <lists+linux-remoteproc@lfdr.de>; Sat,  5 Dec 2020 01:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbgLEApJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 4 Dec 2020 19:45:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbgLEApI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Dec 2020 19:45:08 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6C6C0613D1
        for <linux-remoteproc@vger.kernel.org>; Fri,  4 Dec 2020 16:44:28 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id j12so7032451ota.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Dec 2020 16:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FKHcTrBVaUtk6AbcZrMyJksvnOdCrwx+JnD4iIZ6n34=;
        b=vWj1HS7XdM6sJsHKzZwXcDlz1P4t/m3xcRfRQ5muZhgl6MsePlIQhZt5BVmS/XfxPh
         yVp1O5+i7x+beMvQ974a/ITXECTTQuPN06cW56njFPmDMxu3HNNEjofllmgKJkuINzKh
         tqxoeVBUlyDyM0M7BRpKBaQYJfgCwl58GHWzHk0UPbYpJeq90u8E2/1vbPyoq+lAqCve
         obJBc4MricpaJDLYVqC4u1J0jRR2GUBV3isZLwcUMouHwBxn/E6sCU9Gpl1A274q1Qs1
         7+LZylGMJA4QsMeJUPgiadPQSz3lh9B6uxvM+Y7y+Wnc5nO5EjhtihfRVLKBI9gNrYSU
         qGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FKHcTrBVaUtk6AbcZrMyJksvnOdCrwx+JnD4iIZ6n34=;
        b=q+4Cm+NJTQpDAPM5sOV3uYRRyKl01DohKJwtmmcC4ZA0UGcoH/VGS1vyQ2Z/Xte88x
         pzvEzZRrM4ggELenkjIx1PcsydMjrwz0Ts+eOU2FQ6zhrTmXnVFmQsE1nVWvqR/tryh3
         gr144FNnYa7koKfaXs6LdCqeL/vR19oDbRNXBb2ZIL89giLPKheUjYiPXCUq83ZXONrS
         EDvyhSA0cb+KQPOm3WkFpVS+0Zleep8uK/AKXFbFMOYJBjqrXTgNtsBrjH1NMKl/Mrel
         Ms6ByjuenBXhzlltaZUKcPD4URCNAybt4C5lhPsjr34tAuVoNAM48RBlNiKGQ5W70vN9
         onCg==
X-Gm-Message-State: AOAM531H2rEngN2nA0aH3I+vEwvYTQWkvdsh0bxCb0ohjB1mQ40nWoub
        pEGojyOaV0JY7jy75PF0dh1e2g==
X-Google-Smtp-Source: ABdhPJyW2IkteVS0klfDV4wsG3ZVAckzuNpnrVhfh/ARwBL3+3e4I/3vTa24jF508jL9ROxY5Gmt+Q==
X-Received: by 2002:a9d:3988:: with SMTP id y8mr5561961otb.278.1607129067772;
        Fri, 04 Dec 2020 16:44:27 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q1sm605827oic.38.2020.12.04.16.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 16:44:27 -0800 (PST)
Date:   Fri, 4 Dec 2020 18:44:25 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     ohad@wizery.com, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH V3 7/7] remoteproc: imx_proc: enable virtio/mailbox
Message-ID: <X8rX6Rs6xvBkZEn3@builder.lan>
References: <20201204074036.23870-1-peng.fan@oss.nxp.com>
 <20201204074036.23870-8-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204074036.23870-8-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 04 Dec 01:40 CST 2020, Peng Fan (OSS) wrote:

> From: Peng Fan <peng.fan@nxp.com>
> 
> Use virtio/mailbox to build connection between Remote Proccessors
> and Linux. Add work queue to handle incoming messages.
> 
> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 133 ++++++++++++++++++++++++++++++++-
>  1 file changed, 130 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index afa650610996..584584a00921 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -8,6 +8,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/mailbox_client.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> @@ -16,6 +17,9 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/workqueue.h>
> +
> +#include "remoteproc_internal.h"
>  
>  #define IMX7D_SRC_SCR			0x0C
>  #define IMX7D_ENABLE_M4			BIT(3)
> @@ -88,6 +92,11 @@ struct imx_rproc {
>  	const struct imx_rproc_dcfg	*dcfg;
>  	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
>  	struct clk			*clk;
> +	struct mbox_client		cl;
> +	struct mbox_chan		*tx_ch;
> +	struct mbox_chan		*rx_ch;
> +	struct work_struct		rproc_work;
> +	struct workqueue_struct		*workqueue;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
> @@ -369,9 +378,33 @@ static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  	return 0;
>  }
>  
> +static void imx_rproc_kick(struct rproc *rproc, int vqid)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	int err;
> +	__u32 mmsg;
> +
> +	if (!priv->tx_ch) {
> +		dev_err(priv->dev, "No initialized mbox tx channel\n");
> +		return;
> +	}
> +
> +	/*
> +	 * Send the index of the triggered virtqueue as the mu payload.
> +	 * Let remote processor know which virtqueue is used.
> +	 */
> +	mmsg = vqid << 16;
> +
> +	err = mbox_send_message(priv->tx_ch, (void *)&mmsg);
> +	if (err < 0)
> +		dev_err(priv->dev, "%s: failed (%d, err:%d)\n",
> +			__func__, vqid, err);
> +}
> +
>  static const struct rproc_ops imx_rproc_ops = {
>  	.start		= imx_rproc_start,
>  	.stop		= imx_rproc_stop,
> +	.kick		= imx_rproc_kick,
>  	.da_to_va       = imx_rproc_da_to_va,
>  	.load		= rproc_elf_load_segments,
>  	.parse_fw	= imx_rproc_parse_fw,
> @@ -454,6 +487,77 @@ static void imx_rproc_memset(struct rproc *rproc, void *s, int c, size_t count)
>  	memset_io((void * __iomem)s, c, count);
>  }
>  
> +static void imx_rproc_vq_work(struct work_struct *work)
> +{
> +	struct imx_rproc *priv = container_of(work, struct imx_rproc,
> +					      rproc_work);
> +
> +	rproc_vq_interrupt(priv->rproc, 0);
> +	rproc_vq_interrupt(priv->rproc, 1);
> +}
> +
> +static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
> +{
> +	struct rproc *rproc = dev_get_drvdata(cl->dev);
> +	struct imx_rproc *priv = rproc->priv;
> +
> +	queue_work(priv->workqueue, &priv->rproc_work);
> +}
> +
> +static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	struct device *dev = priv->dev;
> +	struct mbox_client *cl;
> +	int ret = 0;
> +
> +	if (!of_get_property(dev->of_node, "mbox-names", NULL))
> +		return 0;
> +
> +	cl = &priv->cl;
> +	cl->dev = dev;
> +	cl->tx_block = true;
> +	cl->tx_tout = 100;
> +	cl->knows_txdone = false;
> +	cl->rx_callback = imx_rproc_rx_callback;
> +
> +	priv->tx_ch = mbox_request_channel_byname(cl, "tx");
> +	if (IS_ERR(priv->tx_ch)) {
> +		if (PTR_ERR(priv->tx_ch) == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		ret = PTR_ERR(priv->tx_ch);
> +		dev_dbg(cl->dev, "failed to request mbox tx chan, ret %d\n",
> +			ret);

This is worse than a dev_dbg(), something is actually wrong.
Also there's no point in jumping to err_out here, because tx_ch is
IS_ERR() so we're going to skip the first part and rx_ch is not IS_ERR()
so you're going to call mbox_free_channel(NULL) and then return.

So just replace this entire block with:

		return dev_err_probe(dev, PTR_ERR(priv->ch_ch),
				     "failed to request tx mailbox channel: %d\n",
				     ret);
	

> +		goto err_out;
> +	}
> +
> +	priv->rx_ch = mbox_request_channel_byname(cl, "rx");
> +	if (IS_ERR(priv->rx_ch)) {
> +		ret = PTR_ERR(priv->rx_ch);
> +		dev_dbg(cl->dev, "failed to request mbox rx chan, ret %d\n",
> +			ret);
> +		goto err_out;

		mbox_free_channel(priv->tx_ch);
		return dev_err_probe(dev, PTR_ERR(priv->ch_ch),
				     "failed to request rx mailbox channel: %d\n",
				     ret);

> +	}
> +
> +	return ret;

ret is 0 here.

> +
> +err_out:
> +	if (!IS_ERR(priv->tx_ch))
> +		mbox_free_channel(priv->tx_ch);
> +	if (!IS_ERR(priv->rx_ch))
> +		mbox_free_channel(priv->rx_ch);
> +
> +	return ret;
> +}
> +
> +static void imx_rproc_free_mbox(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +
> +	mbox_free_channel(priv->tx_ch);
> +	mbox_free_channel(priv->rx_ch);
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -496,18 +600,31 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	priv->dev = dev;
>  
>  	dev_set_drvdata(dev, rproc);
> +	priv->workqueue = create_workqueue(dev_name(dev));
> +	if (!priv->workqueue) {
> +		dev_err(dev, "cannot create workqueue\n");
> +		ret = -ENOMEM;
> +		goto err_put_rproc;
> +	}
> +
> +	ret = imx_rproc_xtr_mbox_init(rproc);
> +	if (ret) {
> +		if (ret == -EPROBE_DEFER)
> +			goto err_put_wkq;
> +		/* mbox is optional, so not fail here */

imx_rproc_xtr_mbox_init() returns 0 if no mbox was specified, that means
that in all cases that we reach here mailboxes where specified but an
error occurred. You should not ignore this.

> +	}
>  
>  	ret = imx_rproc_addr_init(priv, pdev);
>  	if (ret) {
>  		dev_err(dev, "failed on imx_rproc_addr_init\n");
> -		goto err_put_rproc;
> +		goto err_put_mbox;
>  	}
>  
>  	priv->clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(priv->clk)) {
>  		dev_err(dev, "Failed to get clock\n");
>  		ret = PTR_ERR(priv->clk);
> -		goto err_put_rproc;
> +		goto err_put_mbox;
>  	}
>  
>  	/*
> @@ -517,9 +634,11 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	ret = clk_prepare_enable(priv->clk);
>  	if (ret) {
>  		dev_err(&rproc->dev, "Failed to enable clock\n");
> -		goto err_put_rproc;
> +		goto err_put_mbox;
>  	}
>  
> +	INIT_WORK(&(priv->rproc_work), imx_rproc_vq_work);
> +
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
> @@ -530,6 +649,13 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  
>  err_put_clk:
>  	clk_disable_unprepare(priv->clk);
> +err_put_mbox:
> +	if (!IS_ERR(priv->tx_ch))

With above changes you won't get here with IS_ERR(tx_ch) ||
IS_ERR(rx_ch), so you can safely remove the conditionals and just call
mbox_free_channel().

Regards,
Bjorn

> +		mbox_free_channel(priv->tx_ch);
> +	if (!IS_ERR(priv->rx_ch))
> +		mbox_free_channel(priv->rx_ch);
> +err_put_wkq:
> +	destroy_workqueue(priv->workqueue);
>  err_put_rproc:
>  	rproc_free(rproc);
>  
> @@ -542,6 +668,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
>  	struct imx_rproc *priv = rproc->priv;
>  
>  	clk_disable_unprepare(priv->clk);
> +	imx_rproc_free_mbox(rproc);
>  	rproc_del(rproc);
>  	rproc_free(rproc);
>  
> -- 
> 2.28.0
> 
