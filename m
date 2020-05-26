Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 663541B53E0
	for <lists+linux-remoteproc@lfdr.de>; Thu, 23 Apr 2020 07:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgDWFAy (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 23 Apr 2020 01:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725854AbgDWFAy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Apr 2020 01:00:54 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F6EC03C1AB
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2020 22:00:53 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 145so2320849pfw.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2020 22:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SP5kt0X+NFv01hGdhlSZGrj4pSvf4jkmcFFyTl5kuC4=;
        b=B2coqk+rNQDnE+4SDzcXxg66+w6r3X9mddej89j6Hdmu+VOZgcOeSNc0S2e+kOVsSM
         oUTa+AQZsm4dIpAeU3AabPPtsYK73pKD85dJ81ZjqSflISDPWIXk2wXFivihVsn2LJ1E
         6w91UHeBEJZ2l4QF3GNIKlo2LKI3eqjmxvK7jmbrf1tSw7UXBZHWrW3Khwb4eIejWUyb
         8d0lqoSPo4/XSppRZHzqtErAmpZr9W4HAO12PkOzhLrMc1kqqmn9CxM/975GtsqKvE2h
         L4sGrQcyfjv+ACgoG2AcpWVxVNP6xTrWiP1b1mjx+l2jbRinFXdo0NsAzOl3yUJVUMKa
         fKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SP5kt0X+NFv01hGdhlSZGrj4pSvf4jkmcFFyTl5kuC4=;
        b=G9iZFzlnF5a3wotkNHkPkS86jIKZPlFUiBg5RyCAOT+Hl5IzKJu3z3LwGw91wQNXCv
         aEk9cZjTcSDushhK5o6VTqSyPtSbLNlEmwSSFGv8ePA77WDMk/hkw5HrArXgtKFUlhCE
         bxhThOoF5ef7gwcfz37xx0MYf6MWOI/kgeSr3T/0JEBBkh8X+e+0pUYsGUap/q8Vf+E/
         cpOu6T3tRoDXmv1Q59IkPXkSFIfI+aNwpebvVemvC1mY982QIhypSkdGe4dq5ox/+kwb
         RbfQCSatkcMmDTEkb9wUH2njPiZOgJQB7AB7AO/olZSepiS7t5rNh60+qTq5y8MghyM0
         +pgw==
X-Gm-Message-State: AGi0PuZUYYfPDmSpAj5ZyzNO/w1HrgpPTySDuX60FUvQPQGY0Fu7e94k
        HPBplAFJNEnp3pQ5RYkFBnsXYg==
X-Google-Smtp-Source: APiQypL4ZJM26+qyXH9J1qO3Lqvrs7e0aJSt3FyRYAmsvCulkbisdSh1Q9TYUbrYmbCCvJGcIaei0A==
X-Received: by 2002:a62:5fc4:: with SMTP id t187mr1970332pfb.269.1587618053284;
        Wed, 22 Apr 2020 22:00:53 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i15sm891925pgj.30.2020.04.22.22.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 22:00:52 -0700 (PDT)
Date:   Wed, 22 Apr 2020 22:01:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Loic Pallardy <loic.pallardy@st.com>
Subject: Re: [PATCH 1/2] remoteproc: Add prepare and unprepare ops
Message-ID: <20200423050120.GO1868936@builder.lan>
References: <20200417002036.24359-1-s-anna@ti.com>
 <20200417002036.24359-2-s-anna@ti.com>
 <20200421025254.GK1868936@builder.lan>
 <2feee391-9f8e-410e-2a20-5b5bdd949940@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2feee391-9f8e-410e-2a20-5b5bdd949940@ti.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 21 Apr 07:12 PDT 2020, Suman Anna wrote:

> On 4/20/20 9:52 PM, Bjorn Andersson wrote:
> > On Thu 16 Apr 17:20 PDT 2020, Suman Anna wrote:
> > 
> > > From: Loic Pallardy <loic.pallardy@st.com>
> > > 
> > > On some SoC architecture, it is needed to enable HW like
> > > clock, bus, regulator, memory region... before loading
> > > co-processor firmware.
> > > 
> > > This patch introduces prepare and unprepare ops to execute
> > > platform specific function before firmware loading and after
> > > stop execution.
> > > 
> > > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > > Signed-off-by: Suman Anna <s-anna@ti.com>
> > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > 
> > Do we have an inbound user of these new oops?
> 
> Yes, both the TI K3 R5F and DSP remoteproc drivers use these ops, the
> patches are already on the lists.
> 

Thanks for confirming Suman, I'll apply this.

Regards,
Bjorn

> regards
> Suman
> 
> > 
> > Regards,
> > Bjorn
> > 
> > > ---
> > > v1:
> > >   - Make the direct ops into inline helper functions in line
> > >     with the comments on the MCU sync series (v1 comments).
> > >     No change in functionality.
> > >   - Picked up the Reviewed-by tags
> > > v0: https://patchwork.kernel.org/patch/11456383/
> > > 
> > >   drivers/remoteproc/remoteproc_core.c     | 15 ++++++++++++++-
> > >   drivers/remoteproc/remoteproc_internal.h | 16 ++++++++++++++++
> > >   include/linux/remoteproc.h               |  4 ++++
> > >   3 files changed, 34 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index d681eeb962b6..e38f627059ac 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1394,12 +1394,19 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> > >   		return ret;
> > >   	}
> > > +	/* Prepare rproc for firmware loading if needed */
> > > +	ret = rproc_prepare_device(rproc);
> > > +	if (ret) {
> > > +		dev_err(dev, "can't prepare rproc %s: %d\n", rproc->name, ret);
> > > +		goto disable_iommu;
> > > +	}
> > > +
> > >   	rproc->bootaddr = rproc_get_boot_addr(rproc, fw);
> > >   	/* Load resource table, core dump segment list etc from the firmware */
> > >   	ret = rproc_parse_fw(rproc, fw);
> > >   	if (ret)
> > > -		goto disable_iommu;
> > > +		goto unprepare_rproc;
> > >   	/* reset max_notifyid */
> > >   	rproc->max_notifyid = -1;
> > > @@ -1433,6 +1440,9 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> > >   	kfree(rproc->cached_table);
> > >   	rproc->cached_table = NULL;
> > >   	rproc->table_ptr = NULL;
> > > +unprepare_rproc:
> > > +	/* release HW resources if needed */
> > > +	rproc_unprepare_device(rproc);
> > >   disable_iommu:
> > >   	rproc_disable_iommu(rproc);
> > >   	return ret;
> > > @@ -1838,6 +1848,9 @@ void rproc_shutdown(struct rproc *rproc)
> > >   	/* clean up all acquired resources */
> > >   	rproc_resource_cleanup(rproc);
> > > +	/* release HW resources if needed */
> > > +	rproc_unprepare_device(rproc);
> > > +
> > >   	rproc_disable_iommu(rproc);
> > >   	/* Free the copy of the resource table */
> > > diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> > > index b389dc79da81..101e6be8d240 100644
> > > --- a/drivers/remoteproc/remoteproc_internal.h
> > > +++ b/drivers/remoteproc/remoteproc_internal.h
> > > @@ -64,6 +64,22 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
> > >   struct rproc_mem_entry *
> > >   rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
> > > +static inline int rproc_prepare_device(struct rproc *rproc)
> > > +{
> > > +	if (rproc->ops->prepare)
> > > +		return rproc->ops->prepare(rproc);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static inline int rproc_unprepare_device(struct rproc *rproc)
> > > +{
> > > +	if (rproc->ops->unprepare)
> > > +		return rproc->ops->unprepare(rproc);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   static inline
> > >   int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
> > >   {
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index 38607107b7cb..b8481ac969f1 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -355,6 +355,8 @@ enum rsc_handling_status {
> > >   /**
> > >    * struct rproc_ops - platform-specific device handlers
> > > + * @prepare:	prepare device for code loading
> > > + * @unprepare:	unprepare device after stop
> > >    * @start:	power on the device and boot it
> > >    * @stop:	power off the device
> > >    * @kick:	kick a virtqueue (virtqueue id given as a parameter)
> > > @@ -373,6 +375,8 @@ enum rsc_handling_status {
> > >    *		panic at least the returned number of milliseconds
> > >    */
> > >   struct rproc_ops {
> > > +	int (*prepare)(struct rproc *rproc);
> > > +	int (*unprepare)(struct rproc *rproc);
> > >   	int (*start)(struct rproc *rproc);
> > >   	int (*stop)(struct rproc *rproc);
> > >   	void (*kick)(struct rproc *rproc, int vqid);
> > > -- 
> > > 2.26.0
> > > 
> 
