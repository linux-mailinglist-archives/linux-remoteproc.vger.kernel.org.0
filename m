Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 037DB19B7EC
	for <lists+linux-remoteproc@lfdr.de>; Wed,  1 Apr 2020 23:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732821AbgDAVxh (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 1 Apr 2020 17:53:37 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40936 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732357AbgDAVxh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Apr 2020 17:53:37 -0400
Received: by mail-pg1-f195.google.com with SMTP id t24so797851pgj.7
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Apr 2020 14:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4xc9ld1iahpW/WSm7TiO2BJC7iwVfwV5gViT4Ro45g4=;
        b=GJr1j57ET3bbZCkBBFooXVouiSuAUightLbrWHiQTJHpRvbKRBLnrUZJbUECIeeBV+
         LE/qO2MujsNHyRa84OAS2fNY5VetYd+tBJ37POlv26VSYg7De0VQ8Pu9q7KyHD9E1Jak
         AeiE66yeqoDe4aZ8Gn9RfmdAFHGehXqBTJOGwCYD+XVBW1SuqpAKLDGHZDdOHNgL4jJc
         CuBjVJjhGuIaM4NOMqass8OZce42XGxPuxO/RCBOoznc40xoo7fHr673R6GDO+9i9MVE
         4zSOtR/MateaVZZq3oe3cK6gcG02ob+S7ZDlBo+FcYgkGjOubufagTpijDY/gVkWo330
         qrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4xc9ld1iahpW/WSm7TiO2BJC7iwVfwV5gViT4Ro45g4=;
        b=TynkdTpMbydW1Nt9cjDXg0g6Ak9BrzAOXLbY1FCVAfJvqvEcK19NXzxVnxWq1dlVib
         IRp7rNBRn6iXpOkf+KoiNHIoAJ3bc+lAiBZE6cjF/GF7gVMeWKsSEBaF44xD3FnVn/X0
         oJDmB0/wUvjULnTvnK8JYGkzT0pjvFNmAbhZim90QWGqHJxRt0TpRqXKKfubC3HUdadR
         zVMr9zrzM5fP7kCvDexuxtASWI7P3QGS+5u/alHwPBOUP+hB46n/7mJLZP7o6u6fcPms
         Ya2fQXH4rup0i1y7sTcoYME3gSGpXGxVWfwUuPtC+YzBku54iPthDJR8Bk4tuGlIu43l
         /9tw==
X-Gm-Message-State: ANhLgQ2sYr7OyAInotzzx6y/5kyMNvZjvYjVYqNqaqrL3hPBfBmDNQo9
        rls3eCOulbc02jC3Iwk4UcXuuQ==
X-Google-Smtp-Source: ADFU+vsSRk7O4iHaBOuDjYOAir0a9h86NH+wzE25E/5iAW8yq8Dt7RdNTkglJzfKOroLWErje11/RQ==
X-Received: by 2002:a62:e307:: with SMTP id g7mr24014940pfh.197.1585778015123;
        Wed, 01 Apr 2020 14:53:35 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 141sm2253309pfu.174.2020.04.01.14.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 14:53:34 -0700 (PDT)
Date:   Wed, 1 Apr 2020 15:53:32 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com, loic.pallardy@st.com,
        peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 01/17] remoteproc: Add new operation and state machine
 for MCU synchronisation
Message-ID: <20200401215255.GG17383@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-2-mathieu.poirier@linaro.org>
 <3eaede13-533d-f2ba-fc14-96b135479b7e@ti.com>
 <aff2d75d-9480-385f-c089-c0f8cb982feb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aff2d75d-9480-385f-c089-c0f8cb982feb@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Mar 30, 2020 at 05:49:11PM -0500, Suman Anna wrote:
> On 3/30/20 5:46 PM, Suman Anna wrote:
> > Hi Mathieu,
> > 
> > On 3/24/20 4:45 PM, Mathieu Poirier wrote:
> >> Add a new rproc_ops sync_ops to support use cases where the remoteproc
> >> core is synchronisting with the MCU.  When exactly to use the sync_ops is
> > 
> > typo on syschronisting..
> > 
> >> directed by the states in struct rproc_sync_states.
> >>
> >> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> ---
> >>  drivers/remoteproc/remoteproc_debugfs.c  | 31 ++++++++++++++++++++++++
> >>  drivers/remoteproc/remoteproc_internal.h |  5 ++++
> >>  include/linux/remoteproc.h               | 23 +++++++++++++++++-
> >>  3 files changed, 58 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> >> index dd93cf04e17f..187bcc67f997 100644
> >> --- a/drivers/remoteproc/remoteproc_debugfs.c
> >> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> >> @@ -311,6 +311,35 @@ static const struct file_operations rproc_carveouts_ops = {
> >>  	.release	= single_release,
> >>  };
> >>  
> >> +/* Expose synchronisation states via debugfs */
> >> +static int rproc_sync_states_show(struct seq_file *seq, void *p)
> >> +{
> >> +	struct rproc *rproc = seq->private;
> >> +
> >> +	seq_printf(seq, "Sync with MCU: %s\n",
> >> +		   rproc->sync_with_mcu ? "true" : "false");
> >> +	seq_printf(seq, "On init: %s\n",
> >> +		   rproc->sync_states->on_init ? "true" : "false");
> >> +	seq_printf(seq, "After stop: %s\n",
> >> +		   rproc->sync_states->after_stop ? "true" : "false");
> >> +	seq_printf(seq, "After crash: %s\n",
> >> +		   rproc->sync_states->after_crash ? "true" : "false");
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int rproc_sync_states_open(struct inode *inode, struct file *file)
> >> +{
> >> +	return single_open(file, rproc_sync_states_show, inode->i_private);
> >> +}
> >> +
> >> +static const struct file_operations rproc_sync_states_ops = {
> >> +	.open		= rproc_sync_states_open,
> >> +	.read		= seq_read,
> >> +	.llseek		= seq_lseek,
> >> +	.release	= single_release,
> >> +};
> >> +
> >>  void rproc_remove_trace_file(struct dentry *tfile)
> >>  {
> >>  	debugfs_remove(tfile);
> >> @@ -357,6 +386,8 @@ void rproc_create_debug_dir(struct rproc *rproc)
> >>  			    rproc, &rproc_rsc_table_ops);
> >>  	debugfs_create_file("carveout_memories", 0400, rproc->dbg_dir,
> >>  			    rproc, &rproc_carveouts_ops);
> >> +	debugfs_create_file("sync_states", 0400, rproc->dbg_dir,
> >> +			    rproc, &rproc_sync_states_ops);
> >>  }
> >>  
> >>  void __init rproc_init_debugfs(void)
> >> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> >> index 493ef9262411..5c93de5e00bb 100644
> >> --- a/drivers/remoteproc/remoteproc_internal.h
> >> +++ b/drivers/remoteproc/remoteproc_internal.h
> >> @@ -63,6 +63,11 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
> >>  struct rproc_mem_entry *
> >>  rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
> >>  
> >> +static inline bool rproc_sync_with_mcu(struct rproc *rproc)
> >> +{
> >> +	return rproc->sync_with_mcu;
> >> +}
> >> +
> > 
> > Since you are using this mostly for checking and as a boolean, I suggest
> > you rename this appropriately, something like rproc_needs_sync,
> > rproc_has_sync or rproc_uses_sync().

