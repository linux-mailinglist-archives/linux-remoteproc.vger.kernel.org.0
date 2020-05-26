Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E680B1C6563
	for <lists+linux-remoteproc@lfdr.de>; Wed,  6 May 2020 03:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgEFBJe (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 5 May 2020 21:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728512AbgEFBJd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 May 2020 21:09:33 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96B7C061A41
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 May 2020 18:09:33 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a32so44923pje.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 May 2020 18:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SktkFFCj6f5QA03u6t+h6bT244ONZZg07FZfFSbGQhc=;
        b=H10ahALKAILI5hqGa0yUV3fGKJx7fOYUI3kdCvO9CKjzq0DjSQls8eqmbGwkVib2Xm
         dojReo/MPYuk223jIb2yrYbONKsFs6Jf1z9RFFXSq+kbIZZdoYQWJgaRPhXCH9fByaJM
         JqvN+hOaafbetujtMcCDyU6B41olAdP/afunlknFk4lCEXNfdZX4l8OE+vBaXAMR70FP
         j+az0m32y2Aag4eLNUwd9Bw/Lla6jgYC9l7DwxF+1iBhqWaqFnf9dRtGRWu5YG9QpY03
         4A7VEynqH1/s4jBeuM+qCnhIKUzoZVdHcBQLgzMCcVtMpgz7hMJxNrQYUkOUkFLc+kmX
         dc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SktkFFCj6f5QA03u6t+h6bT244ONZZg07FZfFSbGQhc=;
        b=CCwbjf5xAXDzA47sGUrdEMNdQfjfyRPV/JZUg7vEigE2PpkbfUCr0JUmONwJ36Jt3d
         LV54ID9YZiYDHR2m2RQ9vGzcuuY2wVZ7b7Foe6elTuOnBJMVM1yZlHWh0aNSAjaT1sUt
         zDgUPQF354Wsa6xCyDgUC8JfoWfjcCrCaLoM5n4612qdE0LbjMmX1Qe1GPX0kR8fMmj8
         j64neELZnYvNmW8alpEPes9tp7IHoAdO1kWazubs3/00/JbZnmP3K0njH75Q0o/LoC6u
         5FEarB7hPlor3m2R2FPBy4Qg9OHqGi17q13fsaeuQq9+J0IiOjXEtovVdNB90t6WhUTM
         pikQ==
X-Gm-Message-State: AGi0PuZudXI2WNB62wTYGX3Vmo9D6FjleL2ba0gUFBCo3kCCK2vYlPZI
        K60MTw3sLdJBjBZyvxIhhUqI7Q==
X-Google-Smtp-Source: APiQypL0Ju3ryEjQ9NLdLf6LuWnZdN59jgzn1SiCq0inOcOVQWyKRROKMfb5JSWo+gUzf0+0pN9Efw==
X-Received: by 2002:a17:90a:30a5:: with SMTP id h34mr6135410pjb.171.1588727372890;
        Tue, 05 May 2020 18:09:32 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s76sm274303pgc.85.2020.05.05.18.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 18:09:32 -0700 (PDT)
Date:   Tue, 5 May 2020 18:10:17 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, loic.pallardy@st.com, arnaud.pouliquen@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/14] remoteproc: Deal with synchronisation when
 shutting down
Message-ID: <20200506011017.GG2329931@builder.lan>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-11-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424200135.28825-11-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 24 Apr 13:01 PDT 2020, Mathieu Poirier wrote:

> The remoteproc core must not allow function rproc_shutdown() to
> proceed if currently synchronising with a remote processor and
> the synchronisation operations of that remote processor does not
> support it.  Also part of the process is to set the synchronisation
> flag so that the remoteproc core can make the right decisions when
> restarting the system.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c     | 32 ++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_internal.h |  7 ++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 3a84a38ba37b..48afa1f80a8f 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1849,6 +1849,27 @@ int rproc_boot(struct rproc *rproc)
>  }
>  EXPORT_SYMBOL(rproc_boot);
>  
> +static bool rproc_can_shutdown(struct rproc *rproc)
> +{
> +	/*
> +	 * The remoteproc core is the lifecycle manager, no problem
> +	 * calling for a shutdown.
> +	 */
> +	if (!rproc_needs_syncing(rproc))
> +		return true;
> +
> +	/*
> +	 * The remoteproc has been loaded by another entity (as per above
> +	 * condition) and the platform code has given us the capability
> +	 * of stopping it.
> +	 */
> +	if (rproc->sync_ops->stop)
> +		return true;
> +
> +	/* Any other condition should not be allowed */
> +	return false;
> +}
> +
>  /**
>   * rproc_shutdown() - power off the remote processor
>   * @rproc: the remote processor
> @@ -1879,6 +1900,9 @@ void rproc_shutdown(struct rproc *rproc)
>  		return;
>  	}
>  
> +	if (!rproc_can_shutdown(rproc))
> +		goto out;

There's been a request mentioned of it being possible to shut down Linux
and having the remote processor keep running.

By skipping the rest of shutdown we will not stop or unprepare
subdevices, so presumably the remote processor won't know that
virtio/rpmsg is down. Is that ok?

> +
>  	/* if the remote proc is still needed, bail out */
>  	if (!atomic_dec_and_test(&rproc->power))
>  		goto out;
> @@ -1898,6 +1922,14 @@ void rproc_shutdown(struct rproc *rproc)
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
>  	rproc->table_ptr = NULL;
> +
> +	/*
> +	 * The remote processor has been switched off - tell the core what
> +	 * operation to use from hereon, i.e whether an external entity will
> +	 * reboot the remote processor or it is now the remoteproc core's
> +	 * responsability.
> +	 */
> +	rproc_set_sync_flag(rproc, RPROC_SYNC_STATE_SHUTDOWN);

As asked on a previous patch, what would it mean if after_stop is true?

It seems like this state would be similar to the "already-booted" state
that we might encounter at probe time.

Regards,
Bjorn

>  out:
>  	mutex_unlock(&rproc->lock);
>  }
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 61500981155c..7dcc0a26892b 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -27,6 +27,9 @@ struct rproc_debug_trace {
>  /*
>   * enum rproc_sync_states - remote processsor sync states
>   *
> + * @RPROC_SYNC_STATE_SHUTDOWN	state to use after the remoteproc core
> + *				has shutdown (rproc_shutdown()) the
> + *				remote processor.
>   * @RPROC_SYNC_STATE_CRASHED	state to use after the remote processor
>   *				has crashed but has not been recovered by
>   *				the remoteproc core yet.
> @@ -36,6 +39,7 @@ struct rproc_debug_trace {
>   * operation to use.
>   */
>  enum rproc_sync_states {
> +	RPROC_SYNC_STATE_SHUTDOWN,
>  	RPROC_SYNC_STATE_CRASHED,
>  };
>  
> @@ -43,6 +47,9 @@ static inline void rproc_set_sync_flag(struct rproc *rproc,
>  				       enum rproc_sync_states state)
>  {
>  	switch (state) {
> +	case RPROC_SYNC_STATE_SHUTDOWN:
> +		rproc->sync_with_rproc = rproc->sync_flags.after_stop;
> +		break;
>  	case RPROC_SYNC_STATE_CRASHED:
>  		rproc->sync_with_rproc = rproc->sync_flags.after_crash;
>  		break;
> -- 
> 2.20.1
> 
