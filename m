Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A631A8B57
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 Apr 2020 21:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505160AbgDNTow (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 Apr 2020 15:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2505156AbgDNTos (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Apr 2020 15:44:48 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 691F1C061A0C
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 12:44:44 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ng8so5750571pjb.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 12:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y8n+fCXbMWC1iI3wANy/sDKv9uXTY3yXiMXRA/S7MQo=;
        b=olJdbZJQB+gw4nBNzS0uf5tHqL6Rp1Vmc82avBY4KcDI+pB6WRolI9q33KwGrjkBhc
         d+4tXdgzDt3QLaFZEoYdncx8iH8pCiE8txFdp751P59XTi0j+2k8e5LDpCK0fTyCEjxK
         VVJnXXeeY2tHvYPdWeaiggBzIRv71hR4nYaqdGNi9vrmYBNZuTLY47Skgj0leooZLBli
         ZBUbmjvSMTg8UyGwY7iB/te7DsjdSv3gaHsoadexI7yXoAhhrf+QEZoBAhMqAswUWurZ
         08wavDsYCdHA6/MwRmPwjEHx15x2earJUCIhCWQVh9G5U+effwNtOjRJqoM1mCRrMD1s
         HXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y8n+fCXbMWC1iI3wANy/sDKv9uXTY3yXiMXRA/S7MQo=;
        b=G0ZeGhYjF+75D4ov609LTeXnKVmBVumkrU+Jh1ouxgFDsOlWn+1vQm4uXo0edIrKrw
         qowGo7Xh4Fz4AWX+E2PUyYvyiaTuokH3qCsWJbc88YxImd5YaLmdy0k5ZdPp327aiJ+N
         32Zj5bIRH6GDZCEkZo6DFcYOYBX9gEgOXGTjmMCOow4Ins6OaWzQwzNlYWm5LCdk3hTY
         +BBtXiNJ8nqNia27UQzYTT3It4bMCzCgqly4s4rqGeZ+wUtxqyOAM4kgLhGOyQUSOBeM
         P6oH/Y+5IMpNABoIFgW95ikofxAoYm/4dit3jWK8ZMkUOyhv8lo4B9tkA3g95xPrchUb
         brxw==
X-Gm-Message-State: AGi0PuZnflYbWO5NcVh3zkypEmgpkbOQDwhIr47yXn3vmc1asdA45ex0
        J7w++gdPNvDTA82KmK9ktlrj2g==
X-Google-Smtp-Source: APiQypKwVO3YYKnkeKBmDcieDhffhfreynXiumXxdiwadgN/nIlVyTtU0cUoHi5CZGca7Q5NeKJ0hA==
X-Received: by 2002:a17:902:7897:: with SMTP id q23mr1482603pll.312.1586893483817;
        Tue, 14 Apr 2020 12:44:43 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 198sm12041371pfa.87.2020.04.14.12.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 12:44:43 -0700 (PDT)
Date:   Tue, 14 Apr 2020 13:44:41 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Alex Elder <elder@linaro.org>, ohad@wizery.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] remoteproc: Split firmware name allocation from
 rproc_alloc()
Message-ID: <20200414194441.GA25931@xps15>
References: <20200413193401.27234-1-mathieu.poirier@linaro.org>
 <20200413193401.27234-3-mathieu.poirier@linaro.org>
 <bd8cc8d5-94c1-5767-d089-535731fc1055@linaro.org>
 <20200414005506.GG20625@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414005506.GG20625@builder.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hey Bjorn,

On Mon, Apr 13, 2020 at 05:55:06PM -0700, Bjorn Andersson wrote:
> On Mon 13 Apr 13:56 PDT 2020, Alex Elder wrote:
> 
> > On 4/13/20 2:33 PM, Mathieu Poirier wrote:
> > > Make the firmware name allocation a function on its own in order to
> > > introduce more flexibility to function rproc_alloc().
> > > 
> > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > 
> > I didn't look at the larger context (MCU series); I'm only looking
> > at this (and the others in this series) in isolation.  I like
> > that you're encapsulating this stuff into functions but doing so
> > doesn't really add any flexibility.
> > 
> > Two small suggestions for you to consider but they're truly
> > more about style so it's entirely up to you.  Outside of that
> > this looks straightforward to me, and the result of the series
> > is an improvement.
> > 
> > I'll let you comment on my suggestions before offering my
> > "reviewed-by" indication.
> > 
> > 					-Alex
> > 
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c | 66 ++++++++++++++++------------
> > >  1 file changed, 39 insertions(+), 27 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index 80056513ae71..4dee63f319ba 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1979,6 +1979,33 @@ static const struct device_type rproc_type = {
> > >  	.release	= rproc_type_release,
> > >  };
> > >  
> > > +static int rproc_alloc_firmware(struct rproc *rproc,
> > > +				const char *name, const char *firmware)
> > > +{
> > > +	char *p, *template = "rproc-%s-fw";
> > > +	int name_len;
> > 
> > Not a big deal (and maybe it's not consistent with other nearby
> > style) but template and name_len could be defined inside the
> > "if (!firmware)" block.
> > 
> 
> I prefer variables declared in the beginning of the function, so I'm
> happy with this.
> 
> > > +	if (!firmware) {
> > > +		/*
> > > +		 * If the caller didn't pass in a firmware name then
> > > +		 * construct a default name.
> > > +		 */
> > > +		name_len = strlen(name) + strlen(template) - 2 + 1;
> > > +		p = kmalloc(name_len, GFP_KERNEL);
> > 
> > 
> > I don't know if it would be an improvement, but you could
> > check for a null p value below for both cases.  I.e.:
> > 
> > 		if (p)
> > 			snprintf(p, ...);
> > 
> 
> Moving the common NULL check and return out seems nice, but given that
> we then have to have this positive conditional I think the end result is
> more complex.
> 
> That said, if we're not just doing a verbatim copy from rproc_alloc() I
> think we should make this function:
> 
> 	if (!firmware)
> 		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
> 	else
> 		p = kstrdup_const(firmware, GFP_KERNEL);

If you really want to use kstrdup_const() the return value has to be casted to a
"char *".  Variable 'p' can't be declared const "char *" because rproc->firmware is not
a "const".  Simply put somewhere the "const" will need to be dropped or casted out.

Mathieu

> 
> 	rproc->firmware = p;
> 
> 	return p ? 0 : -ENOMEM;
> 
> Regards,
> Bjorn
> 
> > (more below)
> > 
> > > +		if (!p)
> > > +			return -ENOMEM;
> > > +		snprintf(p, name_len, template, name);
> > > +	} else {
> > > +		p = kstrdup(firmware, GFP_KERNEL);
> > > +		if (!p)
> > > +			return -ENOMEM;
> > > +	}
> > > +
> > 
> > 	if (!p)
> > 		return -ENOMEM;
> > 	
> > > +	rproc->firmware = p;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  /**
> > >   * rproc_alloc() - allocate a remote processor handle
> > >   * @dev: the underlying device
> > > @@ -2007,42 +2034,21 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> > >  			  const char *firmware, int len)
> > >  {
> > >  	struct rproc *rproc;
> > > -	char *p, *template = "rproc-%s-fw";
> > > -	int name_len;
> > >  
> > >  	if (!dev || !name || !ops)
> > >  		return NULL;
> > >  
> > > -	if (!firmware) {
> > > -		/*
> > > -		 * If the caller didn't pass in a firmware name then
> > > -		 * construct a default name.
> > > -		 */
> > > -		name_len = strlen(name) + strlen(template) - 2 + 1;
> > > -		p = kmalloc(name_len, GFP_KERNEL);
> > > -		if (!p)
> > > -			return NULL;
> > > -		snprintf(p, name_len, template, name);
> > > -	} else {
> > > -		p = kstrdup(firmware, GFP_KERNEL);
> > > -		if (!p)
> > > -			return NULL;
> > > -	}
> > > -
> > >  	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
> > > -	if (!rproc) {
> > > -		kfree(p);
> > > +	if (!rproc)
> > >  		return NULL;
> > > -	}
> > > +
> > > +	if (rproc_alloc_firmware(rproc, name, firmware))
> > > +		goto free_rproc;
> > >  
> > >  	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
> > > -	if (!rproc->ops) {
> > > -		kfree(p);
> > > -		kfree(rproc);
> > > -		return NULL;
> > > -	}
> > > +	if (!rproc->ops)
> > > +		goto free_firmware;
> > >  
> > > -	rproc->firmware = p;
> > >  	rproc->name = name;
> > >  	rproc->priv = &rproc[1];
> > >  	rproc->auto_boot = true;
> > > @@ -2091,6 +2097,12 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> > >  	rproc->state = RPROC_OFFLINE;
> > >  
> > >  	return rproc;
> > > +
> > > +free_firmware:
> > > +	kfree(rproc->firmware);
> > > +free_rproc:
> > > +	kfree(rproc);
> > > +	return NULL;
> > >  }
> > >  EXPORT_SYMBOL(rproc_alloc);
> > >  
> > > 
> > 
