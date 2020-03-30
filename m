Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4C4119878E
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 00:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729142AbgC3Woy (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 18:44:54 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34972 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgC3Wox (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 18:44:53 -0400
Received: by mail-pg1-f193.google.com with SMTP id k5so7180165pga.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2020 15:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PXNgVVQUXwm5Zphgjk1vjfZWFbQfN5YjBeASU3c6EaY=;
        b=ZN3x3HGMFg/lJhwUQnlWacirjdQILMoWCVyYyNA1M2u5s6LxY5L2V5V+bXSC+WXp9m
         wNkFrFvYlu3C399+qbQpN3fFx1ERvflYB9jlEsg6Uzb4ePT+0hbwiZpB+iDVEZmOL9qG
         I+fE2yVE7b3vtqZkJnSNn2Icnsejvei3oI2C8harRID1mNQOYeEL3dRmdfNsUnOdHztJ
         afAPDMvTxCfEzc0EJs3foCzZbZKAAaunG62JzjV25fRRTwALtennpni40A8zwThIOy9a
         nT7ZAkbVaKEFaFyo04aSpW0+iCo9+iPGT2WBbIeTY4le4qyYaKuqyul8EXw54QR6iLfZ
         OaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PXNgVVQUXwm5Zphgjk1vjfZWFbQfN5YjBeASU3c6EaY=;
        b=NEz0qj4g83E2MSJ4+fhZ3R7O8NvmU1PiDQGKMynM7azHChx1vc0icb601Ao7VvTRVy
         hg8LCtbRdQLdRRIHor+TmELIbwQA2+fBLd5VlUT/qNM5rf/wonMZGVM8ylLwGzS/+NJF
         4KroHHVIO8L0LgxMpBy4tPpGOiX1Zyde1f8km9TMukgCJM7PCx1vRro9CJbziOfPVmF7
         Qut/1rhZJF8QQhVXndI0W0jYj9qEFbi5yE1hsJh0sxiHvfTvW/SuOveoDn8Bq6/ADD7s
         bazV3qm5lgZI5M7uViqT1A0KlTk2+HLBBUqiXvVqRmK7G9+6UyKSdpV+bBMDbv8hj78O
         fMYQ==
X-Gm-Message-State: ANhLgQ3afAaQMsxa1U0XXb5oHV+xoVQ6tl/TrhSy59x9V1Fa3z47MLh+
        ZoTC/KYGQPvqx7CQaquRG5BsPf8rHPA=
X-Google-Smtp-Source: ADFU+vvzSxXu6Qw4fpYvRjS6IJs5rL8xkwUpN1rQz+SKJZU1KOxCf+dHElMhULDziSO1Cz2xmqB8aA==
X-Received: by 2002:a63:1003:: with SMTP id f3mr14989405pgl.450.1585608292644;
        Mon, 30 Mar 2020 15:44:52 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id a3sm10954365pfg.172.2020.03.30.15.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 15:44:52 -0700 (PDT)
Date:   Mon, 30 Mar 2020 16:44:50 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Loic PALLARDY <loic.pallardy@st.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH 06/11] remoteproc: stm32: Get coprocessor state
Message-ID: <20200330224450.GA31331@xps15>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-7-mathieu.poirier@linaro.org>
 <a1a4d8eb7da0468ea3e7125e0cb2e992@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1a4d8eb7da0468ea3e7125e0cb2e992@SFHDAG7NODE2.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Mar 27, 2020 at 04:58:00PM +0000, Loic PALLARDY wrote:
> Hi Mathieu,
> 
> > -----Original Message-----
> > From: linux-remoteproc-owner@vger.kernel.org <linux-remoteproc-
> > owner@vger.kernel.org> On Behalf Of Mathieu Poirier
> > Sent: mardi 24 mars 2020 23:03
> > To: bjorn.andersson@linaro.org
> > Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> > anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> > <arnaud.pouliquen@st.com>; Fabien DESSENNE
> > <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> > Subject: [PATCH 06/11] remoteproc: stm32: Get coprocessor state
> > 
> > Introduce the required mechanic to get the state of the M4 when the
> > remoteproc core is initialising.
> > 
> > Mainly based on the work published by Arnaud Pouliquen [1].
> > 
> > [1]. https://patchwork.kernel.org/project/linux-
> > remoteproc/list/?series=239877
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/stm32_rproc.c | 29
> > +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/stm32_rproc.c
> > b/drivers/remoteproc/stm32_rproc.c
> > index 7d5d4a7dbb04..b8af15dd0510 100644
> > --- a/drivers/remoteproc/stm32_rproc.c
> > +++ b/drivers/remoteproc/stm32_rproc.c
> > @@ -38,6 +38,15 @@
> >  #define STM32_MBX_VQ1_ID	1
> >  #define STM32_MBX_SHUTDOWN	"shutdown"
> > 
> > +#define RSC_TBL_SIZE		(1024)
> > +
> > +#define M4_STATE_OFF		0
> > +#define M4_STATE_INI		1
> Typo M4_STATE_INI -> M4_STATE_INIT

Good catch

> 
> Else ok for me
> Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
> 
> Regards,
> Loic
> 
> > +#define M4_STATE_CRUN		2
> > +#define M4_STATE_CSTOP		3
> > +#define M4_STATE_STANDBY	4
> > +#define M4_STATE_CRASH		5
> > +
> >  struct stm32_syscon {
> >  	struct regmap *map;
> >  	u32 reg;
> > @@ -635,12 +644,23 @@ static int stm32_rproc_parse_dt(struct
> > platform_device *pdev,
> >  	return 0;
> >  }
> > 
> > +static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
> > +				     unsigned int *state)
> > +{
> > +	/* See stm32_rproc_parse_dt() */
> > +	if (!ddata->m4_state.map)
> > +		return -EINVAL;
> > +
> > +	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg,
> > state);
> > +}
> > +
> >  static int stm32_rproc_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct stm32_rproc *ddata;
> >  	struct device_node *np = dev->of_node;
> >  	struct rproc *rproc;
> > +	unsigned int state;
> >  	bool auto_boot = false;
> >  	int ret;
> > 
> > @@ -660,6 +680,15 @@ static int stm32_rproc_probe(struct platform_device
> > *pdev)
> >  	if (ret)
> >  		goto free_ddata;
> > 
> > +	ret = stm32_rproc_get_m4_status(ddata, &state);
> > +	if (ret) {
> > +		/*
> > +		 * We couldn't get the coprocessor's state, assume
> > +		 * it is not running.
> > +		 */
> > +		state = M4_STATE_OFF;
> > +	}
> > +
> >  	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL,
> > sizeof(*ddata));
> >  	if (!rproc) {
> >  		ret = -ENOMEM;
> > --
> > 2.20.1
> 
