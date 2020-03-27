Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67005195B99
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 17:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbgC0Qvz (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 12:51:55 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:52618 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727656AbgC0Qvy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 12:51:54 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RGmHuL009338;
        Fri, 27 Mar 2020 17:51:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=hbzm0HU3kNMfpaQbx3Z6prvhwNlxmhkS4G0Znvkx+pU=;
 b=zK6GO2rcKtyyOx+vtCzQdPmZAhv8WdX2Q/Nm8Y4tA+wmzl3pPqNzQljTUUev894YInHV
 LA5/3OoxXErLxAUKvdWvieYLUaa1z7/gQxBcVyo82lAZPYDH5XZ4ETCRshl8hsfGhA5A
 8sXZJNgzamJK1V1Uo2TzStLBQBWc2BymGpNHRHCJzufDgCIpZFGla4XZHQIsADmYOfmv
 t6IrPtFcYTu5DGefirKLIouyic0EzWDEIMf/PQ/5ZW4bsPHDIZh7GIAfA7V6XY5HyGy3
 bUywGoWG+A0S8mibckg/KklktIGyYDcV/FuqGmiutZT9xVrp370PuRjSfcYZjAH/YOMq DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2ywappk95x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 17:51:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9091E10002A;
        Fri, 27 Mar 2020 17:51:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7CDA52B5D1D;
        Fri, 27 Mar 2020 17:51:47 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Mar
 2020 17:51:47 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 17:51:47 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH 01/11] remoteproc: stm32: Decouple rproc from memory
 translation
Thread-Topic: [PATCH 01/11] remoteproc: stm32: Decouple rproc from memory
 translation
Thread-Index: AQHWAigSIO18cHP/uE+m2SV3DwAHl6hcj+xg
Date:   Fri, 27 Mar 2020 16:51:46 +0000
Message-ID: <e4a31d5675104d01b002df61c362a626@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-2-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-2-mathieu.poirier@linaro.org>
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
> From: linux-remoteproc-owner@vger.kernel.org <linux-remoteproc-
> owner@vger.kernel.org> On Behalf Of Mathieu Poirier
> Sent: mardi 24 mars 2020 23:03
> To: bjorn.andersson@linaro.org
> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> Subject: [PATCH 01/11] remoteproc: stm32: Decouple rproc from memory
> translation
>=20
> Remove the remote processor from the process of parsing the memory
> ranges since there is no correlation between them.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Thanks Mathieu

Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index a18f88044111..cde4b1a56381 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -127,10 +127,10 @@ static int stm32_rproc_mem_release(struct rproc
> *rproc,
>  	return 0;
>  }
>=20
> -static int stm32_rproc_of_memory_translations(struct rproc *rproc)
> +static int stm32_rproc_of_memory_translations(struct platform_device
> *pdev,
> +					      struct stm32_rproc *ddata)
>  {
> -	struct device *parent, *dev =3D rproc->dev.parent;
> -	struct stm32_rproc *ddata =3D rproc->priv;
> +	struct device *parent, *dev =3D &pdev->dev;
>  	struct device_node *np;
>  	struct stm32_rproc_mem *p_mems;
>  	struct stm32_rproc_mem_ranges *mem_range;
> @@ -606,7 +606,7 @@ static int stm32_rproc_parse_dt(struct
> platform_device *pdev)
>=20
>  	rproc->auto_boot =3D of_property_read_bool(np, "st,auto-boot");
>=20
> -	return stm32_rproc_of_memory_translations(rproc);
> +	return stm32_rproc_of_memory_translations(pdev, ddata);
>  }
>=20
>  static int stm32_rproc_probe(struct platform_device *pdev)
> --
> 2.20.1

