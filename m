Return-Path: <linux-remoteproc+bounces-67-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A33A8073EA
	for <lists+linux-remoteproc@lfdr.de>; Wed,  6 Dec 2023 16:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B75E0B20F65
	for <lists+linux-remoteproc@lfdr.de>; Wed,  6 Dec 2023 15:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C7F39FFF;
	Wed,  6 Dec 2023 15:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YAn8uT1D"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 410F7D51
	for <linux-remoteproc@vger.kernel.org>; Wed,  6 Dec 2023 07:43:20 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c19f5f822so4694495e9.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Dec 2023 07:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701877398; x=1702482198; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UJGyonhHsFyChsX+irR8DXM6QKTbuUrtWv63jWQxeQ8=;
        b=YAn8uT1DGg0RtDBaCp33eOxFVgJ1kYZ6Mzog5qFsKPAbEo6A3nhwRRXRj5dm92pKwg
         MbvXK6pi8NA6VDlQBRO6krrYBUEvzw2uur4pePGxZbeo39Rea70SjHAS1R/YVQGzbGdQ
         MYAXiEpy/keeVY0iac64vdcf1LgabynITzBkhAmsw1eLrZx1uOmpqigcJt02IHfBAqQE
         AcaKGZdJTCh90LcXLnJMPK/wQvmx43JAaaupVYjq0L3QXz68Kp7bJ0AvAA3LnLsH3K9v
         afverDqT31SrE2VAcUodUjJ3hTbdhiqGVKdjU6tknhL40VA5TWiH+SoJjepDW/xBmdRr
         TCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701877398; x=1702482198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJGyonhHsFyChsX+irR8DXM6QKTbuUrtWv63jWQxeQ8=;
        b=EgqSWQFDhkck66rgR/h5FgSd4Wk9q1HnXJqjlB8VIjN8t1FqChCU0SSI4E1MPBWkz6
         Gi0w31lDjNSyBphMcfhULd0kj6VwE7RIsCiP+bnCzMF59CLHC8pG7BCx7cM3jfC9Eq/J
         CQvh6P06D87WNGCpnM3Us0TOORHZfGytCRviG1SLsCnLWBF/zepQ437yQjo1Wu6foeAZ
         wUCo3Sb8ojnN0BQnqhaZNobxUiwKAUYGWKMPSaawE940CGI3PiEmQ5zdaouLIgwN5TK/
         Zg3+TsYwx6bKMleuxV1/MWMW0mjj+ahsQT/ZIZCtIGa0YZzxDyTCJfok7/TIOW6abgHd
         TGHg==
X-Gm-Message-State: AOJu0Yzgy0GUslxUS9PEDRDSju7MZ1S/AMISQVk/FGQSCVuFxYhXldIv
	+STGWaESGObab0W3qjx1TrhPJs/23GwNUfQOJ6pX7g==
X-Google-Smtp-Source: AGHT+IE4SI9/OQoa+ZBYYbIyxeo2wQ3xnFQ7WEn85A0EQuBLkwga9YcVLSgRSx3YL+vjplwrDE9jUyvIz9Ee8K/7tSQ=
X-Received: by 2002:a05:600c:4689:b0:40b:2a46:6f1 with SMTP id
 p9-20020a05600c468900b0040b2a4606f1mr1653806wmo.2.1701877398476; Wed, 06 Dec
 2023 07:43:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117174238.1876655-1-tanmay.shah@amd.com> <20231117174238.1876655-4-tanmay.shah@amd.com>
 <ZV02P3bHEhPLQHBo@p14s> <93487d3c-c324-4b9b-8b25-0b4ea52237b4@amd.com>
 <ZV+V6V2sEWgsqngk@p14s> <a75b22c1-66e3-4fce-ae64-de79e73f3cfa@amd.com>
 <ZWdwl/8LC2Nn+vCq@p14s> <ea2edc6e-6655-47f8-8b6d-242f5a0ef804@amd.com>
In-Reply-To: <ea2edc6e-6655-47f8-8b6d-242f5a0ef804@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 6 Dec 2023 08:43:07 -0700
Message-ID: <CANLsYkzJgZRSz5=nzW+ATmBKemoSd3ybhKuz1CJy33hftAGiqw@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] remoteproc: zynqmp: add pm domains support
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, michal.simek@amd.com, 
	ben.levinsky@amd.com, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Dec 2023 at 11:10, Tanmay Shah <tanmay.shah@amd.com> wrote:
