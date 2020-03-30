Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2991B1987A3
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 00:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728880AbgC3W4h (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 18:56:37 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38158 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgC3W4h (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 18:56:37 -0400
Received: by mail-pl1-f196.google.com with SMTP id w3so7351853plz.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2020 15:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LqW+k9ssfI1/+RyuTLs1LIxwPenIt8xaGdO0xqQZp9g=;
        b=qEQ3bdf1H7heBSUdmdKFORjhyoCl+k+vT0hAhulX0ndmgq+VgqvL6zhFAo8MnNbzOz
         dz5HmJRT+SyVizwlajmaoZd/NTTlBFpAybDUd8II0y57L5nd4tH3Z7ODsDGeMtrFVR02
         rXf/OC7QXWnPUM8/a2aNIGwYS3m+h9KRSJNjSOPvGikHPWJkOCBOL+qxAztLuzQ6HMHQ
         EUttOjqus8CvNTLzLN0WR6YAabvx6wAH8DzLiGjkYiT9fU6Ao8ztDtrf4lnnZOrlfbRJ
         kqg24NhgrjOjoBzb5cRh4lPrkTduQfdKQR2+H7e95TmflZ34REDxCrmRlyfm1YtJ7DYu
         DXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LqW+k9ssfI1/+RyuTLs1LIxwPenIt8xaGdO0xqQZp9g=;
        b=iH20Y0lEqfervXYAvIYs4qErtohiyt+88UDVLUy/Z94zUtfWaF2tLa3KK6MtTnKXZk
         9/XgBO4inZSfAT/xhr7v0Ce13nSbHa4wTTuKX4VmZXpOuXzc5GkuW7NymK3H/Ho2cZRu
         2PAmNs6i/Lxn84uzR/W349DqdEmu/Fj3LVadGtUG5QRl5EyT3rlByXn4OWdM+sfbASO0
         oG+9Yo0YdpOjKYPzn72p+5yBoyLZ6GozbuNHfeHnzaDe5XK36ET1RVvSB7dgED9G0Vow
         10VlA2cAdECuYC86IaZ9XkDkCFI+n7hqubP8HLFwZ2OE0BNKo3llUCtpmiddxMAQvRt0
         WqJg==
X-Gm-Message-State: AGi0PuYt4/nKJc1rAN/JJEqhOb/W1N4Z/E1ccY4JRUh1+2mHOSo7JjWw
        hs8+96kMkGLGwLbLu3oDfjopBQ==
X-Google-Smtp-Source: APiQypJLr0f4+8oLc4Kelyv6iXUVPVo89DqvrOc20hxa2gOrfKLtE7WpZPgm4mOtC4189r0GxoFdSA==
X-Received: by 2002:a17:90a:c20b:: with SMTP id e11mr423798pjt.57.1585608996200;
        Mon, 30 Mar 2020 15:56:36 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y131sm10902690pfb.78.2020.03.30.15.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 15:56:35 -0700 (PDT)
Date:   Mon, 30 Mar 2020 16:56:33 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Loic PALLARDY <loic.pallardy@st.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH 08/11] remoteproc: stm32: Introduce new start and stop
 ops for synchronisation
Message-ID: <20200330225633.GB31331@xps15>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-9-mathieu.poirier@linaro.org>
 <cf76679a1a7248df9620aeb2ca659062@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf76679a1a7248df9620aeb2ca659062@SFHDAG7NODE2.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Mar 27, 2020 at 05:04:34PM +0000, Loic PALLARDY wrote:
> Hi Mathieu,
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: mardi 24 mars 2020 23:03
> > To: bjorn.andersson@linaro.org
> > Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> > anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> > <arnaud.pouliquen@st.com>; Fabien DESSENNE
> > <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> > Subject: [PATCH 08/11] remoteproc: stm32: Introduce new start and stop ops
> > for synchronisation
> > 
> > Introduce new start and stop rproc_ops functions to be used when
> > synchonising with an MCU.
> > 
> > Mainly based on the work published by Arnaud Pouliquen [1].
> > 
> > [1]. https://patchwork.kernel.org/project/linux-
> > remoteproc/list/?series=239877
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/stm32_rproc.c | 37
> > ++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/stm32_rproc.c
> > b/drivers/remoteproc/stm32_rproc.c
> > index 5bac0baf8f4c..734605a9223e 100644
> > --- a/drivers/remoteproc/stm32_rproc.c
> > +++ b/drivers/remoteproc/stm32_rproc.c
> > @@ -449,6 +449,13 @@ static int stm32_rproc_start(struct rproc *rproc)
> >  	return stm32_rproc_set_hold_boot(rproc, true);
> >  }
> > 
> > +static int stm32_rproc_sync_start(struct rproc *rproc)
> > +{
> > +	stm32_rproc_add_coredump_trace(rproc);
> > +
> > +	return stm32_rproc_set_hold_boot(rproc, true);
> > +}
> > +
> >  static int stm32_rproc_stop(struct rproc *rproc)
> >  {
> >  	struct stm32_rproc *ddata = rproc->priv;
> > @@ -489,6 +496,30 @@ static int stm32_rproc_stop(struct rproc *rproc)
> >  	return 0;
> >  }
> > 
> > +static int stm32_rproc_sync_stop(struct rproc *rproc)
> > +{
> > +	struct stm32_rproc *ddata = rproc->priv;
> > +	int err;
> > +
> > +	err = stm32_rproc_stop(rproc);
> > +	if (err)
> > +		return err;
> > +
> > +	/* update copro state to OFF */
> > +	if (ddata->m4_state.map) {
> > +		err = regmap_update_bits(ddata->m4_state.map,
> > +					 ddata->m4_state.reg,
> > +					 ddata->m4_state.mask,
> > +					 M4_STATE_OFF);
> > +		if (err) {
> > +			dev_err(&rproc->dev, "failed to set copro state\n");
> > +			return err;
> > +		}
> > +	}
> In fact m4_state is updated in following way:
> - it is set by Linux when M4 is guarantee, that means only when Linux is stopping the M4.
> in that case M4 is under reset and m4_state could be updated to M4_STATE_OFF
> - for all other states, it is M4 responsibility to update m4_state when running
> That means the code above is common to both stm32_rproc_stop() and stm32_rproc_sync_stop().
> Only one function is required.

Very well, I'll get it fixed.

> 
> Regards,
> Loic
> > +
> > +	return 0;
> > +}
> > +
> >  static void stm32_rproc_kick(struct rproc *rproc, int vqid)
> >  {
> >  	struct stm32_rproc *ddata = rproc->priv;
> > @@ -522,6 +553,12 @@ static struct rproc_ops st_rproc_ops = {
> >  	.get_boot_addr	= rproc_elf_get_boot_addr,
> >  };
> > 
> > +static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
> > +	.start		= stm32_rproc_sync_start,
> > +	.stop		= stm32_rproc_sync_stop,
> > +	.kick		= stm32_rproc_kick,
> > +};
> > +
> >  static const struct of_device_id stm32_rproc_match[] = {
> >  	{ .compatible = "st,stm32mp1-m4" },
> >  	{},
> > --
> > 2.20.1
> 
