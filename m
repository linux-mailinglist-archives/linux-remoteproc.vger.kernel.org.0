Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE13146F4D
	for <lists+linux-remoteproc@lfdr.de>; Thu, 23 Jan 2020 18:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbgAWRPa (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 23 Jan 2020 12:15:30 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45373 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgAWRPa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Jan 2020 12:15:30 -0500
Received: by mail-pf1-f195.google.com with SMTP id 2so1816007pfg.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jan 2020 09:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bNZGu1kFlpWlkFtI3XpdiZVkjmI702+wBN9nrBzzzSc=;
        b=YzYacY2KAQW2KqYGHa3RYv2WKSgX/92+YLdIP6EUTZYda4ufACCrqKXeQXOuDYinU8
         4DCG1Koy2U8sRMDF947kzqTu7jZGE0HkKme637PAz+SBuK/2sOCd4BqtdE3jOAopSX/A
         U2T98nxbFkR7BcyBjDrdllBw1dvhVuVtGUIqiLXRql5CBEwjIPt2qz9PN8TKq4U9IDku
         P5td7fMl/JQDRLLydrrpFLWwr0trlxE/jYLI11JxZ/c/+gGsQuDZcyDi3uw0BvSC8t3G
         jzfsQSKmIg9Q1K2cXcm4LfZS0Nt2MLAIlBsUQuSYVE7PxVoFOsGruvKhnObTNmrjzImA
         8qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bNZGu1kFlpWlkFtI3XpdiZVkjmI702+wBN9nrBzzzSc=;
        b=tyKydUnpVxVWyVb9iX9SP1+f5htb97ETedQutvoNKDibAFUIcSeUQSxxDziCmSNPB0
         jKj1Bcxrl9/KbjVQGYMO/eOGJ3qFubG4Vq43tHUIJG3SNYcvfI3r5EyAyTkasYXEmAzv
         lQyqiJfQteA5o2EboosJ8GrNYWrFDQECXCu/s7Pi0NVHySMxj6IUsQliDrjBPFchYTnU
         k3jEMr0HQ/AbojcCuId6ywBRXB2wir2frxxcaIMkAFhFUYB6+QPQ37Dodye3TUW/hQA1
         UUZ/dnHWju5PUDjGIHIitihL5o19Abvli8Hm3+ECosLdI/Fa/nWZSYyJJtFTuXFeDBaw
         4Ikw==
X-Gm-Message-State: APjAAAV3l1Y/K6CK9vsTWrRNjla5ZLpr12KY+SzaYM7xYOOWvEVtI8yz
        tEpqlgErstThAgtKun/csOl4GQ==
X-Google-Smtp-Source: APXvYqxQNImiOxMYx+w+ikRxTcD1DRu1i/FWNVwHmCN122tD1shbJCj7MeVfu/JaGOYI0/F8n+lsVA==
X-Received: by 2002:a65:68ca:: with SMTP id k10mr5174137pgt.222.1579799728916;
        Thu, 23 Jan 2020 09:15:28 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q15sm3625663pgi.55.2020.01.23.09.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 09:15:28 -0800 (PST)
Date:   Thu, 23 Jan 2020 09:15:24 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v2 7/8] remoteproc: qcom: q6v5: Add common panic handler
Message-ID: <20200123171524.GV1511@yoga>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-8-bjorn.andersson@linaro.org>
 <20200110212806.GD11555@xps15>
 <20200122193936.GB3261042@ripper>
 <CANLsYkx-C9U4W3R3Xo6t3BJBM4UK_i3zuwzhnXMMEQ0-ur+8Kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkx-C9U4W3R3Xo6t3BJBM4UK_i3zuwzhnXMMEQ0-ur+8Kg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 23 Jan 09:01 PST 2020, Mathieu Poirier wrote:

> On Wed, 22 Jan 2020 at 12:40, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Fri 10 Jan 13:28 PST 2020, Mathieu Poirier wrote:
> >
> > > On Thu, Dec 26, 2019 at 09:32:14PM -0800, Bjorn Andersson wrote:
> > > > Add a common panic handler that invokes a stop request and sleep enough
> > > > to let the remoteproc flush it's caches etc in order to aid post mortem
> > > > debugging.
> > > >
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > ---
> > > >
> > > > Changes since v1:
> > > > - None
> > > >
> > > >  drivers/remoteproc/qcom_q6v5.c | 19 +++++++++++++++++++
> > > >  drivers/remoteproc/qcom_q6v5.h |  1 +
> > > >  2 files changed, 20 insertions(+)
> > > >
> > > > diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> > > > index cb0f4a0be032..17167c980e02 100644
> > > > --- a/drivers/remoteproc/qcom_q6v5.c
> > > > +++ b/drivers/remoteproc/qcom_q6v5.c
> > > > @@ -6,6 +6,7 @@
> > > >   * Copyright (C) 2014 Sony Mobile Communications AB
> > > >   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> > > >   */
> > > > +#include <linux/delay.h>
> > > >  #include <linux/kernel.h>
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/interrupt.h>
> > > > @@ -15,6 +16,8 @@
> > > >  #include <linux/remoteproc.h>
> > > >  #include "qcom_q6v5.h"
> > > >
> > > > +#define Q6V5_PANIC_DELAY_MS        200
> > > > +
> > > >  /**
> > > >   * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
> > > >   * @q6v5:  reference to qcom_q6v5 context to be reinitialized
> > > > @@ -162,6 +165,22 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(qcom_q6v5_request_stop);
> > > >
> > > > +/**
> > > > + * qcom_q6v5_panic() - panic handler to invoke a stop on the remote
> > > > + * @q6v5:  reference to qcom_q6v5 context
> > > > + *
> > > > + * Set the stop bit and sleep in order to allow the remote processor to flush
> > > > + * its caches etc for post mortem debugging.
> > > > + */
> > > > +void qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
> > > > +{
> > > > +   qcom_smem_state_update_bits(q6v5->state,
> > > > +                               BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
> > > > +
> > > > +   mdelay(Q6V5_PANIC_DELAY_MS);
> > >
> > > I really wonder if the delay should be part of the remoteproc core and
> > > configurable via device tree.  Wanting the remote processor to flush its caches
> > > is likely something other vendors will want when dealing with a kernel panic.
> > > It would be nice to see if other people have an opinion on this topic.  If not
> > > then we can keep the delay here and move it to the core if need be.
> > >
> >
> > I gave this some more thought and what we're trying to achieve is to
> > signal the remote processors about the panic and then give them time to
> > react, but per the proposal (and Qualcomm downstream iirc) we will do
> > this for each remote processor, one by one.
> >
> > So in the typical case of a Qualcomm platform with 4-5 remoteprocs we'll
> > end up giving the first one a whole second to react and the last one
> > "only" 200ms.
> >
> > Moving the delay to the core by iterating over rproc_list calling
> > panic() and then delaying would be cleaner imo.
> 
> I agree.
> 
> >
> > It might be nice to make this configurable in DT, but I agree that it
> > would be nice to hear from others if this would be useful.
> 
> I think the delay has to be configurable via DT if we move this to the
> core.  The binding can be optional and default to 200ms if not
> present.
> 

How about I make the panic() return the required delay and then we let
the core sleep for MAX() of the returned durations? That way the default
is still a property of the remoteproc drivers - and 200ms seems rather
arbitrary to put in the core, even as a default.

Regards,
Bjorn
