Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C33CF83B4
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 Nov 2019 00:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbfKKXjX (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 11 Nov 2019 18:39:23 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37192 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfKKXjW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Nov 2019 18:39:22 -0500
Received: by mail-pl1-f194.google.com with SMTP id bb5so185450plb.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Nov 2019 15:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sErsJ0ZhudbfRpAYwJDEmRpwsxMH+bye+7/YvAD+etw=;
        b=hXWWXrS60/qxiY6+onkC7XyAOKmoX074R8QgIvUJjZkHbcUErSEEakdF5RPuEFDEW/
         bC8r4DVzDBaJ0Wz4aMmRvfnJFguB2MUskYTtxPATJeIgXtywKP1XeCfDLyiO1dbt1dtc
         kk5hpCS/gYNOaYs9AOIjprrWeqhKxj5AdbvWh21qfb1PAHOUJ7kk4LU02pYtm6H/a5a0
         PwzPjTlx9x/kT3lPlKuDrHfXD+COx+pHlksunanCPuoVm1NlcwrBiJFpilNIfRwfx0HU
         4mVywu59H3zKXGQXSdJnxCwLovab4TZCaxSrHiNfHR7IuX87acYllkqAnY1Qa6JvyVGA
         RykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sErsJ0ZhudbfRpAYwJDEmRpwsxMH+bye+7/YvAD+etw=;
        b=CE/tlkH7BCq4rgAx46x0AMZEG2S+69AN1hM6i4JpyGIPsk550+P8NE69mqpVn7Vkff
         qQ1tfLddA03XwHLtE1dOhPhYbqf0hHt/2Gp3ViqPa82J/q3iYrBczU5ISnAxebxaOdTF
         6NEgP4DrF+LwTjf6UCZbwrFmNK4ZuENqmZ9GbnlcI4FawVmzjaVY+gbHM+snPqS38Sfq
         JHi5gXw2Y87Zl2wA7yGsOwIJmhW5elyHWDICB8Fryr4Mj7Bv0f3SpU1HFN8qPqMkFfZe
         arhsBgIRRnD5kd0kikIGFz+oDQkH2oJah6KRjfn23+GNxM5h0GZpZQ93N7tt4WQtbuae
         h23Q==
X-Gm-Message-State: APjAAAUnDXSSsUs3y2YGbptkS7rDhngYb2tQ5eB+8ggKjyJDYt4Xsymd
        0wbXLXycC1fvS4mGCOBPZjydq8LBQco=
X-Google-Smtp-Source: APXvYqzRz3CUMhtim0beTLP4wGxk4PX9LoOj6oyLMTKQtrShP9NmwM6Zhd80Wm9YTi4IN5NGVZTf4Q==
X-Received: by 2002:a17:902:8348:: with SMTP id z8mr9310686pln.57.1573515561985;
        Mon, 11 Nov 2019 15:39:21 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z2sm14480053pgo.13.2019.11.11.15.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 15:39:21 -0800 (PST)
Date:   Mon, 11 Nov 2019 15:39:19 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        s-anna@ti.com
Subject: Re: [PATCH 11/17] remoteproc/omap: Check for undefined mailbox
 messages
Message-ID: <20191111233919.GM3108315@builder>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-12-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028124238.19224-12-t-kristo@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:

> From: Suman Anna <s-anna@ti.com>
> 
> Add some checks in the mailbox callback function to limit
> any processing in the mailbox callback function to only
> certain currently valid messages, and drop all the remaining
> messages. A debug message is added to print any such invalid
> messages when the appropriate trace control is enabled.
> 
> Signed-off-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>

This should either have a "Co-developed-by" or Suman should be the first
one.

> Signed-off-by: Tero Kristo <t-kristo@ti.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/remoteproc/omap_remoteproc.c | 6 ++++++
>  drivers/remoteproc/omap_remoteproc.h | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index e46bb4c790d7..016d5beda195 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -124,6 +124,12 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
>  		dev_info(dev, "received echo reply from %s\n", name);
>  		break;
>  	default:
> +		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
> +			return;
> +		if (msg > oproc->rproc->max_notifyid) {
> +			dev_dbg(dev, "dropping unknown message 0x%x", msg);
> +			return;
> +		}
>  		/* msg contains the index of the triggered vring */
>  		if (rproc_vq_interrupt(oproc->rproc, msg) == IRQ_NONE)
>  			dev_dbg(dev, "no message was found in vqid %d\n", msg);
> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
> index 1e6fef753c4f..18f522617683 100644
> --- a/drivers/remoteproc/omap_remoteproc.h
> +++ b/drivers/remoteproc/omap_remoteproc.h
> @@ -31,6 +31,12 @@
>   *
>   * @RP_MBOX_ABORT_REQUEST: a "please crash" request, used for testing the
>   * recovery mechanism (to some extent).
> + *
> + * Introduce new message definitions if any here.
> + *
> + * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
> + * This should be the last definition.
> + *
>   */
>  enum omap_rp_mbox_messages {
>  	RP_MBOX_READY		= 0xFFFFFF00,
> @@ -39,6 +45,7 @@ enum omap_rp_mbox_messages {
>  	RP_MBOX_ECHO_REQUEST	= 0xFFFFFF03,
>  	RP_MBOX_ECHO_REPLY	= 0xFFFFFF04,
>  	RP_MBOX_ABORT_REQUEST	= 0xFFFFFF05,
> +	RP_MBOX_END_MSG		= 0xFFFFFF06,
>  };
>  
>  #endif /* _OMAP_RPMSG_H */
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
