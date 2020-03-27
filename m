Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93231195BB0
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 17:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbgC0Q4O (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 12:56:14 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:53242 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727666AbgC0Q4O (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 12:56:14 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RGmH7V009335;
        Fri, 27 Mar 2020 17:56:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=n1ZfvUes/YBwjj6Zxhh/XAxFkXwQfyXLuTAeAtkgbl4=;
 b=FwhMfqrFxbNpFWgJHlKSHNwzAIj6jfcZlxi6v4ebhZGzqvjypEu4fzeJ+I+2QZK0ruBq
 T9Re/nDN/powO3f2JeXfEEvHMEwJPueCv3TGRxsL7kYSNGnPbgYfCvEe8L86gRHtP35e
 HC+Tb7u8+SC5sVaU8VtG/LEx9bwuQmROe5CItX95Th5V4ueo/YQWNKkGSE1zXSbRhsV0
 x99sKU2epkUy1KNPHtevV5LB+4/2sVrnUUf/mv0ocssSKwdDVpeKpWs/kxnVJ2LZ2a96
 +QJq0dVDSGeoLaAcsnt9W+j7ch7Dbtx/27VqyUmvWJ7KBm4CxpwoZ3oXuak2LAjiUV2n OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2ywappk9yj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 17:56:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF6C210002A;
        Fri, 27 Mar 2020 17:56:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88ED32AD2CF;
        Fri, 27 Mar 2020 17:56:00 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 27 Mar
 2020 17:56:00 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 17:56:00 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH 05/11] remoteproc: stm32: Parse syscon that will manage M4
 synchronisation
Thread-Topic: [PATCH 05/11] remoteproc: stm32: Parse syscon that will manage
 M4 synchronisation
Thread-Index: AQHWAigUu92as7JTg06PaUoWLK2qKKhcrMUg
Date:   Fri, 27 Mar 2020 16:56:00 +0000
Message-ID: <871b05657f734e55a877009a9b420ded@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-6-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-6-mathieu.poirier@linaro.org>
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
> Subject: [PATCH 05/11] remoteproc: stm32: Parse syscon that will manage
> M4 synchronisation
>=20
> Get from the DT the syncon to probe the state of the remote processor
> and the location of the resource table.
>=20
> Mainly based on the work published by Arnaud Pouliquen [1].
>=20
> [1]. https://patchwork.kernel.org/project/linux-
> remoteproc/list/?series=3D239877
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Thanks Mathieu

Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index a3e278490bb4..7d5d4a7dbb04 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -70,6 +70,8 @@ struct stm32_rproc {
>  	struct reset_control *rst;
>  	struct stm32_syscon hold_boot;
>  	struct stm32_syscon pdds;
> +	struct stm32_syscon m4_state;
> +	struct stm32_syscon rsctbl;
>  	int wdg_irq;
>  	u32 nb_rmems;
>  	struct stm32_rproc_mem *rmems;
> @@ -606,6 +608,30 @@ static int stm32_rproc_parse_dt(struct
> platform_device *pdev,
>=20
>  	*auto_boot =3D of_property_read_bool(np, "st,auto-boot");
>=20
> +	/*
> +	 * See if we can check the M4 status, i.e if it was started
> +	 * from the boot loader or not.
> +	 */
> +        err =3D stm32_rproc_get_syscon(np, "st,syscfg-m4-state",
> +                                     &ddata->m4_state);
> +        if (err) {
> +		/* remember this */
> +		ddata->m4_state.map =3D NULL;
> +                /* no coprocessor state syscon (optional) */
> +                dev_warn(dev, "m4 state not supported\n");
> +
> +		/* no need to go further */
> +		return 0;
> +        }
> +
> +	/* See if we can get the resource table */
> +        err =3D stm32_rproc_get_syscon(np, "st,syscfg-rsc-tbl",
> +                                     &ddata->rsctbl);
> +	if (err) {
> +		/* no rsc table syscon (optional) */
> +		dev_warn(dev, "rsc tbl syscon not supported\n");
> +	}
> +
>  	return 0;
>  }
>=20
> --
> 2.20.1

