Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5236C1987E0
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 01:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728880AbgC3XNy (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 19:13:54 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33724 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgC3XNy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 19:13:54 -0400
Received: by mail-pf1-f194.google.com with SMTP id j1so9400459pfe.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2020 16:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uZQo55X1hqjJ91/j81Gui1D5x69S4zOv1+R6wyhCctE=;
        b=olHOO7ulPwyNvfKrfcmUFq3Dct2jYHsx6r17wHjuSh9S4PBiRt+9aS9jj/yATz2Dcs
         pPADor5ARhPqHYR2CRI/qlTwufzLVp/OAv8TEGIrYdInWrp0NEi1ozLsPrOEN1D7Frss
         RlrPQMhAVncwrMxXa3Z9ELAG2ylRL5SuvoDBsC/8rAlZ3NhXiQxBju6ue+EwjXPUfA68
         xemr72k5Rwr3/YS9yO7xz3A7Z86D93/HCQGmc/vO+1BPFpvn/LFXGTNvV5BwMWgFjx+o
         WoHexgrxV00pVil/nsdueZ2P0I+S1dJ5h2KzYKWjB3jVmxQBHoXFvz5UOKlKCQ4v3hXm
         Jbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uZQo55X1hqjJ91/j81Gui1D5x69S4zOv1+R6wyhCctE=;
        b=uYG0YwkdOrFqsR+38VbrAnXCtE8sC/L5n29R6njXDYyT83mgfgKCPepFVk2ziYxRYB
         wT4Khm6ck6wXxySW25h5gm85TjaRabej+0HHdWXpKNG56fZMiYmJSxUHsWRYuztgrmB3
         mWW9UifEgFzXIIoQoN3rTVbJ2ocBVgaffWEAjxwFpla6BWlEb4b3YSkccUZhZZuzzI4Z
         mT6mPIkRHIy1n4c3sUsNU4I4+XLBdDzFeYwD9qicbFuqH9QQ/ff7FIKS5jmqzNAGN+0f
         f9g5OxZ5OQm20kLEetk84eMmIA7ltFUA5ax0v6O4OXrTGdqCZtsVPi7tzPqXTJL7jdQ3
         Ffbg==
X-Gm-Message-State: ANhLgQ1zX0fhi3y+fhV0fIbHK9jydZww5RGiprjIg5EWmJhE6GUj7nyE
        cYtbWC7jQ8heQFhRWV4n7oAQOw==
X-Google-Smtp-Source: ADFU+vtzavgyzvczIiu8x6qzU7idOedPT5ccsy8/vUAz9YWUAV73rb1A6UmfIFbY2bVQ1qeT1V5ehA==
X-Received: by 2002:a62:64d5:: with SMTP id y204mr14659939pfb.227.1585610032399;
        Mon, 30 Mar 2020 16:13:52 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id bo12sm498786pjb.16.2020.03.30.16.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 16:13:51 -0700 (PDT)
Date:   Mon, 30 Mar 2020 17:13:50 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Loic PALLARDY <loic.pallardy@st.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v2 07/17] remoteproc: Introduce function
 rproc_alloc_state_machine()
