Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2339D1D8C38
	for <lists+linux-remoteproc@lfdr.de>; Tue, 19 May 2020 02:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbgESAXs (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 18 May 2020 20:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbgESAXs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 May 2020 20:23:48 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3505C061A0C
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 May 2020 17:23:46 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j21so5583164pgb.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 May 2020 17:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=76L2jmn/5xBiAGpfkucj0sHy1ATlbvKKmUWYpASrI6I=;
        b=oIy/TJt+bfnFQKnMI5r16CijBX74deYXQhw5fq8MrnIPmL50zNhHDAx4kdlbapQWRG
         NWFz39KpqcpEOuJg8qFDgj0uSSvL3IfUlH5EwOoRalYBEGcJvw7VnxlOC87L+LL6aVLu
         U6Toa5cgG4xkkDeN7STuNDm1PfN/on+FDqqT76drktag20wIZKE2b7ZiJNxvwbkIvtkN
         IDhrOt1gIHB/8MY/cUXrsbemF55nDHNbrgz5h9r/Pk89nykykvNvgzQQfxq9+53Kv+pD
         jaFJBSJrjvn5lt2ITbAg90FjV2LJCMQBYa3bXfs+D73G//VWyvy121EYPasH9KisjSvP
         feww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=76L2jmn/5xBiAGpfkucj0sHy1ATlbvKKmUWYpASrI6I=;
        b=qUsYrkT818LjkDm7eeboHE37Kw9tD+RPsaaQ/Ta5FPTgOWPqfzb+xpA0QaPHnlAnax
         Q9zEi7/Hk+a1ouIAEfLcwgNNNM206g0px6SLHkmX7fK9W3uvuqF25KiZr/YJI1rZsi0g
         ABX5WDr5FkLtwVX6uwRkhC2DeaAPa7JtppEiMluDLSxXrZnPsuc5QnPETywN25IVK4Km
         B9GYZmvDcAMUXs+m2pUWSKE1H1oYup1b+AF5rnov73K49xuApBZG7FTif8ZEUABA3HRR
         prigmjdJtCvWCZkRwySiGotiebqXHkzva8E1aMslxqJAfDKR8oDVJ0FGN5EKuanLkH7o
         o7BQ==
X-Gm-Message-State: AOAM530iaLtfcxJNO4mP1kN+UsNFjzmGMPO0M5D3M5bcn/oHLrlyBvqH
        wgon5Bxfy8tddCp9vMNRoUilcw==
X-Google-Smtp-Source: ABdhPJz00Q8eKtLYkOm4FQyR9Wtki5fSGV9CdEuLr/xwSqTX48yyqpQFLzzNsw+c3w7aDF6XqprS9w==
X-Received: by 2002:a63:30c2:: with SMTP id w185mr16661378pgw.353.1589847826017;
        Mon, 18 May 2020 17:23:46 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k12sm6715222pfg.177.2020.05.18.17.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:23:45 -0700 (PDT)
Date:   Mon, 18 May 2020 17:22:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, loic.pallardy@st.com, arnaud.pouliquen@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/14] remoteproc: Refactor function rproc_fw_boot()
Message-ID: <20200519002223.GQ2165@builder.lan>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-6-mathieu.poirier@linaro.org>
 <20200506003341.GD2329931@builder.lan>
 <20200508212756.GB5650@xps15>
 <20200514021055.GF16107@builder.lan>
 <20200515194651.GB24201@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200515194651.GB24201@xps15>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 15 May 12:46 PDT 2020, Mathieu Poirier wrote:

