Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8EC4195C13
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 18:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgC0RLu (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 13:11:50 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:18590 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726333AbgC0RLt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 13:11:49 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RHBNGT015591;
        Fri, 27 Mar 2020 18:11:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=bBiYMKNy1fD0otEQAudbAwYwbQnKisqPPFUfMKkswoE=;
 b=JkDhgP9l1n5XE+m1sGVBreu90NuAN1zWjjq+wpQB+5WZo6qecHdIdvbeDa3aboBb9onf
 UvYVKlBN0+NkYlC7rkVVeZIasKmK3gP5Ptf1p5bNxUR2VfKRP0dJgAdzWMyy9OX1ar6W
 2E+mERdQk7MDVRvp6Y2o4Gf9S6hfbvpLd1TD74yByMBcXqks37/AF2UWezjNGdz0/GvU
 3CSSEKkleoJOA1mxDjZsMz7tbWGCKcRUFtoPoyZe9946h6FbDGkfKcZXUbqIn4+8cl7m
 dU6ZNELEfInPrsZzPiwluaLFC1H+IRQtkmUnJGdfr7MOU5HLm3wxmJAXh+VbDwtRFztb Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw9k0kb17-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 18:11:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B8A3910002A;
        Fri, 27 Mar 2020 18:11:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ADCF12BAD30;
        Fri, 27 Mar 2020 18:11:37 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 27 Mar
 2020 18:11:36 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 18:11:37 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH 11/11] remoteproc: stm32: Allocate rproc for
 synchronisation with MCU
Thread-Topic: [PATCH 11/11] remoteproc: stm32: Allocate rproc for
 synchronisation with MCU
Thread-Index: AQHWAigY+aSDQEZARkejaEgGRlH9xKhcsG0A
Date:   Fri, 27 Mar 2020 17:11:37 +0000
Message-ID: <fd4e531aa40b40bcb401268e720cefe6@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-12-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-12-mathieu.poirier@linaro.org>
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
 definitions=2020-03-27_06:2020-03-27,2020-03-27 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

> -----Original Message-----
> From: linux-remoteproc-owner@vger.kernel.org <linux-remoteproc-
> owner@vger.kernel.org> On Behalf Of Mathieu Poirier
> Sent: mardi 24 mars 2020 23:03
> To: bjorn.andersson@linaro.org
> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> Subject: [PATCH 11/11] remoteproc: stm32: Allocate rproc for
> synchronisation with MCU
>=20
> Allocate remote processor structure with state machine if the MCU
> has already been started by an external entity.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/stm32_rproc.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index 07be306c0fb1..f320ef9ee286 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -608,7 +608,7 @@ static struct rproc_ops st_rproc_ops =3D {
>  	.get_boot_addr	=3D rproc_elf_get_boot_addr,
>  };
>=20
> -static __maybe_unused struct rproc_ops st_rproc_sync_ops =3D {
> +static struct rproc_ops st_rproc_sync_ops =3D {
>  	.start		=3D stm32_rproc_sync_start,
>  	.stop		=3D stm32_rproc_sync_stop,
>  	.kick		=3D stm32_rproc_kick,
> @@ -616,6 +616,12 @@ static __maybe_unused struct rproc_ops
> st_rproc_sync_ops =3D {
>  	.find_loaded_rsc_table =3D
> stm32_rproc_sync_elf_find_loaded_rsc_table,
>  };
>=20
> +static struct rproc_sync_states st_sync_states =3D {
> +	.on_init =3D true, /* sync with MCU when the kernel boots */
> +	.after_stop =3D false, /* don't resync with MCU if stopped from sysfs
> */
> +	.after_crash =3D false, /* don't resync with MCU after a crash */
> +};
> +
>  static const struct of_device_id stm32_rproc_match[] =3D {
>  	{ .compatible =3D "st,stm32mp1-m4" },
>  	{},
> @@ -847,15 +853,22 @@ static int stm32_rproc_probe(struct
> platform_device *pdev)
>  		ret =3D stm32_rproc_get_loaded_rsc_table(pdev, ddata);
>  		if (ret)
>  			goto free_ddata;
> +
> +		rproc =3D rproc_alloc_state_machine(dev, np->name,
> &st_rproc_ops,
> +						  &st_rproc_sync_ops,
> +						  &st_sync_states, NULL,
> +						  sizeof(*ddata));
Could we have only one call to rproc_alloc_state_machine(), simply configur=
ing
st_sync_states according to m4_state and other DT properties?

Regards,
Loic
> +	} else {
> +		rproc =3D rproc_alloc(dev, np->name, &st_rproc_ops,
> +				    NULL, sizeof(*ddata));
> +		rproc->auto_boot =3D auto_boot;
>  	}
>=20
> -	rproc =3D rproc_alloc(dev, np->name, &st_rproc_ops, NULL,
> sizeof(*ddata));
>  	if (!rproc) {
>  		ret =3D -ENOMEM;
>  		goto free_ddata;
>  	}
>=20
> -	rproc->auto_boot =3D auto_boot;
>  	rproc->has_iommu =3D false;
>  	ddata->workqueue =3D create_workqueue(dev_name(dev));
>  	if (!ddata->workqueue) {
> --
> 2.20.1

