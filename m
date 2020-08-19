Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA1F224A715
	for <lists+linux-remoteproc@lfdr.de>; Wed, 19 Aug 2020 21:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgHSTpK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 19 Aug 2020 15:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgHSTpH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 19 Aug 2020 15:45:07 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB89C061383
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2020 12:45:07 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y206so12181943pfb.10
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2020 12:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sF9UY16dXmm5cOO3jSka0z0v5TSuaKu0zT9caFSv5L4=;
        b=My0adgqfzPQIKRYv/F8WnEALcwwBJO517cDOIum5P/tFkJOrho4xIdJRi1k4zJ/iGQ
         0p/NIeSfLlcShfD5CGgNISVf0dYc54DeIXBi2b30RWGcovKY3m5uVjO2zPe8wTf2sz/k
         Xt0o2e5e4BNeooKNq7vL6VHTxR6TyXFpKe0KMZ8JKIm3wEe6aAtfKkUhI0MSVepeY/0p
         lKX7xXPxzRJW2pX2fTj/mdkl6bUXDavqLxJR8tS+oYHM2be6+cE6OS+gI2UMTZD8tNEL
         POCLpdcuDZ0tCU7KgcRD2V4W2exQo57YWgIo/f+W32dGujkTCLAbRjWl7R5fVwLmr5Yf
         f8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sF9UY16dXmm5cOO3jSka0z0v5TSuaKu0zT9caFSv5L4=;
        b=B4Yqk/FA1TG6YXO7L/s8wWy6pTEgoZUPVm9IrYdDk2+X+KbHj0lHj9axEZPd25Wxjc
         Msdqn78o+6uUhyPZ0Ubx+zKTSJwA3T4qzRwRIWPhRXiEulbLUTJVUl8X9sqXaU/ZwCtX
         jWoJfO/Jc5zqXa8Mohu4bkC/Kj57nVc7x7EOp9W1+oN8gWzOcU6PR660aQBQ/ldh/JC3
         nkKLYSLDYvKDFgKmwPdIMBSRCnPUfwaGtDHu3ZUgaOvh9+BNoR9AZonl72ggKu8WgOyP
         dPk0arL57EG0Hw5LJ43xgw9gwmHqfYNm9Y+Kqt3i8OZXM6dkBFqwVN5AW/POqpxpXDB3
         Xazg==
X-Gm-Message-State: AOAM531VPdB9aLLExqSIwzIux7jAdwC5Z9bGVBB1mENddK3y0eNI5HFE
        Iw8ZtuudSHO+GGfz3LyRIZ4hwQ==
X-Google-Smtp-Source: ABdhPJxF0ffkstbdtPGkrxJ6MGDk67Qcr5yO9dllut/Ch0wpl9p24HmbGjB45ynS/uBatcVWygxZaQ==
X-Received: by 2002:a63:161a:: with SMTP id w26mr11429964pgl.211.1597866306882;
        Wed, 19 Aug 2020 12:45:06 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id l24sm16620pff.20.2020.08.19.12.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 12:45:06 -0700 (PDT)
Date:   Wed, 19 Aug 2020 13:45:04 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 04/10] remoteproc: imx_rproc: make syscon optional
Message-ID: <20200819194504.GB3845366@xps15>
References: <20200724080813.24884-1-peng.fan@nxp.com>
 <20200724080813.24884-5-peng.fan@nxp.com>
 <20200818214350.GA3822080@xps15>
 <DB6PR0402MB276017AA0C124172D9BC3483885D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR0402MB276017AA0C124172D9BC3483885D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Aug 19, 2020 at 12:51:27AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH 04/10] remoteproc: imx_rproc: make syscon optional
> > 
> > Hi Peng,
> > 
> > On Fri, Jul 24, 2020 at 04:08:07PM +0800, Peng Fan wrote:
> > > Make syscon optional, since i.MX8QM/QXP/7ULP not have SRC to control
> > M4.
> > > But currently i.MX8QM/QXP/7ULP not added, so still check regmap when
> > > start/stop to avoid unhappy things.
> > 
> > On the i.MX8QM/QXP/7ULP processors, the remote processors are not
> > handled by the remoteproc cores, as implemented in this patch.  In such a
> > scenario how does the remoteproc core know the remote processor has
> > crashed and how does it recover from such a condition?
> 
> For 7ULP dual boot case, A7 is under control of M4, so if m4 crash, I suppose
> A7 would not work properly.

In that case I assume the whole system gets rebooted, which puts the A7 in a
state where it can "attach" with the M4 again.

> 
> For 8QM/QXP partition case, M4 is in a standalone partition, if M4 crash or
> reboot, the system controller unit will restart M4 and notify Acore that M4
> restart.

And how does that notification work exactly?  Does rproc_report_crash() get
called somewhere in that process in order for the remoteproc core to attach to
the M4 again?

Many thanks for the help,
Mathieu

> 
> Thanks,
> Peng.
> 
> > 
> > Thanks,
> > Mathieu
> > 
> > >
> > > Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 11 +++++++++--
> > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > b/drivers/remoteproc/imx_rproc.c index 82594a800a1b..4fad5c0b1c05
> > > 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -162,6 +162,9 @@ static int imx_rproc_start(struct rproc *rproc)
> > >  	struct device *dev = priv->dev;
> > >  	int ret;
> > >
> > > +	if (!priv->regmap)
> > > +		return -EOPNOTSUPP;
> > > +
> > >  	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
> > >  				 dcfg->src_mask, dcfg->src_start);
> > >  	if (ret)
> > > @@ -177,6 +180,9 @@ static int imx_rproc_stop(struct rproc *rproc)
> > >  	struct device *dev = priv->dev;
> > >  	int ret;
> > >
> > > +	if (!priv->regmap)
> > > +		return -EOPNOTSUPP;
> > > +
> > >  	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
> > >  				 dcfg->src_mask, dcfg->src_stop);
> > >  	if (ret)
> > > @@ -325,9 +331,10 @@ static int imx_rproc_probe(struct platform_device
> > *pdev)
> > >  	regmap = syscon_regmap_lookup_by_phandle(np, "syscon");
> > >  	if (IS_ERR(regmap)) {
> > >  		dev_err(dev, "failed to find syscon\n");
> > > -		return PTR_ERR(regmap);
> > > +		regmap = NULL;
> > > +	} else {
> > > +		regmap_attach_dev(dev, regmap, &config);
> > >  	}
> > > -	regmap_attach_dev(dev, regmap, &config);
> > >
> > >  	/* set some other name then imx */
> > >  	rproc = rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
> > > --
> > > 2.16.4
> > >
