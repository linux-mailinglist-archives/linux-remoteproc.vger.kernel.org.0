Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB8361948B7
	for <lists+linux-remoteproc@lfdr.de>; Thu, 26 Mar 2020 21:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgCZUWG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 26 Mar 2020 16:22:06 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41136 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727446AbgCZUWD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Mar 2020 16:22:03 -0400
Received: by mail-io1-f65.google.com with SMTP id y24so7494260ioa.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2020 13:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ve/X6nHv2D9AeZXHvnlLIPat8X+ApJ24OWPwiA11jpg=;
        b=eTMbaAy1ljXYsDh1ZmCCkUFh2WC7cuyf1r/HQ4XcoH5XIXxgjWcj8fiGwrpaPWQsPO
         Qg5ks7UOdihafX2mNEKfYyoH/uMfHXDwvOreiDYiBcm5inEw/6Ec4qFbUWHjRr3rg7ko
         2DmPAxoedazshDdluWxYv/5V+QV5qa8sawJiSm7NJFgQE+dkUGR9JhA0qETScS+sam7E
         eztiXVUs00b93SomNzbbtJpNS5qgR/dlsN6KLWpx2WOLQntljV/lR+36hJERuI7Ukcb+
         uN15b6H7s+Dun+rTOG3KuU/bgDNgh8GEKp/2/6ejdCCHhbKdeu7WGxxB0p8uqsOcv7Ko
         kX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ve/X6nHv2D9AeZXHvnlLIPat8X+ApJ24OWPwiA11jpg=;
        b=mmI3TB0AyqIuN9exv3fUAFN15r4wJKUSl89nN2laBc5ryIzVJDuKBYuX+AK39rw+bd
         AGREeLgv4cwSmSPW1OD0R9rUMTwXGKN+rY0D2Qc0yyPRCp7hXYnyMfreDCdEezcO0qCs
         Adn/Vpjb3N4HoosxxOlwH24ye2Ot0p0IIb5p0iyhwC0SPQmkVHuSxMPzXUnU3BkRVAhg
         96A6eBVCkoGEQkzQXwMqSYMNjtkyEfMrueLcj3vlMXj8+Rl58RVpO2sEeXrEdPxhqwQ5
         dzHXwlF/2uYj4MmNsVT/cHHM8mkFlrVqZw2JSIcZAzrMLONSNYomVZnBa4M67ycDcN8u
         /3Ng==
X-Gm-Message-State: ANhLgQ1XYcloiAiwnGpeKxlrJiPRkp8vVo7BM7XZHJwNwdamPI4B7DbM
        6yJ9kqqgobYlvWylxylFP2tJRliALH70G8mapc3+pg==
X-Google-Smtp-Source: ADFU+vvU1L1B/iLuaUUbHk/RIQMtqZfXXx5k6U+m5rd0ApTfjWWSSmZSzDVhnSmUXDvdtdOOPjhMvVfMlailtJw8LDo=
X-Received: by 2002:a6b:8ed7:: with SMTP id q206mr9378070iod.148.1585254122300;
 Thu, 26 Mar 2020 13:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200310155058.1607-1-mathieu.poirier@linaro.org> <591bd727-32af-9ea2-8c46-98f46ee3711e@ti.com>
In-Reply-To: <591bd727-32af-9ea2-8c46-98f46ee3711e@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 26 Mar 2020 14:21:51 -0600
Message-ID: <CANLsYkyv+4cSCY27kA6qfo2XMzXy_h+DmXTe0nVZuUkC0kyRUQ@mail.gmail.com>
Subject: Re: [PATCH v2] rpmsg: core: Add wildcard match for name service
To:     Suman Anna <s-anna@ti.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 26 Mar 2020 at 09:06, Suman Anna <s-anna@ti.com> wrote:
>
> Hi Mathieu,
>
> On 3/10/20 10:50 AM, Mathieu Poirier wrote:
> > Adding the capability to supplement the base definition published
> > by an rpmsg_driver with a postfix description so that it is possible
> > for several entity to use the same service.
> >
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>
> So, the concern I have here is that we are retrofitting this into the
> existing 32-byte name field, and the question is if it is going to be
> enough in general. That's the reason I went with the additional 32-byte
> field with the "rpmsg: add a description field" patch.
>

That's a valid concern.

Did you consider increasing the size of RPMSG_NAME_SIZE to 64? Have
you found cases where that wouldn't work?  I did a survey of all the
places the #define is used and all destination buffers are also using
the same #define in their definition.  It would also be backward
compatible with firmware implementations that use 32 byte.

Thanks,
Mathieu

> regards
> Suman
>
> > ---
> > Changes for V2:
> > - Added Arnaud's Acked-by.
> > - Rebased to latest rproc-next.
> >
> >  drivers/rpmsg/rpmsg_core.c | 20 +++++++++++++++++++-
> >  1 file changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> > index e330ec4dfc33..bfd25978fa35 100644
> > --- a/drivers/rpmsg/rpmsg_core.c
> > +++ b/drivers/rpmsg/rpmsg_core.c
> > @@ -399,7 +399,25 @@ ATTRIBUTE_GROUPS(rpmsg_dev);
> >  static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
> >                                 const struct rpmsg_device_id *id)
> >  {
> > -     return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
> > +     size_t len = min_t(size_t, strlen(id->name), RPMSG_NAME_SIZE);
> > +
> > +     /*
> > +      * Allow for wildcard matches.  For example if rpmsg_driver::id_table
> > +      * is:
> > +      *
> > +      * static struct rpmsg_device_id rpmsg_driver_sample_id_table[] = {
> > +      *      { .name = "rpmsg-client-sample" },
> > +      *      { },
> > +      * }
> > +      *
> > +      * Then it is possible to support "rpmsg-client-sample*", i.e:
> > +      *      rpmsg-client-sample
> > +      *      rpmsg-client-sample_instance0
> > +      *      rpmsg-client-sample_instance1
> > +      *      ...
> > +      *      rpmsg-client-sample_instanceX
> > +      */
> > +     return strncmp(id->name, rpdev->id.name, len) == 0;
> >  }
> >
> >  /* match rpmsg channel and rpmsg driver */
> >
>
