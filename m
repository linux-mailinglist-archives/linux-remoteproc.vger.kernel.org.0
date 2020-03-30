Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBE519888C
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 01:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgC3Xtk (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 19:49:40 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:53030 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728537AbgC3Xtj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 19:49:39 -0400
Received: by mail-pj1-f67.google.com with SMTP id ng8so308924pjb.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2020 16:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OJgoCyKGEitIp2Kz4mwPOKmjScKz6N0i1bJsXWsicdU=;
        b=PaN54bU1WGGDLsCGiVwD3bX1080H27EYZbVjPLOyKVYNRneb/+TEv4gUr/SxF68Qma
         2THrS05LDbzvDLK+Zrif6wnGp7TzrOkwWu99ORDPSyRiOYtSCEuQap5RmmGMMVM3pfCn
         SVDlVPuZQlUUvg92gTDizJiwwAKEgkf6vukkbN402xy3cHr0Rk5xVDuaDKBFFT2eIo6w
         q1QcTZvfPm5Npkpgi+PULE1aSJV6IHV34oQpdr3APrNz9zlALi6DPqtqk94fARodY6CH
         6h2BBkYi/8zLTNDJzMNfrCdcmaXlX7/qZvcUU2NOzy8F/mgqX8Ecy3LqwwjdjH7yrvJL
         OQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OJgoCyKGEitIp2Kz4mwPOKmjScKz6N0i1bJsXWsicdU=;
        b=d65Qva/H+Hg/NZVs0lsY/0LLUrGdvvfhhCwL46+w6f7n81ueZmBeJgFHW8sSjEOqg5
         ssHyPA4VNHu8uckTI8+KX4mupeub0zFH4Qi5MGNkFDn9oWjQkzP17uuPfmQLnbtYSFD9
         8s48zeQ7OG8R2I1Ll746DU6u1dIfdootTtg+YRNmS1QILflc+EoJCPqONGt9RjPuQjAb
         5hcWwZ9Ft3/JVDWyVbeVTItDiEylletxB7QGCushRqd54+B2vx9dSaQUoJSFR2YkwkMI
         F5GXS3CrfrIRZz4LjohumEKYaNfo3oA5UOOzNu1NC8avEeqUEvnIhZOcem9798VRUtgx
         ZmEA==
X-Gm-Message-State: AGi0PuatBVyQAotV5zu5DSSUMbmnrpBoz7K691fYQUPMKkYlx0SU9Uie
        A9c2bP2rZwbqT/0RpkOBJJBHfw==
X-Google-Smtp-Source: APiQypLjk5ENno6j5HbRSAjfa4hN2uSgtiBt6izh+tL0bNhgyBWFHhOgXOnGF+DgH6GA5boLc6+UzA==
X-Received: by 2002:a17:90a:9385:: with SMTP id q5mr622518pjo.133.1585612176570;
        Mon, 30 Mar 2020 16:49:36 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r189sm10574244pgr.31.2020.03.30.16.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 16:49:36 -0700 (PDT)
Date:   Mon, 30 Mar 2020 17:49:34 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Loic PALLARDY <loic.pallardy@st.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v2 16/17] remoteproc: Correctly deal with MCU
 synchronisation when changing state
