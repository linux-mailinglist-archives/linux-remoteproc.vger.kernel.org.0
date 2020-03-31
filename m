Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30CE219A150
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 23:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731367AbgCaVwU (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 31 Mar 2020 17:52:20 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52976 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731362AbgCaVwU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 31 Mar 2020 17:52:20 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02VLqE22084459;
        Tue, 31 Mar 2020 16:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585691534;
        bh=0vm5ISbQOYRD6UgoI9gVy+huiajf7vtsMV43bzzrgX8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=FaHOBj1q/ocfWRhCJVCN31fjhqJ4FgrHmsLU2ai1K+NMlZ/DwbG0Jz9F4giY91pEz
         JhOCbJrS3ziQW63up2FUqWiyiSbdXgWLz2UYKG26e8K73SKoIcLiSiu6EDsUHVsqvW
         KQKYcUo8MDR7egkArrUDwRpF4RnKqXSIoyLynpXc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02VLqDm1078590
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 31 Mar 2020 16:52:13 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 31
 Mar 2020 16:52:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 31 Mar 2020 16:52:13 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02VLqDDV015636;
        Tue, 31 Mar 2020 16:52:13 -0500
Subject: Re: [PATCH v2 14/17] remoteproc: Refactor function
 rproc_trigger_recovery()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <loic.pallardy@st.com>, <peng.fan@nxp.com>,
        <arnaud.pouliquen@st.com>, <fabien.dessenne@st.com>,
        <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-15-mathieu.poirier@linaro.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <2b052de0-baf3-f474-152b-a71e1284852f@ti.com>
Date:   Tue, 31 Mar 2020 16:52:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200324214603.14979-15-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 3/24/20 4:46 PM, Mathieu Poirier wrote:
> Refactor function rproc_trigger_recovery() in order to avoid
> reloading the fw image when synchronising with an MCU rather than
> booting it.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index d3c4d7e6ca25..dbb0a8467205 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1661,7 +1661,7 @@ static void rproc_coredump(struct rproc *rproc)
>   */
>  int rproc_trigger_recovery(struct rproc *rproc)
>  {
> -	const struct firmware *firmware_p;
> +	const struct firmware *firmware_p = NULL;
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
> @@ -1678,14 +1678,16 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  	/* generate coredump */
>  	rproc_coredump(rproc);
>  
> -	/* load firmware */
> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> -	if (ret < 0) {
> -		dev_err(dev, "request_firmware failed: %d\n", ret);
> -		goto unlock_mutex;
> +	/* load firmware if need be */
> +	if (!rproc_sync_with_mcu(rproc)) {
> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
> +		if (ret < 0) {
> +			dev_err(dev, "request_firmware failed: %d\n", ret);
> +			goto unlock_mutex;
> +		}

So, I am trying to understand the need for the flag around
RPROC_SYNC_STATE_CRASHED. Can you explain what all usecases that is
covering?

In anycase, you should probably combine this piece with the flag change
for STATE_CRASHED on the last patch.

regards
Suman

>  	}
>  
> -	/* boot the remote processor up again */
> +	/* boot up or synchronise with the remote processor again */
>  	ret = rproc_start(rproc, firmware_p);
>  
>  	release_firmware(firmware_p);
> 

