Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3103B183EEE
	for <lists+linux-remoteproc@lfdr.de>; Fri, 13 Mar 2020 03:04:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgCMCEK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 12 Mar 2020 22:04:10 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:45899 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgCMCEK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 22:04:10 -0400
Received: by mail-qk1-f194.google.com with SMTP id c145so9964248qke.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 19:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JvB0bH2bqfpVh+di/rVF1OH+9fKRfbO8e7XXbmWMp1Q=;
        b=UjmHZ90F2e80yQE5Jy6pdDfmXa3GhNSBk1hOMiUL1ebkm0DZZS/DvvQBh9MH5lIsy+
         WlDgedbtT9Bjxe0ZYqFsjfKpawVRIBQVF+KYLnyVsX5lzmTCdjpWpRcL0XrEYtdK1Gu3
         Y4Z8I2KbGt8J3UXvooB1Yplhf6TEw1LF/XGJH+vpc1thcsfgO+OQX/p0iT1Jij+g/+qh
         oC0pXUyaFY3AxGmIDt0ffi3oeX6g6txyhUVHXLkCSiqAM0iEZtyntLhQbjWfIa11kxHi
         HsdCe6QUECiDcioZ/DL8S2SJ8Gc3t58HVNa45PzbF4X3f63QX9UI4/1rkoupiAoINzGd
         YJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JvB0bH2bqfpVh+di/rVF1OH+9fKRfbO8e7XXbmWMp1Q=;
        b=hOVhHR2e0Omj/D09NdfUOc45xYZz8ujIr8D6lQsNh3cr6bkdARHCAJ3ETLiStiVs0O
         JFCd/a9zNr4QKCS/RzVxO3SlgnuuopeiDZdkj/nSjwfAUNExtNcfAmFH/EQbVpsWd0Gs
         BW3y71NCwOedjzcnU3vlepPmCETJsJI2zNu9pf3NbERFGovhKEXtjPcrAgpNnK/4HC4f
         XecaU/1rh+E6H4v1gFGKC8pN73mHXHdJTLiDw5vcyVaRCgXI9HsteCDtMoWqSCfa7oSK
         KZL1x0VH5AtlYNOrJCboyv1kyJmF5NO65+WgeEhMCM6ZoVucV6L2cDwFd9odInS8nnQE
         GjCQ==
X-Gm-Message-State: ANhLgQ0Vv7edG7EQsgACyMUVKtHdLDQoPcTee4Uy11D+gY4VdPPQD1o3
        58APQaYl29U7ROX/pgMFbE3pgDXRT99DWygRdSg=
X-Google-Smtp-Source: ADFU+vvP093Qp/lp7gztx2A/wYs7B4uc8iy6SrJ/dUeLbWLtkOBCa7MdV5Pz6N3QwecuUAFMDvunSLaQivLw4AKVcQE=
X-Received: by 2002:a37:987:: with SMTP id 129mr10961225qkj.83.1584065049168;
 Thu, 12 Mar 2020 19:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200312221158.3613-1-mathieu.poirier@linaro.org> <20200312221158.3613-2-mathieu.poirier@linaro.org>
