Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3900D1EEBA1
	for <lists+linux-remoteproc@lfdr.de>; Thu,  4 Jun 2020 22:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729797AbgFDUO2 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 4 Jun 2020 16:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgFDUO1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 Jun 2020 16:14:27 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986E4C08C5C1
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 Jun 2020 13:14:26 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id c8so7820548iob.6
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Jun 2020 13:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5HO1KadHQxAeQ0pdYimAI7SbHAerNIlMrtFNOEgWzHI=;
        b=Fn4H2lT+IhQRYzzGZAcvghWW6OUvc3bhjZgdYt094JAHrqhnjv0m2CSUvj8eI/sVlO
         KZ9CakMvmlTRuV/GVhN2mkUpHe9RJzm5+wG7aoHkW8nF9cvFNBOttMG0AuLm4EL/NhEC
         dVVh6wX4NRAIk9ix3uE4aBT8L13K2ROITJhN2R1JEZHSHo4YQYZHmzoj7+U5CvY3WXxv
         AS22TCW3dtJ9YF3aqK68aDGfflsW8GyiG2C+ZTwaIc+nEMvxwb2qV5cW960jezgNUWVd
         wHF1rWglrKgBYrOHCo24niy2jAJBgdJ0ABCM9Z4hsr94g2tQGugEU16ErCkXIEY8Szb7
         zd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5HO1KadHQxAeQ0pdYimAI7SbHAerNIlMrtFNOEgWzHI=;
        b=Azley5cihGa1lbwm/LK5s/JeOhsQrNR3l7Y/VSedEuJFjm0W9DljjtOuLq/VxMzL6N
         YarWOHrxvATGW5ZQQt6xvIxKQY6gxTGULKdxEX0CiV+VwTzZt9Z5RIc+YAnzUf1gi0+P
         F4lswdiknP8CkBU9HMHLVCKHTBemH6JWXGXxU5MvdPIbwBx+3hqNRabimZhYeFzRLUCw
         sAZSE0uP9itcFIP3HYVqjTh2U5Exs4NXLnapm6QdgU3GQ6WNCRQxl8hzqoPwavXA8gLK
         +wg7LHHxMYfVq86tvY1mUIMbNcMlOywKnWe4+zjPpyUzqrQjAvuxFX6/ORy7E+nsJd3P
         bFaw==
X-Gm-Message-State: AOAM531QxMFEYEHfHDYr8uAWMXWuDd3Kc7mkuPy8BchVeBK888C2rOCh
        IDSLJWDCpLNJWZ8zdZlyN8TgG5sAL5QNLzen3WCbdw==
X-Google-Smtp-Source: ABdhPJwr50SD7ysoMq2A7NJUKVgw8YJk/O137on5r/MnbqP4dgd9MHAc3wyA1XJG/GwOmhL/6FoCzshubovpNbLF7f0=
X-Received: by 2002:a6b:b489:: with SMTP id d131mr5608471iof.73.1591301665843;
 Thu, 04 Jun 2020 13:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
 <20200601175139.22097-10-mathieu.poirier@linaro.org> <1ddccc88-cde8-91ca-ee17-5fa5955ca80b@st.com>
In-Reply-To: <1ddccc88-cde8-91ca-ee17-5fa5955ca80b@st.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 4 Jun 2020 14:14:14 -0600
Message-ID: <CANLsYkw8SBbOF2=fUt=dBzkY4U5vy8q0cWnAjO_mZEFUsyxZsQ@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] remoteproc: Properly handle firmware name when attaching
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Loic PALLARDY <loic.pallardy@st.com>,
        "s-anna@ti.com" <s-anna@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good afternoon,

