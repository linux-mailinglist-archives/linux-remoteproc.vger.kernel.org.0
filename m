Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1504119B750
	for <lists+linux-remoteproc@lfdr.de>; Wed,  1 Apr 2020 22:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732793AbgDAUzk (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 1 Apr 2020 16:55:40 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:33587 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732742AbgDAUzk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Apr 2020 16:55:40 -0400
Received: by mail-pj1-f67.google.com with SMTP id jz1so2552625pjb.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Apr 2020 13:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CAXR2YSo+1tvIfG0GbB7mUzJTbux84legDRF71gWsvo=;
        b=JmlMmBwU+UIRIRKADYqL8bniHgngoHErHxGtoqQHlbq59lYalOcLSyTHbw4LWBZ86Y
         ond9yv1aj7uOjeAksL8w9CxBa+0qQcUW0E2mU4S/po0JB487kHTSTubM5iWU9/InrEGf
         ddm7sOp8yUsqVixg4vw/PzLVY7KvqEdH2Mix7oNvsf1OOsx8SgsmJzzVryGQMhCgEGDw
         pBzJ91iD9N/Q9MIkzw887pyly6DpY/crY417qY0kcuwqyMy9kbyK63PA/DIUg0r4ijrz
         YhfNWMeXfALj7MbmYz11BvJFfIn8FX56Y/xX1YYaPfX+qs9H5V1AAZQoaj8y7M8q3rWH
         9DYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CAXR2YSo+1tvIfG0GbB7mUzJTbux84legDRF71gWsvo=;
        b=MC0tOqh1PppATgmNtOPpSuxUXHUYwnhrQ5IWbIG/BBP/YnHjT/SgZmWoPOZWAxdeHE
         sHDlpJc2QEl75vdhIIcmA1tLuq+RsxwBwvWh16cjq6yWn5V5ZPyOQbqTa9g0ASqAn6iZ
         OWpKaaCsETgB6J3EAdlrdddtAzj5WKv/Ex+YdMnFFrAlifIHBUd7XKovt0vCf1MVfUWS
         z9ELfPXf5sVTW7dRDLkIKOOTtsOU/fnEBGfpJ/Rrl7oef6H7BkVDzFsq3eYV7ux9FlWx
         wRo2/ezRHbLLbIhUIDc5Jsq3S77AH/OJV8Q09if5ejohO3pjp+2NUEyQf3vjLU1AbB/n
         2uBg==
X-Gm-Message-State: AGi0PuZ2tqNkO4G80MGNS/P4Y9Y3dWsQM3nHJiHwp6RiX7rxb/SIPs/V
        6SNHd1eWkLiUvENj1BWpY+hPOQ==
X-Google-Smtp-Source: APiQypKjnd8FffVf0vLn3bUyZ7SpWlKZMtc1/VJEH/AiWLJMaViwszkoZiIOz4mCAF/uX0clrrBriQ==
X-Received: by 2002:a17:902:d204:: with SMTP id t4mr11193915ply.16.1585774538327;
        Wed, 01 Apr 2020 13:55:38 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id e126sm2171069pfa.122.2020.04.01.13.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 13:55:37 -0700 (PDT)
Date:   Wed, 1 Apr 2020 14:55:35 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Loic PALLARDY <loic.pallardy@st.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v2 15/17] remoteproc: Correctly deal with MCU
 synchronisation when changing FW image
Message-ID: <20200401205535.GD17383@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-16-mathieu.poirier@linaro.org>
 <91d38ff6a39f4e07838d1e85c392eb8f@SFHDAG7NODE2.st.com>
 <20200330232139.GF31331@xps15>
 <f08ca2c3-d2de-2b3c-4134-950ef0107029@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f08ca2c3-d2de-2b3c-4134-950ef0107029@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 31, 2020 at 05:14:18PM -0500, Suman Anna wrote:
> Hi Mathieu,
> 
> On 3/30/20 6:21 PM, Mathieu Poirier wrote:
> > On Fri, Mar 27, 2020 at 01:50:18PM +0000, Loic PALLARDY wrote:
> >>
> >>> This patch prevents the firmware image from being displayed or changed
> >>> when
> >>> the remoteproc core is synchronising with an MCU. This is needed since
> >>> there is no guarantee about the nature of the firmware image that is loaded
> >>> by the external entity.
> >>>
> >>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>> ---
> >>>  drivers/remoteproc/remoteproc_sysfs.c | 25
> >>> ++++++++++++++++++++++++-
> >>>  1 file changed, 24 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
> >>> b/drivers/remoteproc/remoteproc_sysfs.c
> >>> index 7f8536b73295..4956577ad4b4 100644
> >>> --- a/drivers/remoteproc/remoteproc_sysfs.c
> >>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> >>> @@ -13,9 +13,20 @@
> >>>  static ssize_t firmware_show(struct device *dev, struct device_attribute
> >>> *attr,
> >>>  			  char *buf)
> >>>  {
> >>> +	ssize_t ret;
> >>>  	struct rproc *rproc = to_rproc(dev);
> >>>
> >>> -	return sprintf(buf, "%s\n", rproc->firmware);
> >>> +	/*
> >>> +	 * In most instances there is no guarantee about the firmware
> >>> +	 * that was loaded by the external entity.  As such simply don't
> >>> +	 * print anything.
> >>> +	 */
> >>> +	if (rproc_sync_with_mcu(rproc))
> >>> +		ret = sprintf(buf, "\n");
> >> Is it enough to provide empty name, or should we add a message to indicate that's name is unkown/undefined ?
> >>
> > 
> > Don't know... It is easy to find plenty of cases in sysfs where null values are
> > represented with a "\n", and just as many where "unknown", "undefined" or "-1"
> > are used. I know GKH prefers the least amount of information as possible, hence
> > going with a "\n".
> > 
> > Again, no strong opinion...
> > 
> >> Regards,
> >> Loic
> >>> +	else
> >>> +		ret = sprintf(buf, "%s\n", rproc->firmware);
> >>> +
> >>> +	return ret;
> >>>  }
> >>>
> >>>  /* Change firmware name via sysfs */
> >>> @@ -33,6 +44,18 @@ static ssize_t firmware_store(struct device *dev,
> >>>  		return -EINVAL;
> >>>  	}
> >>>
> >>> +	/*
> >>> +	 * There is no point in trying to change the firmware if the MCU
> >>> +	 * is currently running or if loading of the image is done by
> >>> +	 * another entity.
> >>> +	 */
> >>> +	if (rproc_sync_with_mcu(rproc)) {
> >>> +		dev_err(dev,
> >>> +			"can't change firmware while synchronising with
> >>> MCU\n");
> >>> +		err = -EBUSY;
> >>> +		goto out;
> >>> +	}
> >>> +
> 
> So, I have done a patch sometime back to deny sysfs operations [1] (the
> primary usecase is for a rproc-client driver driven boot where auto-boot
> is not set) which is still a need for me. Do you see that as orthogonal
> to that, or can we leverage that here somehow. I cannot use the sync_
> conditions for my cases since they are not already booted before.

I will look at your patch and see if I there is a way to fit that in.  I will
get back to you...

> 
> Also, any reason why you want to do this check before the rproc->state
> unlike the logic around the 'state' file in the next patch?

No specific reason, I will move the check down to be consistent.

> 
> [1] https://patchwork.kernel.org/patch/10601325/
> 
> regards
> Suman
> 
> >>>  	if (rproc->state != RPROC_OFFLINE) {
> >>>  		dev_err(dev, "can't change firmware while running\n");
> >>>  		err = -EBUSY;
> >>> --
> >>> 2.20.1
> >>
> 
