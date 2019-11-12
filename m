Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 144DBF983F
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 Nov 2019 19:06:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfKLSG1 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 12 Nov 2019 13:06:27 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35906 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbfKLSG1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Nov 2019 13:06:27 -0500
Received: by mail-pl1-f193.google.com with SMTP id d7so7847978pls.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Nov 2019 10:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dmOmt8ByQhAHvaxxxTyNZcZ2nUfxUzBc/uGFwV4SbSU=;
        b=ycl/pP1btP14ouY7K+vcJC5xiS1I5M7qxDjCVmlocaQTQz7vi8nLfwR0QPdFz67uox
         b87uQsUvkIiGJ94d9w0dtdIxOKsI44bmgvo++It5UWCZhLSzyN0E9SgnU0+WGlS/x1dQ
         gONe3gYFNQ1nsD5u1rMIYjPzVXRNPbvWu95v+vTEd7fPsgXl0S8Z8eRiMPWv5mFpPxVO
         d4tAecCAFWmTaAHfqNX5nZvKKuNO9s7NgiFvmnPTWagcdNpZeTdo9JbapJfwz4Qp/rjL
         zlB/WxaZhxe0bEAl4GCSn9YoYJMt4ZyQpmNzVhwTeEg0Mv51wl+yqh1rp800eKl7z3MH
         yAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dmOmt8ByQhAHvaxxxTyNZcZ2nUfxUzBc/uGFwV4SbSU=;
        b=dy5jdnxaORfBn/iNZFLiWN4fOkoAap/kE+MaqGlZP8gTST/43wROUVY4V0/CFslTyp
         HmRV52IuigHFTWnN7ONNh/IzOyp6tz0JjpzrmeumiYlUSjOIam69GUvfdIDhpp6YH5CL
         0gbCakp4VEYUbEGM8xEyOMYXbvQTCDO5y+uLbLFKecRhTYZd1FFS4tm3GFXVyEyTR05K
         rKFGB4kYEK5kbYLYZlbbS9cGg+aVA6lgiavcvFc9cmDmV6CM2ueTRYIQCEaEAgxc2KjH
         csH0pHjKyUxFAh7yH1T4uRJYZUSBfqkCei2MW6PGx42GnQwqavaK/LAzGcnZZKmjrNMt
         C9BA==
X-Gm-Message-State: APjAAAWWwJzzT15qncb1fvC7gyEFzUnoGBnQvQ/jASuTwnnGPyddRvrs
        Ln3xv0vZKhifpjznDRN34nOObg==
X-Google-Smtp-Source: APXvYqzJOIqA2UQlBiELNyb5KPyThnpCF6y+0o1uy4rZHgtyGnYlzKWdVRUGip9UfAPzDdNhxTkbyw==
X-Received: by 2002:a17:902:8a85:: with SMTP id p5mr24266624plo.150.1573581986157;
        Tue, 12 Nov 2019 10:06:26 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j21sm12610671pfa.58.2019.11.12.10.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 10:06:25 -0800 (PST)
Date:   Tue, 12 Nov 2019 10:06:23 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        s-anna@ti.com
Subject: Re: [PATCH 13/17] remoteproc/omap: add support for system
 suspend/resume
Message-ID: <20191112180623.GI3797@yoga>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-14-t-kristo@ti.com>
 <20191112061536.GO3108315@builder>
 <c0fe03eb-86c9-8c67-684e-b1f6f606b7ed@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0fe03eb-86c9-8c67-684e-b1f6f606b7ed@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 12 Nov 00:45 PST 2019, Tero Kristo wrote:

> On 12/11/2019 08:15, Bjorn Andersson wrote:
> > On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:
> > > diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> > [..]
> > > +static int _omap_rproc_suspend(struct rproc *rproc)
> > 
> > I think it would make sense to inline this and _omap_rproc_resume() in
> > their single call sites.
> 
> Well, these get re-used in following patch for runtime PM also, so it is
> probably better leave this for compiler to decide?
> 

I didn't see that until later, this is fine.

Regards,
Bjorn

> > 
> > [..]
> > > +static int _omap_rproc_resume(struct rproc *rproc)
> > > +{
> > [..]
> > > @@ -806,6 +972,14 @@ static int omap_rproc_probe(struct platform_device *pdev)
> > >   			oproc->num_timers);
> > >   	}
> > > +	init_completion(&oproc->pm_comp);
> > > +
> > > +	oproc->fck = of_clk_get(np, 0);
> > 
> > devm_clk_get() ?
> > 
> > Otherwise I think you're lacking a clk_put() in omap_rproc_remove()
> 
> Yeah, let me replace with devm_clk_get.
> 
> -Tero
> 
> > 
> > Regards,
> > Bjorn
> > 
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
