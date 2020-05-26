Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44F4D1C6398
	for <lists+linux-remoteproc@lfdr.de>; Wed,  6 May 2020 00:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729354AbgEEWDb (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 5 May 2020 18:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728717AbgEEWDa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 May 2020 18:03:30 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90BCC061A41
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 May 2020 15:03:30 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ms17so243202pjb.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 May 2020 15:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VCda7CdBJ7GD+X9YByeTjdG9v0RMwDipXe8ofov/KVQ=;
        b=OOFo0XOFsR93rldJVgSfWUFQD/p4SseAWJ73I7C9e3gt5Hz6DpaCD9EMac9CtWOLey
         1g/OhEO9QPHSe+f6vtflxL1sXNcDZgY/Qv/LJTV99dgkKPohEneEgOrcHv6tHMRNH/R+
         YIzDRRWs8+16EOrrJ3LAKSZ9QVwkuNTZuebRao8lQrhjScTc4MwR2oFDN8kPdUCfw0uz
         9Xte58dhqPF2fqOq1svKd1ED4TKc0zNc7X/W1BBgQyZN1NV/fInv0r4gkV5KMoQHsIV3
         R+OpGZlvHtNuaCbd91bLqZd6jyRxhSKgM8rCrZhCVo2Pn97UJLQNISLNVqoiZBzqR4gI
         RhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VCda7CdBJ7GD+X9YByeTjdG9v0RMwDipXe8ofov/KVQ=;
        b=sARZNNYndLXNqM2jR1o9i6mizWB7pV+SwLCg6TnxbPkztu2Zdu9kDNiJF/rTRfGHW9
         OQ/UgxNS6oidNZRYOqOEQ5CX/uZvvI+9xcqHiMhDDVW06MzLsvNbpId0tjWWIMe4u2wz
         Imig3oJgVVQ6KCzVqTHdGaVIw3NpOCAb2T0AE2R+9r2wk0Bh/1cZggZku9f4pUxp77jc
         xMSJuRkphwxnnTUyldhX0be6Lv1rIWCjjdsgVXZV2dMTTsiIBOMA887Bf/krtKkLpIkL
         03a4nnkqebIUFZ5UerHsGpcsYav3byirDpt2KirmFAYg73fSSbYbq+f6xkl4lWMyBZvQ
         Cm4A==
X-Gm-Message-State: AGi0Pub0w44eIzT4cbaDBgp1jQEMZtwD/mmA9uzGccgTt87+yMcEbQLN
        RD/ME9EZ6IJw2aUx1qbtT0hTug==
X-Google-Smtp-Source: APiQypJRRsGLm/zDX2haFdvC0uTHJdcrPR6/bbqt+R7pfaIn5nqtuYlc3GY94oHKm2cqcAmEbJIsEQ==
X-Received: by 2002:a17:902:a413:: with SMTP id p19mr5231926plq.1.1588716209909;
        Tue, 05 May 2020 15:03:29 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y186sm6934pfy.66.2020.05.05.15.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 15:03:29 -0700 (PDT)
Date:   Tue, 5 May 2020 16:03:27 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com, loic.pallardy@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/14] remoteproc: Deal with synchronisation when
 shutting down
Message-ID: <20200505220327.GB18333@xps15>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-11-mathieu.poirier@linaro.org>
 <d2eeb480-6ba1-de12-53ba-cdf9c61b94b0@st.com>
 <20200430202312.GE17031@xps15>
 <04b8f860-2b01-7e4f-cdea-08a3cf8af26c@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04b8f860-2b01-7e4f-cdea-08a3cf8af26c@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, May 04, 2020 at 01:34:43PM +0200, Arnaud POULIQUEN wrote:
