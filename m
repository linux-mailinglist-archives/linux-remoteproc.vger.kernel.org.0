Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6722419A0FB
	for <lists+linux-remoteproc@lfdr.de>; Tue, 31 Mar 2020 23:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728840AbgCaVmt (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 31 Mar 2020 17:42:49 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60890 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731320AbgCaVmt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 31 Mar 2020 17:42:49 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02VLggDd129018;
        Tue, 31 Mar 2020 16:42:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585690963;
        bh=36DNQgqXvo8Hz27GRpspE20GN3+6Gu0m9cNcPT5o+Rk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=QTPCaTs5lKlubfqkKNQMOz9wX0JLKvSzwkSmrC2UJk/RuPKEGotxp/Rj0jPdoRqBN
         xW2FbADt/H60O3HOvLG2VxOR5i2UEz3GIEtqtNPOV+w3O/GV7n5iJJjsbOvtGq5PM/
         OWBakW1mcgbzqw1olk6x1lvku8DAP34ePIPoXjno=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02VLgg7Q126193
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 31 Mar 2020 16:42:42 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 31
 Mar 2020 16:42:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 31 Mar 2020 16:42:42 -0500
Received: from [10.250.86.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02VLggri108791;
        Tue, 31 Mar 2020 16:42:42 -0500
Subject: Re: [PATCH v2 12/17] remoteproc: Rename function rproc_fw_boot()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <loic.pallardy@st.com>, <peng.fan@nxp.com>,
        <arnaud.pouliquen@st.com>, <fabien.dessenne@st.com>,
        <linux-remoteproc@vger.kernel.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-13-mathieu.poirier@linaro.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <29c93cf1-0512-5ad2-95af-fe262dd15b69@ti.com>
Date:   Tue, 31 Mar 2020 16:42:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200324214603.14979-13-mathieu.poirier@linaro.org>
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
> Renaming function rproc_fw_boot() in order to better reflect the work
> that is done when supporting scenarios where the remoteproc core is
> synchronising with an MCU.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index d57b47b0d6be..488723fcb142 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1363,7 +1363,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  /*
>   * take a firmware and boot a remote processor with it.
>   */
> -static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> +static int rproc_actuate_platform(struct rproc *rproc,
> +				  const struct firmware *fw)

Perhaps rproc_actuate_device instead of using platform and hw in the
other patch.

>  {
>  	struct device *dev = &rproc->dev;
>  	const char *name = rproc->firmware;
> @@ -1373,7 +1374,9 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	if (ret)
>  		return ret;
>  
> -	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
> +	if (!rproc_sync_with_mcu(rproc))
> +		dev_info(dev, "Booting fw image %s, size %zd\n",
> +			 name, fw->size);

Better off moving this to patch 11 since that's where you change the
behavior.

>  
>  	/*
>  	 * if enabling an IOMMU isn't relevant for this rproc, this is
> @@ -1756,7 +1759,7 @@ static int rproc_actuate(struct rproc *rproc,
>  		 firmware_p ? "powering up" : "syncing with",
>  		 rproc->name);

Also, you can move this similar "syncing with" trace from patch 10 to
patch 11.

regards
Suman

>  
> -	ret = rproc_fw_boot(rproc, firmware_p);
> +	ret = rproc_actuate_platform(rproc, firmware_p);
>  	if (ret)
>  		atomic_dec(&rproc->power);
>  
> 

