Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3344BF887A
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 Nov 2019 07:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbfKLG0r (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 12 Nov 2019 01:26:47 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33324 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbfKLG0r (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Nov 2019 01:26:47 -0500
Received: by mail-pf1-f196.google.com with SMTP id c184so12652865pfb.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Nov 2019 22:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=29y54PPjXheeJnkAIV+/9rtCAbjMmayyj5shoryCFWs=;
        b=EUSRVio++bqwLyCrsbzAnGBh+zpVum1h4Tx8yIalq0oP530ikl+eefPueFj2aIvjQP
         YpqB4V8LclH6h22+a4HR0SgbMnpd1xgyzo/2z5q2T89kO235UZ0XrLYCZ/eFCBe2ycoO
         ZtHpc/+9n0bkfGbVB/DeTGjK9xfv9l247CvRf889HW5D53/09CFma2T5mi1QsBwcPz1q
         8MOPhtL7orrl1a41RSkrk6p5mX0EV3m/TFBYxWe8HcSvG8Vl7vUFgzj3GxhvAf9r6qz3
         t7aqg7wCrrkaDI+5kheSEhjvb177U+9R/ahpqEWgnk4G2wLXUHPSZ5qG8VILN9Lx/Y2K
         dZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=29y54PPjXheeJnkAIV+/9rtCAbjMmayyj5shoryCFWs=;
        b=jJx2uU+LtOCXT+snM/G/AhOnc220IlEVTo2qmBOkTpkqq1lgTmvd4zXeQM1YxbezBD
         zDgzEvSvSibCSUFABJpTL5NrEXCEA1lo4dR5TOXQdRcjgKc6zypRz6fT/3TfQiYNQij7
         U2WrHFmTRfLUmZcZLKFKmCPurd5bgKOR0wkXGdZ+t6bAgmpEu3St9AxfqkV+7rRpJy+F
         JDgfv3s7bB/0PUXO2IDfKJkX3H32uxaWZgfVVErjO2RxG93HzAXb5Wn47e53e4XM3CUK
         RCDM0MIt9WbMPuWZ0iw4GyYTrstmI4uQ5C3zjM5N7+4JVWJabkZuTFrZe88gylQ1D9Dg
         /R6A==
X-Gm-Message-State: APjAAAXPpI/+AoFfW6tB8ogC9+PT8VZHIJvLUSKVZ8VdVn4eejVce1I+
        kM+DmK6vKshMXMGxMCTDUwQVvg==
X-Google-Smtp-Source: APXvYqw8NSYCabsNjDVxITf+aai970UaPE8g9uaB51GTRrRgTmGQbTE8GazIEwa9XdAJeWtrwnOAmQ==
X-Received: by 2002:a62:7dd2:: with SMTP id y201mr35491160pfc.90.1573540005185;
        Mon, 11 Nov 2019 22:26:45 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b1sm1285492pjw.19.2019.11.11.22.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 22:26:44 -0800 (PST)
Date:   Mon, 11 Nov 2019 22:26:42 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        s-anna@ti.com
Subject: Re: [PATCH 15/17] remoteproc/omap: report device exceptions and
 trigger recovery
Message-ID: <20191112062642.GP3108315@builder>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-16-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028124238.19224-16-t-kristo@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:

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
> Signed-off-by: Subramaniam Chanderashekarapuram <subramaniam.ca@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>

You're missing a Co-developed-by

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/remoteproc/omap_remoteproc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 8bd415c8fc86..6f797025bb6b 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -360,8 +360,12 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
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