> 
> 
> On 4/30/20 10:23 PM, Mathieu Poirier wrote:
> > On Wed, Apr 29, 2020 at 10:19:49AM +0200, Arnaud POULIQUEN wrote:
> >>
> >>
> >> On 4/24/20 10:01 PM, Mathieu Poirier wrote:
> >>> The remoteproc core must not allow function rproc_shutdown() to
> >>> proceed if currently synchronising with a remote processor and
> >>> the synchronisation operations of that remote processor does not
> >>> support it.  Also part of the process is to set the synchronisation
> >>> flag so that the remoteproc core can make the right decisions when
> >>> restarting the system.
> >>>
> >>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>> ---
> >>>  drivers/remoteproc/remoteproc_core.c     | 32 ++++++++++++++++++++++++
> >>>  drivers/remoteproc/remoteproc_internal.h |  7 ++++++
> >>>  2 files changed, 39 insertions(+)
> >>>
> >>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >>> index 3a84a38ba37b..48afa1f80a8f 100644
> >>> --- a/drivers/remoteproc/remoteproc_core.c
> >>> +++ b/drivers/remoteproc/remoteproc_core.c
> >>> @@ -1849,6 +1849,27 @@ int rproc_boot(struct rproc *rproc)
> >>>  }
> >>>  EXPORT_SYMBOL(rproc_boot);
> >>>  
> >>> +static bool rproc_can_shutdown(struct rproc *rproc)
> >>> +{
> >>> +	/*
> >>> +	 * The remoteproc core is the lifecycle manager, no problem
> >>> +	 * calling for a shutdown.
> >>> +	 */
> >>> +	if (!rproc_needs_syncing(rproc))
> >>> +		return true;
> >>> +
> >>> +	/*
> >>> +	 * The remoteproc has been loaded by another entity (as per above
> >>> +	 * condition) and the platform code has given us the capability
> >>> +	 * of stopping it.
> >>> +	 */
> >>> +	if (rproc->sync_ops->stop)
> >>> +		return true;
> >>
> >> This means that if rproc->sync_ops->stop is null rproc_stop_subdevices will not
> >> be called? seems not symmetric with the start sequence.
> > 
> > If rproc->sync_ops->stop is not provided then the remoteproc core can't stop the
> > remote processor at all after it has synchronised with it.  If a usecase
> > requires some kind of soft reset then a stop() function that uses a mailbox
> > notification or some other mechanism can be provided to tell the remote
> > processor to put itself back in startup mode again.
> > 
> > Is this fine with you or there is still something I don't get?
> 
> My point here is more around the subdevices. But perhaps i missed something...
> 
> In rproc_start rproc_start_subdevices is called, even if sync_start is null.

Here I'll take that you mean sync_ops::start()

> But in rproc_shutdown rproc_stop is not called, if sync_ops->stop is null.
> So rproc_stop_subdevices is not called in this case.

Correct.  I am pretty sure some people don't want the remoteproc core to be able
to do anything other than synchronise with a remote processor, be it at boot
time or when the remote processor has crashed.

I can also see scenarios where people want to be able to start and stop
subdevices from the remoteproc core, but _not_ power cycle the remote processor.
In such cases the sync_ops::stop() should be some kind of notification telling
the remote processor to put itself back in initialisation mode and
sync_flags.after_stop should be set to true.

> Then if sync_flags.after_stop is false, it looks like that something will go wrong
> at next start.

If sync_ops::stop is NULL then the value of sync_flags.after_stop becomes
irrelevant because that state can't be reached. Let me know if you found a
condition where this isn't the case and I will correct it. 

> 
> > 
> >> Probably not useful to test it here as condition is already handled in rproc_stop_device...
> >>
> >> Regards
> >> Arnaud
> >>> +
> >>> +	/* Any other condition should not be allowed */
> >>> +	return false;
> >>> +}
> >>> +
> >>>  /**
> >>>   * rproc_shutdown() - power off the remote processor
> >>>   * @rproc: the remote processor
> >>> @@ -1879,6 +1900,9 @@ void rproc_shutdown(struct rproc *rproc)
> >>>  		return;
> >>>  	}
> >>>  
> >>> +	if (!rproc_can_shutdown(rproc))
> >>> +		goto out;
> >>> +
> >>>  	/* if the remote proc is still needed, bail out */
> >>>  	if (!atomic_dec_and_test(&rproc->power))
> >>>  		goto out;
> >>> @@ -1898,6 +1922,14 @@ void rproc_shutdown(struct rproc *rproc)
> >>>  	kfree(rproc->cached_table);
> >>>  	rproc->cached_table = NULL;
> >>>  	rproc->table_ptr = NULL;
> >>> +
> >>> +	/*
> >>> +	 * The remote processor has been switched off - tell the core what
> >>> +	 * operation to use from hereon, i.e whether an external entity will
> >>> +	 * reboot the remote processor or it is now the remoteproc core's
> >>> +	 * responsability.
> >>> +	 */
> >>> +	rproc_set_sync_flag(rproc, RPROC_SYNC_STATE_SHUTDOWN);
> >>>  out:
> >>>  	mutex_unlock(&rproc->lock);
> >>>  }
> >>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> >>> index 61500981155c..7dcc0a26892b 100644
> >>> --- a/drivers/remoteproc/remoteproc_internal.h
> >>> +++ b/drivers/remoteproc/remoteproc_internal.h
> >>> @@ -27,6 +27,9 @@ struct rproc_debug_trace {
> >>>  /*
> >>>   * enum rproc_sync_states - remote processsor sync states
> >>>   *
> >>> + * @RPROC_SYNC_STATE_SHUTDOWN	state to use after the remoteproc core
> >>> + *				has shutdown (rproc_shutdown()) the
> >>> + *				remote processor.
> >>>   * @RPROC_SYNC_STATE_CRASHED	state to use after the remote processor
> >>>   *				has crashed but has not been recovered by
> >>>   *				the remoteproc core yet.
> >>> @@ -36,6 +39,7 @@ struct rproc_debug_trace {
> >>>   * operation to use.
> >>>   */
> >>>  enum rproc_sync_states {
> >>> +	RPROC_SYNC_STATE_SHUTDOWN,
> >>>  	RPROC_SYNC_STATE_CRASHED,
> >>>  };
> >>>  
> >>> @@ -43,6 +47,9 @@ static inline void rproc_set_sync_flag(struct rproc *rproc,
> >>>  				       enum rproc_sync_states state)
> >>>  {
> >>>  	switch (state) {
> >>> +	case RPROC_SYNC_STATE_SHUTDOWN:
> >>> +		rproc->sync_with_rproc = rproc->sync_flags.after_stop;
> >>> +		break;
> >>>  	case RPROC_SYNC_STATE_CRASHED:
> >>>  		rproc->sync_with_rproc = rproc->sync_flags.after_crash;
> >>>  		break;
> >>>
