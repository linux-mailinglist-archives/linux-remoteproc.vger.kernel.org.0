Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3375315D035
	for <lists+linux-remoteproc@lfdr.de>; Fri, 14 Feb 2020 03:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbgBNCzR (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 13 Feb 2020 21:55:17 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33303 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727604AbgBNCzQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 13 Feb 2020 21:55:16 -0500
Received: by mail-pf1-f195.google.com with SMTP id n7so4135648pfn.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Feb 2020 18:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IfOGOUALQlq+vrdueHXqJ3n19JBEMpajwqi9a2b9mu8=;
        b=WALN77/LOtsK64f+I801o8pXTnwnrq+YUTeeV2575oMUx66quf3mYISHEsp68Kh4km
         Ep6MmcnPJswlcg74lZpLH7dWG2eoHRWjWEMXHzMGJjGuP76jSYrqkpi2S1NKSnS6aIvB
         57vcttNJP4g7NFVB5Mr1AeqnSbC5d5GKxugzqY9L0LCEHOWaBTK6dBUJ6HC8yM92Z8xt
         TYcQSsjG/qoHeDuLZOvKeFsq6YeQhxml2Do1cK9IylL1bfJyLt46yXk2oVaxC9hRRWUk
         2iumz+gctY6uxPr6AW/dZlH67PAPr1p+AR3+3hwbcaGMAJMuMvNl5kreGHk5LGnlhv+x
         ED6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IfOGOUALQlq+vrdueHXqJ3n19JBEMpajwqi9a2b9mu8=;
        b=rBKyIfA3ZR3ebqB9r9WhoGew4zyX5PlKU2I2P+CocNEayKDGYQCHghwrUbgYas/ibo
         ENpmIeMYgbVDjXRLUQ7sNFUouAXy0fJwBgCoCDpp3WX2IJi3hNzOlfm/Z0SFQgYGG+mJ
         aZfQwdCJQFSoN5bfSVE15XpOYUqiSrCGZrr7N7oiyqFA9B1ewMUQovbgrybcnQ4IIimR
         f/F+jVVwHKWqGBonpW+QNFiYir7wxcFm7GqPJi9xC4pxwsMnledoQKqWg8YiW15Ecr44
         KptS6UckCOKwyAkhUAADRigxs5nEsBYw0ft1ADZaue0Lhm7DNJLlGkE801LYdjtUqfui
         7pew==
X-Gm-Message-State: APjAAAVPmT17Y0IwihGufR7BBfwLePk9CmaZnxinYzq4FKoynykP1TFp
        pnVWSCUb51N+rS+sdVAxcuAF+lEkbck=
X-Google-Smtp-Source: APXvYqzc7z7F2mutLbtYnNSrcHgDyzR6Kndh5uzcQOw/4lYqQQOoCwTXLIuti9aWh6t0kRET2849ow==
X-Received: by 2002:a63:5903:: with SMTP id n3mr1140280pgb.25.1581648915905;
        Thu, 13 Feb 2020 18:55:15 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f8sm4686023pfn.2.2020.02.13.18.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 18:55:15 -0800 (PST)
Date:   Thu, 13 Feb 2020 18:55:12 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Loic PALLARDY <loic.pallardy@st.com>,
        Suman Anna <s-anna@ti.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 1/3] remoteproc: add support for co-processor loaded
 and booted before kernel
Message-ID: <20200214025512.GQ1443@yoga>
References: <20200211174205.22247-1-arnaud.pouliquen@st.com>
 <20200211174205.22247-2-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211174205.22247-2-arnaud.pouliquen@st.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 11 Feb 09:42 PST 2020, Arnaud Pouliquen wrote:

> From: Loic Pallardy <loic.pallardy@st.com>
> 
> Remote processor could boot independently or be loaded/started before
> Linux kernel by bootloader or any firmware.
> This patch introduces a new property in rproc core, named skip_fw_load,
> to be able to allocate resources and sub-devices like vdev and to
> synchronize with current state without loading firmware from file system.

This sentence describes the provided patch.

As I expressed in the earlier version, in order to support remoteprocs
that doesn't need firmware loading, e.g. running from some ROM or
dedicated flash storage etc, this patch looks really good.

> It is platform driver responsibility to implement the right firmware
> load ops according to HW specificities.

But this last sentence describes a remoteproc that indeed needs
firmware and that the purpose of this patch is to work around the core's
handling of the firmware.

> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 67 ++++++++++++++++++++++------
>  include/linux/remoteproc.h           |  2 +
>  2 files changed, 55 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
[..]
> @@ -1758,11 +1779,20 @@ int rproc_boot(struct rproc *rproc)
>  
>  	dev_info(dev, "powering up %s\n", rproc->name);
>  
> -	/* load firmware */
> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> -	if (ret < 0) {
> -		dev_err(dev, "request_firmware failed: %d\n", ret);
> -		goto downref_rproc;
> +	if (!rproc->skip_fw_load) {
> +		/* load firmware */
> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
> +		if (ret < 0) {
> +			dev_err(dev, "request_firmware failed: %d\n", ret);
> +			goto downref_rproc;
> +		}
> +	} else {
> +		/*
> +		 * Set firmware name pointer to null as remoteproc core is not
> +		 * in charge of firmware loading
> +		 */
> +		kfree(rproc->firmware);
> +		rproc->firmware = NULL;

As stated before, I think it would be more appropriate to allow a
remoteproc driver for hardware that shouldn't have firmware loaded to
never set rproc->firmware.

And I'm still curious how you're dealing with a crash or a restart on
this remoteproc. Don't you need to reload your firmware in these
circumstances? Do you perhaps have a remoteproc that's both
"already_booted" and "skip_fw_load"?

>  	}
>  
>  	ret = rproc_fw_boot(rproc, firmware_p);
> @@ -1916,8 +1946,17 @@ int rproc_add(struct rproc *rproc)
>  	/* create debugfs entries */
>  	rproc_create_debug_dir(rproc);
>  
> -	/* if rproc is marked always-on, request it to boot */
> -	if (rproc->auto_boot) {
> +	if (rproc->skip_fw_load) {
> +		/*
> +		 * If rproc is marked already booted, no need to wait
> +		 * for firmware.
> +		 * Just handle associated resources and start sub devices
> +		 */

Again, this describes a system where the remoteproc is already booted,
not a remoteproc that doesn't need firmware loading.

Regards,
Bjorn
