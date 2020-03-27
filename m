Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14DFF195BAB
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 17:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgC0QzQ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 12:55:16 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:57970 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726900AbgC0QzQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 12:55:16 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RGmC22017867;
        Fri, 27 Mar 2020 17:55:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=PpwACOJ4/49g+7wLzlhyU5EgsXsiQpQyGu/G6MdXPGA=;
 b=s/E4c+i3UwxZULXZzZ33hadgJ2aiaG12NxQqWxH9NQKaVGoKOUR6fvC60Q+cNRYhYEtr
 lD4DnnN8DZC4Ua3zggTrK7+ofYFokOBuajg/Jl78zPiZzMVnzMRsTkYcIpeyeHxL7Nq7
 wX+mOihqhYIKTCDTt4WMaIfHRGZndFbJpWapKSjZfKW/6kf4F9SbJ9DiBHrAh3vD5LVH
 IsvVobjk3IF5qfgz7pH0GcWDIqgv3yYGrYB2d1t7VuLWxvWzr5aonZ6O5lIfRXqO/Krc
 ZIckUAb2spRmewoagvbntY1V6x+bpvrbQhyXa/ZAD8H5ovNtiSPxlVHl9u2STrMEp9Xm jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw9963a4v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 17:55:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE86610002A;
        Fri, 27 Mar 2020 17:55:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9E55E2BAD02;
        Fri, 27 Mar 2020 17:55:05 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Mar
 2020 17:55:05 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 17:55:05 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH 03/11] remoteproc: stm32: Decouple rproc from DT parsing
Thread-Topic: [PATCH 03/11] remoteproc: stm32: Decouple rproc from DT parsing
Thread-Index: AQHWAigTr6jUzZ8TmUa/gYSESIM45qhcrJEQ
Date:   Fri, 27 Mar 2020 16:55:05 +0000
Message-ID: <a50f5a353dc74718b30c9cda861e1854@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-4-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-4-mathieu.poirier@linaro.org>
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
> Subject: [PATCH 03/11] remoteproc: stm32: Decouple rproc from DT parsing
>=20
> Remove the remote processor from the process of parsing the device tree
> since (1) there is no correlation between them and (2) to use the
> information that was gathered to make a decision on whether to
> synchronise with the MCU or not.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Thanks Mathieu
=20
Reviewed-by: Loic Pallardy <loic.pallardy@st.com> =20

> ---
>  drivers/remoteproc/stm32_rproc.c | 38 +++++++++++++++++++++-----------
>  1 file changed, 25 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index 0c1f0b84e057..ca60c917e218 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -538,12 +538,11 @@ static int stm32_rproc_get_syscon(struct
> device_node *np, const char *prop,
>  	return err;
>  }
>=20
> -static int stm32_rproc_parse_dt(struct platform_device *pdev)
> +static int stm32_rproc_parse_dt(struct platform_device *pdev,
> +				struct stm32_rproc *ddata, bool *auto_boot)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct device_node *np =3D dev->of_node;
> -	struct rproc *rproc =3D platform_get_drvdata(pdev);
> -	struct stm32_rproc *ddata =3D rproc->priv;
>  	struct stm32_syscon tz;
>  	unsigned int tzen;
>  	int err, irq;
> @@ -589,7 +588,7 @@ static int stm32_rproc_parse_dt(struct
> platform_device *pdev)
>=20
>  	err =3D regmap_read(tz.map, tz.reg, &tzen);
>  	if (err) {
> -		dev_err(&rproc->dev, "failed to read tzen\n");
> +		dev_err(dev, "failed to read tzen\n");
>  		return err;
>  	}
>  	ddata->secured_soc =3D tzen & tz.mask;
> @@ -605,7 +604,7 @@ static int stm32_rproc_parse_dt(struct
> platform_device *pdev)
>  	if (err)
>  		dev_warn(dev, "failed to get pdds\n");
>=20
> -	rproc->auto_boot =3D of_property_read_bool(np, "st,auto-boot");
> +	*auto_boot =3D of_property_read_bool(np, "st,auto-boot");
>=20
>  	return stm32_rproc_of_memory_translations(pdev, ddata);
>  }
> @@ -616,18 +615,29 @@ static int stm32_rproc_probe(struct
> platform_device *pdev)
>  	struct stm32_rproc *ddata;
>  	struct device_node *np =3D dev->of_node;
>  	struct rproc *rproc;
> +	bool auto_boot =3D false;
>  	int ret;
>=20
>  	ret =3D dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
>  	if (ret)
>  		return ret;
>=20
> -	rproc =3D rproc_alloc(dev, np->name, &st_rproc_ops, NULL,
> sizeof(*ddata));
> -	if (!rproc)
> +	ddata =3D kzalloc(sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
>  		return -ENOMEM;
>=20
> +	ret =3D stm32_rproc_parse_dt(pdev, ddata, &auto_boot);
> +	if (ret)
> +		goto free_ddata;
> +
> +	rproc =3D rproc_alloc(dev, np->name, &st_rproc_ops, NULL,
> sizeof(*ddata));
> +	if (!rproc) {
> +		ret =3D -ENOMEM;
> +		goto free_ddata;
> +	}
> +
> +	rproc->auto_boot =3D auto_boot;
>  	rproc->has_iommu =3D false;
> -	ddata =3D rproc->priv;
>  	ddata->workqueue =3D create_workqueue(dev_name(dev));
>  	if (!ddata->workqueue) {
>  		dev_err(dev, "cannot create workqueue\n");
> @@ -635,20 +645,20 @@ static int stm32_rproc_probe(struct
> platform_device *pdev)
>  		goto free_rproc;
>  	}
>=20
> -	platform_set_drvdata(pdev, rproc);
> +	memcpy(rproc->priv, ddata, sizeof(*ddata));
>=20
> -	ret =3D stm32_rproc_parse_dt(pdev);
> -	if (ret)
> -		goto free_wkq;
> +	platform_set_drvdata(pdev, rproc);
>=20
>  	ret =3D stm32_rproc_request_mbox(rproc);
>  	if (ret)
> -		goto free_rproc;
> +		goto free_wkq;
>=20
>  	ret =3D rproc_add(rproc);
>  	if (ret)
>  		goto free_mb;
>=20
> +	kfree(ddata);
> +
>  	return 0;
>=20
>  free_mb:
> @@ -661,6 +671,8 @@ static int stm32_rproc_probe(struct platform_device
> *pdev)
>  		device_init_wakeup(dev, false);
>  	}
>  	rproc_free(rproc);
> +free_ddata:
> +	kfree(ddata);
>  	return ret;
>  }
>=20
> --
> 2.20.1

