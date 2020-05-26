Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8171B3160
	for <lists+linux-remoteproc@lfdr.de>; Tue, 21 Apr 2020 22:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbgDUUlI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 21 Apr 2020 16:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726361AbgDUUlF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Apr 2020 16:41:05 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639DFC0610D6
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Apr 2020 13:41:05 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x77so4540300pfc.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Apr 2020 13:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q/r+FSJ7pvz4zvnfdsnXitvZi5C6EJGHawqwSL0G7mY=;
        b=yfYHWudGRbW1pj+i6ES/s8HeW44zwhC0Rjh8CAn31XRDuNxl0QNvcIyt5RgSZ1dGgG
         GrqkoV37KN75bVtOgraCSLTbjLLRA8AFbeh43xxA0SgKQ2A4OlRKQBkx58Y9rU+9A1o0
         g4Vjwla50FlGdJQIgbBSfv/EOYuR5wGYfeXcEssRE0udZQLExPd4rPxFrqHXAsQmEkve
         WOv0HaioCbxVdq2n/2fDZeJAXRhQAW1m7u9NBvY4z5Q1a9OLuPmr+a1TUe6ojyFkqqiH
         EPQNcLXqYupiVDJEGhR3Io8o4nDEOO1g6ap4SDjArtiFEbTCCH0ef4F/BsvayPQHT1xg
         FMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q/r+FSJ7pvz4zvnfdsnXitvZi5C6EJGHawqwSL0G7mY=;
        b=HNrext5UYggmsV3tA4pV4CGNocMDiNFS7nZzJd4HNXcKq2bSl6QIZXmpv27B9fyQeb
         YorFlYrGFybdIqR4kCA6oEh9JeLSLkxN416QuLaQLSIUDFPHeKYRKiwfTRCvC4ruzmlc
         5VU+2fyMPyVoxuQ2ZTJxfXGSxzrFmAqqqoyqvtOYv1P7uMnJ+EkVLMAkjGLfHWv7sX+3
         WK4H8Rdb0pvafdNb3qQ9G8KrHGv90fbGKyY/K3UhIzgF5n9J/LLhkxCpDFqkF89eiDiE
         qwktO+JEK3uT3yen52iPGXaGAR1+DrtFYv5wKpbrnf5heHQrCtr0VkPpdW3OQ4LlRj4h
         S/9A==
X-Gm-Message-State: AGi0PubPAPIaAYjcMJxgivArBu6RYnhTcQxbI7+UG2OuN+lggFccv8tG
        w+HrQ8nCImXihuSPX6d38ZDECA==
X-Google-Smtp-Source: APiQypKNF/nsktA9gOxV63v27Niq4wseKeuf9UzbYzxbekzsSlrVHLQ5puVPlqNXBte2BezfxSJROA==
X-Received: by 2002:a62:cf81:: with SMTP id b123mr22790189pfg.84.1587501664736;
        Tue, 21 Apr 2020 13:41:04 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y8sm3360062pfg.216.2020.04.21.13.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 13:41:04 -0700 (PDT)
Date:   Tue, 21 Apr 2020 14:41:02 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>, t@xps15
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [RFC 02/18] remoteproc: Introduce virtio device add/remove
 functions in core.
Message-ID: <20200421204102.GA17676@xps15>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
 <20200416161331.7606-3-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416161331.7606-3-arnaud.pouliquen@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hey Arnaud,

I have started to review this set. Comments will come in over the next few days
and I will be sure to let you know when I'm done.

