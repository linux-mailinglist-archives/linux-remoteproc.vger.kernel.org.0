Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D04D11987E8
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 01:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729069AbgC3XQ0 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 19:16:26 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:53620 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgC3XQ0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 19:16:26 -0400
Received: by mail-pj1-f67.google.com with SMTP id l36so276047pjb.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2020 16:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yGwjtNmVOeqA8dk9gcOr1Hofpl+e8AiVTrGAFNQF9Mg=;
        b=HRBkNjGGC5fD+4bd0YTOxiw22vot0RPJRyXdrGbkZqjxbE4CToEfSnUI4piYJb6SZ9
         KjiQkVEKgZXw+rGT/JtwulgyWs8sh0xPdC6vqFgxYH6VrUU4/4oDmbywWUO+5zwSU+qI
         fwujXjA60KSMJDVThqd6dbn+gf5Ofl6CHZ/9slIZCh8Y5wwJFfxM6sCq4tcNZxYqnv4Y
         T7lMIloS+A22JD7E0O2vnWQAVF7E5PQLcb2FtcYJY69SyWHs/yrXowMEl1uBytJtRB0Y
         ZzC/UcqVLA93UySMSSSWqwcyocOFABuwDsPVSoIaTgmpViTTFXChl0cjyLLL8aPjuQip
         nJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yGwjtNmVOeqA8dk9gcOr1Hofpl+e8AiVTrGAFNQF9Mg=;
        b=ekVdbBfSuUyQgNk3t9AkBsOBXhJnRcNwi2wcRmAbiy5c/QodBJQTqhHuzQ4rHdou/t
         iRdxAjRjNvwo33lofuBpduQb5MbgZndSW8MOkze2NuMAtzGAPNDd/HdHuaToejZ0p6sC
         g+TrWgsyg1a4sLZwfLSrp/4IGbOaNi6s29+tW5pYOWm9QvuYE+YnKtG2mUvSCtjsvfWx
         689HgBk0vJeVVInCAnjzAPpM+IWJDupRuZ5/WfhYXtUbtVZCehpIhACa+q6BWW9k2Zix
         rKdFs+1EeDv48NSGjz4g7TOzFmL0mj/tVY7g7NzIut6mg0HtNAy6NDeC8xtz31Epr/jy
         b57A==
X-Gm-Message-State: AGi0PuaGjF/OARTVVojdOOIUUW2ulsfqt6spOj3GHkv/MrZvFFjMKxmH
        RybcRPxB0qRZ+RMMGJ+Wx51gyg==
X-Google-Smtp-Source: APiQypIDCzT9VVcdLNoKMRzt27rmNj7uHgHSaeU5KvVq+doAR9LIL3Yec2LQ3yeFaHBnDho2qWOSpA==
X-Received: by 2002:a17:90a:240f:: with SMTP id h15mr539666pje.176.1585610184901;
        Mon, 30 Mar 2020 16:16:24 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q71sm515558pjb.5.2020.03.30.16.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 16:16:24 -0700 (PDT)
Date:   Mon, 30 Mar 2020 17:16:22 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Loic PALLARDY <loic.pallardy@st.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v2 08/17] remoteproc: Allocate synchronisation state
 machine
Message-ID: <20200330231622.GE31331@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-9-mathieu.poirier@linaro.org>
 <e89d9859f4324cf59b0ae6787775d8f5@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e89d9859f4324cf59b0ae6787775d8f5@SFHDAG7NODE2.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Mar 27, 2020 at 01:47:21PM +0000, Loic PALLARDY wrote:
