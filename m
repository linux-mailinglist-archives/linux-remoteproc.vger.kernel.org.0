Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3ABF259DD0
	for <lists+linux-remoteproc@lfdr.de>; Tue,  1 Sep 2020 20:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729023AbgIASCx (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 1 Sep 2020 14:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgIASCw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 1 Sep 2020 14:02:52 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB32C061244
        for <linux-remoteproc@vger.kernel.org>; Tue,  1 Sep 2020 11:02:52 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mm21so1007919pjb.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 01 Sep 2020 11:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YFsRezQtiR6MahU1E33o+0m2Vudr5dmRoZKIIP3nB6U=;
        b=r+2bgGJiLNEZ8F8yUAfaLKSxNfDfUk13qjYBKZoUly+knZsPgDLwASJ0tmFLAX1SNc
         wjAkufiRyeajqP+PHAKDihVZVj2uzdKQAxj4aAArNTBiSGrh8ldEbBwJ6VSzu1oar8un
         BfxthWcARYJ0LC1etzucsAt+dhNUCsiyCMYCWoxYHjKpVV5RWWopwd+GNCtqNzUXepc0
         F32oy+Ok8GYXuhV7bU3zmi6ILIWReWikmsgkd/lpirkshaU3zaR7vl+OXKJ8E6XBE3iH
         q2CeaGDEgZ0ZrxP47/MAUIll0WLjrOYyyl7Bym8ikbEYO2QIjj4PiTSD6gY2wajcY1UP
         yrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YFsRezQtiR6MahU1E33o+0m2Vudr5dmRoZKIIP3nB6U=;
        b=cO/HIrDGizzkomti+Axi5x9aYoXYLabINT2KoRE5K1mmy8/uJpUShazOG2eJZhZHwU
         3DrTT29UkguEtMOUW2HXhUL2NF4nuJob0Ha/l59VQYhC1GGgHxDTo1TVF9RlhtKRFNGm
         Vt7K5DwZpfXHLy3/Gf1kOC1I/wkgWs9YOWYB7IfAzr5AR0aafLX/tTFIsceK+vGxY+eB
         zhtJswuqe7REhFlEleuZ/6S6MxU9zJynSpwhBjdg04NtTaMkZVYCu+EacK9uWTM1XxCH
         chXhQXAhkeKTho75zApaHBSI9dnohjlYtV39J6Bknh5P7UBEW3ycjYtfdTVm0m6fiRVJ
         Y1iw==
X-Gm-Message-State: AOAM533KQAobZgVmy9hcbVHJPt2OiEaFSEdbC2bRxjrjusgAIQtEnFV3
        ssLQJZaKYpeCY2eq2PoSk2pOfA==
X-Google-Smtp-Source: ABdhPJz52YYzBRkii3bA7P30/1FP8ApvzFB9BoIEsJT9GjZtlbsYUKSEYHTuMTpGTRjIFDVEn4hD6g==
X-Received: by 2002:a17:90a:4e42:: with SMTP id t2mr2638623pjl.121.1598983371469;
        Tue, 01 Sep 2020 11:02:51 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x22sm2626790pfn.41.2020.09.01.11.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 11:02:50 -0700 (PDT)
Date:   Tue, 1 Sep 2020 12:02:49 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] remoteproc: Add support for detaching from rproc
Message-ID: <20200901180249.GD236120@xps15>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
 <cc10db90-92ca-41e1-110d-885ef8266191@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc10db90-92ca-41e1-110d-885ef8266191@st.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Sep 01, 2020 at 06:55:14PM +0200, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 8/26/20 6:45 PM, Mathieu Poirier wrote:
> > Following the work done here [1] this set provides support for the
> > remoteproc core to release resources associated with a remote processor
> > without having to switch it off. That way a platform driver can be removed
> > or the applcation processor power cycled while the remote processor is
> > still operating.
> > 
> > I have not tested the solution because of the work involved in getting
> > a new firmware image to support the feature.  I will do so once it is
> > determined that this is the right approach to follow.
> 
> I just started watching your series. I also think that we have first to
> determine the approach that match meets the requirements of all companies.
> 
> Here is my feeling, waiting more feedback from community:
> 
> If I understand your approach correctly you propose that the application
> determines the firmware live-cycle. Depending on request, the remoteproc core
> performs a "shutdown" ( stop + unprepare) or a "detach".

