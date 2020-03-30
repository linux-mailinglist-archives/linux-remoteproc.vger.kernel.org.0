Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B79B31987A2
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 00:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728880AbgC3Wzn (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 18:55:43 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59514 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgC3Wzm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 18:55:42 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02UMtaVK045171;
        Mon, 30 Mar 2020 17:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585608936;
        bh=oHpfdPfRh+9am9cE5dhxTL5hifNWypcMy6aJZKLe8xI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ZFW4KfydO+MGIWhohx18gL/71tUDCFQR6iPkRT9/Yyboim5oUOLu0t+My0XS6EPNR
         6f2yQKgqQnGYNKnggbOxnF7AACWhwwW9KyAxVU6/F7LkM3Ta0kjfiNKKBh/F28/Adr
         lF4jg7UeP+zHHua/KwEQVCk9FkSwP6wZcwnkOBW0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02UMtalt011601
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Mar 2020 17:55:36 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Mar 2020 17:55:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Mar 2020 17:55:35 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02UMtZP9011397;
        Mon, 30 Mar 2020 17:55:35 -0500
Subject: Re: [PATCH v2 02/17] remoteproc: Introduce function
 rproc_set_mcu_sync_state()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <loic.pallardy@st.com>, <peng.fan@nxp.com>,
        <arnaud.pouliquen@st.com>, <fabien.dessenne@st.com>,
        <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-3-mathieu.poirier@linaro.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <1ae43f43-33b9-94aa-06a4-771780c6d7aa@ti.com>
Date:   Mon, 30 Mar 2020 17:55:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200324214603.14979-3-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 3/24/20 4:45 PM, Mathieu Poirier wrote:
> Introduce function rproc_set_mcu_sync_state() to set the synchronisation
> state of the MCU at various stages of the lifecycle process.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_internal.h | 38 ++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 5c93de5e00bb..73ea32df0156 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -24,6 +24,26 @@ struct rproc_debug_trace {
>  	struct rproc_mem_entry trace_mem;
>  };
>  
> +/*
> + * enum rproc_sync_states - remote processsor sync states
> + * @RPROC_SYNC_STATE_INIT	state to use when the remoteproc core
> + *				is initialising.
> + * @RPROC_SYNC_STATE_SHUTDOWN	state to use after the remoteproc core
> + *				has shutdown (rproc_shutdown()) the MCU.
> + * @RPROC_SYNC_STATE_CRASHED	state to use after the MCU has crashed but
> + *				has not been recovered by the remoteproc
> + *				core yet.
> + *
> + * Keeping these separate from the enum rproc_state in order to avoid
> + * introducing coupling between the state of the MCU and the synchronisation
> + * operation to use.
> + */
> +enum rproc_mcu_sync_states {
> +	RPROC_SYNC_STATE_INIT,
> +	RPROC_SYNC_STATE_SHUTDOWN,
> +	RPROC_SYNC_STATE_CRASHED,
> +};
> +

Perhaps rename the enum as rproc_sync_state

>  /* from remoteproc_core.c */
>  void rproc_release(struct kref *kref);
>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
> @@ -68,6 +88,24 @@ static inline bool rproc_sync_with_mcu(struct rproc *rproc)
>  	return rproc->sync_with_mcu;
>  }
>  
> +static inline void rproc_set_mcu_sync_state(struct rproc *rproc,
> +					    unsigned int state)

Change the argument type to the above enum, and perhaps rename the
function to use flags instead of state.

regards
Suman


> +{
> +	switch (state) {
> +	case RPROC_SYNC_STATE_INIT:
> +		rproc->sync_with_mcu = rproc->sync_states->on_init;
> +		break;
> +	case RPROC_SYNC_STATE_SHUTDOWN:
> +		rproc->sync_with_mcu = rproc->sync_states->after_stop;
> +		break;
> +	case RPROC_SYNC_STATE_CRASHED:
> +		rproc->sync_with_mcu = rproc->sync_states->after_crash;
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>  static inline
>  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  {
> 