> 
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: mardi 24 mars 2020 22:46
> > To: bjorn.andersson@linaro.org
> > Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> > anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> > <arnaud.pouliquen@st.com>; Fabien DESSENNE
> > <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> > Subject: [PATCH v2 08/17] remoteproc: Allocate synchronisation state
> > machine
> > 
> > This patch allocates a synchronisation state machine, either provided or
> > not by users, in order to enact the proper behavior requested by the
> > platform or specific scenarios.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 59
> > +++++++++++++++++++++++++++-
> >  1 file changed, 58 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> > b/drivers/remoteproc/remoteproc_core.c
> > index 02dbb826aa29..1578a9c70422 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1955,6 +1955,7 @@ static void rproc_type_release(struct device *dev)
> >  	kfree(rproc->firmware);
> >  	kfree(rproc->ops);
> >  	kfree(rproc->sync_ops);
> > +	kfree(rproc->sync_states);
> >  	kfree(rproc);
> >  }
> > 
> > @@ -2035,6 +2036,59 @@ static int rproc_alloc_sync_ops(struct rproc *rproc,
> >  	return 0;
> >  }
> > 
> > +static int rproc_alloc_sync_states(struct rproc *rproc,
> > +				   const struct rproc_ops *boot_ops,
> > +				   const struct rproc_ops *sync_ops,
> > +				   struct rproc_sync_states *sync_states)
> > +{
> > +	struct rproc_sync_states *st;
> > +
> > +	/* At least one set of operation is needed */
> > +	if (!boot_ops && !sync_ops)
> > +		return -EINVAL;
> > +
> > +	/* We have a synchronisation state machine, no need to build one */
> > +	if (sync_states) {
> > +		st = kmemdup(sync_states, sizeof(*st), GFP_KERNEL);
> > +		if (!st)
> > +			return -ENOMEM;
> > +
> 
> I think a check between sync_states and boot_ops/sync_ops may be needed here
> even if it is platform driver responsibility to provide coherent configuration
> As soon as one of the sync_states is set at true, sync_ops must be provided
> As soon as one of the sync_states is set at false, boot_ops must be provided

That will help catch errors early - OK.

> 
> Regards,
> Loic
> 
> > +		/* Nothing else to do */
> > +		goto out;
> > +	}
> > +
> > +	/* Allocate synchronisation state machine */
> > +	st = kzalloc(sizeof(*st), GFP_KERNEL);
> > +	if (!st)
> > +		return -ENOMEM;
> > +
> > +	/*
> > +	 * We have a boot_ops and no sync_ops - build a state machine that
> > +	 * does _not_ synchronise with an MCU.
> > +	 */
> > +	if (boot_ops && !sync_ops) {
> > +		st->on_init = st->after_stop = st->after_crash = false;
> > +		goto out;
> > +	}
> > +
> > +	/*
> > +	 * We have a sync_ops and an no boot_ops - build a state machine
> > that
> > +	 * _only_ synchronises with an MCU.
> > +	 */
> > +	if (sync_ops && !boot_ops) {
> > +		st->on_init = st->after_stop = st->after_crash = true;
> > +		goto out;
> > +	}
> > +
> > +out:
> > +	rproc->sync_with_mcu = st->on_init;
> > +	/* And the synchronisation state machine to use */
> > +	rproc->sync_states = st;
> > +	/* Tell the core what to do when initialising */
> > +	rproc_set_mcu_sync_state(rproc, RPROC_SYNC_STATE_INIT);
> > +	return 0;
> > +}
> > +
> >  static int rproc_alloc_internals(struct rproc *rproc, const char *name,
> >  				 const struct rproc_ops *boot_ops,
> >  				 const struct rproc_ops *sync_ops,
> > @@ -2065,7 +2119,10 @@ static int rproc_alloc_internals(struct rproc *rproc,
> > const char *name,
> >  			return ret;
> >  	}
> > 
> > -	return 0;
> > +	/* Finally allocate the synchronisation state machine */
> > +	ret = rproc_alloc_sync_states(rproc, boot_ops, sync_ops,
> > sync_states);
> > +
> > +	return ret;
> >  }
> > 
> >  /**
> > --
> > 2.20.1
> 
