Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1CACAA41F
	for <lists+linux-remoteproc@lfdr.de>; Thu,  5 Sep 2019 15:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388399AbfIENPG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 5 Sep 2019 09:15:06 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33357 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388379AbfIENPB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Sep 2019 09:15:01 -0400
Received: by mail-lf1-f68.google.com with SMTP id d10so2019858lfi.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Sep 2019 06:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X6liaIL8n/K+qZNHyRxBvsG3aE56VnalzfSINEJsXSQ=;
        b=b+63NMLiO6uu9ngd3jzIr8Dsw188HJm9sNb07rlJMnX80r7/h5LUN3/Lpbh3bxpJ9z
         xYJqjXXgagt+VDuvA3yKvH7qp7A2+W1iv5h1mRb24Jb2adl7EuLWgyNX1JPnrepTNa9Q
         goCuPYhfmvTDmiz0qWuVckEjqgfqRDoltmXHgdBIf8vad80BD+OtqWFql1CSBxLD7jDL
         PWs9E6CwQdu80zJAOHSJX+PJNszKu0Zwaywda1OI5fC9bc/t0il8d+aa4SI03VA65BG0
         pqsIykPn5ko3cJwLwAXbf0ErZ98Dsu+DqnGqOb8fcfaBo5zLC2Uk4FyM9xYDgLnBUVyl
         HiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X6liaIL8n/K+qZNHyRxBvsG3aE56VnalzfSINEJsXSQ=;
        b=c8b7rPVVzonbnTVQnmzIpmCAVTlj2SFizP93Z7dgisxvRSHa71fTc3IZZvq4zg2F2j
         fbEC0sfvsKx8hV6xERgboUP6ocP+Dhu3CaqP4FFBGEWpNLhmCh1u10oNRXtrXAk45Eu7
         MlfzZlqV1NdE+1rHU9A3KoAVri4NMEamkQU6gX4umH/bYSXF5+TyNcTyLZF626Ihj7ID
         5flUsOnTE6i1bKXAeTjaSxE8C9Uu15G1GnJq/PPYkHDQGaUvNKLmNyWpFT9jZcW/jZ0/
         lEBS9Qz6a4LJ1eN9z1F1P5sT2kMEWEMBPS4mGDeuFUQ9/0c96mR+UVTZVb1J4nbgVtxs
         RYNw==
X-Gm-Message-State: APjAAAWCPddDwTn4BquoLiqOLV+rDN5e3/RcZQejYC9NoyN8tQVG3+Z2
        tEOHY7h4+aUY0YoKjTFFFKR6CA==
X-Google-Smtp-Source: APXvYqzbCMnjO//eiTEa0kZuQw26H3btOjLN9fQPzx/MdOvkhMnN7oM0V3sFQZMv6aa2tmtB3chimQ==
X-Received: by 2002:a19:4912:: with SMTP id w18mr2283793lfa.93.1567689298714;
        Thu, 05 Sep 2019 06:14:58 -0700 (PDT)
Received: from centauri (ua-84-219-138-247.bbcust.telenor.se. [84.219.138.247])
        by smtp.gmail.com with ESMTPSA id b25sm486140lfa.90.2019.09.05.06.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 06:14:58 -0700 (PDT)
Date:   Thu, 5 Sep 2019 15:14:56 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] rpmsg: glink-smem: Name the edge based on parent
 remoteproc
Message-ID: <20190905131456.GA26674@centauri>
References: <20190820041656.17197-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820041656.17197-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Aug 19, 2019 at 09:16:56PM -0700, Bjorn Andersson wrote:
> Naming the glink edge device on the parent of_node short name causes
> collisions when multiple remoteproc instances with only different unit
> address are described on the platform_bus in DeviceTree.
> 
> Base the edge's name on the parent remoteproc's name instead, to ensure
> that it's unique.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/rpmsg/qcom_glink_smem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index 64a5ce324c7f..4238383d8685 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -201,7 +201,7 @@ struct qcom_glink *qcom_glink_smem_register(struct device *parent,
>  	dev->parent = parent;
>  	dev->of_node = node;
>  	dev->release = qcom_glink_smem_release;
> -	dev_set_name(dev, "%pOFn:%pOFn", node->parent, node);
> +	dev_set_name(dev, "%s:%pOFn", dev_name(parent->parent), node);
>  	ret = device_register(dev);
>  	if (ret) {
>  		pr_err("failed to register glink edge\n");
> -- 
> 2.18.0
> 

Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
