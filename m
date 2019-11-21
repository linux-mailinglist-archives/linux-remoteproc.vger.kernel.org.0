Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23ABA105D2E
	for <lists+linux-remoteproc@lfdr.de>; Fri, 22 Nov 2019 00:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbfKUXfj (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 21 Nov 2019 18:35:39 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:33560 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfKUXfj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 21 Nov 2019 18:35:39 -0500
Received: by mail-io1-f66.google.com with SMTP id j13so5676204ioe.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 Nov 2019 15:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YfXp9dAFCifzAsNDD+8s62kZcQPezX4O5FWQHhpqQtE=;
        b=BqN1hGJOCwvFGC6W/9HWEYdcWCfDd1qwQwKBdMQBmKuFbU6Mn35LZViqmjfsTCXCI3
         8ONhiGZU8Og6Dt2gUnGCScg91+SYW1IpzMCiLUxXDUTu615UkmlZ0d1FJoJdcr0gQRXl
         MIGvaI3SgxBF/TFMqv3LPNxvfBdlb1lM8Lc+OQDzSbymySrpTug0MiSJbC/KOtRWNHs6
         R8KPqNRrHK89q+JI56tJ86sZcfFESOXT0dBg6y8Og5jwH+9FjHg9Fzhf3nDWNAf0OTU3
         gA9P9q6U3s3TgA4eWOAiMqo/tk11fn6JNPEq9jbR+zToyCyyQ5ks5p882ARV0Mbs6JIO
         DDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YfXp9dAFCifzAsNDD+8s62kZcQPezX4O5FWQHhpqQtE=;
        b=h4KBAFtcXtXKFlgBQgiENNrRwNNuiys4ouJcmfWUqUJycji4ZNKJBZgnCWruK3WYs9
         1HBT/J3LonQ+sS9BRw4fLwJ9sUTYqP47KoLx89VGogjCV95uGgFiUsQsy/0jCxADup2p
         8e/lyjNGX57G6jObx0KA6mTywO2QPZb0cCvqlSqyt2b5S83EfpxchpvcXtRXbIdoF1gh
         BzWLWmlTI81c12jz6WOncFHSlVGsbLDzCwhouZQtaB1FvEk3jHv/8CEZ8uvbG9NMcJM8
         6MBZrXZm1JIRUACOdjXiexiYrwUyXTx5tM8G06V7iSZMltdaBPbh3R+Vw3VqB4x87WO6
         gQmg==
X-Gm-Message-State: APjAAAV9j7JzP3/X5C214RriFXXDGY2UQc1Nc1IaakgmcFjjuUxSedTv
        zVJcyp0nEyhvUQimlL4veky5RQ==
X-Google-Smtp-Source: APXvYqxF+L8/HED9jgaPXbxv6bg7yqdfAl3w2owXnlhyeJu4jtszMWICARXD8OCyFjYEuzw15lOvlA==
X-Received: by 2002:a5d:9249:: with SMTP id e9mr10471141iol.132.1574379338031;
        Thu, 21 Nov 2019 15:35:38 -0800 (PST)
Received: from yoga (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id z4sm4486782pfn.80.2019.11.21.15.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 15:35:37 -0800 (PST)
Date:   Thu, 21 Nov 2019 15:35:35 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        Navid Emamdoost <emamd001@umn.edu>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rpmsg: char: release allocated memory
Message-ID: <20191121233535.GW18024@yoga>
References: <20190917033124.1077-1-navid.emamdoost@gmail.com>
 <CAEkB2EQTO3wtCrZgLv068xGpxJYwir_SuMUBK0jGaTU6KdCRNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEkB2EQTO3wtCrZgLv068xGpxJYwir_SuMUBK0jGaTU6KdCRNg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 21 Nov 10:20 PST 2019, Navid Emamdoost wrote:

> On Mon, Sep 16, 2019 at 10:31 PM Navid Emamdoost
> <navid.emamdoost@gmail.com> wrote:
> >
> > In rpmsg_eptdev_write_iter, if copy_from_iter_full fails the allocated
> > buffer needs to be released.
> >
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> 
> Would you please review this patch?
> 

I'm sorry, I must have missed to reply as I applied the patch. You can
find it in the rpmsg-next branch [1] and it will be part of the pull
request for v5.5

[1] https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/log/?h=rpmsg-next

Regards,
Bjorn

> Thank you,
> 
> > ---
> >  drivers/rpmsg/rpmsg_char.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> > index eea5ebbb5119..c655074c07c2 100644
> > --- a/drivers/rpmsg/rpmsg_char.c
> > +++ b/drivers/rpmsg/rpmsg_char.c
> > @@ -227,8 +227,10 @@ static ssize_t rpmsg_eptdev_write_iter(struct kiocb *iocb,
> >         if (!kbuf)
> >                 return -ENOMEM;
> >
> > -       if (!copy_from_iter_full(kbuf, len, from))
> > -               return -EFAULT;
> > +       if (!copy_from_iter_full(kbuf, len, from)) {
> > +               ret = -EFAULT;
> > +               goto free_kbuf;
> > +       }
> >
> >         if (mutex_lock_interruptible(&eptdev->ept_lock)) {
> >                 ret = -ERESTARTSYS;
> > --
> > 2.17.1
> >
> 
> 
> -- 
> Navid.
