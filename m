Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4015DF887D
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 Nov 2019 07:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfKLG2X (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 12 Nov 2019 01:28:23 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38853 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbfKLG2X (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Nov 2019 01:28:23 -0500
Received: by mail-pf1-f195.google.com with SMTP id c13so12613152pfp.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Nov 2019 22:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iAL+4Mb+bihLwcbbUJQManyIi0HMq8FS6irH7b5rRco=;
        b=HR9AGHyYy2UyvvEwb96MgtYOJsg0vdjPcRAqywN8KNqqP4V6g+ZSCV/WD941rThPYl
         MAiDAn47ObgTr175cJScgIpsBf9LZ8Bx5Jw4p5vr6HYg+i6En/TlpBsCZ05TjZTF3uQZ
         xK5JAmH3TUZV7KekreIkJWeTAj+xuor82PCZc7LGvb3RT4fKF9OkaRA4wONEvhuPMnNS
         Pi1qLSjmrTYGeu88D+mLRpoj3tmI8Bl+pai6mh2j8x32NyV2lfrb2b/NFo4a1+0ky8Bj
         BfRHNloJSBoe2UUSJwEigmR8hfUfgqNIY2feikVGqCvlUUI3osAyerOOkNPGXm2KFIMv
         ygkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iAL+4Mb+bihLwcbbUJQManyIi0HMq8FS6irH7b5rRco=;
        b=Ibaj7V0tqkVdy4JZLLE/ieHt052WWGJod0DO1RQHamysyoTTkmtHcy9f/tFiCzj7G/
         k5aUuzVBe5p3zDBU3knxaEIdwf5gf768MiPrOihauRqUtf3tsI1qYsnDj0JyYnzIa3va
         3qZaA3oyrGKSkp9aJDepPYlAkt/ZquDsr1AquBwYmGzcgQqrhN0liFefnlqAI1oABLmy
         zfDVn8JxYfiLOictDr2LjKQH9bhgbUL7FuOdFD0ZZP2oxHZCLWfU6QkdB4UOy+LYcn2I
         v8rvWYd4/JoXLj9nUpmXRt6F99CxW5BdRpP2TVMYOhwhJjvxx7tYS+ct2YOSwDFYzGgW
         Br+w==
X-Gm-Message-State: APjAAAVnFw4rEg+H0HrcZZzy0Ezw5u0GcHgRPXddjO3s6eL+O75+0TJy
        OjepyPsg4P39tJkT0f7GVK536UtKELU=
X-Google-Smtp-Source: APXvYqwTFvsGpfht34NVHjjcAtJ51bzZyaVTKPPTGApX4yc+88RyqobogAUQBkRncC4z2VMigW6V2w==
X-Received: by 2002:a63:cf45:: with SMTP id b5mr32848687pgj.36.1573540102283;
        Mon, 11 Nov 2019 22:28:22 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j14sm15828464pfi.168.2019.11.11.22.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 22:28:21 -0800 (PST)
Date:   Mon, 11 Nov 2019 22:28:19 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        s-anna@ti.com
Subject: Re: [PATCH 17/17] remoteproc/omap: fix auto-suspend failure warning
 during crashed state
Message-ID: <20191112062819.GQ3108315@builder>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-18-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028124238.19224-18-t-kristo@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:

> From: Suman Anna <s-anna@ti.com>
> 
> The runtime autosuspend on a OMAP remoteproc device is attempted when
> the suspend timer expires (autosuspend delay elapsed since the last
> time the device is busy). This is the normal autosuspend scenario
> for a device functioning normally. This timer can also expire during
> the debugging of a remoteproc crash when the remoteproc recovery is
> disabled. This is an invalid pre-condition though, so check for the
> RPROC_CRASHED state and bail out before the actual check for the
> RPROC_RUNNING state. The auto-suspend is also not re-attempted until
> the remoteproc is recovered and restored to normal functional state.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>

This should be folded back into the previous patch (which I have yet to
review).

Regards,
Bjorn

> ---
>  drivers/remoteproc/omap_remoteproc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 2eb05d7a4dec..1dfac82224f7 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -945,6 +945,11 @@ static int omap_rproc_runtime_suspend(struct device *dev)
>  	struct omap_rproc *oproc = rproc->priv;
>  	int ret;
>  
> +	if (rproc->state == RPROC_CRASHED) {
> +		dev_dbg(dev, "rproc cannot be runtime suspended when crashed!\n");
> +		return -EBUSY;
> +	}
> +
>  	if (WARN_ON(rproc->state != RPROC_RUNNING)) {
>  		dev_err(dev, "rproc cannot be runtime suspended when not running!\n");
>  		return -EBUSY;
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