To be formal, /sys/class/remoteproc/remoteprocX/state takes a "stop" operation
and a newly added "detach" operation.

> The platform driver can(or have to?) implement the stop and/or the detach.

That is entirely up to the platform driver and the requirements of the system.
That is why rproc_shutdown() and rproc_detach() return an error code to be
conveyed to the sysfs mechanic.


> By default a preloaded firmware is detached and a "standard" firmware is stopped
> on kernel shutdown (rproc_del).

That is correct.  It is the simplest heuristic that I could come up with,
leaving opportunities to make enhancement as we see fit.

> 
> As we have seen with the rproc cdev, it might not be simple to manage this
> in case of crash.
> For instance you can have a Firmware started by the boot-stages but
> which must be gracefully stopped in case of crash.  
>

That is why I wanted to leave crash scenarios out of this set.  What happens
when the system crashes will follow the same heuristic we decide to enact in
rproc_del().
 
> Another approach would be to let the platform driver decides what should
> be done on the stop and prepare ops depending on the HW context.
> So the platform driver would be in charge of detaching the firmware.
> In this case the issue is to determine the state after stop. the information
> would be in platform driver.
> 

Yes, that is one way to proceed.  The downside of this approach is that platform
drivers would be responsible for setting rproc->state.  I am not totally opposed
to proceed this way but would like to explore other avenues before committing to
that solution.

On that note, did we talk about using the DT before?  That would be very easy,
simple and flexible.  Anyways, deciding what to do will take time hence keeping
this set to an absolute minimum.

> I would be more in flavor of the second one, because application would not
> have to be aware of the co-processor firmware life-cycle, and the firmware
> could expose its own constraints for shutdown.  
> 
> A third approach (or complementary approach): 
> I don't know why i didn't think of it before... The attach/detach
> feature is quite similar to the regulator management.
> 
> For regulator 2 DT properties exist[1]:
> - regulator-always-on: boolean, regulator should never be disabled
> - regulator-boot-on: bootloader/firmware enabled regulator
> 
> It is a static configuration but could be implemented for both the attach and
> the detach in the core part.

Yes, the device tree is a definite possibility.

Thanks for the input,
Mathieu

> Else if a more dynamic management could be managed by the platform driver
> (depending on the loaded firmware).
>   
> [1]https://elixir.bootlin.com/linux/v4.0/source/Documentation/devicetree/bindings/regulator/regulator.txt
> 
> Thanks,
> Arnaud
> 
> > 
> > Applies cleanly on rproc-next (62b8f9e99329)
> > 
> > Thanks,
> > Mathieu 
> > 
> > [1]. https://lkml.org/lkml/2020/7/14/1600
> > 
> > Mathieu Poirier (13):
> >   remoteproc: Re-check state in rproc_shutdown()
> >   remoteproc: Remove useless check in rproc_del()
> >   remoteproc: Add new RPROC_ATTACHED state
> >   remoteproc: Properly represent the attached state
> >   remoteproc: Add new detach() remoteproc operation
> >   remoteproc: Introduce function __rproc_detach()
> >   remoteproc: Introduce function rproc_detach()
> >   remoteproc: Rename function rproc_actuate()
> >   remoteproc: Add return value to function rproc_shutdown()
> >   remoteproc: Properly deal with a stop request when attached
> >   remoteproc: Properly deal with detach request
> >   remoteproc: Refactor rproc delete and cdev release path
> >   remoteproc: Properly deal with a kernel panic when attached
> > 
> >  drivers/remoteproc/remoteproc_cdev.c  |  18 ++-
> >  drivers/remoteproc/remoteproc_core.c  | 151 +++++++++++++++++++++-----
> >  drivers/remoteproc/remoteproc_sysfs.c |  17 ++-
> >  include/linux/remoteproc.h            |  14 ++-
> >  4 files changed, 157 insertions(+), 43 deletions(-)
> > 
