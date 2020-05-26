Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94F5419B698
	for <lists+linux-remoteproc@lfdr.de>; Wed,  1 Apr 2020 21:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732554AbgDATwP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 1 Apr 2020 15:52:15 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45234 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732337AbgDATwP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Apr 2020 15:52:15 -0400
Received: by mail-pl1-f195.google.com with SMTP id t4so375275plq.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Apr 2020 12:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LsDMheC8SS62q9waKXWddWs2pH91G3pR665kWUXQLBM=;
        b=qvi7+I0CwiG+b1dWM/ewIw01MXMuU2u/wTjiTt3mNr3fhIQUObT+bJnEdMS5Zn+ndh
         ugDvKS1ZN5nTm1Od948Yk0AKj+Ee8vRzdBdRxxlmROyfUxXK36YZaWsMdrUQEnaK8oNI
         rVjduDmIUqXK8r2jnljeTCi/0XBT55wIoBedpFiZBBIOdFyoNepbqyuwu9tvQ0thu5cO
         DCqn6cZKntk9hx7UVPSAW9fjszJxoJYXe/1+2OPpWSarYP2Mk+9W7Br50uLMgdU5XM7X
         7bRU3KuPB/oovfPvyjflnASQvzgJQ5ge9rX/tNBaOOOq15CUwrWsxtKEwO69mFCYIZgh
         glZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LsDMheC8SS62q9waKXWddWs2pH91G3pR665kWUXQLBM=;
        b=SIxW8/thsgO6hrrVkD5GSUZK/os1ISn6zR4OwfDlcAegimhr2ucko3V2sutVVbU15m
         hkUg3xdYWzN8P7twXOoKhncqeP+SFyPjJMTFJC+bbbhB+m6FOH1vOjSx/KzxV0GTBsZg
         fAT7xnKSSwPlVAOEuKPiFl2IZbes2VMH4UbyFdaZqXKBfkY9h6jX516uWEM8qeNiGlta
         tTKcwV74yG2ZOMDIwJg8AwbzlgQjjUsEH+xeaCWHv0hY0rO3B1L/Bbcm4wIwbPRFMOiT
         LNZa9B8+KeRmJ3E/zzQxairh2pSE4bb+9blwEssDsB6fu+AM/+5Wv9dXPfEDwcDSHtVd
         HcjQ==
X-Gm-Message-State: ANhLgQ2Ki0Nwswg0Srlo+tfzhhDCv355qDTs3yC0YT3u38++j2k89nHd
        uAdr0wNJ8QUbjhYMKbka5/GGwg==
X-Google-Smtp-Source: ADFU+vvpc/6uMzWruwdm5siDvuuiApCBsoPPLFIXQ1F6mKFsyZX99eITg7b4zOqX8E3ZyfHwlPqbHA==
X-Received: by 2002:a17:902:fe0f:: with SMTP id g15mr25314360plj.25.1585770734529;
        Wed, 01 Apr 2020 12:52:14 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k4sm2214701pfh.0.2020.04.01.12.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 12:52:13 -0700 (PDT)
Date:   Wed, 1 Apr 2020 12:52:11 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v2 2/2] remoteproc: core: Register the character device
 interface
Message-ID: <20200401195211.GE267644@minitux>
References: <1585699438-14394-1-git-send-email-rishabhb@codeaurora.org>
 <1585699438-14394-2-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585699438-14394-2-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 31 Mar 17:03 PDT 2020, Rishabh Bhatnagar wrote:

> Add the character device during rproc_add. This would create
> a character device node at /dev/remoteproc<index>. Userspace
> applications can interact with the remote processor using this
> interface.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

>  drivers/remoteproc/remoteproc_core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 097f33e..76ba171 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1916,6 +1916,13 @@ int rproc_add(struct rproc *rproc)
>  	/* create debugfs entries */
>  	rproc_create_debug_dir(rproc);
>  
> +	/* add char device for this remoteproc */
> +	ret = rproc_char_device_add(rproc);
> +	if (ret) {
> +		dev_err(dev, "Failed to add char dev for %s\n", rproc->name);
> +		return ret;
> +	}
> +
>  	/* if rproc is marked always-on, request it to boot */
>  	if (rproc->auto_boot) {
>  		ret = rproc_trigger_auto_boot(rproc);
> @@ -2137,6 +2144,7 @@ int rproc_del(struct rproc *rproc)
>  	mutex_unlock(&rproc->lock);
>  
>  	rproc_delete_debug_dir(rproc);
> +	rproc_char_device_remove(rproc);
>  
>  	/* the rproc is downref'ed as soon as it's removed from the klist */
>  	mutex_lock(&rproc_list_mutex);
> @@ -2220,6 +2228,7 @@ static int __init remoteproc_init(void)
>  {
>  	rproc_init_sysfs();
>  	rproc_init_debugfs();
> +	rproc_init_cdev();
>  
>  	return 0;
>  }
> @@ -2231,6 +2240,7 @@ static void __exit remoteproc_exit(void)
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
