Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C17E179B11
	for <lists+linux-remoteproc@lfdr.de>; Wed,  4 Mar 2020 22:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730004AbgCDVi4 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 4 Mar 2020 16:38:56 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45207 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728482AbgCDVi4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Mar 2020 16:38:56 -0500
Received: by mail-pl1-f196.google.com with SMTP id b22so1603848pls.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Mar 2020 13:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zya0a4hWggA1H31y1NhuXMUGNeawz1BRvjVCGIwcxZg=;
        b=IMfS/redeXHNRbO0CWNxq4ChVRncUl4loQytIGK0shTFNF0JDdBnjpdbilx1QJ1cel
         ORe39DQe9Vte3aap3KOzQcDIUGsi50wBSDnQGU7bHsVV1sMNlgypN5u0CNGMZZk5uEJJ
         BOATQkGWjbxvILRt1lMBBXoV9UswaPBtQEDvmYccvmdbbLl3I7tKCJRgAlDi02x1GgF8
         HrIbrgBF6UPKZ657JekPZL09NUarIREb148+glZzJUI2pj1bW7aMfZFMRskIlUuH4/Be
         xV6ZnkEInHLwc/rOvR02ACpWc0iyIrzwfBr/7BRJNRjk5AMWcUXwNBE2AOPDwEzjkOo0
         nSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zya0a4hWggA1H31y1NhuXMUGNeawz1BRvjVCGIwcxZg=;
        b=Rd6heJqYxmCQb4Hpl2tY6pCpUx0UOYmwl2FGhrM7opYXteITbd8ngbygMcW1JkElyX
         ST3oKtE1NVg9ILD2VUS4GPq90daPHCk0D64c+xRr4Gq0EXw01lfggGwqfXrkOpgRZrR4
         tI0tbah5jNJaQeZFD5foe4z6yv8MoqOp62csqrpk0AtgUcRF89pL+folpXFhs3bYB8N1
         ZENyy+Z37kiyoMC9mBBH7r7yO/+bYzbfBx/f/v6w8GS+F6Lm2cdONeNkhqh5qFRCb+YC
         2B70P5d0U9P1Fd4CGQhriEl91kMhFK3G7bRshOnxaTXN95E2ZxxlEiqkaeQLx39Mn+KT
         Jt4g==
X-Gm-Message-State: ANhLgQ1SLWC6sn6r4tbF3ETIZH0oPLuO4yrpZ2E8JPMXxQZsvthORcoM
        QvvF7OrieqmnJ3FwTZ8VIgczfA==
X-Google-Smtp-Source: ADFU+vsrko71GJpds8JWTZOPI/Bss4D55JUOGfbW49T37nOp5PajcVcX4yNMaZkER8KLlEAMPszwXw==
X-Received: by 2002:a17:902:6bc3:: with SMTP id m3mr4939350plt.27.1583357935128;
        Wed, 04 Mar 2020 13:38:55 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id d3sm28664532pfn.113.2020.03.04.13.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 13:38:54 -0800 (PST)
Date:   Wed, 4 Mar 2020 14:38:52 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, afd@ti.com, s-anna@ti.com,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv7 13/15] remoteproc/omap: Report device exceptions and
 trigger recovery
Message-ID: <20200304213852.GA2799@xps15>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-14-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221101936.16833-14-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Feb 21, 2020 at 12:19:34PM +0200, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> The OMAP remote processors send a special mailbox message
> (RP_MBOX_CRASH) when they crash and detect an internal device
> exception.
> 
> Add support to the mailbox handling function upon detection of
> this special message to report this crash to the remoteproc core.
> The remoteproc core can trigger a recovery using the prevailing
> recovery mechanism, already in use for MMU Fault recovery.
> 
> Co-developed-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
> Signed-off-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  drivers/remoteproc/omap_remoteproc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 1ac270df4d66..7dcb5da0d940 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -383,8 +383,12 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
>  
>  	switch (msg) {
>  	case RP_MBOX_CRASH:
> -		/* just log this for now. later, we'll also do recovery */
> +		/*
> +		 * remoteproc detected an exception, notify the rproc core.
> +		 * The remoteproc core will handle the recovery.
> +		 */
>  		dev_err(dev, "omap rproc %s crashed\n", name);
> +		rproc_report_crash(oproc->rproc, RPROC_FATAL_ERROR);
>  		break;
>  	case RP_MBOX_ECHO_REPLY:
>  		dev_info(dev, "received echo reply from %s\n", name);
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
