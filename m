Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7256C1D5A49
	for <lists+linux-remoteproc@lfdr.de>; Fri, 15 May 2020 21:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgEOTqz (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 15 May 2020 15:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726204AbgEOTqy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 May 2020 15:46:54 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB91C05BD09
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 May 2020 12:46:54 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id u5so1478632pgn.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 May 2020 12:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qHFnsbgrSS4StOIenlkUVZXooyvIhnf9sBRBZNkUxwQ=;
        b=Q9Q88argmmjbLp2fCN86SmyNT6CTlbnyCjllZlrZmXbFTt2I/vXcG0UiFQsfrdl2M6
         omiB3E2tkak1x2S0KzduyTbK2fpc6aIVEiToqOSzO5Z+KGQ/ixVPmoCKgyyeY85ePBaZ
         pR8MmAGbN98jOc7nK+pEDqmQRXPj+ectonE1N+8xP9A3vbhEGmTaW++SFt9o11+b6zFz
         R5QI94xI/7RY7OYhrD62UfxNl7se7rr8oiNahRoy6nU2FrMvw39NlcvKMAWvIIuuFoOf
         VtaK2gmWlYvf5m1f2PLZGb6SUOhU/0wS9q1JRZR3J5GSKc6msxjexbNnEYjjokWWaTZW
         8ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qHFnsbgrSS4StOIenlkUVZXooyvIhnf9sBRBZNkUxwQ=;
        b=HDNyWs2GfUdIGfMVi72SnBx/vJWmQCs6fxNjrRuwZS1XVdKqKzuZTAA2IziC2sa8R9
         QDIm2qbKlOkQ+Pm9Y9plrVjeo/N34Zm/hGNzrvi65aP+BwPBVQCePmvSmQs9d8yGXN0X
         gUn9AOyKTt/rbRmEPPFS47arIWZaJviorSqGEjhIoPp1V6cRnpIRKQc/WMkXutbIj/iz
         YCbWIwHavcLpRFe9ulVweMR2eY2xhJXDRXF9l/LgPSq6EmWg1TfNiuLU3AzzVHV/q8rQ
         1Q0E5gJcyd0Zn1mCAlLodouGtVGxFy3MgeixdJN0DFljY6ojeol51pfqaAKjfNuqFAOu
         TkKQ==
X-Gm-Message-State: AOAM530+dKJ0IadZLFOWPD9cmJT/OOQQ8p4CQwlpKywJv5BFqMY3EDOK
        wMv/ayj2qgbr/D6D3JFgvkq3CQ==
X-Google-Smtp-Source: ABdhPJz2S4OKkT9pAG2qWpgs+3SZglys/JTnKn/Hb4Bpe0zcY3Mp9xBPg6TctMyMvSmt3IJ1aHxs8Q==
X-Received: by 2002:a62:1b84:: with SMTP id b126mr5552921pfb.123.1589572013822;
        Fri, 15 May 2020 12:46:53 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id lj12sm2169968pjb.21.2020.05.15.12.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 12:46:53 -0700 (PDT)
Date:   Fri, 15 May 2020 13:46:51 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ohad@wizery.com, loic.pallardy@st.com, arnaud.pouliquen@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/14] remoteproc: Refactor function rproc_fw_boot()
Message-ID: <20200515194651.GB24201@xps15>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-6-mathieu.poirier@linaro.org>
 <20200506003341.GD2329931@builder.lan>
 <20200508212756.GB5650@xps15>
 <20200514021055.GF16107@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514021055.GF16107@builder.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, May 13, 2020 at 07:10:55PM -0700, Bjorn Andersson wrote:
