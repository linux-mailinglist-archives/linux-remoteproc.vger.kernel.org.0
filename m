Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF82F199DBB
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 20:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbgCaSIa (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 31 Mar 2020 14:08:30 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59366 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgCaSIa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 31 Mar 2020 14:08:30 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02VI8NDe032141;
        Tue, 31 Mar 2020 13:08:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585678103;
        bh=RISUDu7/3h+yHBAEuzdTAMai4rY+fQzoKzGvJXBG0GY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Ay3CBo0R6uEktjWhAHTs1ra9tDyju3kZy/9ED9JriKaD7pH7+kHdjyzfEp4Ut4IyF
         hGxlYiZ1vdM2C//rINHfxjyJVpp8Jltp7RwCxEhqY+em3DAP02KeAqKfZpOKs8ioAL
         Wp2TRYazJuE2dpHzx09ygsE0Dgupf5/FVUBvKix0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02VI8NbG082681
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 31 Mar 2020 13:08:23 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 31
 Mar 2020 13:08:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 31 Mar 2020 13:08:22 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02VI8Mdi012651;
        Tue, 31 Mar 2020 13:08:22 -0500
Subject: Re: [PATCH v2 13/17] remoteproc: Introducting new functions to start
 and stop an MCU
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <loic.pallardy@st.com>, <peng.fan@nxp.com>,
        <arnaud.pouliquen@st.com>, <fabien.dessenne@st.com>,
        <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-14-mathieu.poirier@linaro.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <160253ad-1be1-f8ea-573d-5a73af25b0c7@ti.com>
Date:   Tue, 31 Mar 2020 13:08:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200324214603.14979-14-mathieu.poirier@linaro.org>
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
> Add new functions to replace direct calling of rproc->ops->start() and
> rproc->ops->stop().  That way different behaviour can be played out
> when booting an MCU or synchronising with it.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c     |  6 +++---
>  drivers/remoteproc/remoteproc_internal.h | 12 ++++++++++++
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 488723fcb142..d3c4d7e6ca25 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1330,7 +1330,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	}
>  
>  	/* power up the remote processor */
> -	ret = rproc->ops->start(rproc);
> +	ret = rproc_start_hw(rproc);
>  	if (ret) {
>  		dev_err(dev, "can't start rproc %s: %d\n", rproc->name, ret);
>  		goto unprepare_subdevices;
> @@ -1351,7 +1351,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	return 0;
>  
>  stop_rproc:
> -	rproc->ops->stop(rproc);
> +	rproc_stop_hw(rproc);
>  unprepare_subdevices:
>  	rproc_unprepare_subdevices(rproc);
>  reset_table_ptr:
> @@ -1485,7 +1485,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  	rproc->table_ptr = rproc->cached_table;
>  
>  	/* power off the remote processor */
> -	ret = rproc->ops->stop(rproc);
> +	ret = rproc_stop_hw(rproc);
>  	if (ret) {
>  		dev_err(dev, "can't stop rproc: %d\n", ret);
>  		return ret;
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 5f711ceb97ba..7ca23d46dfd4 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -160,4 +160,16 @@ struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
>  	return NULL;
>  }
>  
> +static inline int rproc_start_hw(struct rproc *rproc)
> +{
> +	RPROC_OPS_HELPER(start, rproc);
> +	return -EINVAL;
> +}
> +
> +static inline int rproc_stop_hw(struct rproc *rproc)
> +{
> +	RPROC_OPS_HELPER(stop, rproc);
> +	return -EINVAL;
> +}

Since we already have the concept of subdevices, how about we call these
rproc_{start/stop}_device?

regards
Suman

> +
>  #endif /* REMOTEPROC_INTERNAL_H */
> 

