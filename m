Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9FCCC7A2
	for <lists+linux-remoteproc@lfdr.de>; Sat,  5 Oct 2019 06:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbfJEELY (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 5 Oct 2019 00:11:24 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35839 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbfJEELY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 5 Oct 2019 00:11:24 -0400
Received: by mail-pl1-f195.google.com with SMTP id c3so2587143plo.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Oct 2019 21:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=t0KK5kDc3BGvKYa9NLsd7g6q4Th9UgAo7OcVPXPPYO4=;
        b=dqyMZ2FtDdESvf1uGmYhkStDK+KlEYZpOVgofMrfaOM4jUYKePjP9qYp3llBEX5UhS
         NySHtjJSP7Qpp7I2GGdFis+TE7L10nvOeImksy/suvcWAJeB9JhiwKP190GWrRr0eEa3
         5s91lgT4qdRXTaaKOTjLOmpxoiPJdpJAm7mxCHcPIAVaMkROMpCL656h9Al41tGZUU7e
         2PFkd9eGF4FnKxovQ0rHEG9xAzCNJBjyOyAu6b8vcE3l8E8GyYO9seW/vJJCa7U4dmtv
         Lisfe3A0yM6cd5Gjh8HhlP65jOXPdXHUv4Yw379hErm77/HVNVov22uDZJJrBzaLFzdW
         EEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=t0KK5kDc3BGvKYa9NLsd7g6q4Th9UgAo7OcVPXPPYO4=;
        b=d/1SfCR9jAd2ZCdkcz+/3L99Gqit5Q3b8qS4Fusf4v8pZj8E9uWusPU26EDWWbml6e
         sArPiTcFyX/MctreJa7fEMVwzPOSrqMeUSW3MQhNsuMoV3hPITPcbWAisPK5Yau8Pc/m
         f0TX8Om0OSWX70/pdBsHHPym4hIstbh+3yTKk9mxG9rap6ZKwy40KSbwZVLdPygT/qg4
         X0YaK3FpKDFWGmczKnU0zErv+ZNSMB6PX/10r7b2sw49kmn7wWyEvDFyfj7wvvNjd7rr
         qXZ/6x55gwAVQyT4gDQPl1JrrwnjS8rLKVgjl1HwDEsOaQTqkkbIKE6VIB4qtX/LpcmF
         Fu2A==
X-Gm-Message-State: APjAAAWaSkLnzYhsN0Jw6DlKI5/DUZnU3pB3AiLg4oJRH2z37cd0QAzN
        Ulvp9uKJNBFj+xp6Lc8H9F1VqA==
X-Google-Smtp-Source: APXvYqzJ5RoSNwhtxPC9J1Ys7yTYGq1XbNqiQf5PeMcJF90tciZpgcs207IUEEzj0IhsIGfGbX10kQ==
X-Received: by 2002:a17:902:be03:: with SMTP id r3mr17251748pls.99.1570248683083;
        Fri, 04 Oct 2019 21:11:23 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y15sm7989127pfp.111.2019.10.04.21.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 21:11:22 -0700 (PDT)
Date:   Fri, 4 Oct 2019 21:11:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     ohad@wizery.com, orsonzhai@gmail.com, zhang.lyra@gmail.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] hwspinlock: sprd: Use devm_hwspin_lock_register() to
 register hwlock controller
Message-ID: <20191005041120.GD5189@tuxbook-pro>
References: <cover.1569567749.git.baolin.wang@linaro.org>
 <e8f1db04571f62298c7a4f72be803b9b9974d12d.1569567749.git.baolin.wang@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8f1db04571f62298c7a4f72be803b9b9974d12d.1569567749.git.baolin.wang@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 27 Sep 00:10 PDT 2019, Baolin Wang wrote:

> Use devm_hwspin_lock_register() to register the hwlock controller instead of
> unregistering the hwlock controller explicitly when removing the device.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Thanks Baolin, series applied.

Regards,
Bjorn

> ---
>  drivers/hwspinlock/sprd_hwspinlock.c |    8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
> index e76c702..44d69db 100644
> --- a/drivers/hwspinlock/sprd_hwspinlock.c
> +++ b/drivers/hwspinlock/sprd_hwspinlock.c
> @@ -135,8 +135,9 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, sprd_hwlock);
>  	pm_runtime_enable(&pdev->dev);
>  
> -	ret = hwspin_lock_register(&sprd_hwlock->bank, &pdev->dev,
> -				   &sprd_hwspinlock_ops, 0, SPRD_HWLOCKS_NUM);
> +	ret = devm_hwspin_lock_register(&pdev->dev, &sprd_hwlock->bank,
> +					&sprd_hwspinlock_ops, 0,
> +					SPRD_HWLOCKS_NUM);
>  	if (ret) {
>  		pm_runtime_disable(&pdev->dev);
>  		return ret;
> @@ -147,9 +148,6 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
>  
>  static int sprd_hwspinlock_remove(struct platform_device *pdev)
>  {
> -	struct sprd_hwspinlock_dev *sprd_hwlock = platform_get_drvdata(pdev);
> -
> -	hwspin_lock_unregister(&sprd_hwlock->bank);
>  	pm_runtime_disable(&pdev->dev);
>  	return 0;
>  }
> -- 
> 1.7.9.5
> 
