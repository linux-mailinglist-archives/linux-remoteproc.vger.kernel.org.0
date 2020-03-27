Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49B9B195BDD
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 18:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgC0RFI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 13:05:08 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:5882 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727354AbgC0RFI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 13:05:08 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RGmf8P016089;
        Fri, 27 Mar 2020 18:05:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=iiO/Y7InQ+SxAGFi1pG5H/wIYuScCFfeN72OVyMboi8=;
 b=Qgvpc+EQwHM1QxzdHPkshDZKoDrGp+IrhuMagloNQC0aL0xUcdFk+gv++tcTzLy7hXB6
 cfQg5JCae2q+2POZZ+tgato3KRHpsBQUvdMeQUrIOYQEX/wXt8rlhv9v1/cpWX7B2G+S
 0sG40daWhbsY/3VqZl9lV5OQ/UfSk65sDmDu8TEJb68sbeAWopSFSnyj6+/qBVc1G5Rh
 ICTXzsNCzPWGkXqzMzXRHwhew/CWmfcKixeSmHrq40GEgrJo7Tz4S2GRDCGdmZOXXnFy
 Oo6JfIj35CWKkSMEXtKEIvbh+CDxwxOnEz75sBiTBcEpJrgKXCbsqjj7cUftFnV7Vea2 hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw8xekqjs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 18:05:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E08CE10002A;
        Fri, 27 Mar 2020 18:05:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CEEEA2BAD19;
        Fri, 27 Mar 2020 18:05:00 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Mar
 2020 18:05:00 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 18:05:00 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH 09/11] remoteproc: stm32: Introduce new parse fw ops for
 synchronisation
Thread-Topic: [PATCH 09/11] remoteproc: stm32: Introduce new parse fw ops for
 synchronisation
Thread-Index: AQHWAigXDIRff+OCfEGOdX2sGyPGcqhcr1Kw
Date:   Fri, 27 Mar 2020 17:05:00 +0000
Message-ID: <4a653bbeb4b14c41ad2fa9eae9cb140b@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-10-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-10-mathieu.poirier@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-27_05:2020-03-27,2020-03-27 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: mardi 24 mars 2020 23:03
> To: bjorn.andersson@linaro.org
> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> Subject: [PATCH 09/11] remoteproc: stm32: Introduce new parse fw ops for
> synchronisation
>=20
> Introduce new parse firmware rproc_ops functions to be used when
> synchonising with an MCU.
>=20
> Mainly based on the work published by Arnaud Pouliquen [1].
>=20
> [1]. https://patchwork.kernel.org/project/linux-
> remoteproc/list/?series=3D239877
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Thanks Mathieu
=20
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 49
> +++++++++++++++++++++++++++++++-
>  1 file changed, 48 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index 734605a9223e..4268d71f191d 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -215,7 +215,34 @@ static int stm32_rproc_elf_load_rsc_table(struct
> rproc *rproc,
>  	return 0;
>  }
>=20
> -static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmwa=
re
> *fw)
> +static int stm32_rproc_sync_elf_load_rsc_table(struct rproc *rproc,
> +					       const struct firmware *fw)
> +{
> +	struct resource_table *table =3D NULL;
> +	struct stm32_rproc *ddata =3D rproc->priv;
> +
> +	if (ddata->rsc_va) {
> +		table =3D (struct resource_table *)ddata->rsc_va;
> +		/* Assuming that the resource table fits in 1kB is fair */
> +		rproc->cached_table =3D kmemdup(table, RSC_TBL_SIZE,
> GFP_KERNEL);
> +		if (!rproc->cached_table)
> +			return -ENOMEM;
> +
> +		rproc->table_ptr =3D rproc->cached_table;
> +		rproc->table_sz =3D RSC_TBL_SIZE;
> +		return 0;
> +	}
> +
> +	rproc->cached_table =3D NULL;
> +	rproc->table_ptr =3D NULL;
> +	rproc->table_sz =3D 0;
> +
> +	dev_warn(&rproc->dev, "no resource table found for this
> firmware\n");
> +	return 0;
> +}
> +
> +static int stm32_rproc_parse_memory_regions(struct rproc *rproc,
> +					    const struct firmware *fw)
>  {
>  	struct device *dev =3D rproc->dev.parent;
>  	struct device_node *np =3D dev->of_node;
> @@ -268,9 +295,28 @@ static int stm32_rproc_parse_fw(struct rproc *rproc,
> const struct firmware *fw)
>  		index++;
>  	}
>=20
> +	return 0;
> +}
> +
> +static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmwa=
re
> *fw)
> +{
> +	int ret =3D stm32_rproc_parse_memory_regions(rproc, fw);
> +	if (ret)
> +		return ret;
> +
>  	return stm32_rproc_elf_load_rsc_table(rproc, fw);
>  }
>=20
> +static int stm32_rproc_sync_parse_fw(struct rproc *rproc,
> +				     const struct firmware *fw)
> +{
> +	int ret =3D stm32_rproc_parse_memory_regions(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	return stm32_rproc_sync_elf_load_rsc_table(rproc, fw);
> +}
> +
>  static irqreturn_t stm32_rproc_wdg(int irq, void *data)
>  {
>  	struct platform_device *pdev =3D data;
> @@ -557,6 +603,7 @@ static __maybe_unused struct rproc_ops
> st_rproc_sync_ops =3D {
>  	.start		=3D stm32_rproc_sync_start,
>  	.stop		=3D stm32_rproc_sync_stop,
>  	.kick		=3D stm32_rproc_kick,
> +	.parse_fw	=3D stm32_rproc_sync_parse_fw,
>  };
>=20
>  static const struct of_device_id stm32_rproc_match[] =3D {
> --
> 2.20.1

