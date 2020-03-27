Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B892B195BAE
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 17:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbgC0Qz3 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 12:55:29 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:11604 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727720AbgC0Qz2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 12:55:28 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RGlHJW025618;
        Fri, 27 Mar 2020 17:55:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=A1Lhp2yIQImffu5l5kRQKRhszW8fTc7LT8VJqmkcggk=;
 b=VfuaayAi8fWIsGO/6u9lh29yNYpcYCgr9XwJBA4LQNDBZBSLmCgsrJO9ecvv5I4AeUBn
 l2dhSPC+2M1JuX1uoqyn3WleBR/SlFrLHt56fCzX+m6deaM2wur5De7afhDhpr4KEQPD
 SPSPKEu0KT3rpdTY50eB8o2uJ/nuY29AlxQPk3tx4yAwo0oWhqZYIfTnaSKrEXSdH8rf
 7NBzNeM7Ok5rt5YYZ9it8+3CHRnkXHQ1O95W7mVl4OPyeGyBuahLBzC6AN4T/e6jyqIW
 gr+oS2uxu+f4034kMVzR2rGJlfZadY9KgFDwQbZJU7pxj5OgFzSz8fyCIliaoyj4b7mW Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw9k0k8b3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 17:55:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF8F9100034;
        Fri, 27 Mar 2020 17:55:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3FAA2BAD05;
        Fri, 27 Mar 2020 17:55:22 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 27 Mar
 2020 17:55:22 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 17:55:22 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH 04/11] remoteproc: stm32: Remove memory translation from
 DT parsing
Thread-Topic: [PATCH 04/11] remoteproc: stm32: Remove memory translation from
 DT parsing
Thread-Index: AQHWAigUpbu5xWNpkEmehgMMqnafNKhcrKIQ
Date:   Fri, 27 Mar 2020 16:55:22 +0000
Message-ID: <b6e237a293464b85b6591c23cde20cb7@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-5-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-5-mathieu.poirier@linaro.org>
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
> Subject: [PATCH 04/11] remoteproc: stm32: Remove memory translation
> from DT parsing
>=20
> Other than one has to be done after the other, there is no correlation
> between memory translation and DT parsing.  As move function
> stm32_rproc_of_memory_translations() to stm32_rproc_probe() so that
> stm32_rproc_parse_dt() can be extended to look for synchronisation
> related binding in a clean way.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Thanks Mathieu
=20
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>

> ---
>  drivers/remoteproc/stm32_rproc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index ca60c917e218..a3e278490bb4 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -606,7 +606,7 @@ static int stm32_rproc_parse_dt(struct
> platform_device *pdev,
>=20
>  	*auto_boot =3D of_property_read_bool(np, "st,auto-boot");
>=20
> -	return stm32_rproc_of_memory_translations(pdev, ddata);
> +	return 0;
>  }
>=20
>  static int stm32_rproc_probe(struct platform_device *pdev)
> @@ -630,6 +630,10 @@ static int stm32_rproc_probe(struct platform_device
> *pdev)
>  	if (ret)
>  		goto free_ddata;
>=20
> +	ret =3D stm32_rproc_of_memory_translations(pdev, ddata);
> +	if (ret)
> +		goto free_ddata;
> +
>  	rproc =3D rproc_alloc(dev, np->name, &st_rproc_ops, NULL,
> sizeof(*ddata));
>  	if (!rproc) {
>  		ret =3D -ENOMEM;
> --
> 2.20.1

