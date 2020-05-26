Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE24B1CBA10
	for <lists+linux-remoteproc@lfdr.de>; Fri,  8 May 2020 23:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbgEHVsA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 8 May 2020 17:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbgEHVr7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 May 2020 17:47:59 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE48C05BD09
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 May 2020 14:47:59 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t9so4918084pjw.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2020 14:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZkMTx13F4hIF1qNybgiGr2txJ9/x+zBH1FUGTT5jwF0=;
        b=G301ru16dOfCFPwFgX0Krap9rtJBkkplj86z4oKLh+d2AmtfoA+UmB1oV1XZ5RkQDQ
         2NxLGuc70CqGObP2Wyn4il9b5tODijHLzH+6i+DoU7tzCU9F3v7zn0ibVrc4Aebje1Cq
         fSHT8BQbhW8YlXcHJHE39pS7BvzCgxQFkCWfcaAKyt29h7kx6TVC8lO7WJF2cuqFSjaZ
         uf9CwgDLXg0AgH1dSLYHrGbvAibuOJh92Ay869ErIY40S4+SspWSp6a5oHV5P1NHcavO
         NRTCWHUmwPh7rI0hhtISBO8ksRXF0rmaK82WnVZmxJo3mn8gUYZd3IiWuUUIA90LoCRj
         CTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZkMTx13F4hIF1qNybgiGr2txJ9/x+zBH1FUGTT5jwF0=;
        b=qWX6SbnzqOU73ahX1bslnRO40+kwelevsLGoMwyaq7ttn3JiEYVnnp3/JF3gZNbNpp
         g0NgnetYN57wapdheG99cESrIqwHEwDVhbpdL/kzL8x7gROVXOXXlVc6drM9clxjCpAJ
         GZ+Th3mMGEzXp7U9aCfL46K4ScX/nnhTj9UfwpMrEHJSV9WoJRPzjrxm4inPG8zZmbl5
         NEJ7iidI0MUOHMPZ7U0sBHTdk9cOLDtVjG0KtP57Y2LU5lxk7df/rfGUuTwFLkKD8IjS
         nctbbFIwdI8rpQfIQm0DI19M4Whme/nhqEmjTmhuvhNh80OvwL8+zEuBOcCZDmEhY9fD
         iFEA==
X-Gm-Message-State: AGi0PuZGdofjbRpnh1lNUJX1lPCK0slkxsNMKpKUnO+AscTxqZckfV/G
        UiRaHvoUXvuUeBlzQgsgJWd/PYuBnjQ=
X-Google-Smtp-Source: APiQypKstUyarrMJRtnmqBU4RLPFnVpRjeCCxfzxo1bGVBEVoWMzTN48glevlSUjNL+NC8sM37cJWg==
X-Received: by 2002:a17:90a:a893:: with SMTP id h19mr8131513pjq.138.1588974479011;
        Fri, 08 May 2020 14:47:59 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m4sm2663564pfm.26.2020.05.08.14.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 14:47:58 -0700 (PDT)
Date:   Fri, 8 May 2020 15:47:56 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ohad@wizery.com, loic.pallardy@st.com, arnaud.pouliquen@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/14] remoteproc: Deal with synchronisation when
 crashing
Message-ID: <20200508214756.GC5650@xps15>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-10-mathieu.poirier@linaro.org>
 <20200506010156.GF2329931@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506010156.GF2329931@builder.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, May 05, 2020 at 06:01:56PM -0700, Bjorn Andersson wrote:
