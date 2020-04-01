Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABE319B798
	for <lists+linux-remoteproc@lfdr.de>; Wed,  1 Apr 2020 23:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732821AbgDAV3P (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 1 Apr 2020 17:29:15 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42184 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732527AbgDAV3P (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Apr 2020 17:29:15 -0400
Received: by mail-pf1-f193.google.com with SMTP id 22so656568pfa.9
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Apr 2020 14:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=k9BX6O1YLLG8qV4ngzW37WUn29QYOX8FlJFtZOt9oY0=;
        b=vkhoyyoRCAk5sP4c6w6HoSus1ZNuJomV9HWIp3SKUbl0eCuiO9D3zWZHuqaXqe5CBM
         2bg6JG5uMo28JSUvhdsTNoKr63h+tiQ9c+27Qu8jdOCTXIy0EfPfrfDouCH9L6EzbZY7
         isqM/p3r+DU5dv1VtsOyhWGRt0q1+ncs8uE4cwa5e2GueLCyrWEQ86OOV/R1iFUXLGyx
         OC5yptKzxXBXG4KDqKhjL4ou/OAN+rdn2GvadiZ42a2+bn9sJYiaOUHJQ1Hv377M+NQs
         hfkV77IJjHWweYVGU3RRyKE5iWYHEG2E/w02CMSiW9uNkUAy04mrWqnsWggiRicto8To
         JWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k9BX6O1YLLG8qV4ngzW37WUn29QYOX8FlJFtZOt9oY0=;
        b=R2SFoyk/2cBzqpQEXu35lLONoGWYgGfNkpaE9UHPQt98cx6NSe8Pk7fD8qrwWnzsqc
         OjFQ5eBvHjoEkZfXXU4fjQfaYmB5tF5uqbuj5QZPmeV4uiR0My7nCyBF67pp3NLx91Ge
         sHlrXK42t8rI04MccYxNbiGV2NsYPjqX6E5Myydi8/TVET0EN0QINVDSTUcOEhGxUH1O
         N3cawZt5b3JBYpiY9bONUjpfszwB0m9Av/Tt7czpLpJgzjtPrGsRq+Q+TDQYbwf6ZpS2
         5Qwv94ku6McqEiFlvsXtqXLhvgfqLyVCd0/td4BvXzHBlr31QNxUhk+swA27RrHyqSeh
         C96w==
X-Gm-Message-State: ANhLgQ2wOuanFRDz/3pMTpW4THCQ+wmcFr/Th3oC4xwi2oBCL3HkNJ2h
        iYSGgv3yDU0DkAILRS+U6Sp5mw==
X-Google-Smtp-Source: ADFU+vuGkrNi7q1OlqFdKGvUOONz0BbZ1aAXwj1U5J6ef/x/6dHv9Vn8rAMyqh3KIkT2gOAdcBrEeA==
X-Received: by 2002:a62:76c3:: with SMTP id r186mr25217511pfc.303.1585776552924;
        Wed, 01 Apr 2020 14:29:12 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q103sm6572998pjc.1.2020.04.01.14.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 14:29:12 -0700 (PDT)
Date:   Wed, 1 Apr 2020 15:29:10 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Loic PALLARDY <loic.pallardy@st.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v2 16/17] remoteproc: Correctly deal with MCU
 synchronisation when changing state
Message-ID: <20200401212910.GE17383@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-17-mathieu.poirier@linaro.org>
 <c9fb2f50e93b4f8dad43392bf61f736a@SFHDAG7NODE2.st.com>
 <20200330234934.GH31331@xps15>
 <5223cca7-5409-a113-8a7f-9f6923231353@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5223cca7-5409-a113-8a7f-9f6923231353@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 31, 2020 at 05:35:58PM -0500, Suman Anna wrote:
> Hi Mathieu,
> 
> On 3/30/20 6:49 PM, Mathieu Poirier wrote:
> > On Fri, Mar 27, 2020 at 02:04:36PM +0000, Loic PALLARDY wrote:
> >>
> >>
> >>> -----Original Message-----
> >>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>> Sent: mardi 24 mars 2020 22:46
> >>> To: bjorn.andersson@linaro.org
> >>> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> >>> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> >>> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> >>> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> >>> Subject: [PATCH v2 16/17] remoteproc: Correctly deal with MCU
> >>> synchronisation when changing state
> >>>
> >>> This patch deals with state changes when synchronising with an MCU. More
> >>> specifically it prevents the MCU from being started if it already has been
> >>> started by another entity.  Similarly it prevents the AP from stopping the
> >>> MCU if it hasn't been given the capability by platform firmware.
> >>>
> >>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>> ---
> >>>  drivers/remoteproc/remoteproc_sysfs.c | 32
> >>> ++++++++++++++++++++++++++-
> >>>  1 file changed, 31 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
> >>> b/drivers/remoteproc/remoteproc_sysfs.c
> >>> index 4956577ad4b4..741a3c152b82 100644
> >>> --- a/drivers/remoteproc/remoteproc_sysfs.c
> >>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> >>> @@ -108,6 +108,29 @@ static ssize_t state_show(struct device *dev, struct
> >>> device_attribute *attr,
> >>>  	return sprintf(buf, "%s\n", rproc_state_string[state]);
> >>>  }
> >>>
> >>> +static int rproc_can_shutdown(struct rproc *rproc)
> >>> +{
> >>> +	/* The MCU is not running, obviously an invalid operation. */
> >>> +	if (rproc->state != RPROC_RUNNING)
> >>> +		return false;
> >>> +
> >>> +	/*
> >>> +	 * The MCU is not running (see above) and the remoteproc core is
> >>> the
> >>> +	 * lifecycle manager, no problem calling for a shutdown.
> >>> +	 */
> >>> +	if (!rproc_sync_with_mcu(rproc))
> >>> +		return true;
> >>> +
> >>> +	/*
> >>> +	 * The MCU has been loaded by another entity (see above) and the
> >>> +	 * platform code has _not_ given us the capability of stopping it.
> >>> +	 */
> >>> +	if (!rproc->sync_ops->stop)
> >>> +		return false;
> >>
> >> Test could be simplified
> >> if (rproc_sync_with_mcu(rproc)) && !rproc->sync_ops->stop)
> >> 	return false;
> > 
> > I laid out the test individually on purpose.  That way there is no coupling
> > between conditions, it is plane to see what is going on and remains maintainable
> > as we add new tests.
> > 
> >>
> >>> +
> >>> +	return true;
> >>> +}
> >>> +
> >>>  /* Change remote processor state via sysfs */
> >>>  static ssize_t state_store(struct device *dev,
> >>>  			      struct device_attribute *attr,
> >>> @@ -120,11 +143,18 @@ static ssize_t state_store(struct device *dev,
> >>>  		if (rproc->state == RPROC_RUNNING)
> >>>  			return -EBUSY;
> >>>
> >>> +		/*
> >>> +		 * In synchronisation mode, booting the MCU is the
> >>> +		 * responsibility of an external entity.
> >>> +		 */
> >>> +		if (rproc_sync_with_mcu(rproc))
> >>> +			return -EINVAL;
> >>> +
> >> I don't understand this restriction, simply because it is preventing to resynchronize with a
> >> coprocessor after a "stop".
> 
> There's actually one more scenario even without "stop". If auto_boot is
> set to false, then rproc_actuate will never get called.

I fail to fully understand the situation you are describing - can you give me
more information?

> 
> >> In the following configuration which can be configuration for coprocessor with romed/flashed
> >> firmware (no reload needed):
> >> on_init = true
> >> after_stop = true
> >> after_crash = true
> >> Once you stop it via sysfs interface, you can't anymore restart/resync to it.
> > 
> > Very true.  The MCU will get restarted by another entity but the AP won't
> > synchronise with it.  I need more time to think about the best way to deal with
> > this and may have to get back to you for further discussions.
> > 
> >>
> >> I think it will be better to modify rproc_boot() to take into account rproc_sync_with_mcu()
> >> as below:
> >>
> >> int rproc_boot(struct rproc *rproc)
> >>  {
> >> -	const struct firmware *firmware_p;
> >> +	const struct firmware *firmware_p = NULL;
> >>  	struct device *dev = &rproc->dev;
> >>  	int ret;
> >>  
> >>  	if (!rproc) {
> >>  		pr_err("invalid rproc handle\n");
> >>  		return -EINVAL;
> >>  	}
> >>  
> >>  	/* load firmware */
> >> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> >> -	if (ret < 0) {
> >> -		dev_err(dev, "request_firmware failed: %d\n", ret);
> >> -		return ret;
> >> +	if (!rproc_sync_with_mcu(rproc)) {
> 
> I guess this is what the original skip_fw_load was doing. And with the
> current series, the userspace loading support usecase I have cannot be
> achieved. If this is added back, I can try if that works for my usecases.
> 
> >> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
> >> +		if (ret < 0) {
> >> +			dev_err(dev, "request_firmware failed: %d\n", ret);
> >> +			return ret;
> >> +		}
> >>  	}
> >>  
> >>  	ret = rproc_actuate(rproc, firmware_p);
> >>  
> >> -	release_firmware(firmware_p);
> >> +	if (firmware_p)
> >> +		release_firmware(firmware_p);
> >>  
> >>  	return ret;
> >>  }
> >>  
> >> Thanks to these modifications, I'm able to resync after a stop with coprocessor without reloading firmware.
> >>
> >>>  		ret = rproc_boot(rproc);
> >>>  		if (ret)
> >>>  			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
> >>>  	} else if (sysfs_streq(buf, "stop")) {
> >>> -		if (rproc->state != RPROC_RUNNING)
> >>> +		if (!rproc_can_shutdown(rproc))
> >>>  			return -EINVAL;
> >>>
> >>>  		rproc_shutdown(rproc);
> >> As rproc shutdown is also accessible as kernel API, I propose to move
> >> rproc_can_shutdown() check inside rproc_shutdown() and to test
> >> returned error
> > 
> > Ah yes, it is public...  As you point out, I think we'll need to move
> > rproc_can_shutdown() in rproc_shutdown().
> 
> I am assuming only the new conditions, right?

Once again I fail to grasp the extent of your comment.  Can you be more specific
about the "new conditions"?

Thanks
Mathieu

> 
> regards
> Suman
> 
> > 
> > Thank you for taking the time to review this set,
> > Mathieu
> > 
