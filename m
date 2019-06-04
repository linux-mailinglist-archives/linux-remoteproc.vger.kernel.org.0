Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C83833E26
	for <lists+linux-remoteproc@lfdr.de>; Tue,  4 Jun 2019 07:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbfFDFBZ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 4 Jun 2019 01:01:25 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46713 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbfFDFBZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 Jun 2019 01:01:25 -0400
Received: by mail-pg1-f196.google.com with SMTP id v9so9580031pgr.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Jun 2019 22:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VMwD8um73ejzFOyb5aRXjfqTY8FxwbUWl38z2kG56nA=;
        b=xaXOo29BhrAAK5wzo3dXAN+di7qWburnu2bOocegYhgleQmYX7H0cHAIHFnfyvDfv1
         hRWh8ZJIEhsUGqCzHORsndQZXfEeDIgQ8ckwuG50f9/qLj27+b68Q7eQQom7ma8fzPtD
         yDHKBHOTSVSnpDWYy1Ldr818sa1lAjQE+FFSA68z3BFpe3g/fq9a6tqV96PfDlFc9Kts
         XBuzQShOqjf7P7kmBqAAcIT/Bus4knIr5iCV6xEhVYxwpfIDr/fvHIHioUTkr51xtqPo
         PtQZPGq486L2M1d0pngS0abPvlvRlX+YwJqOtYkTVurbuc4on9YGZLXSdvtGBItIF1+Z
         Z0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VMwD8um73ejzFOyb5aRXjfqTY8FxwbUWl38z2kG56nA=;
        b=LBH8h0CdYwK775JIVsm/Q7nYeFPlVOzspP1yQhKv3nbZX2WXlBG6lx+h/uC1jnGrG+
         VER4uStIry10RCq31VsJvegnZVCXmsQazcR2AKitssvxvwI+qOizqIXBm4kNPxgVG+ZR
         4DOdtZpswzjrft8cgMIaQHCZGwP9dMsmkNMJ97kvgQ8oO+oGNPm2+6dZSfsq/72AhkGI
         LYsirf53e3QfgBE9X7FkCoJ5oIwWNy6pUOKaF3/QP67mj4QfjOICykZXdLrAXUmfdIi+
         wMQL2kcMNwWjJ9yI5SqeW9dXynvzb1ysm5plpW5BcysC5tOG+86aLIgingNzeAEzswFR
         e7iw==
X-Gm-Message-State: APjAAAXNd+ExPD/OvAWfi1r7n97BMyZ+oNwkIQ9JJeTm8WrC5kdkisCY
        yWZm0qPzv7+ze/IC/VtPcTJ/Bdg7tkM=
X-Google-Smtp-Source: APXvYqw0J0QiG0RgWimsaD8cPeYdP5o2maUOG2WbPHw1IO6n1SXD+pcfXp9D9nlTY4JXOr5w62oyOQ==
X-Received: by 2002:a63:6105:: with SMTP id v5mr17275428pgb.312.1559624484184;
        Mon, 03 Jun 2019 22:01:24 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l38sm14513297pje.12.2019.06.03.22.01.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2019 22:01:23 -0700 (PDT)
Date:   Mon, 3 Jun 2019 22:01:21 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     ohad@wizery.com, o.rempel@pengutronix.de,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: imx: Broaden the Kconfig selection logic
Message-ID: <20190604050121.GA23094@builder>
References: <20190603234628.10924-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603234628.10924-1-festevam@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 03 Jun 16:46 PDT 2019, Fabio Estevam wrote:

> Besides i.MX6SX and i.MX7D, there are other i.MX devices that contain
> Cortex M4 and could make use of the imx remoteproc driver, such as
> i.MX7ULP, i.MX8M, etc.
> 
> Instead of adding new SoC entries in the Kconfig logic, make it
> broader by using the more generic ARCH_MXC, which encompasses
> all the 32-bit and 64-bit i.MX devices.
> 

Patches applied with Oleksij's review.

Thanks,
Bjorn

> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/remoteproc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 18be41b8aa7e..0df301be6d9a 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -16,7 +16,7 @@ if REMOTEPROC
>  
>  config IMX_REMOTEPROC
>  	tristate "IMX6/7 remoteproc support"
> -	depends on SOC_IMX6SX || SOC_IMX7D
> +	depends on ARCH_MXC
>  	help
>  	  Say y here to support iMX's remote processors (Cortex M4
>  	  on iMX7D) via the remote processor framework.
> -- 
> 2.17.1
> 
