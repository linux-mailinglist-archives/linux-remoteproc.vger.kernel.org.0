Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9D2F8867
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 Nov 2019 07:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbfKLGPk (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 12 Nov 2019 01:15:40 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43478 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfKLGPk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Nov 2019 01:15:40 -0500
Received: by mail-pf1-f196.google.com with SMTP id 3so12569899pfb.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Nov 2019 22:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rRZ0BJA4db3dS/zIFjnsF9DDaNs4fUNGpbTkNxgU/oY=;
        b=Sqe3U+OI365237Ez4qw9i8BXSixdFMZDIkIXMueMovlj/9LaVsZzg7bJKpZuiNvifO
         itI9orDHmxJhQb+AkqEDVwrGGgFYLoyMQMrU6MfYjRGaU3gLvPk2LZEMF/Bpg3i1fw4A
         EVWhs2MFSpL3zDdGOVvUvjcaZltQUaBwE39vmfCoWv9hK4sI5TCtO99RFDvo2RcCBRd4
         4CWo3vnyvkfPXm04f334UvO+mMZYj/98IWoFPTq8kK66Fr9U+L63coxyCjq5WaKQ++0q
         pD1FA6YOy2qhIAh/SO419nIwFFhc/x8YV4BuKRUfu9xeYO6Lr4wmw2wWAhAomQ9kuVUy
         OJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rRZ0BJA4db3dS/zIFjnsF9DDaNs4fUNGpbTkNxgU/oY=;
        b=J09n0lu7RmDaAxld3MQoLccEime4AE4j5lAifcw9vjw7xACmFjVZN5GZMIonde0MZl
         MQgI1I5sYxOf1rSt60wQY0opgava1JIaWWFjTu99VrbPWrIM+3yjflRgabVwzQ2kyksm
         Glkub5gQbjrYMiZ/LOs8kMlnaSCIrg7R55Oyw177Q9Lu1rm4JmgK5jOAqRyX17beQ66p
         iy04jsDjonBsU2GXlZ6JnsxiUR3Ewtzs43897d2ApQUx3ThEv1LlhVyu0qPWHaycb9ui
         qA6YjzzyXBe/SGHImTmKGbCLJ6cw0S4GOjz2urCUtMOj7/Vg5mhoAoEqhjQKZxOs0v8E
         gXoQ==
X-Gm-Message-State: APjAAAV9cnXmSum8acZemXobc2Jr8yf7BZBdTAv5cKDgcUgDi36DYooR
        S/UE1a++Y/GNTUUUmFJudm2/Ow==
X-Google-Smtp-Source: APXvYqzHPxtYdORBo2xTI6Mtm8MV25+2WYGZWhuxsi/Es2clwrCLIRN1jFgfuGE7IrMqR2cV663fEw==
X-Received: by 2002:a17:90a:5d04:: with SMTP id s4mr3991747pji.137.1573539339521;
        Mon, 11 Nov 2019 22:15:39 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x203sm18749498pgx.61.2019.11.11.22.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 22:15:38 -0800 (PST)
Date:   Mon, 11 Nov 2019 22:15:36 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        s-anna@ti.com
Subject: Re: [PATCH 13/17] remoteproc/omap: add support for system
 suspend/resume
Message-ID: <20191112061536.GO3108315@builder>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-14-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028124238.19224-14-t-kristo@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
[..]
> +static int _omap_rproc_suspend(struct rproc *rproc)

I think it would make sense to inline this and _omap_rproc_resume() in
their single call sites.

[..]
> +static int _omap_rproc_resume(struct rproc *rproc)
> +{
[..]
> @@ -806,6 +972,14 @@ static int omap_rproc_probe(struct platform_device *pdev)
>  			oproc->num_timers);
>  	}
>  
> +	init_completion(&oproc->pm_comp);
> +
> +	oproc->fck = of_clk_get(np, 0);

devm_clk_get() ? 

Otherwise I think you're lacking a clk_put() in omap_rproc_remove()

Regards,
Bjorn
