Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 970BBAA102
	for <lists+linux-remoteproc@lfdr.de>; Thu,  5 Sep 2019 13:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732224AbfIELN6 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 5 Sep 2019 07:13:58 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40555 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732130AbfIELN6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Sep 2019 07:13:58 -0400
Received: by mail-lj1-f194.google.com with SMTP id 7so2011774ljw.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Sep 2019 04:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hVb3OF8Z1yUcAp1EC0wGieEJY1VYhAGYv9dxmBhAdNQ=;
        b=CMd3yrldzyge7k1rGSlqrfxb2zyzXCZwifzGp2sdva/Ug31rtuPMdg/1TiF5qOiVuL
         PA01RD4IEPI00S+jUUCtOPABJ1+BBQeQAbNm5pFqEv9b57m4v/RIiB+DAsniDmQNBiZI
         ezvZ4uJu8v+gvFA2/nQYV0T6uTETR7SknY13uZq7IOFbqBNzlb+XSH/ZAQLDP7NEOozI
         LfM5E3yXJTmpz7scocKK4yBK6Ekk7R/DJzUUqBlwQKPeyStYzvudfR2t7H7M8iaPW53K
         SbTtOB0rH2F44WrKIzvL0t5JPZo2VOKaoT7sLKZpb7FNJ6tkqmI6JfnRPsXU3ON9XheT
         XRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hVb3OF8Z1yUcAp1EC0wGieEJY1VYhAGYv9dxmBhAdNQ=;
        b=SEWOSNlvZJ02wB1tX2Bh58GNcD5J/sBaqt/TiiInNczSmw4NIFYCul0bhdwnOguPso
         +qGm8y7KuoVjXHJQFQcDi2aEJ3DrhTte751ZUOX8DYRVP4tbqSdTAUoJ2SLD6ouuv32n
         8Gtmc1gHEXxd4QlL7K13J5DTv9VoTAj6NSW3dxieC8wgLHyjgLig2w+JbNwNJ4oa8PMU
         /dHdalp/pGUFPFSuLHimY05c9GcO6H4SaELjywq4thr5o5EhEzX0r0UriP42tuBav1i4
         4AhBi8YQOUVqHwcbAtovTofmsUO0aEzXdCkKP9+dxf6R3BYMXmxzzEfZOuM9J5sYnSt8
         /hcQ==
X-Gm-Message-State: APjAAAXjjBSRxcvdrIQcallQjysDW/laUZvoobbmCla+HgmuO09iSa8X
        9rCRoemIdUIwDuoP7LsHSRX0Fw==
X-Google-Smtp-Source: APXvYqzhi25MQJx4FepzPT+vyEF5/SUZT0BCOG1lmKkN8q2WaXy7ytL75H31vK5Qawvs8R3VY1Qz0A==
X-Received: by 2002:a2e:90c6:: with SMTP id o6mr1700683ljg.144.1567682036461;
        Thu, 05 Sep 2019 04:13:56 -0700 (PDT)
Received: from centauri (ua-84-219-138-247.bbcust.telenor.se. [84.219.138.247])
        by smtp.gmail.com with ESMTPSA id m18sm379548lfb.73.2019.09.05.04.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 04:13:55 -0700 (PDT)
Date:   Thu, 5 Sep 2019 13:13:53 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] rpmsg: glink-smem: Name the edge based on parent
 remoteproc
Message-ID: <20190905111353.GA1936@centauri>
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

This was sent 19 of August, then again (unchanged) on 29 of August.

Yet it is still not in linux-next.
It fixes a real issue on qcs404, so please merge :)


Kind regards,
Niklas

