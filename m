Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A87CB1987D3
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 01:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729024AbgC3XH7 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 19:07:59 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46846 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729239AbgC3XH7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 19:07:59 -0400
Received: by mail-pg1-f195.google.com with SMTP id k191so9398837pgc.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2020 16:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/8qe/JvyxE1OtoBH2Y+XD2Awmei79eeW/32bEcS2pBs=;
        b=Epw1YChYjKLnN930fxTG7Br7o8eOZaSLW9vwASAatZ00Qh8eKbgdw6+y+EJLpVvVPc
         T69kyxjMp8/mZj4+yJzutqYyxCUb03BtdkPQ3MwXynG3/QsnmI+KrJNzo4fkQxyvfMs6
         xXJO3hEw4GW+yDN5tmDR330V9H1QKJkc9Lf0SfonGVkONxaYgiIIJKNhiv1et41oqu7t
         0T5JYGvyf6YTPr/8xTLCsaasoMINsk8sWHf+OjyO+eeg6cuEBEQcm9klsUqkTHO7Hj31
         S7Kki4RDhZc3cC9/svFeaOvd+5EYlSLceHAG/+SIhaJe4LzsAU9Ysd2pcGtUomFUrj1I
         qTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/8qe/JvyxE1OtoBH2Y+XD2Awmei79eeW/32bEcS2pBs=;
        b=fW+7/aJDhWibVYxwjq3CQtMaj60b3B3IaSWNBGobtT1qfR27uJ6yJtwmIlRqiiEl9C
         UwGdnlAtnKSn58LNLi5RW46HmL19PLdtthsFwkCEPcJ/s7vvSHAfSFPgK/mX3szJigun
         pOoMLkdE64OeFjix8exey3RY+YacYEopqqR51OYTP0AnKt9RJNiTVewK7HpauO4MxCzT
         gFcegk+z1aByEY1/OYB33E0Z3iDIjXtcQ3oM3cnyUqZyM/rA6iY9OqDMrMG8e56Vk8TN
         fl/Hj1iaJHVMnNa9snxde+aIK1blygNe49mNYamOew5haPRBeDXMa9XTZBY2o37mQ2E0
         wKYQ==
X-Gm-Message-State: ANhLgQ1IwZPIl3CACPX3vU8pBuDwwNQR3dh860sZ6dpZqIo4QarM9yrd
        rFR+y8Wiz/07B0sSXZ/ktWRBKHiIpg8=
X-Google-Smtp-Source: ADFU+vt5N8eZXtEfsa2V7DQBznKi80cqpyC6zWo0cP7bAfSrar8FE1osXZVDh6QLOXvQoo2MOLCB5A==
X-Received: by 2002:a63:7c48:: with SMTP id l8mr14651672pgn.150.1585609678715;
        Mon, 30 Mar 2020 16:07:58 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 11sm10967142pfz.91.2020.03.30.16.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 16:07:58 -0700 (PDT)
Date:   Mon, 30 Mar 2020 17:07:56 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Loic PALLARDY <loic.pallardy@st.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v2 06/17] remoteproc: Introduce function
 rproc_alloc_internals()
Message-ID: <20200330230756.GC31331@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-7-mathieu.poirier@linaro.org>
 <064cda96467f4ab39b494d543198fa7e@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <064cda96467f4ab39b494d543198fa7e@SFHDAG7NODE2.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Mar 27, 2020 at 11:10:20AM +0000, Loic PALLARDY wrote:
> Hi Mathieu,
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: mardi 24 mars 2020 22:46
> > To: bjorn.andersson@linaro.org
> > Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> > anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> > <arnaud.pouliquen@st.com>; Fabien DESSENNE
> > <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> > Subject: [PATCH v2 06/17] remoteproc: Introduce function
> > rproc_alloc_internals()
> > 
> > In preparation to allocate the synchronisation operation and state
> > machine, spin off a new function in order to keep rproc_alloc() as
> > clean as possible.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 26 ++++++++++++++++++++++---
> > -
> >  1 file changed, 22 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> > b/drivers/remoteproc/remoteproc_core.c
> > index ee277bc5556c..9da245734db6 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -2018,6 +2018,26 @@ static int rproc_alloc_ops(struct rproc *rproc,
> > const struct rproc_ops *ops)
> >  	return 0;
> >  }
> > 
> > +static int rproc_alloc_internals(struct rproc *rproc, const char *name,
> > +				 const struct rproc_ops *boot_ops,
> > +				 const char *firmware, int len)
> 
> len argument is not used in the patch nor in the following, maybe removed from my pov.

I debated over this one... It is either introduce the function signature as a
whole or incrementally as parameters are needed.  I'm fine with both and will
adopt the latter on the next revision.

> 
> Regards,
> Loic
> > +{
> > +	int ret;
> > +
> > +	/* We have a boot_ops so allocate firmware name and operations */
> > +	if (boot_ops) {
> > +		ret = rproc_alloc_firmware(rproc, name, firmware);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret = rproc_alloc_ops(rproc, boot_ops);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * rproc_alloc() - allocate a remote processor handle
> >   * @dev: the underlying device
> > @@ -2064,10 +2084,8 @@ struct rproc *rproc_alloc(struct device *dev, const
> > char *name,
> >  	rproc->dev.class = &rproc_class;
> >  	rproc->dev.driver_data = rproc;
> > 
> > -	if (rproc_alloc_firmware(rproc, name, firmware))
> > -		goto out;
> > -
> > -	if (rproc_alloc_ops(rproc, ops))
> > +	if (rproc_alloc_internals(rproc, name, ops,
> > +				  firmware, len))
> >  		goto out;
> > 
> >  	/* Assign a unique device index and name */
> > --
> > 2.20.1
> 
