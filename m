Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68FA2CDA28
	for <lists+linux-remoteproc@lfdr.de>; Thu,  3 Dec 2020 16:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgLCPeV (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 3 Dec 2020 10:34:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgLCPeV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 3 Dec 2020 10:34:21 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF03C061A4E
        for <linux-remoteproc@vger.kernel.org>; Thu,  3 Dec 2020 07:33:41 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id f14so1289261pju.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Dec 2020 07:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gd//BVtbrF5fIQYuVuMwSd46+y/wcSCEQb7Z0473XMQ=;
        b=barcV+xgeUTsOnM6H6n031a9IlXxNTl0S6RqfKjbbP8/OMSvhfZ5nbC8mKY19XarkF
         RUXmSEOXyT9ewEFxzXYZpbgUjJugYzW3MjXPKFTvmxdUIMT1tOZ3JTlVs6XB5V6yAuKT
         9+6A1KQnNFrscfbLxkG7Xy/JnKywHrGPnGRmuQSquceIwz3W6okYcRqxT342rvZfP0/0
         y7k7evIrMW1+4a8IO7eLnCW7lT/KAUMyqKUTzvzU1vJbIyXWdUup8qyMlH8SYpnNWE/L
         DlP2vDZ0w8K43M8aUnsuJzyuvp4aFaDnLbg5LgOqqhH6FCMWXgXhNG/sqPSZ0FDoeFOw
         mnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gd//BVtbrF5fIQYuVuMwSd46+y/wcSCEQb7Z0473XMQ=;
        b=c8zk0L3nm4GTdTZ3dbG4OKDxISTnJvfWBKrVFDQdOY+Uco3c+OpDSy6C7qmPbPL74Y
         lAnkz3Zjp7WizAufLgDy4xPl8bo9g5csqb7+S80dIGLvUbEQQesYjgTsbHxejaJCgjNr
         73qoFJCuyKHq9ldCseC4ElP/An+esUNuHKpdkNh+0ZMWs0PRPiXJeAbKB1Gt/9PiOXTo
         uznijG8KsALM90/qziJkEo4HnRjlzZWCc8fvozoM4bPneaLCxWPGSKQAFVWVRYEZqc9+
         leWH5B4d061kDSFPSkmBh8l54sXT2Gz/q4y5AN0yrXkJQgmZRqHFguf4EIFUrcXr0EEK
         zRrg==
X-Gm-Message-State: AOAM530Kt8iO3SaPoCf6trroKmnKhCRPkfj6s/eMc8oxjBBNiRRfXGjd
        PQ70w3RiTf5gF4ocee2UKLNZ0Q==
X-Google-Smtp-Source: ABdhPJxyvFQey/fKSX93EFbjSsCaaXfm5uiD2gx3x4OYLyzPU7Hjt40N+4uhu6X3HkQycL4HvmobcA==
X-Received: by 2002:a17:902:c401:b029:da:6fa4:d208 with SMTP id k1-20020a170902c401b02900da6fa4d208mr3561055plk.33.1607009620776;
        Thu, 03 Dec 2020 07:33:40 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x26sm2117436pfn.46.2020.12.03.07.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:33:40 -0800 (PST)
Date:   Thu, 3 Dec 2020 08:33:38 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, pihsun@chromium.org
Subject: Re: [PATCH v2] remoteproc/mediatek: unprepare clk if scp_before_load
 fails
Message-ID: <20201203153338.GA1386676@xps15>
References: <20201203030436.3583198-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203030436.3583198-1-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Dec 03, 2020 at 11:04:36AM +0800, Tzung-Bi Shih wrote:
> Fixes the error handling to unprepare clk if scp_before_load fails.
> 
> Fixes: fd0b6c1ff85a4 ("remoteproc/mediatek: Add support for mt8192 SCP")

https://elixir.bootlin.com/linux/v5.10-rc6/source/Documentation/process/submitting-patches.rst#L122

> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> Changes from v1[1]:
> - add "Fixes" tag
> - remove an unneeded change
> 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201202044537.2500497-1-tzungbi@google.com/
> 
>  drivers/remoteproc/mtk_scp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 5f42b9ce7185..5e5705fe35a8 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -350,9 +350,10 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  
>  	ret = scp->data->scp_before_load(scp);
>  	if (ret < 0)
> -		return ret;
> +		goto leave;
>  
>  	ret = scp_elf_load_segments(rproc, fw);
> +leave:
>  	clk_disable_unprepare(scp->clk);
>  
>  	return ret;
> -- 
> 2.29.2.454.gaff20da3a2-goog
> 