> On Fri 24 Apr 13:01 PDT 2020, Mathieu Poirier wrote:
> 
> > Refactor function rproc_trigger_recovery() in order to avoid
> > reloading the firmware image when synchronising with a remote
> > processor rather than booting it.  Also part of the process,
> > properly set the synchronisation flag in order to properly
> > recover the system.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_core.c     | 23 ++++++++++++++------
> >  drivers/remoteproc/remoteproc_internal.h | 27 ++++++++++++++++++++++++
> >  2 files changed, 43 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index ef88d3e84bfb..3a84a38ba37b 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1697,7 +1697,7 @@ static void rproc_coredump(struct rproc *rproc)
> >   */
> >  int rproc_trigger_recovery(struct rproc *rproc)
> >  {
> > -	const struct firmware *firmware_p;
> > +	const struct firmware *firmware_p = NULL;
> >  	struct device *dev = &rproc->dev;
> >  	int ret;
> >  
> > @@ -1718,14 +1718,16 @@ int rproc_trigger_recovery(struct rproc *rproc)
> >  	/* generate coredump */
> >  	rproc_coredump(rproc);
> >  
> > -	/* load firmware */
> > -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> > -	if (ret < 0) {
> > -		dev_err(dev, "request_firmware failed: %d\n", ret);
> > -		goto unlock_mutex;
> > +	/* load firmware if need be */
> > +	if (!rproc_needs_syncing(rproc)) {
> > +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
> > +		if (ret < 0) {
> > +			dev_err(dev, "request_firmware failed: %d\n", ret);
> > +			goto unlock_mutex;
> > +		}
> >  	}
> >  
> > -	/* boot the remote processor up again */
> > +	/* boot up or synchronise with the remote processor again */
> >  	ret = rproc_start(rproc, firmware_p);
> >  
> >  	release_firmware(firmware_p);
> > @@ -1761,6 +1763,13 @@ static void rproc_crash_handler_work(struct work_struct *work)
> >  	dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
> >  		rproc->name);
> >  
> > +	/*
> > +	 * The remote processor has crashed - tell the core what operation
> > +	 * to use from hereon, i.e whether an external entity will reboot
> > +	 * the MCU or it is now the remoteproc core's responsability.
> > +	 */
> > +	rproc_set_sync_flag(rproc, RPROC_SYNC_STATE_CRASHED);
> 
> If I follow the logic correctly, you're essentially using
> rproc->sync_with_rproc to pass an additional parameter down through
> rproc_trigger_recovery() to tell everyone below to "load firmware and
> boot the core or not".

I am using the value of rproc::sync_flags::after_crash to set
rproc->sync_with_rproc.  That way the core can know whether it should boot the
remote processor or synchronise with it.

> 
> And given that the comment alludes to some unknown logic determining the
> continuation I think it would be much preferable to essentially just
> pass rproc->sync_flags.after_crash down through these functions.
>

The only thing we need to do is set the value of rproc->sync_with_rproc
properly, which rproc_set_sync_flag() does.  I have decided to use a wrapper
function to allow us to change how the rproc->sync_with_rproc is handled without
touching anything else in the code.
 
> 
> And per my comment on a previous patch, is there any synchronization
> with the remote controller when this happens?

I can't seem to find that comment - can you indicate which patch that was?  As
it is today the core doesn't provide synchronisation, it is up to the platform
driver to probe the remote processor to make sure it is up.  I suppose
sync_ops::start() would be a perfect candidate for that.   

> 
> Regards,
> Bjorn
> 
> > +
> >  	mutex_unlock(&rproc->lock);
> >  
> >  	if (!rproc->recovery_disabled)
> > diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> > index 3985c084b184..61500981155c 100644
> > --- a/drivers/remoteproc/remoteproc_internal.h
> > +++ b/drivers/remoteproc/remoteproc_internal.h
> > @@ -24,6 +24,33 @@ struct rproc_debug_trace {
> >  	struct rproc_mem_entry trace_mem;
> >  };
> >  
> > +/*
> > + * enum rproc_sync_states - remote processsor sync states
> > + *
> > + * @RPROC_SYNC_STATE_CRASHED	state to use after the remote processor
> > + *				has crashed but has not been recovered by
> > + *				the remoteproc core yet.
> > + *
> > + * Keeping these separate from the enum rproc_state in order to avoid
> > + * introducing coupling between the state of the MCU and the synchronisation
> > + * operation to use.
> > + */
> > +enum rproc_sync_states {
> > +	RPROC_SYNC_STATE_CRASHED,
> > +};
> > +
> > +static inline void rproc_set_sync_flag(struct rproc *rproc,
> > +				       enum rproc_sync_states state)
> > +{
> > +	switch (state) {
> > +	case RPROC_SYNC_STATE_CRASHED:
> > +		rproc->sync_with_rproc = rproc->sync_flags.after_crash;
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +}
> > +
> >  /* from remoteproc_core.c */
> >  void rproc_release(struct kref *kref);
> >  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
> > -- 
> > 2.20.1
> > 