On Thu, Apr 16, 2020 at 06:13:15PM +0200, Arnaud Pouliquen wrote:
> In preparation of the migration of the management of rvdev in
> rproc_virtio, this patch spins off new functions to manage the
> virtio device.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 149 +++++++++++++++------------
>  1 file changed, 83 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 2a0425ab82a7..5c90d569c0f7 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -441,6 +441,86 @@ static void rproc_rvdev_release(struct device *dev)
>  	kfree(rvdev);
>  }
>  
> +static int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
> +{
> +	struct rproc *rproc = rvdev->rproc;
> +	struct fw_rsc_vdev *rsc = rvdev->rsc;
> +	char name[16];
> +	int ret, i;
> +
> +	/* Initialise vdev subdevice */
> +	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> +	rvdev->dev.parent = &rproc->dev;
> +	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
> +	rvdev->dev.release = rproc_rvdev_release;
> +	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
> +	dev_set_drvdata(&rvdev->dev, rvdev);
> +
> +	ret = device_register(&rvdev->dev);
> +	if (ret) {
> +		put_device(&rvdev->dev);
> +		return ret;
> +	}
> +	/* Make device dma capable by inheriting from parent's capabilities */
> +	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
> +
> +	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
> +					   dma_get_mask(rproc->dev.parent));
> +	if (ret) {
> +		dev_warn(&rvdev->dev,
> +			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
> +			 dma_get_mask(rproc->dev.parent), ret);
> +	}
> +
> +	/* parse the vrings */
> +	for (i = 0; i < rsc->num_of_vrings; i++) {
> +		ret = rproc_parse_vring(rvdev, rsc, i);
> +		if (ret)
> +			goto free_rvdev;
> +	}
> +
> +	/* allocate the vring resources */
> +	for (i = 0; i < rsc->num_of_vrings; i++) {
> +		ret = rproc_alloc_vring(rvdev, i);
> +		if (ret)
> +			goto free_vg;

I don't get the "free_vg" part... At the moment this patch is only about
refactoring and as such I would encourage you to keep things the same as
much as possible.  It is certainly ok to make modifications but they should be
done in an incremental patch.  Otherwise reviewers needlessly have to scrutinize
the changes thinking there is something more to figure out.

> +	}
> +
> +	rvdev->subdev.start = rproc_vdev_do_start;
> +	rvdev->subdev.stop = rproc_vdev_do_stop;
> +
> +	rproc_add_subdev(rproc, &rvdev->subdev);
> +
> +	return 0;
> +
> +free_vg:
> +	for (i--; i >= 0; i--) {
> +		struct rproc_vring *rvring = &rvdev->vring[i];
> +
> +		rproc_free_vring(rvring);
> +	}
> +
> +free_rvdev:
> +	device_unregister(&rvdev->dev);
> +
> +	return ret;
> +}
> +
> +static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
> +{
> +	struct rproc *rproc = rvdev->rproc;
> +	struct rproc_vring *rvring;
> +	int id;
> +
> +	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> +		rvring = &rvdev->vring[id];
> +		rproc_free_vring(rvring);
> +	}
> +
> +	rproc_remove_subdev(rproc, &rvdev->subdev);
> +	device_unregister(&rvdev->dev);
> +}
> +
>  /**
>   * rproc_handle_vdev() - handle a vdev fw resource
>   * @rproc: the remote processor
> @@ -473,8 +553,6 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
>  {
>  	struct device *dev = &rproc->dev;
>  	struct rproc_vdev *rvdev;
> -	int i, ret;
> -	char name[16];
>  
>  	/* make sure resource isn't truncated */
>  	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
> @@ -505,83 +583,22 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
>  	kref_init(&rvdev->refcount);
>  
>  	rvdev->rsc = rsc;
> +	rvdev->rsc_offset = offset;
>  	rvdev->id = rsc->id;
>  	rvdev->rproc = rproc;
>  	rvdev->index = rproc->nb_vdev++;
>  
> -	/* Initialise vdev subdevice */
> -	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> -	rvdev->dev.parent = rproc->dev.parent;
> -	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
> -	rvdev->dev.release = rproc_rvdev_release;
> -	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
> -	dev_set_drvdata(&rvdev->dev, rvdev);
> -
> -	ret = device_register(&rvdev->dev);
> -	if (ret) {
> -		put_device(&rvdev->dev);
> -		return ret;
> -	}
> -	/* Make device dma capable by inheriting from parent's capabilities */
> -	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
> -
> -	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
> -					   dma_get_mask(rproc->dev.parent));
> -	if (ret) {
> -		dev_warn(dev,
> -			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
> -			 dma_get_mask(rproc->dev.parent), ret);
> -	}
> -
> -	/* parse the vrings */
> -	for (i = 0; i < rsc->num_of_vrings; i++) {
> -		ret = rproc_parse_vring(rvdev, rsc, i);
> -		if (ret)
> -			goto free_rvdev;
> -	}
> -
> -	/* remember the resource offset*/
> -	rvdev->rsc_offset = offset;
> -
> -	/* allocate the vring resources */
> -	for (i = 0; i < rsc->num_of_vrings; i++) {
> -		ret = rproc_alloc_vring(rvdev, i);
> -		if (ret)
> -			goto unwind_vring_allocations;
> -	}
> -
>  	list_add_tail(&rvdev->node, &rproc->rvdevs);
>  
> -	rvdev->subdev.start = rproc_vdev_do_start;
> -	rvdev->subdev.stop = rproc_vdev_do_stop;
> -
> -	rproc_add_subdev(rproc, &rvdev->subdev);
> -
> -	return 0;
> -
> -unwind_vring_allocations:
> -	for (i--; i >= 0; i--)
> -		rproc_free_vring(&rvdev->vring[i]);
> -free_rvdev:
> -	device_unregister(&rvdev->dev);
> -	return ret;
> +	return rproc_rvdev_add_device(rvdev);
>  }
>  
>  void rproc_vdev_release(struct kref *ref)
>  {
>  	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
> -	struct rproc_vring *rvring;
> -	struct rproc *rproc = rvdev->rproc;
> -	int id;
> -
> -	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> -		rvring = &rvdev->vring[id];
> -		rproc_free_vring(rvring);
> -	}
>  
> -	rproc_remove_subdev(rproc, &rvdev->subdev);
> +	rproc_rvdev_remove_device(rvdev);

At this time I don't see how introducing rproc_rvdev_remore_device() is
advantageous.  Maybe I'll find an answer as I review upcoming patches...

Thanks,
Mathieu 

>  	list_del(&rvdev->node);
> -	device_unregister(&rvdev->dev);
>  }
>  
>  /**
> -- 
> 2.17.1
> 
