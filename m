Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 496D0195BD7
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 18:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbgC0REp (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 13:04:45 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:17638 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726333AbgC0REp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 13:04:45 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RGlQog026012;
        Fri, 27 Mar 2020 18:04:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Dobuu4s8oUuwiiFJJVUILps+njIogZI8TJrX067DWKs=;
 b=X2c4cs4GX82uJF8gBtC5Q9Ha9VvMBr61DG2VX68kDyEKH2ltliWuwbxlqy8nnqmc5fzl
 twHgmFlsk4Lt0KmyuYCV2EA8AP8YgkeWydivjkmf1uvJSzuRLyDlboLBAcYaqekxqOfe
 aHKmDdf2YVaxszspAECUN8YzExHY3Yh/fD140cfuPaMSK0PvBpW8ZfTGIiFYxTwz9d9Z
 v8ixxr385qOmO3oTpEBUuxwTK+8FZfEe8SD2kU/d03bzIch4AgzP72FCZq433zoCbmxT
 NEqWWPM637mVkxje7fMeHPary7UCgnkQZeiVEJ+VWl8/wRgF+7oL21CDXEg8xeQcNgY9 AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw9k0k9ur-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 18:04:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1A4110002A;
        Fri, 27 Mar 2020 18:04:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2D042BAD19;
        Fri, 27 Mar 2020 18:04:34 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 27 Mar
 2020 18:04:34 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 18:04:34 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH 08/11] remoteproc: stm32: Introduce new start and stop ops
 for synchronisation
Thread-Topic: [PATCH 08/11] remoteproc: stm32: Introduce new start and stop
 ops for synchronisation
Thread-Index: AQHWAigWSNKzwtkYeESAgYGCtOfUmahcrepg
Date:   Fri, 27 Mar 2020 17:04:34 +0000
Message-ID: <cf76679a1a7248df9620aeb2ca659062@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-9-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-9-mathieu.poirier@linaro.org>
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
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: mardi 24 mars 2020 23:03
> To: bjorn.andersson@linaro.org
> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> Subject: [PATCH 08/11] remoteproc: stm32: Introduce new start and stop op=
s
> for synchronisation
>=20
> Introduce new start and stop rproc_ops functions to be used when
> synchonising with an MCU.
>=20
> Mainly based on the work published by Arnaud Pouliquen [1].
>=20
> [1]. https://patchwork.kernel.org/project/linux-
> remoteproc/list/?series=3D239877
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/stm32_rproc.c | 37
> ++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index 5bac0baf8f4c..734605a9223e 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -449,6 +449,13 @@ static int stm32_rproc_start(struct rproc *rproc)
>  	return stm32_rproc_set_hold_boot(rproc, true);
>  }
>=20
> +static int stm32_rproc_sync_start(struct rproc *rproc)
> +{
> +	stm32_rproc_add_coredump_trace(rproc);
> +
> +	return stm32_rproc_set_hold_boot(rproc, true);
> +}
> +
>  static int stm32_rproc_stop(struct rproc *rproc)
>  {
>  	struct stm32_rproc *ddata =3D rproc->priv;
> @@ -489,6 +496,30 @@ static int stm32_rproc_stop(struct rproc *rproc)
>  	return 0;
>  }
>=20
> +static int stm32_rproc_sync_stop(struct rproc *rproc)
> +{
> +	struct stm32_rproc *ddata =3D rproc->priv;
> +	int err;
> +
> +	err =3D stm32_rproc_stop(rproc);
> +	if (err)
> +		return err;
> +
> +	/* update copro state to OFF */
> +	if (ddata->m4_state.map) {
> +		err =3D regmap_update_bits(ddata->m4_state.map,
> +					 ddata->m4_state.reg,
> +					 ddata->m4_state.mask,
> +					 M4_STATE_OFF);
> +		if (err) {
> +			dev_err(&rproc->dev, "failed to set copro state\n");
> +			return err;
> +		}
> +	}
In fact m4_state is updated in following way:
- it is set by Linux when M4 is guarantee, that means only when Linux is st=
opping the M4.
in that case M4 is under reset and m4_state could be updated to M4_STATE_OF=
F
- for all other states, it is M4 responsibility to update m4_state when run=
ning
That means the code above is common to both stm32_rproc_stop() and stm32_rp=
roc_sync_stop().
Only one function is required.

Regards,
Loic
> +
> +	return 0;
> +}
> +
>  static void stm32_rproc_kick(struct rproc *rproc, int vqid)
>  {
>  	struct stm32_rproc *ddata =3D rproc->priv;
> @@ -522,6 +553,12 @@ static struct rproc_ops st_rproc_ops =3D {
>  	.get_boot_addr	=3D rproc_elf_get_boot_addr,
>  };
>=20
> +static __maybe_unused struct rproc_ops st_rproc_sync_ops =3D {
> +	.start		=3D stm32_rproc_sync_start,
> +	.stop		=3D stm32_rproc_sync_stop,
> +	.kick		=3D stm32_rproc_kick,
> +};
> +
>  static const struct of_device_id stm32_rproc_match[] =3D {
>  	{ .compatible =3D "st,stm32mp1-m4" },
>  	{},
> --
> 2.20.1

