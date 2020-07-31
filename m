Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24CA234C04
	for <lists+linux-remoteproc@lfdr.de>; Fri, 31 Jul 2020 22:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgGaUOM (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 31 Jul 2020 16:14:12 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:41511 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726588AbgGaUOL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 31 Jul 2020 16:14:11 -0400
Received: by mail-io1-f66.google.com with SMTP id g19so20792559ioh.8;
        Fri, 31 Jul 2020 13:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2eoSQj625bIp5Q6vig/9jlXLqZxlK+v1YHUTzUUaPhE=;
        b=rMoU2If5jUMmRTovwSzQ9FKDNJu/DLNpXj2bpeeE57dUCST8pMDV3w4OBY7l6NMmqk
         RtseV/RAcavQPe+e+5gEfbpufV/aCmwwnm6WUjOXWmk/GeGhrj4DRzyKZcHAq1eh9Z2r
         mmYfC1wSFX6reTICxrKxNIPtZYdx5XtIFISdilq1L5NHbUQBL9N59bKaIopGUpL8ohvb
         Aft4BoQbaEXEhyFeWwngZpBRqfDCszq6mg7oPxV0RgVB2w3A+tsDCRK6Uknzs4m7oXnv
         in/6KPk58ZaBCYrCpikYOJ5dSPaxrIQdYi3h5jA2pUliWGO5LothLrj5PdrQyoG4OMUP
         pylQ==
X-Gm-Message-State: AOAM532tLEiObrv9YhhLhXr/Y2K1cfwp2aGUd8gNejqnTVmzWBoTk2wA
        /CiXWiKRpgIbrKWSoZ+pAA==
X-Google-Smtp-Source: ABdhPJyuHKIYYMl5aaAMjySke6zM39CpCRjQpRzG0uFldAkGKLpPXaVoxq7SBIyg9V5RmQif36m5CA==
X-Received: by 2002:a05:6638:2493:: with SMTP id x19mr7074250jat.53.1596226450776;
        Fri, 31 Jul 2020 13:14:10 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id j5sm5319645ilq.30.2020.07.31.13.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 13:14:10 -0700 (PDT)
Received: (nullmailer pid 704032 invoked by uid 1000);
        Fri, 31 Jul 2020 20:14:08 -0000
Date:   Fri, 31 Jul 2020 14:14:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: remoteproc: imx_rproc: add i.MX8MQ/M
Message-ID: <20200731201408.GA699580@bogus>
References: <20200724080813.24884-1-peng.fan@nxp.com>
 <20200724080813.24884-2-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724080813.24884-2-peng.fan@nxp.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jul 24, 2020 at 04:08:04PM +0800, Peng Fan wrote:
> Add i.MX8MQ/M compatible string
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/imx-rproc.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> index fbcefd965dc4..46f7623512db 100644
> --- a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> @@ -8,6 +8,8 @@ Required properties:
>  - compatible		Should be one of:
>  				"fsl,imx7d-cm4"
>  				"fsl,imx6sx-cm4"
> +				"fsl,imx8mq-cm4"
> +				"fsl,imx8mm-cm4"
>  - clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
>  - syscon		Phandle to syscon block which provide access to
>  			System Reset Controller
> @@ -15,6 +17,7 @@ Required properties:
>  Optional properties:
>  - memory-region		list of phandels to the reserved memory regions.
>  			(See: ../reserved-memory/reserved-memory.txt)
> +- rsc-da		address of resource table

What's that? If in main memory, then should be part of memory-region.

>  
>  Example:
>  	m4_reserved_sysmem1: cm4@80000000 {
> -- 
> 2.16.4
> 
