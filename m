Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF281960B3
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 22:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727585AbgC0Vtu (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 17:49:50 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39802 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727473AbgC0Vtt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 17:49:49 -0400
Received: by mail-pf1-f194.google.com with SMTP id d25so5114474pfn.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2020 14:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CDLu6trpOMmV70WHqdWAeYxqMaun7qvkBKGKhZ/S8eU=;
        b=o0Ya1ZGI+1TgIKnzmSov4JKNXvrcfV1GbI27nJEdSc6z7s6bD4EK0gfU7OhiFmnwt8
         Ye1vzOo2Ajg+fKy1ivqQg7ClxpXWqpRd5I0E2O2jUqWpIfpjHEOstYZXK1npC56EeMN6
         Vp4vcLg0kbzI+gUKYrbPuEeVKaE30DcGojt4WMAx4Xyigyzx7sgDC7SOqKb6HZzNUZGP
         /OAikXFe47hG/FQ0GxgfQojVAWzAHXnvGbFFKbDu8bVAgWj2Ns+zCnuPsQ7ds6aR2ecU
         jR+iv0Vw/OfXgyb29bHZG6lIMAKV+0D5Tbytwm0gu7AgBZjK8S7byBjH6DBd8CvIzYYp
         TDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CDLu6trpOMmV70WHqdWAeYxqMaun7qvkBKGKhZ/S8eU=;
        b=R9jv8yxWZawacK5V+7FMbdTmyfMMNPpdbY55Q3sdFLXoUdOVZVHDNfyPavkunoXQnv
         suXWuhh0A/XPKU9ldgz/4xv74QP1H3ba9PUWOMk2sOKBR5eb79U+evPVBPicL0AMA1J6
         TBpFOZyWTTXJze0+P4u30LF8AB+8FHm0BQ2MDsHbOP66nPLpX9V5BcVs+mr75gDe6Tzz
         JLh5KClxTgwNCmXlkQB4VjDAvX77GLffvu42Hq1h6b+i6Nd2pl+2kgz0t8pOmnu+D9fN
         xcqWPDReenXIOIyGU/hSJb9V2BvZZdyg6vi6j9dIsg80n+pOEiGIbFAup7++FSbvrTa8
         V1XA==
X-Gm-Message-State: ANhLgQ3WOK50O849OBj0/86grfdGb9FOyGn2oz7ElLP8+60rlvsJpNBP
        baiJoRQ5x5dYDXfd7CFUNpAi0Q==
X-Google-Smtp-Source: ADFU+vscVQDjUyyxMHc5n4FzQg+w/ebRC85W3cGqwuOJULTQnEYGena4WIPDiAkhp3DXx4UrOq1inA==
X-Received: by 2002:aa7:8586:: with SMTP id w6mr1276138pfn.140.1585345786910;
        Fri, 27 Mar 2020 14:49:46 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id g11sm4803739pfm.4.2020.03.27.14.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 14:49:46 -0700 (PDT)
Date:   Fri, 27 Mar 2020 15:49:44 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Loic PALLARDY <loic.pallardy@st.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH 11/11] remoteproc: stm32: Allocate rproc for
 synchronisation with MCU
Message-ID: <20200327214944.GA25303@xps15>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-12-mathieu.poirier@linaro.org>
 <fd4e531aa40b40bcb401268e720cefe6@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd4e531aa40b40bcb401268e720cefe6@SFHDAG7NODE2.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Mar 27, 2020 at 05:11:37PM +0000, Loic PALLARDY wrote:
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
> > Subject: [PATCH 11/11] remoteproc: stm32: Allocate rproc for
> > synchronisation with MCU
> > 
> > Allocate remote processor structure with state machine if the MCU
> > has already been started by an external entity.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/stm32_rproc.c | 19 ++++++++++++++++---
> >  1 file changed, 16 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/stm32_rproc.c
> > b/drivers/remoteproc/stm32_rproc.c
> > index 07be306c0fb1..f320ef9ee286 100644
> > --- a/drivers/remoteproc/stm32_rproc.c
> > +++ b/drivers/remoteproc/stm32_rproc.c
> > @@ -608,7 +608,7 @@ static struct rproc_ops st_rproc_ops = {
> >  	.get_boot_addr	= rproc_elf_get_boot_addr,
> >  };
> > 
> > -static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
> > +static struct rproc_ops st_rproc_sync_ops = {
> >  	.start		= stm32_rproc_sync_start,
> >  	.stop		= stm32_rproc_sync_stop,
> >  	.kick		= stm32_rproc_kick,
> > @@ -616,6 +616,12 @@ static __maybe_unused struct rproc_ops
> > st_rproc_sync_ops = {
> >  	.find_loaded_rsc_table =
> > stm32_rproc_sync_elf_find_loaded_rsc_table,
> >  };
> > 
> > +static struct rproc_sync_states st_sync_states = {
> > +	.on_init = true, /* sync with MCU when the kernel boots */
> > +	.after_stop = false, /* don't resync with MCU if stopped from sysfs
> > */
> > +	.after_crash = false, /* don't resync with MCU after a crash */
> > +};
> > +
> >  static const struct of_device_id stm32_rproc_match[] = {
> >  	{ .compatible = "st,stm32mp1-m4" },
> >  	{},
> > @@ -847,15 +853,22 @@ static int stm32_rproc_probe(struct
> > platform_device *pdev)
> >  		ret = stm32_rproc_get_loaded_rsc_table(pdev, ddata);
> >  		if (ret)
> >  			goto free_ddata;
> > +
> > +		rproc = rproc_alloc_state_machine(dev, np->name,
> > &st_rproc_ops,
> > +						  &st_rproc_sync_ops,
> > +						  &st_sync_states, NULL,
> > +						  sizeof(*ddata));
> Could we have only one call to rproc_alloc_state_machine(), simply configuring
> st_sync_states according to m4_state and other DT properties?

Yes, very much so - I'll do that for V2.

Mathieu

> 
> Regards,
> Loic
> > +	} else {
> > +		rproc = rproc_alloc(dev, np->name, &st_rproc_ops,
> > +				    NULL, sizeof(*ddata));
> > +		rproc->auto_boot = auto_boot;
> >  	}
> > 
> > -	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL,
> > sizeof(*ddata));
> >  	if (!rproc) {
> >  		ret = -ENOMEM;
> >  		goto free_ddata;
> >  	}
> > 
> > -	rproc->auto_boot = auto_boot;
> >  	rproc->has_iommu = false;
> >  	ddata->workqueue = create_workqueue(dev_name(dev));
> >  	if (!ddata->workqueue) {
> > --
> > 2.20.1
> 
