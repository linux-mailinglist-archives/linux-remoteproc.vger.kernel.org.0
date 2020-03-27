Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63B1F195BE3
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 18:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbgC0RFe (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 13:05:34 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:17784 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727254AbgC0RFe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 13:05:34 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RGlQon026012;
        Fri, 27 Mar 2020 18:05:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=SVZPwiNG+pml6ZCQITCx/IDLt7kkSdr50+nzM+UtBJc=;
 b=NMrNoFQlK6N+YUJ88p2MLZSih/uBm3vJFqjNmm4mZ93tbhhiH7SUGzG+gfNTySqt5MEF
 IIXWWYKxHva6j/pVKkSsRN143XVi/sCmpBU9jkWWhKz3wdSJS9a0oUoCUmoexLii+bXe
 Sj9K0wiIkwdMbOXehROsD3U0VfpjDJo/yyQbIgbsxyEtSg6KmfGj6FH4VraNTuVfgnNn
 RVh6eaKudH2oEKN/YLomflck+GEnlfaMKqdBk7sE6m0JYmwGfwjHbMjjGmNuJkPL7bbU
 4EB17b6HQg+k5eqXfAoirYxXSerbQpLOwFpCUOG/CBMNPMcolmeEDh2+0zWdEG+RqIN0 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw9k0ka08-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 18:05:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF574100034;
        Fri, 27 Mar 2020 18:05:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D4A682BAD1B;
        Fri, 27 Mar 2020 18:05:25 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Mar
 2020 18:05:25 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 18:05:25 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH 10/11] remoteproc: stm32: Introduce new loaded rsc ops for
 synchronisation
Thread-Topic: [PATCH 10/11] remoteproc: stm32: Introduce new loaded rsc ops
 for synchronisation
Thread-Index: AQHWAigXG9wmdl2FSEKjNE7u4Izse6hcr3KQ
Date:   Fri, 27 Mar 2020 17:05:25 +0000
Message-ID: <a3ae36c297a04a7788a087e3cf9f1057@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-11-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-11-mathieu.poirier@linaro.org>
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
> Subject: [PATCH 10/11] remoteproc: stm32: Introduce new loaded rsc ops fo=
r
> synchronisation
>=20
> Introduce new elf find loaded resource table rproc_ops functions to be
> used when synchonising with an MCU.
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
>  drivers/remoteproc/stm32_rproc.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index 4268d71f191d..07be306c0fb1 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -317,6 +317,15 @@ static int stm32_rproc_sync_parse_fw(struct rproc
> *rproc,
>  	return stm32_rproc_sync_elf_load_rsc_table(rproc, fw);
>  }
>=20
> +static struct resource_table *
> +stm32_rproc_sync_elf_find_loaded_rsc_table(struct rproc *rproc,
> +					   const struct firmware *fw)
> +{
> +	struct stm32_rproc *ddata =3D rproc->priv;
> +
> +	return (struct resource_table *)ddata->rsc_va;
> +}
> +
>  static irqreturn_t stm32_rproc_wdg(int irq, void *data)
>  {
>  	struct platform_device *pdev =3D data;
> @@ -604,6 +613,7 @@ static __maybe_unused struct rproc_ops
> st_rproc_sync_ops =3D {
>  	.stop		=3D stm32_rproc_sync_stop,
>  	.kick		=3D stm32_rproc_kick,
>  	.parse_fw	=3D stm32_rproc_sync_parse_fw,
> +	.find_loaded_rsc_table =3D
> stm32_rproc_sync_elf_find_loaded_rsc_table,
>  };
>=20
>  static const struct of_device_id stm32_rproc_match[] =3D {
> --
> 2.20.1

