Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6421E1A8750
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 Apr 2020 19:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407593AbgDNRUL (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 Apr 2020 13:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407592AbgDNRUJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Apr 2020 13:20:09 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5404CC061A0E
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 10:20:08 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id g2so192120plo.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 10:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nYOdjx3SpF9DkUS8byznV4S2MTaAE+QPJcIvAavqU9w=;
        b=vU9z5nd4yquIaqbQ1kKrijql3CdqH/vUzjQxEYdp7Ld378Iah8QBqN0n5HZWOjhj88
         Ya9kPC8lGxVHd/ig51gCCgTEkGIYfntAFWS1+ReMGiRZGuA4/hoUrk4RVpaZm8UooYCb
         79nJW9TJdniD4kLM9nqpLWjRlOG52HbMsBH3Sd8TpJSvNEW6SXJQkFr/XJav44xgPVc6
         ko2830DQlLvQaUXLGIK9KVq+VYtkY5YhKFEuvlyILXUJquBnTrqkew3g2ZlTuDJklXEP
         Tl7PWyPp+L7eWHxh6UKxVU0YDWUupsw/FldAsdG9qXGfXkugd+kY94tgTkY6FIMZyCWY
         tXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nYOdjx3SpF9DkUS8byznV4S2MTaAE+QPJcIvAavqU9w=;
        b=lRtY4FZg9r4lcOSSJIYO/JQ/E/UePRiZV+KpM8sO+Cj0MRL/zEK01xd4bgPSfVLtW3
         HiAx73G7TPKCIx0DCBBVwWBV3GZlQH3epL9qikh6Qq8fEGELE4BsBrfJYvgjpZomMj1M
         zFPLChWxw6ToJaY6bqcee4fhiZsCflzd2heYFWpsFrWgE7NCcMrTiLiUne33Ms3nK8xO
         g4rKnXDmGWFi3GVjzFK1IdSG2t4dE+yg8UTSsy8fd1wrlDKD3Yd5gguKSJjASB7jqdVD
         Vfa2Z8AeNV3rpScNFzJTtc3w4XdOLxAFCc9+nYDbTzo4b4VIwXtTGMzfIcseKvByqG2X
         PtGA==
X-Gm-Message-State: AGi0PuZ7Mfo3kGwqR/rznNUHCMoKh6DPPTsJT/GTkZQDsEWU4bnYJ5+6
        uKJyiWte5fb0lHldhxX9iaccaQ==
X-Google-Smtp-Source: APiQypLFa9Zwdjn4tdg2Thq8figw9/2KqysFQllBw2vu3dYOR6i9Wi65V7imT93s00HkpgLRMaPogA==
X-Received: by 2002:a17:90a:71c5:: with SMTP id m5mr1275159pjs.193.1586884807655;
        Tue, 14 Apr 2020 10:20:07 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id l9sm11402386pff.16.2020.04.14.10.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 10:20:07 -0700 (PDT)
Date:   Tue, 14 Apr 2020 11:20:05 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     nikita.shubin@maquefel.me
Cc:     Nikita Shubin <NShubin@topcon.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: mailbox support
Message-ID: <20200414172004.GB24061@xps15>
References: <20200304142628.8471-1-NShubin@topcon.com>
 <20200406113310.3041-1-nikita.shubin@maquefel.me>
 <20200406113310.3041-3-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406113310.3041-3-nikita.shubin@maquefel.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Apr 06, 2020 at 02:33:09PM +0300, nikita.shubin@maquefel.me wrote:
> Add support for mailboxes to imx_rproc
> 
> Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> ---
>  drivers/remoteproc/Kconfig     |   2 +
>  drivers/remoteproc/imx_rproc.c | 142 ++++++++++++++++++++++++++++++++-
>  2 files changed, 143 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 94afdde4bc9f..02d23a54c9cf 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -17,6 +17,8 @@ if REMOTEPROC
>  config IMX_REMOTEPROC
>  	tristate "IMX6/7 remoteproc support"
>  	depends on ARCH_MXC
> +	select MAILBOX
> +	select IMX_MBOX
>  	help
>  	  Say y here to support iMX's remote processors (Cortex M4
>  	  on iMX7D) via the remote processor framework.
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bebc58d0f711..d2bede4ccb70 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -14,6 +14,9 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/mailbox_client.h>
> +
> +#include "remoteproc_internal.h"
>  
>  #define IMX7D_SRC_SCR			0x0C
>  #define IMX7D_ENABLE_M4			BIT(3)
> @@ -47,6 +50,12 @@
>  
>  #define IMX_BOOT_PC			0x4
>  
> +#define IMX_MBOX_NB_VQ			2
> +#define IMX_MBOX_NB_MBX		2

