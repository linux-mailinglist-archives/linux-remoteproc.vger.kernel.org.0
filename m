Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D01A1A3DAD
	for <lists+linux-remoteproc@lfdr.de>; Fri, 10 Apr 2020 03:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgDJBU3 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 9 Apr 2020 21:20:29 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36419 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgDJBU3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Apr 2020 21:20:29 -0400
Received: by mail-pf1-f194.google.com with SMTP id n10so400837pff.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2020 18:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Se150hiWquIt6SCF9Ml3hopQBuNGZRuaatmKyZ4D96Q=;
        b=BM8HZBDiTR8VA1t/ImCY3ODYEL5MfbnNFgbWkxxhgcE7K468DD/Qul6d/YBRwrEugb
         1Ft/5X1HW3yh9GVR6OLl8kGmz5uHuSNUfp5oSuFySe0akBkMBt1HHTzWYAEbZCj+B3f9
         lmA48WHpmT0Z5AzrJWfZV5bh/gxeiC/fUoTiwNgZa67vxDfMbLgJMNFoI2wuDT0MRx0w
         cusdL6BVntZcfnxgO55pOc6pYsuf5rutX53r4A6yzU904URmDv8uW0flWCZ1bivLJnIy
         mhzI0uIHxvpBNlo6pStJOQZvsfVb2umBMXnXvxi8t4WUJjk0ajNQUi0ZHD+9qeAG4fIF
         A3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Se150hiWquIt6SCF9Ml3hopQBuNGZRuaatmKyZ4D96Q=;
        b=Da9XukTduHsbKKFOFvdQe7TSxuGPBJtgFuDOMOZbqdtijA2PH1uT35wPiIF1E58k4T
         76rjZmc2uCa9ljfS5IzH8NbU+sfPGMFk/UpHjr6TOXgO8DJOSKJpAKFH/vfqBMCXCK5e
         W5OVlj5Qig9X4xMWNT+eo7eTApTY2BQ9iSkRG7vBpJNaUSjQL6Sy0+Oz9TthyKaQ+Vrk
         I4ZGK4cQo4HL5cMK7+cL7w/somYjql9Ss5YNuqnOKD8qCeawzF4fSZjJSf74uZTZgzBz
         YpD5xmHqppWVbzUtdGxIP1OfpDPW8asgkYYmad5FInF01v0kdODo6bTixxgEfibG87qo
         1Cig==
X-Gm-Message-State: AGi0PuZ+1qq87NAVCy6RjZ7WqvD5hbfH7nce/oXxmaZ+svj6B8gqdw8J
        Kp0P0hkwQtG/GQofKY+B5gxIdQ==
X-Google-Smtp-Source: APiQypIUx0ejv6KHG5NNwU/7MFHaj3uJKApTKGer6Hzadc9PbSsk4YjGxx6GdQZp8VpaXPdWSTCggQ==
X-Received: by 2002:a63:3d04:: with SMTP id k4mr2198376pga.115.1586481626752;
        Thu, 09 Apr 2020 18:20:26 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g11sm330131pfm.4.2020.04.09.18.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 18:20:26 -0700 (PDT)
Date:   Thu, 9 Apr 2020 18:20:34 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH 1/2] remoteproc: drop memset when loading elf segments
Message-ID: <20200410012034.GU20625@builder.lan>
References: <1586420572-28353-1-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586420572-28353-1-git-send-email-peng.fan@nxp.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 09 Apr 01:22 PDT 2020, Peng Fan wrote:

> To arm64, "dc      zva, dst" is used in memset.
> Per ARM DDI 0487A.j, chapter C5.3.8 DC ZVA, Data Cache Zero by VA,
> 
> "If the memory region being zeroed is any type of Device memory,
> this instruction can give an alignment fault which is prioritized
> in the same way as other alignment faults that are determined
> by the memory type."
> 
> On i.MX platforms, when elf is loaded to onchip TCM area, the region
> is ioremapped, so "dc zva, dst" will trigger abort.
> 
> Since memset is not strictly required, let's drop it.
> 

This would imply that we trust that the firmware doesn't expect
remoteproc to zero out the memory, which we've always done. So I don't
think we can say that it's not required.

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index 16e2c496fd45..cc50fe70d50c 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -238,14 +238,11 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  			memcpy(ptr, elf_data + offset, filesz);
>  
>  		/*
> -		 * Zero out remaining memory for this segment.
> +		 * No need zero out remaining memory for this segment.
>  		 *
>  		 * This isn't strictly required since dma_alloc_coherent already
> -		 * did this for us. albeit harmless, we may consider removing
> -		 * this.
> +		 * did this for us.

In the case of recovery this comment is wrong, we do not
dma_alloc_coherent() the carveout during a recovery.

And in your case you ioremapped existing TCM, so it's never true.

>  		 */
> -		if (memsz > filesz)
> -			memset(ptr + filesz, 0, memsz - filesz);

So I think you do want to zero out this region. Question is how we do
it...

Regards,
Bjorn

>  	}
>  
>  	if (ret == 0)
> -- 
> 2.16.4
> 
