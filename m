Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1862D64BC
	for <lists+linux-remoteproc@lfdr.de>; Thu, 10 Dec 2020 19:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392950AbgLJSSF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 10 Dec 2020 13:18:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392930AbgLJSR7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Dec 2020 13:17:59 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7ACC0613D6
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Dec 2020 10:17:19 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id q25so6736337oij.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Dec 2020 10:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uw5yIh61JKo5/En0PAb29LwQEGzQi6lmhmDKRSFr+G4=;
        b=CkjGDT2hZQGIq0Q38/mkTxav9g9BsLKr2SYSgKdozoMRLVy+FMr/RGgV8HdVkDrlPI
         9Q1vE13lNnDfykLYcFlnso6D9sudUXdtvkvFTDfNRO6aQ628tQnvprUoWIRdtaQKJpOM
         8h8AQ8yZYfZO/1olEfRwxlk+TSO8j1mRZ+ZUhaXbCvJKcAsgHJ66UOLNOye1KM2ulSbd
         IOJIfr+vM7+T6FlXBqt1AQ+X0dkv6zxsArOahoai5tzjsYuUmDxDHv/bSpPLA3nVLMob
         ZOdDPaxH+BF0ZmkrEToSfrpzTxy/aEekbiSET39hLIw2B6oI2GovNnkNK5tcIiTQ9m91
         f4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uw5yIh61JKo5/En0PAb29LwQEGzQi6lmhmDKRSFr+G4=;
        b=JwgtFwtvlZDoS2imKmXcZhkuS+++AycxBRsvtgB6Y0q6mJxRwAp9Jj4lYDN0XsEwbC
         V7RQnv4YJKJNp/cBlwekyuj4SBDS+8Me2pT9n6Cfc8hAC8CE8uYw09IUUHf0T7zrIcA7
         VLRyhX0J07Afsc46LO51MfArh2RMX6fP4RGpnPGgvQXMIt/dWZWaQh7Bd3hOFmf0ippG
         pHrI4rHVNsgmt5GHCyCtPZ3kaqr9sYDftFoj3iyW/1r2B239SolimezG4r7dhh5x6Src
         SiBBXxubhldfj+7qTlfawmiGUBKyUOXVXZmCe9qenh2i7F1loMpQe5VYzHnlcL8VIRZc
         hbLg==
X-Gm-Message-State: AOAM530B/AE7ROd5pr9BvYguutVpcrRMr3HQjSaZHYUwjMV9zGGuc9EN
        uB7jbFyG8VM3sDqNPv62iEjsGQ==
X-Google-Smtp-Source: ABdhPJzGp3kXk985pD2FxipwKLcWv24P0Pd7Y2VkOhf3ynr8Mdq36ad/FJxmqgsa2ySHU7kpdAHFWw==
X-Received: by 2002:aca:3757:: with SMTP id e84mr2795207oia.5.1607624238805;
        Thu, 10 Dec 2020 10:17:18 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y8sm937798oix.43.2020.12.10.10.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 10:17:17 -0800 (PST)
Date:   Thu, 10 Dec 2020 12:17:15 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v2 3/3] remoteproc: Add ftrace events to trace lifecycle
 of remoteprocs
Message-ID: <X9JmK6/eUHfMj+dR@builder.lan>
References: <1605563084-30385-1-git-send-email-rishabhb@codeaurora.org>
 <1605563084-30385-4-git-send-email-rishabhb@codeaurora.org>
 <20201118222614.GA75192@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118222614.GA75192@xps15>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 18 Nov 16:26 CST 2020, Mathieu Poirier wrote:

> On Mon, Nov 16, 2020 at 01:44:44PM -0800, Rishabh Bhatnagar wrote:
> > Add trace events to trace bootup/shutdown/recovery of remote
> > processors. These events are useful in analyzing the time
> > spent in each step in the life cycle and can be used for
> > performace analysis. Also these serve as standard checkpoints
> > in debugging.
> > 
> > Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 19 +++++++-
> >  include/trace/events/remoteproc.h    | 91 ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 109 insertions(+), 1 deletion(-)
> >  create mode 100644 include/trace/events/remoteproc.h
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index dab2c0f..39da409 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -42,6 +42,9 @@
> >  
> >  #include "remoteproc_internal.h"
> >  
> > +#define CREATE_TRACE_POINTS
> > +#include <trace/events/remoteproc.h>
> > +
> >  #define HIGH_BITS_MASK 0xFFFFFFFF00000000ULL
> >  
> >  static DEFINE_MUTEX(rproc_list_mutex);
> > @@ -1164,6 +1167,7 @@ static int rproc_prepare_subdevices(struct rproc *rproc)
> >  	struct rproc_subdev *subdev;
> >  	int ret;
> >  
> > +	trace_rproc_subdevices("Prepare subdevices", rproc->name);
> 
> I wouldn't add this to the core - after a while they become part of the ABI and
> we can't move things around.  I suppose they can stay in platform drivers but
> even that is going against the general trend in the kernel community to avoid them at
> all.  To me this should remain out of tree code but Bjorn will make the call.
> 

