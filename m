Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2031900B1
	for <lists+linux-remoteproc@lfdr.de>; Mon, 23 Mar 2020 22:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgCWVwJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 23 Mar 2020 17:52:09 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44869 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbgCWVwJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 Mar 2020 17:52:09 -0400
Received: by mail-pg1-f195.google.com with SMTP id 142so2658240pgf.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Mar 2020 14:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zzaojujfcls2hgFyVUn0hD1Rb+7tZyy+TgUJhbpUoN0=;
        b=tWTwtLciVWGSxsbK51pBsm7+vZ073MLGRYvTY2C4gVsjjvEfn14hy7mCtlIsWT+LvQ
         al5phEEv8sdIIHJnFOjBu5CNIfygJVjQbwKif/nBhzkXYzPt2NeARsXaQbO7sHjYl7Ho
         IyuMyLSDe76UZsuPAvnYEFVGKNVGSkygCw+8o5OXo9RGlOSzkscK/JydAc5DUTMZO83W
         03ohm0vE/DAPjcuZXljtjSbkdPHLTIyQmiBH6KTiDrfaisDWAPIrUN0bK7hUee01IuaS
         2vh5bPwOmBCgwlmBoPM7NeRT3ejSr2KPgaJ3H/+g6hW07PbV15/ZheZ3OF+7xCrlsE1Y
         pXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zzaojujfcls2hgFyVUn0hD1Rb+7tZyy+TgUJhbpUoN0=;
        b=fASbs5t8YFwIPrUE08oS2RVLBf9EvMeP7z9Zc68J820pwKkHkctDIlX0ikLttY9xFX
         2yPssl307nV2LSKB+Xz4z+cL+gEgSHYHgIDAwsWCwmGMnQuae3+TrP9uJYpYQMRvaGn7
         vFC5o2on6CnoOjQhjTi6NcuqIHVE65N1a+aaaHxJqk63X1KOYgnjgZSl5P3P4KHZTE8T
         xoAqY7DbCvPtwc5Wx6GBeNGN8vJ7LkbpzU3InLnB0cHUPbuejCu5BXWEB0M3D684CNgW
         LYSfTnFO0A+bRLZwrqjxtcspg9MrXtMmhYOw9U/X2EgBwgt6WJ0ul5TNTgifHvi2oY+K
         00Fg==
X-Gm-Message-State: ANhLgQ340EBJITAcGwkf6cRJYDU0D3Y3PMZ/ijuTmdBog6defLQDl9nZ
        CK2RR42HjdequXbj4ypscBqlJ3IA0kw=
X-Google-Smtp-Source: ADFU+vvmkqQHQNARe/Cfqm5giF+9fLK7xjtj+Kr/nmczELP2SRPVq3XmEvxUAYfyJp75b2PX8eQsiQ==
X-Received: by 2002:a63:ec50:: with SMTP id r16mr25369318pgj.274.1585000327853;
        Mon, 23 Mar 2020 14:52:07 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j12sm5499008pgs.0.2020.03.23.14.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 14:52:07 -0700 (PDT)
Date:   Mon, 23 Mar 2020 15:52:05 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] remoteproc: Traverse rproc_list under RCU read
 lock
Message-ID: <20200323215205.GA30464@xps15>
References: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
 <20200310063817.3344712-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310063817.3344712-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Mar 09, 2020 at 11:38:14PM -0700, Bjorn Andersson wrote:
> In order to be able to traverse the mostly read-only rproc_list without
> locking during panic migrate traversal to be done under rcu_read_lock().
> 
> Mutual exclusion for modifications of the list continues to be handled
> by the rproc_list_mutex and a synchronization point is added before
> releasing objects that are popped from the list.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Change v3:
> - New patch
> 
>  drivers/remoteproc/remoteproc_core.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 097f33e4f1f3..f0a77c30c6b1 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1854,8 +1854,8 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
>  	if (!np)
>  		return NULL;
>  
> -	mutex_lock(&rproc_list_mutex);
> -	list_for_each_entry(r, &rproc_list, node) {
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(r, &rproc_list, node) {
>  		if (r->dev.parent && r->dev.parent->of_node == np) {
>  			/* prevent underlying implementation from being removed */
>  			if (!try_module_get(r->dev.parent->driver->owner)) {
> @@ -1868,7 +1868,7 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
>  			break;
>  		}
>  	}
> -	mutex_unlock(&rproc_list_mutex);
> +	rcu_read_unlock();
>  
>  	of_node_put(np);
>  
> @@ -1925,7 +1925,7 @@ int rproc_add(struct rproc *rproc)
>  
>  	/* expose to rproc_get_by_phandle users */
>  	mutex_lock(&rproc_list_mutex);
> -	list_add(&rproc->node, &rproc_list);
> +	list_add_rcu(&rproc->node, &rproc_list);
>  	mutex_unlock(&rproc_list_mutex);
>  
>  	return 0;
> @@ -2140,9 +2140,12 @@ int rproc_del(struct rproc *rproc)
>  
>  	/* the rproc is downref'ed as soon as it's removed from the klist */
>  	mutex_lock(&rproc_list_mutex);
> -	list_del(&rproc->node);
> +	list_del_rcu(&rproc->node);
>  	mutex_unlock(&rproc_list_mutex);
>  
> +	/* Ensure that no readers of rproc_list are still active */
> +	synchronize_rcu();
> +

Please add linuc/rculist.h to include the RCU API.  With that:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	device_del(&rproc->dev);
>  
>  	return 0;
> -- 
> 2.24.0
> 
