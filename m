Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4BFB19CB45
	for <lists+linux-remoteproc@lfdr.de>; Thu,  2 Apr 2020 22:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731783AbgDBUfo (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 2 Apr 2020 16:35:44 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:50615 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729549AbgDBUfo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Apr 2020 16:35:44 -0400
Received: by mail-pj1-f67.google.com with SMTP id v13so2016991pjb.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Apr 2020 13:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jEXFDczakAY+abRTsyQNWVVT7WNPmScD2QzB1XK9Szo=;
        b=KCNHYA5NoHuL3O4lCevOTsEEtl/NKaO8IHEMBrKhKQoMroNsxZodMMv71FNKaz+SJW
         JjJknUAZtl57CG1ys+gos240IvTKtnQAhVE9klgfX1xMTjTsJVgVHB2vWRDXRwrz8pf9
         DpohE0L9o7PFoD8LLN4IDq/PDZ6Zw9TZP+gaghhRrTYgXEsYUnlwqCYAooxePPm0nac7
         abujvVL3FYvPrJM2EGNuKQ8EB5lqYr+vUJ6va7D5yvxXp36nl4A4OhAmykYr6zLba2oe
         mVKZQkrTbP10+kAyEmXRHQabl+blWDXxKPggOukmCsDWJdk5/5wJvrWWIF1rygP4MsUp
         10hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jEXFDczakAY+abRTsyQNWVVT7WNPmScD2QzB1XK9Szo=;
        b=e94ofT7SKIiT4Aii46IJOFrwtzOUz5lf28ax94qKjIJhEYvHduHl6DcFdyGNQ37ktW
         6HUVnZtK9MsrkZZI7cYYzwP9r122deXbWibiMxlO3OKiMgc2mYRetLeACBza5bcrltfQ
         PPrayvh9J/1Dpk/JKE3PwgMTZYT1zxyXcZpmtot1SEfhJgd64/iaHvw12VEwCTnRqArA
         oohuni1kh/jpPZ6hAINUXLVbppc+AtR5kvfPUyUdzV54BeWg6oZKnaAWiW9aErSO99zO
         c3Z2vvrmrAPfvoBIZqc7l92fOOcPDbAtWqDAdhMcSnqLRpIaDbBI0w6NRIXQ2E80FKH3
         1nmQ==
X-Gm-Message-State: AGi0PubWb74/fdjYOiUsVnSHENk71okrcUhXsblPztN6J+HHl/LoIj+w
        kXFL79P/80+VPnb5Nrp004AplQ==
X-Google-Smtp-Source: APiQypJ6garYEs88QbF0Ap/SDSsDr7NV5f2tGe5DeABd2OlnpzKKKnas6O1glJcxnUXyBRL4A4ZQYg==
X-Received: by 2002:a17:90b:4910:: with SMTP id kr16mr5822234pjb.142.1585859742532;
        Thu, 02 Apr 2020 13:35:42 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r9sm4149128pfg.2.2020.04.02.13.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 13:35:42 -0700 (PDT)
Date:   Thu, 2 Apr 2020 14:35:40 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com, loic.pallardy@st.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 14/17] remoteproc: Refactor function
 rproc_trigger_recovery()
Message-ID: <20200402203540.GB9160@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-15-mathieu.poirier@linaro.org>
 <2b052de0-baf3-f474-152b-a71e1284852f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b052de0-baf3-f474-152b-a71e1284852f@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 31, 2020 at 04:52:12PM -0500, Suman Anna wrote:
> Hi Mathieu,
> 
> On 3/24/20 4:46 PM, Mathieu Poirier wrote:
> > Refactor function rproc_trigger_recovery() in order to avoid
> > reloading the fw image when synchronising with an MCU rather than
> > booting it.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 16 +++++++++-------
> >  1 file changed, 9 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index d3c4d7e6ca25..dbb0a8467205 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1661,7 +1661,7 @@ static void rproc_coredump(struct rproc *rproc)
> >   */
> >  int rproc_trigger_recovery(struct rproc *rproc)
> >  {
> > -	const struct firmware *firmware_p;
> > +	const struct firmware *firmware_p = NULL;
> >  	struct device *dev = &rproc->dev;
> >  	int ret;
> >  
> > @@ -1678,14 +1678,16 @@ int rproc_trigger_recovery(struct rproc *rproc)
> >  	/* generate coredump */
> >  	rproc_coredump(rproc);
> >  
> > -	/* load firmware */
> > -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> > -	if (ret < 0) {
> > -		dev_err(dev, "request_firmware failed: %d\n", ret);
> > -		goto unlock_mutex;
> > +	/* load firmware if need be */
> > +	if (!rproc_sync_with_mcu(rproc)) {
> > +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
> > +		if (ret < 0) {
> > +			dev_err(dev, "request_firmware failed: %d\n", ret);
> > +			goto unlock_mutex;
> > +		}
> 
> So, I am trying to understand the need for the flag around
> RPROC_SYNC_STATE_CRASHED. Can you explain what all usecases that is
> covering?

There could scenarios where another entity is in charge of the entire MCU
lifecycle.  That entity could be able to recognise the MCU has crashed and
automatically boot it again, in which case all the remoteproc core needs to do
is synchronise with it.

But it could also be that another entity has booted the MCU when the system
started but if the MCU crashes or is manually stopped, then the AP becomes the
MCU lifecycle. 

> 
> In anycase, you should probably combine this piece with the flag change
> for STATE_CRASHED on the last patch.

Sure.

> 
> regards
> Suman
> 
> >  	}
> >  
> > -	/* boot the remote processor up again */
> > +	/* boot up or synchronise with the remote processor again */
> >  	ret = rproc_start(rproc, firmware_p);
> >  
> >  	release_firmware(firmware_p);
> > 
> 