> On Fri 08 May 14:27 PDT 2020, Mathieu Poirier wrote:
> 
> > On Tue, May 05, 2020 at 05:33:41PM -0700, Bjorn Andersson wrote:
> > > On Fri 24 Apr 13:01 PDT 2020, Mathieu Poirier wrote:
> > > 
> > > > Refactor function rproc_fw_boot() in order to better reflect the work
> > > > that is done when supporting scenarios where the remoteproc core is
> > > > synchronising with a remote processor.
> > > > 
> > > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > ---
> > > >  drivers/remoteproc/remoteproc_core.c | 10 ++++++----
> > > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > > index a02593b75bec..e90a21de9de1 100644
> > > > --- a/drivers/remoteproc/remoteproc_core.c
> > > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > > @@ -1370,9 +1370,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> > > >  }
> > > >  
> > > >  /*
> > > > - * take a firmware and boot a remote processor with it.
> > > > + * boot or synchronise with a remote processor.
> > > >   */
> > > > -static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> > > > +static int rproc_actuate_device(struct rproc *rproc, const struct firmware *fw)
> > > 
> > > Per patch 4 this function will if rproc_needs_syncing() be called with
> > > fw == NULL, it's not obvious to me that the various operations on "fw"
> > > in this function are valid anymore.
> > 
> > That is right, all firmware related operations in this function are found in
> > remoteproc_internal.h where the value of rproc->sync_with_mcu is checked before
> > moving forward. That allows us to avoid introducing a new function similar to
> > rproc_fw_boot() but without firmware operations or peppering the code with if
> > statements.
> > 
> 
> As I wrote in my other reply, the two mechanisms seems to consist of the
> following steps:
> 
> boot the core:
> 1) request firmware
> 2) prepare device
> 3) parse fw
> 4) handle resources
> 5) allocate carveouts
> 6) load segments
> 7) find resource table
> 8) prepare subdevices
> 9) power on
> 10) start subdevices
> 
> sync:
> 1) prepare device (?)
> 2) handle resources
> 3) allocate carveouts (?)
> 4) prepare subdevices
> 5) attach
> 6) start subdevices
> 
> Rather than relying on the state flag and missing ops will turn the
> first list into the second list I conceptually prefer having two
> separate functions that are easy to reason about.

I reflected long and hard about doing just that...

> 
> But I haven't done any refactoring or implemented this, so in practice
> the two might just be a lot of duplication(?)

Exactly - duplication and maintenance are my prime concern.  Right now some
functions in the OFFLINE -> RUNNING are clearly not needed when dealing with a
DETACHED -> RUNNING scenarios, but with I am convinced people will find ways to
do something creative with the callbacks.  In the end I fear the new functions
we spin off to deal with DETACHED -> RUNNING scenarios will end up looking very
similar to the current implementation.

With that in mind I simply did all the work in remoteproc_internal.h and left
the core functions intact.

We can try spinning off new functions in the next revision, just to test my
theory and see how much gets duplicated.

> 
> > > 
> > > >  {
> > > >  	struct device *dev = &rproc->dev;
> > > >  	const char *name = rproc->firmware;
> > > > @@ -1382,7 +1382,9 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> > > >  	if (ret)
> > > >  		return ret;
> > > >  
> > > > -	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
> > > > +	if (!rproc_needs_syncing(rproc))
> > > 
> > > Can't we make this check on fw, to make the relationship "if we where
> > > passed a firmware object, we're going to load and boot that firmware"?
> > 
> > It can but I specifically decided to use rproc_needs_syncing() to be consistent
> > with the rest of the patchset.  That way all we need to do is grep for
> > rproc_needs_syncing to get all the places where a decision about synchronising
> > with a remote processor is made.
> > 
> 
> Conceptually we have a single "to sync or not to sync", but I think
> we're invoking rproc_needs_syncing() 8 times during rproc_fw_boot() and
> each of those operations may or may not do anything.

As I said above, I'll try spinning off new functions in the next revision.  From
there we can decide how best to move forward.

> 
> There are certain operations where I see it makes sense for a driver to
> either implement or not, but I think that e.g. for a rproc in OFFLINE
> state we should just require ops->start to be specified - because it
> doesn't make sense to enter rproc_start() if ops->start is a nop.

At this time ops->start() doesn't have to be specified... But as you say it
won't do much good and this is something we can easily spot when reviewing
patches.

Thanks for the review,
Mathieu

> 
> Regards,
> Bjorn
> 
> > > 
> > > Regards,
> > > Bjorn
> > > 
> > > > +		dev_info(dev, "Booting fw image %s, size %zd\n",
> > > > +			 name, fw->size);
> > > >  
> > > >  	/*
> > > >  	 * if enabling an IOMMU isn't relevant for this rproc, this is
> > > > @@ -1818,7 +1820,7 @@ int rproc_boot(struct rproc *rproc)
> > > >  		}
> > > >  	}
> > > >  
> > > > -	ret = rproc_fw_boot(rproc, firmware_p);
> > > > +	ret = rproc_actuate_device(rproc, firmware_p);
> > > >  
> > > >  	release_firmware(firmware_p);
> > > >  
> > > > -- 
> > > > 2.20.1
> > > > 
