Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C882B195BBB
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 17:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbgC0Q7a (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 12:59:30 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:10514 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727620AbgC0Q73 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 12:59:29 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RGmf7j016089;
        Fri, 27 Mar 2020 17:59:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=PyUGFxum6RGSvBdVl1HhhMGh82FNzYF9cX5yNQC9zfk=;
 b=YsbbteGn70CqFXb8RE0EJ0oUp4IsOgyKnaxW+/orQ/DhQzHr1bF9GFbBxvbGWCUfLgGd
 9/Uma86tgbh8Z1pZWI6smH4kD/vXdu/z/zgucrs1Hq/tc3KgEfZBpTYaD4ls0Fmft7aA
 lci57l6Xk5jzYQ2ZfmzSrhtFgXT2yKfzs0Lxayl6/5Yo5ItlJVOQX1ittYGppq9UalYD
 DDnaDcY4dZg41KclBqcKlbJ/pwhV8xeSFbFjrBYXlJ4H/ip2UuwnEXjw8L+rY+/Iipg0
 dk58eWt694ERajqzNUVrB1tu2RlprNgJ21HEy20rBeM7msTj/S41nV5Kr7j8rP2HsCrd yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw8xekpq4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 17:59:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 17F8C10002A;
        Fri, 27 Mar 2020 17:59:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D0472BAD06;
        Fri, 27 Mar 2020 17:59:19 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 27 Mar
 2020 17:59:18 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 17:59:18 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH 07/11] remoteproc: stm32: Get loaded resource table for
 synchronisation
Thread-Topic: [PATCH 07/11] remoteproc: stm32: Get loaded resource table for
 synchronisation
Thread-Index: AQHWAigV7g53CyZWV0Wrm9vbdanNGahcrZeg
Date:   Fri, 27 Mar 2020 16:59:18 +0000
Message-ID: <8b7a87e685d84b588254b54b5ace5d22@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-8-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-8-mathieu.poirier@linaro.org>
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
> Subject: [PATCH 07/11] remoteproc: stm32: Get loaded resource table for
> synchronisation
>=20
> Get the resource table location when synchronising with the M4 so
> that the remoteproc and rpmsg subsystem can be initialised properly.
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
>  drivers/remoteproc/stm32_rproc.c | 66
> ++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index b8af15dd0510..5bac0baf8f4c 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -87,6 +87,7 @@ struct stm32_rproc {
>  	struct stm32_mbox mb[MBOX_NB_MBX];
>  	struct workqueue_struct *workqueue;
>  	bool secured_soc;
> +	void __iomem *rsc_va;
>  };
>=20
>  static int stm32_rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64
> *da)
> @@ -654,6 +655,65 @@ static int stm32_rproc_get_m4_status(struct
> stm32_rproc *ddata,
>  	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg,
> state);
>  }
>=20
> +static int stm32_rproc_da_to_pa(struct platform_device *pdev,
> +				struct stm32_rproc *ddata,
> +				u64 da, phys_addr_t *pa)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct stm32_rproc_mem *p_mem;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ddata->nb_rmems; i++) {
> +		p_mem =3D &ddata->rmems[i];
> +
> +		if (da < p_mem->dev_addr ||
> +		    da >=3D p_mem->dev_addr + p_mem->size)
> +			continue;
> +
> +		*pa =3D da - p_mem->dev_addr + p_mem->bus_addr;
> +		dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
> +
> +		return 0;
> +	}
> +
> +	dev_err(dev, "can't translate da %llx\n", da);
> +
> +	return -EINVAL;
> +}
> +
> +static int stm32_rproc_get_loaded_rsc_table(struct platform_device
> *pdev,
> +					    struct stm32_rproc *ddata)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	phys_addr_t rsc_pa;
> +	u32 rsc_da;
> +	int err;
> +
> +	err =3D regmap_read(ddata->rsctbl.map, ddata->rsctbl.reg, &rsc_da);
> +	if (err) {
> +		dev_err(dev, "failed to read rsc tbl addr\n");
> +		return err;
> +	}
> +
> +	if (!rsc_da)
> +		/* no rsc table */
> +		return 0;
> +
> +	err =3D stm32_rproc_da_to_pa(pdev, ddata, rsc_da, &rsc_pa);
> +	if (err)
> +		return err;
> +
> +	ddata->rsc_va =3D devm_ioremap_wc(dev, rsc_pa, RSC_TBL_SIZE);
> +	if (IS_ERR_OR_NULL(ddata->rsc_va)) {
> +		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> +			&rsc_pa, RSC_TBL_SIZE);
> +		ddata->rsc_va =3D NULL;
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
>  static int stm32_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -689,6 +749,12 @@ static int stm32_rproc_probe(struct platform_device
> *pdev)
>  		state =3D M4_STATE_OFF;
>  	}
>=20
> +	if (state =3D=3D M4_STATE_CRUN) {
> +		ret =3D stm32_rproc_get_loaded_rsc_table(pdev, ddata);
> +		if (ret)
> +			goto free_ddata;
> +	}
> +
>  	rproc =3D rproc_alloc(dev, np->name, &st_rproc_ops, NULL,
> sizeof(*ddata));
>  	if (!rproc) {
>  		ret =3D -ENOMEM;
> --
> 2.20.1

