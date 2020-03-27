Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 307DF195BA6
	for <lists+linux-remoteproc@lfdr.de>; Fri, 27 Mar 2020 17:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgC0Qy4 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 27 Mar 2020 12:54:56 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:20124 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727185AbgC0Qy4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Mar 2020 12:54:56 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02RGmC1v017867;
        Fri, 27 Mar 2020 17:54:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=BIprvyOrAw2nC5eD1RYb4lhagb6pXnMibVG/803h370=;
 b=W6Anhv06/vOLQv52ynDZTdzsq7EkVkvw7Ov5m2DMzE+PE46jLgA/QrC3FszY4ePFWKgp
 dDzFWzH7uvsxdm/bC/qFlJw4M/UCWNXknqdZSZX0vdWaURBtfrHfWecVeAVTv1vodPXi
 6evklbGyDmJkESxld0mQX42r3qA/j2oPAp58aFpea4QcnIdy5Li0xB/MDkEu9tyRljdj
 Yw+c3zR+hFNBOhYNlhWySqaG4BVN28w3UtC08Drwg7+cK905t7r2jSnW1Mxi5C/BMw+5
 EWmN384FVQVqv2bKRN01yt7aeROaaGqPqsM/KB/dVWl2+oRiJQJfVO3UCiwwRUaUJqyc fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw9963a2q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 17:54:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 712A210002A;
        Fri, 27 Mar 2020 17:54:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 627D02BAD02;
        Fri, 27 Mar 2020 17:54:46 +0100 (CET)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 27 Mar
 2020 17:54:46 +0100
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 17:54:45 +0100
From:   Loic PALLARDY <loic.pallardy@st.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH 02/11] remoteproc: stm32: Request IRQ with platform device
Thread-Topic: [PATCH 02/11] remoteproc: stm32: Request IRQ with platform
 device
Thread-Index: AQHWAigSD81YldTTb0ac/LvR2G9mMahcrFug
Date:   Fri, 27 Mar 2020 16:54:45 +0000
Message-ID: <57220cc7d0a6447c84435ff7e39cf303@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-3-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-3-mathieu.poirier@linaro.org>
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
> Subject: [PATCH 02/11] remoteproc: stm32: Request IRQ with platform
> device
>=20
> Request IRQ with platform device rather than remote proc in order to
> call stm32_rproc_parse_dt() before rproc_alloc().  That way we can
> know whether we need to synchronise with the MCU or not.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Thanks Mathieu
=20
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>=20

> ---
>  drivers/remoteproc/stm32_rproc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index cde4b1a56381..0c1f0b84e057 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -261,7 +261,8 @@ static int stm32_rproc_parse_fw(struct rproc *rproc,
> const struct firmware *fw)
>=20
>  static irqreturn_t stm32_rproc_wdg(int irq, void *data)
>  {
> -	struct rproc *rproc =3D data;
> +	struct platform_device *pdev =3D data;
> +	struct rproc *rproc =3D platform_get_drvdata(pdev);
>=20
>  	rproc_report_crash(rproc, RPROC_WATCHDOG);
>=20
> @@ -553,7 +554,7 @@ static int stm32_rproc_parse_dt(struct
> platform_device *pdev)
>=20
>  	if (irq > 0) {
>  		err =3D devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
> -				       dev_name(dev), rproc);
> +				       dev_name(dev), pdev);
>  		if (err) {
>  			dev_err(dev, "failed to request wdg irq\n");
>  			return err;
> --
> 2.20.1