Message-ID: <20200330231350.GD31331@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-8-mathieu.poirier@linaro.org>
 <6c7225848da94bca8df85cbf6beb4255@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c7225848da94bca8df85cbf6beb4255@SFHDAG7NODE2.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Mar 27, 2020 at 01:12:11PM +0000, Loic PALLARDY wrote:
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
> > Subject: [PATCH v2 07/17] remoteproc: Introduce function
> > rproc_alloc_state_machine()
> > 
> > Introducing new function rproc_alloc_state_machine() to allocate
> > the MCU synchronisation operations and position it as the central
> > remoteproc core allocation function.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 84
> > +++++++++++++++++++++++++---
> >  include/linux/remoteproc.h           |  5 ++
> >  2 files changed, 81 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> > b/drivers/remoteproc/remoteproc_core.c
> > index 9da245734db6..02dbb826aa29 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1954,6 +1954,7 @@ static void rproc_type_release(struct device *dev)
> > 
> >  	kfree(rproc->firmware);
> >  	kfree(rproc->ops);
> > +	kfree(rproc->sync_ops);
> >  	kfree(rproc);
> >  }
> > 
> > @@ -2018,12 +2019,34 @@ static int rproc_alloc_ops(struct rproc *rproc,
> > const struct rproc_ops *ops)
> >  	return 0;
> >  }
> > 
> > +static int rproc_alloc_sync_ops(struct rproc *rproc,
> > +				const struct rproc_ops *sync_ops)
> > +{
> > +	/*
> > +	 * Given the unlimited amount of possibilities when
> > +	 * synchronising with an MCU, no constraints are imposed
> > +	 * on sync_ops.
> > +	 */
> > +	rproc->sync_ops = kmemdup(sync_ops,
> > +				  sizeof(*sync_ops), GFP_KERNEL);
> > +	if (!rproc->sync_ops)
> > +		return -ENOMEM;
> Should we check a minimal set of functions in sync_ops to be required?
> Or we should consider all pointers at NULL is ok ?

I spent a fair amount of time thinking about that very question... The problem
is that requirements are all over the place and I did not want to introduce
constraints.  I am highly influenceable on this one - ideas welcomed.

> 
> > +
> > +	return 0;
> > +}
> > +
> >  static int rproc_alloc_internals(struct rproc *rproc, const char *name,
> >  				 const struct rproc_ops *boot_ops,
> > +				 const struct rproc_ops *sync_ops,
> > +				 struct rproc_sync_states *sync_states,
> sync_states not used in this patch, should be introduced in patch 8

Very well.

> 
> Regards,
> Loic
> 
> >  				 const char *firmware, int len)
> >  {
> >  	int ret;
> > 
> > +	/* We need at least a boot or a sync ops. */
> > +	if (!boot_ops && !sync_ops)
> > +		return -EINVAL;
> > +
> >  	/* We have a boot_ops so allocate firmware name and operations */
> >  	if (boot_ops) {
> >  		ret = rproc_alloc_firmware(rproc, name, firmware);
> > @@ -2035,14 +2058,23 @@ static int rproc_alloc_internals(struct rproc
> > *rproc, const char *name,
> >  			return ret;
> >  	}
> > 
> > +	/* Allocate a sync_ops if need be */
> > +	if (sync_ops) {
> > +		ret = rproc_alloc_sync_ops(rproc, sync_ops);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >  	return 0;
> >  }
> > 
> >  /**
> > - * rproc_alloc() - allocate a remote processor handle
> > + * rproc_alloc_state_machine() - allocate a remote processor handle
> >   * @dev: the underlying device
> >   * @name: name of this remote processor
> >   * @ops: platform-specific handlers (mainly start/stop)
> > + * @sync_ops: platform-specific handlers for synchronising with MCU
> > + * @sync_states: states in which @ops and @sync_ops are to be used
> >   * @firmware: name of firmware file to load, can be NULL
> >   * @len: length of private data needed by the rproc driver (in bytes)
> >   *
> > @@ -2061,13 +2093,15 @@ static int rproc_alloc_internals(struct rproc
> > *rproc, const char *name,
> >   * Note: _never_ directly deallocate @rproc, even if it was not registered
> >   * yet. Instead, when you need to unroll rproc_alloc(), use rproc_free().
> >   */
> > -struct rproc *rproc_alloc(struct device *dev, const char *name,
> > -			  const struct rproc_ops *ops,
> > -			  const char *firmware, int len)
> > +struct rproc *rproc_alloc_state_machine(struct device *dev, const char
> > *name,
> > +					const struct rproc_ops *ops,
> > +					const struct rproc_ops *sync_ops,
> > +					struct rproc_sync_states
> > *sync_states,
> > +					const char *firmware, int len)
> >  {
> >  	struct rproc *rproc;
> > 
> > -	if (!dev || !name || !ops)
> > +	if (!dev || !name)
> >  		return NULL;
> > 
> >  	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
> > @@ -2084,8 +2118,8 @@ struct rproc *rproc_alloc(struct device *dev, const
> > char *name,
> >  	rproc->dev.class = &rproc_class;
> >  	rproc->dev.driver_data = rproc;
> > 
> > -	if (rproc_alloc_internals(rproc, name, ops,
> > -				  firmware, len))
> > +	if (rproc_alloc_internals(rproc, name, ops, sync_ops,
> > +				  sync_states, firmware, len))
> >  		goto out;
> > 
> >  	/* Assign a unique device index and name */
> > @@ -2119,7 +2153,41 @@ struct rproc *rproc_alloc(struct device *dev, const
> > char *name,
> >  	put_device(&rproc->dev);
> >  	return NULL;
> >  }
> > -EXPORT_SYMBOL(rproc_alloc);
> > +EXPORT_SYMBOL(rproc_alloc_state_machine);
> > +
> > +/**
> > + * rproc_alloc() - allocate a remote processor handle
> > + * @dev: the underlying device
> > + * @name: name of this remote processor
> > + * @ops: platform-specific handlers (mainly start/stop)
> > + * @firmware: name of firmware file to load, can be NULL
> > + * @len: length of private data needed by the rproc driver (in bytes)
> > + *
> > + * Allocates a new remote processor handle, but does not register
> > + * it yet. if @firmware is NULL, a default name is used.
> > + *
> > + * This function should be used by rproc implementations during
> > initialization
> > + * of the remote processor.
> > + *
> > + * After creating an rproc handle using this function, and when ready,
> > + * implementations should then call rproc_add() to complete
> > + * the registration of the remote processor.
> > + *
> > + * On success the new rproc is returned, and on failure, NULL.
> > + *
> > + * Note: _never_ directly deallocate @rproc, even if it was not registered
> > + * yet. Instead, when you need to unroll rproc_alloc(), use rproc_free().
> > + */
> > +struct rproc *rproc_alloc(struct device *dev, const char *name,
> > +			  const struct rproc_ops *ops,
> > +			  const char *firmware, int len)
> > +{
> > +	if (!name && !firmware)
> > +		return NULL;
> > +
> > +	return rproc_alloc_state_machine(dev, name, ops, NULL, NULL,
> > +					 firmware, len);
> > +}
> > 
> >  /**
> >   * rproc_free() - unroll rproc_alloc()
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index d115e47d702d..d1214487daac 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -611,6 +611,11 @@ struct rproc *rproc_get_by_child(struct device
> > *dev);
> >  struct rproc *rproc_alloc(struct device *dev, const char *name,
> >  			  const struct rproc_ops *ops,
> >  			  const char *firmware, int len);
> > +struct rproc *rproc_alloc_state_machine(struct device *dev, const char
> > *name,
> > +					const struct rproc_ops *ops,
> > +					const struct rproc_ops *sync_ops,
> > +					struct rproc_sync_states
> > *sync_states,
> > +					const char *firmware, int len);
> >  void rproc_put(struct rproc *rproc);
> >  int rproc_add(struct rproc *rproc);
> >  int rproc_del(struct rproc *rproc);
> > --
> > 2.20.1
> 
