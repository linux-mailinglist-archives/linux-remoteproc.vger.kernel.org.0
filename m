Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F72D33DC7
	for <lists+linux-remoteproc@lfdr.de>; Tue,  4 Jun 2019 06:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfFDES5 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 4 Jun 2019 00:18:57 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58859 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFDES5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 Jun 2019 00:18:57 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1hY0uV-0000D9-24; Tue, 04 Jun 2019 06:18:55 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1hY0uU-0008Eo-Gt; Tue, 04 Jun 2019 06:18:54 +0200
Date:   Tue, 4 Jun 2019 06:18:54 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: imx: Broaden the Kconfig selection logic
Message-ID: <20190604041854.55hqqt6lmykwgro2@pengutronix.de>
References: <20190603234628.10924-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603234628.10924-1-festevam@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 06:17:58 up 17 days, 10:36, 32 users,  load average: 0.00, 0.00,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jun 03, 2019 at 08:46:27PM -0300, Fabio Estevam wrote:
> Besides i.MX6SX and i.MX7D, there are other i.MX devices that contain
> Cortex M4 and could make use of the imx remoteproc driver, such as
> i.MX7ULP, i.MX8M, etc.
> 
> Instead of adding new SoC entries in the Kconfig logic, make it
> broader by using the more generic ARCH_MXC, which encompasses
> all the 32-bit and 64-bit i.MX devices.

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

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
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
