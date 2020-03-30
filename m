Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8927198731
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 00:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728987AbgC3WNn (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 18:13:43 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:32785 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729139AbgC3WNn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 18:13:43 -0400
Received: by mail-pl1-f196.google.com with SMTP id g18so7329381plq.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2020 15:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=08rQs//ODvt7KiR3EZqxVq1yMbI+NkTP2UlfYy031ow=;
        b=ep4cwmexueRwdEOhd3IlGYnx8BvGJ8Dt8/y6GoOBmiKy6RqVhxYf+u7yyklBxTz1MU
         F6p0FoiE1Ctui8aSaeOMFmtgyKFR5kEd5pmu6aodyaZGLUmZPPlhhLQ85I2X6mZsnrap
         yuOkkrDkDkNHUpXgaaKTsoWrd1h5s9GrH2eopuymPSwPUp3zMenGalQXwJ7OTAHCcyKd
         5hF3tHyv4O39fMPJ6IamtTyckPVM+0lAYX+GrGgtJDFH7zrTACZ2hhRwoHgDd/dtXsAK
         BuFi9SHD3irHOgfSsvntDxdTe84t3kdH29hRO40RfWcgIZnr/59fWoUzBKFIFohCsgFY
         3r+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=08rQs//ODvt7KiR3EZqxVq1yMbI+NkTP2UlfYy031ow=;
        b=N3tpjWHGPkvih+3eFQrEvEIgQY3H04Foo7whxtn9GrsfOckuCNzPdYp4lGjdm4UrKv
         AakUcFfVgHitiGbYQgw/mx9MM9O0iJxmE0G1PbSwa8GOouW8HC39rL8vCoyDtzjBFbyo
         FddwTfR7NAJYd19cCaQqhoKGBehKJkVOGG87WPlOY/TnizIC/Be9guCMoEXMYdo7hzaP
         EHekeuGJa0ID/CGAJeXUDkmnP471/7TtMlrez9Idd1Y4LLNFCc4mOV117vf4gAFHj6EK
         I3Yg1VMGZcFkHpnpSobtzq9aNat+SnvhZ50myZe+YqjO3oYwxWsMJnBr4K9QzCzb3XRg
         8BgQ==
X-Gm-Message-State: AGi0PubMFNUFe54IwgJok5FZ+w9JXCLJUppGewbC8uFFOeeZItW/Wj+0
        WIpLeicJF6YaJF8KOXksDa0EHH448Qc=
X-Google-Smtp-Source: APiQypLmfzG9nw/NNSDnWJ5qkMefxTLnX7QEPv0riiq6IUGUpBztSs5cZstIBu8jWRZMT1WklfTicA==
X-Received: by 2002:a17:90a:db02:: with SMTP id g2mr277462pjv.15.1585606421119;
        Mon, 30 Mar 2020 15:13:41 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x188sm11252546pfx.198.2020.03.30.15.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 15:13:40 -0700 (PDT)
Date:   Mon, 30 Mar 2020 16:13:38 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        bjorn.andersson@linaro.org, ohad@wizery.com,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH 2/2] remoteproc: core: Register the character device
 interface
Message-ID: <20200330221338.GB17782@xps15>
References: <1585241440-7572-1-git-send-email-rishabhb@codeaurora.org>
 <1585241440-7572-3-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585241440-7572-3-git-send-email-rishabhb@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Mar 26, 2020 at 09:50:40AM -0700, Rishabh Bhatnagar wrote:
> Add the character device during rproc_add. This would create
> a character device node at /dev/subsys_<rproc_name>. Userspace
> applications can interact with the remote processor using this
> interface rather than using sysfs node. To distinguish between
> different remote processor nodes the device name has been changed
> to include the rproc name appended to "rproc_" string.
> 
> Change-Id: I2114f77f8d2b5fd97e281021ec9905ef5c2fb54c
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 097f33e..f657983 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1907,6 +1907,12 @@ int rproc_add(struct rproc *rproc)
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
> +	ret = rproc_char_device_add(rproc);
> +	if (ret) {
> +		pr_err("error while adding character device\n");
> +		return ret;
> +	}
> +
>  	ret = device_add(dev);
>  	if (ret < 0)
>  		return ret;
> @@ -2044,7 +2050,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  		return NULL;
>  	}
>  
> -	dev_set_name(&rproc->dev, "remoteproc%d", rproc->index);
> +	dev_set_name(&rproc->dev, "rproc_%s", rproc->name);

Unfortunately you can't do that. The name of the remoteproc in sysfs is visible
by users and a lot of scripts will fail because of this change.

>  
>  	atomic_set(&rproc->power, 0);
>  
> @@ -2220,6 +2226,7 @@ static int __init remoteproc_init(void)
>  {
>  	rproc_init_sysfs();
>  	rproc_init_debugfs();
> +	rproc_init_cdev();
>  
>  	return 0;
>  }
> @@ -2231,6 +2238,7 @@ static void __exit remoteproc_exit(void)
>  
>  	rproc_exit_debugfs();
>  	rproc_exit_sysfs();
> +	rproc_exit_cdev();
>  }
>  module_exit(remoteproc_exit);
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
