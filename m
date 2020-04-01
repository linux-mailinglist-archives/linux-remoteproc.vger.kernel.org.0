Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61AB619B6F5
	for <lists+linux-remoteproc@lfdr.de>; Wed,  1 Apr 2020 22:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732669AbgDAU3y (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 1 Apr 2020 16:29:54 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33316 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732337AbgDAU3y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Apr 2020 16:29:54 -0400
Received: by mail-pl1-f194.google.com with SMTP id ay1so452458plb.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Apr 2020 13:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nPl3UxaupApmm+htX84e8WNA6HpoIMDJmhDOFauG+sw=;
        b=aLAHqoo0Ou7xVcELCPxA1ycd91HMT4LR2BmLviShvmfGB/64TeA0twCgEqM+dcrgeS
         SdSK0SKdSDRm6wou8wz33QhtleYjBMVjugV6IxMKposIMOtRv0Vy7ZKCMcMyB+SdMQWJ
         Q+dOuHe+SUY9hRxG2jobrul9V4WkUjbB97fIrKv8MIyPM558+9ey9hxigAJ6kcJ15seY
         zyGU2bw1+mo+VqNVWzkg1cZMa8sEnq3UYKyI+b6MUyhKMs+1VhLyu5QYvY2ITBicKKtV
         k0RVhdZOIqVqa1727hIncuPG2FcK+5pkMOcQwqIudDMb24BWfGNXW9PQeRVPDdvdOTf+
         bEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nPl3UxaupApmm+htX84e8WNA6HpoIMDJmhDOFauG+sw=;
        b=Xd3821u9y8z5lGCTLIxMAdN3B4ruG4jSkGo6/sYyg8iKm54XTlqLs72FJIQ6ZPkqcs
         DodVlFJLdF4V3RijFSkFGgJg9niKV9ghESd373Tr+vrXhLSq9qkr4u1147VTYfjhZIG9
         WgoXq4Kxxsb6eF3KkjKvA83vSROHlfDDY2nr30SDSRoaMtcnyg46qqLtMwU3CfPdnyWh
         mvyXk1WC2bd/z+P8MzLnnSTE7uWFpfVkxJUYVV8O2J2x3EBxTnKYf5DodmAsJgifb684
         BqpMZmX6xtUl/ak1iDN2oHWcho1hAdNbChLwvVcYM+6UmDj4V6P+FpkqG+7tjQfP5N0h
         wc+Q==
X-Gm-Message-State: ANhLgQ2q+x4Rfh2LyOHwuM8ubWysQ/385vrfE1CwcdGz1f+5YPAkok7d
        UrkkWCb5qG5r0dOgYwC+UTSJtw==
X-Google-Smtp-Source: ADFU+vt5OVy4CHt6UGo2XVOKvrx4Wg2oR+omT9fhp1LE8sFh87vx2K+BqsR8UAs9qSx6BDZViycyNA==
X-Received: by 2002:a17:902:a40e:: with SMTP id p14mr24410411plq.295.1585772993220;
        Wed, 01 Apr 2020 13:29:53 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id f45sm2237015pjg.29.2020.04.01.13.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 13:29:52 -0700 (PDT)
Date:   Wed, 1 Apr 2020 14:29:50 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Loic PALLARDY <loic.pallardy@st.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v2 06/17] remoteproc: Introduce function
 rproc_alloc_internals()
Message-ID: <20200401202950.GA17383@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-7-mathieu.poirier@linaro.org>
 <064cda96467f4ab39b494d543198fa7e@SFHDAG7NODE2.st.com>
 <88f56a4e-dccb-0d50-4656-82380a2e57aa@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88f56a4e-dccb-0d50-4656-82380a2e57aa@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Suman,

On Mon, Mar 30, 2020 at 03:38:14PM -0500, Suman Anna wrote:
> Hi Mathieu,
> 
> On 3/27/20 6:10 AM, Loic PALLARDY wrote:
> > Hi Mathieu,
> > 
> >>
> >> In preparation to allocate the synchronisation operation and state
> >> machine, spin off a new function in order to keep rproc_alloc() as
> >> clean as possible.
> >>
> >> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c | 26 ++++++++++++++++++++++---
> >> -
> >>  1 file changed, 22 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c
> >> b/drivers/remoteproc/remoteproc_core.c
> >> index ee277bc5556c..9da245734db6 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -2018,6 +2018,26 @@ static int rproc_alloc_ops(struct rproc *rproc,
> >> const struct rproc_ops *ops)
> >>  	return 0;
> >>  }
> >>
> >> +static int rproc_alloc_internals(struct rproc *rproc, const char *name,
> >> +				 const struct rproc_ops *boot_ops,
> >> +				 const char *firmware, int len)
> > 
> > len argument is not used in the patch nor in the following, maybe removed from my pov.
> 
> Indeed.
> 
> > 
> > Regards,
> > Loic
> 
> >> +{
> >> +	int ret;
> >> +
> >> +	/* We have a boot_ops so allocate firmware name and operations */
> >> +	if (boot_ops) {
> >> +		ret = rproc_alloc_firmware(rproc, name, firmware);
> >> +		if (ret)
> >> +			return ret;
> 
> So, can you explain why firmware allocation now becomes conditional on
> this boot_ops?

There is no point in allocating a firmware name in a scenario where the
remoteproc core is only synchronising with the MCU.  As soon as a boot_ops (to
be renamed ops as per your comment below) is present I assume firmware loading
will be involved at some point.   Do you see a scenario where that wouldn't be
be case?

> 
> Perhaps, continue to call this as ops following the field name in struct
> rproc.

Ok

> 
> regards
> Suman
> 
> >> +
> >> +		ret = rproc_alloc_ops(rproc, boot_ops);
> >> +		if (ret)
> >> +			return ret;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  /**
> >>   * rproc_alloc() - allocate a remote processor handle
> >>   * @dev: the underlying device
> >> @@ -2064,10 +2084,8 @@ struct rproc *rproc_alloc(struct device *dev, const
> >> char *name,
> >>  	rproc->dev.class = &rproc_class;
> >>  	rproc->dev.driver_data = rproc;
> >>
> >> -	if (rproc_alloc_firmware(rproc, name, firmware))
> >> -		goto out;
> >> -
> >> -	if (rproc_alloc_ops(rproc, ops))
> >> +	if (rproc_alloc_internals(rproc, name, ops,
> >> +				  firmware, len))
> >>  		goto out;
> >>
> >>  	/* Assign a unique device index and name */
> >> --
> >> 2.20.1
> > 
> 
