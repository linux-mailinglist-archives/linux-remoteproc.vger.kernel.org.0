Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B85E19B7FE
	for <lists+linux-remoteproc@lfdr.de>; Wed,  1 Apr 2020 23:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732560AbgDAV6H (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 1 Apr 2020 17:58:07 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39064 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732527AbgDAV6H (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Apr 2020 17:58:07 -0400
Received: by mail-pg1-f194.google.com with SMTP id g32so806795pgb.6
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Apr 2020 14:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QI/0JyHpVqyQqD1kW/QZtH0BzyMB6CqNf1gLvXMd+T4=;
        b=dbPpPKSrZUva4g3sSiu1U3w2c86Rt7tO2oK5e4tQpiI9xDFBqGT5MdkQ9xQSPIJWE+
         hl/tP2bWvJJDukT1hYVPdWMoJTAXxzl/5EVq6dBkIjNcvMeAv57QtAmqCFJczIyucAVB
         FeZvTsANYu3SF6xxK7daBVIAAWZDmjkAqF+B2ixKLpPuJVX2+0CvA49vg1jTk4gPrV7m
         FmYTfGAk9SE2CMtfKo1bQ/6yKjtNIywHlNWlRL7JeUzRRApj46cEp4n/eNKAaX5vvMWp
         WdxvrpBKj+dYZdtJ3UQPUYpWmQ4/iUMNFqxg3R7M9gHAj5bqfBTmYFU9tSBT1YsOgq4O
         GA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QI/0JyHpVqyQqD1kW/QZtH0BzyMB6CqNf1gLvXMd+T4=;
        b=ucYNe8FnFf3gxd0KY+QsuyQrzqP2+Rv7WCZvGbrFAuMRl865JLgo9KIx26U6RWNLoB
         hedY5ssdVp/v8DK9cxhFGAlrgrE7ouatefmEBEYcEtYSrTJgyZBAUZtfF2cn64JzQtYy
         Q8PiUrZ5nMCUpC5O7uKLxh6EsKnALiIMZTzBV3PMrSTECfLBm0R/jtW2lEeIHCREvD43
         w2nbvqBenF7KTM8/fthhKzgJW6mt+UPp5O1NAz6KEDR/L2CZVcE29WgiZWkQQ01J3vBc
         g6nSZkAwHzf3DFe13B/Ry1kmfAZeJzBLzdwgwgMi+jPyVMGo9hWbgN8PhfHULKm8rDRP
         97qQ==
X-Gm-Message-State: ANhLgQ0ZGygOfHx8ZZKKNcv3+iGjjJE+fwSAvlCLb+lMIRBFcOxyVSGK
        S/sfi+uLCOc4D/hi/kc8c4vpgg==
X-Google-Smtp-Source: ADFU+vu2T4ckiEUd9+WL/ZZAsyk25wQL7MsAuf3WPJvWpX6zxFJpCEMbpvhUERjFE/WTucds+BSNAw==
X-Received: by 2002:aa7:9a4b:: with SMTP id x11mr25207871pfj.73.1585778286121;
        Wed, 01 Apr 2020 14:58:06 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id s76sm2119681pgc.64.2020.04.01.14.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 14:58:05 -0700 (PDT)
Date:   Wed, 1 Apr 2020 15:58:03 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Loic PALLARDY <loic.pallardy@st.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v2 03/17] remoteproc: Split firmware name allocation from
 rproc_alloc()
Message-ID: <20200401215803.GI17383@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-4-mathieu.poirier@linaro.org>
 <d0a399feb0f647ec98841ea8b8339449@SFHDAG7NODE2.st.com>
 <3cdc557f-61bf-fd0f-07b0-4ab5454f39f1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cdc557f-61bf-fd0f-07b0-4ab5454f39f1@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Mar 30, 2020 at 02:47:54PM -0500, Suman Anna wrote:
> Hi Mathieu,
> 
> On 3/27/20 6:05 AM, Loic PALLARDY wrote:
> > Hi Mathieu,
> > 
> >> -----Original Message-----
> >> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> Sent: mardi 24 mars 2020 22:46
> >> To: bjorn.andersson@linaro.org
> >> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> >> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> >> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> >> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> >> Subject: [PATCH v2 03/17] remoteproc: Split firmware name allocation from
> >> rproc_alloc()
> >>
> >> Make the firmware name allocation a function on its own in order to
> >> introduce more flexibility to function rproc_alloc().
> 
> I see patches 3 through 5 are generic cleanups, can you post them
> separately from this series? Bjorn has commented about using the
> put_device() to free the code on one of the remoteproc core patches [1]
> in my R5 patch series, and I can do my patch on top of yours. I plan to
> split out those 2 core patches for my next version, and can do them on
> top of these.

That shouldn't be a problem.

> 
> [1] https://patchwork.kernel.org/patch/11456385/#23248321
> 
> >>
> >> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c | 62 +++++++++++++++++-----------
> >>  1 file changed, 39 insertions(+), 23 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c
> >> b/drivers/remoteproc/remoteproc_core.c
> >> index 097f33e4f1f3..c0871f69929b 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -1962,6 +1962,36 @@ static const struct device_type rproc_type = {
> >>  	.release	= rproc_type_release,
> >>  };
> >>
> >> +static int rproc_alloc_firmware(struct rproc *rproc,
> >> +				const char *name, const char *firmware)
> >> +{
> >> +	char *p, *template = "rproc-%s-fw";
> >> +	int name_len;
> >> +
> >> +	if (!rproc || !name)
> >> +		return -EINVAL;
> 
> This is an internal function, and these are already checked in
> rproc_alloc(), so you can drop this.
> 
> >> +
> >> +	if (!firmware) {
> >> +		/*
> >> +		 * If the caller didn't pass in a firmware name then
> >> +		 * construct a default name.
> >> +		 */
> >> +		name_len = strlen(name) + strlen(template) - 2 + 1;
> >> +		p = kmalloc(name_len, GFP_KERNEL);
> >> +		if (!p)
> >> +			return -ENOMEM;
> >> +		snprintf(p, name_len, template, name);
> >> +	} else {
> >> +		p = kstrdup(firmware, GFP_KERNEL);
> >> +		if (!p)
> >> +			return -ENOMEM;
> >> +	}
> >> +
> >> +	rproc->firmware = p;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  /**
> >>   * rproc_alloc() - allocate a remote processor handle
> >>   * @dev: the underlying device
> >> @@ -1990,42 +2020,24 @@ struct rproc *rproc_alloc(struct device *dev,
> >> const char *name,
> >>  			  const char *firmware, int len)
> >>  {
> >>  	struct rproc *rproc;
> >> -	char *p, *template = "rproc-%s-fw";
> >> -	int name_len;
> >>
> >>  	if (!dev || !name || !ops)
> >>  		return NULL;
> >>
> >> -	if (!firmware) {
> >> -		/*
> >> -		 * If the caller didn't pass in a firmware name then
> >> -		 * construct a default name.
> >> -		 */
> >> -		name_len = strlen(name) + strlen(template) - 2 + 1;
> >> -		p = kmalloc(name_len, GFP_KERNEL);
> >> -		if (!p)
> >> -			return NULL;
> >> -		snprintf(p, name_len, template, name);
> >> -	} else {
> >> -		p = kstrdup(firmware, GFP_KERNEL);
> >> -		if (!p)
> >> -			return NULL;
> >> -	}
> >> -
> >>  	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
> >> -	if (!rproc) {
> >> -		kfree(p);
> >> +	if (!rproc)
> >>  		return NULL;
> >> -	}
> >> +
> >> +	if (rproc_alloc_firmware(rproc, name, firmware))
> >> +		goto free_rproc;
> 
> Since you are already moving this after rproc_alloc() here in this
> patch, you might as well fold the relevant patch 5 contents here?
> Otherwise, retain the existing code as is, and do all the movement in
> patch 5.
> 
> regards
> Suman
> 
> >>
> >>  	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
> >>  	if (!rproc->ops) {
> >> -		kfree(p);
> >> +		kfree(rproc->firmware);
> >>  		kfree(rproc);
> > Small remark only for patch coherency, as it is modified in next patches.
> > Use free_rproc label which is introduced just below here for error management.
> > 
> > Regards,
> > Loic
> >>  		return NULL;
> >>  	}
> >>
> >> -	rproc->firmware = p;
> >>  	rproc->name = name;
> >>  	rproc->priv = &rproc[1];
> >>  	rproc->auto_boot = true;
> >> @@ -2073,6 +2085,10 @@ struct rproc *rproc_alloc(struct device *dev, const
> >> char *name,
> >>  	rproc->state = RPROC_OFFLINE;
> >>
> >>  	return rproc;
> >> +
> >> +free_rproc:
> >> +	kfree(rproc);
> >> +	return NULL;
> >>  }
> >>  EXPORT_SYMBOL(rproc_alloc);
> >>
> >> --
> >> 2.20.1
> > 
> 