>
>
> On 11/29/23 11:10 AM, Mathieu Poirier wrote:
> > On Mon, Nov 27, 2023 at 10:33:05AM -0600, Tanmay Shah wrote:
> > >
> > > On 11/23/23 12:11 PM, Mathieu Poirier wrote:
> > > > On Wed, Nov 22, 2023 at 03:00:36PM -0600, Tanmay Shah wrote:
> > > > > Hi Mathieu,
> > > > >
> > > > > Please find my comments below.
> > > > >
> > > > > On 11/21/23 4:59 PM, Mathieu Poirier wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On Fri, Nov 17, 2023 at 09:42:37AM -0800, Tanmay Shah wrote:
> > > > > > > Use TCM pm domains extracted from device-tree
> > > > > > > to power on/off TCM using general pm domain framework.
> > > > > > >
> > > > > > > Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> > > > > > > ---
> > > > > > >
> > > > > > > Changes in v7:
> > > > > > >   - %s/pm_dev1/pm_dev_core0/r
> > > > > > >   - %s/pm_dev_link1/pm_dev_core0_link/r
> > > > > > >   - %s/pm_dev2/pm_dev_core1/r
> > > > > > >   - %s/pm_dev_link2/pm_dev_core1_link/r
> > > > > > >   - remove pm_domain_id check to move next patch
> > > > > > >   - add comment about how 1st entry in pm domain list is used
> > > > > > >   - fix loop when jump to fail_add_pm_domains loop
> > > > > > >
> > > > > > >  drivers/remoteproc/xlnx_r5_remoteproc.c | 215 +++++++++++++++++++++++-
> > > > > > >  1 file changed, 212 insertions(+), 3 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> > > > > > > index 4395edea9a64..22bccc5075a0 100644
> > > > > > > --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> > > > > > > +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> > > > > > > @@ -16,6 +16,7 @@
> > > > > > >  #include <linux/of_reserved_mem.h>
> > > > > > >  #include <linux/platform_device.h>
> > > > > > >  #include <linux/remoteproc.h>
> > > > > > > +#include <linux/pm_domain.h>
> > > > > > >
> > > > > > >  #include "remoteproc_internal.h"
> > > > > > >
> > > > > > > @@ -102,6 +103,12 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
> > > > > > >   * @rproc: rproc handle
> > > > > > >   * @pm_domain_id: RPU CPU power domain id
> > > > > > >   * @ipi: pointer to mailbox information
> > > > > > > + * @num_pm_dev: number of tcm pm domain devices for this core
> > > > > > > + * @pm_dev_core0: pm domain virtual devices for power domain framework
> > > > > > > + * @pm_dev_core0_link: pm domain device links after registration
> > > > > > > + * @pm_dev_core1: used only in lockstep mode. second core's pm domain virtual devices
> > > > > > > + * @pm_dev_core1_link: used only in lockstep mode. second core's pm device links after
> > > > > > > + * registration
> > > > > > >   */
> > > > > > >  struct zynqmp_r5_core {
> > > > > > >     struct device *dev;
> > > > > > > @@ -111,6 +118,11 @@ struct zynqmp_r5_core {
> > > > > > >     struct rproc *rproc;
> > > > > > >     u32 pm_domain_id;
> > > > > > >     struct mbox_info *ipi;
> > > > > > > +   int num_pm_dev;
> > > > > > > +   struct device **pm_dev_core0;
> > > > > > > +   struct device_link **pm_dev_core0_link;
> > > > > > > +   struct device **pm_dev_core1;
> > > > > > > +   struct device_link **pm_dev_core1_link;
> > > > > > >  };
> > > > > > >
> > > > > > >  /**
> > > > > > > @@ -651,7 +663,8 @@ static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
> > > > > > >                                          ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> > > > > > >                                          ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> > > > > > >             if (ret < 0) {
> > > > > > > -                   dev_err(dev, "failed to turn on TCM 0x%x", pm_domain_id);
> > > > > > > +                   dev_err(dev, "failed to turn on TCM 0x%x",
> > > > > > > +                           pm_domain_id);
> > > > > >
> > > > > > Spurious change, you should have caught that.
> > > > >
> > > > > Ack, need to observe changes more closely before sending them.
> > > > >
> > > > > >
> > > > > > >                     goto release_tcm_lockstep;
> > > > > > >             }
> > > > > > >
> > > > > > > @@ -758,6 +771,189 @@ static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
> > > > > > >     return ret;
> > > > > > >  }
> > > > > > >
> > > > > > > +static void zynqmp_r5_remove_pm_domains(struct rproc *rproc)
> > > > > > > +{
> > > > > > > +   struct zynqmp_r5_core *r5_core = rproc->priv;
> > > > > > > +   struct device *dev = r5_core->dev;
> > > > > > > +   struct zynqmp_r5_cluster *cluster;
> > > > > > > +   int i;
> > > > > > > +
> > > > > > > +   cluster = platform_get_drvdata(to_platform_device(dev->parent));
> > > > > > > +
> > > > > > > +   for (i = 1; i < r5_core->num_pm_dev; i++) {
> > > > > > > +           device_link_del(r5_core->pm_dev_core0_link[i]);
> > > > > > > +           dev_pm_domain_detach(r5_core->pm_dev_core0[i], false);
> > > > > > > +   }
> > > > > > > +
> > > > > > > +   kfree(r5_core->pm_dev_core0);
> > > > > > > +   r5_core->pm_dev_core0 = NULL;
> > > > > > > +   kfree(r5_core->pm_dev_core0_link);
> > > > > > > +   r5_core->pm_dev_core0_link = NULL;
> > > > > > > +
> > > > > > > +   if (cluster->mode == SPLIT_MODE) {
> > > > > > > +           r5_core->num_pm_dev = 0;
> > > > > > > +           return;
> > > > > > > +   }
> > > > > > > +
> > > > > > > +   for (i = 1; i < r5_core->num_pm_dev; i++) {
> > > > > > > +           device_link_del(r5_core->pm_dev_core1_link[i]);
> > > > > > > +           dev_pm_domain_detach(r5_core->pm_dev_core1[i], false);
> > > > > > > +   }
> > > > > > > +
> > > > > > > +   kfree(r5_core->pm_dev_core1);
> > > > > > > +   r5_core->pm_dev_core1 = NULL;
> > > > > > > +   kfree(r5_core->pm_dev_core1_link);
> > > > > > > +   r5_core->pm_dev_core1_link = NULL;
> > > > > > > +   r5_core->num_pm_dev = 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int zynqmp_r5_add_pm_domains(struct rproc *rproc)
> > > > > > > +{
> > > > > > > +   struct zynqmp_r5_core *r5_core = rproc->priv;
> > > > > > > +   struct device *dev = r5_core->dev, *dev2;
> > > > > > > +   struct zynqmp_r5_cluster *cluster;
> > > > > > > +   struct platform_device *pdev;
> > > > > > > +   struct device_node *np;
> > > > > > > +   int i, j, num_pm_dev, ret;
> > > > > > > +
> > > > > > > +   cluster = dev_get_drvdata(dev->parent);
> > > > > > > +
> > > > > > > +   /* get number of power-domains */
> > > > > > > +   num_pm_dev = of_count_phandle_with_args(r5_core->np, "power-domains",
> > > > > > > +                                           "#power-domain-cells");
> > > > > > > +
> > > > > > > +   if (num_pm_dev <= 0)
> > > > > > > +           return -EINVAL;
> > > > > > > +
> > > > > > > +   r5_core->pm_dev_core0 = kcalloc(num_pm_dev,
> > > > > > > +                                   sizeof(struct device *),
> > > > > > > +                                   GFP_KERNEL);
> > > > > > > +   if (!r5_core->pm_dev_core0)
> > > > > > > +           ret = -ENOMEM;
> > > > > > > +
> > > > > > > +   r5_core->pm_dev_core0_link = kcalloc(num_pm_dev,
> > > > > > > +                                        sizeof(struct device_link *),
> > > > > > > +                                        GFP_KERNEL);
> > > > > > > +   if (!r5_core->pm_dev_core0_link) {
> > > > > > > +           kfree(r5_core->pm_dev_core0);
> > > > > > > +           r5_core->pm_dev_core0 = NULL;
> > > > > > > +           return -ENOMEM;
> > > > > > > +   }
> > > > > > > +
> > > > > > > +   r5_core->num_pm_dev = num_pm_dev;
> > > > > > > +
> > > > > > > +   /*
> > > > > > > +    * start from 2nd entry in power-domains property list as
> > > > > > > +    * for zynqmp we only add TCM power domains and not core's power domain.
> > > > > > > +    * 1st entry is used to configure r5 operation mode.
> > > > > >
> > > > > > You are still not saying _where_ ->pm_dev_core0[0] gets added.
> > > > >
> > > > > So, pm_dev_core0[0] isn't really need to be added for zynqmp platform, as firmware starts it with call,
> > > > >
> > > > > zynqmp_pm_request_wake during rproc_start callback. I will document this in next
> > > > >
> > > >
> > > > That is exactly what I am looking for.  That way people don't have to go through
> > > > the entire driver trying to figure out what is happening with pm_dev_core[0].
> > > >
> > > > I'm also not sure about the power-up order.  Logically the TCMs should be
> > > > powered up before the R5 in order to put code in them.  The R5s are powered in
> > > > zynqmp_r5_rproc_start() but I am unclear as to where in the boot sequence the
> > > > TCMs are powered - can you expand on that?
> > >
> > >
> > > Sure. Following is call sequece
> > >
> > > zynqmp_r5_rproc_prepare
> > >
> > > zynqmp_r5_add_pm_domains -> Here TCM is powered on when device_link_add is called via zynqmp-pm-domains.c driver.
> > >
> > > . . .
> > >
> > > zynqmp_r5_rproc_start -> load firmware and Starts RPU
> > >
> > > So what you mentioned is correct, TCM is being powerd-on before we load firmware and start RPU.
> > >
> > >
> > > >
> > > > > revision. For new platforms pm_dev_core0[0] will be added in future.
> > > >
> > > > Now I'm really confused - what do you mean by "pm_dev_core0[0] will be added in
> > > > future"?
> > >
> > >
> > > ZynqMP platform has platform management firmware running on microblaze.
> > >
> > > This firmware design does not expect R5 pm domains to be requested explicitly.
> > >
> > > This means, during zynqmp_r5_rproc_start when "zynqmp_pm_request_wake" is called,
> > >
> > > firmware powers on R5. So, pm_dev_core[0] is not really used for ZynqMP.
> > >
> > > However, this design was changed for new platforms i.e. "versal" and onwards.
> > >
> > > Firmware of new platform expects pm domains to be requested explicitly for R5 cores before
> > >
> > > waking them up.
> > >
> > > That means, pm_dev_core[0] for R5 cores on new platform (Versal) needs to be used same as TCM.
> > >
> > > Then, we should wake it up on r5_core.
> > >
> > > To summarize:
> > >
> > > For zynqmp only following call needed to start R5:
> > >
> > > zynqmp_pm_request_wake
> > >
> > > For "versal" and onwards we need two calls to start R5:
> > >
> > > "device_link_add" and zynqmp_pm_request_wake
> > >
> > > So, in future pm_core_dev[0] will be used.
> > >
> >
> > Thanks for the clarification on both front.  The problem here is that we are
> > keeping R5 power domain information in two different places, i.e
> > zynqmp_r5_core::pm_domain_id and zynqmp_r5_core::pm_dev_core0[0].
> >
> > Please see if you can retreive the power domain ID from
> > zynqmp_r5_core::pm_dev_core0[0].  That way you can get the power domain ID when
> > calling zynqmp_pm_request_wake() and zynqmp_pm_force_pwrdwn() and get rid of
> > zynqmp_r5_core::pm_domain_id.
>
> Hi Mathieu,
>
> I looked into this. Probably I can't retrieve pm_domain_id from pm_dev_core0[0],
>
> However, I can retrieve it from device-tree when calling zynqmp_pm_request_wake
>
> and zynqmp_pm_force_pwrdwn.
>
> zynqmp_r5_core::pm_domain_id is caching that value during probe, and use it during
> rest of the driver lifecycle.
>
> I am okay either way, (keeping it as it is, or get it from device-tree). Let me know your
>
> preference.
>

Humm...  Then I suggest to simply get rid of the device linking to
deal with the TCMs' power management.  From where I stand it provides
more confusion than benefits, and that is without considering the
extra complexity.

> Thanks,
>
> Tanmay
>
> > >
> > > > >
> > > > > I hope this meets expectations.
> > > > >
> > > > >
> > > > > >
> > > > > > > +    */
> > > > > > > +   for (i = 1; i < r5_core->num_pm_dev; i++) {
> > > > > > > +           r5_core->pm_dev_core0[i] = dev_pm_domain_attach_by_id(dev, i);
> > > > > > > +           if (IS_ERR_OR_NULL(r5_core->pm_dev_core0[i])) {
> > > > > >
> > > > > > Here IS_ERR_OR_NULL() is used while two if conditions for NULL and an error
> > > > > > code are used in the loop for the lockstep mode.  Please pick one heuristic and
> > > > > > stick with it.  I have no preference on which one.
> > > > >
> > > > > Ok, I think IS_ERR_OR_NULL is more cleaner, I will address it in next revision.
> > > > >
> > > > >
> > > > > >
> > > > > > > +                   dev_dbg(dev, "failed to attach pm domain %d, ret=%ld\n", i,
> > > > > > > +                           PTR_ERR(r5_core->pm_dev_core0[i]));
> > > > > > > +                   ret = -EINVAL;
> > > > > > > +                   goto fail_add_pm_domains;
> > > > > > > +           }
> > > > > > > +           r5_core->pm_dev_core0_link[i] = device_link_add(dev,
> > > > > > > +                                                           r5_core->pm_dev_core0[i],
> > > > > > > +                                                           DL_FLAG_STATELESS |
> > > > > > > +                                                           DL_FLAG_RPM_ACTIVE |
> > > > > > > +                                                           DL_FLAG_PM_RUNTIME);
> > > > > > > +           if (!r5_core->pm_dev_core0_link[i]) {
> > > > > > > +                   dev_pm_domain_detach(r5_core->pm_dev_core0[i], true);
> > > > > > > +                   r5_core->pm_dev_core0[i] = NULL;
> > > > > > > +                   ret = -EINVAL;
> > > > > > > +                   goto fail_add_pm_domains;
> > > > > > > +           }
> > > > > > > +   }
> > > > > > > +
> > > > > > > +   if (cluster->mode == SPLIT_MODE)
> > > > > > > +           return 0;
> > > > > > > +
> > > > > > > +   r5_core->pm_dev_core1 = kcalloc(num_pm_dev,
> > > > > > > +                                   sizeof(struct device *),
> > > > > > > +                                   GFP_KERNEL);
> > > > > > > +   if (!r5_core->pm_dev_core1) {
> > > > > > > +           ret = -ENOMEM;
> > > > > > > +           goto fail_add_pm_domains;
> > > > > > > +   }
> > > > > > > +
> > > > > > > +   r5_core->pm_dev_core1_link = kcalloc(num_pm_dev,
> > > > > > > +                                        sizeof(struct device_link *),
> > > > > > > +                                        GFP_KERNEL);
> > > > > > > +   if (!r5_core->pm_dev_core1_link) {
> > > > > > > +           kfree(r5_core->pm_dev_core1);
> > > > > > > +           r5_core->pm_dev_core1 = NULL;
> > > > > > > +           ret = -ENOMEM;
> > > > > > > +           goto fail_add_pm_domains;
> > > > > > > +   }
> > > > > > > +
> > > > > > > +   /* get second core's device to detach its power-domains */
> > > > > > > +   np = of_get_next_child(cluster->dev->of_node, of_node_get(dev->of_node));
> > > > > > > +
> > > > > > > +   pdev = of_find_device_by_node(np);
> > > > > > > +   if (!pdev) {
> > > > > > > +           dev_err(cluster->dev, "core1 platform device not available\n");
> > > > > > > +           kfree(r5_core->pm_dev_core1);
> > > > > > > +           kfree(r5_core->pm_dev_core1_link);
> > > > > > > +           r5_core->pm_dev_core1 = NULL;
> > > > > > > +           r5_core->pm_dev_core1_link = NULL;
> > > > > > > +           ret = -EINVAL;
> > > > > > > +           goto fail_add_pm_domains;
> > > > > > > +   }
> > > > > > > +
> > > > > > > +   dev2 = &pdev->dev;
> > > > > > > +
> > > > > > > +   /* for zynqmp we only add TCM power domains and not core's power domain */
> > > > > > > +   for (j = 1; j < r5_core->num_pm_dev; j++) {
> > > > > > > +           r5_core->pm_dev_core1[j] = dev_pm_domain_attach_by_id(dev2, j);
> > > > > > > +           if (!r5_core->pm_dev_core1[j]) {
> > > > > > > +                   dev_dbg(dev, "can't attach to pm domain %d\n", j);
> > > > > > > +                   ret = -EINVAL;
> > > > > > > +                   goto fail_add_pm_domains_lockstep;
> > > > > > > +           } else if (IS_ERR(r5_core->pm_dev_core1[j])) {
> > > > > > > +                   dev_dbg(dev, "can't attach to pm domain %d\n", j);
> > > > > > > +                   ret = PTR_ERR(r5_core->pm_dev_core1[j]);
> > > > > > > +                   goto fail_add_pm_domains_lockstep;
> > > > > > > +           }
> > > > > > > +
> > > > > > > +           r5_core->pm_dev_core1_link[j] = device_link_add(dev,
> > > > > > > +                                                           r5_core->pm_dev_core1[j],
> > > > > > > +                                                           DL_FLAG_STATELESS |
> > > > > > > +                                                           DL_FLAG_RPM_ACTIVE |
> > > > > > > +                                                           DL_FLAG_PM_RUNTIME);
> > > > > > > +           if (!r5_core->pm_dev_core1_link[j]) {
> > > > > > > +                   dev_pm_domain_detach(r5_core->pm_dev_core1[j], true);
> > > > > > > +                   r5_core->pm_dev_core1[j] = NULL;
> > > > > > > +                   ret = -ENODEV;
> > > > > > > +                   goto fail_add_pm_domains_lockstep;
> > > > > > > +           }
> > > > > > > +   }
> > > > > > > +
> > > > > > > +fail_add_pm_domains_lockstep:
> > > > > > > +   while (--j >= 0) {
> > > > > > > +           device_link_del(r5_core->pm_dev_core1_link[j]);
> > > > > > > +           dev_pm_domain_detach(r5_core->pm_dev_core1[j], true);
> > > > > > > +   }
> > > > > > > +   kfree(r5_core->pm_dev_core1);
> > > > > > > +   r5_core->pm_dev_core1 = NULL;
> > > > > > > +   kfree(r5_core->pm_dev_core1_link);
> > > > > > > +   r5_core->pm_dev_core1_link = NULL;
> > > > > > > +
> > > > > > > +fail_add_pm_domains:
> > > > > > > +   while (--i >= 0) {
> > > > > > > +           device_link_del(r5_core->pm_dev_core0_link[i]);
> > > > > > > +           dev_pm_domain_detach(r5_core->pm_dev_core0[i], true);
> > > > > > > +   }
> > > > > > > +   kfree(r5_core->pm_dev_core0);
> > > > > > > +   r5_core->pm_dev_core0 = NULL;
> > > > > > > +   kfree(r5_core->pm_dev_core0_link);
> > > > > > > +   r5_core->pm_dev_core0_link = NULL;
> > > > > > > +
> > > > > >
> > > > > > The error path is much cleaner and readable now.
> > > > > >
> > > > > > I will continue tomorrow.
> > > > > >
> > > > > > Mathieu
> > > > > >
> > > > > > > +   return ret;
> > > > > > > +}
> > > > > > > +
> > > > > > >  /**
> > > > > > >   * zynqmp_r5_rproc_prepare()
> > > > > > >   * adds carveouts for TCM bank and reserved memory regions
> > > > > > > @@ -770,19 +966,30 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
> > > > > > >  {
> > > > > > >     int ret;
> > > > > > >
> > > > > > > +   ret = zynqmp_r5_add_pm_domains(rproc);
> > > > > > > +   if (ret) {
> > > > > > > +           dev_err(&rproc->dev, "failed to add pm domains\n");
> > > > > > > +           return ret;
> > > > > > > +   }
> > > > > > > +
> > > > > > >     ret = add_tcm_banks(rproc);
> > > > > > >     if (ret) {
> > > > > > >             dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
> > > > > > > -           return ret;
> > > > > > > +           goto fail_prepare;
> > > > > > >     }
> > > > > > >
> > > > > > >     ret = add_mem_regions_carveout(rproc);
> > > > > > >     if (ret) {
> > > > > > >             dev_err(&rproc->dev, "failed to get reserve mem regions %d\n", ret);
> > > > > > > -           return ret;
> > > > > > > +           goto fail_prepare;
> > > > > > >     }
> > > > > > >
> > > > > > >     return 0;
> > > > > > > +
> > > > > > > +fail_prepare:
> > > > > > > +   zynqmp_r5_remove_pm_domains(rproc);
> > > > > > > +
> > > > > > > +   return ret;
> > > > > > >  }
> > > > > > >
> > > > > > >  /**
> > > > > > > @@ -801,6 +1008,8 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
> > > > > > >
> > > > > > >     r5_core = rproc->priv;
> > > > > > >
> > > > > > > +   zynqmp_r5_remove_pm_domains(rproc);
> > > > > > > +
> > > > > > >     for (i = 0; i < r5_core->tcm_bank_count; i++) {
> > > > > > >             pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
> > > > > > >             if (zynqmp_pm_release_node(pm_domain_id))
> > > > > > > --
> > > > > > > 2.25.1
> > > > > > >

