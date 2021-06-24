Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3224D3B3728
	for <lists+linux-remoteproc@lfdr.de>; Thu, 24 Jun 2021 21:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbhFXTn1 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 24 Jun 2021 15:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232789AbhFXTn1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Jun 2021 15:43:27 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C643FC061756
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Jun 2021 12:41:07 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id q192so6076660pfc.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Jun 2021 12:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+xafYqSgVD8nUH+DnQ+8KYkIuJ1/DagxEHzExEHv1Yk=;
        b=s1ELRsJ1L3/affpkUOzjF8ZJlTUHW0ZrN/RcHFSj4l2+sYgfbmXfU24TmlKgOmSCQk
         FQL1L17D95/uRY/UEILoJRT16xm0mbvWMkboQYmaJXXXukYIIDAcy0XHxIrdvbbywQGB
         15l9Ii95uFNiMZoqSA4ufg2Wnbi/pvMszX1on4/IFXOvcs+fVZJ3VRczx2d9PlshXNpr
         lpfTlnxOpL51j8c/p+xq2Y1oR392KHHfa74lrgoPFjeGGrVDVrv4Vo8hK4N3o+f8GLiF
         4YfDkoAoOJT9WwNMGbirr0Yly+LqTGTnJm7q0hzxF1mN1GdRuflsOWMmN9y+Mn4eNTXp
         dydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+xafYqSgVD8nUH+DnQ+8KYkIuJ1/DagxEHzExEHv1Yk=;
        b=fPPcIkgKLQrzWmS9umnTmr9FPKAeL3Gd6WFZmj7jlhwKYP/Lqib0KThWVJWqDOCfjU
         HCfdBMfbleSZMejxah/9/HQTA9iGOBRlJf6zlBIoIA/z2GjY3/UbyU80NnESUjBYiaqc
         cpwYVcc6+MfG7SsnFwmL2It1pD1PZJ7Ay2LKE73yD0vqEsy+stCA6YoNnt1ig91vnB01
         2i095ccJ0XhGrq5izHRkH57GKuMOD02Vh8VhqGrs3blLiCIFUifc8M655qyT6ABmnCyK
         ZkG/9Dd5K6Dx2ZqvK0QREaEy/RV8K8AVCPiwME+oCAXtJbJncfngBodr9g5MHbjApUla
         7/eg==
X-Gm-Message-State: AOAM533HpLLKlBijot0zwXPKastQ1Gncn88d/AybuxZQ+cXzKGEpONns
        ubw2J8kIZ/e044ZPBB/3ZQmqVQ==
X-Google-Smtp-Source: ABdhPJwUVFpzX28kDds82ZORVhxGs12hO3Flayw0ggl9RAz91JOqJAMu9/GsvdTHoLtcOZIXf44n1A==
X-Received: by 2002:a62:1d84:0:b029:304:5af1:65f6 with SMTP id d126-20020a621d840000b02903045af165f6mr4825181pfd.80.1624563667240;
        Thu, 24 Jun 2021 12:41:07 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id cu4sm3364755pjb.40.2021.06.24.12.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 12:41:06 -0700 (PDT)
Date:   Thu, 24 Jun 2021 13:41:04 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] remoteproc: pru: Add support for various PRU cores
 on K3 AM64x SoCs
Message-ID: <20210624194104.GB1090275@p14s>
References: <20210623173243.7862-1-s-anna@ti.com>
 <20210623173243.7862-3-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210623173243.7862-3-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jun 23, 2021 at 12:32:42PM -0500, Suman Anna wrote:
> The K3 AM64x family of SoCs have a ICSSG IP that is similar to the
> version on AM65x SR2.0 SoCs with some minor differences. The AM64x
> SoCs contain two instances of this newer ICSSG IP. Each ICSSG processor
> subsystem contains 2 primary PRU cores, 2 auxiliary PRU cores called
> RTUs, and 2 new auxiliary cores called Transmit PRUs (Tx_PRUs).
> 
> Enhance the existing PRU remoteproc driver to support all these PRU,
> RTU and Tx_PRU cores by using specific compatibles. The cores have the
> same memory copying limitations as on AM65x, so reuses the custom memcpy
> function within the driver's ELF loader implementation. The initial
> names for the firmware images for each PRU core are retrieved from
> DT nodes, and can be adjusted through sysfs if required.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/pru_rproc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index e5778e476245..0ecf2675f5eb 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -894,6 +894,9 @@ static const struct of_device_id pru_rproc_match[] = {
>  	{ .compatible = "ti,j721e-pru",		.data = &k3_pru_data },
>  	{ .compatible = "ti,j721e-rtu",		.data = &k3_rtu_data },
>  	{ .compatible = "ti,j721e-tx-pru",	.data = &k3_tx_pru_data },
> +	{ .compatible = "ti,am642-pru",		.data = &k3_pru_data },
> +	{ .compatible = "ti,am642-rtu",		.data = &k3_rtu_data },
> +	{ .compatible = "ti,am642-tx-pru",	.data = &k3_tx_pru_data },
>  	{},

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  };
>  MODULE_DEVICE_TABLE(of, pru_rproc_match);
> -- 
> 2.30.1
> 
