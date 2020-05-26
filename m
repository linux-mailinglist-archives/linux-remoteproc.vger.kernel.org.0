Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B3B1BCD10
	for <lists+linux-remoteproc@lfdr.de>; Tue, 28 Apr 2020 22:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgD1UJm (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 28 Apr 2020 16:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726333AbgD1UJ0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 28 Apr 2020 16:09:26 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F2BC03C1AD
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Apr 2020 13:09:24 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id o127so24709471iof.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Apr 2020 13:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6b8JEdc86QQaLWgUONgVk5QnyKn0OwJfe4nUlQTwps0=;
        b=d3LktalotbLI0rJhUPptVS5m6TeC3T7IVM9AmAJQcKzSqXkCYx4sHzfZBRXBWNrhJ9
         nChBqVreBXCMxoNCEjAdTXCR1vRzfCytEZUtf13z9oltklrIDGVULrwgUMUto7+0T9eP
         0tAKMU6ESdpJJtGA7/8moPsY9glywvT/o6LZIGOKLkAUj+DSnUNkiSLG/haa3Vu9JQSt
         XZT9vMf6gbkocCwqFSitNVkd2Xqvyt4YOII+8CJDtXjmcZbbo2a9JtwVOsVq9az4EJs+
         jOBj56RrVFe/Zh/Ev3wvJuYasVOlY0KYDQx3OsfEiC5t6GDwauOkY9EpJBKZdEGwt0Gx
         EYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6b8JEdc86QQaLWgUONgVk5QnyKn0OwJfe4nUlQTwps0=;
        b=jrkn4X1qjFbj7y/gc8FSmR4W3QZS6V8UMCAN2B5y/6k5hPdN0kUifewtt1ZiunrmtQ
         oAczrhQ4TLTOynQF7B7wvB9L80MTwfS9s6C+M9r2x1/+HefdFzeJDZ3x85PR41OFa/HW
         3IBf2ZsJgFnPLfpP1CrF34KmSH51mTBF3eNhHOu3uTwhLrfOWKg7axUABQBvauVBYcAZ
         EwZVDz62DBFpnGI6Soq0Qk5hpCXvzt4y0FeyCp1HZSJUnaYWyi5ag2KsPfVaFQi2irh3
         le0xsBhzbDakyQj6F5njndok2kujvmDIGJnm0WUOHjC/i/iqSHlUZUHUhvn+P9Pke9x1
         9C1g==
X-Gm-Message-State: AGi0PubX4whT5HWsm3mMCYl0T2A0nyD2SxFFBw0T83zSfAmZbFIZ+qZt
        0UMqDtSYajwx3ZRkJBglGnhIrrH9JYdRm6tS2vuKOA==
X-Google-Smtp-Source: APiQypIQBpPQQkAuehJj3ca3UUx0zUIWzRrOwv/RHaXCYe3333MWUVd7I0T7xj4J5l8onxqQ42VCv8lSggS7jkyeOw8=
X-Received: by 2002:a02:b88e:: with SMTP id p14mr25945179jam.36.1588104563944;
 Tue, 28 Apr 2020 13:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200325201839.15896-1-s-anna@ti.com> <20200325201839.15896-4-s-anna@ti.com>
 <20200428195855.GC10552@xps15>
In-Reply-To: <20200428195855.GC10552@xps15>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 28 Apr 2020 14:09:13 -0600
Message-ID: <CANLsYkwgCJrDu-Y5iyG0maCVqFqDXW_0vD4Sv2e+-dwryTNaRA@mail.gmail.com>
Subject: Re: [PATCH 3/3] remoteproc/k3-dsp: Add support for L2RAM loading on
 C66x DSPs
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 28 Apr 2020 at 13:58, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Mar 25, 2020 at 03:18:39PM -0500, Suman Anna wrote:
> > The resets for the DSP processors on K3 SoCs are managed through the
> > Power and Sleep Controller (PSC) module. Each DSP typically has two
> > resets - a global module reset for powering on the device, and a local
> > reset that affects only the CPU while allowing access to the other
> > sub-modules within the DSP processor sub-systems.
> >
> > The C66x DSPs have two levels of internal RAMs that can be used to
> > boot from, and the firmware loading into these RAMs require the
> > local reset to be asserted with the device powered on/enabled using
> > the module reset. Enhance the K3 DSP remoteproc driver to add support
> > for loading into the internal RAMs. The local reset is deasserted on
> > SoC power-on-reset, so logic has to be added in probe in remoteproc
> > mode to balance the remoteproc state-machine.
> >
> > Note that the local resets are a no-op on C71x cores, and the hardware
> > does not supporting loading into its internal RAMs.
> >
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > ---
> >  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 82 +++++++++++++++++++++++
> >  1 file changed, 82 insertions(+)
> >
> > diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > index fd0d84f46f90..7b712ef74611 100644
> > --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > @@ -175,6 +175,9 @@ static int k3_dsp_rproc_reset(struct k3_dsp_rproc *kproc)
> >               return ret;
> >       }
> >
> > +     if (kproc->data->uses_lreset)
> > +             return ret;
> > +
> >       ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> >                                                   kproc->ti_sci_id);
> >       if (ret) {
> > @@ -192,6 +195,9 @@ static int k3_dsp_rproc_release(struct k3_dsp_rproc *kproc)
> >       struct device *dev = kproc->dev;
> >       int ret;
> >
> > +     if (kproc->data->uses_lreset)
> > +             goto lreset;
> > +
> >       ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
> >                                                  kproc->ti_sci_id);
> >       if (ret) {
> > @@ -199,6 +205,7 @@ static int k3_dsp_rproc_release(struct k3_dsp_rproc *kproc)
> >               return ret;
> >       }
> >
> > +lreset:
> >       ret = reset_control_deassert(kproc->reset);
> >       if (ret) {
> >               dev_err(dev, "local-reset deassert failed, ret = %d\n", ret);
> > @@ -210,6 +217,63 @@ static int k3_dsp_rproc_release(struct k3_dsp_rproc *kproc)
> >       return ret;
> >  }
> >
> > +/*
> > + * The C66x DSP cores have a local reset that affects only the CPU, and a
> > + * generic module reset that powers on the device and allows the DSP internal
> > + * memories to be accessed while the local reset is asserted. This function is
> > + * used to release the global reset on C66x DSPs to allow loading into the DSP
> > + * internal RAMs. The .prepare() ops is invoked by remoteproc core before any
> > + * firmware loading, and is followed by the .start() ops after loading to
> > + * actually let the C66x DSP cores run. The local reset on C71x cores is a
> > + * no-op and the global reset cannot be released on C71x cores until after
> > + * the firmware images are loaded, so this function does nothing for C71x cores.
> > + */
> > +static int k3_dsp_rproc_prepare(struct rproc *rproc)
> > +{
> > +     struct k3_dsp_rproc *kproc = rproc->priv;
> > +     struct device *dev = kproc->dev;
> > +     int ret;
> > +
> > +     /* local reset is no-op on C71x processors */
> > +     if (!kproc->data->uses_lreset)
> > +             return 0;
>
> In k3_dsp_rproc_release() the condition is "if (kproc->data->uses_lreset)" and
> here it is the opposite, which did a good job at getting me confused.
>
> Taking a step back, I assume c71 DSPs will have their own k3_dsp_dev_data where
> the users_lreset flag will be false.  In that case I think it would make the
> code easier to understand if the k3_dsp_rproc_ops was declared without the
> .prepare and .unprepare.  In probe(), if data->uses_lreset is true then
> k3_dsp_rproc_prepare() and k3_dsp_rproc_unprepare() are set.
>

I forgot... Since this is a C71 related change, was there a reason to
lump it with the C66 set?  If not I would simply move that to the C71
work.

> I am done reviewing this set.
>
> Thanks,
> Mathieu
>
> > +
> > +     ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
> > +                                                 kproc->ti_sci_id);
> > +     if (ret)
> > +             dev_err(dev, "module-reset deassert failed, cannot enable internal RAM loading, ret = %d\n",
> > +                     ret);
> > +
> > +     return ret;
> > +}
> > +
> > +/*
> > + * This function implements the .unprepare() ops and performs the complimentary
> > + * operations to that of the .prepare() ops. The function is used to assert the
> > + * global reset on applicable C66x cores. This completes the second portion of
> > + * powering down the C66x DSP cores. The cores themselves are only halted in the
> > + * .stop() callback through the local reset, and the .unprepare() ops is invoked
> > + * by the remoteproc core after the remoteproc is stopped to balance the global
> > + * reset.
> > + */
> > +static int k3_dsp_rproc_unprepare(struct rproc *rproc)
> > +{
> > +     struct k3_dsp_rproc *kproc = rproc->priv;
> > +     struct device *dev = kproc->dev;
> > +     int ret;
> > +
> > +     /* local reset is no-op on C71x processors */
> > +     if (!kproc->data->uses_lreset)
> > +             return 0;
> > +
> > +     ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> > +                                                 kproc->ti_sci_id);
> > +     if (ret)
> > +             dev_err(dev, "module-reset assert failed, ret = %d\n", ret);
> > +
> > +     return ret;
> > +}
> > +
> >  /*
> >   * Power up the DSP remote processor.
> >   *
> > @@ -353,6 +417,8 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
> >  }
> >
> >  static const struct rproc_ops k3_dsp_rproc_ops = {
> > +     .prepare        = k3_dsp_rproc_prepare,
> > +     .unprepare      = k3_dsp_rproc_unprepare,
> >       .start          = k3_dsp_rproc_start,
> >       .stop           = k3_dsp_rproc_stop,
> >       .kick           = k3_dsp_rproc_kick,
> > @@ -644,6 +710,22 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
> >               goto disable_clk;
> >       }
> >
> > +     /*
> > +      * ensure the DSP local reset is asserted to ensure the DSP doesn't
> > +      * execute bogus code in .prepare() when the module reset is released.
> > +      */
> > +     if (data->uses_lreset) {
> > +             ret = reset_control_status(kproc->reset);
> > +             if (ret < 0) {
> > +                     dev_err(dev, "failed to get reset status, status = %d\n",
> > +                             ret);
> > +                     goto release_mem;
> > +             } else if (ret == 0) {
> > +                     dev_warn(dev, "local reset is deasserted for device\n");
> > +                     k3_dsp_rproc_reset(kproc);
> > +             }
> > +     }
> > +
> >       ret = rproc_add(rproc);
> >       if (ret) {
> >               dev_err(dev, "failed to add register device with remoteproc core, status = %d\n",
> > --
> > 2.23.0
> >