On Thu, 4 Jun 2020 at 08:17, Arnaud POULIQUEN <arnaud.pouliquen@st.com> wrote:
>
> Hi Mathieu,
>
> On 6/1/20 7:51 PM, Mathieu Poirier wrote:
> > This patch prevents the firmware image name from being displayed when
> > the remoteproc core is attaching to a remote processor. This is needed
> > needed since there is no guarantee about the nature of the firmware
> > image that is loaded by the external entity.
> >
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_core.c  | 18 ++++++++++++++++++
> >  drivers/remoteproc/remoteproc_sysfs.c | 16 ++++++++++++++--
> >  include/linux/remoteproc.h            |  2 ++
> >  3 files changed, 34 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 0e23284fbd25..a8adc712e7f6 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1642,6 +1642,14 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
> >
> >       rproc->state = RPROC_OFFLINE;
> >
> > +     /*
> > +      * The remote processor has been stopped and is now offline, which means
> > +      * that the next time it is brought back online the remoteproc core will
> > +      * be responsible to load its firmware.  As such it is no longer
> > +      * autonomous.
> > +      */
> > +     rproc->autonomous = false;
> > +
> >       dev_info(dev, "stopped remote processor %s\n", rproc->name);
> >
> >       return 0;
> > @@ -2166,6 +2174,16 @@ int rproc_add(struct rproc *rproc)
> >       /* create debugfs entries */
> >       rproc_create_debug_dir(rproc);
> >
> > +     /*
> > +      * Remind ourselves the remote processor has been attached to rather
> > +      * than booted by the remoteproc core.  This is important because the
> > +      * RPROC_DETACHED state will be lost as soon as the remote processor
> > +      * has been attached to.  Used in firmware_show() and reset in
> > +      * rproc_stop().
> > +      */
> > +     if (rproc->state == RPROC_DETACHED)
> > +             rproc->autonomous = true;
> > +
> >       /* if rproc is marked always-on, request it to boot */
> >       if (rproc->auto_boot) {
> >               ret = rproc_trigger_auto_boot(rproc);
> > diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> > index 8b462c501465..4ee158431f67 100644
> > --- a/drivers/remoteproc/remoteproc_sysfs.c
> > +++ b/drivers/remoteproc/remoteproc_sysfs.c
> > @@ -14,8 +14,20 @@ static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
> >                         char *buf)
> >  {
> >       struct rproc *rproc = to_rproc(dev);
> > -
> > -     return sprintf(buf, "%s\n", rproc->firmware);
> > +     const char *firmware = rproc->firmware;
> > +
> > +     /*
> > +      * If the remote processor has been started by an external
> > +      * entity we have no idea of what image it is running.  As such
> > +      * simply display a generic string rather then rproc->firmware.
> > +      *
> > +      * Here we rely on the autonomous flag because a remote processor
> > +      * may have been attached to and currently in a running state.
> > +      */
> > +     if (rproc->autonomous)
> > +             firmware = "unknown";
> > +
> > +     return sprintf(buf, "%s\n", firmware);
> >  }
> >
> >  /* Change firmware name via sysfs */
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index bf6a310ba870..cf5e31556780 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -491,6 +491,7 @@ struct rproc_dump_segment {
> >   * @table_sz: size of @cached_table
> >   * @has_iommu: flag to indicate if remote processor is behind an MMU
> >   * @auto_boot: flag to indicate if remote processor should be auto-started
> > + * @autonomous: true if an external entity has booted the remote processor
> >   * @dump_segments: list of segments in the firmware
> >   * @nb_vdev: number of vdev currently handled by rproc
> >   */
> > @@ -524,6 +525,7 @@ struct rproc {
> >       size_t table_sz;
> >       bool has_iommu;
> >       bool auto_boot;
> > +     bool autonomous;
>
> Do you need to define a new field? what about using rproc->firmware value?
>
> In this case the platform driver could provide a name using rproc_alloc
> even if in attached mode, for instance to identify a firmware version...

The problem is often that what gets loaded by the external entity is
not the same as the firmware available to the kernel.  As such
displaying the firmware name provided by the platform driver may not
be accurate when attaching to a remote processor.  Moreover I had to
introduce a new flag because the RPROC_ATTACHED state disappears as
soon as the remoteproc core attaches to the remote processor.  When
attached the state is set to RPROC_RUNNING, but there is still no
telling as to what firmware is running on the remote processor.

Thanks,
Mathieu

>
> Regards,
> Arnaud
>
>
>
> >       struct list_head dump_segments;
> >       int nb_vdev;
> >       u8 elf_class;
> >