In-Reply-To: <20200312221158.3613-2-mathieu.poirier@linaro.org>
From:   Xiang Xiao <xiaoxiang781216@gmail.com>
Date:   Fri, 13 Mar 2020 10:03:57 +0800
Message-ID: <CAH2Cfb8jkMtdJ0oUNWQ4Bbsybrkb4z_0kP8UH6tYkEB6peZ56g@mail.gmail.com>
Subject: Re: [PATCH 01/18] remoteproc: Add new operation and state machine for
 MCU synchronisation
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, Ohad Ben Cohen <ohad@wizery.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        Suman Anna <s-anna@ti.com>, peng.fan@nxp.com,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien Dessenne <fabien.dessenne@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Mar 13, 2020 at 6:12 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Add a new rproc_ops sync_ops to support use cases where the remoteproc
> core is synchronisting with the MCU.  When exactly to use the sync_ops is
> directed by the states in struct rproc_sync_states.
>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_debugfs.c  | 31 ++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_internal.h |  5 ++++
>  include/linux/remoteproc.h               | 23 +++++++++++++++++-
>  3 files changed, 58 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index dd93cf04e17f..187bcc67f997 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -311,6 +311,35 @@ static const struct file_operations rproc_carveouts_ops = {
>         .release        = single_release,
>  };
>
> +/* Expose synchronisation states via debugfs */
> +static int rproc_sync_states_show(struct seq_file *seq, void *p)
> +{
> +       struct rproc *rproc = seq->private;
> +
> +       seq_printf(seq, "Sync with MCU: %s\n",
> +                  rproc->sync_with_mcu ? "true" : "false");
> +       seq_printf(seq, "On init: %s\n",
> +                  rproc->sync_states->on_init ? "true" : "false");
> +       seq_printf(seq, "After stop: %s\n",
> +                  rproc->sync_states->after_stop ? "true" : "false");
> +       seq_printf(seq, "After crash: %s\n",
> +                  rproc->sync_states->after_crash ? "true" : "false");
> +
> +       return 0;
> +}
> +
> +static int rproc_sync_states_open(struct inode *inode, struct file *file)
> +{
> +       return single_open(file, rproc_sync_states_show, inode->i_private);
> +}
> +
> +static const struct file_operations rproc_sync_states_ops = {
> +       .open           = rproc_sync_states_open,
> +       .read           = seq_read,
> +       .llseek         = seq_lseek,
> +       .release        = single_release,
> +};
> +
>  void rproc_remove_trace_file(struct dentry *tfile)
>  {
>         debugfs_remove(tfile);
> @@ -357,6 +386,8 @@ void rproc_create_debug_dir(struct rproc *rproc)
>                             rproc, &rproc_rsc_table_ops);
>         debugfs_create_file("carveout_memories", 0400, rproc->dbg_dir,
>                             rproc, &rproc_carveouts_ops);
> +       debugfs_create_file("sync_states", 0400, rproc->dbg_dir,
> +                           rproc, &rproc_sync_states_ops);
>  }
>
>  void __init rproc_init_debugfs(void)
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 493ef9262411..5c93de5e00bb 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -63,6 +63,11 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
>  struct rproc_mem_entry *
>  rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
>
> +static inline bool rproc_sync_with_mcu(struct rproc *rproc)
> +{
> +       return rproc->sync_with_mcu;
> +}
> +
>  static inline
>  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  {
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 16ad66683ad0..d115e47d702d 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -353,6 +353,21 @@ enum rsc_handling_status {
>         RSC_IGNORED     = 1,
>  };
>
> +/**
> + * struct rproc_sync_states - platform specific states indicating which
> + *                           rproc_ops to use at specific times during
> + *                           the MCU lifecycle.
> + * @on_init: true if synchronising with MCU at system initialisation time
> + * @after_stop: true if synchronising with MCU after stopped from the
> + *             command line
> + * @after_crash: true if synchonising with MCU after the MCU has crashed
> + */
> +struct rproc_sync_states {
> +       bool on_init;
> +       bool after_stop;
> +       bool after_crash;
> +};
> +
>  /**
>   * struct rproc_ops - platform-specific device handlers
>   * @start:     power on the device and boot it
> @@ -456,6 +471,9 @@ struct rproc_dump_segment {
>   * @firmware: name of firmware file to be loaded
>   * @priv: private data which belongs to the platform-specific rproc module
>   * @ops: platform-specific start/stop rproc handlers
> + * @sync_ops: paltform-specific start/stop rproc handlers when
> + *           synchronising with a remote processor.
> + * @sync_states: Determine the rproc_ops to choose in specific states.
>   * @dev: virtual device for refcounting and common remoteproc behavior
>   * @power: refcount of users who need this rproc powered up
>   * @state: state of the device
> @@ -479,6 +497,7 @@ struct rproc_dump_segment {
>   * @table_sz: size of @cached_table
>   * @has_iommu: flag to indicate if remote processor is behind an MMU
>   * @auto_boot: flag to indicate if remote processor should be auto-started
> + * @sync_with_mcu: true if currently synchronising with MCU
>   * @dump_segments: list of segments in the firmware
>   * @nb_vdev: number of vdev currently handled by rproc
>   */
> @@ -488,7 +507,8 @@ struct rproc {
>         const char *name;
>         char *firmware;
>         void *priv;
> -       struct rproc_ops *ops;
> +       struct rproc_ops *ops, *sync_ops;
> +       struct rproc_sync_states *sync_states;
>         struct device dev;
>         atomic_t power;
>         unsigned int state;
> @@ -512,6 +532,7 @@ struct rproc {
>         size_t table_sz;
>         bool has_iommu;
>         bool auto_boot;
> +       bool sync_with_mcu;

mcu isn't good suffix here, why DSP/VSP can't start before kernel?

>         struct list_head dump_segments;
>         int nb_vdev;
>  };
> --
> 2.20.1
>
