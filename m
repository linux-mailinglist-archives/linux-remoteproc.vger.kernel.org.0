Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1B81C08A4
	for <lists+linux-remoteproc@lfdr.de>; Thu, 30 Apr 2020 22:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgD3U6Y (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 30 Apr 2020 16:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726045AbgD3U6X (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Apr 2020 16:58:23 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C24DC035494
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2020 13:58:22 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id hi11so1385426pjb.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2020 13:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MX/gFKorFD3fJiz0waGi+R3fRw1GVFpupUsSX0SPyJY=;
        b=CsTBErZFaAQkEbs5S+GlwA8kRzgyJRrcYYtemLqJ9WlfIPAhaq6G4rW9gc3uI8mECY
         OMjpu0MqbtnrkkGBFU8c/hoxlzYOAoSNV2BdQCVF8lHP2UPvKSWGeIHDMTYDp8al261g
         lV8Vh0nWV30oVczqakw539UDRjIKSR24bd1HFHrw8Gf7opTt4Vk+SSqj/xO2nokwhZw2
         1OOJwQdoa+tqNpeiHYjzibN2xdFDXDes6gRUNiPGVnncDZywStP0554NDEfMabSOjeis
         8vfPXauZSf0IR0nm3IJrCMbGs3o/HsvmL3H0ypxjyka1O616cT1vv/24yQwBFsHDsy91
         9a3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MX/gFKorFD3fJiz0waGi+R3fRw1GVFpupUsSX0SPyJY=;
        b=YrZfBqWDRYWgQQRLrr7xfBCbxd0sgBWjRVfxVlqIYK3FsjK3TTGZhJNkJl8aPkrrDy
         nBBiqrci1ytY6HAM8SknjxLnY1kN4k6HsNK98WExjiAZUs+UmMOzIyEm+pyg7Fc0SSeJ
         Z4+lxC+RqFeWdAV6EdYRDpEK0m1ODY4l6hEdh3s5NGT18rz/NvcCw3sY+4Ovv4Gx46B6
         S7EabgyJwADi5FsM1XiOFz0cBNQXV8y9DLSM84dDrYohVAjKyoTaa5lHEOZ+1FWlA0xJ
         LBxqH2bZFtuaD1L3xvb5vn89Ch141eH6TliENRMxy+kVrya+CH9V0bNBrizp2kkTUuWs
         AvJg==
X-Gm-Message-State: AGi0PuZaCnJAnHawUgxP02ASDWyfWJ6CEQaPnGqisCTOr3ZB75vN1o3U
        p83zeNIK21pl3hrdYumFu6rJiQ==
X-Google-Smtp-Source: APiQypKe3OdI9QEW41vMal8UJb8GDAGm5V7tlJQS0ryzb463ValPrIAGP3jeUyn/S22VakZZUZ9faw==
X-Received: by 2002:a17:90b:297:: with SMTP id az23mr762282pjb.85.1588280301989;
        Thu, 30 Apr 2020 13:58:21 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id v7sm559509pfm.146.2020.04.30.13.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 13:58:21 -0700 (PDT)
Date:   Thu, 30 Apr 2020 14:58:19 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        loic.pallardy@st.com, linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/12] remoteproc: stm32: Decouple rproc from DT
 parsing
Message-ID: <20200430205819.GD18004@xps15>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-4-mathieu.poirier@linaro.org>
 <b68419a6-65a9-08d0-bed8-5f8195ae3d55@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b68419a6-65a9-08d0-bed8-5f8195ae3d55@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Apr 29, 2020 at 03:37:58PM +0200, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 4/24/20 10:24 PM, Mathieu Poirier wrote:
> > Remove the remote processor from the process of parsing the device tree
> > since (1) there is no correlation between them and (2) to use the
> > information that was gathered to make a decision on whether to
> > synchronise with the M4 or not.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/stm32_rproc.c | 25 ++++++++++++++-----------
> >  1 file changed, 14 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> > index 1ac90adba9b1..57a426ea620b 100644
> > --- a/drivers/remoteproc/stm32_rproc.c
> > +++ b/drivers/remoteproc/stm32_rproc.c
> > @@ -538,12 +538,11 @@ static int stm32_rproc_get_syscon(struct device_node *np, const char *prop,
> >  	return err;
> >  }
> >  
> > -static int stm32_rproc_parse_dt(struct platform_device *pdev)
> > +static int stm32_rproc_parse_dt(struct platform_device *pdev,
> > +				struct stm32_rproc *ddata, bool *auto_boot)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct device_node *np = dev->of_node;
> > -	struct rproc *rproc = platform_get_drvdata(pdev);
> > -	struct stm32_rproc *ddata = rproc->priv;
> >  	struct stm32_syscon tz;
> >  	unsigned int tzen;
> >  	int err, irq;
> > @@ -589,7 +588,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
> >  
> >  	err = regmap_read(tz.map, tz.reg, &tzen);
> >  	if (err) {
> > -		dev_err(&rproc->dev, "failed to read tzen\n");
> > +		dev_err(dev, "failed to read tzen\n");
> >  		return err;
> >  	}
> >  	ddata->secured_soc = tzen & tz.mask;
> > @@ -605,7 +604,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
> >  	if (err)
> >  		dev_info(dev, "failed to get pdds\n");
> >  
> > -	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
> > +	*auto_boot = of_property_read_bool(np, "st,auto-boot");
> >  
> >  	return stm32_rproc_of_memory_translations(pdev, ddata);
> >  }
> > @@ -616,6 +615,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >  	struct stm32_rproc *ddata;
> >  	struct device_node *np = dev->of_node;
> >  	struct rproc *rproc;
> > +	bool auto_boot = false;
> 
> Nitpicking: Seems that you don't need to initialize it. 

I think you are correct.

> Perhaps you can simply suppress the local variable and directly use rproc->auto_boot.

... and change the value of rproc->auto_boot if state == M4_STATE_CRUN?  Sure,
that's possible.

Thanks for all the comments, it really helps to have a different perspective.  I
am out of time for today but will continue with the rest of your comments
tomorrow.

Mathieu

> 
> else LGTM
> 
> 
> Thanks,
> Arnaud
> 
> >  	int ret;
> >  
> >  	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> > @@ -626,9 +626,16 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >  	if (!rproc)
> >  		return -ENOMEM;
> >  
> > +	ddata = rproc->priv;
> > +
> >  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> > +
> > +	ret = stm32_rproc_parse_dt(pdev, ddata, &auto_boot);
> > +	if (ret)
> > +		goto free_rproc;
> > +
> > +	rproc->auto_boot = auto_boot;
> >  	rproc->has_iommu = false;
> > -	ddata = rproc->priv;
> >  	ddata->workqueue = create_workqueue(dev_name(dev));
> >  	if (!ddata->workqueue) {
> >  		dev_err(dev, "cannot create workqueue\n");
> > @@ -638,13 +645,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, rproc);
> >  
> > -	ret = stm32_rproc_parse_dt(pdev);
> > -	if (ret)
> > -		goto free_wkq;
> > -
> >  	ret = stm32_rproc_request_mbox(rproc);
> >  	if (ret)
> > -		goto free_rproc;
> > +		goto free_wkq;
> >  
> >  	ret = rproc_add(rproc);
> >  	if (ret)
> > 
