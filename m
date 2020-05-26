Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA1919CBC7
	for <lists+linux-remoteproc@lfdr.de>; Thu,  2 Apr 2020 22:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388606AbgDBUmg (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 2 Apr 2020 16:42:36 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:39449 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgDBUmg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Apr 2020 16:42:36 -0400
Received: by mail-pj1-f66.google.com with SMTP id z3so1967898pjr.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Apr 2020 13:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gKckCaiXPMMj/N3PazxOqnE/762vU43XC4nBiEyuEj0=;
        b=RGTpwyl1uPCpgiIQm5OZQdv9S511pegkaIhV5J5LQ7Yy43ilS4AG9Pu7t7jIirPzc3
         lFEllxMVU91MgWaDn2Uj+fumaWxv2dn+5GTcqGhB5H5Nh3oBrzqWyDgzTttDTeAQ3XuP
         6nz1IXgZBgUnt1iCqxU0DzsbmhzHHNScEyFuIKRYlsr9KbrtH1yl4cHwTYhu2hnZuENj
         kqUuYtHfSp7LvvAeHw1k3fQ46doDW2lLFYDDD0R/cHLaLrwEWqxtLfevEuL5+MRVeRqJ
         EEndn4m6dPdChF+VXRcbtSXHibhPAFeSfgf73GZeu4mv+nRprSouOcMC0qNDFbR+lRue
         la8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gKckCaiXPMMj/N3PazxOqnE/762vU43XC4nBiEyuEj0=;
        b=cxEV2qDKHuK5zP0E7UL/lbH+xcpKJ8ZaG27PLsnyy2LSTx3cTBmOe1xJ3vMkOmMnYi
         r12j6XafhfRxPpPGzhIUc0jQPJOERHOWCyrkoMAzBg6ia77ix2KaOsentA8IGHYeawcJ
         zgflud7l/zA+eOY81NbqgeF7InFzzdeODtibocswJOOYPCKepqWF2WkY2/zSLN9iNks/
         WkbTdTHV6IEkFVZsLoeMI4HL7KFqufxoZboKxLiIHm0kK1bJmnxW6WJr/yHLSTJKMV41
         aa0cfeFZkFa5I9Lhgu8qmSvOXWcK3gTg0yU/lTZfbhO2DJlgKUNCj9fYKAnWyzPEqwMy
         a9CA==
X-Gm-Message-State: AGi0Pua7R7IZwT+GImPbBW+p/cCBGWDnXVRRbjusUiE66mAT2jtxzb93
        8AEvIP3rgvbE/c7nLWbTOInSXQ==
X-Google-Smtp-Source: APiQypLuOl9ImLg69g1ApO1MLF+CjVlyKcxNONVYRTjNAJlg2hkWOFNnt0TMH/gEIOfCaOI9/jt0ng==
X-Received: by 2002:a17:90a:e982:: with SMTP id v2mr5915577pjy.1.1585860154784;
        Thu, 02 Apr 2020 13:42:34 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id t186sm3903977pgd.43.2020.04.02.13.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 13:42:34 -0700 (PDT)
Date:   Thu, 2 Apr 2020 14:42:31 -0600
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
Message-ID: <20200402204231.GC9160@xps15>
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

Hi Suman,

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

I didn't notice this comment upon first read... Can you give me more details on
what your usecase is order to see how best to deal with it?

Thanks,
Mathieu

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
> 
> regards
> Suman
> 
> > 
> > Thank you for taking the time to review this set,
> > Mathieu
> > 