I need to update my understanding of traces being ABI or not. But I
think the general start/stop traces would be useful and I expect that we
will continue to do those.

For the subdevices we need to conclude what we want to trace, e.g.
is this big trace adding anything beyond the trace_rproc_boot()?
Shouldn't we trace the individual subdevs, and if so we're definitely in
the area you're worrying about.

Regards,
Bjorn

> Thanks,
> Mathieu
> 
> >  	list_for_each_entry(subdev, &rproc->subdevs, node) {
> >  		if (subdev->prepare) {
> >  			ret = subdev->prepare(subdev);
> > @@ -1188,6 +1192,7 @@ static int rproc_start_subdevices(struct rproc *rproc)
> >  	struct rproc_subdev *subdev;
> >  	int ret;
> >  
> > +	trace_rproc_subdevices("Start subdevices", rproc->name);
> >  	list_for_each_entry(subdev, &rproc->subdevs, node) {
> >  		if (subdev->start) {
> >  			ret = subdev->start(subdev);
> > @@ -1211,6 +1216,7 @@ static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
> >  {
> >  	struct rproc_subdev *subdev;
> >  
> > +	trace_rproc_subdevices("Stop subdevices", rproc->name);
> >  	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
> >  		if (subdev->stop)
> >  			subdev->stop(subdev, crashed);
> > @@ -1221,6 +1227,7 @@ static void rproc_unprepare_subdevices(struct rproc *rproc)
> >  {
> >  	struct rproc_subdev *subdev;
> >  
> > +	trace_rproc_subdevices("Unprepare subdevices", rproc->name);
> >  	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
> >  		if (subdev->unprepare)
> >  			subdev->unprepare(subdev);
> > @@ -1357,6 +1364,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >  	struct device *dev = &rproc->dev;
> >  	int ret;
> >  
> > +	trace_rproc_boot("loading firmware segments into memory", rproc->name);
> >  	/* load the ELF segments to memory */
> >  	ret = rproc_load_segments(rproc, fw);
> >  	if (ret) {
> > @@ -1385,6 +1393,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >  		goto reset_table_ptr;
> >  	}
> >  
> > +	trace_rproc_boot("starting remoteproc", rproc->name);
> >  	/* power up the remote processor */
> >  	ret = rproc->ops->start(rproc);
> >  	if (ret) {
> > @@ -1402,6 +1411,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >  
> >  	rproc->state = RPROC_RUNNING;
> >  
> > +	trace_rproc_boot("remoteproc is up", rproc->name);
> >  	dev_info(dev, "remote processor %s is now up\n", rproc->name);
> >  
> >  	return 0;
> > @@ -1648,6 +1658,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
> >  	/* the installed resource table is no longer accessible */
> >  	rproc->table_ptr = rproc->cached_table;
> >  
> > +	trace_rproc_shutdown("Stopping the remoteproc", rproc->name);
> >  	/* power off the remote processor */
> >  	ret = rproc->ops->stop(rproc);
> >  	if (ret) {
> > @@ -1697,6 +1708,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
> >  	if (rproc->state != RPROC_CRASHED)
> >  		goto unlock_mutex;
> >  
> > +	trace_rproc_recovery("Recover remoteproc", rproc->name);
> >  	dev_err(dev, "recovering %s\n", rproc->name);
> >  
> >  	ret = rproc_stop(rproc, true);
> > @@ -1716,6 +1728,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
> >  	/* boot the remote processor up again */
> >  	ret = rproc_start(rproc, firmware_p);
> >  
> > +	trace_rproc_recovery("Recovery completed", rproc->name);
> >  	release_firmware(firmware_p);
> >  
> >  unlock_mutex:
> > @@ -1796,6 +1809,7 @@ int rproc_boot(struct rproc *rproc)
> >  	/* skip the boot or attach process if rproc is already powered up */
> >  	if (atomic_inc_return(&rproc->power) > 1) {
> >  		ret = 0;
> > +		trace_rproc_boot("Incrementing ref count and exiting", rproc->name);
> >  		goto unlock_mutex;
> >  	}
> >  
> > @@ -1804,6 +1818,7 @@ int rproc_boot(struct rproc *rproc)
> >  
> >  		ret = rproc_actuate(rproc);
> >  	} else {
> > +		trace_rproc_boot("requesting firmware", rproc->name);
> >  		dev_info(dev, "powering up %s\n", rproc->name);
> >  
> >  		/* load firmware */
> > @@ -1858,8 +1873,10 @@ void rproc_shutdown(struct rproc *rproc)
> >  	}
> >  
> >  	/* if the remote proc is still needed, bail out */
> > -	if (!atomic_dec_and_test(&rproc->power))
> > +	if (!atomic_dec_and_test(&rproc->power)) {
> > +		trace_rproc_shutdown("Decrementing ref count and exiting", rproc->name);
> >  		goto out;
> > +	}
> >  
> >  	ret = rproc_stop(rproc, false);
> >  	if (ret) {
> > diff --git a/include/trace/events/remoteproc.h b/include/trace/events/remoteproc.h
> > new file mode 100644
> > index 0000000..341bf4b
> > --- /dev/null
> > +++ b/include/trace/events/remoteproc.h
> > @@ -0,0 +1,91 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> > + */
> > +
> > +#undef TRACE_SYSTEM
> > +#define TRACE_SYSTEM remoteproc
> > +
> > +#if !defined(_TRACE_REMOTEPROC_H) || defined(TRACE_HEADER_MULTI_READ)
> > +#define _TRACE_REMOTEPROC_H
> > +
> > +#include <linux/tracepoint.h>
> > +
> > +TRACE_EVENT(rproc_boot,
> > +
> > +	TP_PROTO(const char *event, const char *rproc_name),
> > +
> > +	TP_ARGS(event, rproc_name),
> > +
> > +	TP_STRUCT__entry(
> > +		__string(event, event)
> > +		__string(rproc_name, rproc_name)
> > +	),
> > +
> > +	TP_fast_assign(
> > +		__assign_str(event, event);
> > +		__assign_str(rproc_name, rproc_name);
> > +	),
> > +
> > +	TP_printk("rproc_boot: %s: %s", __get_str(rproc_name), __get_str(event))
> > +);
> > +
> > +TRACE_EVENT(rproc_shutdown,
> > +
> > +	TP_PROTO(const char *event, const char *rproc_name),
> > +
> > +	TP_ARGS(event, rproc_name),
> > +
> > +	TP_STRUCT__entry(
> > +		__string(event, event)
> > +		__string(rproc_name, rproc_name)
> > +	),
> > +
> > +	TP_fast_assign(
> > +		__assign_str(event, event);
> > +		__assign_str(rproc_name, rproc_name);
> > +	),
> > +
> > +	TP_printk("rproc_shutdown: %s: %s", __get_str(rproc_name), __get_str(event))
> > +);
> > +
> > +TRACE_EVENT(rproc_recovery,
> > +
> > +	TP_PROTO(const char *event, const char *rproc_name),
> > +
> > +	TP_ARGS(event, rproc_name),
> > +
> > +	TP_STRUCT__entry(
> > +		__string(event, event)
> > +		__string(rproc_name, rproc_name)
> > +	),
> > +
> > +	TP_fast_assign(
> > +		__assign_str(event, event);
> > +		__assign_str(rproc_name, rproc_name);
> > +	),
> > +
> > +	TP_printk("rproc_recovery: %s: %s", __get_str(rproc_name), __get_str(event))
> > +);
> > +
> > +TRACE_EVENT(rproc_subdevices,
> > +
> > +	TP_PROTO(const char *event, const char *rproc_name),
> > +
> > +	TP_ARGS(event, rproc_name),
> > +
> > +	TP_STRUCT__entry(
> > +		__string(event, event)
> > +		__string(rproc_name, rproc_name)
> > +	),
> > +
> > +	TP_fast_assign(
> > +		__assign_str(event, event);
> > +		__assign_str(rproc_name, rproc_name);
> > +	),
> > +
> > +	TP_printk("rproc_subdevices: %s: %s", __get_str(rproc_name), __get_str(event))
> > +);
> > +#endif
> > +#include <trace/define_trace.h>
> > +
> > -- 
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> > 
