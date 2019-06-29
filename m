Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEBE75ACF6
	for <lists+linux-remoteproc@lfdr.de>; Sat, 29 Jun 2019 20:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbfF2S7a (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 29 Jun 2019 14:59:30 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42863 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbfF2S7a (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 29 Jun 2019 14:59:30 -0400
Received: by mail-pl1-f193.google.com with SMTP id ay6so5036895plb.9
        for <linux-remoteproc@vger.kernel.org>; Sat, 29 Jun 2019 11:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N/Xd32OfhbPajKGcwJj/tLqvH2DX0zFaJ13Hyp3ZgWA=;
        b=KjCNv0lVu0yqOkcO+PhEBeaF3KxVUaMkGlunlz2vlj+S4Ekpo+WYtzpEjUGDyYuHH7
         BoUoAJFMK6ZI1eE2YTtEXT2lNOeP2+rMh0VzXXDcHwh2fDREiXoHtu0crCDFuveEqxsW
         oslfW2lM+fNb8jC7tDs8qpP8noP0kXkrwdfFSuBsP3aRKiQGF3HjSHmtT1Oli3I5ubqC
         KKl/2rPia9o5JpqqzlqOWVDp1Bjq02mA1zOwQNKSaVk6gSfoYF9/j4Ll/3b5GjtY/Co9
         7BWeD/1SboJ6TdsaoTLrYBFh6r6ABNcLZVRZ6MuYYOyMffMc7ASoHtTxFuDjGT0TzoKl
         hYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=N/Xd32OfhbPajKGcwJj/tLqvH2DX0zFaJ13Hyp3ZgWA=;
        b=pzmGmNRaIGw6CmG9gTe/u+uEkVDN+9lH77tX2DEEwlRDmWa+hbkSIEtrz0TT71Vc4w
         EuBphq/03sIaQe9QvzgXpsBXsQCxRI/6GmDWm6ru1GsUzfsV0SOC9cW7XohRezDjgvMC
         bOAqWEbAZQqLYtLd0GRd6l11EYDYGq0ZALkl6rJscbpX6msSWkLeXkIdYJKG7S+V3x3O
         TdHPtqk//Mc/g+zbToYfuEx//d9fDYaCUP7TsXOl2ZEK65PGkTeBrp6Oh7KJAuNVNLOY
         BGvl9HBsTdwUnibbKjH54ok0xV/Xl1AYlbQ85OveVPVHPu2CANASeHVmkhNFfjC7lrB9
         FX1A==
X-Gm-Message-State: APjAAAXoCxNjJzXG9A7RRe+bUra752myQv8kd3eoKvTEps7nLHjQlcVo
        mVUE3dEjNp+sjLMF2qmLfBxy4VyGDms=
X-Google-Smtp-Source: APXvYqxEWsuB7wongVBfG1KVlcepPv5NAkgEjdvFEAfjGtdgM4nfbJb5euQPVJATzqnoXeQirCV8bg==
X-Received: by 2002:a17:902:124:: with SMTP id 33mr19610345plb.145.1561834769001;
        Sat, 29 Jun 2019 11:59:29 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p7sm8437473pfp.131.2019.06.29.11.59.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Jun 2019 11:59:28 -0700 (PDT)
Date:   Sat, 29 Jun 2019 11:59:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Clement Leger <cleger@kalray.eu>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: recopy parent dma_pfn_offset for vdev
Message-ID: <20190629185926.GD23094@builder>
References: <20190612095521.4703-1-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612095521.4703-1-cleger@kalray.eu>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 12 Jun 02:55 PDT 2019, Clement Leger wrote:

> When preparing the subdevice for the vdev, also copy dma_pfn_offset
> since this is used for sub device dma allocations. Without that, there
> is incoherency between the parent dma settings and the childs one,
> potentially leading to dma_alloc_coherent failure (due to phys_to_dma
> using dma_pfn_offset for translation).

Hi Clement,

This looks reasonable, but I can't merge it without your Signed-off-by.

Can you please resubmit the change, with the Fixes: and Loic's ack?

Regards,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 263e9c9614a8..3b56ca043231 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -520,6 +520,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
>  	/* Initialise vdev subdevice */
>  	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>  	rvdev->dev.parent = rproc->dev.parent;
> +	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
>  	rvdev->dev.release = rproc_rvdev_release;
>  	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
>  	dev_set_drvdata(&rvdev->dev, rvdev);
> -- 
> 2.15.0.276.g89ea799
> 
