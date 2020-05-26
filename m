Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB411A8B7E
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 Apr 2020 21:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730975AbgDNTuq (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 Apr 2020 15:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2505214AbgDNTsv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Apr 2020 15:48:51 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A94C061A41
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 12:48:50 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g32so372160pgb.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 12:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QzfWbgrVmlKmMQ0dUMWreU+tU586B0O/544TZDFd2wk=;
        b=uSDcWEevkdPO2BldxquEtYDapREbfjzovtjYGr7QC/qXowPp2x61NxzIVl4fycYCyl
         2SqsR0v0wa135qZZBc0cuMWuEgviwsD5lxGMaO8Yjx1yrs9JgV6YTlb3kO+HNhPPK0Ge
         FNAwHsE9RQ2mycfyXtdGGmnQJk+mavcfTr5QWGIxIsWxREFO0mdVpDLuMhT+rrVZtGPa
         FpzhILEmFp9yNwv1A+Y6DYakiZV4McPBdAG+esElmWFigl8WUwEotmA+5V6HSy2jy57o
         DscjdSksxaosjaaj2dhL9oEV1twMz4dcISZ+JItsnV/DPjcua32f6PyZ8W8NDB8wQSmo
         guEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QzfWbgrVmlKmMQ0dUMWreU+tU586B0O/544TZDFd2wk=;
        b=rL8k66BaNVuqi63J2DfQ31hISaSsrO2c/RvOfzEH1/AclSkxzzEJhcSYAB02CFig9Q
         PH6MiuQuZgMIHIrk4OiHAABvRyf23FUGe6bocb1Q2jvoXRFzjF12CH2fBATOsu84gi8m
         tXbSJZvHoK3zamXu+gLTkq3oKnUaHngjbdpo5VZyWHzRnFOcFnz8O0DmpkbTaRIs+dAc
         JWy3d5CVGCJuX/YGePKd0MjEn4xhbgPB10MJ4OHbOR/DN1D2i8y7W7ZJ0rnJUwyrcakp
         PKzFm8oKBcPJu/5x3wvuaTDcIGXto9+dnOM31Ao8b+c/E30ZkdZSdIxv2S5/b/yVyIWR
         /1/A==
X-Gm-Message-State: AGi0PuZEnRfiM0QfMmrqq6sa42ZY1VOSwXr+c0Y/9NPLfNK+t9kvvCnK
        lrpYqvMkSeCo8siOOJNKbtaz6g==
X-Google-Smtp-Source: APiQypL6lnNwJto83RFzIyUPUtCgs3+X8dI+tR3vBY30qIrtNl7nmd7VPUWU3PcMk1ulLsjgCFwFpg==
X-Received: by 2002:a62:7c8b:: with SMTP id x133mr23836465pfc.229.1586893730271;
        Tue, 14 Apr 2020 12:48:50 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a1sm11727542pfl.188.2020.04.14.12.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 12:48:49 -0700 (PDT)
Date:   Tue, 14 Apr 2020 12:48:47 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Alex Elder <elder@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Suman Anna <s-anna@ti.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] remoteproc: Split firmware name allocation from
 rproc_alloc()
Message-ID: <20200414194847.GF892431@yoga>
References: <20200413193401.27234-1-mathieu.poirier@linaro.org>
 <20200413193401.27234-3-mathieu.poirier@linaro.org>
 <bd8cc8d5-94c1-5767-d089-535731fc1055@linaro.org>
 <20200414005506.GG20625@builder.lan>
 <CANLsYkx69cZotLUrt170XYiYxpkTGKBNC8FUioBD=OSnDYm46Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkx69cZotLUrt170XYiYxpkTGKBNC8FUioBD=OSnDYm46Q@mail.gmail.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 14 Apr 08:43 PDT 2020, Mathieu Poirier wrote:

> Hi guys,
> 
> On Mon, 13 Apr 2020 at 18:54, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 13 Apr 13:56 PDT 2020, Alex Elder wrote:
> >
> > > On 4/13/20 2:33 PM, Mathieu Poirier wrote:
> > > > Make the firmware name allocation a function on its own in order to
> > > > introduce more flexibility to function rproc_alloc().
> > > >
> > > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > >
> > > I didn't look at the larger context (MCU series); I'm only looking
> > > at this (and the others in this series) in isolation.  I like
> > > that you're encapsulating this stuff into functions but doing so
> > > doesn't really add any flexibility.
> > >
> > > Two small suggestions for you to consider but they're truly
> > > more about style so it's entirely up to you.  Outside of that
> > > this looks straightforward to me, and the result of the series
> > > is an improvement.
> > >
> > > I'll let you comment on my suggestions before offering my
> > > "reviewed-by" indication.
> > >
> > >                                       -Alex
> > >
> > > > ---
> > > >  drivers/remoteproc/remoteproc_core.c | 66 ++++++++++++++++------------
> > > >  1 file changed, 39 insertions(+), 27 deletions(-)
> > > >
> > > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > > index 80056513ae71..4dee63f319ba 100644
> > > > --- a/drivers/remoteproc/remoteproc_core.c
> > > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > > @@ -1979,6 +1979,33 @@ static const struct device_type rproc_type = {
> > > >     .release        = rproc_type_release,
> > > >  };
> > > >
> > > > +static int rproc_alloc_firmware(struct rproc *rproc,
> > > > +                           const char *name, const char *firmware)
> > > > +{
> > > > +   char *p, *template = "rproc-%s-fw";
> > > > +   int name_len;
> > >
> > > Not a big deal (and maybe it's not consistent with other nearby
> > > style) but template and name_len could be defined inside the
> > > "if (!firmware)" block.
> > >
> >
> > I prefer variables declared in the beginning of the function, so I'm
> > happy with this.
> >
> > > > +   if (!firmware) {
> > > > +           /*
> > > > +            * If the caller didn't pass in a firmware name then
> > > > +            * construct a default name.
> > > > +            */
> > > > +           name_len = strlen(name) + strlen(template) - 2 + 1;
> > > > +           p = kmalloc(name_len, GFP_KERNEL);
> > >
> > >
> > > I don't know if it would be an improvement, but you could
> > > check for a null p value below for both cases.  I.e.:
> > >
> > >               if (p)
> > >                       snprintf(p, ...);
> > >
> >
> > Moving the common NULL check and return out seems nice, but given that
> > we then have to have this positive conditional I think the end result is
> > more complex.
> >
> > That said, if we're not just doing a verbatim copy from rproc_alloc() I
> > think we should make this function:
> >
> >         if (!firmware)
> >                 p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
> >         else
> >                 p = kstrdup_const(firmware, GFP_KERNEL);
> >
> >         rproc->firmware = p;
> >
> >         return p ? 0 : -ENOMEM;
> 
> At this time I was going for a pure re-arrangement of the code and
> avoiding further improvement.  This is simple enough that it can be
> rolled-in the next revision.
> 

The resulting patch would be "factor out AND rewrite", which generally
is good cause for splitting things in two patches...

Regards,
Bjorn