Please align this.

> +
> +#define IMX_MBX_VQ0		"vq0"
> +#define IMX_MBX_VQ1		"vq1"
> +
>  /**
>   * struct imx_rproc_mem - slim internal memory structure
>   * @cpu_addr: MPU virtual address of the memory region
> @@ -80,6 +89,14 @@ struct imx_rproc_dcfg {
>  	size_t				att_size;
>  };
>  
> +struct imx_mbox {
> +	const unsigned char name[10];
> +	struct mbox_chan *chan;
> +	struct mbox_client client;
> +	struct work_struct vq_work;
> +	int vq_id;
> +};
> +
>  struct imx_rproc {
>  	struct device			*dev;
>  	struct regmap			*regmap;
> @@ -88,6 +105,8 @@ struct imx_rproc {
>  	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
>  	struct clk			*clk;
>  	void __iomem			*bootreg;
> +	struct imx_mbox mb[IMX_MBOX_NB_MBX];
> +	struct workqueue_struct *workqueue;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
> @@ -251,10 +270,118 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>  	return va;
>  }
>  
> +static void imx_rproc_mb_vq_work(struct work_struct *work)
> +{
> +	struct imx_mbox *mb = container_of(work, struct imx_mbox, vq_work);
> +	struct rproc *rproc = dev_get_drvdata(mb->client.dev);
> +
> +	if (rproc_vq_interrupt(rproc, mb->vq_id) == IRQ_NONE)
> +		dev_dbg(&rproc->dev, "no message found in vq%d\n", mb->vq_id);
> +}
> +
> +static void imx_rproc_mb_callback(struct mbox_client *cl, void *data)
> +{
> +	struct rproc *rproc = dev_get_drvdata(cl->dev);
> +	struct imx_mbox *mb = container_of(cl, struct imx_mbox, client);
> +	struct imx_rproc *ddata = rproc->priv;
> +
> +	queue_work(ddata->workqueue, &mb->vq_work);
> +}
> +
> +static const struct imx_mbox imx_rproc_mbox[IMX_MBOX_NB_MBX] = {
> +	{
> +		.name = IMX_MBX_VQ0,
> +		.vq_id = 0,
> +		.client = {
> +			.rx_callback = imx_rproc_mb_callback,
> +			.tx_block = false,
> +		},
> +	},
> +	{
> +		.name = IMX_MBX_VQ1,
> +		.vq_id = 1,
> +		.client = {
> +			.rx_callback = imx_rproc_mb_callback,
> +			.tx_block = false,
> +		},
> +	},
> +};
> +
> +static void imx_rproc_request_mbox(struct rproc *rproc)
> +{
> +	struct imx_rproc *ddata = rproc->priv;
> +	struct device *dev = &rproc->dev;
> +	unsigned int i;
> +	const unsigned char *name;
> +	struct mbox_client *cl;
> +
> +	/* Initialise mailbox structure table */
> +	memcpy(ddata->mb, imx_rproc_mbox, sizeof(imx_rproc_mbox));
> +
> +	for (i = 0; i < IMX_MBOX_NB_MBX; i++) {
> +		name = ddata->mb[i].name;
> +
> +		cl = &ddata->mb[i].client;
> +		cl->dev = dev->parent;
> +
> +		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);
> +
> +		dev_dbg(dev, "%s: name=%s, idx=%u\n",
> +			__func__, name, ddata->mb[i].vq_id);
> +
> +		if (IS_ERR(ddata->mb[i].chan)) {
> +			dev_warn(dev, "cannot get %s mbox\n", name);
> +			ddata->mb[i].chan = NULL;

If the mailbox isn't ready this driver will fail without a chance of recovery.
Since most of the code in this patch is a carbon copy of the implementation
found in stm32_proc.c, I suggest you do the same as they did in
stm32_rproc_request_mbox() and privision for cases where requesting a channel
returns -EPROBE_DEFER.

> +		}
> +
> +		if (ddata->mb[i].vq_id >= 0)
> +			INIT_WORK(&ddata->mb[i].vq_work, imx_rproc_mb_vq_work);
> +	}
> +}
> +
> +static void imx_rproc_free_mbox(struct rproc *rproc)
> +{
> +	struct imx_rproc *ddata = rproc->priv;
> +	unsigned int i;
> +
> +	dev_dbg(&rproc->dev, "%s: %d boxes\n",
> +		__func__, ARRAY_SIZE(ddata->mb));
> +
> +	for (i = 0; i < ARRAY_SIZE(ddata->mb); i++) {
> +		if (ddata->mb[i].chan)
> +			mbox_free_channel(ddata->mb[i].chan);
> +		ddata->mb[i].chan = NULL;
> +	}
> +}
> +
> +static void imx_rproc_kick(struct rproc *rproc, int vqid)
> +{
> +	struct imx_rproc *ddata = rproc->priv;
> +	unsigned int i;
> +	int err;
> +
> +	if (WARN_ON(vqid >= IMX_MBOX_NB_VQ))
> +		return;
> +
> +	for (i = 0; i < IMX_MBOX_NB_MBX; i++) {
> +		if (vqid != ddata->mb[i].vq_id)
> +			continue;
> +		if (!ddata->mb[i].chan)
> +			return;
> +		dev_dbg(&rproc->dev, "sending message : vqid = %d\n", vqid);
> +		err = mbox_send_message(ddata->mb[i].chan, &vqid);
> +		if (err < 0)
> +			dev_err(&rproc->dev, "%s: failed (%s, err:%d)\n",
> +					__func__, ddata->mb[i].name, err);
> +			return;
> +	}
> +}
> +
>  static const struct rproc_ops imx_rproc_ops = {
>  	.start		= imx_rproc_start,
>  	.stop		= imx_rproc_stop,
>  	.da_to_va	= imx_rproc_da_to_va,
> +	.kick		= imx_rproc_kick,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  };
>  
> @@ -384,14 +511,26 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		goto err_put_rproc;
>  	}
>  
> +	priv->workqueue = create_workqueue(dev_name(dev));
> +	if (!priv->workqueue) {
> +		dev_err(dev, "cannot create workqueue\n");
> +		ret = -ENOMEM;
> +		goto err_put_clk;
> +	}
> +
> +	imx_rproc_request_mbox(rproc);
> +
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
> -		goto err_put_clk;
> +		goto err_free_mb;
>  	}
>  
>  	return 0;
>  
> +err_free_mb:
> +	imx_rproc_free_mbox(rproc);
> +	destroy_workqueue(priv->workqueue);
>  err_put_clk:
>  	clk_disable_unprepare(priv->clk);
>  err_put_rproc:
> @@ -407,6 +546,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
>  
>  	clk_disable_unprepare(priv->clk);
>  	rproc_del(rproc);
> +	imx_rproc_free_mbox(rproc);

I have no issues with people reusing code already found in the kernel - in fact
I encourage it because it makes reviewing patches much easier.  On the flip side
you have to give credit where it is due.  Here adding a line in the changelog
that mentions where you took your inspiration from will be much appreciated.

Thanks,
Mathieu

>  	rproc_free(rproc);
>  
>  	return 0;
> -- 
> 2.25.1
> 
