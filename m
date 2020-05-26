Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0630B199D48
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 19:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgCaRzv (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 31 Mar 2020 13:55:51 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46147 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgCaRzv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 31 Mar 2020 13:55:51 -0400
Received: by mail-pl1-f193.google.com with SMTP id s23so8381212plq.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2020 10:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GoUa/6teu/RT06IqOO0iSAQKVnlP8oOstp8JGuHMdCA=;
        b=zL2E2kjfs6pgF8KxeX/xdp5v076EaoOmHxLU346IMqVDnptRysc8l5FB1dpz1Fk44E
         OK1XjKFsl5luz/vFlTzuMtj7X1NhC8CHCTTqNcnn7EVvu5HBHxHV7QiZ6xk6s7gPV+nr
         c8lirSkksCQLA5GnUsBo1hqrVBESdwhu551ajWZblKP1FheaLE+aYJNos6TS5gUE9wZL
         yTx5JPW2e3jo+KtGlAGf/cpAmsIWR6qLjSkvb2LPU4HJ7CDHaJ3s/5/uw405y7HB4ICo
         OCyx1caLh5R98uv2n4qZ8/glYIJ6M8Tbg7YivCfVFL79vd+zZnwwfKV6N84PbrCKsHB4
         ixqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GoUa/6teu/RT06IqOO0iSAQKVnlP8oOstp8JGuHMdCA=;
        b=AhI8SD/Cvs1Q4qmeS2wcude43C1UdBntrZrR5A1s1x+gaX8Kc+LAbhXuVXVmSqKIxg
         p3JhsnJawnM+A4cHVqa+t6wVVVRlTUm8Zcl+1QyzmPawDLYFl0NMESFxXWwzIfF4iGAM
         ITtPhNZJ8cKa9IP48H6vG+JKfTWdqgwFyRensjkfOl+7RbDZqWLPfK7dSIR5WPZbOrhs
         YesMK9+chZ6zXqWc7AjjY6PCuB8KTVUMdVgvLesjuHXlYcaSB2XbQuPm1vk0iKH5lLVu
         Ru6w9Ke0i++iFC10Z+4jWaygY7S1V5yJVh3QNJ74d/5GTwe3EalT7NiPjfLIi1IcwkvK
         55jw==
X-Gm-Message-State: AGi0PuYJlZqSHswJtZfwYGtHjuWHD+KI8mvKPQCqjatq+alIJA2/hw2n
        cIu94FT1J2m1BuUzo9vu0fmEzw==
X-Google-Smtp-Source: APiQypLGSOYesDdWe4vtvaykx8I/mTwgub37C16dy9RG7nhMC0PcxL+x8wm3IhxNBryGFk3Qeqy1fA==
X-Received: by 2002:a17:90b:11c4:: with SMTP id gv4mr68881pjb.148.1585677349972;
        Tue, 31 Mar 2020 10:55:49 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 6sm12770086pfx.69.2020.03.31.10.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 10:55:49 -0700 (PDT)
Date:   Tue, 31 Mar 2020 10:55:47 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>, psodagud@codeaurora.org,
        tsoni@codeaurora.org, Siddharth Gupta <sidgup@codeaurora.org>
Subject: Re: [PATCH 1/2] remoteproc: Add userspace char device driver
Message-ID: <20200331175547.GB254911@minitux>
References: <1585241440-7572-1-git-send-email-rishabhb@codeaurora.org>
 <1585241440-7572-2-git-send-email-rishabhb@codeaurora.org>
 <20200330221245.GA17782@xps15>
 <20200330224554.GD215915@minitux>
 <CANLsYkxEA66kGZh1rToSn79fpgPHqEjMZsSw74Rx3OLwG2k35w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkxEA66kGZh1rToSn79fpgPHqEjMZsSw74Rx3OLwG2k35w@mail.gmail.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 31 Mar 09:47 PDT 2020, Mathieu Poirier wrote:

> On Mon, 30 Mar 2020 at 16:45, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 30 Mar 15:12 PDT 2020, Mathieu Poirier wrote:
> > [..]
> > > > +   struct rproc *rproc;
> > > > +
> > > > +   rproc = container_of(inode->i_cdev, struct rproc, char_dev);
> > > > +   if (!rproc)
> > > > +           return -EINVAL;
> > > > +
> > > > +   rproc_shutdown(rproc);
> > >
> > > The scenario I see here is that a userspace program will call
> > > open(/dev/rproc_xyz, SOME_OPTION) when it is launched.  The file stays open
> > > until either the application shuts down, in which case it calls close() or it
> > > crashes.  In that case the system will automatically close all file descriptors
> > > that were open by the application, which will also call rproc_shutdown().
> > >
> > > To me the same functionality can be achieved with the current functionality
> > > provided by sysfs.
> > >
> > > When the application starts it needs to read
> > > "/sys/class/remoteproc/remoteprocX/state".  If the state is "offline" then
> > > "start" should be written to "/sys/.../state".  If the state is "running" the
> > > application just crashed and got restarted.  In which case it needs to stop the
> > > remote processor and start it again.
> > >
> >
> > A case when this would be useful is the Qualcomm modem, which relies on
> > disk access through a "remote file system service" [1].
> >
> > Today we register the service (a few layers ontop of rpmsg/GLINK) then
> > find the modem remoteproc and write "start" into the state sysfs file.
> >
> > When we get a signal for termination we write "stop" into state to stop
> > the remoteproc before exiting.
> >
> > There is however no way for us to indicate to the modem that rmtfs just
> > died, e.g. a kill -9 on the process will result in the modem continue
> > and the next IO request will fail which in most cases will be fatal.
> 
> The modem will crash when attempting an IO while rmtfs is down?
> 

In certain cases there's nothing else to do.

> >
> > So instead having rmtfs holding /dev/rproc_foo open would upon its
> > termination cause the modem to be stopped automatically, and as the
> > system respawns rmtfs the modem would be started anew and the two sides
> > would be synced up again.
> 
> I have a better idea of what is going on now - thanks for writing this up.
> 
> I would make this feature a kernel configurable option as some people
> may not want it.

Sounds reasonable.

> I also think having "/dev/remoteprocX" is fine, so
> no need to change anything currently visible in sysfs.
> 

I agree, it sure is annoying that remoteproc%d isn't stable, but it's
what we have and consistency is important.

Regards,
Bjorn
