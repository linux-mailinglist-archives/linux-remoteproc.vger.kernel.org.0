Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065A81C6550
	for <lists+linux-remoteproc@lfdr.de>; Wed,  6 May 2020 03:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729709AbgEFBBP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 5 May 2020 21:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728969AbgEFBBO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 May 2020 21:01:14 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01249C061A0F
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 May 2020 18:01:13 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mq3so44287pjb.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 May 2020 18:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yji80IqE9NsUrm2qjHYl+CYcHu+/0cgfsh0mOrm4tfU=;
        b=iLnyduFABEAWDas3tD7tztIH5Y2tiyij++05Nk1xtGg51TAC0bGr+Zp/9YMQa+52oi
         gH80NQyjESwq00DvmIlllGyz2g6bZBMKL0Vvv0MAq8ImoYmpXGi6LCGMbA8MSguslPky
         vUsgDvo/ytXGSzGnpFtyaJzY1Npscpk+RoETramWvIBH/czBqbxxvZHJJ7ieYtBXicYI
         1SjW387MflWyKz0kwLi2CL0amGsf2Mby+x2HjR8+Awyo6m2PexuzKaxI/MNXUcM5cXFv
         CIIY4gCbpwPasWDXkuEseRVAF4u9mjtibhuw4EU59nU+4+Y2BQXOx7d6SbVsKVt/tG8b
         XCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yji80IqE9NsUrm2qjHYl+CYcHu+/0cgfsh0mOrm4tfU=;
        b=cnEwRPSsvP6bwS4I7FFsxs7xMt1q7+4GOBui9OVBVu10HFaEvO8wsrzplm06zx4wWD
         6S8qgEQ6zRFju/3pc1forQ3x+QKtG1K6JLkl7nSWwYhs/N0bo/XZzOtha8BFc9l+p7ZH
         9NP2YA1sCq5E1cYKfuVHtZ13wRZtBIk2qpk5q0CZt5+ibAVa2DB3moLqhImXfrlD6ITw
         SKs0k2LBKYNVMisy3yw6FLHkOxcsbFv2Q2LA11coa0DJWLiwCx7UWOmKL8DgkdM9Xc18
         ToS3l6/7VULElfDTtcZqRtzTQNtCSz5XgEZNvfzly2W/NUSHywetw+B+BUZxJyGHwR0Q
         TSFg==
X-Gm-Message-State: AGi0PubYkkjBEzPOVh2EEllqo1ANMoURI0+VTPkRAbjESQGaVsoZvnFc
        ai7kJkiYJauYpFq8W8p2ATz5Mg==
X-Google-Smtp-Source: APiQypJD8FX3/oPVxda8kjTvoy+Zu22lsUPD1qEuJm/pFX5J6rRLLgZsX+V/s8NNyCqlpqAuN/+UXg==
X-Received: by 2002:a17:902:9e16:: with SMTP id d22mr5778574plq.332.1588726872310;
        Tue, 05 May 2020 18:01:12 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c187sm65996pfc.63.2020.05.05.18.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 18:01:11 -0700 (PDT)
Date:   Tue, 5 May 2020 18:01:56 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, loic.pallardy@st.com, arnaud.pouliquen@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/14] remoteproc: Deal with synchronisation when
 crashing
Message-ID: <20200506010156.GF2329931@builder.lan>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-10-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424200135.28825-10-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 24 Apr 13:01 PDT 2020, Mathieu Poirier wrote:

> Refactor function rproc_trigger_recovery() in order to avoid
> reloading the firmware image when synchronising with a remote
> processor rather than booting it.  Also part of the process,
> properly set the synchronisation flag in order to properly
> recover the system.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c     | 23 ++++++++++++++------
>  drivers/remoteproc/remoteproc_internal.h | 27 ++++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index ef88d3e84bfb..3a84a38ba37b 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1697,7 +1697,7 @@ static void rproc_coredump(struct rproc *rproc)
>   */
>  int rproc_trigger_recovery(struct rproc *rproc)
>  {
> -	const struct firmware *firmware_p;
> +	const struct firmware *firmware_p = NULL;
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
> @@ -1718,14 +1718,16 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  	/* generate coredump */
>  	rproc_coredump(rproc);
>  
> -	/* load firmware */
> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> -	if (ret < 0) {
> -		dev_err(dev, "request_firmware failed: %d\n", ret);
> -		goto unlock_mutex;
> +	/* load firmware if need be */
> +	if (!rproc_needs_syncing(rproc)) {
> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
> +		if (ret < 0) {
> +			dev_err(dev, "request_firmware failed: %d\n", ret);
> +			goto unlock_mutex;
> +		}
>  	}
>  
> -	/* boot the remote processor up again */
> +	/* boot up or synchronise with the remote processor again */
>  	ret = rproc_start(rproc, firmware_p);
>  
>  	release_firmware(firmware_p);
> @@ -1761,6 +1763,13 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  	dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
>  		rproc->name);
>  
> +	/*
> +	 * The remote processor has crashed - tell the core what operation
> +	 * to use from hereon, i.e whether an external entity will reboot
> +	 * the MCU or it is now the remoteproc core's responsability.
> +	 */
> +	rproc_set_sync_flag(rproc, RPROC_SYNC_STATE_CRASHED);

If I follow the logic correctly, you're essentially using
rproc->sync_with_rproc to pass an additional parameter down through
rproc_trigger_recovery() to tell everyone below to "load firmware and
boot the core or not".

And given that the comment alludes to some unknown logic determining the
continuation I think it would be much preferable to essentially just
pass rproc->sync_flags.after_crash down through these functions.


And per my comment on a previous patch, is there any synchronization
with the remote controller when this happens?

Regards,
Bjorn

> +
>  	mutex_unlock(&rproc->lock);
>  
>  	if (!rproc->recovery_disabled)
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 3985c084b184..61500981155c 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -24,6 +24,33 @@ struct rproc_debug_trace {
>  	struct rproc_mem_entry trace_mem;
>  };
>  
> +/*
> + * enum rproc_sync_states - remote processsor sync states
> + *
> + * @RPROC_SYNC_STATE_CRASHED	state to use after the remote processor
> + *				has crashed but has not been recovered by
> + *				the remoteproc core yet.
> + *
> + * Keeping these separate from the enum rproc_state in order to avoid
> + * introducing coupling between the state of the MCU and the synchronisation
> + * operation to use.
> + */
> +enum rproc_sync_states {
> +	RPROC_SYNC_STATE_CRASHED,
> +};
> +
> +static inline void rproc_set_sync_flag(struct rproc *rproc,
> +				       enum rproc_sync_states state)
> +{
> +	switch (state) {
> +	case RPROC_SYNC_STATE_CRASHED:
> +		rproc->sync_with_rproc = rproc->sync_flags.after_crash;
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>  /* from remoteproc_core.c */
>  void rproc_release(struct kref *kref);
>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
> -- 
> 2.20.1
> 
