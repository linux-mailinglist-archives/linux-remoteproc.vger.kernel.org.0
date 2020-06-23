Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE21205BE4
	for <lists+linux-remoteproc@lfdr.de>; Tue, 23 Jun 2020 21:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387447AbgFWThb (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 23 Jun 2020 15:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387433AbgFWTha (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Jun 2020 15:37:30 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79304C061755
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2020 12:37:28 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id j1so10574467pfe.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2020 12:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8tcoG/srDe41M/d7sumygMyJ7BaeM73/Bo5ylqI3GKA=;
        b=Cqkg6S/8/9qXa9Wew7R7+tLH85WimVGdrzM9LUVwPd7s+V25vQHgnxXWWCiQReHRFx
         8fZONY8wJi90pYuiLeHlN6TWAUD9Dcss/PS8ZBlTuLPAoSCR26ewDjmztbjO4Ux2++3z
         W3gK/vzRiNCET6NC8a8lBWp4A63GFYjRoxFWSMnrPKlXOXrtasIlbTNDfUIKTdR4xgX2
         Stokz60sbrxxGWsqbpSN+m6WLFdG0B5IvYd6JwYzPEa51FZBlN6/QdgphAyDBiaK2qne
         UGUAMTb9k5QtNzdGADHtHgJu6JAMMyW//r/acCrmE7jEuEuW7cpGQ89hzklUXgEURUjr
         ZmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8tcoG/srDe41M/d7sumygMyJ7BaeM73/Bo5ylqI3GKA=;
        b=AqK+Da1IcFDUYjRqdYuR3QXeR631qa7V/cPWzwCpOuoI+354q9O1eZtCdz6QwS6//j
         isA003I3grLwDwEn1g5UcLlzdw+8Mhp38a4IkJD3Km6LlB7Somty6CTlhw2v+yO2IzS/
         WtSwwANDn5z8ALj6tPtNpnbtul4dTzI7pfjT3GBQmucTtHD6OR6rEmF9d2+WL0BhQyTU
         G4ylYZK8cCaTMNUAlpPPJ+W1lvG4Lq/RzII5GkKhAJdHcPz405e2uOPwrTHsDutysoLH
         MAbzvOcWkRNcusv5mHwIKRM4Ff6Rgw10q6cOeuYuXP8/Je8aO1FrdvgG5sNMZHtSxm2B
         owew==
X-Gm-Message-State: AOAM5325cfNX5TgUv6nlpIvn7J2uV748zqLnnyT+k44tUqZdps7xnI/z
        DsGX9ZO5wIBaZ+ibmMtsb+mqsvCVI1Q=
X-Google-Smtp-Source: ABdhPJwvNKBozLgfp5hKqsOZhbe46vtp3p6HtncuBeoDlDod08/cwAB4QukHgS6v6XWRiKlpEFblfg==
X-Received: by 2002:a63:fe0a:: with SMTP id p10mr13015187pgh.255.1592941047943;
        Tue, 23 Jun 2020 12:37:27 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id n4sm18301557pfq.9.2020.06.23.12.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 12:37:27 -0700 (PDT)
Date:   Tue, 23 Jun 2020 13:37:25 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, s-anna@ti.com
Subject: Re: [PATCH v4 3/9] remoteproc: Introducing function rproc_attach()
Message-ID: <20200623193725.GA1908098@xps15>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
 <20200601175139.22097-4-mathieu.poirier@linaro.org>
 <20200622070727.GD149351@builder.lan>
 <20200622071804.GE149351@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622071804.GE149351@builder.lan>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

On Mon, Jun 22, 2020 at 12:18:04AM -0700, Bjorn Andersson wrote:
> On Mon 22 Jun 00:07 PDT 2020, Bjorn Andersson wrote:
> 
> > On Mon 01 Jun 10:51 PDT 2020, Mathieu Poirier wrote:
> > 
> > > Introducing function rproc_attach() to enact the same actions as
> > > rproc_start(), but without the steps related to the handling of
> > > a firmware image.  That way we can properly deal with scenarios
> > > where the remoteproc core needs to attach with a remote processsor
> > > that has been booted by another entity.
> > > 
> > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c | 42 ++++++++++++++++++++++++++++
> > >  1 file changed, 42 insertions(+)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index 9f04c30c4aaf..0b323f6b554b 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1370,6 +1370,48 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> > >  	return ret;
> > >  }
> > >  
> > > +static int __maybe_unused rproc_attach(struct rproc *rproc)
> > > +{
> > > +	struct device *dev = &rproc->dev;
> > > +	int ret;
> > > +
> > 
> > For the case where we're going DETACHED -> RUNNING - > OFFLINE we
> > need to consider the pm_runtime (and prepare/unprepare) state of the
> > device as well...
> > 
> 
> Missed that you do indeed pm_runtime_get() in the calling function, so I
> think we're good on that part. Still need how to actually implement
> that (and the prepare/unprepare), in particular if we're moving into
> detaching a remoteproc.

I had planned to look at the interaction between the PM runtime and prepare/unprepare
callbacks later today.  Depending on what I find I may end up modifying this
patch... 

> 
> > 
> > Apart from that I think this looks good.
> > 
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Regards,
> Bjorn
> 
> > Regards,
> > Bjorn
> > 
> > > +	ret = rproc_prepare_subdevices(rproc);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
> > > +			rproc->name, ret);
> > > +		goto out;
> > > +	}
> > > +
> > > +	/* Attach to the remote processor */
> > > +	ret = rproc_attach_device(rproc);
> > > +	if (ret) {
> > > +		dev_err(dev, "can't attach to rproc %s: %d\n",
> > > +			rproc->name, ret);
> > > +		goto unprepare_subdevices;
> > > +	}
> > > +
> > > +	/* Start any subdevices for the remote processor */
> > > +	ret = rproc_start_subdevices(rproc);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to probe subdevices for %s: %d\n",
> > > +			rproc->name, ret);
> > > +		goto stop_rproc;
> > > +	}
> > > +
> > > +	rproc->state = RPROC_RUNNING;
> > > +
> > > +	dev_info(dev, "remote processor %s is now attached\n", rproc->name);
> > > +
> > > +	return 0;
> > > +
> > > +stop_rproc:
> > > +	rproc->ops->stop(rproc);
> > > +unprepare_subdevices:
> > > +	rproc_unprepare_subdevices(rproc);
> > > +out:
> > > +	return ret;
> > > +}
> > > +
> > >  /*
> > >   * take a firmware and boot a remote processor with it.
> > >   */
> > > -- 
> > > 2.20.1
> > > 