Message-ID: <20200330234934.GH31331@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-17-mathieu.poirier@linaro.org>
 <c9fb2f50e93b4f8dad43392bf61f736a@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9fb2f50e93b4f8dad43392bf61f736a@SFHDAG7NODE2.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Mar 27, 2020 at 02:04:36PM +0000, Loic PALLARDY wrote:
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
> > Subject: [PATCH v2 16/17] remoteproc: Correctly deal with MCU
> > synchronisation when changing state
> > 
> > This patch deals with state changes when synchronising with an MCU. More
> > specifically it prevents the MCU from being started if it already has been
> > started by another entity.  Similarly it prevents the AP from stopping the
> > MCU if it hasn't been given the capability by platform firmware.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_sysfs.c | 32
> > ++++++++++++++++++++++++++-
> >  1 file changed, 31 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_sysfs.c
> > b/drivers/remoteproc/remoteproc_sysfs.c
> > index 4956577ad4b4..741a3c152b82 100644
> > --- a/drivers/remoteproc/remoteproc_sysfs.c
> > +++ b/drivers/remoteproc/remoteproc_sysfs.c
> > @@ -108,6 +108,29 @@ static ssize_t state_show(struct device *dev, struct
> > device_attribute *attr,
> >  	return sprintf(buf, "%s\n", rproc_state_string[state]);
> >  }
> > 
> > +static int rproc_can_shutdown(struct rproc *rproc)
> > +{
> > +	/* The MCU is not running, obviously an invalid operation. */
> > +	if (rproc->state != RPROC_RUNNING)
> > +		return false;
> > +
> > +	/*
> > +	 * The MCU is not running (see above) and the remoteproc core is
> > the
> > +	 * lifecycle manager, no problem calling for a shutdown.
> > +	 */
> > +	if (!rproc_sync_with_mcu(rproc))
> > +		return true;
> > +
> > +	/*
> > +	 * The MCU has been loaded by another entity (see above) and the
> > +	 * platform code has _not_ given us the capability of stopping it.
> > +	 */
> > +	if (!rproc->sync_ops->stop)
> > +		return false;
> 
> Test could be simplified
> if (rproc_sync_with_mcu(rproc)) && !rproc->sync_ops->stop)
> 	return false;

I laid out the test individually on purpose.  That way there is no coupling
between conditions, it is plane to see what is going on and remains maintainable
as we add new tests.

> 
> > +
> > +	return true;
> > +}
> > +
> >  /* Change remote processor state via sysfs */
> >  static ssize_t state_store(struct device *dev,
> >  			      struct device_attribute *attr,
> > @@ -120,11 +143,18 @@ static ssize_t state_store(struct device *dev,
> >  		if (rproc->state == RPROC_RUNNING)
> >  			return -EBUSY;
> > 
> > +		/*
> > +		 * In synchronisation mode, booting the MCU is the
> > +		 * responsibility of an external entity.
> > +		 */
> > +		if (rproc_sync_with_mcu(rproc))
> > +			return -EINVAL;
> > +
> I don't understand this restriction, simply because it is preventing to resynchronize with a
> coprocessor after a "stop".
> In the following configuration which can be configuration for coprocessor with romed/flashed
> firmware (no reload needed):
> on_init = true
> after_stop = true
> after_crash = true
> Once you stop it via sysfs interface, you can't anymore restart/resync to it.

Very true.  The MCU will get restarted by another entity but the AP won't
synchronise with it.  I need more time to think about the best way to deal with
this and may have to get back to you for further discussions.

> 
> I think it will be better to modify rproc_boot() to take into account rproc_sync_with_mcu()
> as below:
> 
> int rproc_boot(struct rproc *rproc)
>  {
> -	const struct firmware *firmware_p;
> +	const struct firmware *firmware_p = NULL;
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
>  	if (!rproc) {
>  		pr_err("invalid rproc handle\n");
>  		return -EINVAL;
>  	}
>  
>  	/* load firmware */
> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> -	if (ret < 0) {
> -		dev_err(dev, "request_firmware failed: %d\n", ret);
> -		return ret;
> +	if (!rproc_sync_with_mcu(rproc)) {
> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
> +		if (ret < 0) {
> +			dev_err(dev, "request_firmware failed: %d\n", ret);
> +			return ret;
> +		}
>  	}
>  
>  	ret = rproc_actuate(rproc, firmware_p);
>  
> -	release_firmware(firmware_p);
> +	if (firmware_p)
> +		release_firmware(firmware_p);
>  
>  	return ret;
>  }
>  
> Thanks to these modifications, I'm able to resync after a stop with coprocessor without reloading firmware.
> 
> >  		ret = rproc_boot(rproc);
> >  		if (ret)
> >  			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
> >  	} else if (sysfs_streq(buf, "stop")) {
> > -		if (rproc->state != RPROC_RUNNING)
> > +		if (!rproc_can_shutdown(rproc))
> >  			return -EINVAL;
> > 
> >  		rproc_shutdown(rproc);
> As rproc shutdown is also accessible as kernel API, I propose to move
> rproc_can_shutdown() check inside rproc_shutdown() and to test
> returned error

Ah yes, it is public...  As you point out, I think we'll need to move
rproc_can_shutdown() in rproc_shutdown().

Thank you for taking the time to review this set,
Mathieu

> 
> Regards,
> Loic
> > --
> > 2.20.1
> 