> On Wed, May 13, 2020 at 07:10:55PM -0700, Bjorn Andersson wrote:
> > On Fri 08 May 14:27 PDT 2020, Mathieu Poirier wrote:
> > 
> > > On Tue, May 05, 2020 at 05:33:41PM -0700, Bjorn Andersson wrote:
> > > > On Fri 24 Apr 13:01 PDT 2020, Mathieu Poirier wrote:
> > > > 
> > > > > Refactor function rproc_fw_boot() in order to better reflect the work
> > > > > that is done when supporting scenarios where the remoteproc core is
> > > > > synchronising with a remote processor.
> > > > > 
> > > > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > > ---
> > > > >  drivers/remoteproc/remoteproc_core.c | 10 ++++++----
> > > > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > > > index a02593b75bec..e90a21de9de1 100644
> > > > > --- a/drivers/remoteproc/remoteproc_core.c
> > > > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > > > @@ -1370,9 +1370,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> > > > >  }
> > > > >  
> > > > >  /*
> > > > > - * take a firmware and boot a remote processor with it.
> > > > > + * boot or synchronise with a remote processor.
> > > > >   */
> > > > > -static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> > > > > +static int rproc_actuate_device(struct rproc *rproc, const struct firmware *fw)
> > > > 
> > > > Per patch 4 this function will if rproc_needs_syncing() be called with
> > > > fw == NULL, it's not obvious to me that the various operations on "fw"
> > > > in this function are valid anymore.
> > > 
> > > That is right, all firmware related operations in this function are found in
> > > remoteproc_internal.h where the value of rproc->sync_with_mcu is checked before
> > > moving forward. That allows us to avoid introducing a new function similar to
> > > rproc_fw_boot() but without firmware operations or peppering the code with if
> > > statements.
> > > 
> > 
> > As I wrote in my other reply, the two mechanisms seems to consist of the
> > following steps:
> > 
> > boot the core:
> > 1) request firmware
> > 2) prepare device
> > 3) parse fw
> > 4) handle resources
> > 5) allocate carveouts
> > 6) load segments
> > 7) find resource table
> > 8) prepare subdevices
> > 9) power on
> > 10) start subdevices
> > 
> > sync:
> > 1) prepare device (?)
> > 2) handle resources
> > 3) allocate carveouts (?)
> > 4) prepare subdevices
> > 5) attach
> > 6) start subdevices
> > 
> > Rather than relying on the state flag and missing ops will turn the
> > first list into the second list I conceptually prefer having two
> > separate functions that are easy to reason about.
> 
> I reflected long and hard about doing just that...
> 
> > 
> > But I haven't done any refactoring or implemented this, so in practice
> > the two might just be a lot of duplication(?)
> 
> Exactly - duplication and maintenance are my prime concern.  Right now some
> functions in the OFFLINE -> RUNNING are clearly not needed when dealing with a
> DETACHED -> RUNNING scenarios, but with I am convinced people will find ways to
> do something creative with the callbacks.

I'm sure there are problems out there that will require creative
solutions, but I would prefer that we keep things easy to reason about
and ensure that as new problems arise we can evolve the framework.

> In the end I fear the new functions
> we spin off to deal with DETACHED -> RUNNING scenarios will end up looking very
> similar to the current implementation.
> 

In those scenarios I don't see a problem with the platform drivers
having functions of common code shared between ops->start and
ops->attach.

> With that in mind I simply did all the work in remoteproc_internal.h and left
> the core functions intact.
> 
> We can try spinning off new functions in the next revision, just to test my
> theory and see how much gets duplicated.
> 

Looking forward to it!

> > 
> > > > 
> > > > >  {
> > > > >  	struct device *dev = &rproc->dev;
> > > > >  	const char *name = rproc->firmware;
> > > > > @@ -1382,7 +1382,9 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> > > > >  	if (ret)
> > > > >  		return ret;
> > > > >  
> > > > > -	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
> > > > > +	if (!rproc_needs_syncing(rproc))
> > > > 
> > > > Can't we make this check on fw, to make the relationship "if we where
> > > > passed a firmware object, we're going to load and boot that firmware"?
> > > 
> > > It can but I specifically decided to use rproc_needs_syncing() to be consistent
> > > with the rest of the patchset.  That way all we need to do is grep for
> > > rproc_needs_syncing to get all the places where a decision about synchronising
> > > with a remote processor is made.
> > > 
> > 
> > Conceptually we have a single "to sync or not to sync", but I think
> > we're invoking rproc_needs_syncing() 8 times during rproc_fw_boot() and
> > each of those operations may or may not do anything.
> 
> As I said above, I'll try spinning off new functions in the next revision.  From
> there we can decide how best to move forward.
> 
> > 
> > There are certain operations where I see it makes sense for a driver to
> > either implement or not, but I think that e.g. for a rproc in OFFLINE
> > state we should just require ops->start to be specified - because it
> > doesn't make sense to enter rproc_start() if ops->start is a nop.
> 
> At this time ops->start() doesn't have to be specified... But as you say it
> won't do much good and this is something we can easily spot when reviewing
> patches.
> 

Presumably after implementing this support we should check during
registration that there's either a start or an attach ops specified. And
if there's no start we shouldn't allow the RUNNING->OFFLINE transition.

> Thanks for the review,

Thanks for working on this and sorry that it took me time really digest
this.

Regards,
Bjorn

> Mathieu
> 
> > 
> > Regards,
> > Bjorn
> > 
> > > > 
> > > > Regards,
> > > > Bjorn
> > > > 
> > > > > +		dev_info(dev, "Booting fw image %s, size %zd\n",
> > > > > +			 name, fw->size);
> > > > >  
> > > > >  	/*
> > > > >  	 * if enabling an IOMMU isn't relevant for this rproc, this is
> > > > > @@ -1818,7 +1820,7 @@ int rproc_boot(struct rproc *rproc)
> > > > >  		}
> > > > >  	}
> > > > >  
> > > > > -	ret = rproc_fw_boot(rproc, firmware_p);
> > > > > +	ret = rproc_actuate_device(rproc, firmware_p);
> > > > >  
> > > > >  	release_firmware(firmware_p);
> > > > >  
> > > > > -- 
> > > > > 2.20.1
> > > > > 
