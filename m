Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7B7F184A1F
	for <lists+linux-remoteproc@lfdr.de>; Fri, 13 Mar 2020 16:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgCMPBe (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 13 Mar 2020 11:01:34 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:39903 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgCMPBe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 13 Mar 2020 11:01:34 -0400
Received: by mail-il1-f193.google.com with SMTP id w15so1843916ilq.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2020 08:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0JJly35jMohU6Jo9kPx/E3rzRDgQUVM9QUoN4+zxqko=;
        b=zGY5nH/ETTr8oBjPhRzFqxRqJCm1bWwLLxsT28zLfolrzDOJD5S0O8iP7hQOv2puCp
         K5CFi0J9y9q6eTxKFlpsHWng6Y7Mf8oBn9CGh4EZPQHSbCR2yN8G7PYsZqy8Tlr7Y3Br
         tPYMymiBDZTuMPCt2vpa3yEifCSUMVQfRm4q25rnByu39Fy533k/Er5WfOToBthF/FLB
         5JPsHjnl0ey9qnz0+EWGiF1fbMYUKPbRqrKTEjyNxBq8mAMeHl3xO27k3Lf7KISNRu1H
         qTpkMuHmjsBYJ9Pt0pkYrkBKoixzkbat3UE3XcFWztqyOIHKs9rBoStpUtl3BnsSaNSC
         pX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0JJly35jMohU6Jo9kPx/E3rzRDgQUVM9QUoN4+zxqko=;
        b=XhxyYHwR2jTBB5/Gqx1gKW1OOkX+QSmRFEHNv/mye/13I10hOEkkgN3Qs7hrTKkGn3
         V0Y3osAQa61tD51CQKbIbWiEFgBiYznafc8g+AR6kWoy43KbJh/1dZbMcINPmHxpAIC0
         Txiv2Kj3bbXhWUAaN43dYbTB2bXT/xj2F28oPUIkvEUDPmuwQED6i0lsmjmmEWxAxosq
         o3FjHLwBr0qggOlD/7iyUg+1ICl1EjJ49HqS4twBRPRFPtCTqlsbs4mhTzdUy/av6AUW
         wr4MMyYyZqrYRaFjj2UC+LnuwCMBQ5WADPyrSTlUjkEj+itGS7qMTDoKG70gsrJnAiUm
         Ms1g==
X-Gm-Message-State: ANhLgQ2NOoqMBvhUdHJNVCwZm5c68Cig94sSYnPiCoRtSvcFPZns9XHk
        35VIxXXO+32zb7a16h9yQ9KzLA25LvBLz6kWw6SOTA==
X-Google-Smtp-Source: ADFU+vveXOTZicf4Gm11h+a7bfnYSQIHcs7HupHBmfog/pS39ERuA+p8zQYQcDG9iM04Ryvn0vlu5qVZH1UdiuRnfQ4=
X-Received: by 2002:a92:8352:: with SMTP id f79mr9739115ild.58.1584111692143;
 Fri, 13 Mar 2020 08:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
 <20200312221158.3613-2-mathieu.poirier@linaro.org> <CAH2Cfb8jkMtdJ0oUNWQ4Bbsybrkb4z_0kP8UH6tYkEB6peZ56g@mail.gmail.com>
In-Reply-To: <CAH2Cfb8jkMtdJ0oUNWQ4Bbsybrkb4z_0kP8UH6tYkEB6peZ56g@mail.gmail.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 13 Mar 2020 09:01:20 -0600
Message-ID: <CANLsYkx2La2G_L0Cq7JB+SQYeueufcMvyHG4AZQQ3p-1AzFpoA@mail.gmail.com>
Subject: Re: [PATCH 01/18] remoteproc: Add new operation and state machine for
 MCU synchronisation
To:     Xiang Xiao <xiaoxiang781216@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Ohad Ben Cohen <ohad@wizery.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        Suman Anna <s-anna@ti.com>, Peng Fan <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien Dessenne <fabien.dessenne@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Xiao,

On Thu, 12 Mar 2020 at 20:04, Xiang Xiao <xiaoxiang781216@gmail.com> wrote:
>
> On Fri, Mar 13, 2020 at 6:12 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > Add a new rproc_ops sync_ops to support use cases where the remoteproc
> > core is synchronisting with the MCU.  When exactly to use the sync_ops is
> > directed by the states in struct rproc_sync_states.
> >
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_debugfs.c  | 31 ++++++++++++++++++++++++
> >  drivers/remoteproc/remoteproc_internal.h |  5 ++++
> >  include/linux/remoteproc.h               | 23 +++++++++++++++++-
> >  3 files changed, 58 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> > index dd93cf04e17f..187bcc67f997 100644
> > --- a/drivers/remoteproc/remoteproc_debugfs.c
> > +++ b/drivers/remoteproc/remoteproc_debugfs.c
> > @@ -311,6 +311,35 @@ static const struct file_operations rproc_carveouts_ops = {
> >         .release        = single_release,
> >  };
> >
> > +/* Expose synchronisation states via debugfs */
> > +static int rproc_sync_states_show(struct seq_file *seq, void *p)
> > +{
> > +       struct rproc *rproc = seq->private;
> > +
> > +       seq_printf(seq, "Sync with MCU: %s\n",
> > +                  rproc->sync_with_mcu ? "true" : "false");
> > +       seq_printf(seq, "On init: %s\n",
> > +                  rproc->sync_states->on_init ? "true" : "false");
> > +       seq_printf(seq, "After stop: %s\n",
> > +                  rproc->sync_states->after_stop ? "true" : "false");
> > +       seq_printf(seq, "After crash: %s\n",
> > +                  rproc->sync_states->after_crash ? "true" : "false");
> > +
> > +       return 0;
> > +}
> > +
> > +static int rproc_sync_states_open(struct inode *inode, struct file *file)
> > +{
> > +       return single_open(file, rproc_sync_states_show, inode->i_private);
> > +}
> > +
> > +static const struct file_operations rproc_sync_states_ops = {
> > +       .open           = rproc_sync_states_open,
> > +       .read           = seq_read,
> > +       .llseek         = seq_lseek,
> > +       .release        = single_release,
> > +};
> > +
> >  void rproc_remove_trace_file(struct dentry *tfile)
> >  {
> >         debugfs_remove(tfile);
> > @@ -357,6 +386,8 @@ void rproc_create_debug_dir(struct rproc *rproc)
> >                             rproc, &rproc_rsc_table_ops);
> >         debugfs_create_file("carveout_memories", 0400, rproc->dbg_dir,
> >                             rproc, &rproc_carveouts_ops);
> > +       debugfs_create_file("sync_states", 0400, rproc->dbg_dir,
> > +                           rproc, &rproc_sync_states_ops);
> >  }
> >
> >  void __init rproc_init_debugfs(void)
> > diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> > index 493ef9262411..5c93de5e00bb 100644
> > --- a/drivers/remoteproc/remoteproc_internal.h
> > +++ b/drivers/remoteproc/remoteproc_internal.h
> > @@ -63,6 +63,11 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
> >  struct rproc_mem_entry *
> >  rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
> >
> > +static inline bool rproc_sync_with_mcu(struct rproc *rproc)
> > +{
> > +       return rproc->sync_with_mcu;
> > +}
> > +
> >  static inline
> >  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
> >  {
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 16ad66683ad0..d115e47d702d 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -353,6 +353,21 @@ enum rsc_handling_status {
> >         RSC_IGNORED     = 1,
> >  };
> >
> > +/**
> > + * struct rproc_sync_states - platform specific states indicating which
> > + *                           rproc_ops to use at specific times during
> > + *                           the MCU lifecycle.
> > + * @on_init: true if synchronising with MCU at system initialisation time
> > + * @after_stop: true if synchronising with MCU after stopped from the
> > + *             command line
> > + * @after_crash: true if synchonising with MCU after the MCU has crashed
> > + */
> > +struct rproc_sync_states {
> > +       bool on_init;
> > +       bool after_stop;
> > +       bool after_crash;
> > +};
> > +
> >  /**
> >   * struct rproc_ops - platform-specific device handlers
> >   * @start:     power on the device and boot it
> > @@ -456,6 +471,9 @@ struct rproc_dump_segment {
> >   * @firmware: name of firmware file to be loaded
> >   * @priv: private data which belongs to the platform-specific rproc module
> >   * @ops: platform-specific start/stop rproc handlers
> > + * @sync_ops: paltform-specific start/stop rproc handlers when
> > + *           synchronising with a remote processor.
> > + * @sync_states: Determine the rproc_ops to choose in specific states.
> >   * @dev: virtual device for refcounting and common remoteproc behavior
> >   * @power: refcount of users who need this rproc powered up
> >   * @state: state of the device
> > @@ -479,6 +497,7 @@ struct rproc_dump_segment {
> >   * @table_sz: size of @cached_table
> >   * @has_iommu: flag to indicate if remote processor is behind an MMU
> >   * @auto_boot: flag to indicate if remote processor should be auto-started
> > + * @sync_with_mcu: true if currently synchronising with MCU
> >   * @dump_segments: list of segments in the firmware
> >   * @nb_vdev: number of vdev currently handled by rproc
> >   */
> > @@ -488,7 +507,8 @@ struct rproc {
> >         const char *name;
> >         char *firmware;
> >         void *priv;
> > -       struct rproc_ops *ops;
> > +       struct rproc_ops *ops, *sync_ops;
> > +       struct rproc_sync_states *sync_states;
> >         struct device dev;
> >         atomic_t power;
> >         unsigned int state;
> > @@ -512,6 +532,7 @@ struct rproc {
> >         size_t table_sz;
> >         bool has_iommu;
> >         bool auto_boot;
> > +       bool sync_with_mcu;
>
> mcu isn't good suffix here, why DSP/VSP can't start before kernel?

The term MCU is used in a generic sense throughout the patchset - it
can reflect anything that can be a remote processor.  I can easily
change it to "rproc", but I'll wait to hear from other people though.

Thanks,
Mathieu

>
> >         struct list_head dump_segments;
> >         int nb_vdev;
> >  };
> > --
> > 2.20.1
> >
