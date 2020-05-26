Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01AF0199C08
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 18:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730664AbgCaQrV (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 31 Mar 2020 12:47:21 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:38739 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730442AbgCaQrV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 31 Mar 2020 12:47:21 -0400
Received: by mail-il1-f195.google.com with SMTP id n13so12769203ilm.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2020 09:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OT4pMSpiK/UC4Mr+9RHkJgxu5bDQsWsl1DR3uPPrhxA=;
        b=vB974iQR0mwNOw4ta4Za0CbIwf55mbOkr3ld8d5uyxVx1ETSjNjcsojv8CjlVRaW0d
         Gd/6PSilrRsC9ppGDDcw3+4Wr9f78Gl5i/HuB5ClEaIwfsiLc0DOhy1esQP7pRmCVUOt
         KcRcAjZef+0tqaMXcKR19EGP2qhCF8eA3tPvD+EPk/xj0paOd7wC/YpE0UpQYsIjCy93
         PWlotFT+sOebVgEqUSVEBl+mmTCf1bhkEroEw78q49EACEqSBmSD/ukqYYnN6/alzi8T
         6pN4oM265p982ZorEQpqMrPEDrvnZQcjt2JOsabPyT3MKYdflD5v/QaIYEgkaNBAkzi9
         ydPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OT4pMSpiK/UC4Mr+9RHkJgxu5bDQsWsl1DR3uPPrhxA=;
        b=R8HAANvJWJjRNVFzr+xWYzlfRoJt3eG6249VBWKNayLD+DsA4dVSCx3CfKy/OECku5
         LcIkHTYZ5hXCnBbObJeOFhkzsozzq/doycGi1DF4GXqFYYS4SCUIl4is1DGo05MLaP19
         LFvh20+qJ4slW4LKX5dieXvkhxnAyVq0RMBohiET9jFDgR93+QCzJgDN7+u02R3/tSFj
         l6dW84SB5s3OTq5uQtt2KZIXTWKS7CZjRBIPLvkBN7xECu46MPrcPuTVXuz8z1U5asDX
         ycoNCUakcMp7vh30y3RpN6M1zo88nRRsExvbcAge9/wSwsZvevjVzdNCgXYAYJc0qAzM
         G3iw==
X-Gm-Message-State: ANhLgQ1/9FXSp8YW9A7p5XudYRO5ni/f8RdCiIc0v6nc/NM9DKPPFpnv
        VTOCaZ5x977b98+ltFTYV7fzE6lKyfGLSqG4jVFOnw==
X-Google-Smtp-Source: ADFU+vuv2z+RvUoyFBKFpaGQ6uQeCth3Kdb+5ldsc6qBNaQajNgyTri0JxfBs2MSQ304FwNf6wkpiR9u0IqgVt7aBz4=
X-Received: by 2002:a92:8352:: with SMTP id f79mr16835440ild.58.1585673239840;
 Tue, 31 Mar 2020 09:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <1585241440-7572-1-git-send-email-rishabhb@codeaurora.org>
 <1585241440-7572-2-git-send-email-rishabhb@codeaurora.org>
 <20200330221245.GA17782@xps15> <20200330224554.GD215915@minitux>
In-Reply-To: <20200330224554.GD215915@minitux>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 31 Mar 2020 10:47:08 -0600
Message-ID: <CANLsYkxEA66kGZh1rToSn79fpgPHqEjMZsSw74Rx3OLwG2k35w@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: Add userspace char device driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>, psodagud@codeaurora.org,
        tsoni@codeaurora.org, Siddharth Gupta <sidgup@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 30 Mar 2020 at 16:45, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 30 Mar 15:12 PDT 2020, Mathieu Poirier wrote:
> [..]
> > > +   struct rproc *rproc;
> > > +
> > > +   rproc = container_of(inode->i_cdev, struct rproc, char_dev);
> > > +   if (!rproc)
> > > +           return -EINVAL;
> > > +
> > > +   rproc_shutdown(rproc);
> >
> > The scenario I see here is that a userspace program will call
> > open(/dev/rproc_xyz, SOME_OPTION) when it is launched.  The file stays open
> > until either the application shuts down, in which case it calls close() or it
> > crashes.  In that case the system will automatically close all file descriptors
> > that were open by the application, which will also call rproc_shutdown().
> >
> > To me the same functionality can be achieved with the current functionality
> > provided by sysfs.
> >
> > When the application starts it needs to read
> > "/sys/class/remoteproc/remoteprocX/state".  If the state is "offline" then
> > "start" should be written to "/sys/.../state".  If the state is "running" the
> > application just crashed and got restarted.  In which case it needs to stop the
> > remote processor and start it again.
> >
>
> A case when this would be useful is the Qualcomm modem, which relies on
> disk access through a "remote file system service" [1].
>
> Today we register the service (a few layers ontop of rpmsg/GLINK) then
> find the modem remoteproc and write "start" into the state sysfs file.
>
> When we get a signal for termination we write "stop" into state to stop
> the remoteproc before exiting.
>
> There is however no way for us to indicate to the modem that rmtfs just
> died, e.g. a kill -9 on the process will result in the modem continue
> and the next IO request will fail which in most cases will be fatal.

The modem will crash when attempting an IO while rmtfs is down?

>
> So instead having rmtfs holding /dev/rproc_foo open would upon its
> termination cause the modem to be stopped automatically, and as the
> system respawns rmtfs the modem would be started anew and the two sides
> would be synced up again.

I have a better idea of what is going on now - thanks for writing this up.

I would make this feature a kernel configurable option as some people
may not want it.  I also think having "/dev/remoteprocX" is fine, so
no need to change anything currently visible in sysfs.

Mathieu

>
> [1] https://github.com/andersson/rmtfs
>
> Regards,
> Bjorn