I will rename to rproc_syncing_with_rproc()


> > 
> > And I am wondering if it is actually better to introduce the sync state
> > to check against here, rather than using the stored sync state and
> > return. The current way makes it confusing to read the state machine.

I decided to proceed this way because there may not be a direct correlation
between the current synchronisation state and the location of the check itself.
for instance, in firmware_show(), what sync state should be key on?

> > 
> >>  static inline
> >>  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
> >>  {
> >> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >> index 16ad66683ad0..d115e47d702d 100644
> >> --- a/include/linux/remoteproc.h
> >> +++ b/include/linux/remoteproc.h
> >> @@ -353,6 +353,21 @@ enum rsc_handling_status {
> >>  	RSC_IGNORED	= 1,
> >>  };
> >>  
> >> +/**
> >> + * struct rproc_sync_states - platform specific states indicating which
> >> + *			      rproc_ops to use at specific times during
> >> + *			      the MCU lifecycle.
> >> + * @on_init: true if synchronising with MCU at system initialisation time
> >> + * @after_stop: true if synchronising with MCU after stopped from the
> >> + *		command line
> >> + * @after_crash: true if synchonising with MCU after the MCU has crashed
> >> + */
> >> +struct rproc_sync_states {
> >> +	bool on_init;
> >> +	bool after_stop;
> >> +	bool after_crash;
> >> +};
> >> +
> > 
> > Overall, this patch can move down the order, and better to add it in
> > the patches where you actually introduce these code. And the debugfs
> > pieces can be added as a separate patch by itself.
> 
> Also, actually sounds more like flags than states..

I thought about this in terms of "states" in which a decision should be made.
I'm not sure those are flags...

> 
> regards
> Suman
> 
> > 
> >>  /**
> >>   * struct rproc_ops - platform-specific device handlers
> >>   * @start:	power on the device and boot it
> >> @@ -456,6 +471,9 @@ struct rproc_dump_segment {
> >>   * @firmware: name of firmware file to be loaded
> >>   * @priv: private data which belongs to the platform-specific rproc module
> >>   * @ops: platform-specific start/stop rproc handlers
> >> + * @sync_ops: paltform-specific start/stop rproc handlers when
> > 
> > typo on platform

No matter how many times you read your own code, there's always something like
this that escapes...

> > 
> >> + *	      synchronising with a remote processor.
> >> + * @sync_states: Determine the rproc_ops to choose in specific states.
> >>   * @dev: virtual device for refcounting and common remoteproc behavior
> >>   * @power: refcount of users who need this rproc powered up
> >>   * @state: state of the device
> >> @@ -479,6 +497,7 @@ struct rproc_dump_segment {
> >>   * @table_sz: size of @cached_table
> >>   * @has_iommu: flag to indicate if remote processor is behind an MMU
> >>   * @auto_boot: flag to indicate if remote processor should be auto-started
> >> + * @sync_with_mcu: true if currently synchronising with MCU
> >>   * @dump_segments: list of segments in the firmware
> >>   * @nb_vdev: number of vdev currently handled by rproc
> >>   */
> >> @@ -488,7 +507,8 @@ struct rproc {
> >>  	const char *name;
> >>  	char *firmware;
> >>  	void *priv;
> >> -	struct rproc_ops *ops;
> >> +	struct rproc_ops *ops, *sync_ops;
> > 
> > Nothing wrong with this, but prefer to have the new variable in a new
> > line for better readability.

Sure thing.

> > 
> > regards
> > Suman
> > 
> >> +	struct rproc_sync_states *sync_states;
> >>  	struct device dev;
> >>  	atomic_t power;
> >>  	unsigned int state;
> >> @@ -512,6 +532,7 @@ struct rproc {
> >>  	size_t table_sz;
> >>  	bool has_iommu;
> >>  	bool auto_boot;
> >> +	bool sync_with_mcu;
> >>  	struct list_head dump_segments;
> >>  	int nb_vdev;
> >>  };
> >>
> > 
> 
