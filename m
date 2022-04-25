Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D06EA50E64F
	for <lists+linux-remoteproc@lfdr.de>; Mon, 25 Apr 2022 18:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236432AbiDYQ7B (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 25 Apr 2022 12:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbiDYQ7A (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 25 Apr 2022 12:59:00 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0112D13F9B
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Apr 2022 09:55:55 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id n33-20020a17090a5aa400b001d28f5ee3f9so6480738pji.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Apr 2022 09:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fHj0AXFpbHX+x5jOd8SRt9e16ihhUng0D/feKZZnpv8=;
        b=FEvSxjhbaiBv88L8kOktym3iC8R8O3qQefPdoXOLlesqLA7PHFDH4Ly1WACA+rAmHU
         WFYWAsFAgO9K4ek0AIY1Py4MA2xes8OeKQTniMnqopB4OUBWhSYZyycRYIIrrO66eF+q
         TezSS9rHfXn8M6biPzALcA8etR6djyTk3IYCFtRAc6AtM9o311inxeF5QVFsv9YOJdtQ
         Iav/UtTiNPUp3qqSJW9SDbHTJ8n7Qn1kEQ7qIAsed4W8ZdZMYBKJuCxFSbqn3W4cofC3
         vxKrxlTxfU0xkOltUvgpDhUIfB2B58Ap/oM5hMcHQAVk2ZVy/hup4ude5BbsD80l9n+2
         sAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fHj0AXFpbHX+x5jOd8SRt9e16ihhUng0D/feKZZnpv8=;
        b=KQtYeUQx5v9N6XsAaCADDQpEkuMkxgTX18BMr3Mn0Yhn0IUsm3fiYxsyBKVZV+zNUM
         cKEjPDA9DFMHkV9OjUeWTajNiozQKW1VSfXw5KprrM3bPH+dM/VLWKw3ehRKYQJvWOTL
         +SWp1aRHIPtWJ5xw8UYtGKGgXFog5sz3m9ckAtk6nvFATNdMhawBgDP9u05z+rFPZWXN
         QZgzV7lwzXpW70OWwcaRyDO0aZQGPzcrLMWoAHDR5S3ENRcphvCeEJanda5TKFXCS045
         HBA/WDmYRoEMEgKogGstKBW8bxGlby47lt0YF4c7OTGP088KLhTsJYBK3aIwI0ENGNTy
         XyUQ==
X-Gm-Message-State: AOAM5320c+VvoVVpKIIilIxRFXmzYai5BbvNb0w2CZc7bXZ9xFRy8YvA
        eiw9MtpZCQjPx44fnnUxzfmNJA==
X-Google-Smtp-Source: ABdhPJy8UDRi8nvlNJ/DZUcck1tp5UrommAF25tWePBOj8Foc0cM4QAxsDb5oZ1qiqmpv2T1TVm1OQ==
X-Received: by 2002:a17:90b:255:b0:1cf:39e7:a7aa with SMTP id fz21-20020a17090b025500b001cf39e7a7aamr22087982pjb.137.1650905755524;
        Mon, 25 Apr 2022 09:55:55 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id d20-20020a056a00199400b005060849909esm14038460pfl.176.2022.04.25.09.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 09:55:54 -0700 (PDT)
Date:   Mon, 25 Apr 2022 10:55:52 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Hangyu Hua <hbh25y@gmail.com>
Cc:     bjorn.andersson@linaro.org, arnaud.pouliquen@foss.st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: virtio: fix possible double free in rpmsg_probe()
Message-ID: <20220425165552.GB1917807@p14s>
References: <20220418093144.40859-1-hbh25y@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418093144.40859-1-hbh25y@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Apr 18, 2022 at 05:31:44PM +0800, Hangyu Hua wrote:
> vch will be free in virtio_rpmsg_release_device() when
> rpmsg_ns_register_device() fails. There is no need to call kfree() again.
> 
> Fix this by changing error path from free_vch to free_ctrldev.
> 
> Fixes: c486682ae1e2 ("rpmsg: virtio: Register the rpmsg_char device")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 3ede25b1f2e4..603233f0686e 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -973,7 +973,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  
>  		err = rpmsg_ns_register_device(rpdev_ns);
>  		if (err)
> -			goto free_vch;

Please add a comment that highlights where 'vch' will be free'd to avoid
receiving patches that will introduce another kfree().  Same for your other
patch.

In the next revision please use a cover letter and add Arnaud's patches to it.

Thanks,
Mathieu

> +			goto free_ctrldev;
>  	}
>  
>  	/*
> @@ -997,8 +997,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  
>  	return 0;
>  
> -free_vch:
> -	kfree(vch);
>  free_ctrldev:
>  	rpmsg_virtio_del_ctrl_dev(rpdev_ctrl);
>  free_coherent:
> -- 
> 2.25.1
> 
