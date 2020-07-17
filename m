Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC88E2232BE
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Jul 2020 07:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgGQFFo (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 17 Jul 2020 01:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgGQFFn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Jul 2020 01:05:43 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E25C08C5C0
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Jul 2020 22:05:43 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id t11so4809736pfq.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Jul 2020 22:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VTEZVIOiCGS/T8c+vGYTrPkNGXRl/4INiU1G5wt4TkQ=;
        b=phPo4Gy6/kkpPzzHO5YdflGM7eTIiRauOl0//z8atxzbsehYOrSnMEtayeq1pdHi/M
         L30hZIKBPj6WPV/9UZgBTty1Hl50i0M0VbZYWN/czrOa8mbNYSK9IfOhwtwRHBDkiAku
         3nAxFxKKMi2jtKFh9bXYIMKPH0FFefQDSs934vJ0UWM2HKVp/x4sd451jLwgIB5sANa7
         V0FNj/GXN+NWcrcHzC6KpjZ8Rv0b8kukPn6yLXpQAEU3mabtjzHFXmcihAQYmZx1wE/Z
         4jn3pcszagZ0x5d8/wVYo33roJesAHho4jepx2tFQoaJj8DgFbUpJKWiEm/ITC3O2hkM
         A5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VTEZVIOiCGS/T8c+vGYTrPkNGXRl/4INiU1G5wt4TkQ=;
        b=fI9n+jwVYogh04GtZZ/mpuVyEUZ9+MOYWwHSsyoBkDl/CyZEGJT7xNtC++SnSthpr3
         q6CMPs7Dnqgr8imznK3Xdw/3BeaFx8Z4/FCJLDbf9bvxLdE5InSZkRrC6JlQPQvkX6P0
         Bpxr3YXb9DkjbFl6MdNWd3bBMOZxhMahVyXZvGKLIXh4mEns56oAaNEIAtD+2ePk2UI0
         moEGSG4xHvg5w3TzCx5EBOTk/To7Mu7QaaKm6+QXWJH2uwwoC5zx2Zs+IC51QTtMhASw
         SXgzK/b4FbbXU0my6jJ+Yk+oNrTuRlJC1SMAXdUtGGHB+KR2nyTRULLlXRR9SAVAffI3
         xchg==
X-Gm-Message-State: AOAM530ghhu3uOrIbSmNnhUMeZHiHWOBq2MW8aXNcFlzQMVev+PoUmHj
        96TyQbeCDlutT+WZqquW7FcZMw==
X-Google-Smtp-Source: ABdhPJzYZmEIGH7HWnECYCKaTykwlCz1C/BZZYw1p2QHUF0G4Yxjt+Ifp1OCWG8GS9BHhC9dU0t4bA==
X-Received: by 2002:a63:ab4f:: with SMTP id k15mr7342527pgp.247.1594962342362;
        Thu, 16 Jul 2020 22:05:42 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a30sm6379979pfr.87.2020.07.16.22.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 22:05:41 -0700 (PDT)
Date:   Thu, 16 Jul 2020 22:03:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mathieu.poirier@linaro.org, sibis@codearora.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v8 3/5] remoteproc: Pass size and offset as arguments to
 segment dump function
Message-ID: <20200717050339.GF2922385@builder.lan>
References: <1594938035-7327-1-git-send-email-rishabhb@codeaurora.org>
 <1594938035-7327-4-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594938035-7327-4-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 16 Jul 15:20 PDT 2020, Rishabh Bhatnagar wrote:

> Change the segment dump API signature to include size and offset
> arguments. Refactor the qcom_q6v5_mss driver to use these
> arguments while copying the segment. Doing this lays the ground
> work for "inline" coredump functionality being added in the next
> patch.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c       | 10 +++++-----
>  drivers/remoteproc/remoteproc_coredump.c |  5 +++--
>  include/linux/remoteproc.h               |  5 +++--
>  3 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 037cd45..6baa3ae 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1199,7 +1199,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  
>  static void qcom_q6v5_dump_segment(struct rproc *rproc,
>  				   struct rproc_dump_segment *segment,
> -				   void *dest)
> +				   void *dest, size_t cp_offset, size_t size)
>  {
>  	int ret = 0;
>  	struct q6v5 *qproc = rproc->priv;
> @@ -1219,16 +1219,16 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
>  	}
>  
>  	if (!ret)
> -		ptr = ioremap_wc(qproc->mpss_phys + offset, segment->size);
> +		ptr = ioremap_wc(qproc->mpss_phys + offset + cp_offset, size);
>  
>  	if (ptr) {
> -		memcpy(dest, ptr, segment->size);
> +		memcpy(dest, ptr, size);
>  		iounmap(ptr);
>  	} else {
> -		memset(dest, 0xff, segment->size);
> +		memset(dest, 0xff, size);
>  	}
>  
> -	qproc->current_dump_size += segment->size;
> +	qproc->current_dump_size += size;
>  
>  	/* Reclaim mba after copying segments */
>  	if (qproc->current_dump_size == qproc->total_dump_size) {
> diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
> index ded0244..390f563 100644
> --- a/drivers/remoteproc/remoteproc_coredump.c
> +++ b/drivers/remoteproc/remoteproc_coredump.c
> @@ -72,7 +72,8 @@ int rproc_coredump_add_custom_segment(struct rproc *rproc,
>  				      dma_addr_t da, size_t size,
>  				      void (*dumpfn)(struct rproc *rproc,
>  						     struct rproc_dump_segment *segment,
> -						     void *dest),
> +						     void *dest, size_t offset,
> +						     size_t size),
>  				      void *priv)
>  {
>  	struct rproc_dump_segment *segment;
> @@ -183,7 +184,7 @@ void rproc_coredump(struct rproc *rproc)
>  		elf_phdr_set_p_align(class, phdr, 0);
>  
>  		if (segment->dump) {
> -			segment->dump(rproc, segment, data + offset);
> +			segment->dump(rproc, segment, data + offset, 0, segment->size);
>  		} else {
>  			ptr = rproc_da_to_va(rproc, segment->da, segment->size);
>  			if (!ptr) {
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index e7b7bab..eb08139 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -451,7 +451,7 @@ struct rproc_dump_segment {
>  
>  	void *priv;
>  	void (*dump)(struct rproc *rproc, struct rproc_dump_segment *segment,
> -		     void *dest);
> +		     void *dest, size_t offset, size_t size);
>  	loff_t offset;
>  };
>  
> @@ -630,7 +630,8 @@ int rproc_coredump_add_custom_segment(struct rproc *rproc,
>  				      dma_addr_t da, size_t size,
>  				      void (*dumpfn)(struct rproc *rproc,
>  						     struct rproc_dump_segment *segment,
> -						     void *dest),
> +						     void *dest, size_t offset,
> +						     size_t size),
>  				      void *priv);
>  int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 machine);
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
