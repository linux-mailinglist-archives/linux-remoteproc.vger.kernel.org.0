Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9169A1CB9C4
	for <lists+linux-remoteproc@lfdr.de>; Fri,  8 May 2020 23:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbgEHV2A (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 8 May 2020 17:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgEHV17 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 May 2020 17:27:59 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9531FC061A0C
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 May 2020 14:27:59 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id q24so4856955pjd.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2020 14:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L9g119m0gTQu6y/735D6EzqGxar+Fjrp3F2zr73WxY8=;
        b=C3hjCx1Zrav5UfeC+Fkxpy+NsIOxrwDTDYPheUHNGD9qwOtuY9j+nuTrcgjkWDb/3e
         kVdBZtgZiBZ+YmxvmVRz5QazWPl9Rl5KhA2JGPWpfL2quefzOu0VNQhzA+gCeRJX8cmg
         gK9F6fsgHJudBeDjnfSmsmJQvIxHbYVaFAcY1+qZFEwNXeLvx8B0uGb01W83EQSWmzKa
         wFPE+1SZAtiWgptKmXycBKqXEZd9w/suZGg0n+q1aDJeTZ3uYZC9HMe4nTnXlGTGdceq
         qZwDrsZgCDV+W6fAnOLCE0Z/YqNHqFuSfwfqQLiOFcdvqefhZxnkEjJy6SUXxNwpRCmL
         nmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L9g119m0gTQu6y/735D6EzqGxar+Fjrp3F2zr73WxY8=;
        b=ONRB8L/2ASFWPBrF903A00/0u6qTzeUFyv34fOivZn/hXMJdbtJ+bYj5GBOWWRsH0q
         2DS3WEZnHWcj1/6NJt+OyPbc6HxMr8hAu2Bad/5iR3CEGVAvkmGBe6dLDzwtN8+UOk36
         nbZWBPwAtLF3sC7tPkPBfRf2zxPk/oqZqk0ywGdWQSzUeYir0SbyLqdhnyvMfdd6Kqw+
         tGl/RnM5vRtMqHxKt5HB4TdRZ/2bh3R9g7ZAT5nHqUsHZ4lPsq3lRJpL/wzBnp+54j4Q
         IUyCMptQq3qLTBp+grA/PBWg3Prx/qsdCw9FcJrx/8jb92f2Ql9w3zmnh4jbzlFkEnpi
         cl+g==
X-Gm-Message-State: AGi0PuYTXNgPQ0jEacSSBlXBBG5JYMkoOJiLJEm0OLjVj34P43qF/m6I
        lhtOrd/x01YA4dHKtjOSrgmkrQ==
X-Google-Smtp-Source: APiQypJk/0L2b+Hf+JPcmfzPdn/vOOu6H9Y0LKnNAq0WV+xiV1IdCFoemfnzStdQgNU9VQ/VZHcqsQ==
X-Received: by 2002:a17:90a:20e2:: with SMTP id f89mr7428826pjg.205.1588973278837;
        Fri, 08 May 2020 14:27:58 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q21sm2683640pfg.131.2020.05.08.14.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 14:27:58 -0700 (PDT)
Date:   Fri, 8 May 2020 15:27:56 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ohad@wizery.com, loic.pallardy@st.com, arnaud.pouliquen@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/14] remoteproc: Refactor function rproc_fw_boot()
Message-ID: <20200508212756.GB5650@xps15>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-6-mathieu.poirier@linaro.org>
 <20200506003341.GD2329931@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506003341.GD2329931@builder.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, May 05, 2020 at 05:33:41PM -0700, Bjorn Andersson wrote:
> On Fri 24 Apr 13:01 PDT 2020, Mathieu Poirier wrote:
> 
> > Refactor function rproc_fw_boot() in order to better reflect the work
> > that is done when supporting scenarios where the remoteproc core is
> > synchronising with a remote processor.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index a02593b75bec..e90a21de9de1 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1370,9 +1370,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >  }
> >  
> >  /*
> > - * take a firmware and boot a remote processor with it.
> > + * boot or synchronise with a remote processor.
> >   */
> > -static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> > +static int rproc_actuate_device(struct rproc *rproc, const struct firmware *fw)
> 
> Per patch 4 this function will if rproc_needs_syncing() be called with
> fw == NULL, it's not obvious to me that the various operations on "fw"
> in this function are valid anymore.

That is right, all firmware related operations in this function are found in
remoteproc_internal.h where the value of rproc->sync_with_mcu is checked before
moving forward. That allows us to avoid introducing a new function similar to
rproc_fw_boot() but without firmware operations or peppering the code with if
statements.

> 
> >  {
> >  	struct device *dev = &rproc->dev;
> >  	const char *name = rproc->firmware;
> > @@ -1382,7 +1382,9 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> >  	if (ret)
> >  		return ret;
> >  
> > -	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
> > +	if (!rproc_needs_syncing(rproc))
> 
> Can't we make this check on fw, to make the relationship "if we where
> passed a firmware object, we're going to load and boot that firmware"?

It can but I specifically decided to use rproc_needs_syncing() to be consistent
with the rest of the patchset.  That way all we need to do is grep for
rproc_needs_syncing to get all the places where a decision about synchronising
with a remote processor is made.

> 
> Regards,
> Bjorn
> 
> > +		dev_info(dev, "Booting fw image %s, size %zd\n",
> > +			 name, fw->size);
> >  
> >  	/*
> >  	 * if enabling an IOMMU isn't relevant for this rproc, this is
> > @@ -1818,7 +1820,7 @@ int rproc_boot(struct rproc *rproc)
> >  		}
> >  	}
> >  
> > -	ret = rproc_fw_boot(rproc, firmware_p);
> > +	ret = rproc_actuate_device(rproc, firmware_p);
> >  
> >  	release_firmware(firmware_p);
> >  
> > -- 
> > 2.20.1
> > 
