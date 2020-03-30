Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34F0719845F
	for <lists+linux-remoteproc@lfdr.de>; Mon, 30 Mar 2020 21:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgC3TYd (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 15:24:33 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58318 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgC3TYd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 15:24:33 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02UJOKQB077095;
        Mon, 30 Mar 2020 14:24:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585596260;
        bh=0ZXo6yZgGN4aC9w51NhXeNCQ9tqzbWrNxIWzNIBIi2I=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=YhXCaK2BPeZCiIq8KdBAQkBbyT+TQNcPZaFzQz98HPf37Ly8IIzZsSBUrBZoL0WQq
         fJVUIiFOG8LmHXq62ryXn0jCfxuuhzkP7tItvWgqklQ45Qw3anjcx4ItkYsU4X+J9s
         FpD7m9aak+J77f0qwoWqHCZ/C81oqX+Gnui/XYBs=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02UJOJ1H067489
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Mar 2020 14:24:20 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Mar 2020 14:24:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Mar 2020 14:24:19 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02UJOJIs100534;
        Mon, 30 Mar 2020 14:24:19 -0500
Subject: Re: [PATCH 01/18] remoteproc: Add new operation and state machine for
 MCU synchronisation
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Xiang Xiao <xiaoxiang781216@gmail.com>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Ohad Ben Cohen <ohad@wizery.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        Peng Fan <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien Dessenne <fabien.dessenne@st.com>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
 <20200312221158.3613-2-mathieu.poirier@linaro.org>
 <CAH2Cfb8jkMtdJ0oUNWQ4Bbsybrkb4z_0kP8UH6tYkEB6peZ56g@mail.gmail.com>
 <CANLsYkx2La2G_L0Cq7JB+SQYeueufcMvyHG4AZQQ3p-1AzFpoA@mail.gmail.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <6ff5e60a-a48d-1783-eb98-57ec568f7683@ti.com>
Date:   Mon, 30 Mar 2020 14:24:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CANLsYkx2La2G_L0Cq7JB+SQYeueufcMvyHG4AZQQ3p-1AzFpoA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 3/13/20 10:01 AM, Mathieu Poirier wrote:
> Hi Xiao,
> 
> On Thu, 12 Mar 2020 at 20:04, Xiang Xiao <xiaoxiang781216@gmail.com> wrote:
>>
>> On Fri, Mar 13, 2020 at 6:12 AM Mathieu Poirier
>> <mathieu.poirier@linaro.org> wrote:
>>>
>>> Add a new rproc_ops sync_ops to support use cases where the remoteproc
>>> core is synchronisting with the MCU.  When exactly to use the sync_ops is
>>> directed by the states in struct rproc_sync_states.
>>>
>>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> ---
>>>  drivers/remoteproc/remoteproc_debugfs.c  | 31 ++++++++++++++++++++++++
>>>  drivers/remoteproc/remoteproc_internal.h |  5 ++++
>>>  include/linux/remoteproc.h               | 23 +++++++++++++++++-
>>>  3 files changed, 58 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
>>> index dd93cf04e17f..187bcc67f997 100644
>>> --- a/drivers/remoteproc/remoteproc_debugfs.c
>>> +++ b/drivers/remoteproc/remoteproc_debugfs.c
>>> @@ -311,6 +311,35 @@ static const struct file_operations rproc_carveouts_ops = {
>>>         .release        = single_release,
>>>  };
>>>
>>> +/* Expose synchronisation states via debugfs */
>>> +static int rproc_sync_states_show(struct seq_file *seq, void *p)
>>> +{
>>> +       struct rproc *rproc = seq->private;
>>> +
>>> +       seq_printf(seq, "Sync with MCU: %s\n",
>>> +                  rproc->sync_with_mcu ? "true" : "false");
>>> +       seq_printf(seq, "On init: %s\n",
>>> +                  rproc->sync_states->on_init ? "true" : "false");
>>> +       seq_printf(seq, "After stop: %s\n",
>>> +                  rproc->sync_states->after_stop ? "true" : "false");
>>> +       seq_printf(seq, "After crash: %s\n",
>>> +                  rproc->sync_states->after_crash ? "true" : "false");
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int rproc_sync_states_open(struct inode *inode, struct file *file)
>>> +{
>>> +       return single_open(file, rproc_sync_states_show, inode->i_private);
>>> +}
>>> +
>>> +static const struct file_operations rproc_sync_states_ops = {
>>> +       .open           = rproc_sync_states_open,
>>> +       .read           = seq_read,
>>> +       .llseek         = seq_lseek,
>>> +       .release        = single_release,
>>> +};
>>> +
>>>  void rproc_remove_trace_file(struct dentry *tfile)
>>>  {
>>>         debugfs_remove(tfile);
>>> @@ -357,6 +386,8 @@ void rproc_create_debug_dir(struct rproc *rproc)
>>>                             rproc, &rproc_rsc_table_ops);
>>>         debugfs_create_file("carveout_memories", 0400, rproc->dbg_dir,
>>>                             rproc, &rproc_carveouts_ops);
>>> +       debugfs_create_file("sync_states", 0400, rproc->dbg_dir,
>>> +                           rproc, &rproc_sync_states_ops);
>>>  }
>>>
>>>  void __init rproc_init_debugfs(void)
>>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>>> index 493ef9262411..5c93de5e00bb 100644
>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>> @@ -63,6 +63,11 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
>>>  struct rproc_mem_entry *
>>>  rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
>>>
>>> +static inline bool rproc_sync_with_mcu(struct rproc *rproc)
>>> +{
>>> +       return rproc->sync_with_mcu;
>>> +}
>>> +
>>>  static inline
>>>  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
>>>  {
>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>> index 16ad66683ad0..d115e47d702d 100644
>>> --- a/include/linux/remoteproc.h
>>> +++ b/include/linux/remoteproc.h
>>> @@ -353,6 +353,21 @@ enum rsc_handling_status {
>>>         RSC_IGNORED     = 1,
>>>  };
>>>
>>> +/**
>>> + * struct rproc_sync_states - platform specific states indicating which
>>> + *                           rproc_ops to use at specific times during
>>> + *                           the MCU lifecycle.
>>> + * @on_init: true if synchronising with MCU at system initialisation time
>>> + * @after_stop: true if synchronising with MCU after stopped from the
>>> + *             command line
>>> + * @after_crash: true if synchonising with MCU after the MCU has crashed
>>> + */
>>> +struct rproc_sync_states {
>>> +       bool on_init;
>>> +       bool after_stop;
>>> +       bool after_crash;
>>> +};
>>> +
>>>  /**
>>>   * struct rproc_ops - platform-specific device handlers
>>>   * @start:     power on the device and boot it
>>> @@ -456,6 +471,9 @@ struct rproc_dump_segment {
>>>   * @firmware: name of firmware file to be loaded
>>>   * @priv: private data which belongs to the platform-specific rproc module
>>>   * @ops: platform-specific start/stop rproc handlers
>>> + * @sync_ops: paltform-specific start/stop rproc handlers when
>>> + *           synchronising with a remote processor.
>>> + * @sync_states: Determine the rproc_ops to choose in specific states.
>>>   * @dev: virtual device for refcounting and common remoteproc behavior
>>>   * @power: refcount of users who need this rproc powered up
>>>   * @state: state of the device
>>> @@ -479,6 +497,7 @@ struct rproc_dump_segment {
>>>   * @table_sz: size of @cached_table
>>>   * @has_iommu: flag to indicate if remote processor is behind an MMU
>>>   * @auto_boot: flag to indicate if remote processor should be auto-started
>>> + * @sync_with_mcu: true if currently synchronising with MCU
>>>   * @dump_segments: list of segments in the firmware
>>>   * @nb_vdev: number of vdev currently handled by rproc
>>>   */
>>> @@ -488,7 +507,8 @@ struct rproc {
>>>         const char *name;
>>>         char *firmware;
>>>         void *priv;
>>> -       struct rproc_ops *ops;
>>> +       struct rproc_ops *ops, *sync_ops;
>>> +       struct rproc_sync_states *sync_states;
>>>         struct device dev;
>>>         atomic_t power;
>>>         unsigned int state;
>>> @@ -512,6 +532,7 @@ struct rproc {
>>>         size_t table_sz;
>>>         bool has_iommu;
>>>         bool auto_boot;
>>> +       bool sync_with_mcu;
>>
>> mcu isn't good suffix here, why DSP/VSP can't start before kernel?
> 
> The term MCU is used in a generic sense throughout the patchset - it
> can reflect anything that can be a remote processor.  I can easily
> change it to "rproc", but I'll wait to hear from other people though.

Yeah, let's not introduce another term for rproc and cause the code to fork.

regards
Suman

> 
> Thanks,
> Mathieu
> 
>>
>>>         struct list_head dump_segments;
>>>         int nb_vdev;
>>>  };
>>> --
>>> 2.20.1
>>>

