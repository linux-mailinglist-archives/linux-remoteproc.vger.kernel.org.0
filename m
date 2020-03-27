Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E92E7195BB4
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 17:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgC0Q6M (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 12:58:12 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:18674 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726748AbgC0Q6M (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 12:58:12 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RGmC9K017862;
        Fri, 27 Mar 2020 17:58:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=sz9BNRCqbKwkMahtpMA3n1SBwTnC6IYUhpoTCMex9kQ=;
 b=NFjZgGlr4JhcF/V7QmzMj6NEpGy7hKDdQm+7AdsHxCqmJRGZyg6x+pKcf6OBVZFziapO
 lttybnK+JJD34SslRTiLHmm+9QsYjFOLnH/YsQ/0h38cEB4hXdggLOVbkhlBkqyQWyUU
 nXaTX8a9FqWVJZme2NTLHp/FYr7e8QzckNateIaPyz2lI2b5Te6HqK83yD72F2U/CU9X
 sFBO8SSANfMd52ukJqHSIN5YaADKGuNZzvwqjF4lcF2ELomo7wwPozM8iA8P7Ty4uUxH
 tzESViMIX5si6tbTtu4oudqwOmHT96QHMYJBFXoyIwqr+kvBg/hY9hWhLlIxh22aj3E3 Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw9963am9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 17:58:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F09C10003A;
        Fri, 27 Mar 2020 17:58:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 722D42BAD06;
        Fri, 27 Mar 2020 17:58:01 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Mar
 2020 17:58:01 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 17:58:00 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH 06/11] remoteproc: stm32: Get coprocessor state
Thread-Topic: [PATCH 06/11] remoteproc: stm32: Get coprocessor state
Thread-Index: AQHWAigVR2IzbveEaE6ba0A9LyaJU6hcrRAA
Date:   Fri, 27 Mar 2020 16:58:00 +0000
Message-ID: <a1a4d8eb7da0468ea3e7125e0cb2e992@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-7-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-7-mathieu.poirier@linaro.org>
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
> Subject: [PATCH 06/11] remoteproc: stm32: Get coprocessor state
>=20
> Introduce the required mechanic to get the state of the M4 when the
> remoteproc core is initialising.
>=20
> Mainly based on the work published by Arnaud Pouliquen [1].
>=20
> [1]. https://patchwork.kernel.org/project/linux-
> remoteproc/list/?series=3D239877
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/stm32_rproc.c | 29
> +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index 7d5d4a7dbb04..b8af15dd0510 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -38,6 +38,15 @@
>  #define STM32_MBX_VQ1_ID	1
>  #define STM32_MBX_SHUTDOWN	"shutdown"
>=20
> +#define RSC_TBL_SIZE		(1024)
> +
> +#define M4_STATE_OFF		0
> +#define M4_STATE_INI		1
Typo M4_STATE_INI -> M4_STATE_INIT

Else ok for me
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>

Regards,
Loic

> +#define M4_STATE_CRUN		2
> +#define M4_STATE_CSTOP		3
> +#define M4_STATE_STANDBY	4
> +#define M4_STATE_CRASH		5
> +
>  struct stm32_syscon {
>  	struct regmap *map;
>  	u32 reg;
> @@ -635,12 +644,23 @@ static int stm32_rproc_parse_dt(struct
> platform_device *pdev,
>  	return 0;
>  }
>=20
> +static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
> +				     unsigned int *state)
> +{
> +	/* See stm32_rproc_parse_dt() */
> +	if (!ddata->m4_state.map)
> +		return -EINVAL;
> +
> +	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg,
> state);
> +}
> +
>  static int stm32_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct stm32_rproc *ddata;
>  	struct device_node *np =3D dev->of_node;
>  	struct rproc *rproc;
> +	unsigned int state;
>  	bool auto_boot =3D false;
>  	int ret;
>=20
> @@ -660,6 +680,15 @@ static int stm32_rproc_probe(struct platform_device
> *pdev)
>  	if (ret)
>  		goto free_ddata;
>=20
> +	ret =3D stm32_rproc_get_m4_status(ddata, &state);
> +	if (ret) {
> +		/*
> +		 * We couldn't get the coprocessor's state, assume
> +		 * it is not running.
> +		 */
> +		state =3D M4_STATE_OFF;
> +	}
> +
>  	rproc =3D rproc_alloc(dev, np->name, &st_rproc_ops, NULL,
> sizeof(*ddata));
>  	if (!rproc) {
>  		ret =3D -ENOMEM;
> --
> 2.20.1

