Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8B112842D
	for <lists+linux-remoteproc@lfdr.de>; Fri, 20 Dec 2019 22:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727552AbfLTV6l (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 20 Dec 2019 16:58:41 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:43032 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727478AbfLTV6l (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Dec 2019 16:58:41 -0500
Received: by mail-io1-f65.google.com with SMTP id n21so9300529ioo.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Dec 2019 13:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7PXQBvrzSLxc+5VyMgi1owDuEqXO7VWp2E3aglYelLQ=;
        b=e4wbdYQOkBBhsXCShznTGrWs0cqtmdxIl1Lcx1vOBwJ+EToVUL0NsEHYwXh0ZD6VJe
         lawaNLkgbEPWSDtZkyiMtyCstYl/6H4LQqh6sivwvW0H0ighkoaL7DJ9qp/1fx7+h+u6
         7Ta4nIEqf9jr7BJT1H9ktE3mRGT2Mfu+Al91ZOSskDuIvOQ2DCN+XQ0vo7iS7mxRA1+J
         MgthHTjDZwOrKDpTXbGPTYwYm2DKMe1ra84UFNExaMmUzA8D1e1K/jnxyBH3x+lZvVfR
         DkfP0vQAaTSCtTKrM7kzPG7FRS/vXIXWZ80Jv9FMpEok1XsvgoXpTeWCkLKsK3w9j3Te
         /t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7PXQBvrzSLxc+5VyMgi1owDuEqXO7VWp2E3aglYelLQ=;
        b=qoy6Plxr2ITX2y/4m6JuDEpJVimybhWbfof9phxotbodzwpUF84UfHyaeNTJVvUOWZ
         ZY+BXllBKoxWbeMfEJNISTfzXzpv2SzPmVf7uJbgWeAHGkkMmoPLvWTzpmLztpbwwFZJ
         wmFphGf11BQiC08dOW1nEc+z4pnvsFdzEsAQAcQLqPAC/j3WNuS4lc7BN7sOZ2yafGpT
         Mg1mFMBp4Co63QQrxa+MDyqyovzIDR5Io0PKiAZs5bimsmaSPyZ/0b1Urq8FxG21aQLB
         z0AcW2aIQLECJyqRxr6NmVJoBSj1UhM2fD43sMwKNBFAqtbNpOWfSMalLRoukTDyOjTy
         f/gA==
X-Gm-Message-State: APjAAAWrDIH93DYVoNkm/5/NJTy1a0KbUgQPJgs7AfhyQ1c9lwGXbFUh
        MRrZquBUO+MRqcH4zI39AuOHvzGSBL5CtxDM7Znwjfrh
X-Google-Smtp-Source: APXvYqz1RIVfkqzc7yLJ9u6qyAcQTYKBgvgHbYpyA7NiatX1GlRia5s6kQP534z1k7YrerHuKya4HC+UhvvBAcb+9ds=
X-Received: by 2002:a6b:8f41:: with SMTP id r62mr11443810iod.140.1576879119919;
 Fri, 20 Dec 2019 13:58:39 -0800 (PST)
MIME-Version: 1.0
References: <20191213125537.11509-1-t-kristo@ti.com> <20191213125537.11509-13-t-kristo@ti.com>
 <20191219214603.GA32574@xps15> <abaa5783-047c-e407-8b34-569f3becd7a0@ti.com>
In-Reply-To: <abaa5783-047c-e407-8b34-569f3becd7a0@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 20 Dec 2019 14:58:28 -0700
Message-ID: <CANLsYkz3h+1OeT88sxgqG4o3BYR3_mB+0vZFYCuL+HWQnCrSGg@mail.gmail.com>
Subject: Re: [PATCHv3 12/15] remoteproc/omap: add support for system suspend/resume
To:     Suman Anna <s-anna@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 19 Dec 2019 at 20:11, Suman Anna <s-anna@ti.com> wrote:
>
> Hi Mathieu, Tero,
>
> On 12/19/19 3:46 PM, Mathieu Poirier wrote:
> > On Fri, Dec 13, 2019 at 02:55:34PM +0200, Tero Kristo wrote:
> >> From: Suman Anna <s-anna@ti.com>
> >>
> >> This patch adds the support for system suspend/resume to the
> >> OMAP remoteproc driver so that the OMAP remoteproc devices can
> >> be suspended/resumed during a system suspend/resume. The support
> >> is added through the driver PM .suspend/.resume callbacks, and
> >> requires appropriate support from the OS running on the remote
> >> processors.
> >>
> >> The IPU & DSP remote processors typically have their own private
> >> modules like registers, internal memories, caches etc. The context
> >> of these modules need to be saved and restored properly for a
> >> suspend/resume to work. These are in general not accessible from
> >> the MPU, so the remote processors themselves have to implement
> >> the logic for the context save & restore of these modules.
> >>
> >> The OMAP remoteproc driver initiates a suspend by sending a mailbox
> >> message requesting the remote processor to save its context and
> >> enter into an idle/standby state. The remote processor should
> >> usually stop whatever processing it is doing to switch to a context
> >> save mode. The OMAP remoteproc driver detects the completion of
> >> the context save by checking the module standby status for the
> >> remoteproc device. It also stops any resources used by the remote
> >> processors like the timers. The timers need to be running only
> >> when the processor is active and executing, and need to be stopped
> >> otherwise to allow the timer driver to reach low-power states. The
> >> IOMMUs are automatically suspended by the PM core during the late
> >> suspend stage, after the remoteproc suspend process is completed by
> >> putting the remote processor cores into reset. Thereafter, the Linux
> >> kernel can put the domain into further lower power states as possible.
> >>
> >> The resume sequence undoes the operations performed in the PM suspend
> >> callback, by starting the timers and finally releasing the processors
> >> from reset. This requires that the remote processor side OS be able to
> >> distinguish a power-resume boot from a power-on/cold boot, restore the
> >> context of its private modules saved during the suspend phase, and
> >> resume executing code from where it was suspended. The IOMMUs would
> >> have been resumed by the PM core during early resume, so they are
> >> already enabled by the time remoteproc resume callback gets invoked.
> >>
> >> The remote processors should save their context into System RAM (DDR),
> >> as any internal memories are not guaranteed to retain context as it
> >> depends on the lowest power domain that the remote processor device
> >> is put into. The management of the DDR contents will be managed by
> >> the Linux kernel.
> >>
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> [t-kristo@ti.com: converted to use ti-sysc instead of hwmod]
> >> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> >> ---
> >>  drivers/remoteproc/omap_remoteproc.c | 179 +++++++++++++++++++++++++++
> >>  drivers/remoteproc/omap_remoteproc.h |  18 ++-
> >>  2 files changed, 195 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> >> index 9c750c2ab29d..0a9b9f7d20da 100644
> >> --- a/drivers/remoteproc/omap_remoteproc.c
> >> +++ b/drivers/remoteproc/omap_remoteproc.c
> >> @@ -16,6 +16,7 @@
> >>  #include <linux/kernel.h>
> >>  #include <linux/module.h>
> >>  #include <linux/err.h>
> >> +#include <linux/io.h>
> >>  #include <linux/of_device.h>
> >>  #include <linux/of_reserved_mem.h>
> >>  #include <linux/platform_device.h>
> >> @@ -23,10 +24,13 @@
> >>  #include <linux/remoteproc.h>
> >>  #include <linux/mailbox_client.h>
> >>  #include <linux/omap-mailbox.h>
> >> +#include <linux/omap-iommu.h>
> >
> > Please move this up by one line.
> >
> >>  #include <linux/regmap.h>
> >>  #include <linux/mfd/syscon.h>
> >>  #include <linux/reset.h>
> >>  #include <clocksource/timer-ti-dm.h>
> >> +#include <linux/clk.h>
> >> +#include <linux/clk/ti.h>
> >
> > Unless there is a dependency with timer-ti-dm.h, these should go just above linux/err.h
>
> No depencencies, can be reordered.
>
> >
> >>
> >>  #include <linux/platform_data/dmtimer-omap.h>
> >>
> >> @@ -81,6 +85,9 @@ struct omap_rproc_timer {
> >>   * @timers: timer(s) info used by rproc
> >>   * @rproc: rproc handle
> >>   * @reset: reset handle
> >> + * @pm_comp: completion primitive to sync for suspend response
> >> + * @fck: functional clock for the remoteproc
> >> + * @suspend_acked: state machine flag to store the suspend request ack
> >>   */
> >>  struct omap_rproc {
> >>      struct mbox_chan *mbox;
> >> @@ -92,6 +99,9 @@ struct omap_rproc {
> >>      struct omap_rproc_timer *timers;
> >>      struct rproc *rproc;
> >>      struct reset_control *reset;
> >> +    struct completion pm_comp;
> >> +    struct clk *fck;
> >> +    bool suspend_acked;
> >>  };
> >>
> >>  /**
> >> @@ -349,6 +359,11 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
> >>      case RP_MBOX_ECHO_REPLY:
> >>              dev_info(dev, "received echo reply from %s\n", name);
> >>              break;
> >> +    case RP_MBOX_SUSPEND_ACK:
> >
> > We can't get away with implicit fallthroughs anymore - please add /* Fall through */"
> >
> >> +    case RP_MBOX_SUSPEND_CANCEL:
> >> +            oproc->suspend_acked = msg == RP_MBOX_SUSPEND_ACK;
> >> +            complete(&oproc->pm_comp);
> >> +            break;
> >>      default:
> >>              if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
> >>                      return;
> >> @@ -529,6 +544,157 @@ static const struct rproc_ops omap_rproc_ops = {
> >>      .da_to_va       = omap_rproc_da_to_va,
> >>  };
> >>
> >> +#ifdef CONFIG_PM
> >> +static bool _is_rproc_in_standby(struct omap_rproc *oproc)
> >> +{
> >> +    return ti_clk_is_in_standby(oproc->fck);
> >> +}
> >> +
> >> +/* 1 sec is long enough time to let the remoteproc side suspend the device */
> >> +#define DEF_SUSPEND_TIMEOUT 1000
> >> +static int _omap_rproc_suspend(struct rproc *rproc)
> >> +{
> >> +    struct device *dev = rproc->dev.parent;
> >> +    struct omap_rproc *oproc = rproc->priv;
> >> +    unsigned long to = msecs_to_jiffies(DEF_SUSPEND_TIMEOUT);
> >> +    unsigned long ta = jiffies + to;
> >> +    int ret;
> >> +
> >> +    reinit_completion(&oproc->pm_comp);
> >> +    oproc->suspend_acked = false;
> >> +    ret = mbox_send_message(oproc->mbox, (void *)RP_MBOX_SUSPEND_SYSTEM);
> >> +    if (ret < 0) {
> >> +            dev_err(dev, "PM mbox_send_message failed: %d\n", ret);
> >> +            return ret;
> >> +    }
> >> +
> >> +    ret = wait_for_completion_timeout(&oproc->pm_comp, to);
> >> +    if (!oproc->suspend_acked)
> >> +            return -EBUSY;
> >> +
> >> +    /*
> >> +     * The remoteproc side is returning the ACK message before saving the
> >> +     * context, because the context saving is performed within a SYS/BIOS
> >> +     * function, and it cannot have any inter-dependencies against the IPC
> >> +     * layer. Also, as the SYS/BIOS needs to preserve properly the processor
> >> +     * register set, sending this ACK or signalling the completion of the
> >> +     * context save through a shared memory variable can never be the
> >> +     * absolute last thing to be executed on the remoteproc side, and the
> >> +     * MPU cannot use the ACK message as a sync point to put the remoteproc
> >> +     * into reset. The only way to ensure that the remote processor has
> >> +     * completed saving the context is to check that the module has reached
> >> +     * STANDBY state (after saving the context, the SYS/BIOS executes the
> >> +     * appropriate target-specific WFI instruction causing the module to
> >> +     * enter STANDBY).
> >> +     */
> >> +    while (!_is_rproc_in_standby(oproc)) {
> >> +            if (time_after(jiffies, ta))
> >> +                    return -ETIME;
> >> +            schedule();
> >> +    }
> >> +
> >> +    reset_control_assert(oproc->reset);
> >> +
> >> +    ret = omap_rproc_disable_timers(rproc, false);
> >> +    if (ret) {
> >> +            dev_err(dev, "disabling timers during suspend failed %d\n",
> >> +                    ret);
> >> +            goto enable_device;
> >> +    }
> >> +
> >> +    return 0;
> >> +
> >> +enable_device:
> >> +    reset_control_deassert(oproc->reset);
> >> +    return ret;
> >> +}
> >> +
> >> +static int _omap_rproc_resume(struct rproc *rproc)
> >> +{
> >> +    struct device *dev = rproc->dev.parent;
> >> +    struct omap_rproc *oproc = rproc->priv;
> >> +    int ret;
> >> +
> >> +    /* boot address could be lost after suspend, so restore it */
> >> +    if (oproc->boot_data) {
> >> +            ret = omap_rproc_write_dsp_boot_addr(rproc);
> >> +            if (ret) {
> >> +                    dev_err(dev, "boot address restore failed %d\n", ret);
> >> +                    goto out;
> >> +            }
> >> +    }
> >> +
> >> +    ret = omap_rproc_enable_timers(rproc, false);
> >> +    if (ret) {
> >> +            dev_err(dev, "enabling timers during resume failed %d\n",
> >> +                    ret);
> >
> > The "ret);" fits on the live above.
> >
> >> +            goto out;
> >> +    }
> >> +
> >> +    reset_control_deassert(oproc->reset);
> >> +
> >> +out:
> >> +    return ret;
> >> +}
> >> +
> >> +static int __maybe_unused omap_rproc_suspend(struct device *dev)
> >
> > The "__maybe_unused" can be dropped because this is within the #ifdef CONFIG_PM
> > block.
>
> These are suspend/resume callbacks, so are actually controlled by
> CONFIG_PM_SLEEP which can be disabled independently from runtime
> suspend, and hence the annotation.
>
> >
> >> +{
> >> +    struct platform_device *pdev = to_platform_device(dev);
> >> +    struct rproc *rproc = platform_get_drvdata(pdev);
> >> +    int ret = 0;
> >> +
> >> +    mutex_lock(&rproc->lock);
> >> +    if (rproc->state == RPROC_OFFLINE)
> >> +            goto out;
> >> +
> >> +    if (rproc->state == RPROC_SUSPENDED)
> >> +            goto out;
> >> +
> >> +    if (rproc->state != RPROC_RUNNING) {
> >> +            ret = -EBUSY;
> >> +            goto out;
> >> +    }
> >> +
> >> +    ret = _omap_rproc_suspend(rproc);
> >> +    if (ret) {
> >> +            dev_err(dev, "suspend failed %d\n", ret);
> >> +            goto out;
> >> +    }
> >> +
> >> +    rproc->state = RPROC_SUSPENDED;
> >> +out:
> >> +    mutex_unlock(&rproc->lock);
> >> +    return ret;
> >> +}
> >> +
> >> +static int __maybe_unused omap_rproc_resume(struct device *dev)
> >
> > Same comment as above.
> >
> >> +{
> >> +    struct platform_device *pdev = to_platform_device(dev);
> >> +    struct rproc *rproc = platform_get_drvdata(pdev);
> >> +    int ret = 0;
> >> +
> >> +    mutex_lock(&rproc->lock);
> >> +    if (rproc->state == RPROC_OFFLINE)
> >> +            goto out;
> >> +
> >> +    if (rproc->state != RPROC_SUSPENDED) {
> >> +            ret = -EBUSY;
> >> +            goto out;
> >> +    }
> >> +
> >> +    ret = _omap_rproc_resume(rproc);
> >> +    if (ret) {
> >> +            dev_err(dev, "resume failed %d\n", ret);
> >> +            goto out;
> >> +    }
> >> +
> >> +    rproc->state = RPROC_RUNNING;
> >> +out:
> >> +    mutex_unlock(&rproc->lock);
> >> +    return ret;
> >> +}
> >> +#endif /* CONFIG_PM */
> >> +
> >>  static const char * const ipu_mem_names[] = {
> >>      "l2ram", NULL
> >>  };
> >> @@ -786,6 +952,14 @@ static int omap_rproc_probe(struct platform_device *pdev)
> >>                      oproc->num_timers);
> >>      }
> >>
> >> +    init_completion(&oproc->pm_comp);
> >> +
> >> +    oproc->fck = devm_clk_get(&pdev->dev, 0);
> >> +    if (IS_ERR(oproc->fck)) {
> >> +            ret = PTR_ERR(oproc->fck);
> >> +            goto free_rproc;
> >> +    }
> >> +
> >
> > oproc->fck is not released if an error occurs in of_reserved_mem_device_init()
> > and rproc_add().
>
> We are using a devres managed API, so why do we need to release it
> specifically?

Disregard this comment - I looked at the implementation again and you are right.

>
> >
> >>      ret = of_reserved_mem_device_init(&pdev->dev);
> >>      if (ret) {
> >>              dev_err(&pdev->dev, "device does not have specific CMA pool\n");
> >> @@ -818,11 +992,16 @@ static int omap_rproc_remove(struct platform_device *pdev)
> >>      return 0;
> >>  }
> >>
> >> +static const struct dev_pm_ops omap_rproc_pm_ops = {
> >> +    SET_SYSTEM_SLEEP_PM_OPS(omap_rproc_suspend, omap_rproc_resume)
> >> +};
> >> +
> >>  static struct platform_driver omap_rproc_driver = {
> >>      .probe = omap_rproc_probe,
> >>      .remove = omap_rproc_remove,
> >>      .driver = {
> >>              .name = "omap-rproc",
> >> +            .pm = &omap_rproc_pm_ops,
> >>              .of_match_table = omap_rproc_of_match,
> >>      },
> >>  };
> >> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
> >> index 72f656c93caa..c73383e707c7 100644
> >> --- a/drivers/remoteproc/omap_remoteproc.h
> >> +++ b/drivers/remoteproc/omap_remoteproc.h
> >> @@ -1,7 +1,7 @@
> >>  /*
> >>   * Remote processor messaging
> >>   *
> >> - * Copyright (C) 2011 Texas Instruments, Inc.
> >> + * Copyright (C) 2011-2018 Texas Instruments, Inc.
>
> %s/2018/2019/
>
> regards
> Suman
>
> >>   * Copyright (C) 2011 Google, Inc.
> >>   * All rights reserved.
> >>   *
> >> @@ -57,6 +57,16 @@
> >>   * @RP_MBOX_ABORT_REQUEST: a "please crash" request, used for testing the
> >>   * recovery mechanism (to some extent).
> >>   *
> >> + * @RP_MBOX_SUSPEND_AUTO: auto suspend request for the remote processor
> >> + *
> >> + * @RP_MBOX_SUSPEND_SYSTEM: system suspend request for the remote processor
> >> + *
> >> + * @RP_MBOX_SUSPEND_ACK: successful response from remote processor for a
> >> + * suspend request
> >> + *
> >> + * @RP_MBOX_SUSPEND_CANCEL: a cancel suspend response from a remote processor
> >> + * on a suspend request
> >> + *
> >>   * Introduce new message definitions if any here.
> >>   *
> >>   * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
> >> @@ -70,7 +80,11 @@ enum omap_rp_mbox_messages {
> >>      RP_MBOX_ECHO_REQUEST    = 0xFFFFFF03,
> >>      RP_MBOX_ECHO_REPLY      = 0xFFFFFF04,
> >>      RP_MBOX_ABORT_REQUEST   = 0xFFFFFF05,
> >> -    RP_MBOX_END_MSG         = 0xFFFFFF06,
> >> +    RP_MBOX_SUSPEND_AUTO    = 0xFFFFFF10,
> >> +    RP_MBOX_SUSPEND_SYSTEM  = 0xFFFFFF11,
> >> +    RP_MBOX_SUSPEND_ACK     = 0xFFFFFF12,
> >> +    RP_MBOX_SUSPEND_CANCEL  = 0xFFFFFF13,
> >> +    RP_MBOX_END_MSG         = 0xFFFFFF14,
> >>  };
> >>
> >>  #endif /* _OMAP_RPMSG_H */
> >> --
> >> 2.17.1
> >>
> >> --
> >> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>
