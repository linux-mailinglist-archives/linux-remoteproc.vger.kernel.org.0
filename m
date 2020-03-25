Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0EA193200
	for <lists+linux-remoteproc@lfdr.de>; Wed, 25 Mar 2020 21:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbgCYUiS (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 25 Mar 2020 16:38:18 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36080 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727280AbgCYUiS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 25 Mar 2020 16:38:18 -0400
Received: by mail-pf1-f196.google.com with SMTP id i13so1636061pfe.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2020 13:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cW9MnwtDcHpoDKnTJ702/Kg6m9pE6WYf6URglD3o1w0=;
        b=fJbiZ8YqtSieHRjqMA+q3O2zd/6PfH1NKkhaaIK4ZENvoWouwsDui4ifBA5E7Eco60
         W0y6kOzZH10DROxPEy8o0RzMqTyGmmUIhRA2I37UfsOxcatnIptUp9QcOoFO18SY9Jnd
         OmuTEc84nKLsiseiiNfErRzALqq6siR7WSsJF/b/CFKHcJLNMYtcx3PUh1SZ+6Lv2spu
         oNkzMSbuDtpKMOYsnSinI0xYVdWWK29CsIBSNIxuJBgAtTuDoeIPf+28x6e9FYL11XlD
         A+BByxmLF2bObHlzspmPqza4LalNeYQ8tz480O+gi6nhM69UYT4ADgzcWGm14aFlCphD
         by0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cW9MnwtDcHpoDKnTJ702/Kg6m9pE6WYf6URglD3o1w0=;
        b=Imh3bxxKkIrQVooFkXRjVTyDzPTHVxZ0OK1ozZ7n4UwjzGU1QlYx7fpO2urRhHQmuD
         u4F/jijxAXNMDH69lpV3JfZJrG3GRj4/RYhxcFHkhwNViz6E4Gu8hklNxlhaYUeWep/T
         hz4AgbmkERd9UdqwuGtx7Cr5AB3GA9/hNR2ya5y4+d8YXv5tZoOtLbK8rPoaS7AD3o+C
         uEGQVsCSFH6/tQxG45A7E+5ZbiDGpuKBo28Q66GYpN8OPKH3PLECEu92EZXnIa+LXzSt
         SQ9Ay6v5x8Ee2WS2nnbu1HH24TQ1rgkLqsrdYYpScfRwIEHtBzGAjJeGUaB0d9AlhgTy
         CQ+A==
X-Gm-Message-State: ANhLgQ3gKG4Tp25rg7tsfLUZ9RggJqSyHOB4noU3Uiaqxb0zXKC5j2qK
        jmd1BOSx0T+sxi4UN+oiGc8zug==
X-Google-Smtp-Source: ADFU+vsnj7V93VGXtvyofYEqpVoLW6KrobGFdsl3HF6jBLQpSWuTK3OGahz8k9lafMvkCshznJ/vnw==
X-Received: by 2002:a63:a06e:: with SMTP id u46mr4852531pgn.140.1585168695285;
        Wed, 25 Mar 2020 13:38:15 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id nl7sm121214pjb.36.2020.03.25.13.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 13:38:14 -0700 (PDT)
Date:   Wed, 25 Mar 2020 14:38:12 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Pallardy <loic.pallardy@st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Tero Kristo <t-kristo@ti.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] remoteproc: fall back to using parent memory pool
 if no dedicated available
Message-ID: <20200325203812.GA9384@xps15>
References: <20200319162321.20632-1-s-anna@ti.com>
 <20200319162321.20632-2-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200319162321.20632-2-s-anna@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Mar 19, 2020 at 11:23:20AM -0500, Suman Anna wrote:
> From: Tero Kristo <t-kristo@ti.com>
> 
> In some cases, like with OMAP remoteproc, we are not creating dedicated
> memory pool for the virtio device. Instead, we use the same memory pool
> for all shared memories. The current virtio memory pool handling forces
> a split between these two, as a separate device is created for it,
> causing memory to be allocated from bad location if the dedicated pool
> is not available. Fix this by falling back to using the parent device
> memory pool if dedicated is not available.
> 
> Fixes: 086d08725d34 ("remoteproc: create vdev subdevice with specific dma memory pool")
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v2:
>  - Address Arnaud's concerns about hard-coded memory-region index 0
>  - Update the comment around the new code addition
> v1: https://patchwork.kernel.org/patch/11422721/
> 
>  drivers/remoteproc/remoteproc_virtio.c | 15 +++++++++++++++
>  include/linux/remoteproc.h             |  2 ++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index eb817132bc5f..b687715cdf4b 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -369,6 +369,21 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  				goto out;
>  			}
>  		}
> +	} else {
> +		struct device_node *np = rproc->dev.parent->of_node;
> +
> +		/*
> +		 * If we don't have dedicated buffer, just attempt to re-assign
> +		 * the reserved memory from our parent. A default memory-region
> +		 * at index 0 from the parent's memory-regions is assigned for
> +		 * the rvdev dev to allocate from, and this can be customized
> +		 * by updating the vdevbuf_mem_id in platform drivers if
> +		 * desired. Failure is non-critical and the allocations will
> +		 * fall back to global pools, so don't check return value
> +		 * either.

I'm perplex...  In the changelog it is indicated that if a memory pool is
not dedicated allocation happens from a bad location but here failure of
getting a hold of a dedicated memory pool is not critical. 

> +		 */
> +		of_reserved_mem_device_init_by_idx(dev, np,
> +						   rproc->vdevbuf_mem_id);

I wonder if using an index setup by platform code is really the best way
forward when we already have the carveout mechanic available to us.  I see the
platform code adding a carveout that would have the same name as rproc->name.
From there in rproc_add_virtio_dev() we could have something like:

        mem = rproc_find_carveout_by_name(rproc, "%s", rproc->name);


That would be very flexible, the location of the reserved memory withing the
memory-region could change without fear of breaking things and no need to add to
struct rproc.

Let me know what you think.

Thanks,
Mathieu

>  	}
>  
>  	/* Allocate virtio device */
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index ed127b2d35ca..07bd73a6d72a 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -481,6 +481,7 @@ struct rproc_dump_segment {
>   * @auto_boot: flag to indicate if remote processor should be auto-started
>   * @dump_segments: list of segments in the firmware
>   * @nb_vdev: number of vdev currently handled by rproc
> + * @vdevbuf_mem_id: default memory-region index for allocating vdev buffers
>   */
>  struct rproc {
>  	struct list_head node;
> @@ -514,6 +515,7 @@ struct rproc {
>  	bool auto_boot;
>  	struct list_head dump_segments;
>  	int nb_vdev;
> +	u8 vdevbuf_mem_id;
>  	u8 elf_class;
>  };
>  
> -- 
> 2.23.0
> 
