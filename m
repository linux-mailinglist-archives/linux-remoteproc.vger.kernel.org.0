Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14EBA1448C9
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 Jan 2020 01:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbgAVAPT (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 21 Jan 2020 19:15:19 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36610 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbgAVAPT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Jan 2020 19:15:19 -0500
Received: by mail-pf1-f195.google.com with SMTP id x184so2369525pfb.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jan 2020 16:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ij5FCD+uLvTnsp5ctxAUXBbDSBnVCtTaib+JJQmxzQo=;
        b=Wq1IealQ86GiAj8sMbJmbgbhDqbwW+SfXsKEEX9Bx0lw5o6GWpC3DC2zgrBfMt9f5r
         imFXlLCbKnwWQ88in8PJNNH44+U50VCIxyGRpPaHrJJs4K8evYdX82rAlWhkk5/VnnYy
         1gLk8XrmEi1os+BdqmVRJPu6gwtKzGM0WOm2JeqGV01N4A+D4fdsZhy40q7kcogtR1Ks
         BSsolGx4N3Uwrrao+N204W+EqBxmBrXSYD5CmG5WBKaZwKgYQFYqrSU0Sqtu2LSOk+DL
         lgkZIEPaVVaeHWWvYqp2wA1Yi9o/YPjwEZubyDbzarh8Sz4OVhktgSfb71veYMnuA1Tw
         x5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ij5FCD+uLvTnsp5ctxAUXBbDSBnVCtTaib+JJQmxzQo=;
        b=Tf06Iowbv3uVs8bsCnbbWe1hvL1UplPNZRwMG56r2ssYMSO1Wkr38hZ82GkUIpLiwp
         a4SKrIDfdBz1hsbtKF199B1OCuEhbJ8O1Xvc95GWDJx++UzekSxTr07kkjiNC96py6ja
         8mZ2h3UmRxmUUcBLrQ6aNwY3WFQJ9V0anUKfkh/w2oDOI3ntke8TEIy/znvchRQrehOt
         +t+whbXQgEBTDhiCjW1eWT3cUPXNDf2vPEDcXzfYdhP/j3JQzZDq8XpI7HYDvm4M42m6
         ui2Oatpnz1K+v6ggyqP+Vbx3LtgErV5ywQzhubS+YV1IgwORq2CCpxoQlNm0yO+zNiWc
         gpbQ==
X-Gm-Message-State: APjAAAXpwY2UXTlfJhGN700wLg0r/9d14PGzrgI4lsRfAHHbgGu5j5s2
        9a8kHh7Bw/YfaqSYJM8lSLvCx1Vb2JQ=
X-Google-Smtp-Source: APXvYqxORiLtvDwxP9mURJXog994SpNhD1/dDL9io/4URQ4OWDATHRUiX+V3a8ZA8x4kKJdxD0fMrA==
X-Received: by 2002:a63:447:: with SMTP id 68mr8479452pge.364.1579652118370;
        Tue, 21 Jan 2020 16:15:18 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j20sm44100089pfe.168.2020.01.21.16.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 16:15:17 -0800 (PST)
Date:   Tue, 21 Jan 2020 16:15:15 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Baolin Wang <baolin.wang7@gmail.com>
Cc:     ohad@wizery.com, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 3/3] hwspinlock: omap: Use
 devm_hwspin_lock_register() to register hwlock controller
Message-ID: <20200122001515.GA14744@builder>
References: <cover.1578453062.git.baolin.wang7@gmail.com>
 <315adcc5dfc6aa5c001448401dda4065e33deef2.1578453062.git.baolin.wang7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <315adcc5dfc6aa5c001448401dda4065e33deef2.1578453062.git.baolin.wang7@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 07 Jan 19:14 PST 2020, Baolin Wang wrote:

> Use devm_hwspin_lock_register() to register the hwlock controller instead of
> unregistering the hwlock controller explicitly when removing the device.
> 
> Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
> ---
>  drivers/hwspinlock/omap_hwspinlock.c |   13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
> index 3b05560..9e8a8c2 100644
> --- a/drivers/hwspinlock/omap_hwspinlock.c
> +++ b/drivers/hwspinlock/omap_hwspinlock.c
> @@ -131,8 +131,8 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
>  	for (i = 0, hwlock = &bank->lock[0]; i < num_locks; i++, hwlock++)
>  		hwlock->priv = io_base + LOCK_BASE_OFFSET + sizeof(u32) * i;
>  
> -	ret = hwspin_lock_register(bank, &pdev->dev, &omap_hwspinlock_ops,
> -						base_id, num_locks);
> +	ret = devm_hwspin_lock_register(&pdev->dev, bank, &omap_hwspinlock_ops,
> +					base_id, num_locks);
>  	if (ret)
>  		goto runtime_err;
>  
> @@ -148,15 +148,6 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
>  
>  static int omap_hwspinlock_remove(struct platform_device *pdev)
>  {
> -	struct hwspinlock_device *bank = platform_get_drvdata(pdev);
> -	int ret;
> -
> -	ret = hwspin_lock_unregister(bank);
> -	if (ret) {
> -		dev_err(&pdev->dev, "%s failed: %d\n", __func__, ret);
> -		return ret;
> -	}
> -

Relying on devm_hwspin_lock_register() to hwspin_lock_unregister() will
mean that pm_runtime_disable() will now be called before the spinlocks
are unregistered.

Regards,
Bjorn

>  	pm_runtime_disable(&pdev->dev);
>  
>  	return 0;
> -- 
> 1.7.9.5
> 
