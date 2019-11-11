Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB69F83AD
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 Nov 2019 00:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbfKKXiC (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 11 Nov 2019 18:38:02 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36949 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727384AbfKKXiA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Nov 2019 18:38:00 -0500
Received: by mail-pf1-f196.google.com with SMTP id p24so11882959pfn.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Nov 2019 15:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MsnyjGFe6RoiVQKxeXrC3wHfBh1UTFjBzfDKoYAlahU=;
        b=S8WtfFatOtmT/GYrH3OBgXecciof/Mcr4gZQnwNxMA3666p1bhHqhvCndv8c2DlY7q
         2kMoiBzCNzN7UR5v7AvHz2o0lho1jwLz6hjrUQ3PhN3zUqItyAmj5AisrDI9UqZMvlaX
         FY/hy1nTwVBEsA9TA1k2BH7SXj/xO3sfDhvWf9gKS6brwkA3Vnpx5FiqUvyjbI/L1Lxj
         JrwQFiq8BVR5X0ERDnWS5AaauyJwDlUeUmw8wS9pQeiNjHledSOilU4ymbnYkHELComI
         GJ5XgaDM6LQpK/qqRoCqVtqaJ3sZzzgUQZ4GUiTe3PxfOgGClgRNc2TIzOsc6r+D5ctp
         WYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MsnyjGFe6RoiVQKxeXrC3wHfBh1UTFjBzfDKoYAlahU=;
        b=jNtds+GBpBnHxaY6r9zPaUsFR65NA+5mwa9CzkNUOzZK7Z3IYiUpIpmre2pCWMQPfh
         w+mOBy5aewk1lQgZKJwFNhQAW1UIVd3rrBBA2/hUjivNMS9ZhJAv7g/JdurWiMO9QZhd
         JbHQNOXGraHoHHOcXl4jc4oFZtauNZ0r080E1BJmCGIZXDaGLMzJD3AYj1HJuCIDOXLV
         xtrWQG8VOkV/U0i9Zmxicr9k9cdlKUK2IQPpmDZ8FRZeFtsA1zUddVBjbTXFRddX14Rl
         913YgnaWaBhQ6H2A7qt08FayTXj4gDN/ACosyoF7AlwYh79Jl8S2SIar3J7N5aEoF4Up
         mcAg==
X-Gm-Message-State: APjAAAVMgmuD+9p6W7/DqQLQlydgeOLPoCI4WcnEePnw1R/9PXfOl4EC
        DN1vNu9a97wuCu7HD7jzA43RXQ==
X-Google-Smtp-Source: APXvYqwedNiuHkmNSgCLK8ShDTISGvxxcBN5EaxdEjPwwrqGPB5ZaDfrLAVVlA43jyjQsBOdHSpRUA==
X-Received: by 2002:a62:e219:: with SMTP id a25mr32268779pfi.252.1573515478601;
        Mon, 11 Nov 2019 15:37:58 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x2sm16623628pfn.167.2019.11.11.15.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 15:37:58 -0800 (PST)
Date:   Mon, 11 Nov 2019 15:37:56 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        s-anna@ti.com
Subject: Re: [PATCH 10/17] remoteproc/omap: Remove the omap_rproc_reserve_cma
 declaration
Message-ID: <20191111233756.GL3108315@builder>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-11-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028124238.19224-11-t-kristo@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:

> From: Suman Anna <s-anna@ti.com>
> 
> The omap_rproc_reserve_cma() function is not defined at the moment.
> This prototype was to be used to define a function to declare a
> remoteproc device-specific CMA pool.
> 
> The remoteproc devices will be defined through DT going forward. A
> device specific CMA pool will be defined under the reserved-memory
> node, and will be associated with the appropriate remoteproc device
> node. This function prototype will no longer be needed and has
> therefore been cleaned up.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  include/linux/platform_data/remoteproc-omap.h | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/include/linux/platform_data/remoteproc-omap.h b/include/linux/platform_data/remoteproc-omap.h
> index 6bea01e199fe..49c78805916f 100644
> --- a/include/linux/platform_data/remoteproc-omap.h
> +++ b/include/linux/platform_data/remoteproc-omap.h
> @@ -21,16 +21,4 @@ struct omap_rproc_pdata {
>  	int (*device_shutdown)(struct platform_device *pdev);
>  };
>  
> -#if defined(CONFIG_OMAP_REMOTEPROC) || defined(CONFIG_OMAP_REMOTEPROC_MODULE)
> -
> -void __init omap_rproc_reserve_cma(void);
> -
> -#else
> -
> -static inline void __init omap_rproc_reserve_cma(void)
> -{
> -}
> -
> -#endif
> -
>  #endif /* _PLAT_REMOTEPROC_H */
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
