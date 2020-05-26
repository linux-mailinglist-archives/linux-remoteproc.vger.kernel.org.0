Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5D81A6DA4
	for <lists+linux-remoteproc@lfdr.de>; Mon, 13 Apr 2020 22:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388634AbgDMU4i (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 13 Apr 2020 16:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388623AbgDMU4g (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Apr 2020 16:56:36 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF587C0A3BE2
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2020 13:56:36 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id z12so9888289ilb.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2020 13:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+9bhJOKbHnZgE/NcZVtRTDn/bdK2FA24+a+r8OEi9Rs=;
        b=VkA9CHnSbe8SsUNQiWSy7iab5lN5LHT10agf1wIYwCKYO5AeCyGez05JrUqbEO2/oJ
         6PqPnr71uZxp2ETqqFgFlDqLcaHoThOACHrsA093prJAsH4ojY6jJoOwoD5mLH0VY5Ty
         tygHPYCank79qVEigUxFbi+u3TNMKQnXxZ81/FMDfUwXdp7HMBQ/Ah3y6qUIKTP4L3Ey
         KBETt22j3jf/X3aqVXKYefD+R7Ph1IiT6ctH1w6nS231pvduwv6bjivi2pRDNIFTnO27
         qTnchvYkI0ztyWY5dZLA+QrSdA5j6JPi9D9Dc8hHpRawShSfj5dU5SwUJJMebaJ8Xwni
         ErUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+9bhJOKbHnZgE/NcZVtRTDn/bdK2FA24+a+r8OEi9Rs=;
        b=k1qy30MMoKgtnW52791OBTN+RqzbG8B33gWWw5bdBI1eOU4bSxtHJfx5kU+fC7v1/I
         70NCw1TvhAH7MgvnZ63+rgMd3tNdhnMPtpD7o476nWG2wlpsG60vGhPcta10v9ffqSv3
         0Ix9lNRIvcuMaVMI4oG4ECRX/6h9algP5GoonmB/yFRKKjlm5U9hsodMxnLnVI2eOXo7
         GA3xxTQTxabKsYCsFe9DGJIZR71oCDn/K55nfkijtQkXUlzOcHhERTd/Is/p/VDwQcfA
         9iqsB+FwJmzIMdYyrxUeqTDTsuxeMOQSKvLpW3f1n59G4zbOuZbMkSaaC2X/zE7Ck9Eu
         rXUQ==
X-Gm-Message-State: AGi0Pua/Mrn+SdXtIUMH+sIu66qUyqva58toQYAPqVuN6blqznjc8e//
        EQZa3/1cTVEx1q+wURopHH3emw==
X-Google-Smtp-Source: APiQypLELSzexQnBkcbLQwb8hdHyoxKJDe8/OS1FLbFeQn+8S8JYmqCYBeOsB++x2UigWFKwnHA2KQ==
X-Received: by 2002:a92:409a:: with SMTP id d26mr18576533ill.153.1586811396139;
        Mon, 13 Apr 2020 13:56:36 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id o123sm4155509ila.36.2020.04.13.13.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 13:56:35 -0700 (PDT)
Subject: Re: [PATCH 3/4] remoteproc: Split rproc_ops allocation from
 rproc_alloc()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     s-anna@ti.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200413193401.27234-1-mathieu.poirier@linaro.org>
 <20200413193401.27234-4-mathieu.poirier@linaro.org>
From:   Alex Elder <elder@linaro.org>
Message-ID: <21c577b1-df9c-8017-e0be-22ede5e21ac3@linaro.org>
Date:   Mon, 13 Apr 2020 15:56:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200413193401.27234-4-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 4/13/20 2:34 PM, Mathieu Poirier wrote:
> Make the rproc_ops allocation a function on its own in order to
> introduce more flexibility to function rproc_alloc().
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_core.c | 32 +++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 4dee63f319ba..c272d78f07e8 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2006,6 +2006,25 @@ static int rproc_alloc_firmware(struct rproc *rproc,
>  	return 0;
>  }
>  
> +static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
> +{
> +	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
> +	if (!rproc->ops)
> +		return -ENOMEM;
> +
> +	/* Default to ELF loader if no load function is specified */
> +	if (!rproc->ops->load) {
> +		rproc->ops->load = rproc_elf_load_segments;
> +		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
> +		rproc->ops->find_loaded_rsc_table =
> +						rproc_elf_find_loaded_rsc_table;
> +		rproc->ops->sanity_check = rproc_elf_sanity_check;

I'm glad you made this unconditional, the sanity check function
is always null when the load function is null.

> +		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * rproc_alloc() - allocate a remote processor handle
>   * @dev: the underlying device
> @@ -2045,8 +2064,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	if (rproc_alloc_firmware(rproc, name, firmware))
>  		goto free_rproc;
>  
> -	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
> -	if (!rproc->ops)
> +	if (rproc_alloc_ops(rproc, ops))
>  		goto free_firmware;
>  
>  	rproc->name = name;
> @@ -2073,16 +2091,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  
>  	atomic_set(&rproc->power, 0);
>  
> -	/* Default to ELF loader if no load function is specified */
> -	if (!rproc->ops->load) {
> -		rproc->ops->load = rproc_elf_load_segments;
> -		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
> -		rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
> -		if (!rproc->ops->sanity_check)
> -			rproc->ops->sanity_check = rproc_elf32_sanity_check;
> -		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
> -	}
> -
>  	mutex_init(&rproc->lock);
>  
>  	INIT_LIST_HEAD(&rproc->carveouts);
> 

