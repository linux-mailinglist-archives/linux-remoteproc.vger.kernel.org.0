Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B61119881E
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 01:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729112AbgC3XVn (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 19:21:43 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54596 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728880AbgC3XVm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 19:21:42 -0400
Received: by mail-pj1-f65.google.com with SMTP id np9so278010pjb.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2020 16:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6avGp7ZozN9ccurRCoVuHrrwksuRT7KdK+5EoaEKUMA=;
        b=WB0nj3INMed0f6SAAVa2kWcHlr5nhIW++Nqqh+NzSqGpey39xZS7nXv6NnpcR4wAQw
         sQ1Ul+ATBPLp6dJXkskPGbWx2EBrZ5x0t3Y/yZ0GIXESjoOFj9zl8R7usbyMVDI7nak4
         avk9rY+9pLl4EtPFEer0c9pZu/q8wKVTxuG6xF/W6eEspKJScMWUZSTdV6QmPj3RCvaI
         suA1v0E9dXR5NqJFKJNy/+vgwVH/NsMAba4PaET74dX6LY/6q6nLa2AiiZ9ew1jXROCO
         dNzEd4XCFrNO9DMnoEev3+welbSDI48fWUOyNM/GH2Zl+bMxnLSSZGuncwzQwSpQOcm6
         H+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6avGp7ZozN9ccurRCoVuHrrwksuRT7KdK+5EoaEKUMA=;
        b=KOYhPR+qIHa+cxb39fETuLMndAtYzbJ+KQhEETpRPOgjg9ylt4jS/qiHf+Q5CWJ8sm
         lijlYYZzjKT0LOlQHoF9VJpmgA/Chk/TsjyIjYIjDKvTkZeM87RncKSRIudss8WIbgzZ
         7WuTc+y7612nIKi2M1FtVssPOG0PaJmPPqv4Iwvek0tuOwzFREwbMeph+0vwoi1JWEZ7
         x5ieOCPfSqPe5LSFCbx1mBvHz/T/KIqNCwZx/XJP/XLE2EvahENs03/+CItR/FQRqQgS
         7rD1wemXbanY41Av7ZgXHu0OCOtOLpial8dPohA/5fWF8i6O/HPkzxkuL+4fPwMFHfd4
         8zrg==
X-Gm-Message-State: AGi0PuY7PcsBsV+f1efH7El35LI9sVz6d1ur+7/f/etlxQ6N4Fk5oqdG
        Dz/lrCGziTWlhO3hkphcPoF0TA==
X-Google-Smtp-Source: APiQypIWc8khLmWSgmd0s1MOeQo9uVid1VfVjFMWPOKnZblhyhHskMYXP40XNAlgTXWiGZx2f60bNQ==
X-Received: by 2002:a17:90a:35ce:: with SMTP id r72mr560185pjb.126.1585610501595;
        Mon, 30 Mar 2020 16:21:41 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id i4sm10969765pfq.82.2020.03.30.16.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 16:21:40 -0700 (PDT)
Date:   Mon, 30 Mar 2020 17:21:39 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Loic PALLARDY <loic.pallardy@st.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v2 15/17] remoteproc: Correctly deal with MCU
 synchronisation when changing FW image
Message-ID: <20200330232139.GF31331@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-16-mathieu.poirier@linaro.org>
 <91d38ff6a39f4e07838d1e85c392eb8f@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91d38ff6a39f4e07838d1e85c392eb8f@SFHDAG7NODE2.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Mar 27, 2020 at 01:50:18PM +0000, Loic PALLARDY wrote:
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
> > Subject: [PATCH v2 15/17] remoteproc: Correctly deal with MCU
> > synchronisation when changing FW image
> > 
> > This patch prevents the firmware image from being displayed or changed
> > when
> > the remoteproc core is synchronising with an MCU. This is needed since
> > there is no guarantee about the nature of the firmware image that is loaded
> > by the external entity.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_sysfs.c | 25
> > ++++++++++++++++++++++++-
> >  1 file changed, 24 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_sysfs.c
> > b/drivers/remoteproc/remoteproc_sysfs.c
> > index 7f8536b73295..4956577ad4b4 100644
> > --- a/drivers/remoteproc/remoteproc_sysfs.c
> > +++ b/drivers/remoteproc/remoteproc_sysfs.c
> > @@ -13,9 +13,20 @@
> >  static ssize_t firmware_show(struct device *dev, struct device_attribute
> > *attr,
> >  			  char *buf)
> >  {
> > +	ssize_t ret;
> >  	struct rproc *rproc = to_rproc(dev);
> > 
> > -	return sprintf(buf, "%s\n", rproc->firmware);
> > +	/*
> > +	 * In most instances there is no guarantee about the firmware
> > +	 * that was loaded by the external entity.  As such simply don't
> > +	 * print anything.
> > +	 */
> > +	if (rproc_sync_with_mcu(rproc))
> > +		ret = sprintf(buf, "\n");
> Is it enough to provide empty name, or should we add a message to indicate that's name is unkown/undefined ?
>

Don't know... It is easy to find plenty of cases in sysfs where null values are
represented with a "\n", and just as many where "unknown", "undefined" or "-1"
are used. I know GKH prefers the least amount of information as possible, hence
going with a "\n".

Again, no strong opinion...

> Regards,
> Loic
> > +	else
> > +		ret = sprintf(buf, "%s\n", rproc->firmware);
> > +
> > +	return ret;
> >  }
> > 
> >  /* Change firmware name via sysfs */
> > @@ -33,6 +44,18 @@ static ssize_t firmware_store(struct device *dev,
> >  		return -EINVAL;
> >  	}
> > 
> > +	/*
> > +	 * There is no point in trying to change the firmware if the MCU
> > +	 * is currently running or if loading of the image is done by
> > +	 * another entity.
> > +	 */
> > +	if (rproc_sync_with_mcu(rproc)) {
> > +		dev_err(dev,
> > +			"can't change firmware while synchronising with
> > MCU\n");
> > +		err = -EBUSY;
> > +		goto out;
> > +	}
> > +
> >  	if (rproc->state != RPROC_OFFLINE) {
> >  		dev_err(dev, "can't change firmware while running\n");
> >  		err = -EBUSY;
> > --
> > 2.20.1
> 
