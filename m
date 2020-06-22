Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2612203087
	for <lists+linux-remoteproc@lfdr.de>; Mon, 22 Jun 2020 09:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbgFVHUv (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 22 Jun 2020 03:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726850AbgFVHUv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Jun 2020 03:20:51 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AC7C061794
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 00:20:51 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id a21so14746938oic.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 00:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xG+oHj42wv9Ow+aMX6QciQsE3KcoMnu1/UDDDC1/A0c=;
        b=DQ6ELPvmOPXnks11F9qg3tkEUduOM9A/Ef9NvE+zYiZV3cqa+iGW+0fPxdX4gPH+Ni
         lyCRdIQbrViT3RMf/3XXu0jnWxKQsCbx+u2ecpfuLjNe5+6MeU34VmEzVJ2SmmKdJ53n
         VaNtzq/nJwrt55vD+AI9ozHOJzomQWsoD4nebke/Qs59gyl146FmXMtc/dmPSUCAPlOx
         y9ySQx2QYnwTLDhky4frz8VFAbhlyqrEZfmWI0b685ub/+4S70s0pvOqLPByuMfJOmgQ
         aYleEY8/nzrDz73YByO161hI1k8BvZxzw8JErllUuQCFpxlMyBOfyDTvZDrFdAzDJCuV
         LRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xG+oHj42wv9Ow+aMX6QciQsE3KcoMnu1/UDDDC1/A0c=;
        b=msmJ8wUKld9cnQh0S21F/8StcUnOCML5NtZFjTnmAeQYO9U7OPnejawIWqd33E41m9
         NZQcWw/dQYp2j9pzqiz+louOrZi3lOQFcSc1uTGVJq8jetZZEq0WgmKK8F78dt6c4ZIl
         Sem0tPP1LI0TLivJIRhVpfrXjUT+5n6WOFmTn0n5JbMdrKzkaCMqrFjiVFHGu6WPXGQB
         mUzY6MDNcz3icdNL4yVPRgcCRO6desyKGFOyKQSD7kNPy9gH9xUzS6Dn3846b1ndmGdb
         USAB5T8DO7dqnxF6YHRAbDm+65utpQruZjlN5gvh6pJawvOJO/SHTY12Y64cvqbeRyYT
         CbKw==
X-Gm-Message-State: AOAM532iSrdi6cg7PTv91TgUd++jgmCROeWS3S3DwAp0iqULy94xcg0U
        40gpxsdN0V7E4HjyeXet+6ittg==
X-Google-Smtp-Source: ABdhPJyaT9e1ETCmEqEXJIpxScdU0iSWpSXJawfXO7LJM8baYQd1Il2JfOdOUumRj0tjlJHxooO/tw==
X-Received: by 2002:aca:bc82:: with SMTP id m124mr11223096oif.53.1592810450258;
        Mon, 22 Jun 2020 00:20:50 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e68sm3121837ote.56.2020.06.22.00.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:20:49 -0700 (PDT)
Date:   Mon, 22 Jun 2020 00:18:04 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, s-anna@ti.com
Subject: Re: [PATCH v4 3/9] remoteproc: Introducing function rproc_attach()
Message-ID: <20200622071804.GE149351@builder.lan>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
 <20200601175139.22097-4-mathieu.poirier@linaro.org>
 <20200622070727.GD149351@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622070727.GD149351@builder.lan>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 22 Jun 00:07 PDT 2020, Bjorn Andersson wrote:

> On Mon 01 Jun 10:51 PDT 2020, Mathieu Poirier wrote:
> 
> > Introducing function rproc_attach() to enact the same actions as
> > rproc_start(), but without the steps related to the handling of
> > a firmware image.  That way we can properly deal with scenarios
> > where the remoteproc core needs to attach with a remote processsor
> > that has been booted by another entity.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 42 ++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 9f04c30c4aaf..0b323f6b554b 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1370,6 +1370,48 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >  	return ret;
> >  }
> >  
> > +static int __maybe_unused rproc_attach(struct rproc *rproc)
> > +{
> > +	struct device *dev = &rproc->dev;
> > +	int ret;
> > +
> 
> For the case where we're going DETACHED -> RUNNING - > OFFLINE we
> need to consider the pm_runtime (and prepare/unprepare) state of the
> device as well...
> 

Missed that you do indeed pm_runtime_get() in the calling function, so I
think we're good on that part. Still need how to actually implement
that (and the prepare/unprepare), in particular if we're moving into
detaching a remoteproc.

> 
> Apart from that I think this looks good.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Regards,
> Bjorn
> 
> > +	ret = rproc_prepare_subdevices(rproc);
> > +	if (ret) {
> > +		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
> > +			rproc->name, ret);
> > +		goto out;
> > +	}
> > +
> > +	/* Attach to the remote processor */
> > +	ret = rproc_attach_device(rproc);
> > +	if (ret) {
> > +		dev_err(dev, "can't attach to rproc %s: %d\n",
> > +			rproc->name, ret);
> > +		goto unprepare_subdevices;
> > +	}
> > +
> > +	/* Start any subdevices for the remote processor */
> > +	ret = rproc_start_subdevices(rproc);
> > +	if (ret) {
> > +		dev_err(dev, "failed to probe subdevices for %s: %d\n",
> > +			rproc->name, ret);
> > +		goto stop_rproc;
> > +	}
> > +
> > +	rproc->state = RPROC_RUNNING;
> > +
> > +	dev_info(dev, "remote processor %s is now attached\n", rproc->name);
> > +
> > +	return 0;
> > +
> > +stop_rproc:
> > +	rproc->ops->stop(rproc);
> > +unprepare_subdevices:
> > +	rproc_unprepare_subdevices(rproc);
> > +out:
> > +	return ret;
> > +}
> > +
> >  /*
> >   * take a firmware and boot a remote processor with it.
> >   */
> > -- 
> > 2.20.1
> > 
